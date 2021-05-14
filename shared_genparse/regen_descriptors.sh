#!/bin/sh

PBUF_SRC=`readlink -f ~/src/temp/protobuf/src`
GAPI_SRC=`readlink -f ~/src/gapic-generator-ruby/shared/googleapis`
GEN_OUT=`readlink -f ~/src/gapic-generator-ruby/shared_genparse/lib`

(cd ~/src/gapic-generator-ruby/gapic-generator/lib && \
     for f in `find google/protobuf -type f`; do \
         P_PATH=$PBUF_SRC/`dirname $f`/`basename $f ".rb" | awk '{ print substr( $0, 1, length($0)-3 ) }'`.proto; \
         echo $P_PATH; \
         protoc -I $PBUF_SRC --ruby_out=$GEN_OUT $P_PATH; \
     done; \

    for f in `find google/api -type f`; do \
         P_PATH=$GAPI_SRC/`dirname $f`/`basename $f ".rb"`.proto; \
         echo $P_PATH; \
         protoc -I $GAPI_SRC --ruby_out=$GEN_OUT $P_PATH; \
    done; \

    for f in `find google/longrunning -type f`; do \
         P_PATH=$GAPI_SRC/`dirname $f`/`basename $f ".rb"`.proto; \
         echo $P_PATH; \
         protoc -I $GAPI_SRC --ruby_out=$GEN_OUT $P_PATH; \
    done; \

    for f in `find google/rpc -type f`; do \
         P_PATH=$GAPI_SRC/`dirname $f`/`basename $f ".rb"`.proto; \
         echo $P_PATH; \
         protoc -I $GAPI_SRC --ruby_out=$GEN_OUT $P_PATH; \
    done; \
)

