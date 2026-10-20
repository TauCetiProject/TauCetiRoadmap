# Roadmap: arithmetic Iwasawa theory and the main conjecture

**Summary.** Build the arithmetic modules of cyclotomic towers, prove class-number growth and Ferrero–Washington vanishing, and prove the integral abelian Iwasawa main conjecture, including at 2. The final identity is `Det(C)⁻¹ = g Λ` for the bounded arithmetic complex with `H² = 𝔛_S` and `H³ = ℤ_p`. Its finite presentation form identifies the determinant ideal with the analytic ideal from their finite Selmer specializations. The route passes through circular units, global and local reciprocity, finite CM Selmer modules, Eisenstein congruences, and controlled inverse limits. It also gives the classical character formulation, the precise conditional consequences of Vandiver's conjecture, and the dyadic Euler characteristic used in Birch–Tate. The representative Lean signatures include `cyclotomicClassNumberGrowth`, `ferreroWashington_cyclotomic`, and the closed-ideal descent milestone `ideal_eq_of_joint_finite_images`. The integral main conjecture itself is the arithmetic target of §11.7; its Selmer and determinant carriers are constructed in the roadmap.

## Scope and ownership

The subject here is arithmetic over number fields. In particular, this roadmap owns the comparison between class groups and unramified Galois modules, the difference between field-level and weak Leopoldt, circular-unit index computations, the arithmetic proof of μ-vanishing, and the application of finite CM Fitting identities to the integral determinant main conjecture. The integral statement concerns the actual order `ℤ_p[[Gal(F_∞/k)]]`, including its nonregular components when the finite group has p-torsion. Replacing that order by the product of its character rings loses part of the assertion.

Generic algebra and cohomology have other owners. Completed group algebras, coordinates, characteristic ideals, elementary-module structure, Weierstrass preparation, generic growth, determinant functors, compact Nakayama, lattice transposes, and quadratic-presentation algebra are consumed from **PadicMeasuresIwasawaAlgebras**, §§1–6. The current Tau Ceti library already provides completed group algebras and their one-variable coordinate, as well as all Fitting ideals and their arbitrary scalar-change theorem. They are prerequisites, not new targets here. The arithmetic norm on class groups is also already in Tau Ceti. Generic continuous cohomology and Kummer theory come from **ProfiniteCohomology**, Layers 0–12, and local finite-module duality from **ClassFieldTheory**, Layer 5. The global finite-coefficient duality needed here is a target of §2.0. Sections 10.0–10.3 construct the compact coefficient, mapping-fiber and derived tower comparisons used in the arithmetic proof. Section 2.7 proves the unit/class four-term sequence over arbitrary number fields, with the rational odd-prime tower as a specialization and with the real dyadic signs retained.

The canonical Kubota–Leopoldt pseudomeasure and its integral smoothing are constructed in §5.0. Sections 6.0–6.3 construct the totally real Deligne–Ribet pseudomeasure, its rational special values, and the integral smoothed distributions. Sections 7.1–7.3 construct Coleman norm and interpolation for every prime and finite unramified coefficient field, then the normalized odd-prime arithmetic map and its circular-unit image ideal. Their arithmetic normalization and comparison with the class modules are part of those targets. **LinearFormsInLogarithms** §8.10 supplies the qualitative p-adic linear independence theorem; this roadmap supplies its passage from the logarithm's convergence domain to arbitrary algebraic numbers and the abelian-unit resolvent argument. Washington's boundedness theorem for the prime-to-tower-primary part concerns a different primary component from Ferrero–Washington and is outside this roadmap's targets.

Finite rational modular forms and Hecke operators come from **ModularForms**, Layers 0–8, and the determinant and Ribet algebra from **IntegralHeckeAndGaloisDeterminants**, Layer 6. Rational ordinary control is constructed in §9.0; finite-weight Hilbert forms and their Galois realization are constructed in §§9.3–9.5. Three further interfaces needed in the proof are stated explicitly below: full ordinary forms and `a₁`-duality at a rational Eisenstein localization; the trace-limit ordinary Tate module over total fractions at that localization; and the all-prime, arbitrary-degree finite-weight Hilbert congruence and weighted Ribet construction. The usual residually irreducible family theorem does not supply these interfaces. These extensions are built before their arithmetic use.

The compact-support cochain construction, its ordinary real-archimedean comparison and the bounded Burns–Flach integral model at 2 are arithmetic targets of §§2.0 and 10.0–10.2. Likewise, Fitting continuity and lifting bounded numbers of relations are supplied below in the exact form needed for the finite-to-infinite argument; no theorem about compatible finite matrices is assumed. Integral invertible-lattice detection over a finite group order is stated separately from agreement at height one.

This roadmap does not prove Leopoldt or Greenberg for arbitrary number fields, does not assume Vandiver, and does not prove a noncommutative main conjecture. The special-value statements here stop at étale cohomology and Iwasawa modules; their algebraic K-theory interpretation is given downstream by SpecialValuesBirchTate, which consumes the cohomological and Iwasawa inputs proved here. The finite exterior-bidual interface needed for the Rubin–Stark consequence is constructed in §12.6. Broader Euler-system contraction and transfer theory is outside the finite exterior-bidual argument here. A second, Euler-system proof of the rational cyclotomic main conjecture is given downstream by EulerSystemsCyclotomicMainConjecture, which consumes this roadmap; the Eisenstein construction here is a distinct proof interface, and the resulting theorem is shared rather than declared twice.

## Conventions

Fix a prime `p`, a number field inside a fixed algebraic closure, and compatible embeddings of all finite extensions into that closure. Set `q=p` for odd p and `q=4` for `p=2`. Write `D_p=ℚ_p/ℤ_p`. Unless a coefficient extension is explicitly specified, modules are over `ℤ_p`. A coefficient ring `O` is the ring of integers of a finite extension of `ℚ_p`, with uniformizer `π`, ramification index `e=v_π(p)`, and residue degree `f`. Thus `#(O/aO)=p^{f v_π(a)}` for nonzero a. A formula using `[O:ℤ_p]v_p(a)` is restricted to unramified O or uses the extended valuation `v_p=v_π/e`. Equal-characteristic DVRs are not coefficient rings for these arithmetic statements.

For a `ℤ_p`-extension, `Γ=Gal(K_∞/K)`, `Γ_n=Γ^{pⁿ}`, and `K_n=K_∞^{Γ_n}`; the index n means `[K_n:K]=pⁿ`. For `ℚ`, the cyclotomic exponent is `n+1` at odd p and `n+2` at 2. A source's `ℚ(μ_{p^a})` is denoted `F(a)` when its exponent a must be kept visible. Class groups are ordinary wide ideal class groups. Real ramification is permitted in an S-ramified extension exactly when the real place belongs to S; all global S used for the main conjecture contain the infinite places. Narrow class groups are never substituted silently.

For a cyclotomic tower write κ for the **full** cyclotomic character on `Gal(K(μ_{p∞})/K)`. Its principal-unit projection kills Δ and induces `κ_Γ:Γ→1+qℤ_p`. Choose a topological generator γ of Γ and put `u=κ_Γ(γ)`. On an arbitrary `ℤ_p`-extension no cyclotomic character on Γ is assumed. At 2, even when Δ is trivial, κ can have a nontrivial sign; κ and κ_Γ are then different characters. The coordinate is `T=γ−1`, and `ω_n=(1+T)^{pⁿ}−1`. For `m≥n`, `ν_{m,n}=Σ_{i=0}^{p^{m−n}−1}γ^{i pⁿ}`, so `ω_m=ω_n ν_{m,n}`. Element and class norms go **down** the tower; extension of ideals goes up. On a compact arithmetic Galois module, γ acts by conjugation with a lift. On a dual it acts contragrediently: `(γφ)(x)=φ(γ⁻¹x)`. Kolster's covariant dual, explicitly identified when used, instead has `(γφ)(x)=φ(γx)`.

An actual Tate twist uses the full character: `σ·_r m=κ(σ)^r σ·m`. It descends to a Γ-module only when this character power factors through Γ. The coordinate twist by `κ_Γ^r` has `γ·_r m=u^r γ·m`; it agrees with the Tate twist when the full torsion-character factor is trivial, for example over a base containing `μ_q`, or in even dyadic weights. Write `Tw_a(γ)=u^aγ`; then the coordinate twist satisfies `char(M(r))=Tw_{−r}(char M)`, and specialization of `M(−r)` evaluates its original series at `u^r−1`. Where a full-character lift of γ is used instead, replace u by its actual κ-value. All Tate identifications below retain this factorization requirement; full-group formulas keep κ, not κ_Γ. Changing γ to `γ^c`, `c∈ℤ_p^×`, instead changes coordinate by `T↦(1+T)^c−1`; it is a different operation. The sharp involution is `σ↦σ⁻¹`. Arithmetic Frobenius acts on residue fields by `x↦x^{Nv}`. Stickelberger elements are normalized by `χ(Θ(s))=L(χ⁻¹,s)`. These choices fix every inverse in the later formulas.

For a CM involution j, the integral minus **quotient** is `M_−=M/(1+j)M`. The minus **eigenspace** is `M^{j=−1}`. They agree by an exact idempotent functor at odd p and generally differ at 2. A finite dyadic class module `A_n⁻` has a third, arithmetic convention: the kernel of the norm to the real field. Its comparison with the other two conventions retains the finite kernels and cokernels. The rational idempotent `(1−j)/2` never acts on an arbitrary integral dyadic module.

Complexes are cohomological. With the canonical acyclic trivialization over total fractions, a two-term free complex `[R --a→ R]` in degrees 0 and 1 has determinant lattice `aR`, hence inverse determinant `a⁻¹R`, for regular a. In degrees 1 and 2 its inverse determinant is `aR`. Thus a torsion module in degree 2 contributes its characteristic ideal to `Det(C)⁻¹`, whereas one in degree 3 contributes the inverse. A finite module can disappear from height-one localizations and still have nonzero derived specializations. Euler quotients always retain both its coinvariants and its invariant Tor term.

## Exact supplier contracts

**From Mathlib.** Use `PadicInt`, `Padic`, `PowerSeries`, `MonoidAlgebra`, `Matrix.det`, `Ideal.Quotient`, `Module.Finite`, `Module.Free`, and the ordinary localization and tensor-product APIs on their existing carriers. `NumberField.classNumber` is the finite cardinality of `ClassGroup (𝓞 K)`; `NumberField.classNumber_pos` supplies its nonvanishing before taking `padicValNat`. `CyclotomicField n ℚ` has its `NumberField` instance, including the degenerate orders 1 and 2. Cyclotomic roots and their Galois action use `IsPrimitiveRoot`, `IsCyclotomicExtension`, and `cyclotomicCharacter`; fixed fields use `IntermediateField.fixedField` and the infinite Galois correspondence. `IsPrimitiveRoot.geom_sum_isUnit` and `IsPrimitiveRoot.associated_sub_one_pow_sub_one_of_coprime` in `RingTheory.RootsOfUnity.CyclotomicUnits` already prove invertibility of the primitive cyclotomic ratio and association of primitive differences. Consume these at the ring of integers, using the geometric-sum identity to identify the field-valued ratio; they are not new arithmetic theorems. `NumberField.maximalRealSubfield` and `IsCyclotomicExtension.Rat.isCMField` supply the real subfield and CM structure of nonreal rational cyclotomic fields. `NumberField.IsCMField.indexRealUnits_eq_one_or_two` and `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv` supply the general CM unit-index bound and regulator comparison; the prime-power index-one theorem below is stronger. `Algebra.norm` is the element norm. `DomMulAct` and `DomMulAct.mk` give inverse precomposition on arbitrary functions as `(DomMulAct.mk g)⁻¹ • φ`; `Representation.dual` and `Representation.dual_apply` give its linear-functional form. Use these supplied actions. `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` and `dedekindZeta_residue_def` supply the analytic class-number residue with Mathlib's regulator normalization. PadicMeasuresIwasawaAlgebras §5.2 supplies compact Hausdorff inverse-system exactness; no surjectivity of every transition map is imposed. Mathlib's derived category alone does not provide the arithmetic complex or a determinant trivialization.

**From Tau Ceti.** `TauCeti.NumberTheory.NumberField.Cyclotomic.MaximalRealSubfield` supplies `TauCeti.IsCyclotomicExtension.Rat.galEquivZMod_symm_neg_one_apply_eq_self_iff`, `toSubfield_fixedField_zpowers_galEquivZMod_symm_neg_one`, and `toSubfield_intermediateFieldEquivSubgroupChar_symm_evenSubgroup`: inversion fixes precisely the maximal real subfield, which is also cut out by the even characters. The compatible family and its norm comparison in §1.1 add tower data to these existing finite-field identifications. `TauCeti.RingTheory.ClassGroup.RelNorm` supplies `ClassGroup.relNorm`, its principal-ideal compatibility `ClassGroup.relNorm_mk0`, and `ClassGroup.relNorm_extendedHom`: norm after extension raises a class to the extension degree. In additive p-primary notation that is multiplication by the degree. The current modules `Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic` and `.Map` supply `completedGroupAlgebra`, `proj`, `of`, and functorial maps. `.PowerSeries` supplies `powerSeriesCoordinate` for an infinite commutative pro-p group topologically generated by γ, carrying `X` to `γ−1`. The existing `.Filtration` API includes `ker_proj_comp_aeval`, `powerSeriesLevelEquiv`, and `ker_proj_comp_powerSeriesCoordinate`. `.ProductCoordinate` supplies `prodPowerSeriesCoordinate` and its projection kernels; `.DyadicCoordinate` supplies `dyadicCoordinate`, `dyadicLevel`, and `ker_proj_comp_dyadicCoordinate`. The arithmetic targets below identify these existing maps with field-layer projections. `TauCeti.RingTheory.FittingIdeal.Basic`, `.Generators`, and `.BaseChange` supply `TauCeti.fittingIdeal R M k`, `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_quotient_zero`, `fittingIdeal_le_of_surjective`, and `fittingIdeal_baseChange`; the last identifies every indexed Fitting ideal after arbitrary commutative scalar change. It requires a finite module and the displayed module/algebra structures, not flatness of the scalar change.

**Existing ray-class arithmetic.** `TauCeti.NumberTheory.NumberField.Global.RayClass.Exact` supplies `TauCeti.GlobalNumberFields.unitsResidueSignHom`, `rayClassToClassGroup_surjective`, and the three exactness statements `mulExact_unitsCongruenceSubgroup_unitsResidueSignHom`, `mulExact_unitsResidueSignHom_residueSignRayClass`, and `mulExact_residueSignRayClass_rayClassToClassGroup`. Their modulus includes both finite congruences and real signs. Use the finite modulus above T for the ordinary smoothed ray group. Section 8.2 adds the S-depleted quotient and S-unit localization, rather than constructing the ordinary ray group or its unit exact sequence again.

**From TauCetiRoadmap.GlobalNumberFields, ClassFieldTheory, and ProfiniteCohomology.** Consume cyclotomic ramification and the cyclotomic character from GlobalNumberFields §10; integral units, Dirichlet rank, and ideal arithmetic from its earlier layers; finite and infinite Artin reciprocity and Hilbert/ray class fields from ClassFieldTheory Layers 7–8 and 10–13; infinite Galois correspondence from Mathlib; continuous cochains `C•(G,M)`, exact sequences, Shapiro, cup products, Hilbert 90, Kummer, and all-degree cohomology from ProfiniteCohomology Layers 0–12; its Layer 10 supplies Hochschild–Serre. Reciprocity must commute with norm downstairs and restriction upstairs. LFunctions Layers 3–5 supply meromorphically extended Dedekind, Dirichlet and finite-order Hecke L-functions, their functional equations, primitive/presented Euler-factor comparisons, class-number formulas and Artin factorizations. Only those analytic functions and identities are used; no adelic zeta integral is a target here. RepresentationTheory/CharacterTheory Layers 0–3 supply finite abelian character orthogonality and the character basis; PadicMeasuresIwasawaAlgebras §6.1 supplies the associated character-ring lattice comparison. LinearFormsInLogarithms §8.10 supplies qualitative Baker–Brumer independence on the small exponential disc.

**From PadicMeasuresIwasawaAlgebras.** §§1–3 supply measures, Amice transforms, integration against continuous characters, pseudomeasures, and moment separation, including the distinction between existence and uniqueness of an interpolating object. §§4.1–4.7 supply pseudo-isomorphisms, elementary modules, μ and λ, change of generator, characteristic ideals, and the exact cyclotomic-cutoff growth theorem over `ℤ_p`; use its transition parameter `n₀=m+1` for arithmetic `ν_{n,m}`. For torsion modules over `ℤ_p[[T]]`, the full characteristic ideal is `(p^μ∏F_j^{n_j})`, whereas NSW calls only `∏F_j^{n_j}` the characteristic polynomial (NSW 5.3.5–5.3.9, pp. 290–293). §5.1 supplies determinant lattices with their shift and exact-triangle signs. §5.2 supplies compact inverse-limit exactness and compact Nakayama. §§6.1–6.3 supply character group rings, dual conventions, matrix transpose, and finite quadratic-presentation cardinality. In §6.1, `Iwasawa.jointEval_injective` and the full-rank character-image lattice give the injection `O[Δ]→∏_ψ O` with finite cokernel when O contains all character values; the idempotent criterion makes it an isomorphism exactly when `p∤#Δ`. The dyadic pair-congruence Check there supplies the failure of characterwise integrality. §§6.4–6.7 supply the compound-matrix and exterior-annihilator arguments. These contracts do not assert that arbitrary ideals in a nonnormal order are detected at height one, nor do they lift compatible presentation matrices from finite levels.

**Arithmetic cochains and étale carriers.** ClassFieldTheory Layer 5 supplies finite local Tate duality, the local invariant and local Euler characteristic. ProfiniteCohomology Layers 5–12 supply the exact sequences, restriction/corestriction, Shapiro, Kummer and spectral sequences from which §2.0 proves the global duality comparison. DerivedModuleAlgebra §§0.I.1, 0.2, 1.T.1, 1.1 and 1.1.1 supplies complexes, derived tensor/Hom, derived limits and their comparison maps; the arithmetic specialization and its real-place comparison are targets of §§10.0–10.3. EtaleCohomologyFoundations §§F.0–F.4 and 0.11 supply finite and adic étale coefficient sheaves, continuous actions, base change, trace and curve duality. SchemeAndStackFoundations §2 supplies scheme and stack constructions. These are the geometric carriers used for `RΓ_et` of modular curves and Hilbert-form realization in Layer 9. No finite-cohomological-dimension assertion is imported at a real place above 2.

**Local tower and p-adic powers.** LocalFieldsRamification Layers 0–3 and LocalGaloisGroups Layer 0 supply the local integer rings, roots of unity and finite local cyclotomic extensions. Section 7.1 proves their integral-basis, series-evaluation and norm comparisons. ProfiniteArithmetic §1.3 supplies continuous `ℤ_p`-powers on pro-p groups; §7.2 applies them to the principal-unit norm limit and checks its completed action.

**Hecke and matrix algebra.** ModularForms Layers 0–8 supply rational modular forms, q-expansions, Hecke operators, integral Hecke lattices and finite Hecke pairings. IntegralHeckeAndGaloisDeterminants Layer 6 supplies generalized matrix algebras, the global distinct-character Ribet mechanism, and `IntegralRibet.local_ribet`, its coincident-character weighted local variant, including the finite containing lattice and induced-adic-topology hypotheses. The distinct-character theorem there has global outputs; §9.6 adds its weighted local extension and verifies the arithmetic lattice input. Section 9.0 proves ordinary control and the normalized rational Eisenstein family; §§9.1–9.2 prove full-form duality and the trace-limit ordinary Tate module at the Eisenstein localization. Sections 9.3–9.5 construct the all-prime finite-weight Hilbert objects and Galois representations with their ordinary local compatibility. Their residual, degree, coefficient and level hypotheses are stated in those sections.

## How to read the build

Layers 0–3 construct and control arithmetic towers and prove the class-number growth theorem without a main conjecture. Layers 4–5 prove abelian Leopoldt and Ferrero–Washington independently of the later Eisenstein arguments. Layers 6–7 fix analytic normalization and give the conditional Vandiver identifications. Layers 8–9 prove the finite CM Fitting identities and the rational Eisenstein divisibility. Layers 10–11 handle derived descent, the bounded dyadic arithmetic model, and integral passage to the inverse limit. Layer 12 extracts the classical and special-value conclusions. Each use of a finite presentation is separated from injectivity of its matrix; the latter is asserted only after analytic nonvanishing at the infinite level.

## Layer 0: cyclotomic towers and arithmetic actions

### 0.1 A cyclotomic extension with its finite torsion retained

For a number field K, define `fullCyclotomicTower K p` as the field generated by all p-power roots of unity. Define `torsionCharSubgroup` as the finite torsion subgroup Δ of its Galois group, and `cyclotomicZpExtension K p` as its fixed field. Prove `cyclotomicChar_injective_open`, `cyclotomicZpExtension_unique`, and `cyclotomicZpExtension_baseChange`: the full character has open image in `ℤ_p^×`, its torsion-free quotient is topologically isomorphic to `ℤ_p`, and for finite `L/K` the cyclotomic extension of L is `LK_∞`. The API includes `kappaFull_spec` on every p-power root, `sigmaOf_apply`, the fixed-field membership criterion, `Gamma_equiv_padicInt` after a generator choice, and compatibility with restriction. The full tower's minimality is proved by adjoining all those roots. (Sharifi, Definition 3.1.3, Lemmas 3.1.5–3.1.7 and Definition 3.1.8, pp. 75–76; Kolster 2009, Lecture 1 §1, pp. 5–6.)

For odd p the full group splits canonically into its prime-to-p torsion and the subgroup mapping to `1+pℤ_p`. At 2 a splitting of the torsion-free quotient need not be canonical. Define `teichmullerFull` on the full group by projection to the torsion of `ℤ_p^×`; its kernel at 2 fixes `K(i)`, but Δ need not be `Gal(K(i)/K)`. Prove the product description only with this qualification. *Needs:* the cyclotomic and fixed-field supplier contracts, and closed subgroups of the additive group `ℤ_p`.

**Checks.**

- For K=ℚ, p=3, fixing the order-two torsion gives the real cubic field inside `ℚ(ζ₉)` as the first layer. Taking the full cyclotomic field would give the wrong degree.
- At p=2 over ℚ the first layer is `ℚ(√2)⊂ℚ(ζ₈)`. The full tower contains i and is not the real `ℤ₂`-extension.
- If `μ_q⊂K`, Δ is trivial. This tests the fixed-field construction against the full tower in the case where they really agree.
- For `K=ℚ(√−2)` at 2, the full character image consists of the units congruent to 1 or 3 modulo 8. It is torsion-free although `K(i)≠K`; the definition of Δ must not use the degree of `K(i)/K`.
- On `ℚ(μ_{p^∞})`, a nontrivial Teichmüller character does not factor through the torsion-free quotient. This checks the domain of `teichmullerFull` independently of the chosen splitting.
- For `K=ℚ(√−2)` and a generator with full κ-value `3 mod 8`, the principal value is `−3=5 mod 8`. The first Tate twist uses 3, whereas the coordinate twist uses −3; their squares agree. Torsion-free image alone does not justify replacing the full character by its principal part.

### 0.2 General towers, layers, and the norm direction

Define `ZpExtension K L` to consist of a Galois extension with a topological group isomorphism `Gal(L/K)≃ℤ_p`. Define `layer n` as the fixed field of `pⁿℤ_p` under that isomorphism, independently of the chosen generator. Prove `layer_zero`, `layer_mono`, `finrank_layer`, `iSup_layer`, and `layerGaloisEquiv`; the finite quotient and field inclusions must commute with restriction. Define `layerNorm m n` only for `n≤m`; its element, ideal, and class versions agree through principal ideals. Prove transitivity and the two identities `norm_extend = p^{m−n}` and `extend_norm = ν_{m,n}` on additive class groups. (Sharifi, Definition 3.1.1, p. 75; Definition 3.2.3 and Remark 2.4.3, pp. 78, 52; RJW, Definition A.1 and Example A.2, p. 199.)

The cyclotomic specialization proves `layer_rat_exponent`: `ℚ_n⊂ℚ(μ_{p^{n+1}})` at odd p and `ℚ_n⊂ℚ(μ_{2^{n+2}})` at 2. A finite composite tower is reindexed by its actual intersection with the base tower, not by a guessed conductor exponent. *Needs:* §0.1, infinite Galois correspondence, and `ClassGroup.relNorm_extendedHom`.

**Checks.**

- The zeroth layer is K and its norm to K is the identity. In particular `ν_{n,n}=1`, not 0.
- For `m=n+1`, norm after extension is multiplication by p. For a base ideal `(a)`, the element norm of a is `a^p`, fixing the downward direction.
- For a quadratic layer, extension after norm is `1+σ`; on a class with σ acting as −1 it is zero. Replacing this operator by scalar p on the upper class group fails this test.
- For ℚ, p=5, the first `ℤ₅`-layer has degree 5 inside `ℚ(ζ₂₅)`, whereas `ℚ(ζ₅)` has degree 4. The layer/exponent API must distinguish them.

### 0.3 Ramification and inertia in a procyclic tower

Prove `zpExtension_unramified_away_p`, `zpExtension_infinite_split`, `zpExtension_exists_ramified`, and `zpExtension_eventually_totallyRamified` for an arbitrary number-field `ℤ_p`-extension. Away from p the tame local relation forces finite inertia, hence trivial inertia in the torsion-free group Γ. A real decomposition group has order at most two, hence is trivial, including at p=2. If every finite inertia group vanished, the abelian infinite tower would factor through the finite Hilbert class field. The finitely many nontrivial inertia groups above p are open subgroups of Γ; pass below their intersection to obtain eventual total ramification. (Sharifi, Proposition 3.1.9 and Lemma 3.1.10, pp. 76–77; RJW, Remark A.4(2), p. 200.)

For the cyclotomic tower, strengthen this to `cyclotomic_every_pPrime_ramifies` and `cyclotomic_no_finite_prime_splits_completely`. The former follows by local cyclotomic base change. For a prime away from p, a trivial decomposition group would make its positive integral norm a p-adic root of unity, which is impossible. Prove the arithmetic-Frobenius description `κ_Γ(Frob_ℓ)=⟨ℓ⟩` over ℚ, and linear disjointness from every finite prime-to-p extension. These stronger conclusions are not asserted for a general `ℤ_p`-extension. (Sharifi, Proposition 3.1.11 and Corollary 3.1.12, p. 77.)

### 0.4 Arithmetic completed actions and finite-layer quotients

For `E/K` Galois containing `K_∞` with `Gal(E/K_∞)` abelian pro-p, construct `arithmeticCompletedAction` by conjugation. Prove `conjugation_lift_independent`, continuity, and extension to the completed group algebra. Its API includes `arithmeticAction_artin`, `arithmeticAction_norm`, and linearity of continuous equivariant maps. For inverse systems of finite class modules, prove the action agrees with the inverse-limit action of finite group rings. This is the arithmetic identification with the supplied completed algebra, rather than a second construction of that algebra. (Sharifi, Definition 3.2.2 and Remark 3.2.5, pp. 78–79; Kolster 2009, Lecture 1 §1, p. 7.)

Prove `arithmeticLayerProjection_comparison`: the arithmetic projection to `ℤ_p[Gal(K_n/K)]` is the supplied completed-algebra projection. The existing kernel theorem then gives `(ω_n)` and the arithmetic module comparison `arithmeticCoinvariants_eq_quotient`. For a finite abelian extension `F/k`, use `γ_F^{pⁿ}−1` for the open subgroup `Gal(F_∞/F)`; a splitting of the entire group need not have γ_F as its generator. (Sharifi, Lemma 2.4.4, pp. 52–53; Kurihara, §4.1, pp. 22–24.)

The light `layerPolynomial R p n=(1+X)^{pⁿ}−1` and `transitionPolynomial R p m d=Σ_{i<p^d}(1+X)^{ip^m}` record these arithmetic operators as polynomials over an arbitrary ring, for evaluation in arithmetic actions; the supplied growth transition instead lives in a power-series ring. Their API uses Mathlib's `geom_sum_mul` for `ω_{m+d}=ν_{m+d,m}ω_m`, `add_pow_char_pow` for reduction modulo p, and polynomial evaluation for the completed action. The identity transition is 1, the first dyadic transition is `2+X`, and reduction of `ω₁` modulo 2 is `X²`; these three checks distinguish the norm, augmentation, and residue operators.

**Checks.**

- Changing a lift by x in the abelian kernel leaves conjugation on that kernel unchanged. For a nonabelian kernel it can change the action, so abelianness is a necessary hypothesis.
- At n=0 the quotient relation is `γ−1=0`, and the arithmetic action becomes the trivial Γ-action. Killing γ itself would instead annihilate the unit.
- At p=2 and n=1, `ω₁=2T+T²`. The quotient is not the quotient by `T²`, even though both have rank two over `ℤ₂`.
- For a principal class represented by a, equivariance is `σ(Na)=N(σa)` with the corresponding restricted σ downstairs. This tests the conjugation action against the class norm rather than against an unrelated module action.

### 0.5 Integral character comparison

Use the character map, its finite-index image and its integral idempotent criterion from PadicMeasuresIwasawaAlgebras §6.1. For the integers O of a p-adic field containing the values of the finite abelian group Δ, the product decomposition of power-series orders and arithmetic modules is used integrally only when `p∤#Δ`. When `p∣#Δ`, retain the integral presentation for arithmetic descent. The ring `ℤ_p[[Gal(F_∞/k)]]` is reduced, noetherian, finite free over a procyclic power-series subring, and has a product of fields as total quotient ring. An element is regular precisely when every character component is nonzero. Prove `arithmeticCompletedOrder_structure` with these hypotheses, identifying the finite-free procyclic subring and the total-fraction character injection. This arithmetic specialization uses the supplied group-ring algebra; its descent maps preserve the actual integral order. (Dasgupta–Kakde, §2.2, pp. 15–16; Kurihara, §4.1, pp. 22–24.)

For example, in `ℤ₂[C₂]`, `(1+c)/2` has character values 1 and 0 and is still not integral. Likewise two ideals with equal images in every normalized character component need not be equal in the order. Height-one comparisons in Layer 11 use invertibility and an explicit lattice-detection theorem, never a general assertion about arbitrary ideals.

