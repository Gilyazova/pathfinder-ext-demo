# encoding: utf-8
require 'spec_helper'

describe "identity_cards/index.xml.erb" do

    context 'russian_passport' do
      before do

        @sex_id = 1
        @moscow_place_code = '770000000000'
        @birth_place = "Место рождения Гражданина РФ"
        @birth_date = DateTime.new(1950, 6, 7)

        @person = FactoryGirl.create(:person)
        rp = FactoryGirl.create(:russian_passport, :person => @person, sex_id: @sex_id, birth_place: @birth_place, birth_date: @birth_date)
        @type_id = 1
        @number = '1111'
        @serie = '222222'
        @issue_date = DateTime.new(2001, 5, 11)
        @issuer = 'Организация выдающая паспорта РФ'
        @issuer_code = '123456'
        @reason_id = 2
        @state_id = 1

        rp.build_identity_card(person: @person,
            number: @number,
            serie: @serie,
            type_id: @type_id,
            issue_date: @issue_date,
            issuer_code: @issuer_code,
            issuer: @issuer,
            issue_place_code: @moscow_place_code,
            reason_id: @reason_id,
            state_id: @state_id
        )
        rp.save

        @addr = FactoryGirl.create(:address, :owner => rp)
        @flat = 32.to_s
        FactoryGirl.create(:address, :owner => rp, :flat => @flat)

        @identity_cards = PaginableArray.new(@person.identity_cards)
        @xml = Nokogiri::XML.parse(render)
      end

      subject { @xml.xpath('//identity_cards/russian_passport') }

      it 'should be rendered' do
        lambda { render }.should_not raise_error
      end

      it { should have_tag('person_id').with_value(@person.id) }
      it { should have_tag('type/code').with_value(@type_id) }
      it { should have_tag('number').with_value(@number) }
      it { should have_tag('serie').with_value(@serie) }

      it { should have_tag('issue_date').with_value(@issue_date.strftime("%Y-%m-%d")) }
      it { should have_tag('issuer').with_value(@issuer) }
      it { should have_tag('issuer_code').with_value(@issuer_code) }
      it { should have_tag('region/code').with_value(@moscow_place_code) }

      it { should have_tag('reason/code').with_value(@reason_id) }
      it { should have_tag('state/code').with_value(@state_id) }
      it { should have_tag('sex/code').with_value(@sex_id) }
      it { should have_tag('sex/title').with_value('') }
      it { should have_tag('birth_place').with_value(@birth_place) }
      it { should have_tag('birth_date').with_value(l(@birth_date, :format => :xml)) }

      context 'test address 1' do
        subject { @xml.xpath('//identity_cards/russian_passport/addresses/address[1]') }

        it { should have_tag('type/code').with_value(@addr.type_id) }
        it { should have_tag('created_at').with_value(@addr.created_at.strftime("%Y-%m-%d")) }
        it { should have_tag('updated_at').with_value(@addr.updated_at.strftime("%Y-%m-%d")) }
        it { should have_tag('region/code').with_value(@addr.region_id) }
        it { should have_tag('district/code').with_value(@addr.district_id) }
        it { should have_tag('city/code').with_value(@addr.city_id) }
        it { should have_tag('house').with_value(@addr.house) }
        it { should have_tag('building').with_value(@addr.building) }
        it { should have_tag('flat').with_value(@addr.flat) }
      end

      context 'test adderss 2' do
        subject { @xml.xpath('//identity_cards/russian_passport/addresses/address[2]') }

        it { should have_tag('flat').with_value(@flat) }
      end
      
    end

    context 'international_passport' do
      before do
        
        I18n.locale = :ru
        @sex_id = 1
        @moscow_place_code = '770000000000'
        person = FactoryGirl.create(:person)
        fp = FactoryGirl.create(:international_passport, birth_place_code: @moscow_place_code)
        @type_id = 2
        @number = '1111'
        @serie = '222222'
        @issue_date = DateTime.new(2011, 5, 11)
        @issuer = 'Организация выдающая заграничные паспорта'
        @issuer_code = '1234567'
        @reason_id = 1
        @state_id = 1

        @first_name = 'Иван'
        @last_name = 'Иванов'
        @middle_name = 'Иванович'

        @first_name_latin = I18n.transliterate(@first_name)
        @last_name_latin = I18n.transliterate(@last_name)

        fp.build_identity_card(person: person,
            number: @number,
            serie: @serie,
            type_id: @type_id,
            issue_date: @issue_date,
            issuer_code: @issuer_code,
            issuer: @issuer,
            issue_place_code: @moscow_place_code,
            reason_id: @reason_id,
            state_id: @state_id
        )

        fp.first_name = @first_name.clone
        fp.last_name = @last_name
        fp.middle_name = @middle_name

        fp.first_name_latin = @first_name_latin
        fp.last_name_latin = @last_name_latin

        fp.save
        @identity_cards = PaginableArray.new(person.identity_cards)
      end

      subject { Nokogiri::XML.parse(render).xpath('//identity_cards/international_passport') }

      it 'should be rendered' do
        lambda { render }.should_not raise_error
      end

      # it { subject.at('last_name').text.should == @last_name }

      it { should have_tag('first_name').with_value(@first_name) }
      it { should have_tag('last_name').with_value(@last_name) }
      it { should have_tag('middle_name').with_value(@middle_name) }
      it { should have_tag('first_name_latin').with_value(@first_name_latin) }
      it { should have_tag('last_name_latin').with_value(@last_name_latin) }

      it { should have_tag('number').with_value(@number) }
      it { should have_tag('serie').with_value(@serie) }
      it { should have_tag('issue_date').with_value(@issue_date.strftime("%Y-%m-%d")) }
      it { should have_tag('issuer').with_value(@issuer) }
      it { should have_tag('issuer_code').with_value(@issuer_code) }

      it { should have_tag('type/code').with_value(@type_id.to_s) }
      it { should have_tag('region/code').with_value(@moscow_place_code) }

      it { should have_tag('reason/code').with_value(@reason_id.to_s) }
      it { should have_tag('state/code').with_value(@state_id.to_s) }
      it { should have_tag('birth_place/code').with_value(@moscow_place_code) }

    end
end
