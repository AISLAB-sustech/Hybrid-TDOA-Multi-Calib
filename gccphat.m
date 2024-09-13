function tau = gccphat(sig, refsig, fs)
    % �����źŵ�FFT
    SIG = fft(sig);
    REFSIG = fft(refsig);
    
    % ���㻥��
    R = SIG .* conj(REFSIG);
    
    % ����GCC-PHAT
    R = R ./ abs(R);
    cc = ifft(R, 'symmetric');
    
    % �ҵ����ֵ��Ӧ��ʱ���ӳ�
    [~, max_idx] = max(abs(cc));
    N = length(sig);
    if max_idx > N / 2
        max_idx = max_idx - N;
    end
    tau = max_idx / fs;
end
