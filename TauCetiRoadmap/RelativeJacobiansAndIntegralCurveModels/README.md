# Roadmap: relative Jacobians and integral models of curves

**Summary.** This roadmap connects a curve over the fraction field of a Dedekind base to integral models, Picard sheaves on singular fibres, and reduction of its Jacobian. It constructs the normalization of the projective line in a function field and computes its coherent cohomology from two charts. It extends the Picard interface to fibres with several components and with multiplicities, using finite flat rigidificators when the Picard sheaf itself is not representable. It then constructs the largest separated quotient of the total-degree-zero Picard sheaf, identifies it with the Néron model under Raynaud's hypotheses, and computes specialization through normalized partial degrees and vertical divisors. The final results give regular models over excellent Dedekind bases and reduction maps on divisor classes, with precise torsion-injectivity bounds.

The main arithmetic output is this. Let `C/K` be a smooth proper geometrically connected curve with a K-point, let `S` be an excellent Dedekind scheme with function field `K`, and choose a regular proper flat model `X/S`. The point extends to a section through the smooth locus. The identity open subgroup of the Néron model `N` of `Jac(C)` is `Pic⁰_{X/S}`. At a closed point `s`, a degree-zero divisor class specializes to `N_s`; its component is computed by an intersection-matrix quotient, and, when that component is zero, a vertical correction gives its class in `Pic⁰(X_s)`. Reduction is injective on torsion of order prime to the residue characteristic, and on all torsion in mixed characteristic with absolute ramification index `e < p − 1`. A singular fibre need not have a connected Néron special fibre, even when its total degree is zero.

| Layer | Construction | Principal outputs |
| --- | --- | --- |
| 0 | Dedekind models and normalization charts | Proper sections; normalized projective-line models; explicit `H⁰` and `H¹` |
| 1 | Picard interfaces for arbitrary curve fibres | Geometric multiplicities; rigidificators; representability; universal families and Abel fibres |
| 2 | Pointed smooth families and good reduction | Comparison with the relative Jacobian; actual divisor classes; good-reduction specialization |
| 3 | Separated Picard quotients | Raynaud's quotient, Néron comparison, rational-singularity criterion and global comparison |
| 4 | Reduction and components | Torsion bounds; normalized multidegrees; vertical corrections |
| 5 | Global integral models | Excellent-base regular models and the assembled specialization theorem |

## Scope and ownership

The new mathematics is the passage from field curves and smooth families to integral models with arbitrary curve fibres. The model includes its generic-fibre identification. The Picard constructions distinguish actual line bundles, sheaf classes, rigidified line bundles, total degree zero, and the identity component. The quotient construction includes the case in which the unrigidified Picard sheaf is not an algebraic space. The component computation keeps the geometric multiplicity of a reduced component, which can matter over an imperfect residue field.

**Existing library boundaries.** Mathlib already has relative normalization, integral closure, morphism properties, generic pullback, and categorical kernels and cokernels. Tau Ceti already has `TauCeti.Model` over a DVR, function fields, invertible sheaves, Weil divisors, coherent-sheaf cohomology objects, Mayer–Vietoris exactness, and the abstract group `TauCeti.NumericalType.Pic`. These are inputs. Tau Ceti also supplies `RigidifiedLineBundle`, `rigidifiedPicardFunctor`, `LineBundleClass.picZero`, the divisor-class comparison `SchemeWeilDivisor.map_picZero`, and two-affine higher-cohomology vanishing. Its `Scheme.IdealSheafData.IsRelativeEffectiveCartier` and `relativeEffectiveCartierSubfunctor` already give the relative divisor notion, arbitrary pullback and the empty divisor. Their definitions and theorems are also inputs; this roadmap adds the comparisons and generality stated below. In particular, an abstract numerical Picard group is not already a geometric component-group theorem.

**Existing roadmap boundaries.** JacobianChallenge supplies field divisor theory, coherent cohomology, the field Jacobian, relative effective Cartier divisors and symmetric powers of a fixed smooth proper geometrically integral field curve. The varying-family symmetric powers are constructed in §1.6. JacobianChallengePartII supplies the positive-genus relative Jacobian, its arbitrary base change, principal polarization, smooth-family Abel maps and the signed Poincaré bundle on `J × J`. The smooth-family targets below transport that existing object to the section-rigidified and arithmetic interfaces; they do not construct another Jacobian. Genus zero is included explicitly. AlgebraicModuliForArithmeticGeometry supplies the relative Picard sheaf, section splitting, infinitesimal obstruction theory and the degree-one Raynaud criterion. ComplexComparisonPartII supplies representability under universal global functions, the Picard–Brauer obstruction and Picard identity components. The more general cohomologically flat criterion is a target of §1.4. SchemeAndStackFoundations supplies algebraic spaces, group spaces, torsors, descent and Brauer cohomology. ReductiveGroupsPartII supplies quotients of group **schemes** over bases of dimension at most one, and Lang's theorem. The two algebraic-**space** bridges needed in §1.8 are stronger contracts and are built here.

AlgebraicModuliForArithmeticGeometry §§7.6.1–7.6.1a already supplies section-rigidified representatives and `sectionPicardSplit` under universal global functions; §1.5 uses that comparison in the section case of its universal-family interface. AlgebraicVectorBundles L1A–L1B supplies relative `Spec`, including symmetric algebras and their arbitrary base change; §1.3 constructs the cohomological corepresenting module and the unit sequence using that construction. ModularCurves `0A` supplies the relative-Cartier fibre criterion, properness-to-finiteness theorem, degree as finite-flat rank and divisor operations; `0B` supplies annihilation of a finite locally free commutative group by its rank. Its Layer 10 supplies compactified coarse curves as normalizations of the j-line over `Z[1/N]` for prime `N ≥ 5` and `H ≤ (Z/NZ)^×/{±1}`; the modular comparison in §0.3 preserves that existing object's generic marking.

NeronModelsAndSemistableAbelianVarieties supplies Néron models and their mapping property, existence and uniqueness for abelian varieties, étale base change, identity components, and the regular semistable Picard comparison. Its §4.7 also supplies the regular, algebraically closed residue-field, multiplicity-gcd-one comparison, including the usual intersection presentation. Those cases are cited, not planned again. Layer 3 supplies the arbitrary-normal-model separated quotient and the extension of the comparison under the hypotheses stated there. Layer 4 supplies the normalized imperfect-residue-field component computation and the multiplicity-gcd-greater-than-one argument. StableReduction supplies local regular models and the established curve-cohomology and singularity machinery; §5.1 adds the global excellent-base normalization-and-resolution bridge.

HeightsRationalPointsAndObstructions §1.18 supplies torsion specialization for an abelian variety over a number field at good reduction. The general separated-group theorem in §4.2 includes arbitrary DVRs and bad reduction; §4.3 retains the full Néron special fibre in its order bounds. The good-reduction result is a compatibility boundary, not a prerequisite for either generalization.

Stable reduction after ramified extension, monodromy pairings, minimal discriminants, Deligne–Rapoport modular-curve models, Ogg's formula, height comparisons and Galois representations are owned by their respective roadmaps. They consume the model and specialization interfaces here. No assertion below identifies the base change of a bad-reduction Néron model with a Néron model after an arbitrary ramified extension.

## Conventions

A **Dedekind base** is an integral noetherian normal scheme `S` of dimension at most one. Write `η = Spec K` for its generic point. If `dim S = 1`, the local ring at a closed point is a DVR; if `dim S = 0`, `S` is a field and there is no trait special-fibre calculation. A relative curve is a flat finitely presented morphism whose nonempty fibres are pure of dimension one. Models may have other relative dimensions when explicitly stated; statements about the generic Jacobian specify a proper one-dimensional generic fibre. Properness, regularity and geometric connectedness are never included silently in the word model.

`Pic(X)` is the group of actual isomorphism classes of invertible sheaves. `Pic_{X/S}` is the fppf sheaf associated to `T ↦ Pic(X_T)/f_T*Pic(T)`. A sheaf section need not be represented by a global line bundle. A rigidification on `Y_T` is an isomorphism `O_{Y_T} ≅ L|_{Y_T}`; an isomorphism of rigidified bundles must preserve it. Pullback and tensor products include their canonical comparison isomorphisms. Universal global functions means `O_T ≅ (f_T)_*O_{X_T}` for every base change `T → S`, a stronger condition than `f_*O_X = O_S` on `S` alone.

The fibre degree is `deg L = χ(L) − χ(O)`, with Euler characteristic taken over the specified residue field. For a fibre with reduced components `C_i` and multiplicities `d_i`, put `deg_i L = deg(L|_{C_i})`; then `deg L = Σ_i d_i deg_i L`. `Pic^{[r]}` denotes the sheaf of constant **total** fibre degree `r`. `Pic⁰` denotes the fibrewise identity component when that open subgroup exists. On a geometrically integral fibre they agree for `r = 0`; on a reducible fibre `Pic^{[0]}` is larger. Locally varying degrees on disconnected test schemes are handled by open-and-closed decompositions, not by imposing one integer globally.

Let `e_i` be the geometric multiplicity of the reduced component `C_i`, `d_i` its multiplicity in the fibre, and `δ_i = d_i e_i`. Set `δ = gcd_i δ_i`, called the geometric multiplicity gcd. It is not the index defined as the gcd of degrees of all closed points. In the component formula, the lattice coordinate of `L` is `ρ_i(L) = deg_i L/e_i`, and the degree map is `β(a) = Σ_i δ_i a_i`. The matrix acts on **column** vectors, with `α_{ij} = (C_i · C_j)/e_i`. Thus `ρ(O_X(C_j))` is column `j` of `α` and `β α = 0`. The intersection matrix before row division is symmetric; `α` generally is not.

The two-open differential is `d(a,b) =` a| − b|, in the order `U`, `V`. On `P¹_R`, choose `t` on `U` and use the U-trivialization to embed the V-sections of `O(n)` as `tⁿR[t⁻¹]` in `R[t,t⁻¹]`. Thus `d(a,b) = a − tⁿb`. Projectivization `P(Q)` classifies invertible **quotients** of `Q`. When `Q` corepresents sections of `L` and `f_*L` is locally free, `Q = (f_*L)∨`; this dual is essential for the linear-system fibre convention.

For a group scheme, reduction restricts a section to the residue field and sends the identity to the identity. `N⁰` is the identity **open subgroup**, including the generic fibre. `Φ = N_k/N⁰_k` is an étale component group scheme; `Φ(k)` consists of invariant geometric components, whereas `N_k(k) → Φ(k)` need not be onto. The residue characteristic exponent is `p = 1` in characteristic zero and the residue characteristic otherwise. The inequality `e < p − 1` is used only in mixed characteristic (0,p), with `e = v_R(p)` and `v_R(π) = 1`.

## Exact supplier contracts

These are mathematical prerequisites, with their precise range. A specification in another roadmap is not a claim of implementation at the pins.

| Supplier | Contract used here |
| --- | --- |
| Mathlib relative normalization, `Scheme.Hom.normalization`, `Scheme.Hom.normalizationDesc`; integral-closure localization | Affine relative normalization is `Spec` of the integral closure in the source algebra; it maps uniquely to every integral intermediate factorization compatible with the source. Integral closure commutes with localization. Normal-model factorization with a fixed function field and finiteness are separate assertions. |
| Mathlib morphism properties and `Over.pullback`; Tau Ceti `genericFiber`, `genericFiberι`, `TauCeti.Model` | Flat, finitely presented models over DVRs with a chosen generic identification and morphisms inducing that identification. The Dedekind interface agrees with this existing category locally. |
| Tau Ceti `Scheme.Modules.Cohomology`, `cohomologyOn`, `cohomologyOnRes`, `mayerVietorisSequence_exact` | Actual sheaf-cohomology objects and the ordered restriction-difference exact sequence in abelian groups. The scalar-compatible two-chart kernel and cokernel descriptions are §0.5. |
| Tau Ceti `AlgebraicGeometry.Scheme.Modules.subsingleton_cohomology_of_two_le_of_isAffineOpen` | For locally noetherian `X` and quasi-coherent coefficients, a two-affine cover with affine intersection gives vanishing in degrees at least two. The general acyclic-cover version is already available at the pin. |
| Tau Ceti `RigidifiedLineBundle`; `rigidifiedPicardFunctor` | Line bundles rigidified along a specified morphism, their classes and pullbacks, and the functor rigidified along a section. They do not identify that functor with the relative Picard sheaf and do not give the general finite-flat rigidificator criterion. |
| Tau Ceti `LineBundleClass.picZero`, `SchemeWeilDivisor.map_picZero` | For proper integral regular noetherian field curves of dimension at most one, the Euler-degree-zero actual Picard group agrees with degree-zero divisor classes. §2.3 adds its Jacobian-valued and Galois-natural interpretation. |
| AlgebraicVectorBundles, L1A–L1B | Relative `Spec` of quasi-coherent algebras, its functor of points, symmetric-algebra specialization, restriction and arbitrary base change. The cohomological module `Q_X` and its unit locus in §1.3 are the additional objects. |
| AlgebraicModuliForArithmeticGeometry, §§7.6.1–7.6.1a | The section-rigidified Picard interface and `sectionPicardSplit`, assuming universal global functions. The finite-flat rigidificator and universal-family comparisons here include cases without a section. |
| ModularCurves, Layers `0A`, `0B`, 10 | The finitely presented flat relative-Cartier fibre criterion, its limit/descent version, finiteness under properness, finite-flat degree and divisor operations; annihilation of a finite locally free commutative group by its rank; and the identification of `X_H` over `Z[1/N]` with normalization of the j-line for prime `N ≥ 5` and `H ≤ (Z/NZ)^×/{±1}`, without a supplied irreducibility assertion. §1.6 adds the Hilbert open-locus comparison, and §0.3 adds the marked-model comparison. |
| Tau Ceti `EffectiveCartierDivisor.Relative`, `EffectiveCartierDivisor.Functor` | `Scheme.IdealSheafData.IsRelativeEffectiveCartier`, its `comap_of_isPullback`, and `TauCeti.AlgebraicGeometry.relativeEffectiveCartierSubfunctor` supply relative divisors, arbitrary base change and the empty divisor. §1.6 adds fixed-degree pieces as arbitrary-fibre Hilbert open loci. |
| Tau Ceti `NumericalType.Pic`, `NumericalType.degree` | A quotient of a supplied integral lattice by its intersection relations, with a supplied weight vector and degree map. Identifying that input with geometric data, including its weights, is §4.4. |
| AlgebraicCurves, Layer 2 and the normalization/places part of Layer 12 | Integral-closure affine models of one-variable function fields, the field normal projective curve and its closed-point/place dictionary. §0.3 globalizes the construction over a Dedekind base. |
| JacobianChallenge, Layers A–C | Actual Picard groups, divisor/line-bundle and degree comparisons, Riemann–Roch and curve cohomology, relative effective Cartier divisors, coherent base change and symmetric powers of a fixed smooth proper geometrically integral field curve. §1.6 supplies symmetric powers for varying smooth proper relative curves. |
| JacobianChallenge, Layers D–F; JacobianChallengePartII, Layers 0–2 | The field Jacobian and pointed universal property; for positive-genus smooth projective families over a noetherian base, Picard degree components, the abelian scheme `Pic⁰`, arbitrary base change and Abel maps. Genus zero and the integral-model comparisons are specified here. |
| AlgebraicModuliForArithmeticGeometry, §§7.3, 7.6.1–7.6.1a, 7.9 | `relativePicardSheaf` and `relativePicardBaseChange`; `relativePicardKernel`, `sectionPicardSplit` and section-rigidified representatives under universal global functions; `picard_infinitesimal_lifting`; `spaceSectionComponentCriterion`; and `RaynaudNStar` with `raynaud_degree_one_cohomologicallyFlat`. The degree-one criterion is an input to §3.2, not a replacement for its multiplicity-gcd argument. |
| ComplexComparisonPartII, §§C3.2d.2–C3.2d.4, C3.2f.1–C3.2f.2 | `relative_picard_algebraicSpace` under universal global functions, `relative_picard_separated` for geometrically integral fibres, `picard_brauer_obstruction`, `picardZeroSheaf` and `picardZeroCriterion`. These do not assert representability for every cohomologically flat family; §1.4 supplies that wider criterion and the finite-flat-rigidificator theorem. |
| AlgebraicModuliForArithmeticGeometry, §2.1; SchemeAndStackFoundations, §4.14 | `hilbertFunctorAsQuot` and its finite-rank subfunctors; `hilbert_quot_schemes` for projective families over noetherian bases. The proper-family algebraic-space extension and its open relative-Cartier locus are targets of §1.6. |
| SchemeAndStackFoundations, §§1.1–1.6, 1.13–1.17, 2.22, 3.5–3.7, 4.1, 4.6, 4.11–4.14 | Algebraic spaces and group spaces, fppf sheaves and torsors, descent of invertible sheaves, cohomological Brauer groups, curve Picard interfaces, infinitesimal lifting and curve/surface modification foundations. |
| ReductiveGroupsPartII, §RG2.3.1 | For a locally noetherian base of dimension at most one, an fppf quotient `G/H` of a locally finite-type group scheme by a closed flat subgroup is a scheme; smoothness and quotient maps have the stated descent properties. Algebraic-space groups require §1.8. |
| ReductiveGroupsPartII, §RG2.3.7, `finite-level-jet-realizations` (`jetScheme`) | Ordinary finite-level Greenberg/jet schemes for affine finite-type local-field models, their ring coordinates, truncations, group laws and effectivity of compatible geometric points. §4.4 extends this construction to arbitrary complete DVRs with algebraically closed residue field and to locally finite-type schemes and smooth group spaces. |
| ReductiveGroupsPartII, §RG2.3.7 | Lang surjectivity and `H¹(F_q,H) = 0` for smooth connected finite-type groups over a finite field. Used to lift rational components in §4.1. |
| AbelianSchemesAndArithmeticModuli, A0.1, A1–A2 | Abelian schemes, duality and normalized universal bundles, with their scheme-level pullback comparisons. No polarization or `J × J` Poincaré sign is redefined here. |
| NeronModelsAndSemistableAbelianVarieties, §§1.1–1.10, 2.1–2.2 | The full smooth-test Néron mapping property, marked finite-type models, uniqueness, abelian-scheme comparison, global existence for abelian varieties, identity open subgroups, component group schemes (§2.2), and étale base change. |
| NeronModelsAndSemistableAbelianVarieties, §§3.8–3.9, 4.7 | The regular semistable comparison; and, over algebraically closed residue fields with multiplicity gcd one, the regular-model Picard quotient and usual component presentation. The new generality is stated in Layers 3–4. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, §§R07.1.2, R07.1.20, R07.1.30 | Étaleness for finite flat groups of invertible order, closure of a generic subgroup in a finite flat group, and full faithfulness of generic fibre for finite flat commutative p-groups when `e < p − 1`. Rank-annihilation is supplied by ModularCurves `0B`. The finite closure inside an arbitrary separated finite-type group in §4.2 is justified there. |
| StableReduction, Layers 2–5 | Coherent cohomology and base change for curve families, ordinary-double-point and regularity interfaces, local resolution and regular proper models over excellent traits. The finite global modification in §5.1 is the additional target. |

