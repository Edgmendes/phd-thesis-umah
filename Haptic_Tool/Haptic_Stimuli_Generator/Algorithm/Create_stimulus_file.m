function [] = Create_stimulus_file(magnitudes, phases, FILE_NAME, nbits)
    
    temporal_length = size(magnitudes, 3);

    fileID = fopen(FILE_NAME,'a');

    if(nbits == 16)
        data_format = 'uint32';
    elseif(nbits == 8)
        data_format = 'uint16';
    end

    for i=1:temporal_length
        mag_aux = dec2bin(magnitudes(:,:,i),nbits);
        ph_aux = dec2bin(phases(:,:,i),nbits);
    
        word = cat(2,mag_aux,ph_aux);
        
        word_dec = bin2dec(word);
        
        fwrite(fileID,word_dec,data_format);
    end
    
    fclose(fileID);

end