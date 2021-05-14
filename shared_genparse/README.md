run bundle exec rake test TEST=test/gapic/presenters/service/foo_test and see if messages have any options. if they dont that means that options are not being recognised since extensions dont work. or something.

use regen_descriptors.sh to regen