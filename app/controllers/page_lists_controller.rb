class PageListsController < ApplicationController
    def index
        @pages = Page.all
    end

    def search
        q_array = params[:search].split(' ')
        q_hash = query_hash(q_array)
        searched_data = search_hash(q_array, q_hash)
        @pages = Page.where(id: searched_data.keys).sort_by{|page| -searched_data[page.id]}
    end

    private

    def query_hash(q_array)
        max_index = 8
        q_hash = {}
        q_array.each do |k|
            q_hash[k] = max_index
            max_index -= 1
        end
        q_hash
    end

    def search_hash(q_array, q_hash)
        page_hash = {}
        Keyword.includes(:page).where("name ILIKE ANY (array[?])", q_array.map {|value| "%#{value.downcase}%" }).each do |keyword|
            hash_val = 1
            q_hash.each{|key, val| hash_val = val if keyword.name.include?(key.downcase) }
            total = keyword.priority * hash_val
            if page_hash[keyword.page_id].present?
                page_hash[keyword.page_id] += total
            else
                page_hash[keyword.page_id] = total
            end
        end
        page_hash
    end    
end
