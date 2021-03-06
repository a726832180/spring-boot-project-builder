package ${basePackage}.business.web;

import ${basePackage}.business.model.${modelNameUpperCamel};
import ${basePackage}.business.service.${modelNameUpperCamel}Service;
import ${basePackage}.core.common.result.ResponseResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;
import java.util.List;

<#if enabledSwagger>
import io.swagger.annotations.ApiOperation;
</#if>

@Slf4j
@RestController
@ResponseResult
@RequestMapping("${baseRequestMapping}")
public class ${modelNameUpperCamel}Controller {
    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    <#if enabledSwagger>
    @ApiOperation(value = "新增", notes = "添加新数据")
    </#if>
    @PostMapping
    public void add(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel});
    }

<#if enabledSwagger>
    @ApiOperation(value = "删除", notes = "根据主键删除数据")
</#if>
    @DeleteMapping("/{id}")
    public void delete(@PathVariable ${IDType} id) {
        ${modelNameLowerCamel}Service.deleteById(id);
    }

<#if enabledSwagger>
    @ApiOperation(value = "修改", notes = "修改数据")
</#if>
    @PutMapping
    public void update(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
    }

<#if enabledSwagger>
    @ApiOperation(value = "详情", notes = "根据主键查询详情")
</#if>
    @GetMapping("/{id}")
    public ${modelNameUpperCamel} detail(@PathVariable ${IDType} id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return ${modelNameLowerCamel};
    }

<#if enabledSwagger>
    @ApiOperation(value = "列表", notes = "查询分页列表")
</#if>
    @GetMapping
    public PageInfo list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }
}
