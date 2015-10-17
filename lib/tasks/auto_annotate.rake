task :annotate do
  puts 'Annotating models...'
  system 'bundle exec annotate'
end

if Rails.env.to_sym == :development
  Rake::Task['db:migrate'].enhance do
    Rake::Task['annotate'].invoke
  end

  Rake::Task['db:rollback'].enhance do
    Rake::Task['annotate'].invoke
  end
end
