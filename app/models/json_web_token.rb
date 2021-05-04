class JsonWebToken
    # create jwt to expire two weeks from now
    def self.encode(payload)
        expiration = 2.weeks.from_now.to_i
        # expire JWT by expiration set above. Get JWT from secret key base
        JWT.encode payload.merge(exp: expiration), Rails.application.credentials.fetch(:secret_key_base)
    end

    # decode the jwt sent in headers
    def self.decode(token)
      JWT.decode(token, Rails.application.credentials.fetch(:secret_key_base)).first
    end
end