The pinned module contracts are `Mathlib.AlgebraicGeometry.Normalization` (`Scheme.Hom.normalization`, `Scheme.Hom.normalizationDesc`, `Scheme.Hom.normalizationObjIso`) and `Mathlib.RingTheory.Localization.Integral` (`IsLocalization.Away.integralClosure`); `TauCeti.AlgebraicGeometry.Fibers` (`TauCeti.genericFiber`, `TauCeti.genericFiberι`); and `TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic` (`TauCeti.Model`, `TauCeti.Model.IsProper`).

For cohomology use `TauCeti.AlgebraicGeometry.Cohomology.Basic` and `TauCeti.AlgebraicGeometry.Cohomology.MayerVietoris`: the full declaration namespace is `TauCeti.AlgebraicGeometry.Scheme.Modules`, except that `AlgebraicGeometry.Scheme.Modules.subsingleton_cohomology_of_two_le_of_isAffineOpen` is in the root namespace. For rigidification use `TauCeti.AlgebraicGeometry.LineBundle.Rigidified.Basic` and `TauCeti.AlgebraicGeometry.PicardFunctor.Rigidified`; `TauCeti.AlgebraicGeometry.RigidifiedLineBundle.rigidification` has direction `s*L ≅ O`, so the convention `O ≅ s*L` here uses its inverse, without introducing another bundle type. For actual degree-zero classes use `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.PicZero`, including `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero` as the equivalence supplied by `map_picZero`. The numerical Picard group and degree are `TauCeti.NumericalType.Pic` and `TauCeti.NumericalType.degree` in `TauCeti.AlgebraicGeometry.Curves.StableReduction.Picard.Basic`; they retain their supplied weight convention.

## How to read the build

Layer 0 can be used independently for explicit arithmetic surfaces: integral-closure charts produce the model and their overlap computes `H¹`. Layer 1 supplies the line-bundle moduli needed even when `f_*O` fails universal base change. Layer 2 compares the smooth pointed case with the established Jacobian and fixes specialization there. Layer 3 uses the rigidified presentation to construct `P/E` without assuming that `P` is represented, proves the extra finiteness and mapping properties needed for a Néron model, and globalizes that comparison. Layer 4 computes the actual reduction homomorphism and its component and torsion information. Layer 5 combines these interfaces for a pointed curve over an excellent Dedekind base.

The quotient is constructed before its Néron property is asserted. The component proof for multiplicity gcd greater than one contains a finite-level Greenberg argument, specified in §4.4; surjectivity on integral points alone is not a representability or smooth-test argument. All source statements below are used only in the indicated range of hypotheses. References to BLR use the printed page numbers of the 1990 edition of *Néron Models*.

## Layer 0: Dedekind models and two-chart cohomology

### 0.1 Models with a fixed generic fibre

Define `DedekindModel` for a K-scheme `C` over an integral Dedekind base `S` as a flat finitely presented `f : X → S` together with a K-isomorphism `ι : X_η ≅ C`. A morphism `φ : X → X′` is over `S` and satisfies `ι′ φ_η = ι`. Identity and composition give a category. The generic identification is data; two choices need not define isomorphic models through the identity on the total space. On `Spec R` the definition uses `TauCeti.genericFiber`; over a DVR its category is equivalent to `TauCeti.Model`, preserving total spaces and generic markings.

The API has `total`, `toBase`, `genericIso`, `fiber`, `genericHom`, `Hom.overBase`, `Hom.generic`, `Hom.ext`, and predicates `IsProper`, `IsSeparated`, `IsNormal`, `IsRegular`, `IsSmooth`. Here normal and regular refer to `X`, while flat, proper and smooth refer to `f`. Include restriction to open bases, localization at height-one points, and dominant Dedekind base change together with its fraction-field comparison. Any such base change is flat locally on the base; finite presentation is stable under it. Prove `isProper_iff_localize`: the model is proper if and only if its base change to every closed-point local ring is proper, including the field case in which the sole closed point is the generic point. Descend properness from these localizations by spreading out the finitely presented morphism and using locality on `S`. A morphism into a separated model is determined by its generic restriction because a flat source over an integral base has schematically dense generic fibre. This gives uniqueness of gluing maps, not existence of extensions of arbitrary generic morphisms.

**Checks.**

- `P¹_Z` with its standard Q-identification is a proper smooth model and has fibre `P¹_Fp` at `p`.
- Over a field base the marking gives the unique isomorphism with `C` inducing that marking. The field-base Lean example uses the generic-fibre inclusion and the specified marking to construct this isomorphism over the field.
- On a DVR, the proved API theorems `DedekindModel.ofModel_toBase`, `DedekindModel.ofModel_genericFiberIso` and `DedekindModel.ofModel_isProper` preserve the structure morphism, marking and properness. A second Lean example twists the marking by a nonidentity automorphism and proves that it changes the marked model through the identity on the total space.
- `Spec Z[x]/(2x)` has generic fibre `Spec Q` but contains nonzero 2-torsion and is excluded by flatness; `DedekindModel.nonflat_twoX` states this on the actual affine scheme.
- `A¹_Z` is a model with a separated structure morphism and is not proper; `DedekindModel.affineLine_flat_separated_notProper` states flatness, finite presentation, separatedness and failure of properness for its polynomial-ring structure map.

