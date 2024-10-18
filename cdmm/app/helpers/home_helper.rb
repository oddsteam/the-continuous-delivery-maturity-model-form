module HomeHelper
    def get_data_at(table, row_index, col_index)
        if table[:rows].count < row_index + 1
            []
        elsif table[:rows][row_index].count < col_index + 1
            []
        else
            table[:rows][row_index][col_index]
        end
    end

    def label_to_key(label)
        label.gsub(/::/, '__')
            .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
            .gsub(/([a-z\d])([A-Z])/, '\1_\2')
            .downcase
            .gsub(/[^a-z]/, '_')
    end
end
