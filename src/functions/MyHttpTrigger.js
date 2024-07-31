const { app } = require('@azure/functions');
const postgres = require('postgres');

app.http('MyHttpTrigger', {
    methods: ['GET', 'POST'],
    authLevel: 'anonymous',
    handler: async (request, context) => {
        context.log(`Http function processed request for url "${request.url}"`);

        const sql = postgres('postgres://postgres:intel@123@localhost:5432/blogging');
        const blogs = await sql`select * from blogs`;

        context.log(blogs);

        const name = request.query.get('name') || await request.text() || 'world';

        return { body: JSON.stringify(blogs) };
    }
});
