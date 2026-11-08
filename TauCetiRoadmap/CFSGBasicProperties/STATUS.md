<!--tauceti-status:v1 {"roadmap":"CFSGBasicProperties","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7","ts":"2026-11-08T16:58:25+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Milestone graph","remaining":"T2 beyond A, B2, C; T3 Ree and Tits; T1 fixed-point root calculus; sporadic simplicity P1-P2; P2M; assembly A0","state":"partial"}],"readme_sha":"6b0c3c893a56e3adf10f43b518d51989eff0594c2eabe061b37b993615c7f120","roadmap":"CFSGBasicProperties","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7"}-->
# Status: CFSGBasicProperties

This file documents the status of the CFSGBasicProperties roadmap up until `a4fcb57` (2026-11-08T16:58:25+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Finiteness is done for every non-sporadic entry: the cyclic, alternating and Lie-type carriers are all finite, and the cyclic and alternating entries are also simple. Simplicity is partial. It is proved for `A_r(q)`, `B₂(q)`, `C_r(q)` and the Suzuki groups, and for none of the other Lie-type families. On the sporadic side, only `M₁₁` has its order and recognition, and the endpoint theorems are not yet assembled.

### Named results

- **Finiteness of every Lie-type group on the list**: [`ValidLieTypeIndex.finite`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/LieTypeFinite.html#TauCeti.ValidLieTypeIndex.finite) shows that the derived central quotient of the Steinberg fixed points is finite for every valid index, including the Tits group. It goes through the [finite-coordinate fixed-point criterion](https://taucetiproject.org/docs/TauCeti/GroupTheory/FixedSubgroup/MatrixCoordinates.html#TauCeti.finite_fixedSubgroup_of_iterate_apply_eq_pow).
- **Simplicity of `A_r(q)`**: [`ValidLieTypeIndex.isSimpleGroup_A`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/TypeA.html#TauCeti.ValidLieTypeIndex.isSimpleGroup_A) identifies each listed `A_r(q)` with `PSL_{r+1}(𝔽_q)` and proves it simple for every valid index, small fields included. The underlying [simplicity of `PSL_n(F)` for `n ≥ 3`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Projectivization/PSL/Simple.html#Matrix.ProjectiveSpecialLinearGroup.isSimpleGroup_of_three_le_card) holds over every field.
- **Simplicity of the Suzuki groups**: [`ValidLieTypeIndex.isSimpleGroup_suzuki`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/Suzuki.html#TauCeti.ValidLieTypeIndex.isSimpleGroup_suzuki) gives the first half-Frobenius family. It uses a rank-one [Tits system on `Sz(q)`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/Suzuki/Simple.html#TauCeti.Suzuki.titsSystem) built from its two-cell Bruhat decomposition.
- **Simplicity of the symplectic families**: [`ValidLieTypeIndex.isSimpleGroup_B_two`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/TypeB/Two.html#TauCeti.ValidLieTypeIndex.isSimpleGroup_B_two) reads the spin carrier of `B₂(q)` as `Sp₄(𝔽_q)`. The source also proves `ValidLieTypeIndex.isSimpleGroup_C`, for `PSp_{2r}(𝔽_q)` in rank at least three.
- **Tits's simplicity theorem**: [`TitsSystem.isSimpleGroup_derivedCentralQuotient`](https://taucetiproject.org/docs/TauCeti/GroupTheory/TitsSystem/NormalClosure.html#TauCeti.TitsSystem.isSimpleGroup_derivedCentralQuotient) is the split-BN-pair criterion T0 asks for. It rests on the normal-subgroup theorem, and its output is phrased directly as the derived central quotient.

### Notable definitions and infrastructure

- **Iwasawa's criterion for the derived central quotient**: [`IwasawaStructure.isSimpleGroup_derivedCentralQuotient`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAction/Iwasawa.html#MulAction.IwasawaStructure.isSimpleGroup_derivedCentralQuotient) is the group-action route that every classical-family proof so far has used.
- **The special unitary fixed points**: [`TypeALieIndex.specialUnitaryEquivFixedPoints`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/TwistedA.html#TauCeti.TypeALieIndex.specialUnitaryEquivFixedPoints) identifies the `²A_r(q)` fixed points with `SU_{r+1}(q)`. Together with the abelian [unitary transvection groups](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Isometry/Transvection.html#Matrix.unitaryTransvectionSubgroup), this supplies most of an Iwasawa structure for the unitary groups.
- **Presentation certificates**: [checked normal-closure programs](https://taucetiproject.org/docs/TauCeti/GroupTheory/Presentation/NormalGeneration.html#TauCeti.NormalClosureProgram.normalClosure_eq_top_of_check), [coset tables certifying an exact index](https://taucetiproject.org/docs/TauCeti/GroupTheory/Coset/Table.html#TauCeti.CosetTable.index_eq_iff_injective) and [Reidemeister–Schreier subgroup presentations](https://taucetiproject.org/docs/TauCeti/GroupTheory/Presentation/Subgroup.html#Subgroup.presentationEquiv) are the first P0 tools. They already give the [order 7920 of the presented `M₁₁`](https://taucetiproject.org/docs/TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/Sporadic/Mathieu/Eleven.html#TauCeti.SporadicName.natCard_group_M11).

### Roadmap coverage

The roadmap's single assessed layer is its milestone graph, and it stands as follows:

- **Done:** E0, F0 and F1.
- **Largely in place:** T0, which has both the Tits criterion and the Iwasawa route, though the full split-BN-pair API for `U`, `B ∩ N` and the product equations is not separately confirmed here.
- **Partial:**
  - T1 has only pieces: fixed-point factorization of Bruhat cells, Lang-map lifting for tori, and the centre of the `E₇` fixed points.
  - T2 covers `A_r`, `B₂` and `C_r` out of thirteen constructors.
  - T3 covers Suzuki only.
  - P0 has normal-closure, coset-table, double-coset and subgroup-presentation certificates.
  - P1 has `M₁₁`'s order and recognition but no simplicity.
- **Barely begun:** P2, with the Leech lattice's [kissing number](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/MinimalVectors.html#TauCeti.kissingNumber_leechLattice) and Coxeter relations for the `Fi₂₄` source.
- **Infrastructure only:** P2M, with class data certified by the class equation via [`ClassData.ofSumIndexCentralizer`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/CharacterTable/Dixon/ClassData/Basic.html#TauCeti.ClassData.ofSumIndexCentralizer).
- **Untouched:** A0.

## The frontier

- **`²A_r(q)` simplicity**: the fixed points, the form and the transvection groups exist. What remains is transitivity on isotropic points, generation by transvections, perfectness including the small cases, and the bridge to `d.Group`.
- **The remaining classical families `B_r` (r ≥ 3) and `D_r`, `²D_r`**: these need orthogonal carriers identified with their fixed points, plus perfectness and an Iwasawa structure, with `𝔽₂` and `𝔽₃` treated at arbitrary rank.
- **`M₁₁` simplicity, then the other P1 names**: the exact carrier is identified with its permutation model. Simplicity needs a normal-closure or primitive-action certificate on that model.
- **Exceptional and twisted families (`G₂`, `F₄`, `E₆`–`E₈`, `³D₄`, `²E₆`, Ree, Tits)**: these await T1's fixed-point root calculus and BN-pairs. The `E₇` centre computation is the only exceptional piece in place, and `.tits` needs its separate ATLAS-model route.
- **Assembly A0**: this is blocked on T2, T3, P1 and P2. The elementary and finiteness branches are ready to be consumed.
