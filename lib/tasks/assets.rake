Rake::Task["assets:precompile"].clear
namespace :assets do
  task 'precompile' do
    puts "#----- Skip asset precompilation -----#"
  end
end
