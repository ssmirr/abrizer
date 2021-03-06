module Abrizer
  module FilepathHelpers

    def all_media_paths
      [mpd_filepath, hlsts_filepath, vp9_filepath, mp4_filepath, captions_filepath, sprites_filepath]
    end

    def audio_filepath
      File.join output_directory, "adaptation-audio.m4a"
    end

    def audio_filepath_fragmented
      File.join output_directory, "adaptation-audio-frag.m4a"
    end

    # TODO: webvtt_input_filepath should look multiple places in case vtt
    # file(s) already copied over.
    def webvtt_input_filepath
      File.join filename_directory, "#{basename}.vtt" if @filename
    end

    def output_directory
      # if @output_directory
        @output_directory
      # else
      #   File.join filename_directory, basename
      # end
    end

    def output_directory_basename
      File.basename output_directory
    end

    def filename_directory
      File.dirname @filename
    end

    # TODO: don't assume all incoming files will be .mp4
    def basename
      extname = File.extname @filename
      File.basename @filename, extname
    end

    def ffprobe_filepath
      File.join output_directory, 'ffprobe.json'
    end

    def adaptations_filepath
      File.join output_directory, 'adaptations.json'
    end

    def poster_partial_filepath
      'poster.jpg'
    end

    def poster_filepath
      File.join output_directory, poster_partial_filepath
    end

    def mpd_partial_filepath
      'fmp4/stream.mpd'
    end

    def mpd_filepath
      File.join output_directory, mpd_partial_filepath
    end

    def hlsts_partial_filepath
      'hls/master.m3u8'
    end

    def hlsts_filepath
      File.join output_directory, hlsts_partial_filepath
    end

    def hlsts_aac_partial_filepath
      'hls/audio/aac/eng/media.aac'
    end

    def hlsts_aac_filepath
      File.join output_directory, hlsts_aac_partial_filepath
    end

    def mp4_partial_filepath
      'progressive.mp4'
    end

    def mp4_filepath
      File.join output_directory, mp4_partial_filepath
    end

    def vp9_partial_filepath
      'progressive-vp9.webm'
    end

    def vp9_filepath
      File.join output_directory, vp9_partial_filepath
    end

    def mp3_partial_filepath
      'progressive.mp3'
    end

    def mp3_filepath
      File.join output_directory, mp3_partial_filepath
    end

    def captions_filepath
      File.join output_directory, 'vtt/captions.vtt'
    end

    def canvas_partial_filepath
      'canvas.json'
    end

    def canvas_filepath
      File.join output_directory, canvas_partial_filepath
    end

    def data_partial_filepath
      'data.json'
    end

    def data_filepath
      File.join output_directory, data_partial_filepath
    end

    def sprites_partial_filepath
      'sprites/sprites.vtt'
    end

    def sprites_filepath
      File.join output_directory, sprites_partial_filepath
    end

    def waveform_directory
      File.join output_directory, 'waveforms'
    end

    def waveform_partial_filepath
      'waveforms/waveform.json'
    end

    def waveform_filepath
      File.join output_directory, waveform_partial_filepath
    end

    def first_image_filepath
      File.join output_directory, 'sprites/images/img-00001.jpg'
    end

    def poster_image_filepath
      File.join output_directory, 'poster.jpg'
    end

  end
end
