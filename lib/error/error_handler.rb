# module Error
#   module ErrorHandling
#     def self.included(klass)
#       klass.class_eval do
#         rescue_from ActiveRecord::RecordNotFound do |e|
#           respond(:record_not_found, 404, e.to_s)
#         end
#         rescue_from ActiveRecord::ActiveRecordError do |e|
#           respond(e.error, 422, e.to_s)
#         end
#         rescue_from ::ActiveController::ParameterMissing do |e|
#           response(:unprocessable_entitry, 422, e.to_s)
#         end
#         rescue_from ActiveModel::ValidationError do |e|
#           response(e.error, 422, e.to_s)
#         end
#         rescue_from CustomApiError do |e|
#           respond(e.error, e.status, e.message.to_s)
#         end
#         rescue_from CanCan::AccessDenied do
#           respond(:forbidden, 401, "current user isn't authorized for that")
#         end
#         rescue_from StandardError do |e|
#           respond(:standard_error, 500, e.to_s)
#         end
#       end
#     end

#     private

#     def respond(_error, _status, _message)
#       render "layouts/api/errors", status: _status
#     end
#   end
# end