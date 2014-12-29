FROM google/ruby

# Because, the gemspec makes use of the git cli.
RUN apt-get -qy update && apt-get -qy install git && apt-get -y clean

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD minty.gemspec /app/minty.gemspec
ADD lib/minty/version.rb /app/lib/minty/version.rb
ADD bin/minty /app/bin/minty
RUN ["/usr/bin/bundle", "install"]
ADD . /app

ENTRYPOINT ["bundle", "exec", "minty"]
