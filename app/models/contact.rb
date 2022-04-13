class Contact < ApplicationRecord
    belongs_to :kind #, optional: true

    def author
        "Adilson Paraguai"
    end

    def as_json(options={})
        super(
            root: false,
            methods: :author,
            include: { kind: {only: :description}} 
        )
    end

end
