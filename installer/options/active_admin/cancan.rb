if @installed.include?('activeadmin')
  install_gem 'cancan'
  generate 'cancan:ability'

  @active_admin.append_config <<-CODE
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.cancan_ability_class = Ability
  CODE

  inside @target_path do
    target = Dir['db/migrate/*.rb'].select { |file| file =~ /devise_create_admin_users\.rb$/ }.first
    insert_into_file target, after: "AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'" do
      ', :role => :administrator'
    end
    insert_into_file target, after: 't.string :email,              :null => false, :default => ""' do
      't.string :role, :null => false, :default => :anonymouse'.optimize(2, true)
    end
  end


  insert_into_file 'app/models/admin_user.rb', after: ':recoverable, :rememberable, :trackable, :validatable' do
    <<-CODE.optimize(0, true)
    validate :role, :role_is_exists?

    def role_is_exists?
      unless self.role.blank? || Ability.role_names.include?(self.role.to_sym)
        errors.add(:role, '権限が存在しません')
      end
    end
    CODE
  end

  remove_file 'app/models/ability.rb'
  create_file 'app/models/ability.rb', %q!
  class Ability
    include CanCan::Ability

    def initialize(user)
      @user = user || AdminUser.new
      role = @user.role.send(:to_sym)
      role = :anonymouse unless self.class.roles.has_key?(role)
      ability = self.class.roles[role]
      instance_exec(user, &ability)
    end

    module Roles
      def roles
        @@_roles ||= {}
      end

      def append_role(name, role_lambda)
        roles[name] = role_lambda
        name = name.to_s

        define_method "#{name.downcase}_user?" do
          self.user.role == name
        end
      end

      def role_names
        @@_roles.keys
      end
    end
    extend Roles

    append_role :administrator, -> (user) {
      can :manage, :all
      # cannot :create, ModelName
    }

    append_role :anonymouse, -> (user) {
      can [:read], ActiveAdmin::Page
      can [:update, :read], AdminUser, id: user.id
    }
  end
  !

  inside @target_path do
    run 'rake db:migrate'
  end
end
