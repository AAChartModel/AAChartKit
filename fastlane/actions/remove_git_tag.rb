module Fastlane
  module Actions
    class RemoveGitTagAction < Action
      def self.run(params)
        command = []

        target_tag = params[:tag]
        remove_local = params[:remove_local]
        remove_remote = params[:remove_remote]

        command << "git tag -d #{target_tag}" if remove_local
        command << "git push origin :#{target_tag}" if remove_remote

        if command.empty?
          UI.message('👉 删除旧的Git tag 必须设置新的tag以及要删除的旧tag')
        else
          result = command.join(' & ')
          Actions.sh(result)
          UI.message('删除tag成功 🎉')
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "删除已经存在的Git tag"
      end

      def self.details
        "删除一个远端仓库或本地仓库中存在的Git tag"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :tag,
                                       description: '要删除的tag',
                                       is_string: true,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :remove_local,
                                       description: '删除本地仓库tag',
                                       is_string: false,
                                       optional: true,
                                       default_value: true),
          FastlaneCore::ConfigItem.new(key: :remove_remote,
                                       description: '删除远端仓库tag',
                                       is_string: false,
                                       optional: true,
                                       default_value: true)
        ]
      end

      def self.output
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
        nil
      end

      def self.authors
        ["vin"]
      end

      def self.is_supported?(platform)
        # you can do things like
        #
        #  true
        #
        #  platform == :ios
        #
        #  [:ios, :mac].include?(platform)
        #

        [:ios, :mac].include?(platform)
      end

      def self.example_code
        [
          'remove_git_tag(tag: "0.1.0") # 删除本地仓库tag和远端仓库tag',
          'remove_git_tag(tag: "0.1.0", remove_local: false) # 只远端仓库tag',
          'remove_git_tag(tag: "0.1.0", remove_remote: false) # 只删除本地仓库tag'
        ]
      end

      def self.category
        :source_control
      end

    end
  end
end
