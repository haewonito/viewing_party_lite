# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end

  VCR.configure do |config|
    config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
    config.hook_into :webmock
    config.filter_sensitive_data("Hide My Key") { ENV["movie_api_key"] }  #if you want to hide the key in the cassete
    config.configure_rspec_metadata!
    config.default_cassette_options = { re_record_interval: 10.days }
  end

  def movie_details_data
    {
        "adult": false,
        "backdrop_path": "/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
        "belongs_to_collection": {
            "id": 230,
            "name": "The Godfather Collection",
            "poster_path": "/zqV8MGXfpLZiFVObLxpAI7wWonJ.jpg",
            "backdrop_path": "/pGl7NqNhyncju3Qu8LGA7owciMW.jpg"
        },
        "budget": 6000000,
        "genres": [
            {
                "id": 18,
                "name": "Drama"
            },
            {
                "id": 80,
                "name": "Crime"
            }
        ],
        "homepage": "http://www.thegodfather.com/",
        "id": 238,
        "imdb_id": "tt0068646",
        "original_language": "en",
        "original_title": "The Godfather",
        "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        "popularity": 57.352,
        "poster_path": "/eEslKSwcqmiNS6va24Pbxf2UKmJ.jpg",
        "production_companies": [
            {
                "id": 4,
                "logo_path": "/fycMZt242LVjagMByZOLUGbCvv3.png",
                "name": "Paramount",
                "origin_country": "US"
            },
            {
                "id": 10211,
                "logo_path": nil,
                "name": "Alfran Productions",
                "origin_country": "US"
            }
        ],
        "production_countries": [
            {
                "iso_3166_1": "US",
                "name": "United States of America"
            }
        ],
        "release_date": "1972-03-14",
        "revenue": 245066411,
        "runtime": 175,
        "spoken_languages": [
            {
                "english_name": "English",
                "iso_639_1": "en",
                "name": "English"
            },
            {
                "english_name": "Italian",
                "iso_639_1": "it",
                "name": "Italiano"
            },
            {
                "english_name": "Latin",
                "iso_639_1": "la",
                "name": "Latin"
            }
        ],
        "status": "Released",
        "tagline": "An offer you can't refuse.",
        "title": "The Godfather",
        "video": false,
        "vote_average": 8.7,
        "vote_count": 15131
    }
  end

  def cast_data
    {
        "id": 238,
        "cast": [
            {
                "adult": false,
                "gender": 2,
                "id": 3084,
                "known_for_department": "Acting",
                "name": "Marlon Brando",
                "original_name": "Marlon Brando",
                "popularity": 6.419,
                "profile_path": "/fuTEPMsBtV1zE98ujPONbKiYDc2.jpg",
                "cast_id": 5,
                "character": "Don Vito Corleone",
                "credit_id": "52fe422bc3a36847f8009357",
                "order": 1
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1158,
                "known_for_department": "Acting",
                "name": "Al Pacino",
                "original_name": "Al Pacino",
                "popularity": 11.729,
                "profile_path": "/fMDFeVf0pjopTJbyRSLFwNDm8Wr.jpg",
                "cast_id": 6,
                "character": "Don Michael Corleone",
                "credit_id": "52fe422bc3a36847f800935b",
                "order": 2
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3085,
                "known_for_department": "Acting",
                "name": "James Caan",
                "original_name": "James Caan",
                "popularity": 9.17,
                "profile_path": "/bGyOCCOIgcIyKjOGLoXoyp0XWHf.jpg",
                "cast_id": 7,
                "character": "Santino \"Sonny\" Corleone",
                "credit_id": "52fe422bc3a36847f800935f",
                "order": 3
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3087,
                "known_for_department": "Acting",
                "name": "Robert Duvall",
                "original_name": "Robert Duvall",
                "popularity": 7.683,
                "profile_path": "/ybMmK25h4IVtfE7qrnlVp47RQlh.jpg",
                "cast_id": 9,
                "character": "Tom Hagen",
                "credit_id": "52fe422bc3a36847f8009367",
                "order": 4
            },
            {
                "adult": false,
                "gender": 0,
                "id": 3086,
                "known_for_department": "Acting",
                "name": "Richard S. Castellano",
                "original_name": "Richard S. Castellano",
                "popularity": 1.813,
                "profile_path": "/1vr75BdHWret81vuSJ3ugiCBkxw.jpg",
                "cast_id": 8,
                "character": "Pete Clemenza",
                "credit_id": "52fe422bc3a36847f8009363",
                "order": 5
            },
            {
                "adult": false,
                "gender": 1,
                "id": 3092,
                "known_for_department": "Acting",
                "name": "Diane Keaton",
                "original_name": "Diane Keaton",
                "popularity": 6.668,
                "profile_path": "/7gEdH5vGwpUpogscTb2JivnoRBb.jpg",
                "cast_id": 13,
                "character": "Kay Adams",
                "credit_id": "52fe422bc3a36847f8009377",
                "order": 6
            },
            {
                "adult": false,
                "gender": 1,
                "id": 3094,
                "known_for_department": "Acting",
                "name": "Talia Shire",
                "original_name": "Talia Shire",
                "popularity": 8.823,
                "profile_path": "/xvJ47wKL5zpwFXFFNZQmFmf7i9F.jpg",
                "cast_id": 15,
                "character": "Constanzia \"Connie\" Corleone-Rizzi",
                "credit_id": "52fe422bc3a36847f800937f",
                "order": 7
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3095,
                "known_for_department": "Acting",
                "name": "Gianni Russo",
                "original_name": "Gianni Russo",
                "popularity": 1.588,
                "profile_path": "/5fjg2WPvuk1NvUpLyQ7aMJqOqy.jpg",
                "cast_id": 16,
                "character": "Carlo Rizzi",
                "credit_id": "52fe422bc3a36847f8009383",
                "order": 8
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3088,
                "known_for_department": "Acting",
                "name": "Sterling Hayden",
                "original_name": "Sterling Hayden",
                "popularity": 4.823,
                "profile_path": "/bMpJtVo741q83q3qLtraqYO4cVh.jpg",
                "cast_id": 10,
                "character": "Capt. Mark McCluskey",
                "credit_id": "52fe422bc3a36847f800936b",
                "order": 9
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3091,
                "known_for_department": "Acting",
                "name": "Al Lettieri",
                "original_name": "Al Lettieri",
                "popularity": 2.499,
                "profile_path": "/fE5mEWPkkVJlCji0EoKht8PYw89.jpg",
                "cast_id": 12,
                "character": "Virgil \"The Turk\" Sollozzo",
                "credit_id": "52fe422bc3a36847f8009373",
                "order": 10
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3093,
                "known_for_department": "Acting",
                "name": "Abe Vigoda",
                "original_name": "Abe Vigoda",
                "popularity": 2.423,
                "profile_path": "/luWKPNb58IgJ2ovrtgPAzHGLLYL.jpg",
                "cast_id": 14,
                "character": "Salvatore \"Sal\" Tessio",
                "credit_id": "52fe422bc3a36847f800937b",
                "order": 11
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3096,
                "known_for_department": "Acting",
                "name": "John Cazale",
                "original_name": "John Cazale",
                "popularity": 6.758,
                "profile_path": "/41wXX1FBalyIuf5eaA4S43Y8IfZ.jpg",
                "cast_id": 17,
                "character": "Frederico \"Fredo\" Corleone",
                "credit_id": "52fe422bc3a36847f8009387",
                "order": 12
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3090,
                "known_for_department": "Acting",
                "name": "Richard Conte",
                "original_name": "Richard Conte",
                "popularity": 1.536,
                "profile_path": "/pTTzNets0bgWAqx18D7by0hWUea.jpg",
                "cast_id": 11,
                "character": "Don Emilio Barzini",
                "credit_id": "52fe422bc3a36847f800936f",
                "order": 13
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3142,
                "known_for_department": "Acting",
                "name": "John Marley",
                "original_name": "John Marley",
                "popularity": 2.517,
                "profile_path": nil,
                "cast_id": 33,
                "character": "Jack Woltz",
                "credit_id": "52fe422bc3a36847f800938b",
                "order": 14
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3143,
                "known_for_department": "Acting",
                "name": "Rudy Bond",
                "original_name": "Rudy Bond",
                "popularity": 1.38,
                "profile_path": "/kP77m6ot9dfOR2V3ykbyOAx2diK.jpg",
                "cast_id": 34,
                "character": "Carmine Cuneo",
                "credit_id": "52fe422bc3a36847f800938f",
                "order": 15
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3144,
                "known_for_department": "Acting",
                "name": "Al Martino",
                "original_name": "Al Martino",
                "popularity": 0.983,
                "profile_path": "/9luOyyiqWFNQgSOSStH66LTWZ3p.jpg",
                "cast_id": 35,
                "character": "Johnny Fontane",
                "credit_id": "52fe422bc3a36847f8009393",
                "order": 16
            },
            {
                "adult": false,
                "gender": 1,
                "id": 933716,
                "known_for_department": "Acting",
                "name": "Morgana King",
                "original_name": "Morgana King",
                "popularity": 0.6,
                "profile_path": "/zPsFAqH4NXD7rMWl2Kj3rEyGrKj.jpg",
                "cast_id": 42,
                "character": "Carmela \"Mama\" Corleone",
                "credit_id": "52fe422bc3a36847f80093a7",
                "order": 17
            },
            {
                "adult": false,
                "gender": 2,
                "id": 106811,
                "known_for_department": "Acting",
                "name": "Lenny Montana",
                "original_name": "Lenny Montana",
                "popularity": 0.694,
                "profile_path": "/3R52Zh3MBCaSPqmcyWcD1Y0N4wo.jpg",
                "cast_id": 45,
                "character": "Luca Brasi",
                "credit_id": "52fe422bc3a36847f80093b3",
                "order": 18
            },
            {
                "adult": false,
                "gender": 2,
                "id": 99724,
                "known_for_department": "Acting",
                "name": "John Martino",
                "original_name": "John Martino",
                "popularity": 0.6,
                "profile_path": "/3c8BOgJ8UdHi5x5BS3lYnFngxB5.jpg",
                "cast_id": 47,
                "character": "Paulie Gatto",
                "credit_id": "52fe422bc3a36847f80093bb",
                "order": 19
            },
            {
                "adult": false,
                "gender": 2,
                "id": 20752,
                "known_for_department": "Acting",
                "name": "Alex Rocco",
                "original_name": "Alex Rocco",
                "popularity": 3.623,
                "profile_path": "/uAG4qvYhYHuCyyXGm3lqC4o6ujc.jpg",
                "cast_id": 41,
                "character": "Moe Greene",
                "credit_id": "52fe422bc3a36847f80093a3",
                "order": 20
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1195877,
                "known_for_department": "Acting",
                "name": "Salvatore Corsitto",
                "original_name": "Salvatore Corsitto",
                "popularity": 0.982,
                "profile_path": "/79OfgwtdP5qsR1UX6ERkrdmRT8c.jpg",
                "cast_id": 46,
                "character": "Amerigo Bonasera",
                "credit_id": "52fe422bc3a36847f80093b7",
                "order": 21
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3414,
                "known_for_department": "Acting",
                "name": "Tony Giorgio",
                "original_name": "Tony Giorgio",
                "popularity": 0.978,
                "profile_path": "/1uhgwgjoX7WaakEOBmtBRJKtgEB.jpg",
                "cast_id": 38,
                "character": "Bruno Tattaglia",
                "credit_id": "52fe422bc3a36847f800939f",
                "order": 22
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3413,
                "known_for_department": "Acting",
                "name": "Victor Rendina",
                "original_name": "Victor Rendina",
                "popularity": 0.608,
                "profile_path": "/vuNdsjDpgom80WBdB2WBTWuEIuM.jpg",
                "cast_id": 37,
                "character": "Philip Tattaglia",
                "credit_id": "52fe422bc3a36847f800939b",
                "order": 23
            },
            {
                "adult": false,
                "gender": 1,
                "id": 3145,
                "known_for_department": "Acting",
                "name": "Simonetta Stefanelli",
                "original_name": "Simonetta Stefanelli",
                "popularity": 4.294,
                "profile_path": "/sVDrhgxuE6SHnj7q07OG6ywPUYR.jpg",
                "cast_id": 36,
                "character": "Apollonia Vitelli-Corleone",
                "credit_id": "52fe422bc3a36847f8009397",
                "order": 24
            },
            {
                "adult": false,
                "gender": 2,
                "id": 119431,
                "known_for_department": "Acting",
                "name": "Saro Urzì",
                "original_name": "Saro Urzì",
                "popularity": 1.96,
                "profile_path": "/nPJytCpcNdG5ssPoKeEvxM6xifx.jpg",
                "cast_id": 48,
                "character": "Mr. Vitelli",
                "credit_id": "52fe422bc3a36847f80093bf",
                "order": 25
            },
            {
                "adult": false,
                "gender": 1,
                "id": 1769,
                "known_for_department": "Directing",
                "name": "Sofia Coppola",
                "original_name": "Sofia Coppola",
                "popularity": 3.35,
                "profile_path": "/dzHC2LxmarkBxWLhjp2DRa5oCev.jpg",
                "cast_id": 43,
                "character": "Michael Francis Rizzi",
                "credit_id": "52fe422bc3a36847f80093ab",
                "order": 26
            },
            {
                "adult": false,
                "gender": 2,
                "id": 20973,
                "known_for_department": "Acting",
                "name": "Louis Guss",
                "original_name": "Louis Guss",
                "popularity": 1.579,
                "profile_path": "/hz5Akuh4QcqitlifYwDiZ9ut6Tr.jpg",
                "cast_id": 44,
                "character": "Don Zaluchi",
                "credit_id": "52fe422bc3a36847f80093af",
                "order": 27
            },
            {
                "adult": false,
                "gender": 0,
                "id": 138211,
                "known_for_department": "Acting",
                "name": "Gabriele Torrei",
                "original_name": "Gabriele Torrei",
                "popularity": 1.556,
                "profile_path": "/x3KeYWTWX5SqZ3NuQGiWiadO4DI.jpg",
                "cast_id": 49,
                "character": "Enzo the Baker (uncredited)",
                "credit_id": "52fe422bc3a36847f80093c3",
                "order": 28
            },
            {
                "adult": false,
                "gender": 2,
                "id": 55672,
                "known_for_department": "Acting",
                "name": "Tony King",
                "original_name": "Tony King",
                "popularity": 0.6,
                "profile_path": "/hOVVHEyc6euuuRhCLo6Q5YE4lLz.jpg",
                "cast_id": 69,
                "character": "Tony the Stablehand (uncredited)",
                "credit_id": "54de315fc3a3685446001351",
                "order": 29
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3174,
                "known_for_department": "Acting",
                "name": "Richard Bright",
                "original_name": "Richard Bright",
                "popularity": 1.61,
                "profile_path": "/potMaJ2u5PRjXZb7qF9lSW1ldNZ.jpg",
                "cast_id": 70,
                "character": "Neri",
                "credit_id": "55be4cdbc3a3683921003065",
                "order": 30
            },
            {
                "adult": false,
                "gender": 2,
                "id": 82779,
                "known_for_department": "Acting",
                "name": "Vito Scotti",
                "original_name": "Vito Scotti",
                "popularity": 2.953,
                "profile_path": "/zDGtXkASxpo3DzMNz6OI3NOp9v0.jpg",
                "cast_id": 71,
                "character": "Nazorine",
                "credit_id": "55be4cff9251413e49004a59",
                "order": 31
            },
            {
                "adult": false,
                "gender": 1,
                "id": 982089,
                "known_for_department": "Acting",
                "name": "Tere Livrano",
                "original_name": "Tere Livrano",
                "popularity": 0.632,
                "profile_path": "/eBoC3425jmwRlsT2W8qUDsNwVXB.jpg",
                "cast_id": 72,
                "character": "Theresa Hagen",
                "credit_id": "55be4d40c3a368392100306d",
                "order": 32
            },
            {
                "adult": false,
                "gender": 1,
                "id": 160728,
                "known_for_department": "Acting",
                "name": "Julie Gregg",
                "original_name": "Julie Gregg",
                "popularity": 1.286,
                "profile_path": "/8Kx71BnZNtpzb86jH7fcArWhJBh.jpg",
                "cast_id": 77,
                "character": "Sandrinella \"Sandra\" Corleone",
                "credit_id": "55ee4ac0c3a3686f170063c4",
                "order": 33
            },
            {
                "adult": false,
                "gender": 2,
                "id": 27647,
                "known_for_department": "Acting",
                "name": "Angelo Infanti",
                "original_name": "Angelo Infanti",
                "popularity": 1.62,
                "profile_path": "/dkRVpiDj9YyiuM15XZKT11zZBIR.jpg",
                "cast_id": 74,
                "character": "Fabrizio",
                "credit_id": "55be4dffc3a368652600471c",
                "order": 34
            },
            {
                "adult": false,
                "gender": 2,
                "id": 24604,
                "known_for_department": "Acting",
                "name": "Corrado Gaipa",
                "original_name": "Corrado Gaipa",
                "popularity": 0.611,
                "profile_path": "/7vR2BOdVw9FwJKjgpcisjKEytnL.jpg",
                "cast_id": 75,
                "character": "Don Tommasino",
                "credit_id": "55be4e2fc3a3686534005572",
                "order": 35
            },
            {
                "adult": false,
                "gender": 2,
                "id": 44860,
                "known_for_department": "Acting",
                "name": "Franco Citti",
                "original_name": "Franco Citti",
                "popularity": 0.833,
                "profile_path": "/mttQPjOHaql4RKsfYriUA7HuROE.jpg",
                "cast_id": 76,
                "character": "Calò",
                "credit_id": "55be4e5bc3a3683921003083",
                "order": 36
            },
            {
                "adult": false,
                "gender": 0,
                "id": 178006,
                "known_for_department": "Acting",
                "name": "Max Brandt",
                "original_name": "Max Brandt",
                "popularity": 0.6,
                "profile_path": nil,
                "cast_id": 78,
                "character": "Extra in Furniture-Moving Scene (uncredited)",
                "credit_id": "55f1b3c992514167010020a7",
                "order": 37
            },
            {
                "adult": false,
                "gender": 2,
                "id": 2872,
                "known_for_department": "Sound",
                "name": "Carmine Coppola",
                "original_name": "Carmine Coppola",
                "popularity": 0.6,
                "profile_path": nil,
                "cast_id": 79,
                "character": "Piano Player in Montage (uncredited)",
                "credit_id": "55f1b3ffc3a368230a00239f",
                "order": 38
            },
            {
                "adult": false,
                "gender": 2,
                "id": 38803,
                "known_for_department": "Writing",
                "name": "Roman Coppola",
                "original_name": "Roman Coppola",
                "popularity": 3.821,
                "profile_path": "/rKamKkx78qjZTfvqi2OWCo5p6x5.jpg",
                "cast_id": 80,
                "character": "Boy on Street Who Attended Funeral (uncredited)",
                "credit_id": "55f1b452c3a36822f5002395",
                "order": 39
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1209294,
                "known_for_department": "Acting",
                "name": "Don Costello",
                "original_name": "Don Costello",
                "popularity": 0.6,
                "profile_path": nil,
                "cast_id": 81,
                "character": "Don Victor Stracci (uncredited)",
                "credit_id": "55f1b4bac3a3682303002284",
                "order": 40
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1394703,
                "known_for_department": "Acting",
                "name": "Robert Dahdah",
                "original_name": "Robert Dahdah",
                "popularity": 0.6,
                "profile_path": nil,
                "cast_id": 82,
                "character": "Crowd (uncredited)",
                "credit_id": "55f1b4de925141670d002392",
                "order": 41
            },
            {
                "adult": false,
                "gender": 2,
                "id": 2870,
                "known_for_department": "Production",
                "name": "Gray Frederickson",
                "original_name": "Gray Frederickson",
                "popularity": 0.62,
                "profile_path": nil,
                "cast_id": 83,
                "character": "Cowboy on the Set at Woltz's Studio (uncredited)",
                "credit_id": "55f1b507925141670d00239a",
                "order": 42
            },
            {
                "adult": false,
                "gender": 2,
                "id": 160621,
                "known_for_department": "Acting",
                "name": "Ron Gilbert",
                "original_name": "Ron Gilbert",
                "popularity": 0.6,
                "profile_path": "/qrY6w2k0YpuMB2yTCOv6cxeQtmw.jpg",
                "cast_id": 84,
                "character": "Usher in Bridal Party (uncredited)",
                "credit_id": "55f1b52f9251416711002211",
                "order": 43
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1233541,
                "known_for_department": "Acting",
                "name": "Sonny Grosso",
                "original_name": "Sonny Grosso",
                "popularity": 1.4,
                "profile_path": nil,
                "cast_id": 87,
                "character": "Cop Outside Hospital (uncredited)",
                "credit_id": "55f1b5bb925141670100210a",
                "order": 44
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1503036,
                "known_for_department": "Acting",
                "name": "Joe Lo Grippo",
                "original_name": "Joe Lo Grippo",
                "popularity": 0.6,
                "profile_path": nil,
                "cast_id": 86,
                "character": "Sonny's Bodyguard (uncredited)",
                "credit_id": "55f1b59dc3a3683bec00231e",
                "order": 45
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1068099,
                "known_for_department": "Acting",
                "name": "Randy Jurgensen",
                "original_name": "Randy Jurgensen",
                "popularity": 0.6,
                "profile_path": "/xRoN79wRLndTMCJoaBSsdjQVIzI.jpg",
                "cast_id": 89,
                "character": "Sonny's Killer #1 (uncredited)",
                "credit_id": "55f1b61ec3a3683bec002335",
                "order": 46
            },
            {
                "adult": false,
                "gender": 2,
                "id": 61241,
                "known_for_department": "Acting",
                "name": "Tony Lip",
                "original_name": "Tony Lip",
                "popularity": 0.6,
                "profile_path": "/6xz6XmjgiCCOm067OzWYziD4Mxa.jpg",
                "cast_id": 90,
                "character": "Wedding Guest (uncredited)",
                "credit_id": "55f1b685c3a36823070023b6",
                "order": 47
            },
            {
                "adult": false,
                "gender": 2,
                "id": 106187,
                "known_for_department": "Acting",
                "name": "Lou Martini Jr.",
                "original_name": "Lou Martini Jr.",
                "popularity": 1.672,
                "profile_path": nil,
                "cast_id": 91,
                "character": "Boy at Wedding (uncredited)",
                "credit_id": "55f1b6c39251416701002141",
                "order": 48
            },
            {
                "adult": false,
                "gender": 2,
                "id": 100503,
                "known_for_department": "Acting",
                "name": "Raymond Martino",
                "original_name": "Raymond Martino",
                "popularity": 0.6,
                "profile_path": nil,
                "cast_id": 92,
                "character": "Corleone Family Member (uncredited)",
                "credit_id": "55f1b6e59251416711002257",
                "order": 49
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1503035,
                "known_for_department": "Acting",
                "name": "Joseph Medaglia",
                "original_name": "Joseph Medaglia",
                "popularity": 0.98,
                "profile_path": nil,
                "cast_id": 93,
                "character": "Priest at Baptism (uncredited)",
                "credit_id": "55f1b73dc3a3685eb80005f7",
                "order": 50
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1290895,
                "known_for_department": "Acting",
                "name": "Rick Petrucelli",
                "original_name": "Rick Petrucelli",
                "popularity": 0.6,
                "profile_path": nil,
                "cast_id": 94,
                "character": "Man in Passenger Seat (uncredited)",
                "credit_id": "55f1b769925141671400218e",
                "order": 51
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1237372,
                "known_for_department": "Acting",
                "name": "Sal Richards",
                "original_name": "Sal Richards",
                "popularity": 1.4,
                "profile_path": "/gZSiZOtBVv1U4hqjlKkPr2p5rCP.jpg",
                "cast_id": 95,
                "character": "Drunk (uncredited)",
                "credit_id": "55f1b7c29251410d6d000acb",
                "order": 52
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1213795,
                "known_for_department": "Acting",
                "name": "Tom Rosqui",
                "original_name": "Tom Rosqui",
                "popularity": 0.6,
                "profile_path": nil,
                "cast_id": 96,
                "character": "Rocco Lampone (uncredited)",
                "credit_id": "55f1b7e2925141670d00243a",
                "order": 53
            },
            {
                "adult": false,
                "gender": 2,
                "id": 11480,
                "known_for_department": "Acting",
                "name": "Frank Sivero",
                "original_name": "Frank Sivero",
                "popularity": 1.481,
                "profile_path": "/eqvhj0iNtcsN6EJhd21Goqi1DSq.jpg",
                "cast_id": 97,
                "character": "Street Extra (uncredited)",
                "credit_id": "55f1b81092514167140021b1",
                "order": 54
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1209678,
                "known_for_department": "Acting",
                "name": "Filomena Spagnuolo",
                "original_name": "Filomena Spagnuolo",
                "popularity": 0.84,
                "profile_path": nil,
                "cast_id": 98,
                "character": "Extra in Wedding Scene (uncredited)",
                "credit_id": "55f1b83592514167140021c1",
                "order": 55
            },
            {
                "adult": false,
                "gender": 2,
                "id": 78336,
                "known_for_department": "Directing",
                "name": "Nick Vallelonga",
                "original_name": "Nick Vallelonga",
                "popularity": 1.312,
                "profile_path": "/h0GwAHN1J5lDysqgWxMIg66LNBW.jpg",
                "cast_id": 100,
                "character": "Wedding Party Guest (uncredited)",
                "credit_id": "55f1b89b9251410d6d000af0",
                "order": 56
            },
            {
                "adult": false,
                "gender": 2,
                "id": 16525,
                "known_for_department": "Acting",
                "name": "Joe Spinell",
                "original_name": "Joe Spinell",
                "popularity": 1.322,
                "profile_path": "/aTDs8125mhLKlQSbUlFJC2LJ8tU.jpg",
                "cast_id": 99,
                "character": "William \"Willie\" Cicci (uncredited)",
                "credit_id": "55f1b85d925141670500228d",
                "order": 57
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1234848,
                "known_for_department": "Acting",
                "name": "Conrad Yama",
                "original_name": "Conrad Yama",
                "popularity": 0.6,
                "profile_path": nil,
                "cast_id": 101,
                "character": "Fruit Vendor (uncredited)",
                "credit_id": "55f1b90892514167050022a8",
                "order": 58
            }
        ],
        "crew": [
            {
                "adult": false,
                "gender": 2,
                "id": 1776,
                "known_for_department": "Directing",
                "name": "Francis Ford Coppola",
                "original_name": "Francis Ford Coppola",
                "popularity": 3.502,
                "profile_path": "/mGKkVp3l9cipPt10AqoQnwaPrfI.jpg",
                "credit_id": "52fe422bc3a36847f80093db",
                "department": "Writing",
                "job": "Screenplay"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1776,
                "known_for_department": "Directing",
                "name": "Francis Ford Coppola",
                "original_name": "Francis Ford Coppola",
                "popularity": 3.502,
                "profile_path": "/mGKkVp3l9cipPt10AqoQnwaPrfI.jpg",
                "credit_id": "5e92505cccb15f00136de455",
                "department": "Directing",
                "job": "Director"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1776,
                "known_for_department": "Directing",
                "name": "Francis Ford Coppola",
                "original_name": "Francis Ford Coppola",
                "popularity": 3.502,
                "profile_path": "/mGKkVp3l9cipPt10AqoQnwaPrfI.jpg",
                "credit_id": "5f9c86e3bc8abc003b2fe6b7",
                "department": "Crew",
                "job": "Thanks"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 2870,
                "known_for_department": "Production",
                "name": "Gray Frederickson",
                "original_name": "Gray Frederickson",
                "popularity": 0.62,
                "profile_path": nil,
                "credit_id": "53884fe1c3a3681ad7004590",
                "department": "Production",
                "job": "Associate Producer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 2871,
                "known_for_department": "Production",
                "name": "Fred Roos",
                "original_name": "Fred Roos",
                "popularity": 1.021,
                "profile_path": "/qfXLY5E589l0TQnoayWmUrBDsgo.jpg",
                "credit_id": "53885041c3a3681ad700459b",
                "department": "Production",
                "job": "Casting"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 2875,
                "known_for_department": "Art",
                "name": "Dean Tavoularis",
                "original_name": "Dean Tavoularis",
                "popularity": 0.6,
                "profile_path": "/hrRBaXUn2k29qd1MvAxuag5L32c.jpg",
                "credit_id": "53884b4e0e0a261441005deb",
                "department": "Art",
                "job": "Production Design"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 457,
                "known_for_department": "Production",
                "name": "Albert S. Ruddy",
                "original_name": "Albert S. Ruddy",
                "popularity": 2.101,
                "profile_path": nil,
                "credit_id": "52fe422bc3a36847f80093cf",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 949,
                "known_for_department": "Production",
                "name": "Louis DiGiaimo",
                "original_name": "Louis DiGiaimo",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "53885009c3a3682f780004c6",
                "department": "Production",
                "job": "Casting"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3083,
                "known_for_department": "Writing",
                "name": "Mario Puzo",
                "original_name": "Mario Puzo",
                "popularity": 1.76,
                "profile_path": "/lEsT1uCZAZg1nYDQe3Fsj9CalzT.jpg",
                "credit_id": "52fe422bc3a36847f80093d5",
                "department": "Writing",
                "job": "Screenplay"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3083,
                "known_for_department": "Writing",
                "name": "Mario Puzo",
                "original_name": "Mario Puzo",
                "popularity": 1.76,
                "profile_path": "/lEsT1uCZAZg1nYDQe3Fsj9CalzT.jpg",
                "credit_id": "538848cec3a3681aea00405a",
                "department": "Writing",
                "job": "Novel"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3097,
                "known_for_department": "Camera",
                "name": "Gordon Willis",
                "original_name": "Gordon Willis",
                "popularity": 0.6,
                "profile_path": "/6gOmfatlF7UdhaHi2tPsZMb5vmz.jpg",
                "credit_id": "538848a0c3a3681ae3004283",
                "department": "Camera",
                "job": "Director of Photography"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3098,
                "known_for_department": "Sound",
                "name": "Nino Rota",
                "original_name": "Nino Rota",
                "popularity": 0.989,
                "profile_path": "/v42v3uM7jqwoZxDJ8MlEtT6Ol7a.jpg",
                "credit_id": "538848b1c3a3681aea004056",
                "department": "Sound",
                "job": "Original Music Composer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3099,
                "known_for_department": "Editing",
                "name": "William Reynolds",
                "original_name": "William Reynolds",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "52fe422bc3a36847f80093ed",
                "department": "Editing",
                "job": "Editor"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3100,
                "known_for_department": "Editing",
                "name": "Peter Zinner",
                "original_name": "Peter Zinner",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "52fe422bc3a36847f80093f3",
                "department": "Editing",
                "job": "Editor"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 3101,
                "known_for_department": "Production",
                "name": "Andrea Eastman",
                "original_name": "Andrea Eastman",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "53885029c3a3681ad7004596",
                "department": "Production",
                "job": "Casting"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3103,
                "known_for_department": "Sound",
                "name": "Charles Grenzbach",
                "original_name": "Charles Grenzbach",
                "popularity": 0.84,
                "profile_path": nil,
                "credit_id": "570006ec9251417647000790",
                "department": "Sound",
                "job": "Sound Re-Recording Mixer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3104,
                "known_for_department": "Sound",
                "name": "Chris Newman",
                "original_name": "Chris Newman",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "569d53449251415e67004177",
                "department": "Sound",
                "job": "Sound"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3105,
                "known_for_department": "Sound",
                "name": "Richard Portman",
                "original_name": "Richard Portman",
                "popularity": 0.98,
                "profile_path": nil,
                "credit_id": "568c060ac3a3685f89018710",
                "department": "Sound",
                "job": "Sound Re-Recording Mixer"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 3106,
                "known_for_department": "Sound",
                "name": "John C. Hammell",
                "original_name": "John C. Hammell",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "56cb4864c3a3684e2500045e",
                "department": "Sound",
                "job": "Music Editor"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 6099,
                "known_for_department": "Production",
                "name": "Valerio De Paolis",
                "original_name": "Valerio De Paolis",
                "popularity": 0.6,
                "profile_path": "/rbsYkbJPgQAMuFY71RYrYatdXWT.jpg",
                "credit_id": "563e3d18c3a3681b5402d6d3",
                "department": "Production",
                "job": "Production Manager"
            },
            {
                "adult": false,
                "gender": 1,
                "id": 6851,
                "known_for_department": "Costume & Make-Up",
                "name": "Anna Hill Johnstone",
                "original_name": "Anna Hill Johnstone",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "53884fc3c3a3681add0044ad",
                "department": "Costume & Make-Up",
                "job": "Costume Design"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 16194,
                "known_for_department": "Costume & Make-Up",
                "name": "Philip Leto",
                "original_name": "Philip Leto",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "56a76fd49251412a04002fa6",
                "department": "Costume & Make-Up",
                "job": "Hairstylist"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 10546,
                "known_for_department": "Production",
                "name": "Fred T. Gallo",
                "original_name": "Fred T. Gallo",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "5e9250a3875d1a001442c342",
                "department": "Directing",
                "job": "Assistant Director"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 11789,
                "known_for_department": "Production",
                "name": "Fred C. Caruso",
                "original_name": "Fred C. Caruso",
                "popularity": 0.608,
                "profile_path": nil,
                "credit_id": "57447bba925141110900063d",
                "department": "Production",
                "job": "Unit Production Manager"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 12288,
                "known_for_department": "Production",
                "name": "Robert Evans",
                "original_name": "Robert Evans",
                "popularity": 1.4,
                "profile_path": "/rCiTT2VrBKeHWdnHAyfGtMXs9go.jpg",
                "credit_id": "57447b41c3a36807770006ab",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 14059,
                "known_for_department": "Crew",
                "name": "Sass Bedig",
                "original_name": "Sass Bedig",
                "popularity": 0.98,
                "profile_path": nil,
                "credit_id": "57448523925141218f000400",
                "department": "Crew",
                "job": "Special Effects"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 29654,
                "known_for_department": "Costume & Make-Up",
                "name": "Dick Smith",
                "original_name": "Dick Smith",
                "popularity": 1.96,
                "profile_path": "/kKCenlQ8iQCTLGfX8ZPpJFpxvwS.jpg",
                "credit_id": "56a76ff8c3a36819c9002fcb",
                "department": "Costume & Make-Up",
                "job": "Makeup Artist"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 30580,
                "known_for_department": "Art",
                "name": "Philip Smith",
                "original_name": "Philip Smith",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "53884fb2c3a3681ad700458c",
                "department": "Art",
                "job": "Set Decoration"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 81519,
                "known_for_department": "Art",
                "name": "Warren Clymer",
                "original_name": "Warren Clymer",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "53884f8dc3a3681add0044a6",
                "department": "Art",
                "job": "Art Direction"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 81532,
                "known_for_department": "Costume & Make-Up",
                "name": "George Newman",
                "original_name": "George Newman",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "574487b9c3a3680762000a52",
                "department": "Costume & Make-Up",
                "job": "Costume Supervisor"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 81533,
                "known_for_department": "Costume & Make-Up",
                "name": "Marilyn Putnam",
                "original_name": "Marilyn Putnam",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "57448872925141218f000515",
                "department": "Costume & Make-Up",
                "job": "Costume Design"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 51302,
                "known_for_department": "Crew",
                "name": "Joe Bucaro III",
                "original_name": "Joe Bucaro III",
                "popularity": 0.98,
                "profile_path": "/gvJs1YQZRrSbkiSGAiCAugaXyzl.jpg",
                "credit_id": "574486e0c3a368076b000ac6",
                "department": "Crew",
                "job": "Stunts"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 96912,
                "known_for_department": "Crew",
                "name": "Joe Lombardi",
                "original_name": "Joe Lombardi",
                "popularity": 1.012,
                "profile_path": nil,
                "credit_id": "574485a9925141218f000420",
                "department": "Crew",
                "job": "Special Effects"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 718968,
                "known_for_department": "Production",
                "name": "Stephen F. Kesten",
                "original_name": "Stephen F. Kesten",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "5e9250b284448e00148f0783",
                "department": "Directing",
                "job": "Assistant Director"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1318092,
                "known_for_department": "Crew",
                "name": "Paul J. Lombardi",
                "original_name": "Paul J. Lombardi",
                "popularity": 1.616,
                "profile_path": nil,
                "credit_id": "5744865f92514120a70004b3",
                "department": "Visual Effects",
                "job": "Special Effects Supervisor"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1433439,
                "known_for_department": "Crew",
                "name": "Paul Baxley",
                "original_name": "Paul Baxley",
                "popularity": 0.84,
                "profile_path": nil,
                "credit_id": "574486b4c3a3681c760004a9",
                "department": "Crew",
                "job": "Stunt Coordinator"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1518601,
                "known_for_department": "Costume & Make-Up",
                "name": "Phil Rhodes",
                "original_name": "Phil Rhodes",
                "popularity": 1.4,
                "profile_path": nil,
                "credit_id": "56a76fc79251412a04002fa3",
                "department": "Costume & Make-Up",
                "job": "Makeup Artist"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1546904,
                "known_for_department": "Camera",
                "name": "Robert Ward",
                "original_name": "Robert Ward",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "566871e5c3a36836ac0038f7",
                "department": "Camera",
                "job": "Grip"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1547035,
                "known_for_department": "Production",
                "name": "Riccardo Bertoni",
                "original_name": "Riccardo Bertoni",
                "popularity": 1.38,
                "profile_path": nil,
                "credit_id": "57448778c3a3680777000a42",
                "department": "Production",
                "job": "Casting"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1614958,
                "known_for_department": "Crew",
                "name": "Steven Burnett",
                "original_name": "Steven Burnett",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "5744870d92514133d400001b",
                "department": "Crew",
                "job": "Stunts"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1625346,
                "known_for_department": "Production",
                "name": "Ned Kopp",
                "original_name": "Ned Kopp",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "57447c09925141110f000695",
                "department": "Production",
                "job": "Production Manager"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1625347,
                "known_for_department": "Directing",
                "name": "Tony Brandt",
                "original_name": "Tony Brandt",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "5e92510accb15f00156de8d4",
                "department": "Directing",
                "job": "Assistant Director"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 1789636,
                "known_for_department": "Sound",
                "name": "Carl Fortina",
                "original_name": "Carl Fortina",
                "popularity": 0.6,
                "profile_path": nil,
                "credit_id": "58e3cf17c3a3684aa40124b5",
                "department": "Sound",
                "job": "Musician"
            }
        ]
    }
  end

  def review_data
    {
    "id": 238,
    "page": 1,
    "results": [
        {
            "author": "futuretv",
            "author_details": {
                "name": "",
                "username": "futuretv",
                "avatar_path": "/https://secure.gravatar.com/avatar/f44259356bf6110070ed799323d539d6.jpg",
                "rating": 10.0
            },
            "content": "The Godfather Review by Al Carlson\r\n\r\nThe Godfather is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best. As a film that ranks as high as other masterpieces including Citizen Kane, Pulp Fiction and 12 Angry Men, The Godfather is an exceptional piece of cinema excellence that is flawless and is simply the pinnacle crime drama.\r\nThe Godfather revolves around the Corleone’s, an Italian family with deep roots in the New York City mafia. The head of the Corleone’s is Don Vito Corleone, a man who takes care of his family and demands respect in return. His son Michael however, who just returned home from World War II, doesn’t want to become involved with the family business. The Sollozzo’s, a family of drug dealers, confront Don and request protection in exchange for profits from the Sollozzo’s drug sales. But Don declines the offer, for he is against selling narcotics. The rejected offer starts what turns into an all out mafia war between the two families with Michael diving deep into the mafia lifestyle.\r\nThe characters are portrayed by a legendary all-star cast including Marlon Brando as Don, Al Pacino as his son Michael and James Caan as Don’s oldest son Sonny. The casting for this film has been considered by many to be the best casted film in history for their astonishing performances. All three main actors were nominated for an academy award, but only Marlon Brando won an Oscar for best actor in a leading role. It’s fascinating to watch how these characters change over the course of the movie, with one in particular changing drastically.\r\nDirecter Francis Ford Coppola, being raised in an Italian-American family in New York, understood Italian culture exceptionally and made the film very authentically. Everything from the wedding dances to the cuisine to the terms used by the characters in Sicilian come from Coppola’s first-hand knowledge of Italian-American culture. Italian composer Nino Rota did an outstanding job making the soundtrack for the film, despite not getting the Oscar for best music (but he did win an Oscar for his work in the sequel, The Godfather: Part II). Virtually everyone recognizes that iconic trumpet solo once it starts playing. He also wrote the score for another great Italian film 8 1/2. \r\nThis film should be immediately followed up by it’s sequel, The Godfather: Part II, which also won best picture. The series still holds the title of most best picture awards for a film series to this day. They’re both flawless crime dramas and have earned their titles as some of the best pieces of cinema ever. I will guarantee you won’t be able to see this film only once, as it gets better after continual viewings. There is really nothing more to add other than if you haven’t seen this movie yet, it’s about time you did. The Godfather is a movie you can’t refuse.",
            "created_at": "2014-04-10T20:09:40.500Z",
            "id": "5346fa840e0a265ffa001e20",
            "updated_at": "2021-06-23T15:57:25.895Z",
            "url": "https://www.themoviedb.org/review/5346fa840e0a265ffa001e20"
        }
    ],
    "total_pages": 1,
    "total_results": 1
}
  end
end
