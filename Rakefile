require 'bundler/gem_tasks'
require 'rdoc/task'
require 'rake/testtask'

task :default => [:test_memory]

desc "Create documentation"
Rake::RDocTask.new("doc") { |rdoc|
  rdoc.title = "bandit - A multi-armed bandit optmization framework for Rails"
  rdoc.rdoc_dir = 'docs'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('players.rdoc')
  rdoc.rdoc_files.include('whybandit.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
}

desc "Run all unit tests"
Rake::TestTask.new("test_all") { |t|
  t.libs << "lib"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
}

desc "Run all unit tests with memory storage"
Rake::TestTask.new("test_memory") { |t|
  t.libs << "lib"
  t.test_files = FileList['test/memory_*.rb']
  t.verbose = true
}

desc "Run all unit tests with memcache storage"
Rake::TestTask.new("test_memcache") { |t|
  t.libs << "lib"
  t.test_files = FileList['test/memcache_*.rb']
  t.verbose = true
}

desc "Run all unit tests with dalli storage"
Rake::TestTask.new("test_dalli") { |t|
  t.libs << "lib"
  t.test_files = FileList['test/dalli_*.rb']
  t.verbose = true
}

desc "Run all unit tests with redis storage"
Rake::TestTask.new("test_redis") { |t|
  t.libs << "lib"
  t.test_files = FileList['test/redis_*.rb']
  t.verbose = true
}

desc "Run unit test for cascading options"
Rake::TestTask.new("test_cascading_options") { |t|
  t.libs << "lib"
  t.test_files = FileList['test/cascading_options_test.rb']
  t.verbose = true
}
