class Mutations::CreateUser < GraphQL::Function
  argument :firstName, !types.String
  argument :lastName, !types.String
  argument :interest, !types.String
  argument :authProvider, !Types::AuthProviderSignupData

  type Types::AuthenticateType

  def call(_obj, args, _ctx)
    user = User.create!(
      firstName: args[:firstName],
      lastName: args[:lastName],
      interest: args[:interest],
      email: args[:authProvider][:email][:email],
      password: args[:authProvider][:email][:password]
    )

    OpenStruct.new({
      token: AuthToken.token(user),
      user: user
    })
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end