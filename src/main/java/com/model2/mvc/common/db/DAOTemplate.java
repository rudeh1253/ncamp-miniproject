package com.model2.mvc.common.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Deprecated
public abstract class DAOTemplate {
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    protected final void prepareStatement(String sql, PreparedStatementSetter setter) throws SQLException {
        this.conn = DBUtil.getConnection();
        this.stmt = this.conn.prepareStatement(sql);
        setter.set(this.stmt);
    }

    protected final void prepareStatement(String sql, PreparedStatementSetter setter, int autoGeneratedKeys)
    throws SQLException {
        this.conn = DBUtil.getConnection();
        this.stmt = this.conn.prepareStatement(sql, autoGeneratedKeys);
        setter.set(this.stmt);
    }

    protected final ResultSet getGeneratedKeys() throws SQLException {
        return this.stmt.getGeneratedKeys();
    }

    protected final void prepareStatement(String sql, PreparedStatementSetter setter, String[] columnNames)
    throws SQLException {
        this.conn = DBUtil.getConnection();
        this.stmt = this.conn.prepareStatement(sql, columnNames);
        setter.set(this.stmt);
    }

    protected final void setAdditionalData(PreparedStatementSetter setter) throws SQLException {
        setter.set(this.stmt);
    }

    protected final ResultSet executeQuery() throws SQLException {
        this.rs = this.stmt.executeQuery();
        return this.rs;
    }

    protected final int executeUpdate() throws SQLException {
        int num = this.stmt.executeUpdate();
        System.out.println("num=" + num);
        this.conn.commit();
        return num;
    }

    protected final void close() {
        DBUtil.close(conn, stmt, rs);
        conn = null;
        stmt = null;
        rs = null;
    }

    @FunctionalInterface
    protected interface PreparedStatementSetter {
        public void set(PreparedStatement stmt) throws SQLException;
    }
}
