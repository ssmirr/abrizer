module Abrizer
  class ProgressiveMp4

    include FilepathHelpers

    def initialize(output_dir)
      @output_directory = output_dir
      find_adaptation
    end

    def create
      if File.exist? input_video_filepath
        `#{ffmpeg_cmd}`
      else
        raise Mp4AdaptationNotFoundError
      end
    end

    def find_adaptation
      adaptations = Abrizer::AdaptationFinder.new(output_directory: @output_directory).adaptations
      sorted = adaptations.sort_by do |adaptation|
       adaptation.width
      end
      @adaptation = sorted[-2]
    end

    def input_video_filepath
      @adaptation.filepath_fragmented(@output_directory)
    end

    def ffmpeg_cmd
      "ffmpeg -y -i #{input_video_filepath} -i #{audio_filepath_fragmented} -c:v copy -c:a copy #{mp4_filepath} -movflags faststart"
      # Previously used command:
      # "ffmpeg -y -i #{@filename} -profile:v high -pix_fmt yuv420p -movflags faststart -b:v #{@adaptation.bitrate}k #{mp4_filepath}"
    end

  end
end