*Source:* the DVR comparison is with `TauCeti.Model`; the Dedekind extension follows by gluing this data and the flatness criterion in Stacks, Lemma 15.22.11, [tag 0AUW](https://stacks.math.columbia.edu/tag/0AUW). Properness spreads from a closed-point localization by Stacks, Lemma 32.13.1, [tag 081F](https://stacks.math.columbia.edu/tag/081F); use the supplied finite-presentation limit formalism. The marking and morphism convention are retained exactly.

*Needs:* Mathlib scheme morphism properties and pullback; Tau Ceti `genericFiber`, `genericFiberι`, `Model` and its marked morphisms; SchemeAndStackFoundations, §0.9, for spreading out finitely presented morphisms from local rings.

### 0.2 Sections and specialization on proper models

Prove `properModel_sections` (the affine-base Lean milestone is `DedekindModel.existsUnique_section`): for a proper model, restriction gives `X(S) ≅ C(K)`. More generally, for any dominant map of integral Dedekind schemes `S′ → S`, with function field `K′`, the base-changed proper model satisfies `X(S′) ≅ C(K′)`. Over every height-one point use the valuative criterion of properness; the local sections extend to neighbourhoods by finite presentation and agree on overlaps by separatedness and generic density. Treat the field-base case directly instead of calling its local ring a DVR.

Define `specializePoint_s : C(K) → X_s(κ(s))` by restricting the unique section. Its API includes generic restriction, compatibility with model morphisms, restriction of `S`, localization, and dominant Dedekind base change at a specified point above `s`. If `X` is regular, every section factors through the smooth locus of `f`. This gives `specializePoint_mem_smooth`, including after étale localization. The proof uses the regular total space and the valuation-one parameter along the section; normality alone does not suffice.

**Checks.**

- A rational point [a:b] of `P¹_Q` specializes at `p` by choosing a p-integral pair with at least one coordinate a unit; [1:p] specializes to [1:0].
- The point `1/2` of `A¹_Q` has no section of `A¹_Z`, detecting the properness hypothesis.
- In xy `= π` over a DVR, an R-section has at least one coordinate a unit and avoids the node.
- In the normal surface xy `= π²`, the section `x = y = π` meets the singular point; this excludes replacing regularity by normality.
- An étale extension of DVRs gives the same specialized point after extending the residue field.

*Source:* the valuative criterion of properness; BLR §3.1, Proposition 2, p. 61, for the smooth-locus assertion. This is a scheme-valued section theorem, not the Néron mapping property for arbitrary smooth test schemes.

*Needs:* §0.1; Mathlib properness and separatedness; the regularity/smooth-locus interface of StableReduction, Layers 3–4.

### 0.3 Normalization of the projective line in a function field

Let `F/K` be a one-variable function field and `t ∈ F` transcendental over `K`. Define `normalizedProjectiveLine(F,t)` as the relative normalization of `P¹_S` in `Spec F`, where the map identifies `K(t)` with the rational-function field of the generic projective line through the chosen coordinate. Its structural map `ν` to `P¹_S` is integral; finiteness is a separate input in §0.4. On an affine base `Spec R`, let `A₀`, `A∞` and `A₀∞` be the integral closures in `F` of `R[t]`, `R[t⁻¹]` and `R[t,t⁻¹]`. The two affine pieces `Spec A₀` and `Spec A∞` glue along `Spec A₀∞`, using `A₀[t⁻¹] = A₀∞ = A∞[t]`. The chart comparison is an equality of integral subalgebras of `F`, with the corresponding localization isomorphisms.

The API gives the generic-point map, function-field identification, integral normalization map, both chart open immersions, intersection comparison, restriction to an affine base and uniqueness of the gluing. Keep two universal properties distinct. For any integral intermediate factorization `Spec F → Z → P¹_S`, relative normalization gives a unique compatible map **`normalizedProjectiveLine(F,t) → Z`**. For a dominant normal integral `Z → P¹_S` with function field identified with `F` over `K(t)`, integral closedness of its local rings instead gives a unique compatible map **`Z → normalizedProjectiveLine(F,t)`**. In the second assertion the specified function-field identification is essential; a map `Spec F → Z` alone does not suffice. Integral closure commutes with localization of `R`, hence so do the charts. Étale base change is handled using its normality property; when `F ⊗_K K′` splits, use the normalization in the resulting product of fields and the corresponding components, not an invented fraction field of a non-domain.

Coordinate independence has two ranges. Over `K` the normal proper curve with function field `F` is independent of the transcendental parameter. Over `R`, a change of `P¹`-coordinates extending to an R-automorphism gives the corresponding isomorphism of marked models. A change defined only over `K` need not extend to an isomorphism over `R`.

For prime `N ≥ 5` and `H ≤ (Z/NZ)^×/{±1}`, prove `modularNormalization_markedComparison` componentwise for ModularCurves, Layer 10. For an integral component `Y` of its normal coarse curve `Y_H`, let `F = Q(Y)` and `t = j`. The constructed model over `S = Spec Z[1/N]` identifies with the corresponding component of `X_H`, preserving the j-map, generic marking and normalization charts. Use the supplied finite normal identification over the affine j-line and density of the generic point to compare the integral closures, then glue. If `Y_H` is integral this is the comparison for `X_H` itself; otherwise retain the product of component function fields. This does not infer irreducibility from the supplier or characterize a compactification by an unspecified extension of its j-map.

**Checks.**

- For `F = K(t)`, the charts are `R[t]` and `R[t⁻¹]`, recovering `P¹_R`.
- For `S = Spec K` they recover the regular projective function-field curve and its finite places on the first chart.
- Over a DVR, `t` and `πt` both produce total spaces `P¹_R`, but the identity on `F` does not extend to an isomorphism between the marked models: the rational map `t ↦ πt` has an indeterminacy at infinity and contracts the rest of the special fibre.
- A `GL₂(R)` coordinate change does extend.
- Over a field of characteristic different from 2, normalize `P¹_t` in `F = K(u)`, `t = u²`. The integral intermediate model `P¹_t` receives the degree-two map from `P¹_u`; it does not map to `P¹_u` over `P¹_t`. Conversely every normal model with the identified function field `K(u)` maps to its normalization. This fixes both universal-property directions and the function-field hypothesis.
- For a separable constant extension `F =` K′(t), base change to a splitting field produces several components, so the base-change statement must allow a product of fields.

*Source:* Stacks, Definition 29.54.3 and Lemma 29.54.4, [tags 035H](https://stacks.math.columbia.edu/tag/035H) and [035I](https://stacks.math.columbia.edu/tag/035I), and §29.54, [tag 0BAK](https://stacks.math.columbia.edu/tag/0BAK), for relative normalization and its affine descriptions. The field curve and place comparison is AlgebraicCurves, Layer 12, based on Stacks, Theorem 53.2.6, [tag 0BY1](https://stacks.math.columbia.edu/tag/0BY1).

*Needs:* §0.1; Mathlib relative normalization and integral closure; AlgebraicCurves, Layers 2 and 12; ModularCurves, Layer 10, only for the modular marked comparison.

### 0.4 Finiteness, model properties and constants

Assume `ν` is finite. This holds when `S` is Nagata, in particular excellent, and it also holds when `F/K(t)` is finite separable: on each chart use finiteness of integral closure of a normal noetherian domain in a finite separable extension of its fraction field. Examples of excellent Dedekind bases include rings of integers of number fields and their localizations. Characteristic zero alone is not an excellence hypothesis.

Prove `normalizedProjectiveLine_isModel`: the total space is integral, normal and noetherian of dimension `dim S + 1`, and the map to `S` is proper, flat and finitely presented. Finite `ν` gives properness and noetherianity; torsion-freeness on affine charts gives flatness over the Dedekind base. Its generic fibre is the regular proper field curve `C_F` of AlgebraicCurves. Over an imperfect field, regular is not a synonym for smooth. Retain that distinction until a smooth generic curve is explicitly assumed.

On `S = Spec R`, let `K_c` be the algebraic closure of `K` inside `F`. Prove `globalFunctions_constants`: `Γ(X,O_X)` is the integral closure of `R` in `K_c`, as a subring of `F`. Properness makes `Γ` finite over `R`; a function on the generic proper curve is a constant in `K_c`, and normality supplies the integral extension in the reverse direction. This equality localizes and therefore determines `f_*O_X`. If `K` is algebraically closed in `F` it gives `f_*O_X = O_S`; it does not by itself assert universal cohomological flatness. Closed points of the generic fibre correspond to the places of `F/K` with their residue fields, and degree-one places give sections by §0.2.

**Checks.**

- For the rational function field the global-functions ring is `R` and the model is `P¹_R`.
- For `F = Q(√2)(t)` over `R = Z` it is `Z[√2]`, so replacing the constant field by `Q` gives the wrong answer.
- If `ν` is merely integral, the finite-presentation and proper-model conclusions have not been justified.
- A field base has total dimension one, while a trait base has dimension two.
- A regular generic curve over an imperfect field is allowed here even when it is not geometrically regular.

*Source:* Stacks §29.54, especially the Nagata finiteness statement, [tag 0BAK](https://stacks.math.columbia.edu/tag/0BAK); Lemma 10.161.8, [tag 032L](https://stacks.math.columbia.edu/tag/032L), for the finite separable extension argument; Lemma 15.22.11, [tag 0AUW](https://stacks.math.columbia.edu/tag/0AUW), for Dedekind flatness. The field normal-curve regularity comparison is Stacks §33.41, [tag 0C45](https://stacks.math.columbia.edu/tag/0C45). The constants computation is the properness/normality argument just given, using the existing field-curve global-functions theorem.

*Needs:* §§0.1–0.3; AlgebraicCurves, Layer 12; JacobianChallenge, Layer B, for finiteness of proper coherent cohomology in the field case.

### 0.5 The ordered two-chart kernel and cokernel

For a scheme `X` with open cover `U ∪ V = X`, define `twoChartDifferential` on any `O_X`-module `M` by the difference of restrictions `H⁰(U,M) ⊕ H⁰(V,M) → H⁰(U ∩ V,M)`. Global sections identify canonically with its kernel; this degree-zero assertion needs neither quasi-coherence nor affineness. If `U`, `V` and `U ∩ V` are affine and `M` is quasi-coherent, prove `twoChart_cohomologyOne`: `H¹(X,M)` is canonically its cokernel. The isomorphism is induced by the Mayer–Vietoris connecting map, not an arbitrary abstract isomorphism. Record `Γ(X,O_X)-linearity`, naturality in `M`, and compatibility with flat affine base change, including the identifications of chart sections after tensoring.

For arbitrary `U` and `V` satisfying the affine hypotheses, the cokernel describes `H¹(U ∪ V,M)`; the covering equality identifies this union with `X` when needed. The Lean milestones `TwoChart.cohomologyZero` and `TwoChart.cohomologyOne` specify the underlying abelian-group isomorphisms together with the equations identifying the kernel inclusion and the connecting map. The chart/scalar comparison additionally retains its R-module structure.

The API gives `d_first`, `d_second`, `d_diagonalRestriction`, `kernelIso`, `cokernelIso`, `connecting_eq_quotient`, `map_coefficients` and `flatBaseChange`. Cover order is part of the convention: swapping `U` and `V` changes the differential by a minus sign and conjugates the comparison by the corresponding sign on the overlap.

**Checks.**

- The first inclusion into the direct sum followed by `d` is restriction from `U`; the second is **minus** restriction from `V`.
- Equal restrictions give a kernel element; replacing the minus by a plus would fail for a nonzero section over `Z`.
- For `O(n)` on `P¹_R` the differential is `a − tⁿb`, `H⁰` has basis `t^j` with `0 ≤ j ≤ n`, and `H¹` has basis `t^j` with `n < j < 0`; empty ranges give zero. In particular `H¹(O(−2)) = R·t⁻¹`, so the theorem does not assert `H¹` vanishing.
- For the two principal-affine cover of `A²_k` minus the origin, the class `x⁻¹y⁻¹` survives in `H¹(O)`, also distinguishing a cokernel from the zero group.
- Flat extension of `R` carries the displayed bases and the differential to their scalar extensions.

*Source:* Tau Ceti `mayerVietorisSequence_exact`, with its difference sign; Stacks, Lemmas 30.2.2 and 30.2.6, [tags 01XB](https://stacks.math.columbia.edu/tag/01XB) and [01XD](https://stacks.math.columbia.edu/tag/01XD), for affine acyclicity and the affine-cover Čech comparison. The explicit `O(n)` calculation follows by separating Laurent monomials.

*Needs:* Tau Ceti `mayerVietorisSequence_exact`; Mathlib categorical kernels/cokernels and sheaf sections; JacobianChallenge, Layers B–C, for coherent comparison and flat base change.

### 0.6 Integral-closure cohomology and fibre jumps

For the finite model in §0.4 over `Spec R`, identify `H⁰(X,O_X)` with `A₀ ∩ A∞` inside `F`, and `H¹(X,O_X)` with `A₀∞/(A₀ + A∞)`. The second is a quotient of R-modules; `A₀ + A∞` is a sum of additive submodules, not a sum of ideals of the overlap algebra. These isomorphisms use the inclusions into `F` and the chosen order of the two charts. They are compatible with localization of `R` and flat extension whenever the accompanying normalization-chart comparison applies.

Prove finiteness of `H¹` over `R` and identify its generic rank with `dim_K H¹(C_F,O)`. If `K` is algebraically closed in `F`, this dimension is the usual genus and `χ(O_C) = 1 − g`. For nontrivial constants distinguish the arithmetic genus `1 − χ` from `dim H¹`; the latter is still the rank in the formula.

At a height-one point `s`, write `H¹(X,O)_s ≅ R_s^r ⊕ T_s` with `T_s` finite torsion. Then `dim_{κ(s)} H¹(X_s,O) = r + dim_{κ(s)}(T_s/πT_s)`. The degree-zero base-change sequence is

`0 → H⁰(X,O)_s ⊗ κ(s) → H⁰(X_s,O) → Tor₁^{R_s}(H¹(X,O)_s,κ(s)) → 0`.

Consequently cohomological flatness in degree zero at `s` is equivalent to `T_s = 0`. The decomposition into a free part and torsion is not canonical; the torsion submodule, its vanishing and the fibre-dimension statement are canonical. Include `globalFunctions_intersection`, `cohomologyOne_overlapQuotient`, `genericRank`, `fiberDimension`, `degreeZeroBaseChange` and `cohomologicallyFlat_iff_torsionFree`.

**Checks.**

- `P¹_R` gives `A₀∞ = A₀ + A∞` and `H¹ = 0`.
- The smooth Weierstrass model `y² = t³ − t` over `Z[1/2]`, with its point at infinity and finite map to `P¹`, has `H¹` locally free of rank one; the quotient must retain that rank.
- If a localized cohomology module has a summand `R_s/(π^m)`, `m > 0`, its fibre contributes one additional dimension, independent of `m`; tensoring just the generic vector space would miss it.
- A constant-field extension changes `H⁰` and must not be hidden in a genus formula assuming `H⁰ = K`.

*Source:* §0.5 and the proper coherent-cohomology and base-change theorems of JacobianChallenge, Layer C, and StableReduction, Layer 2. BLR §8.3, Theorem 1 and Remark 2, p. 223, explain the role of degree-zero cohomological flatness for Picard representability. The displayed exact sequence follows by tensoring the flat two-chart complex over a DVR.

*Needs:* §§0.3–0.5; the supplied coherent finiteness/base-change theorem and elementary Tor over a DVR.

### Examples

The rational model over `Z` computes both constants and vanishing. The elliptic model over `Z[1/2]` tests nonzero `H¹` without a fibre jump. The pair of coordinates `t` and `πt` tests marked-model dependence despite isomorphic total spaces. Together these examples distinguish the model, its marking, the cohomology module, and its fibrewise dimensions.

### Dependencies

The construction uses Mathlib normalization and scheme properties; Tau Ceti function fields, DVR models and cohomology; AlgebraicCurves, Layers 2 and 12; JacobianChallenge, Layers A–C; and StableReduction, Layers 2–4. No Picard representability or Néron-model theorem is used to construct the normalization charts.

## Layer 1: Picard interfaces for arbitrary curve fibres

### 1.1 Multiplicities, partial degrees and total-degree pieces

For a proper fibre over `k`, with reduced irreducible components `C_i`, define `FibreMultiplicityData` using `d_i = length(O_{X_k,η_i})` and `e_i =` the generic length of `(C_i)_{k̄}` at any component above `η_i`. The choices above a given component are conjugate, so `e_i` is independent of that choice. Define `δ_i = d_i e_i` and `δ = gcd_i δ_i`; retain the component indexing set and its base-change maps. The positive integers `e_i` are powers of the characteristic exponent. In particular `e_i = 1` over a perfect field. Separately record whether the fibre is generically reduced, reduced, or geometrically reduced; equality `d_i = 1` alone only detects generic reducedness over `k`.

The multiplicity and normalized-degree API is `multiplicity`, `geometricMultiplicity`, `geometricMultiplicityInFibre`, `gcd`, `partialDegree`, `normalizedPartialDegree`, `totalDegree_eq_sum`, `geometricMultiplicity_dvd_partialDegree` and their field-extension comparisons. Prove `deg L = Σ_i d_i deg_i L` and `e_i` | `deg_i L`. Normalized partial degrees `ρ_i = deg_i/e_i` then satisfy `deg L = Σ_i δ_i ρ_i`. Pullback to an algebraic closure changes the component set and must be accounted for before comparing vectors.

Define `TotalDegreePiece(r)` as the subsheaf of `Pic_{X/S}` whose geometric-fibre degree is `r` everywhere. Proper flat finite presentation gives local constancy of degree, hence these pieces are open and closed whenever the Picard object is represented. Tensor product maps pieces `r` and `q` to `r + q`, duality sends `r` to `−r`, and the degree-zero piece `P` is a group sheaf. Base-pulled line bundles have degree zero. Prove descent of degree to the fppf sheaf before treating a sheaf class as an actual line bundle. The locally varying degree morphism takes values in the constant étale sheaf `Z`, not just the set `Z` on every test scheme.

Prove `picardIdentity_iff_geometricPartialDegreesZero`: for every proper curve over a field, a geometric Picard class lies in the identity component exactly when its degree on every reduced geometric irreducible component is zero. This includes reducible and nonreduced curves. Prove `curveNeronSeveri_finite`: over an algebraically closed field, partial degrees induce an injection `NS(X) = Pic(X)/Pic⁰(X) ↪ Z^I` with finite-index image, where `I` indexes the reduced irreducible components. Thus `NS(X)` is free of finite rank `|I|`. The identity criterion identifies the kernel; surjectivity up to finite index follows by constructing Cartier divisors supported on one component at a time.

**Checks.**

- A smooth geometrically connected fibre has one component and `d = e = δ = 1`.
- For `x² = πyz` in `P²_R`, with 2 invertible, the special fibre is a double line: `d = 2`, `e = 1`, `δ = 2` and `deg O(1) = 2`.
- On the blow-up of `P¹_R` at a rational point of the special fibre, `O_X(C₁)` has partial degrees `(−1,1)` and total degree zero, so `P` is larger than `Pic⁰`.
- An anisotropic real conic has `δ = 1` but closed-point index 2; this detects an incorrect use of `δ` as the usual index.
- The smooth-family degree agrees with JacobianChallengePartII, Layer 0.
- On a disconnected test scheme, degrees 0 and 1 on its two components define a locally varying degree, not a point of either one fixed-degree piece globally.
- For a smooth geometrically connected curve over an algebraically closed field, `NS = Z` by degree, even when `Pic⁰` has positive dimension.
- A reduced curve with two components has Néron–Severi rank two; total degree zero alone does not give the identity component.
- For the double line over an algebraically closed field, `NS` has rank one and is detected by degree on the reduced line; nilpotent structure does not create another Néron–Severi generator.

*Source:* BLR §9.1, Definition 3, Lemma 4 and Proposition 5, pp. 239–240; Corollary 8, pp. 241–242, for divisibility of partial degrees; Proposition 2, pp. 238–239, for local constancy. BLR §9.2, Corollaries 13–14, p. 251, give the geometric partial-degree identity criterion and Néron–Severi finiteness for arbitrary proper curves.

*Needs:* JacobianChallenge, Layers A–C; AlgebraicModuliForArithmeticGeometry §7.6.1; SchemeAndStackFoundations, Layers 1 and 3.

### 1.2 Finite flat quasi-sections and realization of sheaf classes

Let `S` be a strictly henselian local scheme with closed point `s` and `f : X → S` flat and finitely presented. For each component of `X_s` of geometric multiplicity `δ_i`, construct an immersion `Z_i → X` where `Z_i` is finite flat of rank `δ_i` over `S` and its special support is a point on that component alone. For a separated `X/S` this immersion is closed, since `Z_i` is proper over `S`. For a relative curve with pure one-dimensional nonempty fibres, choose `Z_i` as an effective relative Cartier divisor; its partial degree on that component is `e_i`. The general immersion statement and the proper-curve divisor statement are recorded separately.

Prove `quasiSectionDegree_annihilatesObstruction`: suppose `f` is quasi-separated and finitely presented with `f_*O_X = O_S`, and `Z_j → X` are finite flat over `S` of ranks `n_j`. For every **flat** `T → S` and `ξ ∈ Pic_{X/S}(T)`, `gcd_j(n_j)·ξ` is represented by an actual line bundle on `X_T`. Pull back `ξ` along `Z_j`, use its tautological section to get a line bundle, and take the finite-flat norm; the norm represents `n_j ξ`. An integral linear combination of ranks gives the gcd statement. Flatness of `T` preserves global functions for this argument. With universal global functions the same norm argument works on arbitrary `T`, but the weaker hypothesis `f_*O_X = O_S` only supports the displayed flat-test assertion.

Combining these statements gives `geometricMultiplicityGcd_realizable`: over the strictly henselian base, `δ ξ` has an actual representative for flat `T`. In particular `δ = 1` makes every such class realizable. This is not a universal-family theorem and it does not provide one compatible choice of representative for every `ξ`. A section through the smooth locus gives a rank-one quasi-section and supplies the familiar degree-one case.

**Checks.**

- A smooth section of a relative curve has degree one and kills the obstruction. For `X = S = Spec k`, the identity is a rank-one quasi-section, but every effective Cartier divisor is empty; this dimension-zero map is excluded from the curve Cartier assertion.
- For a double component with `δ_i = 2`, this construction guarantees representatives of `2ξ` and does not claim a representative of `ξ`.
- Two finite flat quasi-sections of coprime ranks kill the obstruction by a Bezout combination even when neither has rank one.
- The anisotropic real conic before strict henselization has a rational Picard-sheaf class of degree one without an actual degree-one line bundle; the strict-local hypothesis cannot be erased from the geometric-multiplicity conclusion.
- Replacing a finite-flat norm by a pushforward of a line bundle would generally give a vector bundle, so would not prove the Picard assertion.

*Source:* BLR §9.1, Lemma 7, pp. 240–241; Corollaries 9–10, p. 242; Proposition 11 and Corollary 12, pp. 242–243. The actual-class obstruction is the supplied Picard–Brauer interface of ComplexComparisonPartII §C3.2d.4 and JacobianChallenge, Layer D.

*Needs:* §1.1; finite flat norms of invertible sheaves from SchemeAndStackFoundations, §3.5; the supplied relative Picard sheaf and global-functions base change.

### 1.3 Finite flat rigidificators and the unit sequence

For `f` proper, flat and finitely presented, define `Rigidificator(f)` as a closed immersion `Y ↪ X`, finite flat and finitely presented over `S`, for which `Γ(X_T,O) → Γ(Y_T,O)` is injective for every `T → S`. Use `RigidifiedLineBundle` for pairs `(L,α)`, with `α : O_{Y_T} ≅ L|_{Y_T}`; the additional condition is universal injectivity for the finite-flat rigidifying subscheme. The automorphism group of such a pair is trivial by universal injectivity on functions and hence on units. Isomorphism classes form the fpqc sheaf `(Pic_{X/S},Y)`, with tensor group law and duality induced from the existing bundle operations.

The API gives `restriction_injective`, `units_injective`, `aut_trivial`, `baseChange`, `rigidifiedClass`, `forget`, `tensor`, `dual`, `fpqcSheaf` and compatibility of every operation with pullback. Prove `ofSection`: under universal global functions, the image of a section is a rigidificator. Rigidificators exist over a DVR; more generally use the standard étale-local existence criterion for proper flat families with no embedded associated points in the relevant fibres. The existence proof chooses a finite flat subscheme meeting the associated points in the required sense. An arbitrary finite flat subscheme is not a rigidificator.

Introduce the function functor `V_X(T) = Γ(X_T,O)`. Construct the finitely presented module `Q_X` corepresenting sections, `Hom(Q_X,O_T) ≅ Γ(X_T,O)`, and apply the supplied relative-Spec construction to `Sym(Q_X)` to represent `V_X`. `Q_X` need not be locally free. For finite locally free `Y/S`, `V_Y` is a vector bundle. Prove `closedImmersion_iff`: for a finite flat finitely presented closed subscheme `Y` of `X`, universal injectivity on functions is equivalent to `V_X → V_Y` being a closed immersion. Their unit subfunctors `V_X^×` and `V_Y^×` are open group subschemes. Prove the exact sequence of étale sheaves

`0 → V_X^× → V_Y^× → (Pic_{X/S},Y) → Pic_{X/S} → 0`.

The connecting map sends a unit on `Y` to the trivial line bundle with that chosen rigidification. Its kernel is the image of global units. Changing the convention `α : O → L` to its inverse changes this formula; use the convention fixed above. The quotient `V_Y^×/V_X^×` is the kernel of forgetting rigidification as a sheaf, even when its flatness or representability requires further hypotheses.

**Checks.**

- For `P¹_S` and `Y = ∞`, `V_X = V_Y = A¹_S` and the forgetful map is an isomorphism of Picard sheaves.
- For a proper geometrically integral field curve and a rational point, both unit groups are `G_m`.
- For `P¹_S ⊔ P¹_S` with `Y` in its first component, restriction `O_S² → O_S` is not injective, so `Y` is rejected.
- For `Y = {0,∞}` in `P¹_S`, the unit quotient is `G_m` and the rigidified Picard sheaf is an extension of the integer-degree sheaf by `G_m`.
- When cohomology jumps, `Q_X` is only finitely presented; calling `V_X` a vector bundle would incorrectly force universal degree-zero base change.

*Source:* BLR §8.1, Definition 5 and Proposition 6, p. 205; Theorem 7 and Corollary 8, pp. 206–208; Proposition 9 and Lemma 10, pp. 208–209; Proposition 11, p. 209. Only these interfaces needed by the quotient are extracted, not a separate development of general function-space theory.

*Needs:* `RigidifiedLineBundle`; AlgebraicVectorBundles, L1A–L1B; SchemeAndStackFoundations, §§1.1, 1.15 and 3.5–3.7; JacobianChallenge, Layer C; §1.2 for the curve quasi-section inputs.

### 1.4 Representability of the rigidified sheaf

Prove `rigidifiedPicard_algebraicSpace`: for a proper flat finitely presented morphism of schemes, or algebraic spaces, with a rigidificator `Y`, `(Pic_{X/S},Y)` is an algebraic space locally of finite presentation over `S`. The proof applies the supplied Artin representability interface to rigidified line bundles: descent is effective, automorphisms vanish, deformation and obstruction modules are the coherent ones, and rigidification supplies the required diagonal control. This statement does not assume universal global functions or representability of `Pic_{X/S}`.

For a relative curve, prove formal smoothness of both the unrigidified Picard sheaf and the rigidified sheaf by the `H²` obstruction calculation. The rigidified algebraic space is therefore smooth, as are its total-degree pieces. Prove `picard_cohomologicallyFlat_algebraicSpace`: when `f` is cohomologically flat in degree zero, its unrigidified Picard sheaf is an algebraic space locally of finite presentation; this extends the universal-global-functions case supplied by ComplexComparisonPartII §C3.2d.2. In this case the forgetful morphism is smooth and surjective, a torsor under the smooth unit quotient `V_Y^×/V_X^×`. Here `Q_X` is locally free, and the universal injection into functions on `Y` gives the necessary subgroup and quotient properties. Without cohomological flatness, formal smoothness of a sheaf does not imply it is a represented smooth algebraic space.

The API is `representingSpace`, `yonedaEquivalence`, `locallyOfFinitePresentation`, `baseChange`, `formallySmooth_curve`, `smooth_curve`, `degreePiece_openClosed`, and, under cohomological flatness, `forget_smooth_surjective` and `forget_fibre_unitTorsor`. Include compatibility between the sheaf-valued and represented morphisms. Universal global functions imply the relevant degree-zero cohomological flatness, but the target allows its more general formulation.

**Checks.**

- For `P¹` with a single section the rigidified space is the integer-degree scheme.
- With two disjoint sections it has a `G_m` rigidification parameter in each degree.
- For `P¹` over an algebraically closed field with `n ≥ 1` distinct rigidifying points, the kernel is `(G_m)^n/G_m ≅ (G_m)^(n−1)`, with diagonal denominator; `n = 1` and `n = 2` recover the preceding checks. The empty subscheme is not a rigidificator of `P¹`, so `n = 0` does not produce a negative-dimensional torus.
- In a family with nonzero torsion `T_s` from §0.6, the rigidified-space theorem still applies when a rigidificator exists; representability of the unrigidified sheaf must not be inferred from it.
- Over a reduced base, the converse obstruction to unrigidified representability is precisely the degree-zero cohomological-flatness issue in BLR's criterion.
- `H² = 0` is used for curves, not for arbitrary proper surfaces, where line-bundle deformations can be obstructed.

*Source:* BLR §8.3, Theorem 3, pp. 223–224, for rigidified representability; Theorem 1 and Remark 2, p. 223, for the unrigidified criterion; §8.4, Proposition 2, p. 232, for curve formal smoothness. The general algebraicity and deformation infrastructure is AlgebraicModuliForArithmeticGeometry §§7.1 and 7.3, with the represented Picard and component criteria of ComplexComparisonPartII §§C3.2d.2 and C3.2f.1–C3.2f.2 and SchemeAndStackFoundations, §§4.1, 4.6 and 4.11–4.14.

*Needs:* §§1.1–1.3; the stated moduli and descent suppliers. Representability is proved before using a universal bundle on the representing algebraic space.

### 1.5 Universal families and normalized restriction

For any represented rigidified Picard functor `F`, define `universalRigidifiedBundle` by the Yoneda element at its representing space `P`. Its universal property includes the rigidification and the unique isomorphism of rigidified bundles. In the section case, apply the supplied `sectionPicardSplit` under universal global functions: its section-rigidified representative normalizes `L` to

`L^e = L ⊗ f_T*(e_T*L)⁻¹`.

The supplied split includes the evaluation trivialization along `e_T`, descent from local representatives and invariance under base twists. Construct the resulting universal bundle on `X ×_S P` whenever `Pic_{X/S}` is represented. The restriction to the identity is canonically trivial, compatibly at the intersection with `e × P`; specify the two rigidifications and their compatibility, not just the underlying class.

The universal-family API has `pullbackUniversal`, `class_eq`, `rigidification_eq`, `unique_classifyingMap`, `unique_rigidifiedIso`, `tensor_comparison`, `baseChange`, and `restrictRepresentedSubfunctor`; base-twist invariance is the supplied section split. The last operation applies to any specified represented subfunctor `Z ↪ P`: degree pieces, `Pic⁰` and represented torsion subgroups are examples. A Néron identity component is not automatically such a subfunctor of `P`; first establish the Picard–Néron isomorphism in Layer 3, then transport or restrict the family through that isomorphism.

**Checks.**

- On `P¹_S` with `e = ∞`, the family on the degree-d component is `O(d·[0])` with its canonical trivialization at `∞`.
- On `Pic⁰` of a genus-zero pointed smooth family the bundle is trivial.
- For an elliptic scheme `E/S`, identify `Pic⁰` with `E` by `x ↦ O(x−e)` and put `M = O_E(e)`, `N =` e*M. The normalized family is `O(Δ) ⊗ p₁*M⁻¹ ⊗ p₂*M⁻¹ ⊗` q*N on `E ×_S E`, where `q` is the map to `S`. Its restrictions to both axes are trivial. The q*N term is needed for the rigidified formula over a general base; omitting it leaves the axis restriction `q*N⁻¹`.
- For a pointless real conic `Pic¹` has an R-point but no actual degree-one bundle, so there is no universal bundle on `X × Pic¹`.
- Finally, `O(D−re)` is only a degree-zero class until its pullback along `e` has been normalized; subtracting re alone is not a rigidification.

*Source:* BLR §8.1, Proposition 4, p. 204, for the section split and normalization; §8.2, Proposition 4, p. 211, for the universal bundle; the represented-functor restriction assertion follows directly from Yoneda. The elliptic formula follows by restricting its three divisor factors to each axis and retaining the base line `N`. This curve × Picard bundle is distinct from the `J × J` Poincaré convention of JacobianChallengePartII, Layer 3.

*Needs:* §§1.3–1.4; `rigidifiedPicardFunctor`; AlgebraicModuliForArithmeticGeometry §§7.6.1–7.6.1a for the section case; SchemeAndStackFoundations descent of invertible sheaves; the established line-bundle dual and pullback operations.

### 1.6 Relative Cartier loci on arbitrary fibres

For a proper flat finitely presented relative curve `X/S` with arbitrary fibres, define `DivDegree(r)` as the rank-r locus in the supplied relative divisor functor, and identify it with the open relative-Cartier locus in `Hilb^r_{X/S}`. Its functor of points classifies the existing relative effective Cartier divisors whose finite locally free structural map has rank `r`. The new assertion is this Hilbert open-locus comparison, including nonreduced and reducible fibres.

Prove `finiteRankHilbert_algebraicSpace`: for a proper finitely presented family, the finite locally free rank-r Hilbert subfunctor is an algebraic space locally of finite presentation. This is the proper-family extension of the supplied Hilbert-functor interface. In the projective noetherian case use SchemeAndStackFoundations §4.14 for scheme representability. Use these Hilbert spaces for the Cartier-locus comparison. Prove the relevant openness and base-change statements rather than treating every finite flat length-r subscheme on a singular curve as Cartier. The API includes `toHilbert`, `isOpenImmersion`, `universalDivisor`, `degree`, `baseChange`, `zero`, `add`, `associatedLineBundle`, `canonicalSection`, `recoverZeroScheme`, and compatibility with Div^r `≅ Sym^r X` for smooth relative curves of pure relative dimension one. These operations restrict the supplied divisor operations to their fixed-rank loci.

For a smooth proper relative curve of pure relative dimension one over any base `S`, construct `relativeSymmetricPower(X/S,r)` as an S-algebraic space from the rank-r Hilbert space and prove `DivDegree(r) ≅ Sym^r_S X`. The sum of the r graph divisors defines `X^r_S → Sym^r_S X`; prove its categorical quotient universal property for the permutation action of the symmetric group on r letters, for maps to S-algebraic spaces. Establish the comparison étale-locally around the divisor support using smooth-curve charts and elementary symmetric functions, then descend it. Include arbitrary base change and agreement with the field construction of JacobianChallenge, Layer C. Add `relativeSymmetricPower`, `divDegree_symmetricPowerIso`, `symmetricQuotient_universal` and `symmetricPower_baseChange` to the API.

**Checks.**

- `Div⁰ = S` represents the empty divisor.
- On a smooth relative curve of pure relative dimension one, `Div¹ ≅ X` by the graph construction. For `X = S = Spec k`, `Div¹` is empty, so the relative-dimension hypothesis is necessary.
- For `P¹_S`, Div^r `≅ P^r_S` through binary forms of degree `r` up to a unit.
- The reduced node on a nodal cubic, or the origin of xy `= 0`, is a finite length-one subscheme but its ideal needs two generators and is not Cartier. The criterion therefore excludes it from `Div¹`.
- A horizontal section of xy `= π²` through the singular point is also not licensed by the smooth-section graph theorem.
- Adding two relative effective Cartier divisors adds their ranks and tensors the associated line bundles.
- After base change to dual numbers, the local equation `u² − ε` gives a rank-two divisor, so the symmetric-power comparison retains infinitesimal motion.
- In characteristic two the doubled origin is still in `Sym² A¹ ≅ A²`, with coordinates the two elementary symmetric functions; the quotient is not restricted to distinct points or invertible `r!`.
- On a disconnected or nonreduced base, the fixed-rank construction and quotient comparison commute with each base change, and over a field agree with the supplied symmetric power.

*Source:* BLR §8.2, Lemma 6, p. 213, for the open relative-Cartier locus; §9.3, Proposition 3, pp. 254–255, for the smooth Hilbert/symmetric-power comparison. The fibre criterion and finite-flat rank are supplied by ModularCurves `0A`. JacobianChallenge, Layer C, supplies the fixed-field symmetric power. The relative construction uses BLR §9.3, Proposition 3 in its smooth quasi-projective range, followed by the étale-local chart comparison and descent for smooth proper relative curves. The Hilbert functor is AlgebraicModuliForArithmeticGeometry §2.1; projective scheme representability is SchemeAndStackFoundations §4.14. The proper-family algebraic-space extension uses Stacks, Proposition 99.9.4, [tag 0D01](https://stacks.math.columbia.edu/tag/0D01), restricted to finite locally free rank-r families.

*Needs:* §1.1; the stated divisor and Hilbert suppliers. This target does not assert smoothness of Div^r for a singular curve.

### 1.7 Abel maps and their complete-linear-system fibres

Construct `abelMap_r : DivDegree(r) → Pic^{[r]}_{X/S}` by `D ↦ [O_X(D)]`. Prove functoriality on all test schemes, compatibility with arbitrary base change and addition of divisors, and the degree formula. For a projective flat family with geometrically reduced irreducible curve fibres and a line bundle `L` on `X_T`, identify the fibre product `Div_{X/S} ×_{Pic_{X/S}} T` over `[L]` with `P(Q_L)`, where `Q_L` is the finitely presented module corepresenting sections of `L`. When `L` is cohomologically flat in degree zero this is `P((f_T*L)∨)`. On arbitrary test schemes, `P(Q_L)` is the projectivization of a finitely presented quasi-coherent module; this module is coherent when the test base is locally noetherian. Without local freeness it need not be a projective-space bundle of constant dimension.

The construction matches a divisor with a fibrewise nonzero section of `L` up to units and the corresponding invertible quotient of `Q_L`. Geometric integrality is what makes that nonzero section regular on the fibre. On a reducible fibre a nonzero section can vanish identically on a component; the unrestricted linear system then has a non-Cartier locus and is not the stated full projectivization. Include `abelMap_zero`, `abelMap_add`, `linearSystem_fibreIso`, `quotientConvention`, `baseChange` and `sectionDescription`.

Over a proper geometrically reduced connected field curve of genus `g`, or in the corresponding projective family, the degree-g divisors supported in the smooth locus with `H¹(O(D)) = 0` form an open `W`. Over a separably closed field `W` is nonempty, and its Abel map is an open immersion into `Pic^{[g]}`; in families it is an open immersion with `W → S` surjective under those geometric hypotheses. This is the exact open-chart input, not a claim that every Abel map is an isomorphism. With a smooth section `e`, compose the degree-r map with translation by `−r[e]`, and then use §1.5 to normalize the actual family along `e`. The result lands in `Pic^{[0]}`; landing in `Pic⁰` additionally uses zero degree on every geometric component, or the smooth geometrically connected setting of Layer 2.

**Checks.**

- For `P¹`, the map `P^r → Pic^{[r]} = S` has fibre `P^r`.
- At `r = 0` the empty divisor maps to the unit.
- For an elliptic curve, the degree-one pointed map is the isomorphism `E ≅ Pic⁰`, using its pure one-dimensional fibres.
- For a smooth curve of genus at least two, degree one gives an immersion with image of dimension one, not a surjection onto the g-dimensional Picard torsor.
- At degree `g`, `H¹ = 0` gives `h⁰ = 1` and a unique effective divisor in that open linear system, explaining the open immersion.
- On a reducible fibre, `O(D−re)` can have nonzero partial degrees even though its total degree vanishes; this catches an incorrect target `Pic⁰` for the general pointed construction.
- Over `A = k[ε,x₁,x₂,…]/(ε², εxᵢ, xᵢxⱼ)`, a nontrivial first-order deformation of the trivial bundle on an elliptic curve has section corepresenter `A/(ε)`. It is finitely presented, but its submodule `(x₁)` is not finitely presented because its annihilator needs all the `xᵢ`; coherence cannot be required on arbitrary test bases.

*Source:* BLR §8.2, Proposition 7, pp. 214–215, for the fibre projectivization; §9.3, Lemmas 4–5, pp. 255–256, for `W` and its open immersion. Smooth-family pointed Abel maps are imported from JacobianChallengePartII, Layer 2. The normalization of their universal bundles is §1.5.

*Needs:* §§1.1, 1.5–1.6; JacobianChallenge, Layers B–C, for Riemann–Roch, coherent corepresentability and base change; the supplied relative Picard sheaf.

### 1.8 Quotients and scheme structure for group algebraic spaces

Prove two bridge theorems needed for the general quotient in Layer 3. First, if `H ↪ G` is an immersion of algebraic group spaces over `S` and `H/S` is flat and locally of finite presentation, the fppf quotient `G/H` is an algebraic space, with its quotient morphism and base-change comparison. For the closed subgroup case used below, identify the relation as the image of `H ×_S G → G ×_S G`, (h,g) `↦` (hg,g). Flatness of `H` makes the projections flat; apply the supplied algebraic-space equivalence-relation machinery. If `H` is normal, the group law descends. Smoothness and separatedness of the quotient are separate conclusions to be proved in their particular applications.

Second, a separated smooth finite-type group algebraic space over a Dedekind scheme is a scheme. Include the locally finite-type version needed by the quotient, constructing its smooth identity open subgroup `G⁰` and proving compatibility with base change. Locally on the base, let `Y` be the open locus admitting scheme neighbourhoods. Prove that `Y` meets every geometric fibre component, using the generic-point scheme-neighbourhood lemma in the proof of BLR §6.6, Corollary 3, in its local finite-type form. The smooth identity open subgroup `G⁰` acts on `G`, and fibrewise translation gives `G⁰Y = G`. Apply BLR §6.6, Theorem 2(b), to this action to conclude that `G` is a scheme. Establish the scheme-locus and connected-translation assertions explicitly; descent from a scheme atlas alone does not prove them. This argument does not assert that the group has finitely many components, or that it is of finite type.

The APIs are `groupSpaceQuotient`, `quotient_fppfEpi`, `quotient_baseChange`, `quotient_normalGroup`, `smoothSeparatedGroupSpace_isScheme`, `schemeLocus_fibreDense` and `identityTranslation_covers`. Only the contracts needed for `P/E` are constructed; arbitrary nonflat quotients are outside these statements.

**Checks.**

- Taking `H = 1` gives `G` itself as a quotient algebraic space, without prematurely giving it a scheme structure.
- Taking `H = G` gives the terminal S-space.
- For `G_m` and `H = μ_n`, including residue characteristic dividing `n`, the fppf quotient is `G_m` by the power map; geometric-point orbits do not establish that assertion.
- A separated smooth algebraic group space of finite type over a field satisfies the scheme theorem, and the trait case retains separatedness.
- The constant group `Z` over a trait satisfies the locally finite-type statement and is a scheme, although no finite-type open subgroup contains its generator 1; the proof must allow infinitely many components.
- An arbitrary smooth algebraic space without a group law cannot be substituted into the theorem.
- Quotient existence alone does not establish that `Q` is finite type in §3.3.

*Source:* BLR §8.3, Proposition 9, p. 231, for algebraic-space quotients; §6.6, Theorem 2(b) and Corollary 3, p. 164, for scheme structure and connected translation. The local version is required in the use of that corollary in BLR §9.5, Proposition 3, pp. 266–267, before finite type is established. SchemeAndStackFoundations, §§1.1–1.6, 1.13–1.17, and AlgebraicModuliForArithmeticGeometry §§7.1 and 7.9 supply the general sheaf, identity-open-subgroup, descent and quotient criteria used in these proofs.

*Needs:* those two foundation suppliers; ReductiveGroupsPartII §RG2.3.1 only when an intermediate object is already a scheme. Neither bridge assumes a Néron model.

### Examples

A double line tests weighted total degree. A blown-up rational fibre tests the difference between total degree zero and the identity component. A pointless conic tests realization and the universal-bundle obstruction. Two rigidifying points on `P¹` test the unit quotient. The node tests the open Cartier condition. These examples use nonreduced, reducible and smooth fibres for different purposes; none can replace the others.

### Dependencies

The layer uses JacobianChallenge, Layers A–C; Tau Ceti rigidified bundles; AlgebraicModuliForArithmeticGeometry §§2.1, 7.1, 7.3, 7.6.1–7.6.1a and 7.9; ComplexComparisonPartII §§C3.2d.2–C3.2d.4 and C3.2f.1–C3.2f.2; SchemeAndStackFoundations, Layers 1–4; and the group-scheme quotient contract. Its general group-space bridges precede the separated Picard quotient, so representability there has no circular Néron-model prerequisite.

## Layer 2: Pointed smooth families and good reduction

### 2.1 The pointed smooth-family boundary over a Dedekind base

Let `X/S` be a smooth proper curve family with a section `e`, relative dimension one and geometrically connected fibres. Prove the arithmetic interfaces `pointedCurve_universalFunctions` and `pointedCurve_projectiveOnAffineBase`. The genus `s ↦ dim H¹(X_s,O)` is locally constant by coherent base change; universal global functions follow from proper smooth geometrically connected fibres. The graph of `e` is a relative effective Cartier divisor of degree one. `O_X(e)` has positive degree on every fibre, so is fibrewise ample and relatively ample locally on `S`. Consequently `X` is projective over every affine open of `S`, in particular over the spectrum of a Dedekind domain.

This projectivity assertion supplies the exact hypothesis needed to apply the smooth-family Jacobian supplier locally on `S`. Glue its results by their canonical Picard-sheaf comparison. A global identification `X ≅ P¹_S` in genus zero is not required: a pointed genus-zero family can be a nontrivial projective-line bundle. The fibrewise argument still proves the triviality of its Picard identity component in §2.2.

**Checks.**

- `(P¹_S,∞)` has genus zero, universal global functions and its degree-one relatively ample line bundle.
- A smooth elliptic scheme with origin has genus one and the section gives the same ample divisor used in its Weierstrass construction.
- Over a field this is the established pointed curve of JacobianChallenge.
- The disjoint union `P¹_S ⊔ P¹_S` with a section in one copy is smooth and proper but has `f_*O = O_S²` and is excluded by geometric connectedness.
- The conclusion is projectivity on affine bases; it does not replace the global hypotheses of a projectivity theorem over an arbitrary base by an unstated ample bundle on that base.

*Source:* Stacks, Lemma 33.44.14, [tag 0B5X](https://stacks.math.columbia.edu/tag/0B5X), for positive degree and ampleness on a proper curve; Lemma 37.50.3, [tag 0D2S](https://stacks.math.columbia.edu/tag/0D2S), for passing from fibre ampleness to a neighbourhood; Lemma 37.50.1, [tag 0B45](https://stacks.math.columbia.edu/tag/0B45), for projectivity over an affine base. The coherent-family and section-divisor inputs are JacobianChallenge, Layer C, and StableReduction, Layer 2; compare BLR §9.3, Remark 2, p. 252.

*Needs:* §1.6; JacobianChallenge, Layer C, and StableReduction, Layer 2, for curve-family cohomology/base change; the relative-ampleness contracts above.

### 2.2 Rigidified realization of the relative Jacobian

For a pointed smooth proper family over a noetherian `S`, use JacobianChallengePartII, Layers 0–1, on every positive-genus open-and-closed part of `S`. Write `J` for that abelian scheme. The new comparison is `jacobian_sectionRigidified`: for every `T → S`, `J(T)` identifies with isomorphism classes of pairs `(L,α)` on `X_T`, with degree zero on every fibre and `α : O_T ≅ e_T*L`. It is a natural group isomorphism, including nonreduced and non-noetherian test schemes `T`. Its proof combines the supplied relative-Jacobian sheaf comparison with §1.5's actual rigidified representative, rather than re-proving representability or polarization.

On the genus-zero part, prove the completion of this interface: `Pic⁰ = S` as the trivial group scheme. One can check the smooth relative Picard identity component after a section-acquiring trivialization or on geometric fibres, where `Pic⁰(P¹) = 0`, and use the smooth group-space comparison and its relative dimension zero. This gives the same rigidified-functor statement in genus zero without imposing the supplier's `g > 0` hypothesis there. With locally varying genus, glue over its open-and-closed loci.

Restrict §1.5's normalized family to `X ×_S J` and prove `jacobian_universalBundleComparison`, preserving the `e × J` and `X × 0` trivializations. Both `J` and this rigidified family commute with every base change; distinguish the isomorphism of represented group schemes from the isomorphism of line bundles. Over a Dedekind base the supplied theorem that abelian schemes are Néron models identifies `J` with the Néron model of its generic Jacobian.

The comparison API includes `pointEquiv`, `pointEquiv_tensor`, `pointEquiv_zero`, `classifyingMap_unique`, `universalPullback`, `twoAxisNormalization` and `baseChange_comparison`. It also identifies the generic fibre with the field Jacobian through the chosen marking.

**Checks.**

- For `P¹` the group scheme and its degree-zero universal family are trivial.
- For an elliptic family the comparison sends `x` to the normalized `O(x−e)` class and agrees with the established elliptic group law.
- A base change to dual numbers retains the tangent space `H¹(O)` of dimension `g`, so checking only geometric points would not establish the functor isomorphism.
- Replacing degree zero by all Picard degrees would introduce an integer family of components and would fail already on `P¹`.
- Changing the section changes the rigidification comparison, while the underlying relative Jacobian remains the supplied section-independent object.

*Source:* BLR §8.1, Proposition 4, p. 204; §8.2, Proposition 4, p. 211; §9.4, Proposition 4, pp. 260–261. Combine JacobianChallengePartII, §§0.3 and 1.1–1.3, with the section-rigidified comparison of §§1.5 and 2.1. The abelian-scheme/Néron theorem is NeronModelsAndSemistableAbelianVarieties §1.8, based on BLR §1.2, Proposition 8, p. 15.

*Needs:* §§1.4–1.5 and 2.1; JacobianChallengePartII, Layers 0–1; AbelianSchemesAndArithmeticModuli, A0.1, A1–A2; the cited Néron-model supplier only for the final arithmetic identification.

### 2.3 Jacobian points, actual classes and Galois descent

For a smooth proper geometrically connected `C/K` with a K-point, prove `jacobianPoints_actualPicard`: for every extension `L/K`, `J(L) ≅ Pic⁰(C_L)`, naturally in `L`. The section makes the Brauer obstruction vanish; forgetting the rigidification over a field is then a bijection on isomorphism classes. Compose with `SchemeWeilDivisor.map_picZero` to obtain `J(L) ≅ Cl⁰(C_L)`, where `Cl⁰` is degree-zero Weil divisors modulo principal divisors.

The API includes `pointToClass`, `divisorToPoint`, `principal_eq_zero`, `add`, `fieldExtension_naturality`, `galoisEquivariance` and `invariants_descent`. For `K^s` a separable closure, the natural isomorphism `J(K^s) ≅ Cl⁰(C_{K^s})` is `G_K-equivariant`. The fixed points identify with `J(K)`, and the rational point on `C` identifies those fixed classes with `Cl⁰(C)`. To obtain an invariant divisor representative, first descend the class to an actual line bundle on `C` using the section split, then choose its rational meromorphic section over `K` and pull back the resulting divisor. An initially chosen representative need not be invariant. Taking invariants of the divisor quotient without this descent and obstruction argument does not justify the conclusion for an unpointed curve.

Without a rational point the actual Picard group still injects into `Pic_{C/K}(K)`, with obstruction in the kernel of Br(K) `→` Br(C). Restricting to degree zero gives the corresponding injection into `J(K)`. Its cokernel can be nonzero. Retain the rational point, or explicitly supply another obstruction-killing hypothesis, in the displayed isomorphism.

**Checks.**

- For `P¹` both degree-zero groups are zero although `Pic(P¹) = Z`.
- For an elliptic curve, the point `P` corresponds to the class `[P]−[e]`, compatibly with addition.
- Principal divisors map to zero after every extension.
- Conjugating a divisor and then passing to its class agrees with acting on the Jacobian point.
- A pointless conic detects the failure of the full actual/relative Picard comparison in degree one; the statement with a point does not silently apply to that case.
- A nontrivial Brauer obstruction for an unpointed curve cannot be removed by taking invariant divisor classes formally.

*Source:* BLR §8.1, Proposition 4, p. 204, for the obstruction and section split; §9.1, the degree construction on pp. 237–238, Theorem 1, p. 238, and Proposition 2, pp. 238–239, for the degree comparison. The divisor-class/Picard input is `SchemeWeilDivisor.map_picZero` and JacobianChallenge, Layer A. Galois naturality follows from pullback of these same constructions, and descent of J-points is the representable fpqc sheaf property.

*Needs:* §2.2; `SchemeWeilDivisor.map_picZero`; ComplexComparisonPartII §C3.2d.4 and SchemeAndStackFoundations §§2.22 and 3.6, for the precise obstruction sequence.

### 2.4 Good-reduction specialization through actual line bundles

Let (X,e) be a pointed smooth proper family over an open `U` of a Dedekind base, with generic curve `C` and relative Jacobian `J`. At a height-one point `s` of `U`, define `goodReductionSpecialization_s` as

`J(K) = J(O_{S,s}) → J_s(κ(s)) = Pic⁰(X_s)`.

The first equality is the properness or abelian-scheme Néron comparison, and the arrow restricts a section. Prove it is a group homomorphism and that, for an actual degree-zero bundle `L` on `X_{O_{S,s}}`, it sends `[L_K]` to `[L_s]`. Any generic bundle extends on the regular total space; two extensions differ by vertical divisors, and on a smooth geometrically connected trait family these are multiples of the whole fibre and give the same relative class.

For `D = Σ n_i[P_i]` supported on K-rational points, its horizontal closure is `Σ n_i` times their sections. Prove `specialization_divisorFormula`: the specialized Jacobian class is `[Σ n_i specializePoint_s(P_i)]`. Coincident specializations are counted with their coefficients; distinct generic points need not remain distinct. Include compatibility with addition, principal classes, the Abel map and the rigidified universal family. For a finite extension K′/K and a specified DVR `R′` dominating `O_{S,s}`, base change of the good-reduction abelian scheme gives the same specialization at the corresponding residue point. Finiteness of the integral closure is not asserted without a Nagata hypothesis. Decomposition-group equivariance is obtained by these specified valuation and residue-field maps.

**Checks.**

- On `P¹` every degree-zero class specializes to zero.
- On an elliptic scheme, `[P−e]` specializes to `[P_s−e_s]`, the usual point reduction.
- If two sections meet in the special fibre, their difference specializes to zero even when their generic difference is nonzero; this does not contradict prime-to-p torsion injectivity proved later.
- A principal generic divisor gives a trivial relative line-bundle class after any extension to the smooth model.
- At a bad fibre one cannot replace the full Néron special fibre by the Jacobian of the singular curve; Layers 3–4 give the correct target.

*Source:* the section-split comparison of BLR §8.1, Proposition 4, p. 204, and the smooth-family Picard theorem of §9.4, Proposition 4, pp. 260–261; the abelian-scheme Néron comparison is BLR §1.2, Proposition 8, p. 15. The specialization formula follows from restriction of `O(D)` and the unique proper-model sections of §0.2, so no further general reduction theorem is assumed.

*Needs:* §§0.2, 1.5 and 2.1–2.3; NeronModelsAndSemistableAbelianVarieties §1.8; the Cartier/line-bundle restriction dictionary.

### Examples

The trivial genus-zero Jacobian checks the endpoint missing from a positive-genus family theorem. Elliptic curves check the actual group law and the universal bundle. Dual-number base changes distinguish a natural functor comparison from a bijection of geometric points. Colliding sections show why specialization can have a kernel on general rational points before torsion restrictions are imposed.

### Dependencies

The new comparisons consume the smooth relative Jacobian of JacobianChallengePartII, Layers 0–2, locally on the Dedekind base and then glue. Actual divisor comparisons come from Tau Ceti and JacobianChallenge, Layer A. Abelian schemes being Néron models is imported from NeronModelsAndSemistableAbelianVarieties §1.8. No singular-model quotient is needed in this layer.

## Layer 3: Separated Picard quotients and Néron comparison

### 3.1 The largest separated quotient of total degree zero

Let `R` be a DVR, `S = Spec R`, and `f : X → S` a proper flat finitely presented curve with normal geometrically irreducible generic fibre. Set `P = Pic^{[0]}_{X/S}`. Define `GenericUnitClosure`, denoted `E`, as the fppf subsheaf generated by maps `Z → P` from flat S-schemes `Z` whose generic restrictions factor through the generic unit. If `P` is represented, prove that this agrees with the usual schematic closure. Define `SeparatedDegreeZeroQuotient`, denoted `Q = P/E`, in commutative fppf group sheaves. These definitions do not assume that `P` is represented or that `X` is normal.

Prove `degreeZeroQuotient_representable`: `Q` is a smooth separated locally finite-type S-group scheme, and `P → Q` is an isomorphism on generic fibres. The generic fibre is `Pic⁰_{X_K/K}`; for a smooth geometrically connected generic curve it is the usual abelian Jacobian. For a normal generic curve over an imperfect field it is the appropriate smooth connected Picard group, and properness of that group is not silently assumed. Prove `largest_separated`: every S-morphism from `P` to a separated S-scheme or algebraic space `Z` factors uniquely through `Q`. The morphism need not preserve a group law, and `Z` need not have one. On a flat rigidified presentation, the two maps obtained by translation by the generic-kernel closure agree generically; the closed diagonal of `Z` and schematic density force equality everywhere. Descent through the quotient gives the factorization, and the quotient's sheaf epimorphism gives uniqueness. For a group homomorphism to a separated group target, the factorization preserves the group law.

There are three proof cases, all part of the construction. If `Pic` is a scheme, the generic-unit closure is étale and the quotient is locally a scheme quotient. If `Pic` is an algebraic space, form its flat-subgroup quotient using §1.8 and then give the resulting smooth separated group space its scheme structure. In the general case choose a rigidificator `Y`, put `G = (P,Y)`, and let `H` be the schematic closure in `G` of the generic kernel of `G_K → P_K`. Prove `H` is a flat subgroup, contains the kernel of forgetting rigidification, and `G/H` is separated. The flat-subgroup theorem gives an algebraic space `G/H`; the two induced sheaf maps identify it with `P/E`. Smoothness and the group-space scheme theorem complete the construction. Prove independence of `Y` by this universal quotient property. Finite type is a separate theorem in §3.3.

The API includes `unitClosure_generic`, `quotientMap`, `genericIso`, `smooth`, `separated`, `largest_separated`, `lift_unique`, `rigidificatorPresentation` and `changeRigidificator`. Prove `flatTraitBaseChange`: for a flat local extension of DVRs `R → R′` with fraction fields `K → K′`, formation of `E` and `Q` commutes with base change, preserving the quotient map and generic marking. This includes henselization, strict henselization, completion and ramified extensions. Use flat base change of the generic-kernel closure on a rigidified presentation, then identify the quotient sheaves; include identity and composition coherence. Étale and localization comparisons over a Dedekind base are consequences of the same construction. This statement concerns `P/E`: ramified base change can destroy regularity of `X`, and it does not assert preservation of the Néron mapping property. Over a strictly henselian DVR with `X` normal, `E(R)` identifies with vertical Cartier divisors modulo principal vertical divisors. On a regular `X` every vertical Weil divisor is Cartier; on a merely normal `X` retain the Cartier condition.

**Checks.**

- For a smooth geometrically integral family, `P = Pic⁰`, `E` is the unit and `Q = P`.
- For the blow-up of `P¹_R` at a rational special point, the vertical classes modulo the whole fibre form `Z·[O_X(C₁)]`; `P` is nonseparated, while `Q` is the trivial Jacobian model. The two sections `O_X` and `O_X(C₁)` of `P` agree generically but differ on the model.
- Replacing `P` by the full Picard sheaf would leave integer degree components even for `P¹`, so would give the wrong generic fibre.
- The generic quotient is an isomorphism regardless of how many special-fibre components `Q` has.
- A construction that begins by assuming representability of unrigidified `Pic` fails to cover the third proof case.
- On a smooth elliptic family, translation by a nonzero section, viewed as a map to the underlying separated scheme, factors through `Q = P` by that same translation. It is not a group homomorphism; a universal property restricted to homomorphisms would omit it.
- Under `R → R′` with `π = (π′)²`, a regular nodal chart xy `= π` becomes xy `= (π′)²` and is singular at the node. The quotient comparison still holds, while the regular-model hypothesis for §3.3 must be checked anew.
- Henselization and completion preserve the quotient map, including its generic marking, by `flatTraitBaseChange`; neither is justified merely by calling it an étale morphism of finite presentation.

*Source:* BLR §9.5, Proposition 3 and its three proof cases, pp. 265–267; Lemma 8, pp. 269–270, for vertical Cartier classes; §9.6, proof of Theorem 1, p. 275, for compatibility with flat extensions of DVRs. The separated-target factorization uses the quotient presentation in Proposition 3 and the closed-diagonal density argument above.

*Needs:* §§1.1–1.5 and 1.8; the supplied relative Picard sheaf, flat closures, line-bundle descent and algebraic-space foundations. No general Picard–Néron comparison is a prerequisite to this construction.

### 3.2 Raynaud's normal-model representability criterion

Let `X/S` be proper, flat, finitely presented and normal, with `f_*O_X = O_S`. If the gcd of geometric multiplicities `δ_i` of the special-fibre components is one, prove `raynaud_normalPicard`: `f` is cohomologically flat in degree zero, `Pic_{X/S}` is an algebraic space, and `Pic⁰_{X/S}` is a smooth separated S-scheme. When the generic fibre is also geometrically irreducible, identify `Pic⁰_{X/S} ≅ Q⁰` through §3.1's quotient map. The global-functions assumption is on `S` initially; universal base change is a conclusion through cohomological flatness in this proper flat setting.

The argument uses the actual representative produced by §1.2 after strict henselization, the universal family on the rigidified presentation, and extension of line bundles on the regular parameter spaces. Descent of vertical divisors on a normal `X` gives a section over `Q⁰`. Comparing dimensions of the Picard fibres and `Q`, and controlling the kernel by the finitely generated vertical Cartier group, proves the cohomological-flatness conclusion. Do not replace this by the degree-one quasi-section criterion of AlgebraicModuliForArithmeticGeometry §7.3: a gcd-one combination is enough even without a specified degree-one subscheme. That criterion and Raynaud's condition (N*) remain supplier special cases.

Include `cohomologicallyFlatZero`, `picard_algebraicSpace`, `identity_scheme`, `identity_separated`, `identity_smooth`, `identityQuotientIso` and their étale/local comparisons. The quotient isomorphism is an isomorphism of group schemes compatible with generic markings and line-bundle classes, not just an equality of dimensions.

For a regular proper flat curve with connected generic fibre and a K-point, properness extends the point to a section, §0.2 puts it in the smooth locus, and hence a special component has geometric multiplicity one. Connectedness plus the section gives the needed global-functions conclusion through the normal Stein factorization. Thus the criterion applies even over an imperfect residue field.

**Checks.**

- Smooth proper pointed curves recover the known Picard scheme and relative Jacobian.
- A regular pointed model with reducible fibre still has a separated `Pic⁰` although `P` can be nonseparated.
- Multiplicities with gcd one qualify without requiring every multiplicity to be one.
- A single double component with `δ = 2` does not satisfy the theorem; the rigidified construction of §3.1 remains available.
- A normal model with a section through a singular point does not automatically get a smooth quasi-section from that section; regularity is used in the corollary.

*Source:* BLR §9.4, Theorem 2 and Corollary 3, pp. 259–260; proof of Theorem 2, pp. 262–264. The cohomologically flat Picard representability criterion is §1.4. Its universal-global-functions case is ComplexComparisonPartII §C3.2d.2, and the degree-one Raynaud special case is AlgebraicModuliForArithmeticGeometry §7.3.

*Needs:* §§0.2, 1.2–1.5 and 3.1; supplied coherent base change, normal divisor descent, Picard infinitesimal theory and Stein factorization. The result is proved before the Néron comparison and does not use its conclusion.

### 3.2a Strict-local Brauer vanishing and actual generic bundles

Prove `brauer_fractionField_henselianDVR_algClosedResidue`: if `R` is a henselian DVR with algebraically closed residue field and fraction field `K`, then `Br(K) = 0`. The Lean milestone states `Subsingleton (BrauerGroup K)` on Mathlib's field Brauer carrier; the supplied field Brauer/cohomology comparison identifies this with cohomological vanishing. Include the same conclusion for the finite purely inseparable constant-field extension `K′ = Γ(C,O_C)` of a normal geometrically irreducible proper K-curve: the valuation extends uniquely, its valuation ring is again a henselian DVR, and its residue field is the same algebraically closed field. No finiteness assertion for the integral closure as an R-module is needed.

Prove `strictLocal_genericPicardClass_representable`: for a proper flat finitely presented relative curve `X/R` over such an `R`, with normal geometrically irreducible generic fibre, every element of `Pic_{X_K/K}(K)` is represented by a line bundle on `X_K`. If `X` is regular, every such bundle extends to `X`, so `Pic_{X/R}(R) → Pic_{X_K/K}(K)` is onto. Apply the Picard obstruction sequence after the Stein factorization through `K′`; the obstruction lies in `Br(K′)`, which vanishes by the preceding target. Include pullback compatibility of the actual-class maps and of generic restriction. These targets apply without a multiplicity-gcd-one assumption.

**Checks.**

- For `R = k[[t]]` with algebraically closed `k`, `Br(k((t))) = 0`.
- `Br(Z_p) = Br(F_p) = 0` while `Br(Q_p)` is nonzero: henselian-ring Brauer comparison does not supply fraction-field vanishing without the residue-field hypothesis.
- In characteristic `p`, the constant extension `k((t)) ⊂ k((t^{1/p}))` has henselian valuation ring `k[[t^{1/p}]]` and the same residue field, and its Brauer group also vanishes.
- With `δ > 1`, §1.2 realizes only `δξ`, whereas the strict-local generic theorem realizes `ξ` itself. For a regular model it extends that representative without assuming a rank-one quasi-section.
- A rational point on the generic curve kills the obstruction by the section split even over a field with nonzero Brauer group; it is a separate sufficient hypothesis.
- Extension of the generic bundle uses regularity of the total space and does not follow from Brauer vanishing alone.

*Source:* BLR §8.1, p. 203, case (b) and the obstruction sequence, and §9.5, Lemma 2 and its proof, p. 265. SchemeAndStackFoundations §2.22 supplies the field Brauer/cohomology identification; use the Stein factorization and obstruction sequence in BLR's proof. The supplier's henselian-ring comparison is distinct from the fraction-field vanishing proved here. The p-adic boundary uses ClassFieldTheory, Layer 5's local Brauer invariant.

*Needs:* §§1.2–1.5; SchemeAndStackFoundations §§2.22 and 3.6 for Brauer cohomology, Stein factorization and invertible-sheaf descent; ComplexComparisonPartII §C3.2d.4 for the universal-global-functions obstruction sequence; the normal divisor and regular divisor-extension interfaces used in §3.2.

### 3.3 Regular models and Raynaud's full Néron comparison

Suppose `X/S` is proper, flat and regular with geometrically irreducible generic fibre. Assume that `k` is perfect **or** `X` has an étale quasi-section, meaning a section after an étale surjective base change around the closed point. Prove `raynaud_regularNeron`: the quotient `Q` of §3.1 is of finite type and has the full smooth-test Néron mapping property for `J_K = Pic⁰_{X_K/K}`. Thus it is the marked finite-type Néron model of `J_K`. If `δ = 1`, the comparison of §3.2 gives `Pic⁰_{X/S} ≅ Q⁰`. This target retains the perfect-residue or quasi-section alternative and the line-bundle compatibility beyond the semistable and algebraically closed gcd-one cases.

The proof has two independent obligations. First prove finite type, using the intersection-form control on the special fibre and the finite-index lattice of vertical-divisor relations. The modified intersection matrix and its negative-definite quotient, detailed in §4.4, enter as algebraic estimates; their geometric component-group isomorphism is not assumed here. This avoids a circular appeal to the component theorem. In the geometrically reduced generic case an alternative finiteness proof compares with an existing Néron model and uses the finitely generated Néron–Severi group, but the intersection argument covers the full normal generic case.

Second prove extension on every smooth test `T/S`. With a section, a generic Picard-valued map corresponds to an actual line bundle on `X_K × T_K`. Since `X ×_S T` is regular, extend its Cartier divisor and pass to the quotient; vertical ambiguities vanish there. For the perfect-residue alternative, pass to a strict henselization of `R`, whose residue field is algebraically closed. Apply §3.2a's `brauer_fractionField_henselianDVR_algClosedResidue` and `strictLocal_genericPicardClass_representable` to get `P(R^sh) → P_K(K^sh)` surjective, hence `Q(R^sh) → Q_K(K^sh)` surjective. With smoothness, separatedness and finite type established, the supplied finite-type **group-scheme** extension criterion gives the full smooth-test mapping property; then descend and glue. The trait Brauer theorem is used for these étale points, rather than for fraction fields of higher-dimensional smooth test schemes. Uniqueness comes from separatedness and generic density. Record the mapping-property bijection for all smooth `T`, not just `T = S`.

The API includes `finiteType`, `neronMappingProperty`, `neronIso`, `genericCompatibility`, `identityPicardIso`, `lineBundleClass_compatibility`, `etaleBaseChange` and `localize`. If `X` is projective with geometrically reduced irreducible fibres, `Pic⁰` itself is the full Néron model and the special fibre is connected. A smooth generic fibre makes `J_K` abelian; for a merely normal generic curve keep the smooth Picard-group formulation supported by the theorem.

**Checks.**

- Good reduction gives the abelian scheme, with no additional components.
- For split multiplicative elliptic reduction of type `I_n`, `Pic⁰` has `G_m` as special identity fibre but `Q` has `n` geometric components.
- A regular pointed model has an étale quasi-section automatically, so does not need perfect `k`.
- A smooth proper scheme with the extension property for sections need not be a Néron model: `P¹_R` and a nonextendible generic projective automorphism give a smooth-test counterexample.
- A locally finite-type quotient is not declared finite type until the lattice or comparison argument proves it.

*Source:* BLR §9.5, Theorem 4 and Remark 5, pp. 267–268; Lemmas 7–11, pp. 269–273, for finiteness; Theorem 1, p. 264, for geometrically reduced irreducible fibres. The full mapping-property definition and group-scheme criterion are supplied by NeronModelsAndSemistableAbelianVarieties §§1.1–1.8, based on BLR §1.2, pp. 12–16, and §7.1.

*Needs:* §§3.1–3.2a, the divisor-extension and intersection-form foundations, §1.2's realization interface, and NeronModelsAndSemistableAbelianVarieties §§1.1–1.10. The numerical intersection estimates precede their component interpretation in §4.4.

### 3.4 Rational singularities and the identity comparison

Let `X/S` be proper, flat and normal with geometrically irreducible generic fibre, and let `π` : `X′ → X` be a proper desingularization. Assume `k` perfect or an étale quasi-section, and `δ = 1`. Define `HasRationalSingularities(X)` by `R¹π_*O_{X′} = 0`, using the established resolution interface and proving independence of the chosen resolution in this surface setting. Prove `picardNeronIdentity_iff_rational`: `Pic⁰_{X/S} → N⁰` is an isomorphism if and only if `X` has rational singularities. `N` exists by applying §3.3 to `X′`; the generic Jacobian is unchanged.

The comparison factors through `π*` : `Pic⁰_X → Pic⁰_{X′} ≅ N⁰`. Identify its Lie map with `H¹(X,O_X) → H¹(X′,O_{X′})` using the supplied dual-number Picard deformation calculation. The Leray sequence becomes

`0 → H¹(X,O_X) → H¹(X′,O_{X′}) → H⁰(X,R¹π_*O_{X′}) → 0`.

The final sheaf is supported on finitely many singular closed points, so its global sections vanish exactly when it does. In this specific Picard pullback comparison the Lie criterion yields the group-scheme isomorphism. Include the supporting kernel/separatedness argument from the normal-model Picard theorem; a generic isomorphism of smooth groups plus a Lie isomorphism is not a universal isomorphism criterion for arbitrary group morphisms.

The API includes `resolution_independent`, `pullbackPicard`, `lieMap_cohomology`, `lerayExact`, `comparisonIso_iff`, and `normalSemistable_comparison`. For a normal semistable curve the ordinary double points are rational singularities, giving `Pic⁰ ≅ N⁰` and semi-abelian reduction. The total space may have nodal surface singularities here.

**Checks.**

- If `X` is regular, `π =` id gives `R¹π_*O = 0` and recovers §3.3.
- The normal local model xy `= π^n` has a chain resolution of a rational double point and gives the same identity component.
- A resolution with nonzero `H⁰(R¹π_*O)` produces a non-isomorphism on the `H¹` lattices and hence fails the identity comparison.
- Smooth Lie algebras alone do not distinguish an étale isogeny of degree prime to `p` from an isomorphism; this is why the special Picard pullback argument is retained.
- Blowing up a regular closed point does not change the resulting Néron identity component.

*Source:* BLR §9.7, Theorem 1 and its proof, pp. 286–287; Corollary 2, p. 287, for normal semistable curves. The resolution and rational-double-point inputs are StableReduction, Layers 3–5, and SchemeAndStackFoundations, §§4.1, 4.6 and 4.11–4.14; the argument here is their Picard–Néron comparison.

*Needs:* §§3.2–3.3; the supplied resolution, Picard tangent-space and proper coherent Leray interfaces. For semistable reduction, use the semi-abelian special-fibre theorem of NeronModelsAndSemistableAbelianVarieties §§3.8–3.9.

### 3.5 Gluing the Picard-computed Néron model

Let `S` be a Dedekind base, `C/K` smooth proper geometrically connected, and `X/S` a regular proper flat model. At every height-one point `s` assume `κ(s)` perfect or an étale quasi-section for `X_{O_{S,s}}`. Prove `globalPicardNeronComparison`: `X` is smooth over a dense open `U`, the relative Jacobian on `U` is the supplied abelian scheme, and its local models at all `s` are exactly the quotients `Q_s` computed in §3.3. They identify canonically with the global Néron model `N` of `Jac(C)`. If every local geometric multiplicity gcd is one, `Pic⁰_{X/S}` is the identity open subgroup `N⁰`, with compatibility under localization and the local quotient maps.

Identify the local and global Néron objects of NeronModelsAndSemistableAbelianVarieties §1.9 with these Picard constructions. Use the finite complement `S` \ `U`, finite-presentation spreading of local models and canonical generic markings to identify the overlap maps. They satisfy the cocycle by Néron uniqueness. Checking the mapping property locally then gives the same global object; do not attempt to glue infinitely many unrelated local finite-type models without a dense open model.

The API gives `smoothOpen`, `goodLocusIso`, `localQuotientIso`, `identityPicardIso`, `localization_commutes`, `overlap_marking` and `etaleBaseChange`. It does not say that an arbitrary ramified pullback of `N` is Néron. If `S` is a field, the comparison is the field Jacobian and all special-fibre clauses are empty.

**Checks.**

- A smooth model on all of `S` recovers its relative Jacobian globally.
- A pointed regular model supplies local quasi-sections and `δ = 1` at every height-one point.
- With two bad primes, the local quotient comparisons agree on the common good open because both preserve the generic marking.
- The construction retains the full components at a bad prime; gluing only `Pic⁰` would lose them and fail the full mapping property.
- The field-base case introduces no artificial residue characteristic or component calculation.

*Source:* BLR §1.2, Propositions 3–4 and Lemma 5, pp. 13–14; §1.4, Proposition 1 and Theorem 3, pp. 18–20, for the supplied local-to-global machinery. The Picard identification is the local theorem of BLR §9.5, Theorem 4, p. 267, glued through its generic compatibility.

*Needs:* §§2.2 and 3.3–3.4; NeronModelsAndSemistableAbelianVarieties §§1.9–1.10. This direction of dependency does not ask that roadmap to import the present general quotient in order to supply its abstract existence theorem.

### Examples

The blown-up rational model shows why `E` is necessary. Split `I_n` reduction shows why `N⁰` and `N` differ. The normal surface xy `= π^n` shows why regularity of the total space can be relaxed for the identity comparison only through a rational-singularity theorem. A regular pointed model over an imperfect trait tests the étale-quasi-section alternative to perfection.

### Dependencies

Layers 0–2 supply the geometric data and rigidified presentations. The quotient-space bridges are §1.8. Néron definitions, uniqueness and abelian-variety existence come from NeronModelsAndSemistableAbelianVarieties, Layer 1. Intersection estimates in the proof of §3.3 are proved before the geometric component presentation in §4.4, so the latter is not used to prove existence of the Néron model it describes.

## Layer 4: Reduction, torsion and normalized multidegrees

### 4.1 Reduction to the full special fibre

For a separated commutative group scheme `G` locally of finite type over a DVR `R`, define `reductionHom : G(R) → G_k(k)` by restricting a section. Prove functoriality in `G`, compatibility with DVR morphisms and their residue maps, preservation of addition and identity, and injectivity of `G(R) → G_K(K)` by separatedness and generic density. Smoothness is not needed to define reduction or to prove that generic restriction is injective. For smooth `G` over a henselian `R`, reduction is surjective onto `G_k(k)` by henselian lifting.

For a Néron model `N` of `A/K`, its mapping property identifies `A(K)` with `N(R)`. Define the formal reduction kernel `A₁(K) = ker(red)`, and `A₀(K) = N⁰(R)`, the subgroup specializing into the identity component. Then `A₁(K) ⊆ A₀(K)` and `red⁻¹(N⁰_k(k)) = N⁰(R)`. The component map gives an injection `A(K)/A₀(K) ↪ Φ(k)`. If `R` is henselian, its image is the image of `N_k(k)` in `Φ(k)`; equality with `Φ(k)` requires that the corresponding `N⁰_k-torsors` have rational points. Sufficiently, `H¹(k,N⁰_k) = 0`. For finite `k` this follows from the supplied Lang theorem, so `A(K)/A₀(K) ≅ Φ(k)`.

The API includes `reductionHom`, `genericRestriction_injective`, `reduction_natural`, `formalKernel`, `identityPreimage`, `componentHom`, `componentKernel`, `componentQuotient_injective`, `reduction_surjective_of_henselian_smooth` and `componentQuotient_iso_of_H1_zero`. The two surjectivity statements have different hypotheses. Full component groups and identity components are schemes or fppf quotient sheaves before taking rational points; replacing them by a set of components prematurely would miss the torsor obstruction.

**Checks.**

- For `G_m` over `Z_p`, reduction is `u ↦ u mod p`, its kernel is `1 + pZ_p`, and its identity-component preimage is all R-units. A proved Lean example identifies `reductionHom` with the residue map on units under `TauCeti.DiagonalizableGroup.multiplicativeGroupSchemePointsMulEquiv`.
- For a finite constant group scheme, reduction is the identity on the constant group. A proved Lean example uses `TauCeti.ConstantGroup.groupScheme` and its evaluation points to show that any nonidentity constant point remains nonidentity under `reductionHom`.
- For an abelian scheme, `A(K) = A(R)` and this is its usual point reduction.
- For `μ₃` over `Z_(7)`, the integral points are `{1}` while `μ₃(F₇)` has three elements, so nonhenselian reduction need not be onto even for a smooth finite group.
- For finite `k`, Lang supplies the extra component lifting; without that hypothesis, the exact rational-point sequence ends in `H¹(k,N⁰_k)`, not in zero automatically.
- A split `I_n` fibre tests that `Φ` can be nontrivial even when `N⁰_k` is connected and smooth.

*Source:* the pinned `TauCeti.Algebra.AlgebraicGroup.ConstantGroup.Scheme` and `TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Scheme.Points` supply the native group schemes and point comparisons for the Lean examples. Restriction of the functor of points and the Néron mapping property of BLR §1.2, pp. 12–15; smooth henselian lifting in BLR §2.3, Proposition 5, pp. 47–48; the component quotient interface of NeronModelsAndSemistableAbelianVarieties §2.2. The finite-field `H¹` vanishing is imported from ReductiveGroupsPartII §RG2.3.7. The `A₁/A₀` arithmetic distinction is part of this reduction interface.

*Needs:* Mathlib scheme-valued points and pullback; SchemeAndStackFoundations group torsors and their rational-point exact sequence; NeronModelsAndSemistableAbelianVarieties, Layers 1–2; the supplied Lang theorem only for its stated finite-field consequence.

### 4.2 Torsion in the reduction kernel

Let `G` be a separated commutative **finite-type** group scheme over a DVR `R`; neither smoothness nor properness is assumed. Prove `torsionReductionKernel_pPrimary`: if `x ∈ G(R)` has exact finite order `n` and reduces to the identity, then `n` is a power of the residue characteristic exponent `p`. In residue characteristic zero this says `n = 1`. Equivalently reduction is injective on the prime-to-p torsion subgroup. In mixed characteristic (0,p), prove `torsionReduction_injective_of_smallRamification`: if `e = v_R(p) < p − 1`, reduction is injective on all torsion. Keep the strict inequality; it excludes `p = 2` for an ordinary mixed-characteristic DVR.

Here is the finite-flat step connecting the supplied theorem to this `G`. Take the schematic closure `H` of the cyclic generic subgroup generated by `x`. Each generic point is an R-section; their finite union is closed because `G` is separated, and is finite over `R`. The schematic closure inside that union is finite and torsion free over `R`, hence flat. Generic-density compatibility with the group operations makes `H` a finite flat commutative subgroup. Its generic fibre is the constant cyclic group of order `n`, so its rank is `n`. This argument supplies the finite closure even though the ambient `G` is not assumed finite flat.

For the prime-to-p part, rank-annihilation and étaleness of finite flat groups of invertible order show that the relevant closure is finite étale; a section reducing to the identity is the identity by the separated étale diagonal over the local base. For p-primary torsion under the strict ramification bound, use the full faithfulness of generic fibre for finite flat p-groups: the constant model and `H` are uniquely isomorphic. Its distinct constant sections cannot coalesce under reduction. Split `n` into its prime-to-p and p-primary factors and combine these arguments. This is a finite-flat proof applicable without a smooth formal group of `G`.

The Lean milestones use a group object `G` in `Over (Spec R)`, the native point groups and §4.1's `reductionHom`, with commutativity, separatedness and finite type where used. `torsionReductionKernel_pPrimary` states the order conclusion for finite-order integral points, using `ExpChar` so that residue characteristic zero has exponent 1. `torsionReduction_injective_of_residueCharZero` states torsion injectivity in that case. `torsionReduction_injective_of_smallRamification` uses characteristic zero on `R`, residue characteristic `p`, and `IsDiscreteValuationRing.addVal R (p : R) = e < p − 1`. The API also records prime-to-p injectivity, compatibility with homomorphisms and the sharp boundary example. A bound on the formal kernel is not an assertion that all special-fibre p-torsion lifts or that all finite flat groups are étale.

**Checks.**

- In equal characteristic zero every torsion point in the reduction kernel is zero.
- For `μ_p` over `Z_p[ζ_p]`, the primitive root `ζ_p` has order `p` and reduces to 1, while `e = p − 1`: this witnesses the sharpness of the strict inequality.
- For `p = 2` over `Z₂`, `−1` reduces to 1, so a claim of full torsion injectivity at `e = 1` would be false. The named boundary target `dyadic_negOne_reduction` states that the unit `−1` is nonidentity of exact order two and reduces to 1 over a characteristic-zero DVR with residue characteristic two.
- A finite constant p-group can have injective reduction in characteristic `p`; the p-primary-kernel theorem allows this and does not force a nonzero kernel.
- For `G_m` the prime-to-p roots of unity remain distinct after reduction. None of these statements require a rational point on a curve.

*Source:* BLR §7.5, Lemma 5, p. 187, and the boundary phenomena in Examples 7–8, pp. 189–190. Rank-annihilation is ModularCurves `0B`; finite-flat étaleness and small-ramification uniqueness are FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.2 and R07.1.30, the latter using Raynaud's strict `e < p − 1` theorem. The finite closure in the ambient `G` is the section-union argument above, not an invocation of a theorem whose ambient group is already finite.

*Needs:* §4.1; finite flat group schemes, rank-annihilation and the cited Raynaud supplier; Dedekind torsion-free flatness. No Picard or Jacobian construction is needed for this general torsion theorem.

### 4.3 Global torsion bounds at good and bad primes

Let `S` be a Dedekind scheme with function field `K`, `A/K` an abelian variety and `N` its finite-type Néron model. Prove `globalTorsionReduction`: for every height-one point `s`, restriction `N(S) → N(O_{S,s})` followed by reduction to `N_s(κ(s))` is injective on `prime-to-p_s` torsion, and in mixed characteristic is injective on all torsion when `e_s < p_s − 1`. Use `A(K) = N(S)` by the Néron mapping property, then apply §4.2 locally. The target is the **full** Néron special fibre and so the theorem applies at bad as well as good reduction.

For finite `κ(s)`, deduce divisibility of the order of the allowed finite torsion subgroup by `#N_s(κ(s))`. The injection itself proves finiteness of that subgroup. If `H¹(κ(s),N⁰_s) = 0`, as for finite residue fields, `#N_s(κ(s)) = #N⁰_s(κ(s))·#Φ_s(κ(s))`; include this as the component-aware counting interface. Do not use only the identity-fibre count unless the relevant torsion is known to specialize into it.

Over a number field the hypotheses are evaluated at each finite place separately. In particular, for `A/Q` and every odd prime `ℓ`, `e = 1 < ℓ − 1` and `A(Q)_tors` injects into `N_ℓ(F_ℓ)`, so its order divides that finite number. At 2 the odd-order torsion injects; the full-torsion assertion does not follow from this bound. Multiple primes give simultaneous divisibility constraints on the same rational torsion group.

**Checks.**

- At a good odd prime, this recovers the familiar bound from the abelian special fibre.
- At a split multiplicative prime the component factor is present, so a bound using only `G_m(F_q)` can lose torsion.
- The rational 2-torsion boundary at residue characteristic 2 must remain possible.
- Over a ramified number-field place with `e ≥ p − 1`, the prime-to-p bound still holds while full p-primary injectivity is not asserted.
- With `S` a field there are no height-one primes to which this result applies.

*Source:* the local theorem of BLR §7.5, Lemma 5, p. 187, applied to the global Néron model; BLR §1.2, Propositions 3–4, pp. 13–14, and §1.4, Theorem 3, pp. 19–20, for the supplied global model and its localization. The counting statement follows from the component torsor sequence and Lang's theorem, as in §4.1.

*Needs:* §§4.1–4.2; NeronModelsAndSemistableAbelianVarieties §§1.9–1.10 and 2.1–2.2. This theorem is for all abelian varieties; the curve-specific interpretation follows in §5.2.

### 4.4 The geometric component lattice and vertical correction

Let `X/R` be regular, proper and flat with geometrically irreducible generic curve, and assume `k` perfect or an étale quasi-section as in §3.3. For specialization of divisor classes assume additionally that the generic curve `C` is smooth geometrically connected. Pass to a strict henselization `R^sh`; denote the reduced special components by `C_i`, `i ∈ I`, and keep `d_i`, `e_i` and `δ_i = d_i e_i` from §1.1. Every vertical Weil divisor is Cartier. Set

`α : Z^I → Z^I`, `α_{ij} = deg_{C_i}(O_X(C_j)|_{C_i})/e_i`,

`β : Z^I → Z`, `β(a) = Σ_i δ_i a_i`, `ρ(L)_i = deg_{C_i}(L|_{C_i})/e_i`.

Prove that these are integral homomorphisms, `β α = 0` and `ρ(O_X(Σ c_i C_i)) = αc`. The unmodified intersection matrix is symmetric, negative semidefinite and has rank `|I| − 1`; its rational kernel is generated by the fibre multiplicity vector `d = (d_i)`. Row division by `e_i` preserves rank and gives the degree relation through `δ_i`. Define the geometric component lattice `ComponentLattice(X)` by `ker β/im α`. This is finite. Its Smith invariant factors are the nonzero invariant factors of `α`, and its order is the gcd of its `(|I|−1)`-minors, with the usual empty-minor convention in the one-component case.

Prove `neronComponent_multidegreeIso`: `Φ(k^s) ≅ ComponentLattice(X)`, `G_k`-equivariantly, and hence `Φ(k) ≅ ComponentLattice(X)^{G_k}`. A total-degree-zero actual bundle `L` maps to `[ρ(L)]`, **not** generally to its unscaled partial-degree vector. The matrix, component permutation action and normalized-degree map all descend through étale comparison. The additional content is the imperfect-residue normalization, Galois descent and the `δ > 1` case allowed by the perfect-residue alternative.

The proof first gives a natural surjection from the lattice quotient to `Q(R^sh)/Q⁰(R^sh)` using vertical divisors and the degree-zero line-bundle extension theorem. Its injectivity requires the surjection `P⁰(R^sh) → Q⁰(R^sh)`. If `δ = 1`, this follows from §3.2. For `δ > 1` under the theorem's hypotheses, the strict-local residue field is algebraically closed; complete the DVR and prove the finite-level comparison below. This is a prerequisite inside this target, not an unspecified Greenberg theorem supplied by the Néron roadmap.

**Finite-level construction and lifting contract.** For a complete DVR with algebraically closed residue field, put `R_n = R/(πⁿ)`, `n ≥ 1`. ReductiveGroupsPartII §RG2.3.7, `finite-level-jet-realizations` (`jetScheme`), owns the affine local-field case. Extend its construction by gluing and étale descent to arbitrary complete DVRs with algebraically closed residue field, locally finite-type schemes and smooth group spaces. Construct the Greenberg ring spaces `B_n` and the functors `Gr_n` on locally finite-type `R_n`-schemes, characterized by maps from the associated locally ringed space `h_n(T)`, whose structure sheaf consists of morphisms to `B_n`. In equal characteristic with a coefficient field this is Weil restriction from `R_n` to `k`. In mixed characteristic construct `B_n` from finite Witt-coordinate presentations of `R_n`, with polynomial addition and multiplication; verify the representing functor and transition comparisons, rather than treating `R_n` as a k-algebra. Prove representability, compatibility with products and open/closed immersions, and preservation of smooth and étale morphisms. Étale descent extends the construction to the smooth group algebraic spaces used here. For such groups, `Gr_n(G)(k) = G(R_n)`, `Gr_n` respects identity components, and the transition kernels for smooth groups have the required affine-space structure. On the supplied local-field range, prove compatibility of ring-coordinate conventions, truncations and inverse limits of geometric points with `jetScheme`; compare point functors on the perfect test algebras used by that supplier.

Prove the precise lifting lemma: for smooth commutative group algebraic spaces `G → H` over this complete `R`, if `G(R)/G⁰(R)` is finitely generated and `G(R) → H(R)` is onto, then `G⁰(R) → H⁰(R)` is onto. At every `n`, the induced map of Greenberg groups is surjective on k-points. A positive-dimensional connected quotient cannot have finitely generated k-points, so the identity components are surjective on k-points too. To pass to compatible lifts, restrict to the finite-type identity groups at each level. The images of their kernel groups in each fixed finite level are closed subgroup schemes in a finite-type group, and the descending images stabilize. Use this Mittag–Leffler property on the fibres of lifting, then completeness/effectivity of compatible points. Merely taking an inverse limit of surjections without this argument is insufficient. Apply the lemma to `(P,Y) → Q`; the rigidified Picard presentation is smooth. Over the algebraically closed residue field, the unit groups of the finite-dimensional algebras `Γ(X_k,O)` and `Γ(Y_k,O)` are smooth and connected: each is a product of multiplicative groups extended by a nilpotent-unit group. Their quotient, the kernel of forgetting rigidification in §1.3, is connected. Thus the geometric components of the total-degree-zero rigidified Picard space identify with the total-degree-zero subgroup of `NS(X_k)`. Reduction embeds `G(R)/G⁰(R)` in this component group, so `curveNeronSeveri_finite` from §1.1 proves its finite generation, including for reducible or nonreduced `X_k`. For a point of `Q(R)`, §3.2a's `strictLocal_genericPicardClass_representable` realizes its generic class by an actual line bundle and extends it to the regular model; equality back in `Q(R)` follows by separatedness. A trivialization on the finite flat rigidificator over the local base then lifts it to `(P,Y)(R)`, proving the required surjectivity on R-points even when `δ > 1`. The Brauer input is §3.2a's fraction-field theorem, including the purely inseparable constant extension. Compare back from completion through the unchanged component and intersection data. This finishes the component isomorphism.

The Greenberg API needed here is `level`, `ringSpace`, `pointsEquiv`, `transition`, `products`, `smooth`, `etaleDescent`, `identityComponent`, `kernelImages_stabilize` and `identityPoints_surjective`. The extension here has the complete algebraically closed residue-field range used in this proof; the affine local-field construction remains the cited supplier's interface.

**Checks for the finite-level construction.**

- At `n = 1`, `Gr_1(G)` recovers the special-fibre group. For affine local-field models its coordinates and truncations agree with the supplied `jetScheme` construction.
- In equal characteristic `Gr_n(A¹) = A^n`, with k-points the truncated polynomials of degree less than `n`.
- For `G_m`, its points are `R_n^×` and the reduction kernel is the principal-unit group, which excludes nonunits in `R_n`.
- In mixed characteristic a direct k-algebra Weil restriction is rejected because `p` need not vanish in `R_n`.

For a smooth generic curve with a rational base point, a degree-zero divisor `D` supported on K-points extends horizontally to an actual line bundle `L = O_X(D̄)`. Prove `specialization_componentFormula`: its component is `[ρ(L)]`. After an unramified extension use the same formula with the corresponding sections. The image lies in `N⁰(R^sh)` exactly when `ρ(L)` is in `im α`. If `αc = ρ(L)`, set `L′ = L ⊗ O_X(−Σ_i c_i C_i)`; then `ρ(L′) = 0` and the identity-component specialization is represented by `L′|_{X_k}`, under `Pic⁰ ≅ N⁰`. This formula is asserted when that identity comparison holds, in particular in the regular pointed case. It is not an identity-component value for a point with nonzero component. Over a nonclosed residue field it descends through the canonical Galois-equivariant comparison; a correction chosen after strict henselization need not itself be an invariant divisor.

The remaining API is `alpha_integral`, `beta_comp_alpha`, `rho_tensor`, `rho_vertical`, `lattice_finite`, `smithOrder`, `galoisAction`, `componentIso`, `componentOfClass`, `correction_exists_iff`, `correctedClass_independent` and `unramified_naturality`. In the pointed case `gcd d_i = 1`, so two correction vectors differ by an integral multiple of the whole fibre; its line bundle is trivial. More generally independence is interpreted in `Q` through `E`. Before using `NumericalType.Pic`, verify its weight convention: weights from constant-field dimensions in an abstract numerical type are not automatically the `e_i` above over an imperfect field. Construct a comparison only when the supplied numerical type has the matching relation lattice and degree map.

**Checks.**

- For the blow-up of `P¹` at a rational special point, `e = d = (1,1)`, `α = ((−1,1),(1,−1))`, `β(a) = a₁+a₂` and the quotient is zero.
- For split `I₂` reduction, `α = ((−2,2),(2,−2))` and `β(a) = a₁+a₂`, giving `Z/2`; a horizontal difference meeting the two components has vector `(1,−1)`, the nonzero class.
- For the doubled vector `(2,−2)`, choose `c = (−1,0)`; then `αc = (2,−2)` and `L(−Σc_i C_i)` has zero normalized degrees, checking the correction sign.
- A one-component fibre has `ker β = 0` and hence trivial component group in this theorem, including its allowed multiplicities.

For a separate convention witness, take formal numerical data `d = (1,1)`, `e = (1,2)` and symmetric intersection matrix `((−2,2),(2,−2))`. Then `α = ((−2,2),(1,−1))`, `β(a) = a₁+2a₂` and `ρ(O(C₁)) = (−2,1)`, which `β` kills. The unscaled vector `(−2,2)` is not killed by `β`. This is a test of the algebraic convention, not a claim that an arbitrary prescribed matrix and multiplicities are realized by a fibre. It detects both a missing division by `e_i` and a mistaken transpose. For `δ > 1`, the Greenberg lifting step above is still required even though the intersection lattice is easy to write down.

*Source:* BLR §9.5, Lemmas 9–11, pp. 270–273, for the normalized degrees, intersection relations and finiteness estimates; §9.6, Theorem 1, p. 274, for the component presentation; Lemma 2 and its Greenberg proof, pp. 275–277, for the `δ > 1` lifting step; Corollary 3, p. 277, for Smith factors and the order. The vertical correction is the line-bundle identity `ρ(L′) = ρ(L) − αc` and the comparison in §3.3. Galois descent follows by the étale naturality of all these maps.

*Needs:* §§0.2, 1.1–1.5, 3.1–3.3 (including both §3.2a targets) and 4.1; supplied surface intersection; §1.1's `picardIdentity_iff_geometricPartialDegreesZero` and `curveNeronSeveri_finite`; ReductiveGroupsPartII §RG2.3.7, `finite-level-jet-realizations` (`jetScheme`), for the affine local-field construction; Mathlib Witt-vector carriers and the group-space/descent foundations for the finite-level construction. The abstract `NumericalType.Pic` is used only after its actual weights and maps have been matched.

### Examples

`G_m` and constant groups check reduction without properness. `μ_p` at `e = p − 1` checks the sharp torsion threshold. The blown-up rational fibre and `I₂` distinguish a trivial component group from a nontrivial one with the same number of components. The `e = (1,2)` numerical witness fixes the row normalization and exposes an incorrect raw-multidegree formula. The Greenberg truncated-unit example checks the additional lifting machinery needed when `δ > 1`.

### Dependencies

General reduction uses only group schemes, torsors and Néron definitions. The torsion proof consumes the finite-flat rank and Raynaud full-faithfulness contracts. The component theorem consumes Layer 3's Néron comparison and its earlier intersection estimates, then builds the finite-level lifting argument stated here. Lang's theorem is imported from ReductiveGroupsPartII. No ramified Néron base-change theorem is assumed.

## Layer 5: Global models and the assembled specialization theorem

### 5.1 Regular proper models over excellent Dedekind bases

Let `S` be an excellent Dedekind scheme with function field `K` and let `C/K` be a smooth proper geometrically connected curve. Prove `exists_regularProperModel`: there is a regular proper flat model `X/S` with its chosen generic identification. Choose a nonconstant rational function `t` on `C`, put `F = K(C)`, and use §§0.3–0.4 to form the finite normal model `X_{F,t}`. Excellence supplies normalization finiteness even when the chosen map `F/K(t)` is inseparable; a separable choice is also possible for the smooth function field. Its generic normal proper curve is canonically `C`.

Resolve the normal arithmetic surface by finitely many normalized blow-ups supported at closed singular points of special fibres. The input resolution theorem applies because excellence gives finite normalization, a closed finite singular locus on this normal two-dimensional noetherian scheme, and the required formal normality at those points. The singular locus is disjoint from the regular generic curve and has codimension at least two; in a noetherian surface it is a finite set of closed points. Use the supplied trait resolution locally and the finite support to obtain the global modification, or apply the global surface-resolution criterion directly. Normalized blow-ups preserve the generic identification, and the resulting integral scheme is flat over `S` by torsion-freeness. Properness is preserved by composition; finite presentation follows over the noetherian base.

The global construction adds finite support, a generic marking and compatibility with the normalization charts to the local construction of StableReduction, Layers 4–5. Prove smoothness over a dense open of `S` by openness of smoothness and properness of `X/S`. Every K-point then extends to a smooth-locus section by §0.2. When `S` is a field, use `C` itself and omit the surface-resolution step. A resolution is not claimed to commute with every base change; comparison of the Jacobian's Néron model is canonical even when the chosen regular models differ.

The API includes `regularProperModel_exists`, `normalizationModification`, `genericIso`, `finiteBadSet`, `smoothDenseOpen`, `pointSection` and `localModelComparison`. Existence is a theorem with choices; there is no canonical regular model selected by the statement. Minimality, semistable fibres and stable reduction require additional hypotheses and the StableReduction interfaces.

**Checks.**

- For `C = P¹_K` take `P¹_S`, with no blow-up.
- For `S = Spec K` take the given curve.
- A plane integral model of a smooth curve need not be regular, so its schematic closure alone does not establish the theorem.
- A regular model can have a reducible or nonreduced fibre; resolution does not assert good reduction.
- Every rational point meets a smooth component of multiplicity one in the regular model.
- Excellence enters the normalization and resolution argument and must not be replaced by the bare assumption that the fraction field has characteristic zero.

*Source:* Stacks, Theorem 54.14.5, [tag 0BGP](https://stacks.math.columbia.edu/tag/0BGP), for resolution by normalized blow-ups under the stated surface conditions; §§0.3–0.4 for the normal finite model. StableReduction, Layers 4–5, supply the local regular-model and modification interfaces. BLR §9.7, pp. 286–287, explains the resolution setting used in the Picard comparison, but is not a separate proof of global resolution.

*Needs:* Layers 0 and 3's regularity interfaces; Mathlib normalization and morphism properties; SchemeAndStackFoundations, §§4.1, 4.6 and 4.11–4.14, and StableReduction, Layers 4–5, for normalized blow-ups and local resolution. The resolution theorem is used only within its excellent normal-surface range.

### 5.2 Specialization of a pointed curve and its Jacobian

Let `S` be an excellent Dedekind scheme, `C/K` smooth proper geometrically connected, and `P₀ ∈ C(K)`. Choose `X/S` from §5.1, let `e` be the section extending `P₀`, and let `N` be the Néron model of `J = Jac(C)`. Prove `pointedCurve_integralSpecialization` as the following compatible collection of identifications and homomorphisms, all preserving the generic marking and the zero class.

1. The section `e` lies in the smooth locus at every height-one point; it gives the étale quasi-section and `δ = 1` required in Layer 3. Thus `Pic⁰_{X/S} ≅ N⁰` globally. No perfection assumption on the residue fields is necessary in this pointed regular case.
2. Over the dense smooth open `U` of `X/S`, `N|_U` is the established relative Jacobian of `(X_U,e)`, representing degree-zero bundles rigidified along `e`. Its normalized universal family is the restriction specified in §2.2.
3. There are the natural actual-class identifications `J(K) ≅ Cl⁰(C)` and `J(K^s) ≅ Cl⁰(C_{K^s})`, with the latter `G_K-equivariant`. These compose the comparison in §2.3 with `SchemeWeilDivisor.map_picZero`.
4. At each height-one `s`, define `red_s` : `Cl⁰(C) → N_s(κ(s))` through `N(S)`. For a divisor supported on rational points, its component after strict henselization is `[ρ(O_X(D̄))]` in the lattice of §4.4. When that component is zero, a vertical correction with `αc = ρ` gives the identity-fibre class `O_X(D̄−Σc_i C_i)|_{X_s}`, interpreted after the specified descent comparison. For an arbitrary degree-zero actual divisor, extend its line bundle and use the same normalized-degree formula; closure multiplicities must be retained. At `s ∈ U` this is precisely the good-reduction class of §2.4.
5. The reduction map is injective on `prime-to-p_s` torsion, and on all torsion when the local ring has mixed characteristic `(0,p_s)` with `e_s < p_s − 1`. At a finite residue field it gives the full component-aware order bound of §4.3.
6. All constructions commute with localization and étale base change, including the component permutation action. For a henselian place, make this equivariance on the maximal unramified tower with its residue/decomposition action. More generally specify an extension of the chosen valuation and the resulting residue-field maps. An arbitrary `K^s-point` may require a ramified extension before being integral; this statement does not define its reduction using one fixed unramified model. On the good-reduction open the abelian scheme itself allows the stronger arbitrary DVR-extension comparison of §2.4.

The API is the package of comparison isomorphisms and their commuting squares, not a new structure wrapping every supplier. Give `identityComparison`, `goodOpenComparison`, `rationalClassComparison`, `specializationHom`, `componentFormula`, `identityCorrectionFormula`, `torsionInjective` and `etaleNaturality` as compatible named theorems. Independence of a chosen regular model follows through Néron uniqueness; independence of the representative of a divisor class follows through the actual line bundle and the separated quotient, not by assigning pointwise reductions to an arbitrary divisor without checking principal relations.

**Checks.**

- `P¹` has trivial Jacobian, component group and specialization on degree-zero classes.
- An elliptic curve with good reduction recovers its point reduction and the prime-to-p torsion theorem.
- At split `I₂` reduction, a class whose horizontal divisor meets opposite components has the nonzero component class; it has no identity-component specialization until a zero-component multiple or class is chosen.
- After a blow-up of a special point, the raw multidegree vector changes but its image in the canonical Néron component group and its corrected identity class remain the same.
- An imperfect residue field is permitted because `e` supplies a smooth quasi-section; the `e_i-normalization` still remains in the component formula.
- At `p = 2` or `e = p − 1` the theorem retains prime-to-p injectivity without asserting full torsion injectivity.
- Étale comparison preserves all these maps; a ramified change of a bad-reduction model is handled only after choosing and comparing its actual Néron model.

*Source:* assembled from the numbered results of Layers 0–4: BLR §3.1, Proposition 2, p. 61; §8.1, Proposition 4, p. 204; §9.4, Theorem 2 and Corollary 3, pp. 259–260; §9.5, Theorem 4, p. 267; §9.6, Theorem 1, p. 274; and §7.5, Lemma 5, p. 187. Global gluing is the supplied BLR §1.4, Theorem 3, pp. 19–20. The combined theorem introduces no additional representability or resolution assumption beyond those explicitly supplied in the preceding layers.

*Needs:* §§0.2, 2.2–2.4, 3.3–3.5, 4.1–4.4 and 5.1; the field Jacobian, actual divisor-class comparison and Néron uniqueness.

### Examples

Rational and elliptic curves test the trivial and nontrivial smooth endpoints. Split multiplicative reduction tests the necessity of the full special fibre. Changing the regular model by a blow-up tests canonical comparison rather than literal equality of intersection matrices. The pointed imperfect-residue case tests the actual quasi-section hypothesis instead of an unnecessary perfection restriction.

### Dependencies

The global model construction uses the excellence and resolution suppliers before any Picard comparison. Its point section activates Layer 3's quasi-section alternative. Layer 4 then supplies reduction, the lattice and torsion results. This closes the passage from a field curve to integral Jacobian specialization without importing modular-curve model geometry or stable-reduction conclusions.

## Worked examples

### A modular cusp class at good and bad primes

Take the modular interpretation and genus computation as consumer inputs. With `∞` as base point, `X₀(11)` identifies with its Jacobian. Parson, *Moduli of elliptic curves*, §8.1, Proposition 8.2, pp. 14–15, identifies `J₀(11)` with the Tate-form curve `y² − 10xy − 11y = x³ − 11x²`; the cusp difference `c = [(0)−(∞)]` has exact order five (§8.1, p. 14). These facts supply a concrete input to Layers 2–5, not a construction of a modular curve.

Here are direct computations in a more familiar integral equation. The change `X = x + 5`, `Y = y − 5x + 5` gives

`E` : `Y² + Y = X³ − X² − 10X − 20`.

Its invariants are `c₄ = 496`, `c₆ = 20008` and `Δ = −11⁵`. The point `P = (5,5)` satisfies `2P = (16,−61)`, `3P = (16,60)`, `4P = (5,−6)` and `5P = O`. Thus it has exact order five. The affine points at 2 are `(0,0)`, `(0,1)`, `(1,0)`, `(1,1)`, and at 3 they are `(1,0)`, `(1,2)`, `(2,0)`, `(2,2)`. Adding `O` gives `#E(F₂) = #E(F₃) = 5`. Since `e = 1 < 3−1`, §4.2 injects all rational torsion into `E(F₃)`, proving `E(Q)_tors ≅ Z/5Z` without a rank computation. At 2 only prime-to-2 injectivity is needed for this subgroup. In particular the nonzero order-five cusp class remains nonzero at both good primes. Its reduction is the difference of the two reduced cusp sections by §2.4.

At 11 the special Weierstrass cubic has its unique node at `(5,5)`. Translating to `u = X−5` and `v = Y−5` gives tangent cone `v² − 3u²`, with two distinct `F₁₁`-rational lines `v = ±5u`. Since `c₄` is an 11-adic unit and `v₁₁(Δ) = 5`, the supplied minimal-model criterion gives split `I₅` reduction. The minimal regular model has five rational components in a cycle, `N⁰_F₁₁ = G_m`, and `Φ(F₁₁) ≅ Z/5Z`. The four nonzero multiples of `P` all reduce to the Weierstrass node, so they lie outside `E₀(Q₁₁)`, the subgroup reducing to the nonsingular locus. Consequently their component classes generate `Φ(F₁₁)`. As `c` is a nonzero member of the same rational torsion group, its component does too. This computes the component conclusion of Parson §8.3, p. 16, directly from the equation; in the intervening paragraph on p. 15, the printed phrase “at 5” must be read as “at 11”, as its discriminant and following sentence show.

The nonsingular `F₁₁`-points number ten: remove the node from the ten affine points and add `O`. Equivalently `#G_m(F₁₁) = 10`. Lang's theorem gives `#N_F₁₁(F₁₁) = 10·5 = 50`. The c-subgroup injects into this full special fibre and maps isomorphically to its component group. It does not have an identity-component specialization as a degree-zero line bundle until a zero-component class is chosen. This is precisely the distinction between total degree zero and zero partial degrees in §§3.1 and 4.4; replacing `N_F₁₁` by `Pic⁰` of the fibre would lose the cusp class. No bound at this bad prime is deduced by pretending that `N_F₁₁` is an elliptic curve.

### Normal semistable modular models

Let `p > 3` be prime. Supply the Deligne–Rapoport normal semistable model of `X₀(p)` over `Z_p`, with its cusps and its two geometric rational components meeting at the supersingular points. The arithmetic-model statement used here is recorded in BLR §9.7, Proposition 3 and its proof, p. 288. That modular model, its thicknesses and the count of supersingular points belong to the modular-curve supplier. They are not consequences of the abstract normalization construction in Layer 0.

Semistable nodes are rational singularities, including a thickness-n local equation xy `= πⁿ` on a normal model, by the supplied singularity criterion. Thus §3.4 identifies `Pic⁰` of this normal model with the Néron identity component. On the geometric special fibre the normalization is two copies of `P¹`. If their intersection consists of `m` geometric nodes, the normalization unit sequence gives a torus `(G_m)^(m−1)`: the node gluing parameters `(G_m)^m` are divided by the one effective relative component scaling. The Jacobians of the two normalized components are zero. For `m = 1` this torus is trivial; for `m = 2` it is `G_m`. Over `F_p` the torus descends with the Frobenius permutation action on the nodes and need not be split. Thickness changes affect the regular-model intersection presentation and component group, so the torus rank alone does not compute `Φ`.

Resolve the model and apply §4.4 to compute `Φ` from the actual multiplicities and intersections. In the `p = 11` example the two-component normal model has two geometric nodes, with thicknesses accounting for the five-component cycle after resolution; using only the unweighted two-vertex graph would give the wrong component group. The full specialization of a horizontal cusp divisor is its normalized multidegree class in that regular intersection lattice. Only when that class vanishes can the negative vertical correction compute its `Pic⁰` value. This preserves the Deligne–Rapoport and Néron interfaces at the bad prime, including the distinction between a normal model and its regular resolution.

Finally, for arbitrary `N` and a prime `ℓ` ∤ `N`, supply the smooth proper `X₀(N)` model over `Z_ℓ` and specified cusp sections. Layer 2 identifies its relative Jacobian with the good-reduction Néron model, and sends a difference of rational cusps to the same difference on the special fibre. If a cusp is defined only after a finite extension, make that extension and its residue field explicit. At `ℓ` | `N`, use the actual normal or regular model and the Layer 3 hypotheses; neither the good-prime formula nor the `p > 3` prime-level geometry is asserted for every composite level or for the exceptional primes 2 and 3.

There is a useful broader consumer conclusion without a two-component description. For the normal integral `X₀(N)` model obtained by normalizing the j-line, BLR §9.7, Proposition 3, p. 288, supplies cohomological flatness and scheme representability of `Pic⁰` over `Z`, and identifies that group scheme with the Néron identity component after restricting to `Z[1/6]`. For primes dividing `N` to higher order, its proof uses the actual modular quotient singularities and multiplicity-one components. These are additional modular inputs to §§3.2 and 3.4; a prime-level semistable graph cannot replace them. At 2 and 3 the present example retains the general quotient and regular-resolution specialization of Layers 3–5 and makes no unsupported identity comparison for the normal modular model.

## Downstream consumers

| Consumer | Interface received |
| --- | --- |
| Modular-curve integral models and arithmetic applications | A regular or rational-singularity model supplies `Pic⁰ ≅ N⁰`; horizontal divisor classes have a component formula and, where appropriate, a vertical-corrected identity value. The modular interpretation and the fibre geometry remain the consumer's input. |
| HeightsRationalPointsAndObstructions | Reduction on the full Néron special fibre, with prime-to-p and small-ramification torsion injectivity and finite-field order bounds. No good-reduction assumption is hidden in the general bound. |
| Néron-model extensions and component computations | The general `P/E` presentation, the precise arbitrary-normal-model criterion and the normalized imperfect-residue component lattice. |
| StableReduction and explicit curve models | The global excellent-base marked regular model, its proper sections and chart cohomology. Stable and semistable reduction after field extension remain separate targets. |
| Class-field, divisor and Galois arithmetic | Natural `J(L) ≅ Cl⁰(C_L)` for pointed smooth curves and the specified unramified/decomposition-equivariant specialization, with actual-class obstructions retained in the unpointed case. |
| Explicit arithmetic-surface calculations | Integral-closure charts, the overlap quotient for `H¹`, normalized multidegrees, the column convention for `α` and the negative vertical-correction formula. |

## References

- `S`. Bosch, `W`. Lütkebohmert and `M`. Raynaud, *Néron Models*, Ergebnisse der Mathematik und ihrer Grenzgebiete `(3)`, vol. 21, Springer, 1990. The exact numbered results and printed pages used by each target are given there; the central inputs are §§8.1–8.4 and §§9.1, 9.3–9.7, together with §7.5, Lemma 5, and the Néron foundational results cited above.
- The Stacks Project, [relative normalization, §29.54](https://stacks.math.columbia.edu/tag/0BAK), Definitions/Lemmas [035H](https://stacks.math.columbia.edu/tag/035H), [035I](https://stacks.math.columbia.edu/tag/035I), and the integral-closure finiteness lemma [032L](https://stacks.math.columbia.edu/tag/032L); the Dedekind flatness lemma [0AUW](https://stacks.math.columbia.edu/tag/0AUW).
- The Stacks Project, [Čech cohomology of schemes, §30.2](https://stacks.math.columbia.edu/tag/01X8), especially [01XB](https://stacks.math.columbia.edu/tag/01XB) and [01XD](https://stacks.math.columbia.edu/tag/01XD); [curves and function fields, 0BY1](https://stacks.math.columbia.edu/tag/0BY1); [one-dimensional normalization, 0C45](https://stacks.math.columbia.edu/tag/0C45).
- The Stacks Project, [positive degree and ampleness, 0B5X](https://stacks.math.columbia.edu/tag/0B5X), [fibre ampleness, 0D2S](https://stacks.math.columbia.edu/tag/0D2S), [projectivity over an affine base, 0B45](https://stacks.math.columbia.edu/tag/0B45), and [Lipman's resolution criterion, 0BGP](https://stacks.math.columbia.edu/tag/0BGP).
- The Tau Ceti roadmaps named in the supplier table provide the explicitly owned interfaces. Their use is by the stated mathematical contracts and layer locators; no imported result is a new construction in this roadmap.
- `J`. Parson, [*Moduli of elliptic curves*](https://math.stanford.edu/~conrad/vigregroup/vigre03/moduli.pdf), §8.1, Proposition 8.2, pp. 14–15, and §8.3, p. 16, for the modular identification and cusp class in the worked example. The equation changes, group-law multiples, point counts and node computations above are explicit calculations.
