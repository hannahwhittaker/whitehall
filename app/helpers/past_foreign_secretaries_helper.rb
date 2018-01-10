module PastForeignSecretariesHelper
  def past_foreign_secretary_nav(current_person)
    people = {
      "edward-wood" => "Edward Frederick Lindley&nbsp;Wood",
      "austen-chamberlain" => "Sir Austen Chamberlain",
      "george-curzon" => "George Nathaniel Curzon",
      "edward-grey" => "Sir Edward Grey",
      "henry-petty-fitzmaurice" => "Henry Petty-Fitzmaurice",
      "robert-cecil" => "Robert Cecil",
      "george-gower" => "George Leveson Gower",
      "george-gordon" => "George Hamilton Gordon",
      "charles-fox" => "Charles James Fox",
      "william-grenville" => "William Wyndham Grenville"
    }
    people
      .map { |slug, name|
        content_tag(:li) do
          link_to_if(slug == current_person, name.html_safe, past_foreign_secretary_path(id: slug))
        end
      }
      .join('')
      .html_safe
  end
end
