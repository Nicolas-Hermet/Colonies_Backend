class Option
    attr_reader :id, :rental, :type

    def initialize id, rental, type
        @id = id
        @rental = rental
        @type = type
    end
end