class CertificatesController < ApplicationController
  
	def show
	 	@data = params[:id].tr('-_','+/').unpack('m')[0]
	 	@year = params[:year]
		render pdf: "urkunde", page_size:  'A4', layout: 'pdf_certificate', margin: { top: 0, bottom: 0, left: 0, right: 0}#, show_as_html: true
	end

end