**Checks.**

- For Δ trivial the character map is the identity on O, with zero cokernel.
- For Δ=C₂ at odd p, `(1±c)/2` are integral and the character map is an isomorphism. At p=2 their character values remain integral but the idempotents are not in the order.
- In `ℤ₂[C₂]` the character image consists of pairs congruent modulo 2. Thus (1,0) is outside the image; componentwise integrality does not imply integrality in the order.
- A coefficient element with one zero character component is a zero divisor in total fractions. In particular `1−c` is not regular in the full C₂ order.

### Examples

In the first real quadratic layer of the dyadic cyclotomic tower, a rational ideal extended upward has norm its square. The two distinct operations on the upper class group are extension after norm, `1+σ`, and multiplication by 2. On a minus class the former vanishes. This calculation fixes both the norm direction and the action convention before limits are introduced. The dyadic field `ℚ(√−2)` gives a separate example where the full cyclotomic group is already torsion-free but the sign character on it remains nontrivial.

### Dependencies

GlobalNumberFields §10, ClassFieldTheory §§8–11, Mathlib's infinite Galois correspondence, the current Tau Ceti class norm and completed group algebra, and PadicMeasuresIwasawaAlgebras §§1, 4, 6. No class-number growth, Leopoldt theorem, or main conjecture is used.

## Layer 1: circular units and integral index formulas

### 1.1 Compatible cyclotomic fields and their real subfields

Construct `compatibleCyclotomicTower` from primitive roots `ζ_m` with `ζ_n^{n/m}=ζ_m` whenever `m∣n`. Its fields `F(m)=ℚ(ζ_m)` are embedded in one algebraic closure, and `cyclotomicEmbedding m n` is specified by this equality. Prove `cyclotomicEmbedding_trans`, compatibility of `σ_a(ζ_m)=ζ_m^a` with restriction, and `cyclotomicNorm_trans`. Use the supplied maximal real subfield at each level, and prove `realCyclotomicField_eq_adjoin` using `ζ_m+ζ_m⁻¹`. The involution has degree `e(m)=2` for `m>2` and degree 1 for `m=1,2`. (RJW, §9, pp. 45–46 in arXiv:2309.15692v2; Sharifi, Remark 1.4.9, Definition 1.4.10 and Example 1.4.11, p. 26, and §3.1, pp. 75–76.)

Prove `fullNorm_realNorm_comparison`: for a real element x at level n and `m∣n`, the full norm to F(m) is the real norm to `F(m)^+` raised to `e(n)/e(m)`. The restriction map on full Galois groups and the map on real quotients must be part of the comparison, rather than inferred from an unlabelled field isomorphism. *Needs:* §0.2, primitive roots, finite Galois norms, and fixed fields.

**Checks.**

- `F(1)=F(2)=ℚ`, with real degree 1. A uniform degree-two assertion at these conductors would give a spurious square root in the norm formula.
- For `F(5)^+→ℚ`, the full norm of a real unit is the square of its real norm. For its fundamental unit of norm −1 the full norm is 1, not −1.
- If `n,m>2`, both e's equal 2, so full and real relative norms agree on real elements. This checks the exponent against the nondegenerate case.
- The composite embedding `F(3)→F(9)→F(27)` sends `ζ₃` to `ζ₂₇⁹`. Arbitrarily chosen primitive roots without this compatibility need not give the same map.

### 1.2 Circular numbers before intersection with units

For odd p and `a≥1`, put `F_a=F(p^a)`. Define `cyclotomicNumbers a` inside `F_a^×` as the subgroup generated by `−ζ_{p^a}` and all nonzero differences `1−ζ_{p^a}^b`, `0<b<p^a`. Define `cyclotomicUnits a` by intersection with the integral unit group, and `realCyclotomicUnits a` by further intersection with the real field. The subgroup of circular numbers is allowed to contain nonunits and their inverses. Its API includes `cyclotomicNumbers_generator_mem`, `cyclotomicUnits_mem_iff`, inclusion into the integral units, Galois stability, and the real-field preimage theorem. Define the light field-valued `cyclotomicRatio ζ b=(ζ^b−1)/(ζ−1)` only as a ratio; its arithmetic use assumes ζ primitive of p-power order and `p∤b`. (RJW, Definition 11.6, p. 176, and Lemma 12.18, p. 186.)

**Checks.**

- `1−ζ_p` itself has positive valuation at the unique prime above p, so belongs to circular numbers and not to circular units. A definition that requires every generator to be a unit fails here.
- The quotient `(1−ζ_p²)/(1−ζ_p)` is an integral unit. It would be lost by generating a group from only those original differences that happened to be units.
- `cyclotomicRatio ζ 1=1` for `ζ≠1`, whereas exponent zero gives 0 and cannot define a multiplicative unit. The primality-to-p condition is necessary. The API `cyclotomicRatio_mul` gives `r(ζ,ab)=r(ζ^b,a)r(ζ,b)` when `ζ≠1` and `ζ^b≠1`; the arithmetic unit interpretation keeps its primitive-root hypotheses.
- Torsion in the full unit group contains `−1`; torsion in the real group is exactly `{±1}`. Taking a torsion-free quotient before forming these subgroups would change the integral indices.

### 1.3 Real generators and the valuation relation

For odd p choose `h≡2⁻¹ mod p^a` and define `smoothedCyclotomicUnit a b = ζ^{h(1−b)} cyclotomicRatio ζ b` for `p∤b`. Prove independence of the integer representative h, integrality, invertibility, and reality. Its API includes `smoothedCyclotomicUnit_one`, `smoothedCyclotomicUnit_negOne`, and the cocycle law

```text
γ_a(bc) = σ_c(γ_a(b)) γ_a(c).
```

The law uses the indicated right-hand Galois action; interchanging b and c without changing the action is not its proof. (RJW, Lemma 12.18 and Corollary 12.19, p. 186.)

Prove `primePowerDifference_factorization`: if `0≤r<a` and `p∤b`, then `ζ^{bp^r}−1` is the product of `ζ^{b+jp^{a−r}}−1` for `0≤j<p^r`. Every exponent on the right is prime to p. Combine the supplied primitive-difference association with prime-power ramification to prove `primitiveDifference_primeValuation`: their valuation at the unique prime above p is one. Thus a circular-number expression that is a unit has total exponent zero. Divide each factor by `ζ−1` and then remove the root-of-unity phase to obtain `cyclotomicUnits_generators` and `realCyclotomicUnits_generators`. The results are `D_a=μ(F_a)D_a^+` and `D_a^+=⟨−1,γ_a(b)⟩`. (RJW, proof of Lemma 12.18, p. 186.) *Needs:* §§1.1–1.2 and prime-power cyclotomic ramification.

**Checks.**

- `γ_a(1)=1` and `γ_a(−1)=−1`. The latter fixes the sign normalization; replacing the phase by its inverse generally fails reality.
- For `p=5,a=1`, the generator with b=2 is `ζ²+ζ³`, a real unit of norm −1. This distinguishes the chosen real generator from its absolute value.
- When r=0 the factorization has one factor. When `r=a−1`, there are `p^{a−1}` primitive differences. Both counts are needed for the valuation reduction.
- A single primitive difference has exponent sum 1 and is not a unit, while the ratio of two has sum zero. Using nonnegative exponents only would make the claimed generation theorem false.

### 1.4 Cyclic generation, torsion, and norm compatibility

If b generates `(ℤ/p^aℤ)^×`, prove `realCyclotomicUnits_cyclic`: `γ_a(b)` generates `D_a^+` as a multiplicative `ℤ[Gal(F_a^+/ℚ)]`-module, including the sign torsion. Iterating the cocycle law gives every γ, and the product of the conjugates of this generator is −1. Prove `cyclotomicUnits_torsion=μ(F_a)`, of order `2p^a`, and the real torsion statement. (RJW, Corollary 12.19, p. 186.)

For odd p prove `cyclotomicRatio_norm` and `smoothedCyclotomicUnit_norm` from conductor `p^{a+1}` to `p^a`; both norms give the generator with the same b at the lower level. Prove norm stability of D and `D^+`, and compatibility with the embeddings into local units. At 2 the same integral phase has an additional sign in a single quadratic norm; the odd-prime exact formula is not exported without a dyadic sign adjustment. (RJW preprint, §10.2, pp. 47–48, and §§12.3–12.4, pp. 62–64.) *Needs:* §§1.1–1.3.

### 1.5 Regulators give the prime-power index

For odd p prove `primePowerHasseUnitIndex_one`: the full unit group of `F_a` is `μ(F_a) O_{F_a^+}^×`. The proof uses ramification at the unique prime over p and the unit/conjugate quotient; it does not use Vandiver or a main conjecture. It induces `fullRealCircularQuotientEquiv` and equality of the two integral indices. (Sharifi, Lemmas 4.2.17 and 4.2.19, pp. 106–107.)

Prove `abelianZeta_regulator_product`: for a totally real abelian E/ℚ, use the product of primitive Dirichlet L-functions, with only inertia-trivial characters in a ramified Euler factor, the conductor-discriminant formula, and the Gauss-sum formula for primitive even `L(χ,1)` to identify the class-number/regulator product with character logarithmic sums. These analytic facts are consumed from their suppliers; the target is their exact simultaneous normalization in the regulator calculation. (Sharifi, Proposition 4.1.21 and Theorems 4.2.14, 4.2.20, pp. 100, 104–108.)

For the real prime-power field, form the logarithmic matrix on representatives of `(ℤ/p^aℤ)^×/{±1}`, deleting the identity row and column. Its entries are `log|1−ζ^{bc}|−log|1−ζ^b|`. Prove `circularRegulator_eq_classNumber_mul`: its absolute determinant is `h(F_a^+)R_{F_a^+}`. The character determinant gives nonvanishing and independence modulo `{±1}`. Compare the two unit lattices, with the same sign torsion, to conclude `primePowerCircularUnitIndex`: `[O_{F_a}^×:D_a]=[O_{F_a^+}^×:D_a^+]=h(F_a^+)`. (Sharifi, Theorem 4.3.3 and its proof, pp. 108–110; RJW, Theorem 11.7, p. 176.) *Needs:* §§1.3–1.4 and the analytic class-number formula from LFunctions Layer 3.

### 1.6 Dyadic prime powers

For `a≥2` define the same circular-number/intersection groups in `ℚ(ζ_{2^a})`. Real generators for odd b use the integer exponent `(1−b)/2`, not an inverse to 2 modulo `2^a`. Prove `dyadicPrimePowerCircularUnitIndex`, giving the full and real indices `h(F_a^+)`, by the prime-power case of the integral circular-unit lattice theorem. For a=1 both fields are ℚ and both unit groups are `{±1}`. Preserve this separate case in the API. (Sharifi, Lemma 4.2.17, pp. 106–107, and Theorem 4.7.1, pp. 120–121.)

The norm of the phase across one quadratic step contributes `(-1)^{(1−b)/2}`; any norm-compatible dyadic generator must explicitly absorb that sign. *Needs:* §§1.1–1.2 and the finite lattice comparison in §1.8.

**Checks.**

- b=1 gives 1; b=−1 gives −1 with the chosen integer exponent.
- At a=2 the real field is ℚ and its circular-unit index is 1; at a=1 the full field is also ℚ.
- There is no inverse to 2 modulo `2^a`. A definition requiring one has no input even at a=2.
- At b=3 the norm phase is −1, so the unadjusted generator cannot satisfy the odd-prime norm formula.

### 1.7 Circular units in an arbitrary abelian subfield

For finite abelian `E/ℚ`, define `abelianCircularNumbers E` as the subgroup of `E^×` generated by −1 and all norms of `1−ζ_m^b` from `ℚ(ζ_m)` to `E∩ℚ(ζ_m)`, for `m>1` and `m∤b`. The elements are then embedded in E. Define `abelianCircularUnits E` as its intersection with integral units. Primitive b suffice after passage to a smaller conductor. Prove `abelianCircularUnits_norm`, conductor enlargement compatibility, Galois stability, inclusion of roots of unity, and the finite-conductor distribution comparison. This is a norm convention, with all conductors permitted. (Sinnott 1980, §4, pp. 201–205, Lemma 4.1 and Proposition 4.1.)

The API includes `abelianCircularUnits_mem_iff`, `abelianCircularNumbers_rat_mem`, `abelianCircularUnits_rootsOfUnity`, `abelianCircularUnits_finiteConductor`, and the comparison map to the full-field D. In a real field it need not equal `D∩E` formed in a larger full cyclotomic field. The distinction is measured in the next subsection.

**Checks.**

- For `E=ℚ`, the circular-number group contains every positive rational prime through cyclotomic norms, whereas its unit intersection is `{±1}`. Intersecting before taking norms is wrong.
- For the full prime-power cyclotomic field E, the construction agrees with D from §1.2. This compares the norm convention with the earlier convention where they coincide.
- For `E=ℚ(√5)`, write ε for a fundamental unit of norm −1. The norm-generated group has free generator `ε²`, whereas the intersection group from `ℚ(ζ₅)` has free generator ε. Their indices differ by 2.
- Roots of unity must remain in the norm-generated unit group; discarding them changes the imaginary-field Hasse-index factor in the index formula.

### 1.8 The general conductor lattice and its exact correction

Let m be the conductor of E, chosen odd or divisible by 4; write `R=ℤ[G]`, `G=Gal(E/ℚ)`, and `r_m=rad(m)`. For a prime ℓ dividing m, let `T_ℓ` be its inertia group, let `e_{T_ℓ}=s(T_ℓ)/#T_ℓ`, and put `(ℓ,E)^*=e_{T_ℓ}Frob_ℓ⁻¹` in `ℚ[G]`. For a squarefree `r∣r_m`, let T_r be generated by those `T_ℓ` with `ℓ∣r`. Define `sinnottDistributionLattice E` to be the R-lattice U generated by

```text
s(T_r) ∏_{ℓ | r_m/r} (1 − (ℓ,E)^*),       r | r_m.
```

Prove `distributionLattice_fullRank`, independence of Frobenius lifts, and compatibility of its generators with conductor norms. Generalized indices `(L:L')` mean covolume ratios of full lattices in the same rational representation; they can be rational. The API must distinguish them from the integer index of nested integral subgroups. (Sinnott 1980, Proposition 2.3, pp. 194–195.)

Let `E_{ℓ^a}=E∩ℚ(ζ_{ℓ^a})`, where `ℓ^a∥m`. Define `g'(E)` by `2^{g'}=#(D/(ℚ^×μ(E)))[2]`, with D the circular-number group. Prove `circularLog_image`, `circularLog_unitKernel`, and `circularLog_augmentationIndex`: for `ℓ_E(x)=−(1/2)Σ_σ log|σx| σ⁻¹`, its kernel on D is `μ(E)`, its unit image is the intersection of `ℓ_E(D)` with the augmentation-zero part, and the discrepancy of the augmentation projection is `2^{−g'}∏_{ℓ∣m}[E_{ℓ^a}:ℚ]`. Prove the product formula identifying the projected logarithm lattice with the distribution lattice scaled by the nontrivial even `L'(0)` values. These are finite lattice computations, not an appeal to an unspecified index correction. (Sinnott 1980, Propositions 4.1–4.2 and the corollary preceding Theorem 4.1, pp. 203–207.)

Finally prove `abelianCircularUnitIndex`. If E is imaginary, set `e⁺=(1+j)/2` in the rational group algebra and `Q_E=[O_E^×:μ(E)O_{E^+}^×]`. Then

```text
[O_E^× : C_E]
 = h(E⁺) Q_E 2^(−g'(E))
   ( ∏_{ℓ|m}[E_{ℓ^a}:ℚ] / [E:ℚ] ) (e⁺R : e⁺U).
```

If E is real, the formula for this norm-generated C is

```text
[O_E^× : C_E]
 = h(E) 2^([E:ℚ]−1)
   ( ∏_{ℓ|m}[E_{ℓ^a}:ℚ] / [E:ℚ] ) (R : U).
```

The proof compares the four logarithmic covolumes: the unit regulator, the augmentation-zero circular lattice, the projected circular lattice, and the distribution lattice. The class-number formula supplies the first and last comparison; the preceding augmentation calculation supplies the correction. This also proves that the displayed rational expression is a positive integer. (Sinnott 1980, Theorem 4.1 and equation (4.8), pp. 207–208.) For a full cyclotomic field the **intersection** real circular group has index `2^a h(F^+)`, where g is the number of distinct conductor primes, `a=0` for g=1, and `a=2^{g−2}+1−g` for `g≥2`. This numerical formula is restricted to that full-field convention. (Sharifi, Theorem 4.7.1 and Proposition 4.7.7, pp. 120–122.) *Needs:* §§1.5, 1.7 and finite group-ring lattices.

**Checks.**

- For a real prime-power field of degree d, U=R and the degree product cancels `[E:ℚ]`. The norm-generated index is `2^{d−1}h(E)`, rather than the index h of the intersection group.
- For `E=ℚ(√5)`, d=2 and h=1, the formula gives 2, agreeing with ε versus `ε²` in §1.7.
- For `E=ℚ`, the empty nontrivial-character determinant and every unit/circular-unit index are 1. No logarithmic determinant of size zero is declared to be zero.
- For a full cyclotomic conductor with one or two distinct primes, the intersection correction exponent a is 0. For three primes it is also 0; for four it is 1. This tests the exponent formula beyond the prime-power case.
- A Frobenius lift changed by inertia gives the same averaged element because of `e_{T_ℓ}`. Omitting the average makes U depend on an arbitrary lift.
- For real E, `g′(E)=0`; for E=ℚ(i), the class of `1−i` modulo `ℚ^×μ(E)` has order two and gives `g′(E)=1`. Substituting the real value in the imaginary formula loses a factor 2.
- The logarithm kills every root of unity. On a positive rational prime ℓ in D it is the nonzero constant vector `−(log ℓ)/2`; that vector is not in the augmentation-zero unit lattice. Intersecting with units before this projection changes the comparison.
- The generalized index `(ℤ:2ℤ)` is 2 and `(2ℤ:ℤ)` is 1/2. The covolume API must allow the latter value and fix this orientation.

### Examples

The field `ℚ(√5)` separates three objects that otherwise look interchangeable: its full units, the real intersection of full cyclotomic circular units, and the group generated by cyclotomic norms into the real field. The first two have generator ε and the last has generator `ε²`; the factor 2 is forced by the real norm. In `ℚ(ζ₅)`, the smoothed generator of §1.3 has real norm −1 and full norm 1. These computations explain both the norm exponent and the real-field power of 2 in the general index formula.

### Dependencies

Layer 0, finite cyclotomic and ideal arithmetic, the Hecke L-functions and analytic class-number formula from LFunctions Layers 3–5, RepresentationTheory/CharacterTheory Layers 0–3's finite character orthogonality and PadicMeasuresIwasawaAlgebras §6.1's character-ring lattice comparison, and integral lattice covolumes. No p-adic main conjecture, Vandiver conjecture, or Ferrero–Washington theorem enters this layer.

## Layer 2: arithmetic modules, global units, and weak Leopoldt

### 2.0 Finite-coefficient global duality and compact arithmetic cochains

For a number field K, a prime p, finite `S⊇S_p∪S_∞`, and a finite continuous p-primary `G_{K,S}`-module A, put `Aᴰ=Hom(A,μ_{p∞})` with the contragredient action. Use the supplied continuous cochains and evaluation cup product, and the local invariants of ClassFieldTheory Layer 5. Prove `arithmeticPoitouTate`: the kernels of localization in degrees i=1,2 are perfectly paired with those for `Aᴰ` in degree `3−i`, and the restriction, local-invariant and dual-localization maps form the Poitou–Tate exact sequence. When p is odd or K is totally imaginary, its nine terms are

```text
0 → H⁰(K,S;A) → P⁰(A) → H²(K,S;Aᴰ)^∨ →
    H¹(K,S;A) → P¹(A) → H¹(K,S;Aᴰ)^∨ →
    H²(K,S;A) → P²(A) → H⁰(K,S;Aᴰ)^∨ → 0.
```

Here `Pⁱ` is the product of the local cohomology groups at S, with complete Tate cohomology at infinite places. At real dyadic places prove the full long exact sequence of the ordinary-to-complete-Tate comparison cone constructed below; retain its degree-zero and negative Tate terms instead of asserting the displayed nine-term truncation with ordinary global endpoints. Prove naturality for coefficient exact sequences, field restriction/corestriction and enlargement of S. The positive-degree local factors use the ordinary finite-place groups; the real factors retain their complete resolutions. These are targets over the actual cochains, not a choice of unrelated perfect pairings. (NSW, §§8.6–8.7; Sharifi, Theorems A.0.6 and A.0.8 and Remark A.0.7, pp. 186–187.)

Define `arithmeticCompactSupport` as the mapping fiber of global continuous cochains into the sum of the local complexes at S. Keep the ordinary infinite-place version and the complete-Tate infinite-place version, together with their canonical comparison and its cone. Construct compact coefficients by derived inverse limits of finite quotients of a finite free continuous `ℤ_p`-lattice T, and discrete dual coefficients by direct limits. Prove `arithmeticCompactDuality`, transporting the finite pairings and all connecting maps to these limits, and identify compact homology with the Pontryagin dual of ordinary cohomology of the discrete dual. The compact-support/global duality shift is 3; finite-place local duality has shift 2. State the ordinary real-place comparison through its explicit cone, retaining its nonzero periodic terms. The API consists of coefficient triangles, trace/restriction compatibility, the real ordinary-to-Tate map, the local trace pairing and its global sum, and compatibility of the induced maps with finite quotients. Section 10.1 proves boundedness and perfectness for the particular all-prime ordinary compact-support models used in the main conjecture; those properties are not built into this definition. (NSW, §§7.2, 8.6–8.7 and 10.3; Burns–Flach, equation (1.9), p. 73, Proposition 1.20 and the ordinary/Tate comparison, pp. 78–80.)

**Checks.**

- At a real place with p odd, division by 2 contracts the complete Tate complex; its cohomology is zero. For p=2 and trivial `ℤ/2` coefficients, every Tate degree has `ℤ/2` and cannot be deleted.
- In ordinary degree zero at a real place, `H⁰(C₂,ℤ/4)=ℤ/4`, while Tate degree zero is `ℤ/2`. Thus the comparison changes the endpoint in the exact sequence and is not an equality of complexes.
- For a complex place, the complete Tate complex is acyclic but the ordinary complex has A in degree zero. For zero coefficients both support models and the comparison cone are zero. Thus complex places also participate in the ordinary-to-Tate comparison.
- For the dual of `ℤ/p` with trivial action, the coefficient is `μ_p` with its actual Galois action. Replacing it by a second trivially acted-on copy of `ℤ/p` loses the Tate twist.

*Needs:* ClassFieldTheory Layer 5 and Layers 10–13; ProfiniteCohomology Layers 0–12; DerivedModuleAlgebra §§0.I.1, 0.2, 1.T.1, 1.1 and 1.1.1 for derived operations and limits.

### 2.1 Norm limits and extension limits of class groups

Define `classGroupLimit K∞` as `X_∞=lim_n A_n`, `A_n=Cl(K_n)⊗ℤ_p`, along class norms. Define `classGroupDirectLimit K∞` as `A_∞=colim_n A_n` along extension of ideals. For a fixed finite set of finite places S, define `splitClassModule S` from `Cl(O_{K_n,S})⊗ℤ_p` in the same way. The API consists of `classGroupLimit_proj`, compatibility of projections with norm, the universal mapping property, compactness and the arithmetic Λ-action, `classGroupDirectLimit_mk`, its extension relation, and compatibility of the S-quotient with both transitions. Prove the two norm/extension identities of §0.2 on these systems before passing to limits. The construction applies without change to smoothed ray class groups and to a directed tower of finite abelian fields. (Sharifi, Definitions 3.2.3, 3.2.17–3.2.18, pp. 78, 83; Kurihara, §3, pp. 15–17.)

**Checks.**

- A compatible inverse-limit element satisfies `N_{n+1,n}(x_{n+1})=x_n`. Using extension in this equation would give a map with the wrong domain.
- A direct-limit class can vanish by capitulation. Its representative is not declared zero merely because its norm vanishes at a lower level.
- With S empty the S-class system is the ordinary system. Adding one prime kills its ideal class and all of its conjugates, not every class with support away from that prime.
- A constant finite system with identity maps has the same finite limit. This distinguishes compact norm limits from a tensor with `ℚ_p`, which would erase it.

### 2.2 Units, semilocal units, and the field-level defect

Define `unitLimit` from `E_n=O_{K_n}^×⊗ℤ_p` along norms and `sUnitLimit` from S-units. Since the finite-layer unit groups are finitely generated, these tensors agree with their p-adic completions, with torsion `μ_{p^∞}(K_n)` retained. Define `principalUnitLimit` from `U_n=∏_{v|p}U¹(K_{n,v})`. The pro-p completion of a local integral unit group is canonically its principal-unit group: its prime-to-p Teichmüller torsion dies. Define `globalUnitClosure n` as the image of `ι_n:E_n→U_n`; it is closed because its source is compact. For the S-unit variant use `ℱ_n=∏_{v|p}(K_{n,v}^×)^∧_p`, retaining the valuation directions. The API includes continuity of all maps, `unitNorm_localization`, compactness, the completed action, the image-factorization map, and identification with a p-adic completion at finite level. (Sharifi, Definition 3.3.5, p. 85; AWS notes, §2.5, p. 24; NSW, §11.2, pp. 731–735.)

Define `leopoldtDefect E p=rank_{ℤ_p}ker ι_E` for a number field E. Its kernel is torsion-free because localization embeds the p-power roots of unity. Thus

```text
δ(E,p)=r₁(E)+r₂(E)−1−rank_{ℤ_p}(image ι_E).
```

Define `LeopoldtConjecture E p` as `δ(E,p)=0`. Prove equivalence with injectivity of the actual localization map. The logarithmic regulator comparison is a theorem in Layer 4, not a second definition of defect. (Sharifi, Conjecture 1.5.1, p. 28, Proposition 1.5.6 and Definition 1.5.9, pp. 31–32.)

**Checks.**

- For ℚ and any p, the completed global units have rank zero; at 2 the element −1 remains as torsion and embeds into local units. The defect is zero in either case.
- For a local field with residue field of size `p^f`, the residue roots of unity have order `p^f−1` and vanish under pro-p completion. At 2, −1 lies in principal units and must remain.
- In a one-dimensional unit direction, the identity localization has zero defect and the zero map has defect one. These maps distinguish injectivity from a statement about a torsion-free quotient only.
- For `ℱ_n`, a uniformizer gives a nonzero valuation direction. It is absent from `U_n`; replacing local multiplicative groups by principal units in the S-unit sequence changes its last class group.
- An image of a compact completed unit group is closed. The raw image of the discrete unit group need not be closed, so its use instead would change the quotient in the reciprocity sequence.

### 2.3 The extensions represented by each arithmetic module

Define `maximalProPExtension E S` as the compositum of finite abelian p-extensions unramified outside S. Define `pRamifiedModule E S=𝔛_S(E)` as its Galois group. Define `unramifiedModule E=X(E)` using ordinary unramified extensions, and the split variant `X'_S(E)` by additionally requiring every prime above S to split. State their maximality and unique-factorization properties, stability under the base Galois group, compactness, and the conjugation action. At a real place, unramified means staying real. At 2 a real place is allowed to become complex only in an S-ramified extension whose S contains it. (Sharifi, Remark 3.2.5, Proposition 3.2.6, Definition 3.2.10, pp. 79–80, and Proposition 3.2.19, p. 83.)

Prove `unramifiedModule_classGroupLimit` by the inverse limit of Artin maps, and its S-split analogue. Prove `pRamifiedModule_rayLimit` by reciprocity with the pro-p ray-class limit, including the real modulus when p=2. Prove compatibility with arithmetic conjugation and norm. In the cyclotomic tower, after eventual total ramification, `L(K_n)∩K_∞=K_n`; finite-level coinvariant maps are then described by inertia rather than asserted to be isomorphisms. (Sharifi, Proposition 3.2.6 and Corollary 3.2.7, p. 79, Propositions 3.2.11, 3.2.19–3.2.20, pp. 80, 83.)

**Checks.**

- With no allowed finite or infinite ramification, finite-level reciprocity gives the wide class group. Allowing a real modulus at 2 can enlarge the ray group and is not the same object.
- The S-split module is a quotient of the unramified module by the closed subgroup generated by decomposition groups at S. It is not a subgroup obtained by deleting ramified characters.
- The p-ramified module can have positive Λ-rank over a complex base, whereas X is torsion. This prevents interchanging the two sides of a main-conjecture formula.
- If a finite layer has class number one, its unramified p-extension is trivial; this says nothing by itself about its infinite ray-class group.

### 2.4 Local finiteness before global injectivity

Prove `principalUnitLimit_finite` for the cyclotomic tower before using an embedding of global units. For each p-adic place, local reciprocity identifies the multiplicative completion with the local abelian pro-p Galois group. Use the procyclic extension's `H²(Γ,−)=0`, its finite residue/valuation sequences, and compact Nakayama to obtain finite generation over the local completed group algebra. Induce from each of the finitely many decomposition groups to Γ, and remove the valuation part to obtain finite generation of `U_∞`. The number of decomposition orbits is finite by cyclotomic ramification. This proof neither assumes field-level Leopoldt nor uses global unit injectivity. (NSW, §11.2, pp. 731–735; Sharifi, the setup to Proposition 3.3.6, pp. 85–86.)

Prove `unramifiedModule_finite_torsion`, `splitClassModule_finite_torsion`, and finite generation of `𝔛_S` by class-field control and compact Nakayama. For the direct class limit prove `classGroupDirectLimit_dual_finite_torsion`, its pseudo-isomorphism with `X_∞^ι`, and absence of a nonzero finite Λ-submodule. The involution is necessary because the dual is contragredient. These finiteness statements precede arithmetic growth and do not use Ferrero–Washington. (Sharifi, Proposition 3.2.11, p. 80, Proposition 3.2.14 and Corollary 3.2.15, p. 82, Proposition 3.2.19, p. 83.) *Needs:* §§2.1–2.3, compact Nakayama and elementary-module algebra.

### 2.5 The ordinary low-degree cohomology calculation

