module DeviseGoogleAuthenticator
  class Engine < ::Rails::Engine # :nodoc:
    ActionDispatch::Callbacks.to_param do
      DeviseGoogleAuthenticator::Patches.apply
    end

  end
end
