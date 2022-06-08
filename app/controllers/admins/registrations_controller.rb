# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  included Accessible
  skip_before_action :check_resource, except: [:new, :create] 
end