Let `G_S=Gal(K_S/K)`, with finite `S⊇S_p∪S_∞`, and `D_p` trivial. Establish `restrictedCohomology_finite_lowDegrees`, `restrictedH2_compact_torsionFree`, and `restrictedEulerCharacteristic_truncated`: the mod-p groups in degrees 0, 1, 2 are finite, compact `H₂(G_S,ℤ_p)` is torsion-free, and their truncated Euler characteristic is `χ₂=−r₂(K)`. This is a low-degree formula, including at real dyadic places; it is not an assertion that all higher ordinary cohomology vanishes. Obtain the finite-group result from finite coefficients, and the torsion-freeness and χ₂ from global duality and units. (NSW, Theorem 8.3.20, pp. 464–465, and results 8.7.5–8.7.7, pp. 509–511.)

For an exact sequence `1→H→G→Γ→1` with `Γ≃ℤ_p`, finite `H¹(G,ℤ/p)` and `H²(G,ℤ/p)`, and divisible `H²(G,D_p)`, prove `homologicalRankCriterion`: `H²(H,D_p)=0` is equivalent to `X=H₁(H,ℤ_p)` having no nonzero finite Λ-submodule and rank `−χ₂(G)`. State the required finite generation of X and derive it from low-degree Hochschild–Serre and compact Nakayama. The relation-rank computation uses a minimal free presentation and the exact sequence from Hochschild–Serre, not finite cohomological dimension of G. (NSW, Propositions 5.6.15–5.6.16 and Theorem 5.6.17, pp. 331–332.) This precise low-degree interface is needed beyond the generic duality supplier's finite-dimensional hypotheses. *Needs:* §2.4 and the generic continuous-cohomology contract.

### 2.6 Weak Leopoldt in every cyclotomic tower

For `H_S=Gal(K_S/K_∞)`, prove `weakLeopoldt_iff`: bounded `δ(K_n,p)`, vanishing `H₂(H_S,ℤ_p)`, vanishing ordinary `H²(H_S,D_p)`, and finite generation of `𝔛_S(K_∞)` with rank `r₂(K)` and no nonzero finite Λ-submodule are equivalent. Compact homology is dual to the indicated ordinary cohomology. Use §2.5 for the rank equivalence. For bounded defects, the inverse homology is finite over `ℤ_p`; away from real dyadic places the free-Λ argument forces it to vanish. In the real dyadic case first pass to `K(i)`: torsion-freeness of finite-layer `H₂` makes the relevant discrete `H²` divisible, so corestriction from the imaginary quadratic extension is surjective and its dual injects the original compact homology into the imaginary one. This supplies the missing real dyadic step without asserting `cd₂≤2`. (NSW, Theorem 10.3.22 and proof, pp. 639–640.)

Prove `cyclotomic_weakLeopoldt` for every K and p. After finite extension assume `μ_{2p}⊂K`. Tate twisting identifies the relevant obstruction with the second Tate–Shafarevich group for `μ_{p^∞}`; duality reduces it to `colim_n Cl_S(K_n)⊗D_p`, which vanishes because each class group is finite. Weak Leopoldt descends under the preceding restriction/corestriction argument. With `μ_{2p}⊂K`, retain the quantitative bound by `λ(X'_{S_p})`. (NSW, Theorem 10.3.25, pp. 640–641; Sharifi, Theorems 3.3.3–3.3.4, pp. 84–85.)

The real dyadic negative control is ordinary `H^i(C₂,ℤ/2)≠0` in arbitrarily high degree. Vanishing for the particular divisible coefficient `D₂` in degree 2 does not imply ordinary finite cohomological dimension. Conversely, a totally real base has `rank_Λ 𝔛_S=0`; a base with one complex place has rank one. Neither conclusion proves field-level Leopoldt at every layer.

### 2.7 Global-local reciprocity, with real signs

For `S=S_p∪S_∞`, put `Σ_n=∏_{v real in K_n}μ₂` at p=2 and 0 otherwise. Prove `finiteGlobalLocalSequence`:

```text
0 → D_n → E_n → U_n ⊕ Σ_n → 𝔛_S(K_n) → Cl(K_n)(p) → 0,
D_n = H₂(G_S(K_n),ℤ_p).
```

The localization map has its actual compact image. Its S-unit version replaces E by p-units, U by ℱ, and the final term by p-split classes. Prove all maps commute with norms. This is the augmented reciprocity sequence, rather than a sequence beginning with an unproved injection of completed units. (NSW, Lemma 10.3.13 and its commutative diagram, pp. 630–631; Sharifi, Theorem 1.5.4, p. 29.)

Take compact inverse limits, using §2.6 to kill `lim D_n`, to obtain `infiniteGlobalLocalSequence`:

```text
0 → E_∞ → U_∞ ⊕ Σ_∞ → 𝔛_S(K_∞) → X_∞ → 0.
```

Prove `unitLimit_eq_limit_closures` for the images in U alone. At 2 the finite-layer kernel of localization into U can differ from D_n by sign conditions; twice that kernel lies in D_n, and `E_∞[2]=0`, since norms of −1 across a quadratic step are 1. Therefore the infinite map into U is injective as well. Compact limit exactness then gives the claimed comparison. It follows from §2.4 that `E_∞` is finitely generated. Prove `realSignLimit_equiv=(Λ/2)^{r₁(K)}` by splitting of the real places and the product norm over their lifts. This identifies the term in the sequence; it does not assert that its map to `𝔛_S` is injective. (NSW, Corollary 10.3.24, p. 640; Sharifi, Propositions 3.3.6, 3.3.9 and Corollaries 3.3.10, 3.3.14, pp. 86–89.)

For `μ_{2p}⊂K`, prove the separate discrete Kummer sequence `0→O_{K∞}^×⊗D_p→H¹(G_S(K∞),μ_{p∞})→A_∞→0`. Its contragredient dual, with its Tate twist, is `0→A_∞^∨(1)→𝔛_S(K∞)→(O_{K∞}^×⊗D_p)^∨(1)→0`. The inverse unit limit is not substituted for this discrete tensor. *Needs:* §§2.1–2.6 and Kummer duality.

### 2.8 Minus classes, capitulation, and real-unit square classes

Define `normMinusClassLimit` for a CM tower by finite norm kernels `A_n⁻=ker(A(K_n)→A(K_n^+))` at 2; at odd p use the exact minus eigenspace. Record direct and inverse systems separately. Prove their transition compatibility and the comparison to eigenspaces and integral minus quotients; the dyadic kernel/cokernel errors are killed by 2 and are retained. For the cyclotomic CM tower at odd p, prove `minusClass_extension_injective` and `inverseMinus_noFiniteSubmodule`: direct-limit maps on minus classes are injective and the inverse minus module has no nonzero finite Λ-submodule. This stronger assertion uses the cyclotomic norm calculation on roots of unity; it is not asserted for an arbitrary CM tower. In the dyadic tower `K_∞=F_∞(i)`, prove finite generation, torsion, and absence of finite submodules for the dual of the direct norm-minus limit. (Sharifi, Propositions 3.4.1–3.4.2, pp. 89–91, for the cyclotomic odd-prime assertions; Proposition 3.2.14 and Corollary 3.2.15, pp. 82–83, for the direct-limit dual; Kolster 1989, pp. 248–250, for the dyadic norm-minus convention.)

Prove `uniformCapitulationBound`: there is a single finite C bounding every ordinary class extension kernel from layer n to layer m, for `n≤m≤∞`; the S-class version assumes a fixed `S⊇S_p∪S_∞`, as in the source. Real places have no effect on the wide S-class group. Write finite class groups as `X/ν_{n,n₀}Y`, remove the maximal finite submodule of Y, and use injectivity of the transition norm element after a fixed cutoff on the resulting elementary module. The finite submodule and finite-index changes give a uniform bound, including passage to the direct limit. This does not say that all finite-layer class extension maps are injective. (NSW, Proposition 11.1.9 and proof, p. 730.)

For totally real F of degree d and p=2, define `realUnitRadical` by `ℰ_R=colim_n O_{F_n}^×/{±1}`, `W_F=ℰ_R/2ℰ_R`, and `C_F=W_F^∨`. If `V=O_{F∞(i)}^×⊗D₂`, prove `realUnitRadical_kummer`: `x mod 2↦x⊗(1/2 mod ℤ₂)` identifies W_F with `V[2]`, and the CM involution acts trivially on V. At the infinite level root-of-unity factors vanish in this tensor and units become real up to such factors; no finite-level Hasse-index-one assertion for arbitrary CM fields is needed. The API includes the square-class map, its independence of signs, Γ-equivariance, the torsion pairing, and `realUnitRadical_dual_characteristic`. Uniform capitulation and the invariant-ideal comparison give `dim_{𝔽₂}W_F^{Γ_n}=d2ⁿ+O(1)`. Compact Nakayama then makes C_F finite over `𝔽₂[[Γ]]` with rank d, whence `char_Λ C_F=(2^d)`. Finite submodules are allowed. (NSW, Proposition 11.1.9 and the compact Nakayama method of §11.2, pp. 730–731; Sharifi, Proposition 3.3.9, pp. 86–88; Kolster 1989, proof of Theorem 1, pp. 249–250.)

For the same real unit group modulo signs, prove `realUnit_galoisCohomology`: `H¹(Γ,ℰ_R)=B⊕D₂^r`, `H²(Γ,ℰ_R)=D₂^{r−1}`, where B is finite and `1≤r≤s`, s the number of dyadic places in `F_∞`. The mod-2 long exact sequence gives `#H¹(Γ,ℰ_R/2)=#B[2]·2^{r−1}`. It is `#B[2]`, not `#B`, which enters this formula. (Kolster 1989, proof of Theorem 1, pp. 249–250; Yamashita, Lemma 3, p. 77, Lemmas 4, 5, 7, pp. 78–79, and §4, p. 79.)

**Checks.**

- For an odd-primary module, projection by `(1−j)/2` identifies the three minus conventions. On `ℤ/6` with j=1 the integral minus quotient is `ℤ/2`, whereas the negative eigenspace is its order-two subgroup; they cannot be treated as an exact idempotent functor.
- The class of −1 is killed before forming ℰ_R. At each real layer the free unit rank is `d2ⁿ−1`; the asymptotic invariant dimension has leading coefficient d, not `d−1`.
- A finite `𝔽₂[[Γ]]`-summand does not change the rank d or the characteristic ideal `(2^d)`, but can change finite-level invariants. The API therefore promises rank and characteristic ideal, not freeness.
- If `B=ℤ/4`, then `#B[2]=2` and `#B=4`. The cohomology formula must use the first number.
- For r=1 and B=0, `H²` and the indicated mod-2 `H¹` both vanish. Replacing `r−1` by r introduces an extra factor 2.

### Examples

For a totally real base at 2, the inverse system of real signs is large: it gives one `Λ/2` per base real place. The inverse system of the global torsion units `{±1}` is zero, because the quadratic norm sends −1 to 1. These are different inverse systems. Their distinction is what permits the injection of global norm units into local principal units while retaining the real signs in the reciprocity sequence. In the later Kummer comparison the correction comes instead from real-unit square classes, whose dual has characteristic ideal `(2^d)`.

### Dependencies

Layers 0–1 for towers and norm units; ClassFieldTheory Layers 5, 7–8 and 10–13 and ProfiniteCohomology Layers 5–12 for local duality, reciprocity and Kummer; §2.0 for the global low-degree duality comparison; PadicMeasuresIwasawaAlgebras §§4–5 for elementary modules and compact Nakayama. The low-degree real dyadic calculations in §§2.5–2.6 and the square-class rank calculation in §2.8 are explicit extensions, not assumptions of a missing strong Leopoldt theorem.

## Layer 3: inertia control and class-number growth

### 3.1 One ramified prime gives exact class control

Let `F_∞/F` be a `ℤ_p`-extension with exactly one finite ramified prime, totally ramified from F, and no other ramification. Prove `onePrimeInertia_section`: an inertia lift splits `Gal(L(F∞)/F_n)` as `X_∞⋊Γ_n`. Its closed commutator subgroup is `ω_n X_∞`. Abelianize and kill the unique inertia subgroup to obtain `onePrimeClassControl`, the canonical isomorphism `Cl(F_n)(p)≃X_∞/ω_nX_∞`. The splitting can depend on a lift; the induced class-field quotient does not. (RJW, Proposition 13.15, p. 194, and Propositions A.5–A.6, pp. 201–202.)

Prove `onePrimeClassModule_finite_torsion`, and `onePrimeBaseClassZero`: if `Cl(F)(p)=0`, compact Nakayama forces `X_∞=0`, so every finite-layer p-class group is zero. This is an arithmetic instance of compact Nakayama, not the false assertion that any abstract module with zero coinvariants vanishes. (RJW, Lemma A.7 and Proposition A.8, p. 202, Proposition A.10 and Corollary A.12, pp. 203–206.) *Needs:* §§0.3, 2.1–2.4 and the class-field identification.

For odd p the full and real towers `F(a)=ℚ(μ_{p^a})` over their first layers satisfy these hypotheses. Their `ℤ_p`-layer n is `F(n+1)` or `F(n+1)^+`; both have one prime above p and it is totally ramified. This is the indexing used in Layer 7. The general control theorem is stronger in a different direction from the supplier's already stated rational odd-prime sequence.

### 3.2 Several inertia groups and the correct transition quotient

For an arbitrary `ℤ_p`-extension choose m after all ramified primes become totally ramified. Prove `inertiaClassControl`, with `Σ_m:⊕_{v ramified in F_m}I_v→Γ_m` the sum of inertia inclusions:

```text
ker Σ_m → (X_∞)_{Γ_m} → A_m → coker Σ_m → 0.
```

At this m the last cokernel is zero, but the first kernel can have positive `ℤ_p`-rank. Therefore the ordinary class group is not in general the full coinvariant module, even up to a bounded finite kernel. (Sharifi, Proposition 3.2.11, equation (3.2.1), and Remark 3.2.12, pp. 80–81.)

Set `H_m=ker(X_∞→A_m)`, a finite-index closed Λ-submodule. Prove `inertiaKernel_transition`: `H_n=ν_{n,m}H_m` for `n≥m`, and consequently

```text
#A_n = #A_m · #(H_m/ν_{n,m}H_m).
```

Choose inertia lifts above each ramified prime with the same image `γ^{p^m}`. Their pairwise differences, their conjugates, and `ω_mX_∞` generate H_m. Raising the lifts to `p^{n−m}` gives exactly the norm sum `ν_{n,m}`, proving both inclusions of the kernel equality. This construction also proves surjectivity of the sufficiently deep norm projections to A_n. Finite generation follows from the inertia sequence and compact Nakayama; the displayed finite transition quotients exclude a free Λ-summand. (Sharifi, Proposition 3.2.11 and the proof of Theorem 3.2.13, pp. 80–82.) *Needs:* §0.3, §2.1, and §2.3.

The essential test is a tower with two totally ramified primes: `ker(I₁⊕I₂→Γ)` has a rank-one direction `(t,−t)`. A control statement declaring that kernel finite cannot be used. With one prime the sum map is an isomorphism and §3.1 is recovered. With `n=m`, `ν_{m,m}=1` and the cardinality formula becomes `#A_m=#A_m`, fixing the transition normalization.

### 3.3 Arithmetic growth and its cutoff

Define `towerMu` and `towerLambda` as the supplied elementary-module invariants of `X_∞`. Define `towerNu` as the eventual integer `v_p(h(F_n))−μpⁿ−λn`, after proving that it stabilizes. The API includes invariance under generator change, finite index, removal of an initial segment, and reindexing the base layer: shifting by r sends `(μ,λ,ν)` to `(p^rμ,λ,ν+rλ)`. The invariant ν can be negative; the class valuation remains nonnegative at the levels where its formula applies. (Sharifi, Theorem 3.2.13, pp. 81–82; RJW, Theorem A.3, p. 200.)

Prove `classNumberGrowth` for every number-field `ℤ_p`-extension: for some `μ,λ∈ℕ`, `ν∈ℤ`, and N, `v_p(h(F_n))=μpⁿ+λn+ν` for `n≥N`. Apply the supplier's transition-quotient growth theorem to H_m from §3.2. Its convention `growthTransition(n,n₀)=ω_n/ω_{n₀−1}` means that the present `ν_{n,m}` uses `n₀=m+1`; finiteness of every `H_m/ν_{n,m}H_m` verifies its cyclotomic cutoff. H_m and X have the same μ and λ because their quotient is finite. At 2 take a sufficiently deep cutoff for the supplied automorphism argument. The finite arithmetic errors affect ν, not μ or λ. (Sharifi, Theorem 3.2.13 and proof, pp. 81–82; RJW, Lemmas A.9, A.11, Proposition A.10, and Corollary A.12, pp. 203–206.)

The predicate `HasIwasawaGrowth` records this equation on an existing sequence of natural-valued exponents. `cyclotomicClassNumberGrowth` specializes it to the full fields `ℚ(μ_{mp^{n+1}})` for a fixed positive m; eventual conductor shifts are absorbed into ν. Its light valuation is `cyclotomicClassVal p m n=padicValNat p (NumberField.classNumber (CyclotomicField (mp^{n+1}) ℚ))`; its API uses class-number positivity, transport through compatible field isomorphisms, and the conductor shift. `HasIwasawaGrowth` has uniqueness for prime p, eventual-equality invariance, and the base-shift API just stated. The arbitrary-tower theorem uses the arithmetic class module.

**Checks.**

- For the light valuation, p=1 gives 0 by the library valuation convention, while the arithmetic theorems require prime p. Positive m ensures positive conductor; at p=2,m=1 the fields at n=0,1,2 are ℚ, ℚ(i), and ℚ(ζ₈), whereas at p=3 the zeroth field is ℚ(ζ₃). All have positive class number before valuation.
- Constant p-class order `p^c` gives `μ=λ=0,ν=c`; the empty class group has c=0. The size of the trivial group is 1, whose valuation is 0.
- The sequence `p^n` of orders has exponent n, hence `μ=0,λ=1`. It has unbounded orders despite μ-vanishing.
- A vertical elementary summand `Λ/p^a` contributes `apⁿ+O(1)` to the exponent. Replacing `pⁿ` by n would confuse μ and λ.
- At `n=m`, the transition quotient is zero and has cardinality 1. Using `ω_m` instead of `ν_{m,m}=1` does not pass this boundary case.
- The formal predicate allows negative ν: the sequence `e_n=n−1` for `n≥1` has `(μ,λ,ν)=(0,1,−1)`. Requiring ν natural would incorrectly exclude such eventual formulas.

### 3.4 Rank criteria, norm descent, and Greenberg's condition

Prove `muZero_iff_boundedClassPrank`: μ=0 is equivalent to bounded dimensions `dim_{𝔽_p}A_n/pA_n`, and to finite generation of X over `ℤ_p`. Use the control of §3.2 and the elementary-module decomposition; a vertical summand forces `r_p(A_n)≥cpⁿ−O(1)` with c>0. In particular, the weaker estimate `r_p(A_n)/pⁿ→0` already excludes μ>0. The named signature `mu_zero_of_subexponential_prank` records the final numerical implication. (RJW, Corollary A.13, pp. 206–207; Sharifi, Proposition 2.4.10, p. 58, and §§3.2–3.4, pp. 80–91.)

For a finite extension `F'/F`, prove `classNorm_cokernel`: the norm on class groups at `F'F_n/F_n` has cokernel `Gal((F'F_n∩H(F_n))/F_n)`, so its order divides `[F':F]`. Therefore

```text
r_p Cl(F_n) ≤ r_p Cl(F'F_n) + v_p([F':F]).
```

After a fixed layer shift if `F'∩F_∞≠F`, deduce `muZero_normDescent`. This step uses the p-rank criterion and bounded degree, rather than claiming that class norms are always surjective. (Oesterlé, Théorème 2(i), p. 171; RJW, Corollary A.13, pp. 206–207.)

For totally real E define `GreenbergCondition E p` as `μ(E∞/E)=λ(E∞/E)=0`. Prove `greenberg_iff_bounded_pClassOrders` using growth and nonnegativity. Its native numerical milestone `bounded_iff_mu_lambda_zero` says that, for prime p and `HasIwasawaGrowth p e μ λ ν`, boundedness of e is equivalent to μ=λ=0; the finitely many initial values do not change boundedness. Its API includes invariance under a finite initial shift and, for abelian E after Layer 5, equivalence with λ=0 alone. This is a conjectural condition, not a proved universal theorem. (RJW, Conjecture A.15 and the growth theorem, p. 207.)

**Checks.**

- A cyclic group of order `p^n` has p-rank one but unbounded order. It satisfies the μ=0 criterion and does not satisfy the bounded-order condition.
- For an extension of degree prime to p, the norm cokernel has trivial p-part, so the rank inequality has no additive correction. For degree p it can have one such direction.
- A class module with `μ=0,λ=1` fails Greenberg. Ferrero–Washington alone therefore cannot establish that condition.
- The Greenberg definition concerns the cyclotomic tower and p-primary orders; it does not assert that the full class numbers are bounded, nor does it concern every `ℤ_p`-extension of E.

### 3.5 Ray-class and notation comparisons

Prove `rjwModuleDictionary`: in the odd-prime full cyclotomic tower, RJW's X is the present p-ramified `𝔛_S`, and RJW's Y is the present unramified X. Over the real tower, the plus part agrees with its intrinsic p-ramified and unramified modules. The conjugation action is the arithmetic completed action of §0.4. This is an equivalence of already defined carriers, not a new pair of Iwasawa modules. (RJW, §§13.2–13.3, pp. 190–193.)

Prove `greitherRayDictionary` for every prime, with the real-place convention of §2.3. At a finite layer, the full p-ray limit `A'(F_n)` fits

```text
0 → 𝔛_S(F∞)_{Γ_n} → A'(F_n) → Γ_n → 0.
```

For totally real F satisfying Leopoldt, the first term at n=0 is finite and is the torsion subgroup of `A'(F)`. Greither's `A'` is the full ray limit, not that torsion subgroup. If a tame group Δ₀ acts, its augmentation-complement projection kills the Γ term, giving `(1−e₀)A'(F)≃(1−e₀)𝔛_S(F∞)_Γ`. Also prove the p-split dictionary `X'_{S_p}=X/D_∞`, with D generated by decomposition groups at p. These comparisons are what make the finite ray-class arguments compatible with the tower modules. (Greither, §4, pp. 492–493, Theorem 4.11; Sharifi, Proposition 3.2.19, p. 83, and proof of Theorem 3.3.3, p. 84.)

For cyclic finite `E/F`, record the ambiguous-class comparison through the unit cohomology, ideal classes, and inertia-sum kernel/cokernel; derive Chevalley's formula

```text
#Cl(E)^G = h(F) ∏_v e_v /
  ([E:F] [O_F^× : O_F^×∩N_{E/F}E^×]).
