class Option
    attr_reader :id, :rental
    attr_accessor :type

    def initialize id, rental, type
        @id = id
        @rental = rental
        @type = type
    end
end