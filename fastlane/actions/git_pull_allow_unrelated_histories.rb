module Fastlane
  module Actions
    class GitPullAllowUnrelatedHistoriesAction < Action
      def self.run(params)
        commands = []

        unless params[:only_tags]
          command = "git pull origin master --allow-unrelated-histories"
          command << " --rebase" if params[:rebase]
          # commands += ["#{command} &&"]
        end

        # commands += ["git fetch --tags"]

        Actions.sh(commands.join(' '))
      end

      def self.description
        "拉取最新代码，允许合并不相关的历史内容"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :only_tags,
                                       description: "只需拉取tag，而不是从远程将新提交带到当前分支",
                                       type: Boolean,
                                       optional: true,
                                       default_value: false),
          FastlaneCore::ConfigItem.new(key: :rebase,
                                       description: "在远程分支之上使用rebase而不是merge",
                                       type: Boolean,
                                       optional: true,
                                       default_value: false)
        ]
      end

      def self.authors
        ["vin"]
      end

      def self.is_supported?(platform)
        true
      end

      def self.category
        :source_control
      end
    end
  end
end