```

Infinite places are included when ramified. The denominator uses norms of field elements intersected with base units, not only norms of integral units. (Sharifi, Theorem 1.3.16, p. 19.) *Needs:* Layer 2 and the cyclic cohomology supplier.

### Examples

In a one-prime tower with base p-class group zero, exact control and compact Nakayama give zero p-class groups at every level. In a tower with several ramified primes, the inertia-sum kernel can have positive rank and this proof cannot be copied. For `𝔛_S`, even under Leopoldt there is a free `ℤ_p` quotient of the base ray limit; only its torsion is the coinvariant module. These examples fix the distinction between exact class control and ray-class control.

### Dependencies

Layers 0 and 2, compact Nakayama, the elementary-module growth and Euler-quotient contracts from PadicMeasuresIwasawaAlgebras §§4–5, and cyclic global reciprocity. No analytic μ-vanishing or main-conjecture theorem is used.

## Layer 4: logarithmic comparison and abelian Leopoldt

### 4.1 From localization to the logarithmic regulator

Define `leopoldtLogMap` on `O_E^×⊗ℚ_p` by diagonal Iwasawa logarithms, using `log_p p=0`. Move local unit arguments into the exponential/logarithm disc by a residue-killing power and a further p-power, and divide the logarithm by that nonzero integer. Prove independence of this choice, linearity, compatibility with field embeddings and Galois action, and `leopoldtDefect_eq_logKernel`: its kernel dimension is exactly δ from §2.2. The local logarithm has finite torsion kernel on integral units and becomes injective after rationalization; it is not injective on the entire local multiplicative group, where p is in its kernel. The determinant formulation on a unit basis gives `leopoldt_iff_regulator_ne_zero`. (Sharifi, Proposition 1.5.6, Theorem 1.5.7, and Definition 1.5.9, pp. 31–32.)

**Checks.**

- A root of unity maps to zero and is already zero in the tensor source. This does not contradict injectivity of the completed localization on torsion in §2.2.
- `log_p p=0` while p is not a unit. Thus the regulator comparison must have the unit tensor as its source.
- Replacing a unit α by `α^N`, `N≠0`, multiplies its logarithm by N. Dividing by N recovers the same linear map, including when `p∣N`.
- Over ℚ the unit tensor has dimension zero and its regulator is the determinant of the empty matrix, namely 1. An empty regulator is not zero.

### 4.2 The algebraic-number form of Baker–Brumer

Prove `algebraicLog_kernel`: for nonzero algebraic α in `ℂ_p`, `log_p α=0` exactly when `α^N=ζ p^k` for some `N≥1`, integer k, and root of unity ζ. A rational p-adic valuation becomes integral after a power; the remaining algebraic unit can be moved into the small logarithm disc. Prove `bakerBrumer_algebraicNumbers`: logarithms of algebraic numbers that are independent over ℚ are independent over the embedded algebraic closure of ℚ. Import the small-disc independence theorem and use the preceding power/scalar comparison; do not claim independence over all of `ℚ_p`. The rational rescaling is Mathlib's `LinearIndependent.units_smul_iff`, applied to the nonzero rational powers as units. (Sharifi, Theorem 1.5.17, p. 33; the supplied linear-forms theorem is LinearFormsInLogarithms §8.10.)

The test α=p forces the kernel's p-power term; α a root of unity forces its torsion term; an algebraic unit with nonzero logarithm cannot be assigned zero by the choice of a residue-killing power. Two logarithms independent over ℚ may still be dependent over `ℚ_p`, so the coefficient-field qualification is part of the theorem. *Needs:* §4.1 and the qualitative linear-forms supplier.

### 4.3 Unit resolvents for real abelian fields

For a totally real abelian `E/ℚ`, `G=Gal(E/ℚ)`, prove `unitRepresentation_augmentation`: `(O_E^×/μ(E))⊗ℚ≃ℚ[G]/ℚ·N_G`. The real logarithmic embedding identifies the real extension with the coordinate-sum-zero hyperplane. To descend the representation isomorphism to ℚ, solve the equivariance equations over ℚ: a real invertible solution makes the determinant polynomial nonzero, and an infinite rational field has a point off its zero set. Use cyclicity of the rational augmentation representation, and clear denominators, to choose an actual unit α whose conjugates have just the product relation over ℚ. (Sharifi, Proposition 1.5.18, Lemma 1.5.19, and Proposition 1.5.20, pp. 33–35.)

Prove `abelianUnit_resolvent_ne_zero`: for every nontrivial algebraic character χ,

```text
Σ_{σ∈G} χ(σ)⁻¹ log_p(σα) ≠ 0.
```

Choose all but one conjugate logarithm as a rationally independent family. A vanishing resolvent would be an algebraic-coefficient relation among them, contrary to §4.2; its coefficient vector is not a multiple of the single product relation because χ is nontrivial. Prove the finite character determinant of these resolvents is nonzero and equals the regulator up to the explicit nonzero basis factor. This includes the descent of the unit representation, rather than assuming that real logarithmic spanning already proves rational cyclicity. (Sharifi, proof of Theorem 1.5.21, pp. 35–36.) *Needs:* §§4.1–4.2, Dirichlet units, and finite character theory.

### 4.4 Leopoldt for every abelian number field

Prove `abelianLeopoldt`: for any finite abelian `E/ℚ` and every p, δ(E,p)=0. For real E use the nonvanishing resolvents. For imaginary abelian E, pass to its maximal real subfield: `O_E^×/(μ(E)O_{E^+}^×)` is finite, so rational unit spaces agree. This reduction requires only finite Hasse unit index, not that the index always equals one. In the real cyclotomic tower deduce `principalGlobalUnitClosure_rank=[F(a)^+:ℚ]−1`. (Sharifi, Theorem 1.5.21 and proof, pp. 35–36; CM rank comparison, Lemma 1.4.12, p. 26.)

### Examples

In a real quadratic abelian field a fundamental unit ε has nonzero p-adic logarithm. Otherwise its algebraic-unit kernel condition would make it torsion, contradicting its infinite order. In a CM abelian field the unit rank is the real-subfield rank; extra roots of unity and a possible Hasse index 2 disappear after tensoring with `ℚ_p`, including at p=2. Neither argument gives an integral index-one assertion for the completed unit lattices.

### Dependencies

Layer 2's single defect definition, Dirichlet units and local logarithms, finite character theory, and LinearFormsInLogarithms §8.10. This layer proves strong Leopoldt only for abelian extensions of ℚ; weak Leopoldt in Layer 2 was established independently for all cyclotomic towers.

## Layer 5: Ferrero–Washington without a main conjecture

### 5.0 The canonical Kubota–Leopoldt object

Construct `kubotaLeopoldtPseudomeasure` from the Bernoulli distribution on p-power residue classes and its integral smoothing by integers prime to p. Its coefficients and arithmetic reciprocity orientation are those of §6.3. Restrict the smoothed measures to units, separate the torsion characters, and remove the smoothing parameter in the total-fraction algebra. Prove independence of the parameter, Galois descent to the character-value ring, equality of the overlapping conductor presentations, and uniqueness by the supplied moment-separation theorem. This constructs the canonical object itself; the rational-measure comparison of §5.3 is a subsequent theorem about it. (Sharifi, §§5.1–5.3, pp. 129–142; RJW, §§5–7, pp. 142–154.)

For every finite Dirichlet character χ and integer `r≥1`, prove `kubotaLeopoldt_interpolation` in the convention

```text
L_p(χ,1−r) = −(1−χω^(−r)(p)p^(r−1)) B_{r,χω^(−r)}/r.
```

Character values at p are zero when p divides the primitive conductor. The torsion character ω is the full Teichmüller character, including the sign at 2. Prove the exact smoothing multiplier, the conductor Euler-deletion identities and the character-projection comparison with the Bernoulli distribution. For the trivial analytic branch, prove the simple pole at s=1 with residue `1−p⁻¹`, and the integral numerator obtained by the canonical factor `1+S−u`; the extra factor 1/2 at 2 is retained as in §5.3. The API includes continuous evaluation on each character disc away from its pole, coefficient extension, interpolation uniqueness and the exact allowed denominator ideal. These assertions do not include analytic μ-vanishing, which is proved in §§5.2–5.3. (Sharifi, Definition 5.2.13, Proposition 5.2.15, Corollary 5.2.16 and §5.3, pp. 136–142; RJW, Theorem 7.1, p. 154.)

**Checks.**

- Changing an imprimitive character presentation adds exactly the Euler factors for the newly omitted primes; it does not change the underlying primitive branch.
- The trivial branch has its pole at s=1, hence at `S=u−1`. A bounded measure on that entire disc cannot represent the branch before clearing the denominator.
- At 2, ω retains the sign and the principal exponent group is `1+4ℤ₂`. A coordinate based on all of `1+2ℤ₂` would not be torsion-free.
- The residue multiplied by the derivative of the canonical pole factor is `u log_p(u)(1−p⁻¹)`. This fixes its scalar normalization and forbids multiplying the cleared numerator by p.

*Needs:* PadicMeasuresIwasawaAlgebras §§1–3 for measures, Amice transforms and admissible pseudomeasure evaluation; GlobalNumberFields Layers 9–10; LFunctions Layer 4 for the continued Dirichlet functions and generalized Bernoulli values.

### 5.1 The Γ-transform and coefficient content

For an O-valued measure α on `ℤ_p`, write `ℤ_p^×=V×U`, with `U=1+qℤ_p`, and fix a generator u of U. Define `gammaTransform α(s)=∫_{ℤ_p^×}⟨x⟩^s dα(x)`. Sum the V-translates, restrict to U, and push forward by the inverse of `y↦u^y`; its Amice transform is the unique `G_α∈O[[T]]` with `Γ_α(s)=G_α(u^s−1)`. Define the content as the least `v_π` of its coefficients, with value ∞ for zero. Prove `gammaTransform_integral`, `gammaTransform_Amice`, compatibility with restriction, linearity, and scalar multiplication. The power-series μ is this π-normalized content; Sinnott's p-normalized content is its quotient by e. The zero/nonzero and μ=0 assertions agree in either normalization. (Sinnott 1984, §1, equations (1.1), (1.4)–(1.6), pp. 274–275.)

**Checks.**

- A Dirac measure at 0 restricts to zero on `ℤ_p^×`, so its Γ-transform is zero and has content ∞, despite its original Amice series being 1.
- A Dirac measure at 1 has Γ-transform 1 and content zero. A Dirac measure at a p-adic unit x has transform `⟨x⟩^s`; torsion in x contributes no factor to this unweighted transform.
- At 2 the measure `δ₁+δ_{−1}` has Γ-transform 2. The V-sum is not divided by two; an averaged transform would incorrectly change its content.
- Multiplying a nonzero measure by π increases its π-content by one. In a ramified coefficient ring multiplying by p increases it by e, not one.
- At 2, V has two elements and `U=1+4ℤ₂`. Replacing U by `1+2ℤ₂` would destroy the torsion-free exponent coordinate used in this construction.

### 5.2 Rational functions and the content theorem

Prove `rationalMonomial_independence`: over any field k, if nontrivial Laurent monomials `Y_i` in independent variables are pairwise multiplicatively independent and `Σ_i r_i(Y_i)=0`, `r_i∈k(Z)`, then every r_i is constant. After extending k to contain an element of infinite multiplicative order, scale the variables to fix one monomial and move another. Subtract the transformed relation to contradict minimality of its length. Prove `padicBinomial_algebraicIndependence`: in characteristic p, rationally independent `a_i∈ℤ_p` give algebraically independent binomial series `(1+T)^{a_i}`. A polynomial relation would give a finite linear relation of distinct p-adic exponent characters, contradicted by character independence. Deduce `rationalTorsionPair_independence`: if `Σ_{η∈V}r_η((1+T)^η)=0`, then `r_η(Z)+r_{−η}(Z⁻¹)` is constant for every η. (Sinnott 1984, Proposition 3.1, its following lemma, and Proposition 3.2, pp. 277–279.)

For a measure with rational Amice function F, prove `rationalMeasure_unitRestriction`: the restriction `α*` to units is rational with function `F(T)−p⁻¹Σ_{ζ^p=1}F(ζ(1+T)−1)`. This formula is computed in a splitting coefficient field; the resulting function is the integral measure's transform, so the displayed p-denominator does not authorize arbitrary division of measures. Then prove `sinnottContentTheorem`:

```text
μ(Γ_α) = μ(α* + α*∘(−1)).
```

Reduce modulo π after scaling to content zero. The preceding independence theorem forces the only possible cancellation to pair η with −η; the resulting constants vanish under the unit-restriction condition. Iterate for higher content. (Sinnott 1984, Lemma 1.1, p. 274, Theorem 1 and its proof, pp. 276–277.) *Needs:* §5.1 and the measure/Amice contracts.

### 5.3 The canonical Dirichlet series, including the pole branch

Let θ be an odd primitive Dirichlet character of the first kind: its conductor is not divisible by `p²` for odd p or by 8 for p=2. Assume `θω≠1`. Choose an integer `c>1` prime to p and the conductor, and define the periodic function `ε(a)=θ(a)` if `c∤a`, and `ε(a)=(1−c)θ(a)` if `c∣a`. For a multiple f of its period set

```text
F(T) = Σ_{a=1}^f ε(a)(1+T)^a / (1−(1+T)^f).
```

Prove `dirichletRationalMeasure_integral` and independence of f: the numerator's cancellation makes this rational expression an element of `O[[T]]`. Its measure α satisfies `Γ_α(s)=(1−θ(c)c⟨c⟩^s)L_p(−s,θω)`. The interpolation identifies this with the existing Kubota–Leopoldt object, rather than defining a new analytic L-function. The clearing multiplier has μ=0; this does not mean it is a unit at every arithmetic point. Since α is invariant under reflection, §5.2 gives `μ(g(T,θ)/2)=μ(α*)`. The unit-restricted numerator has a linear coefficient equal to 1 before reduction, so `α*` has nonzero reduction modulo π. Conclude `dirichletAnalyticMu_zero`. (Sinnott 1984, Proposition 4.1, equations (4.1)–(4.5), and the final coefficient calculation, pp. 279–282.)

For the trivial branch let `F₁(u^s−1)=ζ_p(s)` and define its **canonical** cleared numerator `P(S)=(1+S−u)F₁(S)`. Prove `zetaClearedNumerator_mu_zero`: P is integral and has μ=0 at odd p; at 2 the integral series with μ=0 is `P/2`. At `S=u−1`, its value is `u log_p(u)(1−p⁻¹)`, a p-adic unit at odd p and twice a unit at 2. This residue fixes the normalization of the clearing factor; multiplying that factor by p would change μ. (RJW, Theorem 7.1, p. 154; Sinnott 1984, Introduction and §4, pp. 273, 279–282; Oesterlé, §4, p. 174.) *Needs:* §§5.1–5.2 and §5.0.

**Checks.**

- The zero measure has content ∞. A content function returning 0 on the zero numerator would falsely prove nonvanishing in the μ argument.
- A reflection-invariant measure has symmetrization twice the measure; at 2 its content gains `v_π(2)`. The formula cannot discard the 1/2 in the canonical analytic branch.
- For ramified O the preceding gain is `v_π(2)`, not `v_p(2)`; dividing by the ramification index restores the p-normalized content.
- On the trivial branch, `v_p(u log_p(u)(1−p⁻¹))=0` at odd p and equals 1 at 2 for a primitive u. Replacing the clearing factor by p times itself raises μ and fails this test.
- Taking u deeper in `1+qℤ_p` increases the valuation of its logarithm. Such a u is not a generator of this fixed principal-unit group and does not preserve the asserted normalization.

### 5.4 Relative class numbers and the odd-prime mirror step

First assume an imaginary abelian k contains `μ_q` and has conductor not divisible by qp. Apply the relative analytic class-number formula to its cyclotomic layers. Prove `relativeMu_sumAnalytic`: the coefficient of `pⁿ` in `v_p(h(k_n)/h(k_n^+))` is the sum of `μ_p(g(T,θ)/2)` over the odd first-kind characters other than `ω⁻¹`. Use p-normalized content, so a ramified coefficient ring contributes `μ_π/e`, with character multiplicities counted in the class-number product. The exceptional character and the roots-of-unity and Hasse-index factors contribute only `O(n)`. Thus the relative μ vanishes by §5.3, for every p. (Washington 1978, relative class-number formula, p. 88; Oesterlé, §4, p. 174; Sharifi, Proposition 6.2.4, pp. 160–161; Ferrero 1978, formulas (1.1b)–(1.1c), p. 10, Theorem 1.2, Lemma 1.3, and Theorem 1.4, p. 11.)

For odd p prove `mirrorPrank_inequality`: if E is CM and contains `μ_p`, then `r_p A(E)^+≤r_p A(E)^−+1`. Kummer duality and the unit contribution give the one-dimensional correction. Consequently μ of the full class module vanishes exactly when μ of the minus part does. Here the integral idempotents are available because 2 is a unit. (Sharifi, Theorem 4.4.2 and proof, pp. 111–113, and Proposition 3.4.3, p. 91.) *Needs:* Layer 3, Kummer duality, and §5.3; no main conjecture.

### 5.5 The dyadic relative-to-full comparison

Let k be imaginary abelian and p=2. Put `A_n=Cl(k_n){2}`, `B_n=Cl(k_n^+){2}`, `A_n⁻=ker(N:A_n→B_n)`, and `e_n⁻=v₂(h(k_n)/h(k_n^+))`. Prove `dyadicClassPrank_bound`:

```text
r₂(B_n) ≤ e_n⁻+1,       r₂(A_n) ≤ 2e_n⁻+1.
```

The proof uses the quadratic ambiguous-class and norm-kernel comparison at finite level, with its order-two errors. It does not apply a minus idempotent to a pseudo-isomorphism of full dyadic modules. Since relative μ is zero, `e_n⁻=O(n)` and the second bound gives `r₂(A_n)/2ⁿ→0`. The lower bound for any vertical elementary summand in §3.4 now forces full arithmetic μ=0. Prove `dyadicNormMinus_mu_zero` for the inverse norm-kernel module and for the contragredient dual of the direct norm-kernel limit when `μ₄⊂k`, using their finite comparison and the absence-of-finite-submodules result at the appropriate step. (Washington 1975, Lemma 4 and proof, p. 184; Ferrero 1978, Lemmas 1.5–1.7 and Theorem 1.8, pp. 11–12.) The signature `dyadic_rank_subexponential` records the numerical estimate, while the arithmetic rank inequality remains an explicit target on its class-group carriers.

### 5.6 Ferrero–Washington for every abelian field

Prove `ferreroWashington`: for every finite abelian `E/ℚ` and every prime p, the arithmetic μ of its cyclotomic `ℤ_p`-extension is zero. Enlarge E into an imaginary first-kind cyclotomic field containing `μ_q`; move down the finite initial conductor shift; apply §§5.4–5.5; and descend along the bounded-degree class norm using §3.4. This proves the full-module statement, not just a statement about relative class-number quotients. Combining it with growth gives eventual linearity `v_p(h(E_n))=λn+ν`. The signature `ferreroWashington_cyclotomic` gives this conclusion for full cyclotomic fields on native Mathlib carriers. (Sinnott 1984, §4, pp. 279–282; Ferrero 1978, Theorem 1.8, p. 12; Oesterlé, Théorème 2 and §4, pp. 171, 174.)

The result does not say that λ vanishes. For totally real abelian E it reduces Greenberg's condition to λ=0, leaving that assertion unproved. It also does not replace the distinct-prime boundedness theorem described in the scope section.

### 5.7 Digits, separation, and the original obstruction comparison

For `x∈ℤ_p`, let `s_n(x)` be its least nonnegative residue modulo `qpⁿ`. Prove `digitEquidistribution`: for rationally independent `γ_1,…,γ_r∈ℤ_p`, Haar-almost every α has the vectors `s_n(αγ_i)/(qpⁿ)` equidistributed in `[0,1)^r`. Prove `torusWeylCriterion` for a sequence in `(ℝ/ℤ)^r`: its empirical averages tend to normalized Haar measure exactly when the averages of every nontrivial integral Fourier character tend to zero. Its API includes products of circles and character conjugation. Then apply this criterion in the Fourier proof: nonzero integer combinations of the γ's are nonzero, so the additive characters are eventually orthogonal, giving an `O(1/N)` squared mean. Apply the almost-everywhere convergence argument along squares and fill the gaps by the unit bound. Prove the strengthened `digitBox_congruence`: a prescribed congruence for α, a target box, and divisibility of all residues by a fixed d prime to p can be met at all sufficiently large n. (Oesterlé, Propositions 5–6, pp. 178–179; Sharifi, Proposition 6.2.8, pp. 162–163.)

Prove `torsionRoot_positiveArrangement` for odd p. With `R=(p−1)/2` and `r=φ(p−1)`, choose a cyclotomic integer basis from torsion roots, then change signs and order of representatives modulo `{±1}`. If `r<R`, obtain one dependent row with nonnegative coefficients, a positive first coefficient, and a further positive coefficient; make every row's first nonzero coefficient positive. Choose rationally independent positive real basis coordinates placing precisely that distinguished row between `p^{−m}` and `2p^{−m}`, and every other row between 0 and `p^{−m}`. If `r=R`, choose the coordinates directly. This finite lattice step supplies the dependency case in the digit argument. (Washington 1978, Proposition 2 and proof, pp. 91–92.)

Deduce `torsionDigit_separation`: choose representatives R of the torsion roots modulo sign so that, for every `m,d>0`, `(d,p)=1`, and all sufficiently large n, there are `α₁,α₂≡1 mod p^m` and `η₀∈R` for which every residue has zero carry from n to `n+m`, except for the η₀ residue of α₂, which has one carry `qpⁿ`; the specified residues are divisible by d. This is an eventual-existence statement, not a claim about every α. At p=2 the representative set has one element, so the dependence step disappears. (Oesterlé, Proposition 4, p. 176, and conclusion of §6, p. 180.)

Retain `bernoulliObstruction_comparison`: the relative class-number formula and residue expression for generalized Bernoulli numbers translate a hypothetical positive arithmetic μ into either a base obstruction or an odd primitive first-kind character λ of conductor d or dq, `d>1`, for which

```text
Σ_{η∈R} Σ_{i=0}^{d−1} i λ(s_n(αη)+iqpⁿ) ≡ 0 mod 𝔭
```

for every n and every unit α. At odd p the base obstruction is constancy of a nonzero torsion-character weighted digit sum; at 2 the base `ℚ(i)` has zero μ by class number one and §3.1. The separation theorem contradicts the nonbase congruence. This comparison explains the digit method on the same arithmetic normalization; the proof of §5.6 uses the rational-measure content theorem and does not depend on this obstruction or on an Iwasawa main conjecture. (Oesterlé, Propositions 1–2 and §§3–4, pp. 173–175.) *Needs:* §§3.3–3.4, the relative class-number formula, and the digit results just stated.

### Examples

For p=2 the reflection sum in Sinnott's theorem is twice a reflection-invariant measure. Removing that factor is exactly why the canonical series is `g/2`. The relative class-number estimate then bounds the full class-group rank by `O(n)`, which is already small compared with `2ⁿ`; bounded rank is not needed at that intermediate step. For an arbitrary ramified O, the same calculation uses `v_π(2)` and then divides by e to compare with arithmetic p-normalized μ.

### Dependencies

Layers 0–4, relative class-number formulas, §5.0, PadicMeasuresIwasawaAlgebras §§1–4, and §5.7's torus Weyl criterion, using Haar averaging and Fourier-character orthogonality from RepresentationTheory/CompactGroups Layers 0 and 4–5 and RepresentationTheory/CharacterTheory Layers 0–3. The analytic route is §5.2 → §5.3 → §§5.4–5.6. The digit separation supplies an independent comparison; there is no edge back from a main conjecture or an arithmetic μ-vanishing conclusion into its analytic proof.

## Layer 6: Stickelberger normalization and the classical statement

### 6.0 Totally real special values and integral smoothed distributions

For a totally real number field k, finite abelian H/k and finite-order characters, prove `totallyRealHeckeValue_rational`: the group-ring value at `1−r`, `r≥1`, with the character inversion of §6.1, is rational, and its character values satisfy the coefficient-field Galois law. Use the finite-order Hecke functions of LFunctions Layer 5. This is the Siegel–Klingen rationality theorem with its conductor and parity data, at every totally real base; no abelian-over-ℚ hypothesis is imposed on k. (Kurihara, §2.3, pp. 6–7; Dasgupta–Kakde, §1, pp. 3–4; the rationality and integrality inputs in §8.1.)

Construct `deligneRibetPseudomeasure` on the narrow ray tower containing the cyclotomic tower, with its compatible coefficient-valued smoothed measures. Prove `deligneRibet_distributionCongruences`: for every locally constant finite-character combination whose integral test function is divisible by `p^a`, its smoothed special-value combination is divisible by the same coefficient ideal, with the exact Euler and smoothing factors of §§6.1–6.3. These congruences give existence of the bounded smoothed measure; moment separation gives uniqueness. Removing smoothing gives a pseudomeasure with the cyclotomic pole ideal and augmentation transport specified in §6.2. The API includes finite-level distribution relations, coefficient extension, restriction to subextensions, change of smoothing set, and comparison over ℚ with §5.0. (Deligne–Ribet, §0, pp. 227–232, and its measure construction; Kurihara, §4.1, pp. 22–24; Dasgupta–Kakde, §8.1.)

Prove `deligneRibet_dyadicDivisibility` with the exact disjoint sets Σ,Σ′, torsion-free smoothed units and ramification hypotheses of §9.7: `Θ_{Σ,Σ′}/2^t` belongs to the actual integral minus coefficient order, where `t=#(Σ′∩S_∞)`. The corresponding integral cusp constant terms satisfy this same divisibility before the finite-weight congruence in §9.3 is formed. This is an integral congruence in the order, including its p-torsion components, rather than a statement only after character normalization. Prove the interpolation and restriction laws for those divided values with their real-place factors retained. (Dasgupta–Kakde–Silliman–Wang, §3.1, Lemma 3.1 and Theorems 3.2–3.3, pp. 21–24; Theorem 1.2, pp. 4–5.)

**Checks.**

- Over ℚ the resulting interpolation agrees with the Bernoulli formula of §5.0, including its p-Euler factor and trivial-character pole.
- For a split prime, depletion at zero gives `1−1=0`, whereas smoothing gives `1−Nv`. The two measure modification maps must have those different values.
- Moving all d real places into Σ′ contributes `2^d`; moving none contributes 1. At p=2 this change is not multiplication by an integral unit.
- An integral list of normalized character values in `ℤ₂[C₂]` still has to satisfy the congruence between its two coordinates. The distribution congruences hold in that order, not just in its normalization.

*Needs:* LFunctions Layers 3–5; GlobalNumberFields Layers 2 and 7–10; ClassFieldTheory Layers 10–13; PadicMeasuresIwasawaAlgebras §§1–3 and 6.1; §5.0 for the rational comparison.

### 6.1 Arithmetic Frobenius and the analytic group-ring element

For finite abelian `H/k`, k totally real, set `G=Gal(H/k)`. For finite disjoint sets Σ,Σ′ with `Σ⊇S_∞`, define `StickelbergerElement H Σ Σ′(s)` by

```text
χ(Θ_{Σ,Σ′}(s)) = L_{Σ,Σ′}(χ⁻¹,s),
L_{Σ,Σ′}(χ,s) = L(χ,s)
  ∏_{v∈Σ_f}(1−χ(v)Nv^(−s))
  ∏_{v∈Σ′}(1−χ(v)Nv^(1−s)).
```

The primitive Hecke L-function has `χ(v)=0` at a ramified place. Character idempotents define the complex group-ring element uniquely. Prove `stickelberger_character`, `stickelberger_restrict`, and `stickelberger_rational_negativeInteger`: the value at `1−r`, `r≥1`, lies in `ℚ[G]`. The rationality uses §6.0's Siegel–Klingen theorem, not a new proof of a Hecke functional equation. (Dasgupta–Kakde, §1, pp. 3–4; Kurihara, §2.3, pp. 6–7.)

Prove the exact depletion and smoothing identities. At an unramified finite v, depletion multiplies by `1−Frob_v⁻¹ Nv^(−s)` and smoothing by `1−Frob_v⁻¹ Nv^(1−s)`. At a ramified v use `e_v=#I_v⁻¹Σ_{τ∈I_v}τ` and a Frobenius lift: the depletion factor is `1−Frob_v⁻¹ e_v Nv^(−s)`, independent of the lift. This rational factor need not be integral on its own. If H is CM, `jΘ(0)=−Θ(0)` holds when `#Σ≥2`; for `k=ℚ,Σ={∞}`, the trivial character value need not vanish. (Dasgupta–Kakde, equations (5), (7) and §1.1, pp. 4–7.) *Needs:* character theory, Hecke L-functions, and the arithmetic Frobenius convention.

**Checks.**

- For the trivial extension of ℚ with `Σ={∞}`, `Θ(0)=ζ(0)=−1/2`. Smoothing multiplies it by `1−Nv`, which does not force it to zero; the minus assertion needs its stated hypothesis.
- At a split finite prime, depletion at s=0 has factor `1−1=0`, while smoothing has factor `1−Nv≠0`. These operations cannot be interchanged.
- A ramified character has `χ(e_v)=0`, so adding v to the depletion set contributes factor 1 on that component. Omitting e_v gives the wrong local factor.
- Applying a character χ to the Frobenius factor gives `1−χ⁻¹(v)Nv^(−s)`, fixing the inverse in the defining character interpolation.

### 6.2 Integral smoothing and the shifted pole

For `S⊇S_∞∪S_ram(H/k)` and finite T disjoint from S, assume `O^×_{H,S,T}` has no nontrivial torsion: no root of unity is congruent to 1 at every T-place. Define `smoothedStickelberger H S T=Θ_{S,T}(0)` and prove `smoothedStickelberger_integral∈ℤ[G]`. Two T-primes of different residue characteristics suffice for this hypothesis. Prove also `rootsOfUnityAnnihilator_clearsTheta`: `Ann_{ℤ[G]}μ(H)·θ_S⊂ℤ[G]`. (Dasgupta–Kakde, condition (1) and equation (2), p. 4; Kurihara, equation (4), p. 7.)

On `K_∞=H(μ_{p∞})` put `J_κ=(σ−κ(σ):σ∈Gal(K∞/k))`. Prove `cyclotomicClearingIdeal`: `J_κθ⊂Λ`. With `τ(σ)=κ(σ)⁻¹σ`, prove `stickelbergerSerreDictionary`, `g=τ(θ^#)`, and `I(G)g⊂Λ`. The augmentation ideal clears g, while the shifted ideal J_κ clears θ. Indeed the inverse transport of `σ−1` is a unit multiple of `σ−κ(σ)`. This arithmetic normalization is not the generic construction of a pseudomeasure. (Kurihara, §4.1, equation (11), pp. 22–24.)

The API includes restriction compatibility, change of T, the rational character value, the exact clearing ideal, and the sharp/twist comparison.

**Checks.**

- The unsmoothed value `ζ_ℚ(0)=−1/2` is not integral. For smoothing at 3 it becomes `(1−3)(−1/2)=1`, while smoothing at 2 alone would leave 1/2 and does not kill the root −1.
- At a split T-prime, the smoothing factor is `1−Nv`; at a split depletion prime it is zero. Interchanging these operations gives the wrong integral element.
- For a pseudomeasure with denominator `γ−u`, the element `γ−u` belongs to its clearing ideal, while `γ−1` generally does not. Merely imposing augmentation zero misses the shifted pole.
- If g is already integral, its clearing ideal is the whole coefficient order. Requiring every clearing element to have augmentation zero would fail this degenerate case.

### 6.3 Deligne–Ribet and Kubota–Leopoldt on the same arithmetic action

For totally real k and finite abelian totally real `F/k`, transport the Deligne–Ribet pseudomeasure from the narrow ray tower to `Gal(F(μ_{p∞})/k)` using arithmetic reciprocity. Prove `deligneRibet_arithmeticInterpolation`: for finite ψ and `r≥1`, `κ^rψ(g)=L_S(1−r,ψ)`. Use §6.0's existence theorem and pole condition and the separate moment-separation theorem of PadicMeasuresIwasawaAlgebras §3. Prove compatibility with restriction to smaller fields. Depleting at `v∤p` multiplies g by `1−Nv⁻¹Frob_v`; smoothing θ at v, after sharp and τ, instead multiplies g by `1−Frob_v`. Both follow by applying τ to their distinct factors in §6.1. (Kurihara, §4.1, pp. 22–24; Kolster 2009, Lecture 1 §1, p. 8.)

In a procyclic coordinate, prove `deligneRibet_characterNumerator`: for a finite-order even ψ the component is `G_{ψ,S}(T)/H_ψ(T)`, with `H_ψ=1` except on a type-W branch, where `H_ψ=ψ(γ)(1+T)−1`. The interpolation is

```text
G_{ψ,S}(u^r−1)=H_ψ(u^r−1)L_S(1−r,ψω^(−r)).
```

Type S means that the character field is disjoint from the cyclotomic tower; type W means it lies in that tower. The full character ω is used before passing to the procyclic quotient. The same statements do not require k to be abelian over ℚ. (Kolster 2009, pp. 7–9; Kakde, §3, p. 14.)

Over ℚ, prove `bernoulliStickelberger_dictionary`. With `F_n=ℚ(μ_{mp^n})`, `(m,p)=1`, the Bernoulli distribution has coefficient `a/(mp^n)−1/2` at `σ_a⁻¹`; its twist-character projection is the imported Kubota–Leopoldt series, including the p-Euler factor

```text
L_p(χ,1−r)=−(1−χω^(−r)(p)p^(r−1)) B_{r,χω^(−r)}/r.
```

For a nontrivial even first-kind χ write `f_χ(u^s−1)=L_p(χ,s)`. For χ=1 the integral numerator is `f₁(S)=(1−u/(1+S))F₁(S)`, with the dyadic factor 1/2 retained when measuring content. Prove the Mellin variable relation `a(T)=u(1+T)⁻¹−1` between this s-coordinate and the Serre/Coleman coordinate. It carries s to `1−r`, and it moves the pole at s=1 to augmentation. (Sharifi, Proposition 5.3.3 through Theorem 5.3.13, pp. 138–142; AWS notes, §2.5, p. 23.) *Needs:* §§6.1–6.2 and the analytic supplier contracts.

### 6.4 Twist, dual, and Euler evaluation comparisons

Prove `arithmeticTwist_characteristic` on the actual arithmetic modules: a coordinate twist by r sends a characteristic series f to `f(u^(−r)(1+T)−1)`. The generic twist automorphism is supplied; the target is its compatibility with arithmetic conjugation and the chosen dual convention. For an actual Tate twist require the full-character factorization and normalization in Conventions; otherwise use the actual κ-value of the chosen lift. Thus for a finite specialization,

```text
#M(−r)_Γ / #M(−r)^Γ = #(O/f(u^r−1)O),
```

provided `f(u^r−1)≠0`. With a covariant dual the corresponding substitution reverses γ and must be changed explicitly. A finite invariant group is zero if M has no nonzero finite Λ-submodule. A finite module E has `#E_Γ=#E^Γ`, so its Euler quotient is 1 even though either factor can be nontrivial. (Kolster 2009, Lemmas 1.1–1.2, pp. 6–7; the generic Euler quotient is PadicMeasuresIwasawaAlgebras §4.7.)

The light map `tateCoordinate u a T=u^a(1+T)−1` satisfies `tateCoordinate_comp`; its API also records exponent zero and inverse exponent. The light `depletedEuler F=1−F⁻¹` fixes the pre-sharp Frobenius orientation. The depletion API includes evaluation at 1, compatibility with coefficient homomorphisms, and sharp carrying `1−F⁻¹` to `1−F`. These are coefficient-field formulas, not assertions that substitution at a nonzero constant is defined on every formal series over an arbitrary ring; the actual continuous substitution is supplied over its complete p-adic coefficient ring.

**Checks.**

- On `M=ℤ_p` with trivial Γ-action, f=T. Twisting by r gives `T−(u^r−1)` up to a unit, so the specialization of `M(−r)` has order `|u^r−1|_p⁻¹`, when r≠0.
- With r=0 in that example the specialization is infinite. A formula using a finite order or dividing by f(0)=0 is invalid.
- `tateCoordinate u (−1) 0=u⁻¹−1` and exponent zero fixes T. These two proved Lean checks distinguish inverse Tate substitution from generator change.
- For a split place, `depletedEuler 1=0`; for formal Frobenius value 2 in ℚ it is 1/2. After sharp the second value would be `1−2=−1`, fixing the inverse convention.
- For O with residue degree f and ramification e, the order of `O/π^a` is `p^{fa}`. A statement counting it as `p^a` without fixing O fails in an unramified coefficient extension.

### 6.5 Classical main-conjecture predicates

For totally real F, an even finite-order one-dimensional p-adic character ψ of type S, and `S⊇S_p∪S_∞`, define `MainConjecture F p ψ S` as equality of the monic distinguished factors of the algebraic and analytic series. The algebraic factor is computed from the ψ-isotypic part of `𝔛_S(F_ψ∞)⊗ℚ_p` over a splitting field. Define `StrongMainConjecture` for the integral ψ-quotient to mean equality of its full characteristic ideal with the analytic numerator ideal, with the trivial-character augmentation factor included. For prime-to-p ψ the quotient agrees canonically with the integral eigenspace; for p-power-order ψ the difference cannot be erased before establishing its coefficient-change comparison in Layer 12. (Kolster 2009, Main Conjecture 1.3 and surrounding conventions, pp. 7–9; Rognes–Weibel, Appendix A, pp. 45–47.)

