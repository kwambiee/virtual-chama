
module ApiHelper
    def headers(token)
        {
            'Authorization' => "Bearer " + token,
            'Content-Type' => 'application/json',
            'Accept' => 'application/json'
        }
    end

    def get_request(url, token)
        get url, headers: headers(token)
    end

    def post_request(url, token, params)
        post url, params: params.to_json, headers: headers(token)
    end

    def register_request(url, params)
        post url, params: params.to_h
    end

    def log_in(user)
        post '/login', params: { email: user.email, password: user.password }
        @token = JSON.parse(response.body)['token']
    end
end