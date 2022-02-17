```
protoc --plugin=protoc-gen-ruby-protobuf=`which protoc-gen-ruby` --ruby-protobuf_out=. generation.proto
```

```
protoc --ruby_out=. generation.proto
```