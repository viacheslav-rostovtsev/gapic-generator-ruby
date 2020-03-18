# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Ads
    module GoogleAds
      module V3
        module Enums
          # Container for enum describing the mime types.
          class MimeTypeEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # The mime type
            module MimeType
              # The mime type has not been specified.
              UNSPECIFIED = 0

              # The received value is not known in this version.
              #
              # This is a response-only value.
              UNKNOWN = 1

              # MIME type of image/jpeg.
              IMAGE_JPEG = 2

              # MIME type of image/gif.
              IMAGE_GIF = 3

              # MIME type of image/png.
              IMAGE_PNG = 4

              # MIME type of application/x-shockwave-flash.
              FLASH = 5

              # MIME type of text/html.
              TEXT_HTML = 6

              # MIME type of application/pdf.
              PDF = 7

              # MIME type of application/msword.
              MSWORD = 8

              # MIME type of application/vnd.ms-excel.
              MSEXCEL = 9

              # MIME type of application/rtf.
              RTF = 10

              # MIME type of audio/wav.
              AUDIO_WAV = 11

              # MIME type of audio/mp3.
              AUDIO_MP3 = 12

              # MIME type of application/x-html5-ad-zip.
              HTML5_AD_ZIP = 13
            end
          end
        end
      end
    end
  end
end
