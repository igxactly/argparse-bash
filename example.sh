#!/bin/bash

source $(dirname $0)/argparse.bash || exit 1
argparse "$@" <<EOF || exit 1
parser.add_argument('infile')
parser.add_argument('outfile', nargs='?', default='out.txt', help='output file')
parser.add_argument('-a', '--the-answer', default=42, type=int,
                    help='Pick a number [default %(default)s]')
parser.add_argument('-q', '--the-question', default=24, type=int,
                    help='Pick a number')
parser.add_argument('-m', '--multiple', nargs='+',
                    help='multiple values allowed')
EOF

echo required infile: "$INFILE"
echo required outfile: "$OUTFILE"
echo the answer: "$THE_ANSWER"
echo multiple:
for a in "${MULTIPLE[@]}"; do
    echo "  $a"
done
