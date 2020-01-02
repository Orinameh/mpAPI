class JsonWebToken
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
    
    # class methods start with self while instance methods just have their names without self
    def self.encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    def self.decode(token)
        decoded = JWT.decode(token, SECRET_KEY).first
        HashWithIndifferentAccess.new decoded
    end
end

# eager_load this in the application.rb file so that it can be available anywhere in the project