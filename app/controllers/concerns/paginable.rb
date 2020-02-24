module Paginable
    protected

    def current_page
        (params[:page] || 1).to_i
    end

    def per_page
        (params[:page] || 20).to_i
    end
end