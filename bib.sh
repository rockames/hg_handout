#!/bin/bash

    # Usage information
    bible_usage() {
        echo "Usage: bible: [-b -t -v -f -h -w -l <arg>] passage"
        echo "Use bible -h for help"
    }

    # Help information
    bible_help() {
        echo "Usage: bible [OPTIONS] passage"
        echo "Lookup passage in bible"
        echo ""
        echo "Optional arguments:"
        echo -e "  -b\t\tShow line breaks"
        echo -e "  -t\t\tShow section titles (headings)"
        echo -e "  -v\t\tShow verse numbers"
        echo -e "  -f\t\tShow footnotes"
        echo -e "  -w\t\tGet web version (not plain-text)"
        echo -e "  -l ARG\tSet output characters per line"
        echo -e "  -h\t\tDisplay this message"
    }

    # Base URL
    baseurl="http://www.esvapi.org/v2/rest/passageQuery?key=IP"
    url=$baseurl"&include-short-copyright=false"

    # Default format
    format="&output-format=plain-text"

    # Default linebreaks
    breaks="&include-passage-horizontal-lines=false"
    breaks=$breaks"&include-heading-horizontal-lines=false"

    # Default titles (headings)
    title="&include-headings=false"
    title=$title"&include-subheadings=false"

    # Default verse numbering
    verse="&include-verse-numbers=false"
    verse=$verse"&include-first-verse-numbers=false"

    # Default footnotes
    foot="&include-footnotes=false"

    local OPTIND
    while getopts btvfhwl: opt; do
        case $opt in
        b) # line breaks (----)
            breaks="&include-passage-horizontal-lines=true"
            breaks=$breaks"&include-heading-horizontal-lines=true"
            ;;
        t) # section titles (headings)
            title="&include-headings=true"
            title=$title"&include-subheadings=true"
            ;;
        v) # verse numbers
            verse="&include-verse-numbers=true"
            verse=$verse"&include-first-verse-numbers=true"
            ;;
        f) #
            foot="&include-footnotes=true"
            ;;
        h)
            bible_help
            kill -INT $$
            ;;
        w)
            format=""
            ;;
        l)
            url=$url"&line-length=$OPTARG"
            ;;
        \?)
            bible_usage
            kill -INT $$
            ;;
        esac
    done

    # Extract actual passage
    shift $((OPTIND - 1))
    v=$*
    v2=${v//' '/'+'}

    # Add in options
    url=$url$format$breaks$title$verse$foot
    url=$url"&passage=$v2"

    # Make call
    curl $url
    echo ""