Prove `mainConjecture_S_independent` by the local Euler factors and `mainConjecture_auxiliaryField_independent` after rational character projection. The rational cyclotomic equivalences are proved in §7.8 after constructing the arithmetic Coleman map. (Sharifi AWS notes, Theorems 2.5.1 and 2.5.4, pp. 23–24.)

**Checks.**

- For p=37 and k=32 the odd unramified component is indexed by `ω^{1−32}=ω⁵`, rather than by `ω³²`. The even unramified component can vanish while the corresponding analytic numerator is nonunit.
- If the analytic numerator is a unit and the arithmetic summand has no finite submodule, the strong form forces that summand to be zero. Characteristic ideal one alone would not kill an arbitrary finite Λ-module.
- Equality of distinguished factors is compatible with different powers of π. Thus the weak predicate does not imply the strong one without a μ comparison.
- For the trivial branch the analytic object has a pole before clearing, and the factor `γ−1` is explicit. Treating it as a nonexceptional even branch gives the wrong ideal.

### Examples

For `M=ℤ_p`, the augmentation characteristic factor is T, so evaluating the twist by −r produces the correction `u^r−1`. On the analytic side the trivial pseudomeasure has an augmentation pole; the product `Tg` is integral. These two terms match in the classical main conjecture. In the s-coordinate of ζ_p the same pole sits at `S=u−1`; the substitution `S=u/(1+T)−1` is what reconciles the two descriptions.

### Dependencies

Layers 0–5, the exact analytic suppliers in the scope section, PadicMeasuresIwasawaAlgebras' character, twist, pseudomeasure and Euler-quotient contracts. No Eisenstein congruence is needed to define the conjectures or the analytic comparison.

## Layer 7: Vandiver's condition and the Coleman image

### 7.1 Integral norm and interpolation

For any prime p and finite unramified `E/ℚ_p`, put `O=𝒪_E`, `B=O[[T]]`, `Y=1+T`, and `Φf=f(Y^p−1)`. Give B the coefficientwise p-adic topology, equivalently the (p,T)-adic topology, and B^× its subspace topology. Give the receiving B its scalar structure through Φ. Prove `colemanSeriesBasis`: it is finite free of rank p with basis `1,Y,…,Y^{p−1}`. Define `colemanNorm` N and `colemanTrace` by the native determinant and trace in this scalar structure; their values lie in the base copy B. Prove `colemanTrace_eq_p_psi` for the integral bounded ψ supplied by PadicMeasuresIwasawaAlgebras §2. After adjoining μ_p, prove

```text
Φ(Nf)=∏_{ζ∈μ_p}f(ζY−1),    Φ(colemanTrace f)=Σ_{ζ∈μ_p}f(ζY−1).
```

All p roots occur; translations converge in the complete integral coefficient extension. Prove multiplicativity, continuity, `NΦ(f)=f^p`, and norm specialization at the chosen roots. These compare the native operators with arithmetic norms, rather than define an integral operator by division by p. (Sharifi, Proposition 5.4.3, Definition 5.4.4 and Lemma 5.4.14, pp. 143–147; RJW, Lemmas 10.8–10.11, pp. 166–168.)

Let σ be arithmetic p-Frobenius on O, Σ its coefficientwise action, and σ_a its extension fixing the chosen `ζ_{p^a}`. For `a≥1`, set `E_a=E(ζ_{p^a})`, `π_a=ζ_{p^a}−1`, and define `localUnitNormLimit E p=lim_a O_{E_a}^×` with the product/subgroup topology. Construct the integer-ring and integral-basis comparisons from LocalFieldsRamification Layers 0–3 and LocalGaloisGroups Layer 0: `O_{E_a}=O[ζ_{p^a}]`, and the relative basis from a+1 to a is `1,ζ_{p^{a+1}},…,ζ_{p^{a+1}}^{p−1}`. Polynomial-series units lift every finite-level unit. Define `colemanInterpolation` as the unique topological group isomorphism

```text
localUnitNormLimit E p ≃ {f∈B^× : Nf=Σf},
f_u(π_a)=σ_a^{a−1}(u_a),    u_a=σ_a^{1−a}(f_u(π_a)).
```

Its API includes multiplication, evaluation, uniqueness, norm compatibility and Galois equivariance, where b acts on series by `f(T)↦f(Y^b−1)`. Prove existence using `Nf≡Σf mod p`, `N(1+p^kB)⊂1+p^{k+1}B` for k≥1, and compactness; uniqueness uses Weierstrass preparation and the unbounded degrees of π_a, not convergence of π_a to zero. The corrected projector is `lim_n(Σ⁻¹N)^n`. For E=ℚ_p, Σ=id and this is norm-fixed interpolation. (Sharifi, Proposition 5.4.6, Corollaries 5.4.7–5.4.8, Theorem 5.4.9, Definition 5.4.12 and Corollary 5.4.13, pp. 144–147; the roots in that theorem are indexed here by a=n+1. RJW, Theorem 10.13 and proof, pp. 168–169.)

**Checks.**

- On a constant c, `Nc=c^p` and `colemanTrace c=pc`; multiplying only p−1 conjugates fails both values. Also `ψΦ=id`, whereas `ψ(Y)=0` and `ψ(1)=1`.
- `N(Y)=(−1)^{p−1}Y`. At 2 the norm-compatible root tower is `(-ζ_{2^a})_a`, interpolated by `−Y`; the unsigned roots fail norm compatibility.
- For a Teichmüller constant c in unramified O, `Nc=σ(c)` and the corresponding tower has coordinates `σ^{1−a}(c)`. With c outside ℤ_p, discarding Σ gives the wrong tower. Over ℤ_p a constant in `1+pℤ_p` other than 1 is not norm fixed.
- At p=2,a=1, `E_a=E` and `π_a=−2`; at odd p this layer has degree p−1. Replacing it by a root of order one invalidates the evaluation and unit-lift claims.

### 7.2 The normalized arithmetic Coleman map

Now take E=ℚ_p and odd p. Write `U∞,1` for the principal subgroup of `localUnitNormLimit`, `G=ℤ_p^×`, and `Λ(G)` for its measure algebra. Give `U∞,1` its continuous p-adic powers and completed action through ProfiniteArithmetic §1.3 and PadicMeasuresIwasawaAlgebras §1, verifying pro-p closure. On B put `∂=Y d/dT`, `δf=(∂f)/f`, `W=ker(ψ−id)`, and `V=ker ψ`. These specialize the supplied measure operators; `H:V→V` is multiplication by x⁻¹ under Amice, hence the inverse of ∂ on V. Prove `colemanLogDerivative_surjective`: δ maps the norm-fixed units onto W with kernel `μ_{p−1}`. Prove the boundary sequence `0→ℤ_p→W --(1−Φ)→ V --ev₀→ℤ_p→0`; construct its middle inverse by summing Φ-iterates for series vanishing at zero. (RJW, Theorem 12.9, pp. 180–182, Lemma 12.15, pp. 183–184.)

Define `arithmeticColeman u=−Amice⁻¹(H((1−Φ)δ(f_u)))`. The minus sign fixes compatibility with the canonical ζ_p from §5.0: this map is minus RJW's raw composite in Definition 10.14, p. 170, as follows from Proposition 10.4 and Lemma 10.5, p. 165. Prove continuity and Λ(G)-linearity, and `principalColeman_exact`:

```text
0 → ℤ_p(1) → U∞,1 --arithmeticColeman→ Λ(G) --∫x→ ℤ_p(1) → 0.
```

The first map is the compatible-root tower; the last is the first moment. On full local units the kernel is `μ_{p−1}×ℤ_p(1)`. Taking plus parts is exact for odd p and both Tate lines have j=−1, giving `principalColeman_plusEquiv: U∞,1^+≃Λ(G^+)`. Identify `e^+Λ(G)` with `Λ(G^+)` by the actual quotient map, with identity e^+ on its source. For any finite free commutative ℤ_p-algebra A, also prove transport of this entire exact sequence and plus equivalence through `A⊗ℤ_p−`, using finite products of compact modules to identify algebraic and completed tensors. This coefficient change differs from replacing the arithmetic field by E in §7.1. (RJW, Theorem 12.17 and proof, pp. 184–185; Theorem 12.23(ii), pp. 188–189; finite-free tensor exactness.)

**Checks.**

- The compatible roots have `f_u=Y`, so `δf_u=1` and Coleman value zero. Teichmüller constants also have value zero, but are absent from U∞,1 unless equal to 1.
- For `c_a(b)=(ζ_{p^a}^b−1)/(ζ_{p^a}−1)`, `f_c=(Y^b−1)/T` has constant coefficient b, so no division by zero occurs. For a topological generator b of G the normalized value is `([b]−1)ζ_p`; the raw derivative composite gives its negative.
- A Dirac measure δ_b has mass 1 and first moment b. Thus `δ_b−bδ_1` has first moment zero but mass `1−b`; replacing the endpoint by augmentation changes the sequence.
- At 2, j=−1 does not make invariants an exact functor. The plus equivalence is asserted only for odd p; §7.1 remains valid at 2.
- For A=ℤ_p×ℤ_p, scalar transport gives two Tate kernel and endpoint lines and two copies of the original sequence. A finite free ramified coefficient ring also transports the sequence; a nonflat quotient such as ℤ_p/p is outside this tensor-exactness claim.

### 7.3 Circular closures and their actual image

For odd p let `C_{a,1}^+` be the closure inside `U¹(ℚ_p(ζ_{p^a})^+)` of the principal intersection of §1.2's real circular units, and `C∞,1^+=lim_a C_{a,1}^+`. Define `realPrincipalCircularClosure` by these closed subgroups, retaining their local embeddings and norm maps. Its API includes membership of principal global circular units, norm stability, closedness, the inverse-limit inclusion, and `realCircularClosure_generator`. For an integer b generating G topologically, the compatible generator is

```text
q_a(b)=ω(b)⁻¹ ζ_{p^a}^{(1−b)/2} c_a(b).
```

The exponent uses the inverse of 2 in ℤ_p followed by reduction modulo p^a, not an integer half when b is even. The factor ω(b)⁻¹ is local Teichmüller torsion. Prove q_a is real, principal, norm compatible and belongs to the closure: its (p−1)st power is a global principal circular unit, and taking the unique (p−1)st root in principal units preserves that closure. Use §1.4's orbit generation and compactness to prove cyclicity of the limit; compatible finite spans are images of the compact coefficient algebra, not an assumed surjectivity of every norm map. (RJW, Lemmas 12.18 and 12.20–12.22, pp. 185–188, with §1.4's real phase convention.)

Prove `realCircularClosure_colemanImage`: `arithmeticColeman(C∞,1^+)=I(G^+)ζ_p`. The root and Teichmüller corrections are in the kernel, so q(b) maps to `([b]−1)ζ_p`. Density of the integer powers of b and closedness give `I(G^+)=([b]−1)`. Through §7.2's plus equivalence this proves the unconditional topological quotient

```text
U∞,1^+/C∞,1^+ ≃ Λ(G^+)/I(G^+)ζ_p.
```

Its API sends the actual unit class to its Coleman measure class and commutes with finite-free coefficient change. (RJW, Theorem 12.23, pp. 188–189; the sign is the normalized one in §7.2.)

**Checks.**

- Conjugation sends `c_a(b)` to `ζ_{p^a}^{1−b}c_a(b)`, so the displayed phase makes q_a real. At p=3,b=2 the phase exponent is 1 modulo 3; omitting it leaves a nonreal generator.
- Modulo π_a, `c_a(b)≡b` and q_a≡1. The phase alone gives residue b, not generally 1; the Teichmüller correction is necessary.
- At a fixed level the corrected generator can be local rather than global; its (p−1)st power is global. Identifying the discrete global subgroup with its closure fails this test.
- The full principal quotient has a further ℤ_p(1) cokernel in its Coleman comparison. Only the real plus quotient has the displayed isomorphism, and no Vandiver assumption enters it.

### 7.4 The condition and its propagation

For an odd prime p define `VandiverCondition p` by `p∤h(ℚ(μ_p)^+)`. Its API identifies this with vanishing of the base real p-class group and, by §3.1, with vanishing at every higher real cyclotomic layer and with `X_unram,∞^+=0`. Identify finite real class groups with the plus part of full class groups using the exact idempotent at odd p. Regularity implies this condition, but the converse is not claimed. (RJW, Definition 13.10, Corollary 13.16, and Remark 13.17, pp. 192–195; Sharifi, Proposition 3.4.1, pp. 89–90.)

**Checks.**

- At p=3 the real base field is ℚ, whose class number is 1. The condition and every higher real p-class vanishing conclusion hold.
- At p=37 the prime is irregular because of `B₃₂`, while Vandiver holds. This separates the condition from regularity; numerical verification is an explicit input for this example.
- A failure of the base real class-group condition prevents the compact Nakayama argument from concluding zero. The theorem is conditional, not a proof of Vandiver for every prime.
- The definition excludes p=2. There is no use of an integral plus idempotent with denominator 2 in its propagation.

### 7.5 Principal closures and the unconditional unit quotient

Inside the principal local units of `F(a)^+`, use the closure of the global units whose local image is principal, and §7.3's real principal circular closure. Prove `principalClosure_completionComparison`: raising a global unit to the residue-group order and then completing identifies this closure with the image of the completed units in §2.2. The residue-group order is prime to p, so this operation does not change the p-completion. Prove compatibility of the circular closure with §7.3's Coleman generator. (RJW, Proposition 13.13 and its proof, p. 193.)

For the arithmetic map on these closures, derive the four-term sequence from the rational odd-prime specialization of §2.7, under the dictionary of §3.5. Its maps agree with local reciprocity. Under Vandiver, the index formula of §1.5 makes the global and circular closures equal at every level, hence at the inverse limit. This equality concerns closed submodules of the same local unit group, not an identification of discrete global units with a local group. (RJW, proof of Theorem 13.11, pp. 193–194.)

**Checks.**

- Raising to the residue order p−1 is invertible on p-completions; raising to p is not. This pins the closure-comparison map.
- In the first real layer at p=3, global units are {±1} and their principal closure is trivial, agreeing with the circular closure.
- The closure contains the principal circular subgroup before Vandiver is assumed; equality uses the prime-to-p index, not density alone.

### 7.6 The Mellin variable and the trivial branch

Let `G^+=Gal(ℚ(μ_{p∞})^+/ℚ)` and let `Z_χ(T)` be the χ-component of §7.3's normalized zeta pseudomeasure, with `Z_χ(u^a−1)=L_p(χ,1−a)`. Prove `colemanZeta_normalization` using §6.3's involutive substitution `a(T)=u(1+T)⁻¹−1`. For nontrivial even tame χ, `Z_χ(T)=f_χ(a(T))`. For χ=1, with `f₁(S)=(1−u/(1+S))F₁(S)`,

```text
f₁(a(T)) = −T Z₁(T).
```

Therefore the image ideal is `I(G^+)ζ_p`, an integral ideal, with the augmentation factor on the trivial component. The unit quotient `U_∞^+/C_∞^+≃Λ(G^+)/Iζ_p` is unconditional. Its further identification with the p-ramified arithmetic module needs Vandiver. (RJW, Definition 5.18 and Remark 5.21, pp. 147–148; Theorem 12.23, pp. 188–189; Theorem 13.11, pp. 192–195.) The named native-field identity `coleman_trivial_numerator_identity` records the scalar cancellation; its hypotheses make both denominators nonzero.

**Checks.**

- `a(a(T))=T`; `a(0)=u−1` locates the s=1 pole at augmentation.
- On the trivial branch the cleared numerator is −TZ₁, not Z₁; T cannot be cancelled as a unit.
- A nontrivial tame even χ has no augmentation pole. Its quotient is by Z_χ alone, with its unramified character integers retained.

### 7.7 The conditional cyclic arithmetic module

Prove `vandiver_pRamified_cyclic`: under Vandiver, `𝔛_S(F∞)^+≃Λ(G^+)/I(G^+)ζ_p`, naturally as a topological module. The exact sequence loses its two unramified/global-unit error terms by §§7.4–7.5, leaving the unconditional quotient of §7.6. Prove `vandiver_characterComponents`: at a nontrivial even tame χ the quotient is `O_χ[[Γ]]/(Z_χ)`; on the trivial component it is `ℤ_p[[Γ]]/(T Z₁)`. The coefficients O_χ are unramified because these tame characters have order prime to p. The S-ramified form here has its arithmetic action and no extra Tate twist; a dual form transports both the variable and character by `σ↦κ(σ)σ⁻¹`. (RJW, Theorem 13.8, Remark 13.9, and Theorem 13.11, pp. 191–194.)

### 7.8 Rational cyclotomic equivalences

Prove `rationalCyclotomic_mainConjectureEquivalences`: over ℚ at odd p, for even k with `k≢0 mod p−1`, the strong form of §6.5 on the ω^k branch is equivalent to `char(X_unram^{ω^{1−k}})=(f_k)` and to `char((E∞/C∞)^{ω^k})=char(X_unram^{ω^k})`, where E∞ is the global unit limit and C∞ its circular-unit submodule. On this nontrivial tame branch, replacing global units by global p-units or local principal units by completed local multiplicative groups gives the same component: the valuation directions are tame-trivial. The trivial branch instead retains the augmentation-cleared numerator of §§7.6–7.7; the source’s convention f_0=1 for its unramified ω-component is not a replacement for that ramified numerator. Use the global-local sequence, §§7.2–7.3's unconditional Coleman quotient and the Mellin comparison in §7.6; no main conjecture enters their construction. Equality of distinguished factors implies equality of full ideals here only after both arithmetic and analytic μ=0 from Layer 5. (Sharifi AWS notes, Theorems 2.5.1, 2.5.4 and 2.5.6–2.5.7, pp. 23–25.)

### Examples

In the trivial tame branch, the Coleman image is generated by `TZ₁`, equivalently by `−f₁(a(T))`. The sign is a unit, while T is not; omitting the latter changes the quotient. At p=37, Vandiver can hold at the same time as a nontrivial odd class component, so the conditional cyclic description is not a regular-prime statement.

### Dependencies

Layers 0–6; LocalFieldsRamification Layers 0–3 and LocalGaloisGroups Layer 0 for the native local tower; ProfiniteArithmetic §1.3 for principal p-adic powers; PadicMeasuresIwasawaAlgebras §§1–5 for integral operators, Weierstrass and compactness; and §2.7's rational odd-prime class/unit sequence. The Coleman map and its image are constructed in §§7.1–7.3 before their arithmetic use. Ferrero–Washington is not needed for Vandiver's propagation itself.

## Layer 8: finite CM modules and integral presentations

### 8.1 Minus quotients and two different duals

For a finite abelian CM extension `H/F`, write `G=Gal(H/F)` and c for complex conjugation. Use the supplied integral order `ℤ[G]^−=ℤ[G]/(1+c)` and define the arithmetic minus quotient by scalar extension. The light `integralMinusRelations c=range(1+c)` records the defining relation over an existing module; its arithmetic use assumes `c²=1`. Prove `minusQuotient_universal`, the odd-primary eigenspace comparison, and the dyadic norm-kernel comparison with its killed-by-two errors. (Dasgupta–Kakde, §1.1, p. 6; Dasgupta–Kakde–Silliman–Wang, §1.2, p. 5.)

Use the supplied inverse action on dual functionals. Use the finite dual `M^∨=Hom_ℤ(M,ℚ/ℤ)` with action `(σφ)(m)=φ(σ⁻¹m)`. For finite M prove `annihilator_finiteDual=Ann(M)^#`; the Fitting identity `Fitt(M^∨)=Fitt(M)^#` is used only when the relevant p-Sylow is cyclic or when supplied by a specific quadratic transpose. In general retain just the separate Fitting-to-annihilator inclusions. For a torsion-free lattice use instead the integral dual and prove the exact action comparison

```text
Hom_ℤ(M,ℤ) ≃ Hom_{ℤ[G]}(M,ℤ[G])^#,
φ ↦ [m ↦ Σ_g φ(gm)g⁻¹].
```

The superscript means restriction of the output-scalar action along sharp; it is not Pontryagin duality. This arithmetic comparison specializes the generic lattice transpose contract. (Dasgupta–Kakde, Appendix A, Lemma A.8, pp. 86–87, and Lemma B.4, p. 93; Kurihara, Corollary 2.9, p. 11.)

**Checks.**

- With c=−1, `range(1+c)=0` and the minus quotient is the entire module. With c=1 on `ℤ/6`, that quotient is `ℤ/2`; inverting 2 kills it.
- For the identity, the dual functional evaluates to its original value. On `C₃=ℤ/3` with translation and the coordinate functional, the inverse action of 1 evaluated at 0 gives 2, whereas the forward action gives 1. This fixes sharp independently of the involution c, which has order two.
- For `M=ℤ/p`, `Hom_ℤ(M,ℤ)=0` but `Hom_ℤ(M,ℚ/ℤ)` has order p. Using the lattice dual in a finite class-group formula fails this test.
- The zero module has unit Fitting ideal and unit annihilator. The image of its minus relation is zero, so all comparison maps retain this boundary case.

### 8.2 Smoothed ray groups and the Sinnott–Kurihara ideal

Write `smoothedRayClassGroup H T` for the supplied ray class group at the finite modulus given by the product of the primes above T. For disjoint S,T, define `smoothedRayClassGroupSplit H S T` by quotienting by the classes of primes above the finite part of S. Its new API is the S-depleted G-action and its compatibility with norm, extension, and change of sets. Derive `sRayUnitExactSequence` by combining the supplied ordinary ray-unit sequence with S-unit localization:

```text
1 → O^×_{H,S,T} → O^×_{H,S} → ∏_{w|T}(O_H/w)^×
  → Cl^T_S(H) → Cl_S(H) → 0.
```

For one added prime, retain the image of the unit map in the local residue term before taking the quotient. Dualize this exact finite sequence to obtain the T-modification used later. (Dasgupta–Kakde, §3.3, equation (37), p. 23; Kurihara, §2.5, p. 11.)

Define `sinnottKuriharaIdeal H T` a priori as the fractional ideal

```text
(Θ^#_{S∞,T}) ∏_{v ramified} (N I_v, 1−Frob_v e_v),
e_v=(#I_v)⁻¹ N I_v.
```

Prove its integral generator expansion by subsets of ramified primes, using the maximal subextensions unramified at the complementary set, and deduce `sinnottKuriharaIdeal_integral`. For odd p define its p-modification by moving the ramified p-primes into the depletion set and keeping the displayed factors only away from p. Prove `smoothedTheta_mem_SKp`: the Θ for `Σ=S_∞∪{ramified v|p}`, `Σ′=T∪{ramified v∤p}` belongs to this ideal. The calculation uses `#I_v∣Nv−1` p-adically away from p and

```text
1−Frob_v e_v Nv
 = (1−Frob_v e_v) + Frob_v N I_v (1−Nv)/#I_v.
```

The individual rational factors need not be integral, even though the resulting ideal is. (Dasgupta–Kakde, Lemma 3.4, equations (33)–(34), p. 21, and Remark 3.6, p. 22; Kurihara, §2.3, p. 7.)

The APIs include change of T, restriction and norm compatibility, Galois stability, the explicit generating family, and the prime-to-p inertia simplification.

**Checks.**

- T empty recovers the S-class group; with S also empty it is the ordinary class group.
- Adding a split prime supplies a residue-unit quotient by the image of global units, rather than a zero ray group. The worked `ℚ(μ₃)`, T={7} computation below gives a nonzero C₆.
- In `smoothedRayClassGroupSplit`, adding a place whose ray class is already zero leaves the quotient unchanged, whereas quotienting by a place with nonzero ray class kills that class. Ordinary principality without the T-congruence condition is insufficient. This distinguishes the S modification from the T residue congruence.
- Trivial inertia gives `(N I_v,1−Frob_v e_v)=(1,1−Frob_v)=R`; an unramified factor must not change the ideal.
- For nontrivial p-inertia, `e_v` is not an integral projector. The integral generator expansion must clear its denominators; declaring each rational factor integral fails this case.
- The zero module has Fitting ideal R. Substituting the zero fractional ideal would falsely create a trivial zero.

### 8.3 The finite arithmetic Selmer module

For disjoint finite Σ,Σ′ with `Σ⊇S_∞`, define `H^×_{Σ′}` by congruence 1 at the Σ′-places and define `arithmeticSelmerModule` as

```text
Hom_ℤ(H^×_{Σ′},ℤ) /
 image( ∏_{w∉Σ_H∪Σ′_H} ℤ → Hom_ℤ(H^×_{Σ′},ℤ) ).
```

The map sends `(a_w)` to `x↦Σ_w a_w ord_w(x)`. Its domain is the **product**, since each individual x has only finitely many nonzero valuations; replacing it by the direct sum changes the quotient. Give the contragredient G-action and prove `selmer_valuationRelation`, `selmer_enlargeDepletion`, and the auxiliary finite S′ presentation when `Cl^{Σ′}_{S′}(H)=0`. Prove

```text
0 → Cl^{Σ′}(H)^∨ → Sel^{Σ′}_{S∞}(H)
  → Hom_ℤ(O^×_{H,S∞,Σ′},ℤ) → 0.
```

Enlarging the depletion set gives the additional place-permutation module. After inverting 2, or over `ℤ_p` at odd p, its minus part gives the usual exact class-dual/place sequence. Do not take an exact dyadic minus quotient of this sequence without its derived error. (Dasgupta–Kakde, §3.1, definition (29), Lemma 3.1, equations (30)–(31), pp. 19–20; Kurihara, Proposition 2.11, pp. 12–14.)

Its API includes norm/corestriction for field extensions, the finite auxiliary presentation and its independence, and the trivial-zero criterion: on a nontrivial character trivial on a decomposition group in Σ, the Selmer quotient has positive coefficient-field rank and Fitting ideal zero. *Needs:* §8.1, ray reciprocity, lattice duality, and the supplied permutation-module algebra.

**Checks.**

- A principal element x has only finitely many valuations, so a product-valued family defines a finite sum on x. The same functional need not be supported on finitely many primes as x varies.
- With `Σ=S_∞` at odd p, the minus unit-dual term vanishes and the module is the ray class dual. At 2 this conclusion does not follow by exactness of a minus idempotent.
- Adding a completely split finite place creates a trivial zero on the corresponding character component; its Fitting ideal is zero rather than the unit ideal.
- For an auxiliary S′ already killing the ray class group, the finite valuation presentation agrees with the infinite-product quotient. An arbitrary S′ without that hypothesis need not give it.

### 8.4 Ritter–Weiss modules and the projective comparison

For disjoint finite S,T with `S⊇S_∞`, construct `ritterWeissModule H S T` from the local Weil extensions, their modules `V_w,W_w`, the semilocal extension `J⊂V↠W`, the global Tate extension, and the map θ of these extensions. Define `∇^T_S(H)=coker(V^θ→B^θ)`. Choose auxiliary S′ large enough to kill the ray class obstruction and prove canonical independence of S′. Under `S∪T⊇S_∞∪S_ram`, prove its divisor/class sequence `0→Cl^T_S(H)→∇→X_{H,S}→0`. Here X is the degree-zero place-divisor module, not an Iwasawa class module. (Dasgupta–Kakde, Appendix A, equations (133)–(150), Definition A.2, Lemmas A.1, A.3–A.5, pp. 78–86.)

Under tame ramification in T and torsion-free `O^×_{H,S,T}`, prove `ritterWeiss_projectivePresentation` from `0→O^×→V^θ→B^θ→∇→0`, with V and B projective under the source's integral lattice hypotheses. With the p-local tame hypothesis the same assertion holds after p-localization. The required square presentation means a map between projectives of equal componentwise rank whose cokernel is ∇; injectivity is a separate assertion. Prove the finite-free version over the semilocal p-order, keeping the actual ranks on each component. At 2 the generalized minus presentation uses V′ and has kernel the **anti-invariant subgroup** of the smoothed S-units; that subgroup is not their integral minus quotient. It can have positive rank when S has split finite places. (Dasgupta–Kakde, properties (P1)–(P4), pp. 39–40, and Appendix A; Dasgupta–Kakde–Silliman–Wang, Theorem 2.2 and equation (7), pp. 7–8, Proposition 4.13, pp. 40–42.)

For general disjoint S,T with `S∪T⊇S_∞`, define `generalizedRitterWeissModule` by the modified archimedean construction. When S need not contain all infinite places, the projective source is the module V′ of the generalized construction. Prove its comparison to the ordinary construction under their common hypotheses; do not simply rename V′ as `V^θ`. (Dasgupta–Kakde–Silliman–Wang, Theorems 2.1–2.2, pp. 6–8.) The APIs include auxiliary-set independence, scalar change, change of S and T, the divisor map, and local generator maps.

**Checks.**

- A square matrix need not be injective: the one-by-one zero matrix presents a free rank-one module with Fitting ideal zero. A finite trivial-zero component is permitted to have exactly this behavior.
- When S contains an infinite place whose decomposition group contains c, the specified minus divisor/class sequence has the source's exactness property. Without that hypothesis at 2, it is not inferred by applying a projector.
- Moving an infinite place from S to T changes the generalized archimedean source and introduces the later factor 2. It cannot be treated as a change of notation in the old presentation.
- Enlarging S′ twice gives the same module through a commuting canonical comparison; this distinguishes auxiliary choices from the mathematical S,T data.

### 8.5 Transpose and cohomological universal maps

Prove `ritterWeiss_selmerTranspose` for the actual lattice pairing of §8.1: the transpose of the Ritter–Weiss presentation is the finite Selmer presentation. On each character group ring R this gives a principal Fitting ideal and `Fitt_R(Sel_R)=Fitt_{R^#}(∇_{R^#})^#`. For a presentation `R^r→R^{r+s}→M→0` with s excess generators, retain the higher-index formula `Fitt⁰(M^{tr})=(Fitt^s(M))^#`; do not silently drop s. For `S⊇S_ram` and torsion-free smoothed units, prove the all-prime minus version using the integral generalized presentation, not an odd-prime exact-sequence argument. (Dasgupta–Kakde, Lemma 6.1 and Corollary 6.2, p. 40, Lemma A.8, pp. 86–87; Kurihara, §2.6, pp. 13–14.)

