describe "New author page", type: :model do
    it "should create a new instance" do
        first_name = 'Alan'
        last_name = 'Turing'
        homepage = 'http://wikipedia.org/Alan_Turing'
        author = Author.new(:first_name => first_name, :last_name => last_name, :homepage => homepage)
        expect(author.first_name).to eq(first_name)
        expect(author.last_name).to eq(last_name)
        expect(author.homepage).to eq(homepage)
    end

    it "should return a name" do
        first_name = 'Alan'
        last_name = 'Turing'
        homepage = 'http://wikipedia.org/Alan_Turing'
        author = Author.new(:first_name => first_name, :last_name => last_name, :homepage => homepage)
        expect(author.name).to eq("#{first_name} #{last_name}")
    end

    it "should validate author with a last name that is not empty" do
        @alan = FactoryBot.create :author
        expect(@alan).to be_valid
    end

    it "should not validate author with a last name that is not empty"do
        first_name = 'Elton'
        last_name = ''
        homepage = 'http://wikipedia.org/Elton'
        author = Author.new(:first_name => first_name, :last_name => last_name, :homepage => homepage)
        expect(author).to_not be_valid
    end
end
