class Pessoa < ApplicationRecord

    validates :nome, presence: true
    validates :rua, presence: true
    validates :numero, presence: true
    validates :bairro, presence: true
    validates :cidade, presence: true
    validates :estado, presence: true, length: { is: 2 }

end