Prove `ritterWeiss_extensionClass`: after inverting 2, the divisor/class extension corresponds under Ext and Shapiro to the local restrictions of the global Artin class. Prove its integral all-prime universal-map form. Given finite N, a continuous cocycle κ unramified outside `S∪T` and tame at finite T, choose `v₀∈S` with `κ(G_{F_v₀})=0`, and `x_v∈N` for other v∈S with `κ(σ)=(σ−1)x_v` locally. Under the generalized Ritter–Weiss hypotheses construct `ritterWeiss_mapOfCocycle:∇→N`; its image is generated by **both** the cocycle values and the x_v. If these jointly generate N the map is surjective. The finite p-group version uses the p-local tame condition. (Dasgupta–Kakde, Lemmas 6.3–6.4, pp. 41–42, and Lemma A.9, pp. 87–89; Dasgupta–Kakde–Silliman–Wang, Theorem 2.3, p. 8.) *Needs:* §§8.2–8.4, global reciprocity, and local continuous cohomology.

**Checks.**

- The transpose of a one-by-one relation a has the same determinant, with sharp applied only to its coefficient action. For a group element g, contragredient duality sends g to g⁻¹, not to g.
- If the cocycle and all chosen local x_v are zero, the universal map has zero image. It is surjective only when N=0.
- A zero cocycle can have nonzero allowed local x_v fixed by the relevant local subgroup. The image formula must retain those x_v, even though the cocycle values alone generate zero.
- Over `R=ℤ₂[[T]]`, the relation `R→R²`, `1↦(2,T)`, has cokernel M of rank one, with `Fitt⁰(M)=0` and `Fitt¹(M)=(2,T)`. Its transpose presents `R/(2,T)`, whose zeroth Fitting ideal is `(2,T)`. This computes the excess-generator index s=1 and rules out an unqualified zeroth-Fitting equality.

### 8.6 Cardinality does not erase dyadic norm errors

Prove `minusRayClassNumber_product`: the smoothed relative class-number expression is the product of the odd-character L-values at zero, with the exact regulator factor `R^T(H)=2^{[H^+:ℚ]−1}R^T(H^+)`. Away from 2 this computes the cardinality of the minus ray group. At 2 compare the actual norm kernel and cokernel and the wide-class conventions before obtaining an exact cardinality formula for a modified group. (Dasgupta–Kakde, Lemma 2.1, equations (22)–(26), pp. 14–15; Dasgupta–Kakde–Silliman–Wang, Lemma 2.13, pp. 16–17.)

Prove `fittingInclusion_impliesEquality` for the family of odd prime-to-p character components `O[G_p]_χ`, and at 2 for the components of the actual minus order. Assume the arithmetic Fitting inclusion for every required abelian subextension and modification, together with the square presentations. Use norm descent, the finite class-number product, and the quadratic-presentation cardinality theorem to show the inclusions are equalities. In a trivial-zero-free quotient the analytic determinant is regular; components with trivial zeros are treated by quotient/change-of-set exact sequences, not by dividing by zero. At 2 the modified-class norm sequence supplies the extra factors explicitly. This is a family-level argument; a single inclusion in an arbitrary ring does not imply equality. (Dasgupta–Kakde, Theorem 5.1 and Lemmas 5.2–5.7, pp. 31–39; Dasgupta–Kakde–Silliman–Wang, Theorems 2.7, 2.10 and Lemmas 2.11–2.13, pp. 12–17.)

### Examples

For `H=ℚ(μ₃)` and T the rational prime 7, the residue units are `C₆×C₆`; the global sixth roots of unity embed through the two inverse residue characters. Their quotient is C₆, and conjugation acts trivially on that quotient. Its integral minus quotient is C₂, with Fitting ideal `(2)` over the corresponding dyadic coefficient ring. It disappears after inverting 2. This concrete ray group prevents replacing integral minus quotients by odd-primary formulas. The zero one-by-one presentation gives the other necessary finite-level example: quadratic presentation alone says nothing about nonvanishing of its determinant.

### Dependencies

Layers 0, 2, 3, and 6; finite ray reciprocity; the supplied Fitting, transpose, cohomologically trivial lattice, and permutation-module algebra; and global/local Galois cohomology. The finite arithmetic constructions and their generalized real-place comparison are required before any Eisenstein quotient is mapped out of ∇.

## Layer 9: Eisenstein congruences and finite integral Fitting identities

### 9.0 Rational ordinary towers and their specialization maps

For `p≥5`, a tame integer `N≥1` prime to p and the integral coefficient ring O, form the ordinary projectors on the full and cuspidal finite-level modular-form lattices at `Γ₁(Np^r)`, using the limit of powers `U_p^{n!}`. Construct the full ordinary algebra H, its cuspidal quotient h, and the inverse limits of the full/cuspidal form modules and of relative/absolute modular-symbol modules. These are modules built from ModularForms Layers 0–8 and the actual modular curves of ModularCurves; their inverse diamonds and trace maps are part of the construction. Prove `rationalOrdinaryControl`: the ordinary modules are finite over the weight algebra, the ordinary relative/absolute homology limits are finite free, and quotient by the weight-and-level relation `ω_{k,r}` gives the finite-level ordinary weight-k module for every admissible integral arithmetic weight `k≥2`, with its finite character and parity retained. The API includes all specialization maps, control of full-to-cuspidal and boundary maps, trace/Hecke compatibility and q-expansion compatibility. (Sharifi AWS, Theorems 4.2.5, 4.2.7 and 4.2.13, pp. 46–48.)

Construct the normalized full ordinary Eisenstein family on each even nonexceptional branch, with `a₁=1`, eigenvalues and constant term as in §9.1. Prove that the finite-weight specializations have those exact q-expansions and constant terms, using §5.0's canonical p-adic L-function. This supplies the actual family used by the full-form pairing; it does not identify the Eisenstein localization with a residually irreducible one. For the trace-limit étale realization, construct the Galois action on the same tower cohomology, compare its trace maps with the modular-symbol control maps, and then prove the ordinary filtration and rank assertions of §9.2. (Sharifi AWS, Theorems 4.2.9 and 4.2.13–4.2.15, pp. 46–49.)

**Checks.**

- The weight-two relation at trivial finite character specializes to the ordinary finite-level weight-two module, including its boundary map. Discarding that map before the full/cuspidal comparison changes the full module.
- A unit analytic constant term gives a zero localized cuspidal Eisenstein quotient, while the full Eisenstein line retains first coefficient 1.
- Trace goes from the higher modular-curve level to the lower one and commutes with Hecke operators away from Np. Pullback has the opposite direction and cannot replace the trace in the inverse limit.

*Needs:* ModularForms Layers 0–8; ModularCurves for its compactified modular curves and finite level maps; EtaleCohomologyFoundations §§F.0–F.4 and 0.11 for adic cohomology, traces and curve duality; PadicMeasuresIwasawaAlgebras §§1 and 4 for the weight algebra; §5.0 for the normalized constant term.

### 9.1 The rational ordinary Eisenstein quotient

Over ℚ take `p≥5`, tame level 1, and an even residue class k with `k≠0 mod p−1`. Use inverse diamond operators. Define `ordinaryEisensteinIdeal k` in the cuspidal ordinary algebra h by `U_p−1`, `T_ℓ−1−ℓ⟨ℓ⟩` for `ℓ≠p`, and the torsion-diamond character relations. Localize at this ideal together with the coefficient maximal ideal; the zero localization is allowed. The full ordinary algebra is H, its Eisenstein ideal is J, and `H/J≃Λ`. The API includes the full-to-cuspidal quotient, the diamond specialization, `eisensteinHom_T_ell`, and compatibility of finite-level ordinary projectors with the limit. (Sharifi AWS, Definitions 4.2.1–4.2.6, Remark 4.3.2, pp. 45–46, 50.)

Prove the required extension `ordinaryFullForms_a1Duality`: the full ordinary form lattice M and H are Λ-dual through `(T,f)↦a₁(Tf)`, including this Eisenstein localization; the constant-term map `c:M→Λ`, with the stated involution on coefficients, is surjective with kernel the cusp lattice S. The normalized Eisenstein family E has `a₁(E)=1` and `c(E)=ξ_k/2`, where

```text
ξ_k(v^s−1)=L_p(ω^k,s−1).
```

The lattice equality `M∩Q(Λ)E=ΛE` follows from its first coefficient. The functional c corresponds to `T₀∈H`, and `H/(T₀)≃h`. Its image in `H/J` is `ξ_k/2`. Therefore prove `ordinaryEisenstein_quotient:h/I≃Λ/(ξ_k)` and `ordinaryEisenstein_nonzero_iff` the relevant generalized Bernoulli value is divisible by p. Define the congruence module for this specific rationally split sequence as `s(Λ)/(s(Λ)∩M)`; prove it is `Λ/(ξ_k)`. Its API compares this quotient with the constant-term lattice, and proves independence of the rational splitting with the specified Eisenstein line. This calculation requires full-form duality; residually irreducible modular-symbol freeness does not supply it. (Sharifi AWS, Theorems 4.2.5, 4.2.7, 4.2.9, Corollary 4.2.12, pp. 46–47, and Theorem 4.3.3, pp. 50–52.) *Needs:* rational ordinary control, the full Eisenstein series, and the finite Hecke pairing.

**Checks.**

- In the full algebra the quotient is Λ. In the cuspidal algebra it is `Λ/(ξ_k)`. This distinguishes the two Eisenstein ideals.
- If ξ is a unit, the localized cuspidal factor is zero. No nonzero Galois representation is attached to that factor.
- The first coefficient of `aE`, for `a∈Q(Λ)`, is a. Integrality of the form therefore forces `a∈Λ`; the constant term alone would not prove saturation.
- A scalar multiple of E with first coefficient p would not justify that saturation argument. The normalization `a₁=1` is part of the contract.
- At `p=691,k=12`, the classical Eisenstein congruence gives a nonzero specialization of the congruence quotient. The test uses the normalized eigenvalue `1+ℓ¹¹`.

### 9.2 The ordinary representation and the arithmetic action

Prove `ordinaryTateModule_traceLimit` for the ordinary trace limit of rational modular-curve étale cohomology: it is Λ-finite free, and over the total fractions of a nonzero Eisenstein factor its representation has dimension two, with the connected–étale ordinary filtration and unramified quotient of Frobenius `U_p`. The filtration splits as modules after total fractions. A Galois-equivariant local splitting is not asserted. Nor is integral rank-two freeness over h or a Gorenstein property at its Eisenstein ideal. (Sharifi AWS, Theorems 4.2.13–4.2.15 and their following construction, pp. 47–49.)

For nonunit ξ choose the ordinary basis and write ρ with entries a,b,c,d. Prove `ordinaryEisenstein_matrixCongruence`: `a−detρ`, `d−1` and all products `b(σ)c(τ)` belong to I. The h-spans B,C of the off-diagonal entries are finite faithful modules. Define `eisensteinCohomologyClass σ=(detρ(σ))⁻¹c(σ) mod IC`; its API includes the cocycle equation, continuous dependence, basis-change compatibility up to the induced module isomorphism, and vanishing on inertia in the full cyclotomic field. Its restriction is everywhere unramified and gives

```text
X_∞^{ω^{1−k}}(1) ↠ C/IC.
```

Prove `eisensteinClass_actionComparison`: the Λ-action on the target is by inverse diamonds, its source is the **unramified** class module, and its variable satisfies `f_k(v^s−1)=ξ_k(v^{s+1}−1)`. Chebotarev identifies the entry congruences and faithfulness from the actual Hecke eigenvalues. (Sharifi AWS, Lemma 4.3.4 and the proof following it, pp. 51–52.) *Needs:* §9.1, class-field identification, arithmetic completed actions, and the distinct-character matrix-algebra supplier.

**Checks.**

- The cocycle uses the lower-left entry divided by the determinant. Its conjugation action has character `ω^{1−k}` and the displayed Tate twist; using the upper-right entry would reverse the orientation.
- At p, upper-triangular ordinary matrices have c=0, proving unramifiedness of this class. A representation known to be ordinary without an identified ordinary quotient would not establish this step.
- If ξ is a unit, the divisibility below is automatic and the construction is omitted. This preserves the zero Hecke-factor case.
- The exceptional branch k=0 has a pole and is handled by the cleared numerator in Layer 6. It does not satisfy the hypotheses of §9.1.

Faithfulness gives `Fitt_h(C)=0`; arbitrary-ring Fitting base change gives `Fitt_{h/I}(C/IC)=0`. Consequently `Fitt_Λ(C/IC)⊂(ξ_k)`. Localizing the surjection at each height-one prime of the regular ring Λ yields `f_k∣char(X_∞^{ω^{1−k}})`. Prove `rationalDivisibility_impliesEquality` simultaneously over all nonexceptional even branches: Layer 5 gives both μ's zero, and the analytic relative class-number formula with Layer 3 equates the sums of the λ-invariants. Every divisibility contributes a nonnegative degree difference; their sum zero makes them all zero. The pole-cancelled exceptional factor is a unit. This proves `mazurWiles_eisenstein` over ℚ for odd p; p=3 has no nonexceptional even branches, so its exceptional case is separate. (Sharifi AWS, Theorem 2.5.1, Remark 2.5.2, pp. 22–23, and §4.3, p. 52.) The main conjecture over ℚ has a single mathematical statement; this and the Euler-system argument are alternative proofs of it.

### 9.3 Finite-weight Hilbert forms in the required generality

For a totally real F of arbitrary positive degree and a finite abelian CM extension H/F, construct `groupRingHilbertCuspSpace` at the finite parallel weights and levels below, over the actual character order R, with its oldforms, integral q-expansion lattice, Hecke algebra T, and enlarged algebra T̃. Its API includes the canonical character `ψ:G_F→Rˣ`, normalized q-coefficients at ideals, degeneracy maps at each added prime, diamond actions, and scalar change preserving the chosen lattice. The definition includes cuspidality at every cusp, rather than just a zero constant coefficient at one cusp. Prove `finiteWeightHilbert_eisensteinCongruence` in the following precise forms. This extension is needed beyond ordinary families of even-degree totally real fields and beyond residually irreducible localizations. (Dasgupta–Kakde, Theorems 8.8, 8.9, 8.15, 8.17–8.18, pp. 54, 58–60; Dasgupta–Kakde–Silliman–Wang, §3.1, Lemma 3.1 and Theorems 3.2–3.3, pp. 21–24.)

At odd p, let Σ contain the infinite places and the ramified places above p, and let `Σ′=T∪{ramified v∤p}`. Pass to the quotient character order R with no trivial zero at Σ. Put `𝔫=cond(H/F)∏_{v∈T}v`, write `P=gcd(p^∞,𝔫)` for its full p-part, and put `Θ=Θ_{Σ,Σ′}`. At sufficiently large weights `k≡1 mod (p−1)p^N`, the quotient of the weight-k and weight-one depleted L-values gives a regular element x. On a character, its reduction is the product of the local factors `1−χ(𝔭)⁻¹` at the unramified primes above p. Prove the three cusp congruences with the source's level and depleted characters:

```text
P=1, some χ(𝔭)=1:  F_k ≡ x W₁(ψ,1)−W_k(ψ,1_𝔭)  mod xΘ^#;
P=1, every χ(𝔭)≠1: F_k ≡ W₁(ψ_𝔭,1)             mod Θ^#;
P≠1:                 F_k ≡ W₁(ψ_{PP″},1)          mod Θ^#.
```

Here each W is the integral stabilized Eisenstein family with the exact Euler factors for the indicated imprimitive character; `P′` is the product of primes above p not dividing P, and `P″` is the product of those primes of P′ with χ(𝔭)≠1, for the fixed prime-to-p character component χ. Define these ideals before forming the oldform maps. The x in the first line is retained throughout the Hecke calculation; the other cases use the source's corresponding regular x. The proof subtracts constant terms using the Deligne–Ribet integrality theorem and ordinary stabilization, then checks all cusp expansions. (Dasgupta–Kakde, equations (75), (79), (83), (87), (89), (92), Theorems 8.8–8.23, pp. 54–65.)

At 2, put `d=[F:ℚ]`. If no prime above 2 ramifies, choose an auxiliary finite `ℓ∤2` with Frobenius c and take `Σ={ℓ}`. Otherwise take Σ to be the ramified primes above 2. In both cases `Σ′=T∪{ramified v∤2}∪S_∞`; thus `t=#(Σ′∩S_∞)=d`. For the resulting trivial-zero-free order R put `A=Θ^#/2^d`. Choose m with A dividing `2^m` in R, and a sufficiently large odd weight k with `ε_cyc^{k−1}≡1 mod 2^m`. Prove the corresponding integral cusp congruences modulo xA, retaining the regular x and the stabilized local factors. The levels are `𝔫ℓP′` in the auxiliary-prime case and `𝔫P′` in the ramified case. Their improved divisibility uses the dyadic Deligne–Ribet congruence, not division of an arbitrary integral form by `2^d`. (Dasgupta–Kakde–Silliman–Wang, §§3.1–3.2, Theorems 3.2–3.5, Lemma 3.4 and Corollaries 3.6, 3.8, pp. 21–26.)

**Checks.**

- F=ℚ is allowed, as is an odd-degree F. A supplier restricted to even degree would fail this specialization before any congruence is used.
- If a character has `χ(G_v)=1` for some v∈Σ, its Θ-component is zero and it is excluded from the trivial-zero-free cancellation order. It is restored through the change-of-set argument in §8.6.
- The dyadic unramified case has Σ nonempty because of ℓ. Its Frobenius c makes every odd character nontrivial there; choosing an arbitrary auxiliary split prime would destroy this property.
- A vanishing constant term at the standard cusp is insufficient for membership in the cusp space. The q-expansion API tests all cusps.

### 9.4 The Hecke homomorphism and the regular-factor test

Prove `groupRingEisenstein_hom`: the preceding cusp congruences give a homomorphism `φ:T̃→W` to a finite algebra containing `R/(xA)` injectively, and the image of the small algebra gives `T/I≃R/(xA)`, where `I=kerφ∩T`. Here A is Θ-sharp at odd p and the divided Θ-sharp above at 2, with the corresponding case choices. Away from the level the image is `T_𝔩↦ε_cyc^{k−1}(𝔩)+ψ(𝔩)`; the image of every added U-operator is specified by its chosen stabilization. For the product U of the exceptional local factors prove

```text
φ(Uy)=0, y∈R   ⇒   y∈(A).
```

This is the extra cancellation property, stronger than merely having a cyclic Eisenstein quotient. It is proved in the explicit stabilized q-expansion construction. (Dasgupta–Kakde, Theorem 8.23, pp. 64–65; Dasgupta–Kakde–Silliman–Wang, §3.2, Corollaries 3.6, 3.8 and Theorem 3.9, pp. 25–27.) The API includes quotient kernel, scalar compatibility, all U-eigenvalues, and the annihilator test just displayed.

**Checks.**

- For regular x, `xJ⊂(xA)` implies `J⊂(A)`; the named milestone `cancel_regular_principal_bound` states this cancellation over any commutative ring with regular x, extending Mathlib's domain-only `Ideal.span_singleton_mul_left_mono`. If x is a zero divisor it fails, for example with x=0, A=0 and J the unit ideal.
- `T/I≃R/(xA)` alone only bounds the congruence by xA. Removing x requires the local U-test; a cyclic quotient by itself is insufficient.
- If A is a unit, the target Fitting inclusion is automatic. The interesting construction is made on the proper-ideal components, with the other factors restored by products.
- The map is a ring homomorphism on T̃, not just a characterwise assignment of eigenvalues in the normalization of R. Its injective coefficient subring is what allows the integral cancellation.

### 9.5 Finite-weight Galois representations, including oldforms

Prove `finiteWeightHilbert_galoisOldform`: for every characteristic-zero cuspidal eigensystem used in §9.3, construct its two-dimensional continuous representation with the Hecke characteristic polynomial and the required ordinary local filtration. Extend this to the product of oldform coefficient algebras `K_f`, which can be nonreduced principal Artinian algebras, and hence to `ρ:G_F→GL₂(Frac(T̃))`. Require absolute irreducibility after every projection to a residue field of this total ring. The characteristic polynomials lie in `T[X]` and reduce modulo I to `(X−χ(σ))(X−ψ(σ))`, with `χ=ε_cyc^{k−1}`. This finite-weight statement does not assume residual irreducibility of the Eisenstein ideal. It is the extension of the classical cohomological representation and local ordinary theorem required here. (Dasgupta–Kakde, §9.1, Theorems 9.1–9.4, pp. 65–68; Dasgupta–Kakde–Silliman–Wang, §3.3, pp. 28–30.)

For `S_loc=Σ∪P_loc`, where `P_loc` consists of the primes above p outside Σ, choose lower-triangular local bases with diagonal characters η_v,ξ_v. Prove `ξ_v≡ψ mod Ĩ` for v∈Σ and `ξ_v≡χ mod Ĩ` on inertia for v∈P_loc. The product

```text
P_ρ = ∏_{v∈P_loc}(ξ_v(σ_v)−χ(σ_v))
```

matches the exceptional Hecke operator U up to explicitly invertible factors. Its API includes Frobenius compatibility at unramified primes, the local ordinary quotient, congruence of determinants, and change of oldform basis. The repeated-root oldform algebra is kept until this comparison; passing to its reduced quotient beforehand can lose the relevant U-operator relation. *Needs:* finite-weight Hilbert forms, the Hilbert-form realization and local compatibility constructed in this subsection, EtaleCohomologyFoundations §§F.0–F.4 for its cohomological carriers, and §9.4.

### 9.6 The weighted Ribet module and the surjection from ∇

Use the weighted local Ribet theorem in both its coincident and distinct residual-character forms. Let `T⊂T̃` be a noetherian inclusion with T local, both complete and separated for its maximal-ideal topology, and let `Ĩ⊂T̃` be proper and nonzero, `I=Ĩ∩T`. Assume `K=Frac(T̃)` is a finite product of local Artinian principal ideal rings. Give K a Hausdorff ring topology inducing the maximal-ideal topology on T, take a compact group and continuous ρ,χ,ψ, and retain §9.5's irreducibility on every reduced field factor and all the displayed characteristic-polynomial and local triangular congruences. Supply a finite T-submodule of `M₂(K)` containing both difference modules `Δχ,Δψ`, whose induced topology is its adic module topology. Package these data as `finiteRibetLocalInput`, with projections for the representation, characters, local bases, and containing lattice; morphisms preserve all these data. Under these hypotheses, obtain a finite T-module N₀ and a continuous cocycle with coefficients `N₀(χψ⁻¹)`. Its values together with local elements `y_v`, `v∈Σ∖{v₀}`, generate N₀. At the chosen `v₀∈Σ` it vanishes; at other v∈Σ it is the coboundary `(χψ⁻¹−1)y_v`; it vanishes on inertia at P_loc and is unramified wherever ρ is. Crucially,

```text
P_ρ Fitt_T(N₀) ⊂ Ĩ.
```

The coincident-character contract and its finite-lattice requirement are supplied by IntegralHeckeAndGaloisDeterminants Layer 6, `IntegralRibet.local_ribet`, as specified in the supplier boundary above. Prove `weightedRibet_distinctLocal` with exactly these hypotheses and local, topological and weighted outputs when the residual characters are distinct: diagonalize a distinguishing element, retain the local ordinary basis comparisons and their denominator factors, and run the same determinant-relations calculation. A distinct-character theorem giving only a global cocycle is not this contract. (Dasgupta–Kakde–Silliman–Wang, Theorem 2.15, pp. 18–19; Dasgupta–Kakde–Silliman–Wang, *The residually indistinguishable case of Ribet's method for GL₂*, Theorem 2.1, Remark 2.2 and §3, pp. 5–13.)

Prove `eisensteinFractionLattice_bound` for the arithmetic coefficient orders of §§9.4–9.5: they are finite over `ℤ_p`, their fraction-ring coordinate lattices bound the compact image and both difference modules, and the finite order action preserves a finite containing lattice `eisensteinFractionLattice` with the induced adic topology. Its API records containment of both difference modules, stability under T, and comparison of the induced and module-adic topologies. This verifies the supplier's lattice input before using either local theorem.

Choose m as above and define `finiteRibetQuotient=N₀/(IN₀+p^mN₀)`. Since `χ≡1 mod p^m`, the cocycle now has action ψ⁻¹. Its API includes projection of cocycles and local y's, finiteness, the inherited joint generators, and the action comparison. The universal map of §8.5 therefore gives `∇^{Σ′}_Σ(H)_R↠finiteRibetQuotient(ψ⁻¹)`. It is surjective because the images of the cocycle **and** the local y's generate. The weighted Fitting inclusion and the Hecke cancellation test give `Fitt_R(finiteRibetQuotient)⊂(A)`. Undo ψ⁻¹/sharp to obtain the desired bound on ∇. Here the choice `A∣p^m` removes the final coefficient error; its residue cannot be discarded without that divisibility. (Dasgupta–Kakde, Theorems 9.8, 9.10 and Corollary 9.11, pp. 72–77; Dasgupta–Kakde–Silliman–Wang, Theorems 2.14–2.16, pp. 17–20.)

**Checks.**

- An empty P_loc gives `P_ρ=1`; it does not give a zero bound. A nonempty P_loc can produce a nonunit factor which must be cancelled through §9.4.
- At 2 both residual characters can coincide. Diagonalizing complex conjugation by dividing by 2 is unavailable and is not part of the weighted theorem.
- If the cocycle values span a proper submodule but the local y's complete a generating family, the universal map is still surjective. A test looking only at cocycle values would wrongly reject this case.
- With `p^m∈(A)`, reducing a bound modulo `p^m` preserves the desired inclusion. Without that hypothesis, a congruence modulo `p^m` need not imply an integral inclusion in `(A)`.
- For `N₀=ℤ_p`, I=0 and m=1, the finite quotient is `ℤ/p`; for m=0 it is zero; for `N₀=0` it is zero for every m. These computations test both summands in its defining relation submodule.
- A surviving local generator y remains a generator in the quotient even when every cocycle value is zero. Projecting only the cocycle-generated submodule changes the universal-map output.
- In `K=ℚ_p`, a compact set lies in `p^(−a)ℤ_p` for some a, whereas `{p^(−n):n≥0}` has no such containing finite `ℤ_p`-lattice. Taking the whole fraction field as a finite lattice fails this test.
- A compact irreducible matrix image with the displayed local congruences satisfies the input contract when its finite containing lattice is supplied. Removing irreducibility or continuity does not satisfy that contract, even if its characteristic polynomials are integral.

### 9.7 The finite all-prime theorem

Prove `finiteCM_keystoneFitting`. Let F be totally real, H/F abelian CM, and Σ,Σ′ finite disjoint sets satisfying: their union contains infinity and all ramified finite places; the Σ′-smoothed global units have no torsion; Σ is nonempty; Σ contains all ramified places above p; Σ′ contains all ramified places away from p. Put `t=#(S_∞∩Σ′)`. Then ∇ over the actual integral minus p-order is quadratically presented and

```text
Fitt_{ℤ_p[G]⁻}(∇^{Σ′}_Σ(H)_{p,−}) = (Θ_{Σ,Σ′}/2^t).
```

The divided element is integral by the refined Deligne–Ribet theorem. Apply §§9.3–9.6 to every required character order and modification to obtain inclusion, then §8.6 to obtain equality. The generalized archimedean presentation supplies the dyadic case. (Dasgupta–Kakde–Silliman–Wang, Theorem 1.2, pp. 4–5, Theorems 2.7 and 2.14–2.16, pp. 12–20.) At odd p with `Σ=S_∞∪{ramified v|p}`, the transposed Selmer statement is `Fitt(Sel^{Σ′}_Σ(H)_p^−)=(Θ^#_{Σ,Σ′})`. (Dasgupta–Kakde, Theorem 3.3, p. 20.)

Prove `finiteModifiedSelmer_fitting`: for **every** p, `S⊇S_∞∪S_ram`, and disjoint T with torsion-free smoothed S-units,

```text
Fitt(∇^T_S(H)_{p,−})=(θ^T_{H/F,S}),
Fitt(Sel^T_S(H)_{p,−})=((θ^T_{H/F,S})^#).
```

Both modules have square finite free presentations over the semilocal minus order. Change-of-set sequences and the Euler factors move ramified primes between depletion and smoothing; the integral transpose gives the second equality. Their functoriality is in the modules and maps. No coherent choice of square matrices over all fields is asserted. At finite levels θ can vanish on a character, so neither injectivity of the square matrix nor torsion on every component follows. (Kurihara, Theorem 2.12 and its discussion, pp. 14–15; Dasgupta–Kakde, Appendix B.1, Lemmas B.1–B.3, pp. 90–92.)

### Examples

In the rational Eisenstein construction `a₁(E)=1` proves the exact integral lattice on the Eisenstein line; this is the rank-one witness for its congruence ideal. In the finite Hilbert construction the additional U-factor is essential even though the coefficient quotient is cyclic. The one-by-one zero presentation from Layer 8 remains a valid finite-level presentation after a split prime is added to S; its Fitting ideal and θ are both zero. These three examples distinguish saturation, cancellation, and regularity, which enter at different stages.

### Dependencies

Layers 0–8; rational ordinary control and normalized Eisenstein series; finite-weight Hilbert q-expansions, classical Galois representations and their ordinary local compatibility; IntegralHeckeAndGaloisDeterminants' weighted coincident-character theorem and the local distinct-character extension above; generic quadratic Fitting and transpose algebra. The all-prime finite theorem is established before the limit theorem and uses no infinite main conjecture as an input.

## Layer 10: derived descent, local factors, and real dyadic errors

### 10.0 Compact coefficients, Shapiro and mapping fibers

For a number field k, finite `S⊇S_p∪S_∞`, an abelian p-adic Lie extension `L_∞/k` unramified outside S with compact group G, and a finite free continuous `ℤ_p[G_{k,S}]`-lattice T, construct `completedArithmeticCoefficients` as `Λ(G)^ι ⊗̂_{ℤ_p} T`. The action of `h∈G_{k,S}` is `h(λ⊗t)=λ h̄⁻¹⊗ht`. Identify its finite coefficient and finite field quotients with the induced coefficient modules, with their actual transition maps. Define `derivedArithmeticTower` as the derived inverse limit of continuous cochains over finite subextensions, along corestriction. Prove `compactArithmeticShapiro`: it is canonically quasi-isomorphic to the cochains with completed coefficients, compatibly with finite scalar change, cofinal towers, coefficient triangles, twists that factor through G, and the restriction/corestriction composition laws. The API includes projection to every finite level, the Milnor exact sequence, derived base change and the Tor spectral sequence. No naive underived inverse-limit exactness or vanishing of a lim¹ term is assumed. (NSW, §5.2 and §11.2; Burns–Kurihara–Sano, §2, pp. 569–574.)

Construct `arithmeticLocalMappingFiber` for a family of specified maps `U_v→RΓ(k_v,T)` as the fiber of `RΓ(G_{k,S},T)⊕⊕_v U_v→⊕_v RΓ(k_v,T)`. Use both ordinary and complete-Tate real-place local terms, linked by §2.0's explicit comparison. Prove functoriality in the maps U_v, change-of-condition exact triangles, duality for orthogonal local maps under the pairings of §2.0, and derived control for induced conditions at finite tower levels. Define the compact-support and T-smoothed instances by their actual restriction and residue maps. For perfect input complexes prove determinant multiplication using the coherent cone maps and the determinant functor of PadicMeasuresIwasawaAlgebras §5.1. Establish amplitude only under finite Tor amplitude and the relevant finiteness and cohomological-dimension hypotheses; §10.1 supplies the bounded real dyadic arithmetic replacement. The API keeps every cohomology boundary, local Euler complex and Tor term in these triangles. (Burns–Flach, equation (1.9) and Proposition 1.20, pp. 73, 78–80; Burns–Kurihara–Sano, Definition 2.1 and Propositions 2.2, 2.4, pp. 569–574.)

**Checks.**

- For T trivial, a finite tower-group element acts on the group-algebra basis by its inverse on the Shapiro coefficient side. Using its forward action reverses the arithmetic module's dual convention.
- For a constant tower with identity transitions the derived limit is the original complex and lim¹ vanishes. For a general tower the Milnor boundary remains part of the comparison.
- With every U_v the full local complex, the mapping fiber is quasi-isomorphic to the global complex; with every U_v zero it is compact support. A zero coefficient lattice gives zero in both cases.
- Specializing a perfect complex at ω_n can create `H^{j+1}[ω_n]` in degree j. Top-degree module control requires the explicit vanishing used in §11.2.
- Real dyadic ordinary cochains have nonzero arbitrarily high cohomology. The boundedness conclusion applies to the compact-support model constructed in §10.1, not to every ordinary global complex.

*Needs:* §2.0; ProfiniteCohomology Layers 5–12; DerivedModuleAlgebra §§0.I.1, 0.2, 1.T.1, 1.1, 1.1.1 and 1.E.0–1.E.1 for derived limits, perfect inverse systems and finite models; PadicMeasuresIwasawaAlgebras §§1 and 5 for completed coefficients, compact limits and determinant cones.

### 10.1 A bounded all-prime compact-support model

For a finite Galois number-field extension L/K with group G, `S⊇S_∞∪S_p∪S_ram`, and the smooth constructible integral p-adic coefficient sheaves used here, define `burnsFlachFiniteComplex` by the global-to-local cone of ordinary cochains, shifted by −1. At infinite places use ordinary local Galois cochains, and at finite places of S use the actual local restriction maps. Compare it to §10.0's ordinary compact-support cone. It is not the cone formed by replacing each real term by a bi-infinite complete Tate resolution. Its API includes the restriction map defining the cone, coefficient triangles, restriction/corestriction for finite fields with composition laws, and compatibility with the Tate-archimedean comparison map. (Burns–Flach, equation (1.9), p. 73, Proposition 1.20, pp. 78–80; compare the explicit ordinary/Tate comparison, p. 80.)

Prove `burnsFlachFinite_perfect`, including p=2, for the finite arithmetic coefficient lattice and its finite quotients. The proof must supply a bounded finite-projective representative over `ℤ_p[G]`, not just vanishing of a proposed list of cohomology groups. In the cochain resolution, the terms are cohomologically trivial for every subgroup. Ordinary global and local real tails cancel so the compact-support cohomology above degree 3 vanishes, also after taking every subgroup's invariants. Truncate at degree 3 and prove the new kernel is still cohomologically trivial by dimension shifting. Resolve by finite projectives bounded above; truncate below degree −1 using the torsion-free cohomologically trivial image there, which is projective over this integral group ring. Construct the comparison quasi-isomorphism and show that its class is independent of the resolution. This is the four-step argument of Burns–Flach, Proposition 1.20(a), pp. 78–79. For finite coefficient sheaves and abelian G, prove that its canonically trivial rational determinant has integral lattice the unit ideal, as in Proposition 1.20(b), pp. 79–80; this will control finite coefficient errors. For general G retain the perfectness theorem and formulate the finite-coefficient equality in relative K-theory, rather than as a fractional ideal of a commutative group ring.

Define `burnsFlachComplex F S` as the derived corestriction limit along the totally real cyclotomic tower of F/k, with its canonical completed arithmetic action. Prove `burnsFlach_corestriction`, `burnsFlach_cofinality`, and `burnsFlach_derivedBaseChange` to every intermediate quotient tower. Use the finite projective models, their intrinsic trace maps and finite-generation bounds, and compact Shapiro to obtain a perfect R-complex. The maps are part of the construction; an abstract complex having the desired cohomology would not suffice. Global compact duality identifies `H²=𝔛_S(F_∞)` and `H³=ℤ_p` with trivial action. Cyclotomic weak Leopoldt kills the remaining inverse-limit cohomology. Over totally real F both modules are R-torsion; therefore the total-fraction complex is acyclic with its canonical determinant trivialization. This proves `burnsFlach_cohomology` and `burnsFlach_perfectTorsion`. (Burns–Flach, p. 86, compact duality for degrees 2 and 3; Kurihara, §4.1, pp. 22–24.)

**Checks.**

- Over ℚ at 2, `H³` of the tower complex is `ℤ₂` with trivial Γ-action, not zero. The real ordinary cochain terms are included even though the resulting cone is bounded in cohomology.
- Trivial-action real coefficients have nonzero ordinary `H^{2j}(C₂,ℤ₂)=ℤ/2` for every positive j. The boundedness argument must cancel these tails through the global-to-local cone; a cd₂ assertion about the global group would fail this test.
- Complete Tate cochains have negative-degree terms absent from ordinary cochains. Replacing one with the other without its comparison cone changes the object, even when the positive-degree periodic groups agree.
- The finite coefficient `ℤ/2` may have nonzero cohomology, while the canonically trivialized rational determinant lattice is still a unit. This is a determinant statement about a perfect complex, not acyclicity over `ℤ₂`.
- F=k is permitted and gives the nonzero cyclotomic complex over `ℤ_p[[Γ_k]]`. Restricting to a cofinal sequence of layers gives its canonical restriction-of-scalars comparison.

### 10.2 Arithmetic instances of Iwasawa complexes

For a finite abelian extension F/k, its cyclotomic tower, `S⊇S_p∪S_∞∪S_ram`, and a finite free continuous `ℤ_p[G_{k,S}]`-module T, define `arithmeticIwasawaComplex F S T` by §10.0's derived inverse-limit construction with corestriction, or equivalently by the Shapiro coefficient module with its inverse group action. Define its compact-support version using the specified global-to-local map. Prove `arithmeticIwasawa_shapiroComparison`, independent of the compatible cochain resolution, and functoriality for intermediate fields and changes of S. The twist map is supplied only when the character actually factors through the chosen tower group. These comparisons identify the cochain construction, its mapping fibers and the intrinsic arithmetic modules, with their actual maps. (Kurihara, §4.1, pp. 22–24; Sharifi, Proposition 3.3.9 and Corollary 3.3.14, pp. 86–89.)

For odd p, or for totally imaginary F, prove perfectness from finite-coefficient finiteness and cohomological dimension, retaining the finite Tor-amplitude and finite-generation hypotheses of §10.0. With `T=ℤ_p(1)`, prove the Kummer identifications `H¹_Iw=E_{∞,S}` and

```text
0 → X′_S(F_∞) → H²_Iw → ker(⊕_{w∈S_f(F_∞)}ℤ_p→ℤ_p) → 0.
```

The sum uses the actual finite set of primes of the cyclotomic tower over S_f. For the compact-support complex prove `H²_c=𝔛_S(F_∞)`, `H³_c=ℤ_p` with trivial tower action, and vanishing in other degrees in this inverse-limit setting. At real dyadic places use §10.1's bounded Burns–Flach model for the compact-support assertions. Neither perfectness of the raw ordinary global complex there nor a global cohomological-dimension-two bound is claimed. The API includes compatibility of the cohomology identifications with unit localization, Artin maps, and corestriction.

**Checks.**

- `H⁰_Iw(ℤ_p(1))=0`: no finite number field contains a compatible infinite-order Tate-module element fixed by its absolute Galois group.
- For the compact-support tower over ℚ, `H³=ℤ_p` and γ acts as 1. Replacing it by a free Λ-module would lose the augmentation correction.
- An individual finite-level complex is killed by ω_n when inflated as a Λ-object. The tower complex has derived specialization at ω_n and is not that inflated object.
- At a real dyadic place ordinary cohomology in large degrees need not vanish. The specified bounded compact-support model is tested separately in §10.1.

### 10.3 Finite-layer descent with every Tor term

Prove `arithmeticComplex_finiteLayerDescent`: for `R=ℤ_p[[Gal(F_∞/k)]]` and its actual finite-layer quotient R_n, `C⊗^L_R R_n≃C_n`, compatibly with field composition, coefficients, and the chosen local support maps. The same statement applies to the bounded model and the T-modified complexes in Layer 11. For a perfect model the cohomology spectral sequence has terms `Tor^R_a(H^b(C),R_n)` in total degree `b−a`. Over a procyclic coordinate, the resolution by multiplication by ω_n gives

```text
0 → H^j(C)/ω_n H^j(C) → H^j(C_n)
  → H^{j+1}(C)[ω_n] → 0.
```

In particular `0→𝔛_∞/ω_n𝔛_∞→𝔛_S(F_n)→ℤ_p→0` in the compact-support ramified-module comparison; its final term is the group of the remaining tower. This is not an isomorphism of naive coinvariants with the whole finite ramified module. (Sharifi, proof of Theorem 3.3.3, p. 84; Kurihara, §4.2, pp. 24–26.) *Needs:* §§10.0–10.2, with the relevant amplitude established, not assumed at real dyadic places.

Apply Mathlib's `AddSubgroup.index_range` to the endomorphism γ−1 of finite E: `#E/(γ−1)E=#E[γ−1]`. Thus a finite kernel or cokernel has Euler quotient one, but can contribute nontrivially on both sides of a finite specialization. Retain its two derived terms until the quotient is computed; the generic finite-group equality is already supplied.

### 10.4 Arithmetic-character Euler characteristics and the determinant sign

For a finitely generated torsion `O[[Γ]]`-module M, with full characteristic series `f=ϖ^μ f*`, use the supplied resultant theorem to prove `arithmeticCharacter_eulerQuotient`. If `f(u^n−1)≠0`, the twist `M(−n)` has finite invariants and coinvariants and

```text
#M(−n)_Γ / #M(−n)^Γ = #O/(f(u^n−1)).
```

If M has no nonzero finite submodule, the invariant group is zero and this is the coinvariant order. A finite-order character is incorporated by its actual coefficient lattice; when its order is divisible by p use derived coefficient change, rather than an integral idempotent. At a zero of f, state the leading-term version in the determinant line; no finite cardinality is assigned. (Kolster 2009, Lecture 1, Lemmas 1.1–1.2, pp. 6–7; Lecture 2, Propositions 3.1–3.2, pp. 13–14.)

Use the supplier's determinant functor with `Det(C)=⊗_i Det(C^i)^{(−1)^i}` and the acyclic total-fraction trivialization. Prove `arithmeticInverseDet_cohomology`: torsion H² contributes its characteristic factor to `Det(C)⁻¹`, while torsion H³ contributes its inverse. For `[O —a→ O]` in degrees (1,2) and (2,3), the contributions are a and a⁻¹ for regular a. At a=2 these give 2 and 1/2; these arithmetic determinant-line comparisons remain targets until their carriers are constructed. Change of basis by units, shift inversion, and multiplication for direct sums use the supplier's determinant-line API. (Kurihara, §4.1 and the first remark after Theorem 4.1, pp. 23–24, 27.)

**Checks.**

- `[O —2→ O]` in degrees 1,2 has `H²=O/2` and inverse determinant `(2)`. In degrees 2,3 it has `H³=O/2` and inverse determinant `(1/2)`. The arithmetic determinant-line API must recover these scalars.
- A unit differential is acyclic and contributes a unit in both placements. A zero differential is not acyclic over the total fractions and does not have this scalar trivialization.
- Rank zero gives the empty determinant 1. Direct sums of the one-by-one examples multiply their factors; a cohomological shift inverts them.
- `M=ℤ_p=Λ/(T)` at n=0 has infinite invariants and coinvariants. For n≠0 with `u^n≠1`, its twisted coinvariant order is `|u^n−1|_p⁻¹`. The augmentation factor must remain.
- For `E=ℤ/p` with trivial γ, both E-terms have order p. Cancelling the Euler quotient does not justify erasing just its invariant term.

### 10.5 Galois descent of twists and local Euler factors

Let E/F contain `μ_{2p}` and `n≠0`. Prove `twistedRamified_coinvariants`: the dual of `𝔛_S(E_∞)(−n)_Γ` is `H¹(O_{E,S},ℚ_p/ℤ_p(n))`. Over E_∞ these coefficients are trivial; inflation–restriction for Γ has the vanishing H¹ and H² terms because the nontrivial scalar `u^n−1` acts surjectively on the divisible coefficients. For odd p, `n≥2`, and a prime-to-p finite character quotient, the finite eigenspace of the correct parity identifies in cardinality with the corresponding `H²(O_{E,S},ℤ_p(n))`; its character is inverted in duality. For totally real F at 2 and even `n≥2`, the same finite comparison gives `#𝔛_S(F_∞)(−n)_Γ=#H²_et(O_F[1/2],ℤ₂(n))` with real ramification allowed. (Kolster 2009, Proposition 2.1 and Corollary 2.2, pp. 10–11, Proposition 3.1, pp. 13–14; Rognes–Weibel, Appendix A, proof of Theorem A.1, p. 47.)

For `v∉S`, prove `S_enlarge_localExact` by comparing the two finite augmented unit/class-field sequences and taking compact norm limits. Weak Leopoldt makes the old global-unit limit injective in the old semilocal factor. This proves, rather than assumes, injectivity of the new local inertia term. With arithmetic Frobenius the result is

```text
0 → R/(Frob_v−Nv) → 𝔛_{S∪{v}}(F_∞) → 𝔛_S(F_∞) → 0.
```

The quotient denotes the induced module from the actual decomposition subgroup; v is unramified and away from p. Its inverse determinant factor is `1−Nv⁻¹Frob_v`, agreeing with §6.2. At the point `κ^nψ`, with `ψ=ψ₀ω^n` on this Frobenius, it becomes `1−ψ₀(v)Nv^{n−1}`. At p=2 absence of local p-primary roots means absence of μ₂, not merely μ₄. (NSW, Lemma 10.3.13, pp. 630–631, Corollary 10.3.24, p. 640; Kolster 2009, pp. 8–9; Kurihara, equation (14), p. 26.) The API includes composition for two added primes and compatibility with the cohomological localization triangle.

### 10.6 The real dyadic filtration

Let F be totally real of degree d, `K_∞=F_∞(i)`, J its order-two group over F_∞, `D=ℚ₂/ℤ₂`, and `X=𝔛_{S₂∪S∞}(F_∞)` with real ramification allowed. Put `H=H¹(G_S(K_∞),μ_{2∞})` and define `dyadicKummerMinusDual Y=(H^{J=−1})^∨`. Prove the actual exact sequences

```text
0 → (A^−)^∨ → Y → C_F → 0,
0 → Y → X(−1) → ℤ/2(−1) → 0,
```

where A-minus is the ordinary **norm-minus** class direct limit of §2.8, and C_F is the real-unit square-class dual of §2.8. The first map comes from the Kummer sequence, the second from inflation–restriction. The API includes compatibility with finite-layer Artin maps, the local sign maps, and the comparison with the minus Selmer limit in §11.5. (Kurihara, Lemma 4.2(1) and proof, pp. 25–26; Sharifi, Proposition 3.3.9, pp. 86–88, with the unit and norm comparisons of Layer 2.)

For the first sequence, the ordinary CM-unit term V has trivial J-action and is divisible. After changing sign, the obstruction to taking anti-invariants is `H¹(J,V(sign))=V/2V=0`; its anti-invariants are V[2], the real-unit square classes. Uniform capitulation and the unit theorem proved in §2.8 give `rank_{𝔽₂[[Γ]]} C_F=d`, hence `char_Λ(C_F)=(2^d)`. For the second sequence, inflation–restriction with trivial D has kernel `H¹(J,D)=D[2]` and zero obstruction `H²(J,D)=D/2D`; dualize and twist to obtain the displayed order-two cokernel. Consequently prove

```text
char_Λ(X(−1)) = (2^d) char_Λ((A^−)^∨).
```

This is an equality of characteristic ideals, not an isomorphism after discarding the cokernel. Define the light `dyadicCorrection d=(2^d)` over `ℤ₂[[T]]`; its API is `dyadicCorrection_zero`, additivity in d by ideal multiplication, and compatibility with coefficient extension. The two arithmetic exact sequences are the stronger map-level target.

**Checks.**

- Degree d=1 gives the vertical factor `(2)`, degree zero gives the unit ideal, and d=2 gives `(4)`. A horizontal factor T or a constant factor 2 for every degree would be wrong.
- The finite cokernel `ℤ/2(−1)` has characteristic ideal one; C_F has characteristic ideal `2^d`. They are distinct correction modules and cannot be substituted for each other.
- For the trivial action on `ℤ₂(n)`, positive even real-place cohomology is `ℤ/2` and positive odd cohomology is zero. For the sign action the parity interchanges. These periodic groups are not the rank-d tower unit module.
- For `D=ℚ₂/ℤ₂` with γ acting by 3, `D^Γ=D[2]` has order two and `D_Γ=0`. The discrete special-value formula uses invariants; the compact dual uses coinvariants.
- A finite error may survive one specialization even though its characteristic ideal is one. Its two derived terms have equal orders by §10.3.

### Examples

The complexes with differential 2 in degrees (1,2) and (2,3) pin the determinant sign before the augmentation term is used. The finite trivial Γ-module `ℤ/2` contributes one to an Euler quotient but contributes two to either of its two separate derived terms. The divisible group with action 3 gives a different invariant/coinvariant calculation and prevents transplanting the compact formula directly to Kolster's discrete module.

### Dependencies

Layers 0–3, 6, and 8; §2.0 for arithmetic duality and ordinary/Tate real-place comparison; §10.0 for derived compact coefficients, Shapiro and mapping fibers; PadicMeasuresIwasawaAlgebras §§4–5 for Euler quotients and determinants; §10.1 for the bounded real dyadic instance. The main conjecture is not needed to construct or compare these modules.

## Layer 11: controlled limits and the integral determinant main conjecture

### 11.1 Twisting the integral CM order

For `K_∞=F_∞(μ_{2p})`, retain its full abelian Galois group H over k, its full cyclotomic character ε, and complex conjugation c. Define `cmTwistMinusPlus` from the completed-algebra automorphism `τ(σ)=ε(σ)⁻¹σ`. It carries `(1+c)` onto `(1−c)`, so gives an integral isomorphism of the minus and plus quotient orders, including at 2. The API includes inverse, continuous extension, extension to total fractions, its semilinear identification of M(1), and the corresponding Fitting base change. A further totally real quotient gives the desired coefficient order R. When `K_∞/F_∞` has degree greater than two, retain the remaining finite character action until the reduction and descent in §11.7. (Kurihara, equation (11), pp. 23–24.)

Prove `stickelberger_deligneribetSquare`: `τ(θ^#)=g` in total fractions, with the allowed pole ideal of §6.3. The T-smoothed version is

```text
τ((θ^T)^#) = ∏_{v∈T}(1−Frob_v) g.
```

This is a commuting comparison of the actual measure maps, restrictions and character evaluations, proved by interpolation and its supplied uniqueness theorem. It is not an identification of arbitrarily chosen generators. (Kurihara, Lemma 4.2(2), pp. 25–26.) *Needs:* §§0.4–0.5, 6.1–6.4, and the Fitting scalar-change supplier.

**Checks.**

- `τ(c)=−c` and `#c=c`; hence the minus relation becomes the plus relation without dividing by two.
- `τ#(σ)=ε(σ)σ⁻¹`. Applying sharp after τ instead gives `ε(σ)⁻¹σ⁻¹`; the operations cannot be interchanged.
- For arithmetic Frobenius outside S, `τ(1−Nv Frob_v)=1−Frob_v`. The norm factor cancels because the full ε evaluates to Nv there.
- Since `ε(c)=−1`, ε does not descend to the real quotient. Applying ε to that quotient before forming τ is invalid.
- A twist sends ω_n to `ε(γ)^{−pⁿ}γ^{pⁿ}−1`. It does not preserve the old ideal `(ω_n)` in general. Finite-layer descent below is performed before twisting.

### 11.2 The modified Selmer limit and its top-cohomology control

Choose a finite T disjoint from S, away from p, such that the smoothed S-unit group is torsion-free at every layer. Such a choice is made using the roots-of-unity reduction criterion, with the local residue characteristic restrictions retained under the tower. Define `modifiedSelmerLimit` as the compact norm limit of the intrinsic finite Selmer modules of §8.3. Construct its T-modified cohomological model and its maps to the unmodified model using the coefficient/reduction triangle, not a choice of finite presentation matrices. Its API includes the norm maps, independence of auxiliary presentations, `modifiedSelmer_forgetT`, transitivity for `T⊂T′`, and the comparison of top cohomology with the arithmetic quotient. (Burns–Kurihara–Sano, Definition 2.1 and Propositions 2.2, 2.4, pp. 569–574; Kurihara, equation (12), pp. 24–25.)

Prove `modifiedSelmer_topControl` for the **untwisted** minus order. The finite model has highest cohomology H² equal to `Sel^T_S(K_n)_{p,−}`; its H³ is the dual of the smoothed unit torsion and vanishes under the T hypothesis. Derived scalar change by the integral minus quotient is right t-exact, so it creates lower Tor groups, not higher ones. Finite-layer derived control and the top-degree edge map therefore give the canonical isomorphism

```text
M/I_nM ≃ Sel^T_S(K_n)_{p,−},   I_n=(γ^{pⁿ}−1),
```

for `M=modifiedSelmerLimit_{−}`, with the appropriate open cyclotomic subgroup. Prove finite generation from the perfect model or compact Nakayama and this control map. Do not infer this isomorphism merely from M being an inverse limit. Keep all lower Tor terms in the comparison triangle. At p=2 it is top-degree right exactness, rather than exactness of the minus functor, that justifies the assertion. (Burns–Kurihara–Sano, Proposition 2.4, pp. 571–574; Kurihara, proof of Lemma 4.2(2), pp. 25–26; the edge-map argument is the application of §10.3.)

Prove `modifiedSelmer_T_triangle`. Before twisting its cohomology exact sequence is

```text
0 → Sel_S(K_∞)_p → Sel^T_S(K_∞)_p
  → ⊕_{w∈T(K_∞)}ℤ_p(−1) → ℤ_p(−1) → 0.
```

The maps are the actual residue and augmentation maps, with their decomposition-group actions. After the CM quotient and (1), the local terms are the untwisted permutation modules `⊕_{v∈T}R/(1−Frob_v)`. At 2 take the quotient in the derived triangle and retain its finite error groups; do not simply assert exactness of the displayed sequence after minus. (Kurihara, equation (12) and Lemma 4.2, pp. 24–26.)

**Checks.**

- A single admissible v contributes `R/(1−Frob_v)` after twisting, rather than `R/(1−Nv Frob_v)`. Before twisting the latter factor appears in the appropriate sharp convention.
- An arbitrary inverse system can have a limit whose quotient is not its nth term. The derived top-cohomology map, and vanishing H³, distinguish this arithmetic control theorem.
- If T does not kill smoothed unit torsion, H³ survives. Its invariant Tor contribution can obstruct the claimed top-module control, so the hypothesis is indispensable.
- A prime in S is not an admissible new smoothing prime. The asserted residue-local triangle requires disjointness.
- At a finite trivial-zero component the controlled module can have positive rank. The control statement does not require nonzero finite determinants.

### 11.3 Closed-ideal Fitting continuity in the actual order

Prove `controlledFitting_continuity` in the following general algebraic form, which also applies to nonreduced coefficient orders. Let O be a commutative finite free `ℤ_p`-algebra, `R=O[[T]]`, M a finitely presented R-module, and `I_n=((1+T)^{pⁿ}−1)`. Put

```text
finiteLayerIdeal O p a n = (p^a, (1+T)^{pⁿ}−1).
```

These joint ideals, with a and n increasing, are cofinal among neighborhoods of zero for the maximal-ideal topology on each local factor of R. Prove this using the binomial coefficients, both inclusions with powers of the maximal ideal, and completeness of the finite coefficient quotients. Prove `ideal_eq_of_joint_finite_images`: ideals I,J of R having the same image modulo every joint ideal with `a>0` are equal. R is noetherian and complete, so its ideals are closed; equivalently use Krull intersection on R/I and R/J. Quotients by `I_n` alone are not a basis of open neighborhoods since they retain unbounded p-adic coefficients. (The algebraic continuity step in Kurihara's proof of Lemma 4.2(2), pp. 25–26, is made explicit here; the completed-ring, compact Nakayama, and Fitting scalar-change inputs are supplied.)

Now use the existing arbitrary-base-change theorem for Fitting ideals. If the controlled finite modules are M/I_nM and their Fitting ideals are the images of a compatible closed ideal J, their further coefficient reductions give equality modulo every joint ideal, hence `Fitt_R(M)=J`. No assertion that Fitting ideals commute with arbitrary inverse limits is used. The API includes `controlledFitting_modCoefficient`, independence of a cofinal subsystem, the same theorem on finite products of coefficient orders, and the specialization to a determinant ideal. The Lean milestone `ideal_eq_of_joint_finite_images` records precisely this closed-ideal descent over finite free coefficient orders. Applying it to principal determinant ideals is one step of the arithmetic proof in §§11.4–11.7; it is not itself a statement of the main conjecture.

**Checks.**

- At n=0 the tower relation is T. At `a=1,n=0` the joint ideal is `(p,T)`. At a=0 it is the unit ideal, so this precision gives no information and is excluded from the separation hypothesis.
- Over `ℤ₂`, `ω₁=2T+T²`; replacing it by T² would give the wrong mixed-characteristic quotient.
- O may be `ℤ₂[C₂]`, which is not a DVR. Characterwise equality in its normalization is insufficient; equality of images in the actual joint quotients is the hypothesis.
- M=0 has unit Fitting ideal, while `M=R` has zero zeroth Fitting ideal. Both commute correctly with the displayed coefficient quotients.
- The ideals `(p,T)` and R cannot have equal images in all joint quotients: the first residue quotient detects them. A comparison only after inverting p would miss this distinction.

### 11.4 Lifting a bounded number of relations

Prove `controlledSquarePresentation`, without compatible bases. Let R be as in §11.3, M finitely generated, and let its actual quotients M/I_nM have square finite free presentations over R/I_n for all sufficiently large n. On each complete local factor choose a minimal free cover `R^r↠M` with finite kernel K. Since I_n lies in the maximal ideal, the reduced cover is minimal with the same r generators. Cancellation of unit entries in a square presentation of M/I_nM gives a square presentation of size r, so `K/(K∩I_nR^r)` is generated by at most r elements over R/I_n. For a sufficiently deep n, Artin–Rees and `I_n⊂𝔪^N` give `K∩I_nR^r⊂𝔪K`. Nakayama then gives at most r generators of K. Pad the list by zeros to obtain `R^r→R^r↠M→0`. On a semilocal product retain its locally constant rank and assemble the componentwise square projective presentation. This proves the bounded-relation interface needed by the limit, independent of all finite choices of matrices. (Kurihara, Theorem 2.12 and Lemma 4.2(2), pp. 14–15, 25–26; this relation-lifting argument supplies the completed-module step implicit there.)

Its API includes the minimal-cover comparison, invariance under changing the finite square presentations, localization at a coefficient factor, and `controlledSquare_detFitting`. If its determinant is regular, the square map is injective by the adjugate identity, and `pd_R(M)≤1`. Regularity is proved arithmetically below, not included in the lifting conclusion.

**Checks.**

- M=0 permits r=0 and empty determinant 1. M=R has the zero one-by-one square presentation, showing that the lifting theorem alone does not imply torsion.
- The bound concerns the number of relations after cancelling redundant generator–relation pairs. Arbitrarily large finite square matrices do not obstruct the fixed minimal r argument.
- An arbitrary decreasing system of ideals need not approach powers of 𝔪 and need not give `K∩I_nR^r⊂𝔪K`. The binomial estimate for these specific I_n is used.
- A regular nonunit determinant gives a nonzero torsion module; a unit determinant gives M=0. Over a nonreduced order, merely being nonzero does not imply regularity.

### 11.5 The infinite Selmer Fitting identity

Apply the finite all-prime theorem of §9.7 to the exact untwisted quotients of §11.2. Use §§11.3–11.4 to obtain the Fitting identity and square presentation in the completed minus order. Only then apply τ and the real quotient, or transport every finite-layer ideal by τ if using twisted coordinates throughout. Prove `iwasawaModifiedSelmer_fitting` in the quadratic CM reduction:

```text
Fitt_R((Sel^T_S(K_∞)_p)_{−}(1))
  = ( ∏_{v∈T}(1−Frob_v) g_{F∞/k,S} ).
```

The right side is integral in this modified setting. Interpolation nonvanishing and the open decomposition group of every v∈T show that its image in every characteristic-zero component is nonzero. The completed order is reduced; therefore its determinant is regular, and the modified Selmer module has projective dimension at most one. This proves an actual arithmetic presentation, rather than assuming one with the desired determinant. (Kurihara, Lemma 4.2(2), pp. 25–26.) *Needs:* §9.7, §§11.1–11.4, and the nonvanishing statements already built into the analytic dictionary.

Prove `unmodifiedSelmer_ramifiedComparison`: `(Sel_S(K_∞)_p)_{−}(1)→𝔛_S(F_∞)` is an isomorphism for odd p, and injective with cokernel `ℤ/2` at p=2, with trivial R-action. Its dual is the inflation–restriction map with kernel `H¹(C₂,ℚ₂/ℤ₂)=ℤ/2`; the obstruction H² vanishes. This is the same map as in §10.6, after its Tate twist and the Kummer–Selmer identification. (Kurihara, Lemma 4.2(1), pp. 25–26.) The finite cokernel is kept until its role in the determinant and derived specialization is computed.

### 11.6 Height-one comparison and integral lattice detection

Prove `iwasawaMain_heightOne` for every height-one prime q of R. Localize the T-triangle and the ramified comparison. Finite errors vanish at height one. At horizontal primes the order becomes a product of DVRs after inverting p; the determinant–length comparison applies there. At vertical primes the finite-`ℤ_p`-rank local modules vanish, and the projective-dimension-one modified Selmer identity applies directly. Cancel the T-factors using their actual local determinants. In the cohomological convention of §10.4 the augmentation `ℤ_p` in H³ contributes its inverse to `Det(C)⁻¹`, so the result is `Det(C)⁻¹_q=gR_q`. (Kurihara, equations (13)–(14) and proof of Theorem 4.1, pp. 26–27.) No DVR assertion is made about the vertical localization of `ℤ_p[G_p][[T]]`.

Prove `invertibleLattice_heightOneDetection` for this integral order. More generally let R be a reduced noetherian S₂ ring, finite free over `ℤ_p[[T]]`, and I,J invertible fractional R-lattices in its total ring of fractions. If `I_q=J_q` at every height-one prime, then I=J. Prove the intersection formula for an S₂ locally free module inside its total-fraction extension, and apply it to the two rank-one modules. For the arithmetic order, finite freeness over the regular two-dimensional procyclic ring makes it Cohen–Macaulay and S₂; reducedness follows by the characteristic-zero character injection. This is the required integral detection theorem. It applies to invertible determinant lattices and principal regular fractional lattices, not to arbitrary ideals. (Kurihara, proof of Theorem 4.1, p. 27, invoking the integral lattice comparison; the intersection argument gives the specific order-theoretic interface.)

**Checks.**

- In `ℤ_p[[T]]`, the proper ideal `(p,T)` has unit localization at every height-one prime. It is not invertible, and must not be identified with R by the theorem.
- For an invertible ideal generated by a regular a, its height-one valuations detect its divisor and the lattice itself through S₂. This is the case needed for `gR`.
- The dyadic coefficient order can be nonnormal. Normalization and character evaluations alone do not establish equality of its integral lattices.
- A finite module is invisible at height one but can have nonzero specialization at `(p,T)`; lattice detection does not erase that module's finite-level Tor terms.

### 11.7 The all-prime integral theorem and its arithmetic presentation

Prove `integralDeterminantMainConjecture`: for any prime p, totally real k, finite totally real abelian F/k, `S⊇S_∞∪S_p∪S_ram`, and the bounded complex C of §10.1,

```text
Det_R(C_{F∞,S})⁻¹ = g_{F∞/k,S} R
```

as invertible fractional lattices with the canonical acyclic total-fraction trivialization. No μ-vanishing assumption is made, and k need not be abelian over ℚ. First choose a finite field of definition disjoint from `k_∞` inside the given abelian rank-one tower. Enlarge it within `F_∞(μ_{2p})` so that the remaining CM extension is quadratic. Establish §§11.5–11.6 there. Apply invertible-lattice detection, then descend to the original real quotient by **derived** cochain base change, preserving the canonical trivialization and the restriction of g. The construction works when F=k. (Kurihara, Theorem 4.1 and its reduction and proof, pp. 24–27.)

Prove `arithmeticTwoTermPresentation`: there are finitely generated R-torsion modules P₁,P₂ of projective dimension at most one and an exact sequence

```text
0 → 𝔛_S(F_∞) → P₁ → P₂ → ℤ_p → 0,
Fitt(P₁) Fitt(P₂)⁻¹ = gR.
```

Construct them from a bounded projective representative `C¹→C²→C³` of C. Choose `t=γ−1` in an open procyclic subgroup; it is regular and kills the augmentation module. Lift `t:C³→C³` through the kernel of `C³→ℤ_p`, define P₁ from the resulting map `C¹⊕C³→C²`, and put `P₂=C³/tC³`. Verify injectivity after total fractions and then over R, exactness, and the determinant relation. Thus P₁,P₂ are real arithmetic cokernels, not arbitrary modules stipulated to satisfy the displayed equality. (Kurihara, Corollary 4.3 and proof, pp. 27–28.)

**Checks.**

- With F=k the finite Galois group is trivial and the theorem still includes H³=ℤ_p. Its contribution to the inverse determinant is `T⁻¹`, so the characteristic ideal of H² is `(Tg)` at the trivial character.
- On a nontrivial finite character component, augmentation vanishes and that denominator is absent. Adding T uniformly would give the wrong component ideal.
- For `[R --a→ R]` in degrees 1 and 2 with regular a, the inverse determinant is aR. For a=0 acyclicity over total fractions fails, so there is no canonical acyclic trivialization of this form.
- The zero module has unit Fitting ideal. In the construction `P₂=C³/tC³`, t is chosen regular; setting t=0 would produce a nontorsion P₂ and fails the stated projective-dimension-one torsion contract.

### Examples

For F=k and a one-by-one augmentation relation T, H³ contributes `T⁻¹` to the inverse determinant. Therefore extracting the characteristic ideal of H² multiplies the analytic g by T at the trivial character. For a finite split-prime layer the square presentation can still have zero determinant, whereas the infinite T-modified presentation is injective only after componentwise analytic nonvanishing. Finally `(p,T)` supplies the explicit failure of unrestricted height-one ideal detection; the determinant theorem uses invertible lattices throughout.

### Dependencies

Layers 0–3, 6, 8–10; supplied compact Nakayama, arbitrary-ring Fitting base change, finite quadratic-presentation algebra, determinant triangles, and ordinary/Tate cochain comparisons. The closed-ideal, relation-lifting and integral lattice-detection interfaces are proved in this layer. Finite arithmetic identities precede the limit, and twist transport follows untwisted top-cohomology control.

## Layer 12: classical formulations, special values, and Brumer–Stark consequences

### 12.1 Character quotients and the Wiles formulation

Prove `ramifiedModule_characterQuotientMainConjecture`. Let k,F,p,S be as in §11.7 and assume `F∩k_∞=k`. For a finite character ψ of `Gal(F/k)`, the actual quotient `X_ψ=X⊗_{ℤ_p[Gal(F/k)]}O_ψ` is torsion and

```text
char(X_ψ)=(ψ(g))                       if ψ≠1,
char(X_1)=((γ−1)ψ(g))                  if ψ=1.
```

Here γ generates `Gal(k_∞/k)` and ψ(g) is evaluated in the specified component of total fractions; the trivial-character pole is cancelled by γ−1. Prove this through the modified Selmer square presentation, its derived ψ coefficient change and T-local triangle. Tensoring a height-one identity by a p-primary character alone would not prove it. At height one before coefficient change, X has Fitting ideal g away from the augmentation prime and `(γ−1)g` at that prime. (Kurihara, the three remarks following Theorem 4.1, p. 27.)

Deduce `wilesMainConjecture`: for a totally real base, odd p, every finite even type-S character ψ, and every finite `S⊇S_p∪S_∞`, the distinguished-polynomial equality of §6.5 holds. If the order of ψ is prime to p, its eigenspace and quotient agree integrally and the strong characteristic-ideal equality holds, including μ. For arbitrary ψ they agree after inverting p, which proves only the distinguished assertion for that eigenspace. At p=2 the integral theorem also supplies the trivial-character statement for every totally real base, including the historical rational case. If S originally omits ramified primes of the character field, enlarge it to apply §11.7, then remove them through the local Euler modules; the inertia invariants vanish rationally, and integrally for a prime-to-p character. Thus the theorem has the advertised S-range. This is the consequence of the finite all-prime route, independent of Wiles as a premise. (Kolster 2009, Main Conjecture 1.3 and following discussion, pp. 8–9; Kakde 2013, §3, p. 14; Kurihara, Theorem 4.1 and second remark, pp. 24–27.)

### 12.2 Inflation, induction, and going up

Prove `mainConjecture_goingUp` for every prime p. Suppose the distinguished main conjecture holds over a totally real K for every even type-S character. If F/K is finite totally real and ψ is an even one-dimensional type-S character of F whose character field is abelian over K, it holds for ψ. Work over one finite splitting coefficient field. Inflation preserves the algebraic characteristic polynomial after rational scalar change, by restriction/transfer with finite-index image. Frobenius reciprocity identifies the root multiplicities under induction. If `[F∩K_∞:K]=p^e`, compare the generators by `T_e=(1+T)^{p^e}−1`. A type-W twist ρ makes the substitution `T↦ρ(γ)(1+T)−1`, followed by monic normalization. The analytic identities concern **G/H** with their pole denominators, and use the same substitutions. The induced character splits into one-dimensional characters over K, so the assumed equalities and nonnegative root multiplicities give the result. (Greenberg 1983, Propositions 1–3, pp. 78–80, induction and twist identities, pp. 80–83, Proposition 5, pp. 84–85; Rognes–Weibel, Theorem A.2 and Corollary A.3, p. 45, with proofs on pp. 48–49.)

The API consists of `mainConjecture_inflation`, `mainConjecture_induction`, `mainConjecture_typeWTwist`, and their compatibility with the base-intersection reindexing. This theorem does not assert a general μ equality. Even means that the character field is totally real; it does not mean that all character values are real.

**Checks.**

- e=0 gives T_e=T; e=1 gives `(1+T)^p−1`, including the integral linear coefficient p. The generator change is not T↦T^p over `ℤ_p`.
- A nontrivial type-W character changes the location of the pole. Multiplying analytic numerators without their denominators would give a false induction formula.
- A nonreal root of unity can be the value of an even finite character. Testing reality of its values would impose an unrelated restriction.
- For a character of p-power order, rational equality leaves a possible vertical factor. The going-up theorem promises the distinguished factor only.

### 12.3 Specialization at arithmetic weights

Let F be totally real, p odd, `E=F(μ_p)`, `Δ=Gal(E/F)`, `n≥2`, and χ a one-dimensional character factoring through Δ with `χ(c)=(−1)^n`. Set `ψ=χω^n`, which is even of prime-to-p order, and let `d_χ=[O_χ:ℤ_p]`; O_χ is unramified. Prove `oddPrime_specialValueEuler`:

```text
X_ψ(−n)^Γ=0,
v_p(#X_ψ(−n)_Γ)
  = d_χ v_p(L_S(1−n,χ))
    + v_p(#H⁰(E,ℚ_p/ℤ_p(n))_{χ⁻¹}).
```

The groups are finite, the second term is nontrivial only on the pole branch `ψ=1`, and the valuation on L uses the fixed p-adic embedding with `v_p(p)=1`. Apply §12.1 and §10.4, use absence of finite submodules, and compare through §10.5 to the finite étale H² eigenspace. For `χ=1,n=2`, this gives `v_p(ζ_F(−1))+v_p(w₂(F))`; Euler factors at primes above p are units for these weights. For odd p, ω² need not be trivial, so this calculation generally occurs over E with its ω² component rather than as a κ²-character of the totally real procyclic group alone. (Kolster 2009, Propositions 3.1–3.2, Theorem 3.3 and Corollary 3.4, pp. 13–15.)

For p=2, F totally real, and every even `n≥2`, prove `dyadic_specialValueEuler` directly on `X=𝔛_{S₂∪S∞}(F_∞)`:

```text
X(−n)^Γ=0,
#X(−n)_Γ = #H²_et(O_F[1/2],ℤ₂(n)),
v₂(#X(−n)_Γ)=v₂(ζ_F(1−n))+v₂(w_n(F)).
```

Here `w_n(F)₂=#H⁰(F,ℚ₂/ℤ₂(n))=#H¹_et(O_F[1/2],ℤ₂(n))`. The compact-support specialization has H² equal to `X(−n)_Γ` and H³ equal to `ℤ₂(−n)_Γ` of order `w_n(F)₂`; its Euler quotient is `#H²/#H³`. This order of numerator and denominator agrees with §10.4's determinant calculation. (Rognes–Weibel, Theorem A.1 and proof, pp. 45–47; Kolster 2009, §2, pp. 9–11.) The comparison to K₂ and the Birch–Tate formula is the downstream K-theory theorem; no K-theory identification is asserted merely from equality of characteristic ideals.

### 12.4 Kolster's covariant module at 2

Let A-minus be the norm-minus class direct limit in `F_∞(i)`, and give `N=Hom(A^−,ℚ₂/ℤ₂)` the **covariant** action `(γφ)(a)=φ(γa)`. Choose a generator f_F of its full characteristic ideal, including μ. Define `kolsterInvolution` by `ι_u(γ)=uγ⁻¹`, or `T↦u/(1+T)−1`. Its API is involutivity, compatibility with the contragredient dual via `ι(γ)=γ⁻¹`, and its evaluation at augmentation and at `γ=u²`. Prove `kolster_moduleDictionary`:

```text
char(ι_u X) = (2^[F:ℚ] f_F).
```

Derive it from both exact sequences of §10.6: `char(X(−1))=2^d char((A^−)^∨)`, and the contragredient dual has characteristic series `f_F(γ⁻¹)`. Apply the inverse-variable substitution after the Tate change. This proof fixes the covariant/contragredient distinction instead of suppressing it. (Kolster 1989, pp. 248–250, especially Lemma 2; Kurihara, Lemma 4.2, pp. 25–26.)

For n=2 prove the finite comparison

```text
#X(−2)_Γ = 2^d #(ℤ₂(1)⊗A^−)^Γ,
#(ℤ₂(1)⊗A^−)^Γ = |f_F(u⁻¹)|₂⁻¹.
```

The series argument is `u⁻¹−1` when f is written in T. Use all finite Tor terms in the two exact sequences before their Euler quotients cancel. The discrete group uses invariants. This is the Iwasawa input to Kolster's `#K₂(O_F)(2)=2^d#(ℤ₂(1)⊗A^−)^Γ`; the K-theory side of that formula is not a target here, and its proof is given downstream by SpecialValuesBirchTate. (Kolster 1989, Theorem 1 and Lemma 2, pp. 249–250.)

**Checks.**

- Applying `γ↦uγ⁻¹` twice gives γ, and on `γ=u²` its argument is u⁻¹. This pins both the inverse and the Tate exponent.
- The constant factor `2^d` survives this substitution. Replacing f_F by its distinguished polynomial loses μ when μ is nonzero.
- With `D=ℚ₂/ℤ₂` and action 3, the discrete invariant group has order two although its coinvariant group vanishes. The discrete term above cannot use coinvariants.
- The finite descent cokernel `ℤ/2` has Euler quotient one, but its invariant and coinvariant terms both have order two. The factor `2^d` comes from the unit radical, not from that cokernel.

### 12.5 Higher Fitting ideals of ray classes and integral annihilation

For odd p prove `pModifiedSelmer_sinnottKurihara`: with `Σ=S_∞∪{ramified v|p}`, `Fitt(Sel^T_Σ(H)_{p,−})=SK^T_p(H/F)_{−}`. Change the smoothing and depletion sets in §9.7 and use the local generators `(N I_v,1−Frob_v e_v)` from §8.2. Then prove `rayClassDual_sinnottKurihara` over `ℤ[1/2][G]⁻`:

```text
Fitt(Cl^T(H)^{∨,−}) = SK^T(H/F)_{−}.
```

The proof uses the intrinsic field-change maps of ∇, their local α_v,β_v relations with vanishing two-by-two determinants, and the higher Fitting formula for the transpose with its excess-generator index s. Partition the ramified places and recombine the resulting generators by the supplied compound-matrix/exterior-annihilator identities. This is stronger than the single θ inclusion and has exactly the odd-primary scope of this formula. (Dasgupta–Kakde, Theorems 3.5, 3.7, Corollary 3.8, Lemma 3.9, pp. 21–25; Appendix B, Lemmas B.4–B.7 and Theorem B.8, pp. 92–97; Kurihara, Theorem 2.8 and Corollary 2.9, p. 11.)

Deduce `strongBrumerStark_awayTwo` from θ-sharp lying in this Fitting ideal and Fitting being contained in the annihilator. At 2 prove the specific integral refinement `Θ_{S,T}/2^{d−1}∈Ann(Cl^T(H)_{−})` from the generalized ∇ theorem and its dual exact sequence. Do not assert the full Sinnott–Kurihara Fitting formula at 2 as a consequence. (Dasgupta–Kakde–Silliman–Wang, Theorem 2.4, pp. 8–9.)

Prove `brumerStark_integral`: for `S⊇S_∞∪S_ram` and disjoint T satisfying the root-killing smoothing condition, Θ annihilates the smoothed ray class group over ℤ. If a prime 𝔭 outside S∪T splits completely, and 𝔓 lies above it, construct a T-congruent anti-unit a with absolute value one at every place not above 𝔭, including the complex places, and

```text
Σ_σ χ(σ) ord_{σ⁻¹𝔓}(a) = L_{S,T}(χ,0)
```

for every character χ. At degree `d≥2` construct the refined unit with Θ divided by `2^{d−2}`. Degree one uses the classical rational Stickelberger unit argument. The unit statement retains its congruences and absolute-value constraints; principalizing an ideal from annihilation alone does not establish them. The displayed Theorem 1.1 in the all-prime source uses the sufficient Deligne–Ribet smoothing condition (two residue characteristics, or one greater than d+1). The target here retains the general root-killing condition: apply its Theorem 2.4, whose inputs are (A1)–(A5), with Σ=S, Σ′=T, and repeat the proof on pp. 9–10 using `a=z^{1−c}`. No stronger smoothing condition is used in that deduction. (Dasgupta–Kakde, Theorem 1.2 and equation (5), pp. 4–5; Dasgupta–Kakde–Silliman–Wang, Theorem 1.1, p. 4, and its proof, pp. 8–10.)

### 12.6 Rubin's lattice and the higher-rank consequence away from 2

Use Mathlib's exterior powers and module duals to define `exteriorBidual R M r = Hom_R(∧^r_R Hom_R(M,R),R)`. Mathlib's `exteriorPower.pairingDual` and `pairingDual_ιMulti_ιMulti` already supply determinant evaluation on decomposable wedges. For a torsion-free finite lattice in its rational extension define `rubinLattice` as the rational exterior vectors on which every determinant of r integral linear functionals is integral. Prove `rubinLattice_bidualevaluation` in the group-ring lattice setting, scalar extension by inverting 2, and naturality under equivariant lattice maps. This supplies precisely the bidual interface used here. General higher-rank Euler-system contractions and transfer theory have their own owner. (Dasgupta–Kakde, equations (8)–(10) and the lattice definition, pp. 8–9; §3.4, pp. 25–27.)

**Checks.**

- For `R=ℤ,M=ℤ,r=1`, the lattice is ℤ inside ℚ; `1/2` fails evaluation by the identity functional.
- For `M=ℤ²,r=2`, the basis wedge evaluates to 1 under the dual basis, while half that wedge is excluded. For r=0 the determinant is 1 and the bidual is R.
- If the rank of M is less than r, its rational exterior space is zero. The definition must not manufacture a nonzero Stark element there.
- Over a nonprincipal group order the exterior power and its bidual need not coincide. The definition uses all integral functionals, rather than assuming the ordinary exterior lattice is already saturated.

Fix `S₀⊇S_∞∪S_ram`, T as above, and distinct split primes `V={v₁,…,v_r}` outside S₀∪T, with chosen w_j above them. Define `rubinStarkUnitLattice` from T-congruent elements with zero finite valuations outside V_H. On its rational minus exterior power define `rubinOrderMap` by the determinant with entries `Σ_σ σ⁻¹ ord_{w_j}(σu_i)`. Prove it is an isomorphism to `ℚ[G]⁻` and define u_RBS by image `Θ_{S₀,T}`. Its API includes change of w_j by the corresponding group unit, the alternating sign under permutation of the ordered places, and compatibility with the lattice pairing just defined. The rational inverse is well defined by finite S-unit reciprocity and the minus unit-rank calculation. (Dasgupta–Kakde, equations (8)–(10), p. 8.)

**Checks.**

- For r=1 the determinant is the equivariant valuation and this is the Brumer–Stark rank-one lattice. Permuting two places at r=2 changes its sign.
- Replacing w_j by a conjugate multiplies the order map by a group unit and preserves integrality of the resulting element.
- Putting a split v_j into the depletion set of Θ would multiply its character value by `1−1=0`. The fixed S₀ and the split set V therefore remain separate.

Prove `rubinBrumerStark_awayTwo`: u_RBS lies in Rubin's lattice after inverting 2. The ray-class Fitting identity of §12.5, the lattice-dual sharp comparison, and the exterior-cokernel annihilator show that every integral r-tuple of functionals evaluates integrally. No dyadic higher-rank integrality statement is inferred. (Dasgupta–Kakde, Theorem 1.6, p. 9, §3.4, pp. 25–27.)

### Examples

At F=ℚ and p=2, `ζ_ℚ(−1)=−1/12` has valuation −2 and `w₂(ℚ)=24` has valuation 3. Thus the weight-two H² order is 2; forgetting H³ would give a negative valuation. For an odd p the same example has no p-primary H² unless p=2, with the p=3 denominator cancelled by w₂. The rank-one Rubin lattice over ℤ excludes `1/2` by a single integral functional, illustrating why a rational valuation identity does not by itself give an integral Stark element.

### Dependencies

Layers 0–11; the supplied higher Fitting and exterior-annihilator algebra; finite S-unit and ray reciprocity; Artin formalism and interpolation uniqueness. The special-value statements stop at étale cohomology and the Iwasawa norm-minus class module; their K-theory interpretation is given downstream by SpecialValuesBirchTate.

## Downstream consumers

**EulerSystemsCyclotomicMainConjecture** uses `classNumberGrowth`, the cyclotomic tower, characterwise unit lattice indices, inertia-control quotients, and independent μ-vanishing of Layers 0–5. Its Euler-system proof and the Eisenstein proof here have the same rational main-conjecture endpoint. Its general ramified-conductor unit comparison uses the exact norm-lattice correction in §1.8, rather than a prime-power formula transplanted to all abelian subfields.

**ColemanPowerSeries** uses `colemanInterpolation`, the norm dictionary of §§1.3–1.4 and the integral norm, all-prime unramified interpolation, normalized arithmetic sequence and real principal circular closure of §§7.1–7.3.

**SelmerIwasawaCohomology** consumes `infiniteGlobalLocalSequence`, the field-level Leopoldt theorem, weak Leopoldt, the unit/class comparison of §2.7 and the all-prime arithmetic complexes of Layer 10. **DirichletPadicLFunctions** consumes the arithmetic dictionary and independent analytic μ-vanishing; its further analytic branches and Eisenstein applications use the canonical pseudomeasure of §5.0. The proof of cyclotomic weak Leopoldt here is independent of an assumed field-level conjecture.

**SpecialValuesBirchTate** consumes §§12.3–12.4, including the `2^[F:ℚ]` correction, the order-two descent cokernel, the full characteristic series, and the weight-two compact Euler quotient. **EulerSystemsAndKolyvaginSystems** can consume the finite ray-class Fitting and Rubin–Stark consequence; its broader higher-rank system theory is not needed for the finite exterior-lattice argument above. More general automorphic main conjectures can use the exact Eisenstein and weighted local extension interfaces in Layer 9, retaining their finite-weight, ordinary, level and coefficient hypotheses.

## References

Page locators in the layers refer to the versions listed here; journal pages and preprint pages are distinguished.

- Pierre Deligne and Kenneth A. Ribet, *Values of abelian L-functions at negative integers over totally real fields*, Invent. Math. **59** (1980), 227–286, especially §0, pp. 227–232. [Author-hosted article](https://math.berkeley.edu/~ribet/Articles/deligne-ribet.pdf).
- David Burns and Matthias Flach, *Motivic L-functions and Galois module structures*, Math. Ann. **305** (1996), 65–102, especially equation (1.9), Proposition 1.20 and p. 86. [Digitized journal volume](https://gdz.sub.uni-goettingen.de/id/PPN235181684_0305).
- David Burns, Masato Kurihara and Takamichi Sano, *On zeta elements for G_m*, Doc. Math. **21** (2016), 555–626, especially §2, pp. 569–574. [Published article](https://ems.press/content/serial-article-files/26320).
- Samit Dasgupta and Mahesh Kakde, *On the Brumer–Stark conjecture*, arXiv:2010.00657v3 (5 September 2022), published Ann. of Math. **197** (2023), 289–388. Layer locators use the author version's pages. [Author version](https://arxiv.org/pdf/2010.00657v3).
- Samit Dasgupta, Mahesh Kakde, Jesse Silliman and Jiuya Wang, *The Brumer–Stark conjecture over ℤ*, arXiv:2310.16399v1 (25 October 2023). [Author version](https://arxiv.org/pdf/2310.16399v1).
- The same authors, *The residually indistinguishable case of Ribet's method for GL₂*, arXiv:2310.16396v2. The weighted local interface uses Theorem 2.1, Remark 2.2 and its proof. [Bibliographic record](https://arxiv.org/abs/2310.16396).
- Bruce Ferrero, *Iwasawa invariants of abelian number fields*, Math. Ann. **234** (1978), 9–24, especially §1 and the beginning of §2, pp. 9–13. [Digitized article](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0234/LOG_0010.pdf).
- Ralph Greenberg, *On p-adic Artin L-functions*, Nagoya Math. J. **89** (1983), 77–87, especially Propositions 1–3 and 5. [Published article](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/7553544640D5E8A25438318D20A35A09/S0027763000020250a.pdf/div-class-title-on-em-class-italic-p-em-adic-artin-em-class-italic-l-em-functions-div.pdf).
- Cornelius Greither, *Class groups of abelian fields, and the main conjecture*, Ann. Inst. Fourier **42** (1992), 449–499. [Published article](https://www.numdam.org/article/AIF_1992__42_3_449_0.pdf).
- Mahesh Kakde, *The main conjecture of Iwasawa theory for totally real fields*, arXiv:1008.0142v3 (19 May 2011), §3, p. 14; published Invent. Math. **193** (2013), 539–626. The classical polynomial formulation here is distinguished from the integral μ assertion. [Author version](https://arxiv.org/pdf/1008.0142v3).
- Manfred Kolster, *Special values of L-functions at negative integers*, Maine–Québec Number Theory Conference lecture notes (2009), Lectures 1–2, pp. 5–15. [Author notes](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf).
- Manfred Kolster, *A relation between the 2-primary parts of the main conjecture and the Birch–Tate conjecture*, Canad. Math. Bull. **32** (1989), 248–251, especially Theorem 1 and Lemma 2. [Published article](https://doi.org/10.4153/CMB-1989-036-8).
- Masato Kurihara, *On class groups and Iwasawa modules of CM-fields*, author manuscript of the contribution to *Arithmetic of L-functions* (EMS, 2025), pp. 1–37, especially Theorem 2.12 and §4, pp. 14–15, 22–28. [Author manuscript](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf).
- Jürgen Neukirch, Alexander Schmidt and Kay Wingberg, *Cohomology of Number Fields*, electronic edition 2.3 (May 2020), especially §§5.2–5.3, 5.6, 8.3, 8.6–8.7, 10.3 and 11.1–11.3. [Author-hosted edition](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf?download=true).
- Joseph Oesterlé, *Travaux de Ferrero et Washington sur le nombre de classes d'idéaux des corps cyclotomiques*, Séminaire Bourbaki, exposé 535 (1978–1979), volume **21** (1980), 170–182. [Exposé 535](https://www.numdam.org/article/SB_1978-1979__21__170_0.pdf).
- Joaquín Rodrigues Jacinto and Chris Williams, *An introduction to p-adic L-functions*, Essential Number Theory **4** (2025), 101–216. Locators marked “preprint” refer to arXiv:2309.15692v2 (19 December 2024); the other locators use journal pages. [Published article](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf), [preprint](https://arxiv.org/pdf/2309.15692v2).
- John Rognes and Charles Weibel, *Two-primary algebraic K-theory of rings of integers in number fields*, J. Amer. Math. Soc. **13** (2000), 1–54; Appendix A by Manfred Kolster, pp. 45–49. [Author version](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf).
- Bernard Rousseau, *Théorème de Baker–Brumer sur les unités d'un corps de nombres algébriques*, Séminaire de théorie des nombres de Bordeaux (1968–1969), exposé 11, pp. 11-01–11-08. [Public exposition](https://www.numdam.org/article/STNB_1968-1969____A11_0.pdf).
- Romyar Sharifi, *Iwasawa theory*, undated author lecture notes, 189-page edition; locators use its printed pages. [Author notes](https://www.math.ucla.edu/~sharifi/iwasawa.pdf).
- Romyar Sharifi, *Modular curves and cyclotomic fields*, Arizona Winter School notes, especially §§2.5 and 4.2–4.3. [Author notes](https://www.math.ucla.edu/~sharifi/aws-iwasawa.pdf).
- Warren Sinnott, *On the Stickelberger ideal and the circular units of an abelian field*, Invent. Math. **62** (1980), 181–234. [Digitized journal volume](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0062).
- Warren Sinnott, *On the μ-invariant of the Γ-transform of a rational function*, Invent. Math. **75** (1984), 273–282, especially Lemma 1.1, Theorem 1, Propositions 3.1–3.2 and Proposition 4.1. [Digitized journal volume](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0075).
- Lawrence C. Washington, *The non-p-part of the class number in a cyclotomic ℤ_p-extension*, Invent. Math. **49** (1978), 87–97. [Digitized journal volume](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0049).
- Lawrence C. Washington, *Class numbers and ℤ_p-extensions*, Math. Ann. **214** (1975), 177–193, especially Lemma 1 and §IV through Theorem 3, pp. 179–187. [Digitized article](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0214/LOG_0030.pdf).
- Hiroshi Yamashita, *The second cohomology groups of the group of units of a ℤ_p-extension*, Tohoku Math. J. **36** (1984), 75–80, especially §2, Lemma 3; §3, Lemmas 4, 5 and 7; and the theorem in §4, p. 79. [Published article](https://www.jstage.jst.go.jp/article/tmj1949/36/1/36_1_75/_pdf).
