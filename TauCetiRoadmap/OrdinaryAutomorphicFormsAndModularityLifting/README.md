# Roadmap: ordinary automorphic forms and ordinary modularity lifting

**Summary.** Supply the arithmetic inputs and refinements that the Skinner–Wiles ordinary deformation–Hecke route needs and that no earlier roadmap states: the stabilizer-weighted pairings, traces and integral Hilbert realization of definite quaternionic ordinary forms; the ordinary and nearly ordinary comparison of automorphic representations, Ihara's lemma for definite quaternionic forms and the two Eisenstein inputs no earlier roadmap states; the local nearly ordinary deformation refinements and Waldschmidt's unit-rank bound; the Cohen–Macaulay connectedness theorem, single-coefficient solvable descent and the complete-DVR numerical criterion; Hypothesis `H`, Theorem `B`, the abelian preparation, the conditional full-scope lifting under component support, Washington's distinct-prime class-group theorem and the χ₂-good seed over `ℚ`; and the classical interpolation of exported ordinary newforms in Hida families. The Skinner–Wiles route itself, from the nearly ordinary Hecke algebra through pro-modularity to Theorem A and the irreducible-residual theorem, is ClassicalSerreModularity §I.1's and is imported by name.

## Scope and ownership

ClassicalSerreModularity §I.1 owns the Skinner–Wiles route over totally real fields and its specialization to `ℚ`, and this roadmap plans none of it again. By target: `I.1/nearly-ordinary-hecke-algebras` owns Hida's nearly ordinary Hecke algebra `T^{n.o.}(U)` over an even-degree totally real field with its finiteness over `Λ_𝒪`, the pseudo-representation into `T_𝔪` with trace `T(v)` and determinant `Nv·S(v)`, the actual representation at an absolutely irreducible maximal ideal with its nearly ordinary local shape, the permissible (Eisenstein) maximal ideals and their existence, and the trace of tame inertia at auxiliary places acting through `δ_w + δ_w⁻¹`; `I.1/ordinary-control-and-weight-change` owns the groups `U_a`, the weight algebra, the integral module `M_∞(U)` with its freeness and coinvariant control, finiteness and torsion-freeness of the Hecke algebra over `Λ_𝒪`, arithmetic specialization and density of weight-two points; `I.1/pseudo-deformation-rings-and-pro-modularity` owns the deformation data `(𝒪, Σ, c, ℳ)`, the deformation and pseudo-deformation rings `R_𝒟` and `R^{ps}_𝒟` with their `Λ_𝒪`-structures, the presentation bound, reducible and dihedral loci, the lattice comparison at one-dimensional primes, pro-modular and nice primes, good data, `(P1)`, `(P2)`, the key proposition through the characteristic-p patching of SW99 §5, the cohomology estimates of §6, nice primes at minimal level, level raising, localized `R = T`, the Main Theorem, the criterion for `(P2)` and Washington's bound for the abelian fields that criterion uses; `I.1/residually-reducible-ordinary-lifting` owns Theorem A over totally real fields with its abelian tower and its `ℚ` specialization; `I.1/residually-irreducible-ordinary-lifting` owns the deformation ring of an absolutely irreducible nearly ordinary residual representation, its presentation and generation by traces, the dihedral locus, the map to the Hecke algebra, pro-modularity with the χ₂-good seed, SW01 Theorem 5.1 over totally real fields and the full-scope theorem over `ℚ` including the imaginary-quadratic branch; `I.1/ordinary-exact-level` owns the exact-level export. SmallRamificationAndAbelianVarietyBaseCases §5.0e owns the small terminal ordinary and level-one cases. Consequently this roadmap has no permissible-ideal, deformation-datum, pseudo-deformation, pro-modularity, nice-prime, patching-axiom, localized `R = T`, Theorem A, Main Theorem or SW01 Theorem 5.1 target, and no `ℚ` specialization of those theorems.

This roadmap owns what that route uses or refines and no earlier roadmap states. Layer 1: the stabilizer-weighted pairing with its Hecke adjoints, the arithmetic level traces and the integral Hilbert realization, with the comparison of Skinner–Wiles' ordinary exponent with the factorial projector. Layer 2: the comparison of ordinary and smoothly ordinary nearly ordinary automorphic representations, the definite-quaternionic Ihara lemmas at their exact level hypotheses, the Newton–Thorne Hilbert weight change, the two Eisenstein inputs that no earlier roadmap states (Chai's integral form and Wiles' vanishing of constant-term-free Eisenstein combinations, §2.12(a)) and the tower-duality inputs; the Deligne–Ribet p-adic L-function with its interpolation and congruences is IntegralIwasawaTheory §§6.0–6.3, the Hilbert Eisenstein series with their constant terms are NoncommutativeAndEquivariantIwasawa §6.1 step 0(c) and §6.22, and the Λ-adic Hilbert families are NoncommutativeAndEquivariantIwasawa §F.5 as imported by PadicFamilies §5.10. Layer 3: the Hecke-side ordinary tangent conditions, the determinant–flag comparison at `n = 2`, Waldschmidt's lower bound for the p-adic rank of units and the nearly ordinary ordered-flag deformation refinements with nonsplit residual data. Layer 4: the Cohen–Macaulay punctured-spectrum connectedness and component-intersection theorem of SW99 Appendix A, single-coefficient solvable descent and the de Smit–Rubin–Schoof numerical criterion over a complete DVR. Layer 5: Hypothesis `H`, the abelian preparation with prescribed residue degrees, Theorem `B`, the conditional full-scope lifting under component support (§5.8), Washington's theorem in its general form and the χ₂-good nearly ordinary seed over `ℚ`. Layer 6: the EPW new quotient of Hida's ordinary Hecke algebra, the Hida-family membership of exported ordinary newforms and the Skinner–Wiles level-lowering base change. Suggested.lean states the connectedness and component-intersection theorems of §4.3, the numerical criterion of §4.20 and the distinct-prime class-group theorem of §5.9.

PadicFamilies, Layers 0a, 0, 4 and 5, owns ordinary projectors, towers, control, freeness, weight algebras and the classical big ordinary Galois representation. The comparisons and EPW new-quotient refinements below add arithmetic compatibility. HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.22 supplies fixed-central-character definite forms, neat levels and integral pairings. GL2AutomorphicRepresentationsAndTransfer §§R17.3.1–R17.3.9, R17.4.8–R17.4.11 and R17.4.16 supplies Jacquet–Langlands, solvable base change/descent and quadratic induction. Sections 1.6, 4.6a and 6.14 specify the additional arithmetic realization, single-coefficient descent and solvable preparation needed here.

LocalGaloisDeformationRings, Layer `F` and Layers 6–8, owns generic deformation functors, Schur representability, local ordinary rings and determinant–flag spectrum comparisons. GlobalGaloisDeformations §§3.4–3.8 owns relative global presentations. DeformationAndDerivedPatchingAlgebra §§3.1–3.2, 5.5–5.6 and 6.6 owns depth, free-module patching and connectedness dimension. The characteristic-p patching datum of SW99 §5, whose ring scalars are only `B_N`, is part of `I.1/pseudo-deformation-rings-and-pro-modularity`; §4.20 states the complete-intersection numerical criterion that its level-raising step uses, and §4.3 proves the Cohen–Macaulay intersection bound.

Existing Mathlib quaternion algebras, restricted products, finite fields, power series, local rings and finite/free modules supply the algebraic carriers. For the commutative algebra `𝒪[t]` the ordinary idempotent is the factorial-powers idempotent of TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants, Layer 2; §1.1 only compares Skinner–Wiles' exponent with it. TauCetiRoadmap.LocalGaloisGroups and ProfiniteArithmetic supply the general local/profinite arithmetic boundaries, and TauCeti's classical modular forms supply their existing Hecke and q-expansion infrastructure. The pairing, trace and realization refinements, the local deformation refinements and the arithmetic inputs listed above are additional targets here; generic local Galois groups, adèles and classical modular-form spaces are not reconstructed.

Washington's distinct-prime abelian cyclotomic class-group bound is stated in §5.9 for every abelian number field and every nested `ℓ`-power tower inside `K(μ_{ℓ^∞})`; `I.1/pseudo-deformation-rings-and-pro-modularity` proves the instances its criterion for `(P2)` uses. Waldschmidt's lower bound for the p-adic rank of units, which gives the unit-rank inputs of the dihedral-locus bound of SW01 Lemma 2.2 and of Theorems A and `B`, is stated in §3.38. Neither a complex-logarithm estimate nor a `μ = 0` theorem in a same-prime tower supplies those two inputs. The full-scope export for `F≠ℚ` in §5.8 is conditional on component support: after the specified solvable preparation, a minimal prime `q⊆ker(x_L)` satisfies `ker(r_{𝒟_L})⊆q`. This explicit Hecke-support hypothesis retains the selected local quotients and is not supplied by the dihedral dimension bound of SW01 Lemma 2.2.

## Conventions

For the Skinner–Wiles constructions, `p` is an odd prime, `F` is totally real, `d = [F:ℚ], 𝒫 = {v₁,…,v_t}` is the set of places over `p`, and `d_i = [F_{v_i}:ℚ_p]`. Fix an identification of algebraic closures `Q̄_p` and `ℂ` when comparing algebraic eigenforms and p-adic Hecke eigenvalues. The quaternionic realization additionally requires `d` even and uses the algebra `D/F` ramified exactly at infinity and split at every finite place. Let `𝒪` be the ring of integers of a finite extension of `ℚ_p`, with uniformizer `ϖ`, fraction field `K` and finite residue field `k`. Complete local coefficient rings are Noetherian 𝒪-algebras with specified residue field. Equal-characteristic `k[[λ]]` enters only after reduction at a characteristic-p prime and in the patching argument, not as a replacement for `𝒪` in the arithmetic lifting hypotheses.

Write `X(U) = D×\Gᴰ(𝔸_f)/U` and identify `H⁰(X(U),R)` with functions `X(U) → R`. The stabilizer order is `c_U(x)`. The arithmetic pairing is `Σ_x c_U(x)⁻¹ f(x)g(x)`, defined over `R` when these orders are units. Over a field the finite-set pairing formula is defined for any counts, but perfectness requires every cast count to be nonzero; the inverse-of-zero convention does not remove this requirement. On one point over `ℚ, c=2` and `f=3,g=4` give 6; `c=0` gives 0 and a degenerate pairing. Over `𝔽₂, c=2` also gives zero. A unit-stabilizer two-point set gives `2·4+3·5=23`.

For a finite-set map `π:Y → X`, restriction is `f ↦ f∘π` and the fibre trace is `g ↦ (x ↦ Σ_{π(y)=x}g(y))`, with no division by the fibre size. Two values 2 and 3 in one fibre have trace 5, and an empty fibre has trace 0. The arithmetic level trace sums level cosets, so a class `y` above `x` occurs `c_U(x)/c_V(y)` times; it agrees with the unweighted fibre trace when the effective stabilizers are free. For `c_U(x)=2,c_V(y)=1` and `g(y)=3` it has value 6, making the target weighted value `(1/2)·6=3` equal the source value. The superscript `⁺` denotes the action through the Hecke adjoint `t⁺`, not a norm-factor subspace or a central-character condition. A central double coset `z` translates in one direction, and its adjoint translates by `z⁻¹`. The completed group-ring duality uses the coefficient of the identity, not the augmentation that sends every group element to 1.

Normalize the residually reducible representation as `ρ_c = (1 c;0 χ)`, with `χ` totally odd and `χ|D_i ≠ 1`. Require `c ≠ 0` where the Schur condition is used. Its ordinary local flag has sub-character reducing to `χ` and quotient reducing to 1; local admissibility permits that flag by requiring the residual extension to split at p. Distinguish this local flag from the displayed global upper-triangular presentation. With an irreducible residual representation use the specified local characters `χ₁⁽ⁱ⁾,χ₂⁽ⁱ⁾` and the χ₂-good ordinary modular seed. Distinctness is on `D_i`; it need not hold on inertia. These are the deformation data of SW99 §2.1 and SW01 §2, owned by ClassicalSerreModularity §I.1; they are recalled here because §§3.38, 3.39, 5.1a, 5.3 and 5.8 use them.

The weight algebras `Λ′_𝒪` and `Λ_𝒪` have determinant variables `X_i` and `T_i` respectively, and quotient-character variables `Y_j⁽ⁱ⁾`. A coordinate `1+T_i` is sent to `detρ(γ_i)`, not its inverse. If the inertia lattice has indices `p^{r_i}, Λ_𝒪` is free of rank `p^{Σ r_i}` over `Λ′_𝒪`. One index `r=1` at `p=5` gives rank 5, and all `r_i=0` give rank 1.

Twisting by `Ψ` multiplies trace by `Ψ` and determinant by `Ψ²`; a local quotient eigenvalue `T₀(λ)` becomes `Ψ(λ)T₀(λ)`. For `Ψ(λ)=2` and eigenvalue 3 it becomes 6, rather than 3/2. All level maps, deformation quotient maps, specialization maps and completion maps below must respect these weight coordinates.

The Skinner–Wiles/classical convention has `detρ_f=ψ ε^{k−1}`. The dual regular-algebraic convention used by BLGG, BCGP and Newton–Thorne has weight-zero Hodge–Tate weights `{0,1}` and determinant `ε⁻¹` for trivial central character. Dualization reverses a filtration: `0→ε→V→1→0` becomes `0→1→V∨→ε⁻¹→0`. The Newton–Thorne weight change has weights `{0,2}` and determinant `ε⁻²ω`, whose reduction is `ε̄⁻¹`. Translate the representation and its chosen line together when switching conventions.

`R = T`, where ClassicalSerreModularity §I.1's statements are recalled below, means the displayed minimal-level or all-level map after the stated weight base change, localization and completion at a nice prime, not an isomorphism of the unrestricted global rings. Likewise, the determinant–flag comparison is an assertion about points, underlying spectra and components on a distinct-character open subset; it does not identify nonreduced coefficient functors.

## Exact supplier contracts

Mathlib is pinned at `6b7abb3` and Tau Ceti at `a91d3aa`. The following are the mathematical inputs, with their coefficient, residual and normalization hypotheses retained. Sections §1.6, §2.12, §3.39, §4.6a, §4.20, §5.10 and §6.14 supply the arithmetic refinements specified here.

### From Mathlib and Tau Ceti

Use `Module.Free` (Mathlib.LinearAlgebra.FreeModule.Basic), `Module.Finite` (Mathlib.RingTheory.Finiteness.Defs), `MvPowerSeries` (Mathlib.RingTheory.MvPowerSeries.Basic), `IsLocalRing` (Mathlib.RingTheory.LocalRing.Defs), `IsIdempotentElem` (Mathlib.Algebra.Group.Idempotent), `FiniteField.pow_card_sub_one_eq_one` (Mathlib.FieldTheory.Finite.Basic), and `Fintype.sum_fiberwise`, the additive declaration generated by `Fintype.prod_fiberwise` (Mathlib.Algebra.BigOperators.Group.Finset.Basic). A basis, finite generation, Noetherianity, completeness and ordinary arithmetic control are separate assertions. The finite-field exponent identity requires a nonzero element; the empty function module has a vacuously perfect pairing.

The carriers `IsDedekindDomain.FiniteAdeleRing` (Mathlib.RingTheory.DedekindDomain.FiniteAdeleRing), `NumberField.IsTotallyReal` (Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex), `QuaternionAlgebra` (Mathlib.Algebra.Quaternion), `NumberField.Units.rank` (Mathlib.NumberTheory.NumberField.Units.DirichletTheorem), `PadicComplex` (Mathlib.NumberTheory.Padics.Complex) and `CharacterModule` (Mathlib.Algebra.Module.CharacterModule) supply finite adèles, real signatures, quaternion algebras, unit ranks, the completed algebraic p-adic field and algebraic additive characters. `CharacterModule` alone does not supply 𝒪-linear `K/𝒪` duality or compact/discrete topological duality; those are supplied below. The Iwasawa logarithm required by §3.38 is supplied by DirichletPadicLFunctions §0.6, with its nonzero domain and normalization `log_p(p)=0`.

Tau Ceti supplies `HeckeRing.GL2.Newform` and `HeckeRing.GL2.Newform.qExpansion_coeff_one` (TauCeti.NumberTheory.ModularForms.Newforms.Newform), `TauCeti.Newform.heckeTDiamondCuspNewCharacter` (TauCeti.NumberTheory.ModularForms.Newforms.Hecke.Algebra), and `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` (TauCeti.NumberTheory.ModularForms.Newforms.StrongMultiplicityOne). Use these classical newforms, their normalized q-expansions and Hecke characters at their existing scope. The Hilbert ordinary towers and Galois comparisons use the arithmetic contracts below.

### From roadmaps on main

- **ClassFieldTheory**, Layers 7 and 11–13: local reciprocity with arithmetic Frobenius normalization and the global Artin map identifying class groups with unramified abelian Galois groups, used in §§3.38, 4.6a, 5.1a and 5.9.
- **ModularForms**, Layers 2–5 and 10 and Worked examples, “Level 11, weight 2”: classical Hecke operators, newforms and conductor, and the dimension-one level-11 comparison. Explicit level-11 coefficients and Eisenstein-index data in §6.5 are hypotheses of the worked example.
- **LocalGaloisGroups**, Layer 0 and Conventions, and **ProfiniteArithmetic**, §§0.2–0.4, 1.1–1.3: local absolute Galois groups, their inertia and cyclotomic conventions, profinite coefficient projections and continuous pro-p powers.
- **SchemeAndStackFoundations**, §4.4: Schlessinger's four conditions, used for the fibre-product stability of the ordered-flag condition in §3.39.
- **Chebotarev** (a completed roadmap), Layer 10: Dirichlet-density Chebotarev, used to choose the auxiliary split prime in §5.1a.
- **DiophantineApproximationAndTranscendence**, Layer 3: the complex several-variable auxiliary-function, Schwarz-lemma and Schneider–Lang machinery. Section 3.38 proves the p-adic criterion and unit-rank consequence needed here.

### From ClassicalSerreModularity

Use `I.1/nearly-ordinary-hecke-algebras` for Hida's nearly ordinary Hecke algebra `T^{n.o.}(U)` over an even-degree totally real field with `p` odd and `D` ramified exactly at infinity, its continuous pseudo-representation with trace `T(v)` at arithmetic Frobenius and determinant `Nv·S(v)`, the actual representation with nearly ordinary local shape at an absolutely irreducible maximal ideal, the existence of permissible (Eisenstein) maximal ideals for a totally odd p-distinguished `χ`, and the trace of tame inertia at an auxiliary place acting through `δ_w + δ_w⁻¹`. Use `I.1/ordinary-control-and-weight-change` for the integral module `M_∞(U)`, its freeness and coinvariant control under the free-action hypothesis, finiteness and torsion-freeness over `Λ_𝒪`, and arithmetic specialization at finite-order diagonal-unit characters. Use `I.1/pseudo-deformation-rings-and-pro-modularity` for the deformation data `𝒟 = (𝒪, Σ, c, ℳ)` with `χ` totally odd and p-distinguished and `c` admissible, permissible extensions, the rings `R_𝒟` and `R^{ps}_𝒟` with their `Λ_𝒪`-structures, the presentation bound `g − r ≥ d + δ_F − 2t − 3#ℳ`, the reducible and dihedral loci, pro-modular and nice primes, good pairs, `(P1)`, `(P2)`, the characteristic-p patching datum of SW99 §5, localized `R = T` at nice primes, the Main Theorem, the criterion for `(P2)` and Washington's bound for the abelian fields that criterion uses. Use `I.1/residually-reducible-ordinary-lifting` for Theorem A over a totally real field abelian over `ℚ`, with its hypotheses `ρ̄^{ss} ≅ χ₁ ⊕ χ₂`, `F(χ₁/χ₂)` abelian over `ℚ`, `(χ₁/χ₂)` totally odd and p-distinguished, the nearly ordinary local shape with finite-order inertial quotient and `det ρ = ψε^{k−1}`, together with its abelian tower and its `ℚ` specialization. Use `I.1/residually-irreducible-ordinary-lifting` for the deformation data `(𝒪, Σ, ℳ)` of an absolutely irreducible nearly ordinary `ρ₀`, the presentation of SW01 Proposition 2.1, generation by traces, the dihedral locus of SW01 Lemma 2.2 at its totally real inducing-field scope, the permissible level `U_{𝒟_Q}`, the surjection `R_{𝒟_Q} ↠ T_{𝒟_Q}` of SW01 Proposition 3.4, good pairs and property `(P)`, SW01 Theorem 5.1 over totally real fields under its hypotheses (5.1) with a χ₂-good nearly ordinary seed, and the full-scope theorem over `ℚ` with the imaginary-quadratic branch. Use `I.1/ordinary-exact-level` for the weight and conductor of the exported classical newform. Every use below retains these hypotheses; nothing here asserts a totally real theorem beyond those targets.

### From IntegralHeckeAndGaloisDeterminants

Use Layer 1 for coefficient descent of a representation with integral traces (Carayol), used in §6.3's integral model. Section 2.3, “Factorial powers”, supplies the idempotent `e=lim t^(n!)` of a finite commutative algebra over a complete Noetherian local ring with finite residue field. Section 1.1 compares the Skinner–Wiles exponent with this idempotent; PadicFamilies §0a.14 specializes it to a possibly noncommutative finite algebra through its commutative subalgebra generated by `t`.

### From ArithmeticGaloisDuality

Use §R02.4.4 for the global Euler characteristic formula, §R02.5.1 for Selmer local conditions and the Greenberg–Wiles formula, and §D8.1 for the adjoint first-order calculation. Section R02.4.6 supplies finite-order local-character extension with the exact Grunwald–Wang obstruction and its possible doubling of global order, used in §5.1a. The `C/λ^m` tangent comparison with the actual ordinary local conditions is a target of §3.39. These inputs enter §§3.36, 3.39 and 5.1a.

### From DeformationAndDerivedPatchingAlgebra

Use §§3.1–3.2 for finite resolutions, depth and Auslander–Buchsbaum, §6.6 for connectedness dimension at its stated bound, and §7.6 for the complete-DVR fraction-quotient dual. The Cohen–Macaulay intersection estimate of §4.3 has the stronger bound of SW99 Appendix A.1–A.2. Its §5.6 free-module patching consumer, `patching_surjection_iso`, supplies `R ≃ T`, module freeness and a complete-intersection presentation when a patching system supplies its scalar maps, equal variable counts and positive-rank free modules; it permits equal characteristic and residue characteristic two. The Skinner–Wiles characteristic-p datum, whose ring scalars are only `B_N` while the modules carry an `A_N`-action, is part of ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity`, which cites §§5.2–5.6 for it; §4.20 records why that datum is not an instance of the free-module consumer and states the complete-intersection numerical criterion, which does not follow from balance. The independent-level patching interface follows the Imperial College London FLT project.

### From PadicHodgeTheory

Use §6.4 for the rank-two crystalline unit-root criterion and the Khare–Wintenberger ordinary branches, including the Berger–Li–Zhu weight-(p+1) branch. Retain each field, Hodge-type, determinant and residual-quotient hypothesis. The general labelled ordinary and dual/twist dictionary is §3.6. These inputs enter §§6.3 and 6.4.

### From HilbertModularVarietiesAndShimuraCurves

Use §§R18.3.1–R18.3.7 for the definite class set with central quotient, fixed-central-character forms, neat reduction, the integral stabilizer-weighted pairing, split Hecke normalization and norm-factor support, including the norm-fibre comparison and `Nrd(D×)=F_+×` of §R18.3.7; §§R18.3.8–R18.3.9 for Ihara; §§R18.3.12–R18.3.14 for auxiliary-level freeness; and §R18.3.22 for Jacquet–Langlands realization after inverting the coefficient uniformizer. Keep the effective stabilizer-unit hypothesis. PadicFamilies §§5.2–5.3 supplies the central-unquotiented Skinner–Wiles class set, p-operators and integral ordinary Hecke-image identification, and §5.9a supplies the integral expansion lattice with its flat coefficient-change theorem. Section 1.6 compares these realizations, while §§1.4–1.5 compare their actual pairings and level maps. The arithmetic specialization of Ihara in §§2.9–2.10 retains its ray-class splitting and exact level hypotheses.

### From GL2AutomorphicRepresentationsAndTransfer

Use §§R16.2.1, R16.2.6–R16.2.7 for newvectors and local unit-eigenline calculations, §§R16.6.1–R16.6.5 for Hilbert algebraic weights and the classical/adelic Hecke dictionary, and §§R17.3.1–R17.3.9 for global Jacquet–Langlands, the reduced-norm exception and definite cuspidal transfer. Section 1.6 separates this characteristic-zero module comparison from the supplied integral ordinary Hecke-image comparison. Use §§R17.4.8–R17.4.11 for solvable tower base change, cyclic descent with its finite-character fibre and prescribed splitting. Section 4.6a constructs the single-coefficient descent needed here from those transfer theorems and Hilbert Galois attachments. Section 6.14 supplies the Skinner–Wiles level-lowering base change.

### From GlobalGaloisDeformations and LocalGaloisDeformationRings

LocalGaloisDeformationRings §§F.1.3, F.2.1–F.2.2, F.2.5 and F.2.7 supply strict deformations, the Galois finiteness condition, Schur representability and trace generation; GlobalGaloisDeformations §§3.4–3.8 supply global type representability and the relative framed presentation with tangent and obstruction bounds. Section 3.39 supplies the unframed Schur presentation and variable-character ordered-flag refinements on top of them. LocalGaloisDeformationRings §6.2 supplies the split p-distinguished nearly ordinary versal ring, §6.3 supplies full-flag deformations with fixed inertial characters under its character-ratio exclusions, and §§7.1–7.6 supply the determinant–flag spectrum comparison used in §3.37. The variable-character ordered-flag condition with nonsplit residual data is specified in §3.39. A spectrum comparison does not identify nonreduced deformation functors.

### From AlgebraicModularFormsAndSerreWeights

Use §7.5's predicates `ArisesFrom(f, p, ρ̄)` and `IsModular(p, ρ̄)` in §5.10 over `ℚ`. The former uses one coefficient ring map matching both Frobenius coefficients; the latter quantifies over the form with its weight and level. The integral-model comparison of §7.5 retains absolute irreducibility and the coefficient-place identifications. The χ₂-good ordinary refinement is an additional local requirement here. For a general totally real field §5.8 retains its Hilbert automorphic seed.

### From IntegralIwasawaTheory and NoncommutativeAndEquivariantIwasawa

IntegralIwasawaTheory §§6.0–6.3 supplies the Deligne–Ribet pseudomeasure of a totally real field with its distribution congruences, its arithmetic interpolation `κ^rψ(g) = L_S(1 − r, ψ)` for finite `ψ` and `r ≥ 1`, and its Euler factors at depleted places; §2.12(a) uses these as the p-adic L-function `L_p(F, s, χω)`, its interpolation of `L^{(p)}(F, 1 − n, χω^{1−n})` and the integrality behind SW99 (4.17). NoncommutativeAndEquivariantIwasawa §6.1 step 0(c) and §6.22 supply the Hilbert Eisenstein series `G_{k,ε}` with their constant terms at every cusp and the q-expansion principle, for odd `p`; this is the constant-term formula SW99 (3.10) of §2.12(a) in the Deligne–Ribet normalization. NoncommutativeAndEquivariantIwasawa §F.5 supplies the Λ-adic Hilbert coefficient families, which PadicFamilies §5.10 imports as `M(𝔫, χ)`; Wiles' Λ-adic forms are their Eisenstein members. The two Eisenstein statements of §2.12(a) that these suppliers do not state, Chai's integral form and Wiles' vanishing of constant-term-free Eisenstein combinations, are targets here.

### From PadicFamilies

Use §§0a.1–0a.15 for ordinary projectors and their finite/profinite exactness, §§0.11, 0.13 and 0.15 for Hida control, arithmetic specialization and primitive components over `ℚ`, and §4.1 for the classical big ordinary representation. Sections 5.1–5.9 supply the totally real weight algebra, quaternionic projector and towers, nearly ordinary Hecke algebra, duality, projective descent and freeness, finite torsion-free Hecke algebra, higher-weight control and density of algebraic primes. Use the full torsion-character control and projective-descent theorem of §5.6, together with the integral moment comparison of §5.8. The Λ′-rank is the rank of its augmentation fibre; multiplying a trivial torsion-character rank by the torsion-group order requires equal ranks on all torsion-character factors and is not inferred from projectivity. No freeness of the Hecke algebra over weight space is assumed.

Use §§5.9a–5.10 for integral Hilbert expansions and Λ-adic Hilbert forms. The Chai and Wiles Eisenstein targets and the arbitrary-totally-real Hilbert specialization of determinant `ε⁻²ω` are specified in §2.12; the Deligne–Ribet p-adic L-function and the Hilbert Eisenstein series are imported from the Iwasawa roadmaps named above. The EPW new quotient is specified in §6.3 with its finite, reduced, torsion-free and classical-prime étaleness properties; the existing family representation is supplied, and its new-quotient conductor, coinvariant and integral-model refinements belong here. Superscript `⁺` denotes the adjoint Hecke action on the same module, as in §5.5 of PadicFamilies; it never denotes a norm-factor subspace.

### From AutomorphicGaloisRepresentations

Use §1.5 for rank-two classical newform realization; §§3.11–3.14 for the Hilbert normalization dictionary, Hodge–Tate property, determinant, total oddness, uniqueness and absolute irreducibility; §§4.10–4.12 for the finite-weight nearly ordinary packet, the Skinner–Wiles representation with quotient character specified by `T_y` and `T₀(v)`, and local compatibility away from `p`; §4.4 for all-Hilbert compatibility, including Steinberg and supercuspidal places; §§4.5–4.9 for coefficient-prime compatibility with the stated Hodge and quotient hypotheses; §5.1 for ordinary refinement and its stable lattice; and §6.4 for classical conductors and Euler factors. Section 2.1 uses the supplied full quotient character `δ_v(u)=ν_v(u)∏_ττ(u)^(−v_τ)` for the ordinary predicate, and names Skinner–Wiles' smooth-factor condition smooth ordinarity. The representation and chosen ordinary line are translated together under the dictionary. These are finite-weight inputs to §2.11, not consequences of an ordinary lifting theorem. Sections 3.15–3.16 supply the CM/virtual-reducibility dichotomy used for restriction to totally real fields in §4.6a.

### From SerreWeightAndLevelOptimisation and DirichletPadicLFunctions

SerreWeightAndLevelOptimisation §§3.1–3.6 and 4.7–4.8 supply the residual ordinary and weight/level optimization interfaces at their exact characteristic and local-type hypotheses. The χ₂-good seed in the form of Diamond Theorem 6.4 used by SW01 Theorem 5.2 is the target of §5.10. DirichletPadicLFunctions §§0.4–0.6 and Layers 2–3 supplies generalized Bernoulli comparison, abelian-character interpolation and the Iwasawa logarithm on `ℂ_p` to §§3.38 and 5.9; that section proves the distinct-prime character-sum nonvanishing and class-group bound.

## How to read the build

The first layer compares ordinary projectors and the definite Hecke realization. The second compares ordinary and nearly ordinary automorphic representations, proves the definite-quaternionic Ihara lemmas and the Newton–Thorne weight change, and supplies the Chai and Wiles Eisenstein inputs and the duality inputs. The third supplies the local nearly ordinary deformation refinements and Waldschmidt's unit-rank bound that the dihedral-locus and Theorem `A/B` dimension counts use (§3.38). The fourth proves the Cohen–Macaulay connectedness theorem, single-coefficient solvable descent and the numerical criterion. The fifth gives the arithmetic inputs and the conditional lifting conclusions: Hypothesis `H` and Theorem `B`, the abelian preparation, the complex-place case conditional on component support, Washington's theorem and the χ₂-good seed over `ℚ`. The sixth records classical interpolation and solvable preparation. The Skinner–Wiles route that consumes Layers 1–4 and proves Theorem A and SW01 Theorem 5.1 is ClassicalSerreModularity §I.1; its targets are cited where a section here refines or feeds them.

The internal construction order is independent of section numbering. Use PadicFamilies §§5.2–5.3 before Layer 1; build §1.6's additional arithmetic refinements before §§1.2,1.4–1.5. Build §2.12(a),(d) before §2.9, and §2.12(b) before §2.11; §2.12(c) records the export of §6.3. Build §3.39(a),(b), taking residual representations and selected local flags as input, before §§3.36–3.37. Build §4.3 from its connectedness theorem; §4.20 is independent of the other sections. Build §5.1a before §5.3, and §3.38 before §§5.3 and 5.8.

## Layer 1: Ordinary projectors and definite Hecke comparison

### 1.1 Skinner–Wiles' exponent gives the factorial projector

Let A be an 𝒪-algebra that is a finite 𝒪-module and `t ∈` A. Let `m ≥ 1` be divisible by `[k_i` : `F_p]` for every residue field `k_i` of the commutative finite 𝒪-algebra `𝒪[t]`. Then `lim_{n→∞} t^{p^n(p^m − 1)}` exists in `A` and equals the ordinary idempotent `e_t = lim_n t^{n!}` of PadicFamilies §0a.14. In particular Skinner–Wiles' operator `e = lim_n T₀(p)^{p^n(p^m−1)}` is PadicFamilies §0a.14's ordinary projector of `T₀(p)`.

`𝒪` complete with finite residue field; A finite over `𝒪` (so `𝒪[t]` is a finite product of complete local rings).

`𝒪[t] = ∏_i 𝒪[t]_{m_i}`, each factor complete local with residue field `k_i ⊆ F_{p^m}`.

If `t` is a unit in the i-th factor, its residue lies in `k_i^×` with `#k_i = p^{f_i}, f_i | m`, so `t^{p^m−1} ∈ 1 + m_i` (FiniteField.pow_card_sub_one_eq_one, since `p^{f_i} − 1` divides `p^m − 1`), and `(1 + x)^{p^n} ∈ 1 + m_i^{n+1}` for `x ∈ m_i` since `p ∈ m_i`; so `t^{p^n(p^m−1)} → 1` there. If `t ∈ m_i, t^N → 0`.

The limit is therefore the idempotent of the factors where `t` is a unit, which is `e_t` by PadicFamilies §0a.14's characterization (`t` invertible on `e_tA`, topologically nilpotent on `(1 − e_t)A`).

**Checks.**

- No second projector API is built: SW's exponent is compared with PadicFamilies §0a.14's `n!`.
- For `m=0` every exponent is zero: a nilpotent element gives 1 rather than its zero ordinary projector, so `m≥1` is essential.
- The coefficient computations `2²⁰=1` in `ℤ/25` and `5³=0` in `ℤ/125` test both factors.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.2, p. 32 (Numdam PDF page 29; printed page `=` PDF page `+ 3).`)

*Needs:* PadicFamilies:§0a.14; PadicFamilies:§§0a.1–0a.15; mathlib:IsIdempotentElem; mathlib:FiniteField.pow_card_sub_one_eq_one.

### 1.2 The ordinary projector kills norm-factoring forms

Let `I^D(U_a, ℤ) ⊆ H⁰(X(U_a), ℤ)` be the functions factoring through the reduced norm `ν_D` : `G^D(A_f)/U_a → A_f^×/ν_D(U_a)`, for a `≥ 1`. Then `e` annihilates `I^D(U_a, ℤ) ⊗ R` for every 𝒪-module `R`.

a `≥ 1`, so that `U_{a,v}` is pro-p at each `v |` p.

For `f = h ∘ ν_D` and `g = (1 0`; `0 ϖ_p), T₀(p)f(x) = Σ_i f(x g_i`) over `U_a g U_a = ⊔ g_i U_a`, and `ν_D(x g_i) ≡ ν_D(x)ν_D(ϖ_p) mod ν_D(U_a)` for all `i`.

So `T₀(p)f = N·(f` translated by `ν_D(ϖ_p)`) with `N = [U_a` : `U_a ∩ gU_ag^{−1}]`, a positive power of p.

First work on the finite 𝒪-lattice of norm-factoring forms, where repeated multiplication by the positive p-power `N` is topologically nilpotent and the ordinary projector is zero. The induced projector then annihilates its tensor product with every 𝒪-module `R`; no completeness or topology on an arbitrary `R` is assumed.

**Checks.**

- Only the cuspidal quotient `S^D(U_a) = H⁰/I^D` survives the projector; the Jacquet–Langlands comparison is on `S^D`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.2, p. 34 (Numdam PDF page 31; printed page `=` PDF page `+ 3).`)

*Needs:* PadicFamilies:§5.2; HilbertModularVarietiesAndShimuraCurves:§§R18.3.1–R18.3.22; §1.6.

### 1.3 The supplied quaternionic/Hilbert Hecke identification

Use PadicFamilies §§5.2–5.3 for `T₂(U_a,𝒪)=eT(U_a,𝒪)`, its identification with Skinner–Wiles' ordinary Hilbert Hecke algebra, the transition maps, and `T_∞(U,𝒪)`. With its conventions, `X_i↦S_{x_i}−1` and `Y_j⁽ⁱ⁾↦T_{y_j⁽ⁱ⁾}−1`. The hypotheses are even totally real degree, odd `p`, `D` ramified exactly at infinity, and maximal level at `p` before forming the p-power tower. This section fixes the supplied identification used in Layer 2 and recalled by ClassicalSerreModularity §I.1.

### 1.4 The stabiliser-weighted pairing and Hecke adjoints

For open compact `U` put Ū `= U/(U ∩ F^×)` and, for `x ∈ G^D(A_f), c_U(x) = #{u ∈` Ū : xu `= x}` in `D^×\G^D(A_f)`. For an 𝒪-algebra `R` in which every `c_U(x)` is invertible, ⟨f, `g⟩_U = Σ_{x ∈ X(U)} c_U(x)^{−1} f(x)g(x)` is a perfect R-bilinear pairing on `H⁰(X(U), R)`, and `f ↦` ⟨f, `·⟩_U` is an isomorphism `H⁰(X(U), R) ≅ Hom_R(H⁰(X(U), R), R)` functorial in `R`. It satisfies ⟨[UgU]f, `h⟩_U =` ⟨f, `[Ug^{−1}U]h⟩_U` for `g ∈ G^D(A_f)`, so every `t ∈ T(U_a, 𝒪)` has an adjoint `t⁺`, and `t ↦ t⁺` is an 𝒪-algebra isomorphism `T(U_a, 𝒪) ≅ T⁺(U_a, 𝒪)`. Writing `H⁰(X(U_a), R)⁺` for `H⁰` with `t` acting by `t⁺`, the pairing induces a perfect pairing of `T₂(U_a`, 𝒪)-modules `eH⁰(X(U_a), R) × eH⁰(X(U_a), R)⁺ → R`.

Every `c_U(x)` invertible in `R` (automatic for `R` an 𝒪-algebra once a is large, `R18.3`). Define the Skinner–Wiles pairing directly on the central-unquotiented `X(U)`. To compare with HilbertModularVarietiesAndShimuraCurves §R18.3.5, first restrict to matching central-character submodules and identify the central quotient. For trivial central character and trivial coefficients, write `C=A_f×/(F×(U∩A_f×))`, a finite group acting on `X(U)`, and `q:X(U)→X(U)/C`. For its stabilizer `C_x`, prove the exact sequence `1→Γ_X(x)→Γ_central(qx)→C_x→1`. Thus `c_central(qx)=c_U(x)·#C_x` and the fibre has size `#C/#C_x`. When both stabilizer orders are units in `R`, the pairings satisfy `B_X(q* f,q* g)=#C·B_central(f,g)`. No division by `#C` is made integrally.

Perfection on `X(U)` follows by the point-indicator basis with diagonal Gram entries `c_U(x)⁻¹`; reversing the finite double-coset correspondence gives the adjoint identity. The central-quotient comparison follows by the stabilizer exact sequence and orbit–stabilizer counting, rather than a literal identification of the two carriers.

`t ↦ t⁺` is the transpose for this pairing; it is an 𝒪-algebra isomorphism `T(U_a, 𝒪) ≅ T⁺(U_a, 𝒪)` because the generators are double cosets.

`e⁺` is the adjoint idempotent; `eH⁰` and `(1 − e⁺)H⁰` are orthogonal, so the pairing restricts to a perfect pairing between `eH⁰` and `e⁺H⁰ = eH⁰(X(U_a), R)⁺`.

Provide the following operations and compatibility statements.

- The stabiliser count: `c_U(x)` is the order of the stabiliser of `x` in `Ū`.
- The stabilizer-weighted pairing: ⟨f, `g⟩_U = Σ c_U(x)^{−1} f(x)g(x)`.
- Perfection: `H⁰ ≅ Hom_R(H⁰, R)` when all `c_U(x)` are units. The full coefficient-ring form on a finite set `X` is: for unit weights `c:X→Rˣ` over any commutative ring and every linear functional `ℓ`, there is a unique `f` with `Σ_x c(x)⁻¹f(x)g(x)=ℓ(g)` for every `g`. Taking the units to be the stabilizer counts gives the arithmetic pairing; over a field this is the displayed finite-set pairing.
- Hecke adjunction: `⟨[UgU]f, h⟩ = ⟨f, [Ug^{−1}U]h⟩`.
- The adjoint map `t ↦ t⁺` is an isomorphism `T(U_a, 𝒪) ≅ T⁺(U_a, 𝒪)`.
- Ordinary perfection: the restricted pairing `eH⁰ × eH⁰⁺ → R` is perfect.
- Central scaling: for parallel weight 2, trivial coefficients and trivial central character, with both effective stabilizer orders units, `B_X(q* f,q* g)=#C·IntegralPairing(f,g)` on the central quotient.
- Nondegeneracy: For any finite `X` and field `R`, the coefficient pairing is nondegenerate if every cast count `c(x)` is nonzero. Testing against the point indicator at `x` recovers `f(x)`. The arithmetic integral assertion requires unit counts.

**Checks.**

- Free effective stabilizers: If Ū acts freely (all `c_U(x) = 1`), ⟨f, g⟩ `= Σ f(x)g(x)` and the Gram matrix in the basis of point indicators is the identity.
- On `X(U)` one point with stabiliser order `c`: ⟨f, g⟩ `= c^{−1}fg`, perfect `iff c` is a unit in `R`; over `𝒪` with `p | c` the pairing is not defined.
- If the count at a point vanishes in the coefficient field, its point indicator is nonzero but pairs to zero with every function. Positive natural-number counts divisible by the characteristic have this defect too.
- For central `g = z ∈ A_f^×`, [UzU] is translation by `z` and its adjoint is translation by `z^{−1}`.
- The pairing is not Hecke-equivariant; only the twisted module `H⁰(·)⁺` is paired.
- For a free central orbit of two points with unit stabilizers and pulled-back values `f=2,g=3`, `B_X=12=2·6`, whereas the central pairing is 6. If `p` divides `#C`, the scaling identity remains valid but does not permit integral division by `#C`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.2, p. 34 (Numdam PDF page 31; printed page `=` PDF page `+ 3).`)

*Needs:* PadicFamilies:§5.3; HilbertModularVarietiesAndShimuraCurves:§R18.3.5.

### 1.5 Trace maps between levels

For `V ⊆ U` open compact and Ū `= ⊔_i V̄x_i, tr(V, U)` : `H⁰(X(V), R) → H⁰(X(U), R), tr(V, U)f(x) = Σ_i f(x x_i^{−1})`. For `V = U_b, U = U_a (b ≥ a)` it is independent of the coset representatives and commutes with `t` and `t⁺` for `t ∈ T₂(U_b, 𝒪)` (acting on level `U_a` through the transition map), hence with `e`; and whenever both pairings are defined, ⟨f, `tr(V, U)h⟩_U = ⟨f|_V, h⟩_V` for `f ∈ H⁰(X(U), R)` and `h ∈ H⁰(X(V), R)`: restriction and trace are adjoint.

`b ≥` a (`U_b` is normal in `U_a`, so the representatives can be chosen in `U_a` and the sum is well defined).

Independence: `U_b` is normal in `U_a` and `f` is right U_b-invariant.

Hecke compatibility: `T₀(p), T₀(p_i), T(ℓ), S(ℓ)` and `G(U_b)` commute with right translation by `U_a/U_b`.

For `x∈X(U)` and `y` above `x`, the number of coset representatives giving `y` is `c_U(x)/c_V(y)`. Thus the arithmetic trace at `x` is `Σ_{y↦x}(c_U(x)/c_V(y))h(y)`, and division by `c_U(x)` gives precisely `Σ_{y↦x}h(y)/c_V(y)`. This proves weighted adjunction. For free effective stabilizers this is the unweighted finite-set trace.

Provide the following operations and compatibility statements.

- For a finite map `π:Y→X` and additive coefficients, `tr_π(g)(x)=∑_{π(y)=x}g(y)`. This is the unweighted finite-set shadow; the arithmetic trace also counts stabilizer multiplicities.
- For `π=id_X`, the fibre trace is `g`.
- For commutative semiring coefficients, `∑_y f(πy)g(y)=∑_x f(x)tr_π(g)(x)`.
- For finite maps `Z→Y→X` and additive coefficients, trace along the composite equals successive unweighted fibre traces. For the arithmetic level trace the corresponding multiplicity factors `c_U/c_V` and `c_V/c_W` multiply to `c_U/c_W`.

**Checks.**

- If Y=Fin `2, X` is a singleton and `g=(2,3)`, the trace at the single point is 5; it is a sum, not an average.
- For π:Unit→Fin 2 with `π(*)=0` and `g(*)=7`, the trace at 1 is 0.
- For `π=id` on a finite type, every fibre is a singleton and the trace is `g`.
- An empty source gives the zero function on every finite target.
- The traces are the transition maps of `M_∞`; the pullbacks are those of `H_∞`.
- For one target class of stabilizer order 2 and one source class of order 1, the trace of value 3 is 6, not 3; the weighted target pairing is then `(1/2)·6=3`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.2, p. 35 (Numdam PDF page 32; printed page `=` PDF page `+ 3).`)

*Needs:* §1.4; HilbertModularVarietiesAndShimuraCurves:§§R18.3.1–R18.3.22; §1.6; mathlib:Fintype.prod_fiberwise.

### 1.6 Arithmetic class sets and integral Hilbert realization

Use PadicFamilies §§5.2–5.3 for the central-unquotiented class set `X(U)=D^×\\G^D(A_f)/U`, its finiteness, finite central fibres and `Z(U)` action, the normalized p-operators and level maps, and the quaternionic/Hilbert ordinary Hecke-algebra identification. The hypotheses are even totally real degree, odd `p`, and `D` ramified exactly at infinity.

Construct the additional arithmetic refinements: (d) trivial effective stabilisers `c_{U_a}(x)=1` for all large a, and free action after one auxiliary level (Skinner–Wiles Lemma 3.5 and Corollary 3.6); (e) freeness over `𝒪/πⁿ[Δ_w]` at a single auxiliary place `w` under the fixed-point-free hypothesis, with `(3.12)–(3.13)`; (f) specialize the norm-fibre comparison and norm image `Nrd(D×)=F_+×` of HilbertModularVarietiesAndShimuraCurves §R18.3.7 to the level, narrow ray-class quotient and strong-approximation hypotheses of Skinner–Wiles Lemma 3.26.

Use adelic Hilbert modular forms `M_k(U), S_k(U)` of weight `k ∈ ℤ[I]`, their Fourier expansions and Hecke operators `T(ℓ), S(ℓ), T₀(𝔭_v)`, and Hida's classification of unit T₀(𝔭_v)-eigenlines ([H3, Corollary 2.2]). Skinner–Wiles p. 29 states Shimura's equality `M_k(𝔫,A)=M_k(𝔫,ℤ)⊗A` for coefficient subrings `A⊂ℂ`, with the analogous cuspidal equality. For `R⊂Q̄_p`, their spaces are defined by tensoring this lattice. For the parallel-weight integral Hilbert model use PadicFamilies §5.9a's lattice defined by expansions at all components and cusps, its comparison with the analytic realization, and its coefficient-change theorem for flat valuation-ring extensions and complete flat coefficients. Retain the supplied weight, level and scalar-stabilizer hypotheses.

The characteristic-zero comparison is the system `S^D(U)=H⁰(X(U),ℂ)/I^D(U) ≅ S₂(U)` of Jacquet–Langlands–Shimizu, compatible with `[UgU′]`, for the definite quaternion algebra over an even-degree totally real field unramified at all finite places. HilbertModularVarietiesAndShimuraCurves §R18.3.22 supplies the chosen coefficient realization after inverting the uniformizer.

The integral comparison identifies the ordinary Hecke image algebras generated by the corresponding operators on `eH⁰(X(U_a),𝒪)` and on the expansion lattice's ordinary Hilbert cusp forms. Use PadicFamilies §5.3 for this algebra identification and its level transitions. The characteristic-zero comparison and faithful torsion-free lattices identify the relations among the integral generators; an isomorphism between independently chosen integral modules is not a hypothesis or conclusion. The stabilizer, auxiliary-level freeness and norm-fibre specialization refinements belong here. Use the supplied class-set, p-operator and level-map APIs; compare the fixed-central-character quotient with HilbertModularVarietiesAndShimuraCurves §R18.3.1.

**Checks.**

- Quotienting by the whole adelic centre erases the nontrivial `Z(U)` action; retain `X(U)` before that quotient.
- At a free level the arithmetic trace has one term per fibre point; with stabilizer ratio two its coefficient is two, as in §1.5.
- At even degree the algebra ramified exactly at infinity is split at every finite place; at odd degree that ramification set has odd cardinality and cannot define the same quaternion algebra.
- For `F=ℚ(√3)` the supplied norm quotient at maximal finite level uses `Cl⁺(F)` of order two, although `Cl(F)=1`; replacing totally positive principal norms by all principal elements loses a class.
- Two rank-one lattices `𝒪` and `ϖ𝒪` in the same coefficient line have the same scalar Hecke image; that fact alone does not make their inclusion an integral isomorphism.
- Extension of a coefficient valuation ring is flat and preserves the supplied expansion lattice. Reduction modulo `ϖ` is nonflat and carries no unconditional lifting assertion.

(Source: SW99 §3.1–§3.2, pp. 27–36, Lemma 3.5 and Corollary 3.6; §3.8, Lemma 3.26; Hida [H3], Corollary 2.2, as cited in SW99 §3.2.)

*Needs:* HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.7, R18.3.22; GL2AutomorphicRepresentationsAndTransfer §§R16.6.1–R16.6.5, R17.3.1–R17.3.9; PadicFamilies §§5.1–5.5, 5.9a.

### Examples

On a one-point class set with a unit stabilizer, the pairing matrix is `[c⁻¹]`; it is invertible precisely when `c` is. On a neat two-point set it is the identity matrix. The trace of `[2,3]` to a single point is 5, so using an averaged trace would destroy adjunction. For the finite coefficient comparison, `2²⁰=1` in `ℤ/25` and `5³=0` in `ℤ/125` separate the unit and nilpotent factors of the ordinary projector. These are coefficient calculations, not a construction of the arithmetic class set.

### Dependencies

GL2AutomorphicRepresentationsAndTransfer:§§R17.3.1–R17.3.9; HilbertModularVarietiesAndShimuraCurves:§§R18.3.1–R18.3.22; §1.6; HilbertModularVarietiesAndShimuraCurves:§R18.3.22; HilbertModularVarietiesAndShimuraCurves:§R18.3.5; PadicFamilies:§§0a.1–0a.15; PadicFamilies:§0a.14; PadicFamilies:§5.3; PadicFamilies:§5.2; PadicFamilies:§5.1; mathlib:FiniteField.pow_card_sub_one_eq_one; mathlib:Fintype.prod_fiberwise; mathlib:IsIdempotentElem.

## Layer 2: Nearly ordinary representations, Ihara lemmas and Eisenstein inputs

### 2.1 Nearly ordinary automorphic representations

Let `k = Σ_τ k_ττ` with every `k_τ ≥ 2, π ∈ Π_k(U_a)` a cuspidal automorphic representation of `GL₂(A_F)` of weight `k` with `V_π^{U_a} ≠ 0`, and `v | p` with prime `p_v`. A line in `V_{π,v}^{U_{a,v}}` on which `T₀(p_v)` acts through an element of `F̄` that is a unit in the ring of integers of `Q̄_p` is unique if it exists; it is called v-good. A v-good line exists `iff π_v` is a principal series `π(η_v|·|_v^{−1/2}, ξ_v|·|_v^{−1/2})` or a special representation `π(ξ_v|·|_v^{−1/2}, ξ_v|·|_v^{1/2})` with `λ_v^{−v}ξ_v(λ_v^{−1})` a p-adic unit (`λ_v` the uniformiser used in `T₀(p_v)`). `π` is nearly ordinary if a v-good line exists for every `v | p`. `Π^{n.o.}_k(U_a) ⊆ Π_k(U_a)` is the set of nearly ordinary `π` (Skinner–Wiles write `Π^ord_k(U_a)`).

`F` totally real of any degree (the definition does not need the quaternion algebra); `v = (v_τ)` with `m +` 2v `∈ ℤt, m = k −` 2t, as in Skinner–Wiles §3.1.

Uniqueness and the criterion are Hida's classification of unit U_p-eigenlines ([H3, Corollary 2.2]) on the local newform theory of R16.6.

Reuse AutomorphicGaloisRepresentations §4.10's finite-weight nearly ordinary eigenpacket, including its local/global operator normalization. Write `ν_v` for the selected smooth character in that packet's inverse-action convention, transported from `ξ_v`. Its full arithmetic quotient character has unit values `δ_v(u)=ν_v(u)∏_{τ:F_v→Q̄_p}τ(u)^(−v_τ)`. Define ordinary by unramifiedness of this full character. Name Skinner–Wiles' condition on the smooth factor smooth ordinarity. Prove the exact comparison: ordinarity holds if and only if smooth ordinarity holds and every local `v_τ=0`. Indeed a smooth character is finite on units; differentiating a trivial algebraic character on an open unit subgroup and using independence of the embeddings forces every exponent to vanish.

The general nearly ordinary consumers retain `δ_v` and the chosen quotient. The parallel-weight Skinner–Wiles control and finite twists of ClassicalSerreModularity §I.1 and of §5.8 use `v_τ=0`, where the two ordinary predicates agree. In other weights a ramified finite twist can remove finite smooth ramification, but it cannot remove the labelled algebraic factor.

Provide the following operations and compatibility statements.

- A v-good line is a `T₀(p_v)`-stable line with p-adic unit eigenvalue.
- Nearly ordinary: a v-good line exists for every `v | p`.
- Smoothly ordinary: nearly ordinary with the selected smooth character unramified at every `v | p`.
- Ordinary: AutomorphicGaloisRepresentations §4.10's ordinary predicate, requiring `δ_v|𝒪_{F_v}×=1` at every `v | p`.
- The comparison: ordinary if and only if smoothly ordinary with every local exponent `v_τ=0`.
- Uniqueness: at most one v-good line at each `v | p`.
- Twisting: near ordinarity is preserved by twisting by finite characters.

**Checks.**

- `F = ℚ`, weight 2: the newform of `X₀(11)` has `a₃ = −1`, a unit, so it is ordinary at 3; `a₂ = −2` is not a 2-adic unit, so it is not ordinary at 2.
- At `v_τ=0`, the twist of an ordinary `π` by a finite character ramified at `v | p` is nearly ordinary but not ordinary.
- If `π_v` is supercuspidal, `T₀(p_v)` has no unit eigenvalue on `V_{π,v}^{U_{a,v}}`, so `π` is not nearly ordinary.
- Two unit eigenvalues cannot both occur: the product of the two T₀(p_v)-eigenvalues of a principal series has positive valuation for `k_τ ≥ 2`.
- For `k=(2,4), v=(1,0)` and unramified smooth factor, the rational principal unit `u=1+p` has `δ_v(u)=(1+p)⁻¹≠1`. Smooth ordinarity holds, while ordinarity fails; at `p=3` the value is `1/4`. A finite twist cannot cancel this character on an open unit subgroup.
- At `v_τ=0` the full quotient on units is exactly the smooth factor, so the weight-two and parallel-weight ordinary comparisons agree with the supplier.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §§3.1–3.2, pp. 27–32, especially the weight action on pp. 27–28, inverse translation (3.1′), p. 30, and good-line classification, p. 31; AutomorphicGaloisRepresentations §§4.10–4.11, full locally algebraic quotient comparison.)

*Needs:* GL2AutomorphicRepresentationsAndTransfer:§§R16.6.1–R16.6.5; AutomorphicGaloisRepresentations:§§4.10–4.11; §1.6; mathlib:NumberField.IsTotallyReal.

### 2.9 Ihara's lemma for definite quaternionic forms

(Lemma 3.26.) Let `U = ∏U_w` with `U_0(𝔫) ⊇ U ⊇ U(𝔫), w ∤ p` with `U_w = GL₂(𝒪_{F,w}), ℓ = ℓ_w, λ = λ^{(ℓ)}, V = U ∩ U_0(ℓ), (αf)(g) = f(g(1 0`; `0 λ)`) and `ξ_1` : `H⁰(X(U), R)² → H⁰(X(V), R), (f, g) ↦ f + αg (R` an 𝒪-module). Then ker `ξ_1` is annihilated by `[U(1 0`; `0 λ^{(q)})U] − 1 − Nm(q`) for every prime `q` of `F` splitting completely in the ray class field of conductor `𝔫·∞`.

`q` splits completely in the ray class field of conductor `𝔫∞`.

For `(f_1, f_2) ∈` ker `ξ_1, f_1(gu) = f_1(g)` for `u ∈ δ^{−1}GL₂(𝒪_{F,w})δ, δ = diag(1, λ^{−1})`; as `SL₂(𝒪_{F,w})` and its δ-conjugate generate `SL₂(F_w), f_1(gu) = f_1(g)` for `u ∈ U·SL₂(F_w) (3.18)` (Diamond–Taylor, Lemma 2, generalised).

`q` has a totally positive generator `π ≡ 1 mod 𝔫`; by Eichler's norm theorem there is `δ_0 ∈ D^×` with `ν_D(δ_0) = π`, and strong approximation for the norm-one group `G^D_1` (with `G^D_1(F_w) = SL₂(F_w)`) gives `f_1(gγ) = f_1(g)` for `ν_D(γ) = π^{−1} (3.19)` (strong approximation from HilbertModularVarietiesAndShimuraCurves §R18.3.8 and the norm specialization of §1.6).

`U(1 0`; `0 λ^{(q)})U` is a union of `Nm(q) + 1` cosets `Ug_i` with `ν_D(g_i) = π`, so the operator acts on `f_1` by `1 + Nm(q)`.

**Checks.**

- This is the Ihara-type statement at a place `w ∤ p` for definite quaternion algebras; the annihilator is Eisenstein-type.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.8, Lemma 3.26, p. 57 (Numdam PDF page 54; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.8, proof of Lemma 3.26, p. 58 (Numdam PDF page 55; printed page `=` PDF page `+ 3).`)

*Needs:* HilbertModularVarietiesAndShimuraCurves:§§R18.3.1–R18.3.22; §1.6; mathlib:QuaternionAlgebra.

### 2.10 Exactness at deeper Γ₁(ℓ^r)-level and the three-copy Ihara lemma

(Lemmas `3.27–3.28.`) With `U^{(r)} = U ∩ U_1(ℓ^r)`, for `r ≥ 1` the sequence `H⁰(X(U^{(r−1)}), R) --δ--> H⁰(X(U^{(r)}), R)² --γ--> H⁰(X(U^{(r+1)}), R), δ(f) = (f, −αf), γ(f_1, f_2) = αf_1 + f_2`, is exact; and the kernel of `ξ` : `H⁰(X(U), R)³ → H⁰(X(U^{(2)}), R), ξ(f_1, f_2, f_3) = f_1 + αf_2 + α²f_3`, is annihilated by `[U(1 0`; `0 λ^{(r)})U] − 1 − Nm(r`) for every prime `r` splitting completely in the ray class field of conductor `𝔫∞`.

`r ≥ 1`.

Lemma 3.27: if `αf_1 = −f_2` then `f_1 = −α^{−1}f_2` is invariant under `U′ = {a − 1 ∈ ℓ^r, c ∈ ℓ^{r−1}, b ∈ ℓ}`, and `U^{(r)}` and `U′` generate `U^{(r−1)}`.

Lemma 3.28: factor `ξ` through `H⁰(X(U), R)⁴ → H⁰(X(U^{(1)}), R)² → H⁰(X(U^{(2)}), R)` and apply Lemmas 3.26 and 3.27.

**Checks.**

- Lemma 3.27 is used only through the three-copy statement of Lemma 3.28, in the level-raising arguments of §8.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.8, Lemmas 3.27–3.28, p. 59 (Numdam PDF page 56; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.8, Lemma 3.27, p. 58 (Numdam PDF page 55; printed page `=` PDF page `+ 3).`)

*Needs:* §2.9.

### 2.11 Hilbert Hida weight change with fixed residual determinant

Let `F` be totally real, `p ≥ 5`, and `π` a regular algebraic cuspidal GL₂(A_F)-representation of weight 0, with det `r_π = ε⁻¹`, and with `π_v` an unramified Steinberg twist for every `v |` p. There is a specialization `π_H` of a Hilbert Hida family through `π` whose associated representation remains ordinary, has labelled Hodge–Tate weights `{0,2}` at every p-adic embedding, reduces to `r̄_π`, and has determinant `ε⁻²ω`, where `ω` is the Teichmüller lift of `ε̄`. In particular this supplies a local ordinary lift of `r̄_π|G_{F_v}` with those weights and determinant for each `v |` p. This assertion does not preserve all the away-from-p components by itself.

Use `HT(ε) = −1`; weight 0 for `GL₂` means weights `{0,1}`. Take the tame character branch matching `ε⁻²ω`. Its reduction is `ε̄⁻¹`, so the determinant agrees with `r̄_π`. Use the Hilbert Hida control theorem with the level and coefficient extensions needed by `π`; do not assume a new p-distinguishedness hypothesis absent from Newton–Thorne’s local-lift argument.

The Steinberg weight-zero local factors are ordinary by Newton–Thorne Lemma 2.6.

Import the Hilbert family and arithmetic specialization from PadicFamilies Layer 5 and specialize at weights `{0,2}` on the compatible tame-character branch.

Use the ordinary family’s Galois representation to read off the local lifts, their determinant and their common residual representation.

**Checks.**

- Check `(ε⁻²ω) mod p = ε̄⁻¹`; merely choosing weight three without the tame character would change the residual determinant.
- The Hida specialization supplies local inputs; a Steinberg condition at an auxiliary place and other away-from-p components require a separate global lifting theorem.
- Above `p`, use the ordinary potentially crystalline component through the Hida lift, with its actual inertial type, Hodge type `{0,2}` and determinant `ε⁻²ω`. Its ordinary locus is a union of components, as in NT Lemma 3.1.
- At `F_v=ℚ_p`, `p≥5`, the ramified finite-order `ω` makes `ε⁻²ω` noncrystalline. A crystalline representation has crystalline determinant, so this lift cannot be placed on a crystalline component.

([NT](<https://arxiv.org/pdf/2212.03595v2>) Lemma 2.6, PDF p. 12; proof of Lemma 3.1, PDF pp. 13–14 (arXiv:2212.03595v2).)

*Needs:* PadicFamilies:Layer 5; AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1; §2.1.

### 2.12 Eisenstein congruence inputs and Hilbert specialization

(a) The Deligne–Ribet p-adic L-function `L_p(F, s, χω)` of the totally real field `F`, its interpolation of `L^{(p)}(F, 1 − n, χω^{1−n})` and the integrality congruences and Euler-factor formulas from which Skinner–Wiles derive (4.17) are IntegralIwasawaTheory §§6.0–6.3 (the Deligne–Ribet pseudomeasure, its distribution congruences and its arithmetic interpolation with the factors at depleted places); the Hilbert Eisenstein series `E_n(φ₁, φ₂)` of parallel weight `n`, spanning a complement of the cusp forms, with the constant-term formula `a_i(E_n(1, ψ), 0) = 2^{−d}L(F, 1 − n, ψ)Nm(t_i)^{n/2}` (Skinner–Wiles (3.10)), are NoncommutativeAndEquivariantIwasawa §6.1 step 0(c) and §6.22; the Λ-adic Hilbert families of Wiles ([W2, Theorem 1.4.1]) are the coefficient families of NoncommutativeAndEquivariantIwasawa §F.5, imported as `M(𝔫, χ)` by PadicFamilies §5.10. None of these is planned again here. The two Eisenstein targets of this roadmap, which no earlier roadmap states, are the following. Chai's integral form: for `γ` a generator of the Galois group of the cyclotomic `ℤ_p`-extension of `F` and `f = ord_p(ε(γ) − 1)`, every sufficiently large `n ≡ 2 mod (p − 1)p^f` admits a form `g` of parallel weight `n`, level `𝔫p` and nebentypus `ψ` with `𝒪`-integral coefficients whose constant terms are `a_i(g, 0) = 2^{−d}Nm(t_i)^{n/2}` at every cusp `i = 1, …, h` (Skinner–Wiles (3.11); Chai, *Arithmetic minimal compactification of the Hilbert–Blumenthal moduli spaces*, Ann. of Math. 131 (1990), §4.5). Wiles' vanishing: a linear combination of the Eisenstein series `E_n(φ, φ^{−1}ψ)`, over unramified characters `φ` of p-power order, all of whose constant terms `a_i(·, 0)`, `i = 1, …, h`, vanish, is zero (the argument of Wiles, *On p-adic representations for totally real fields*, Ann. of Math. 123 (1986), Proposition 1.6, as used in the proof of Skinner–Wiles Proposition 3.18). (b) For the Newton–Thorne Hilbert weight change: the Hilbert Hida family and its arithmetic specializations over an arbitrary totally real field (not only the even-degree definite-quaternion realization), with the tame branch giving determinant `ε⁻²ω`, residual constancy and ordinary local Galois shape; the residue-indistinguishable case handled without an unsupported p-distinguishedness assumption; arithmetic specializations covering the ordinary weight-zero seed and the weight-two/trivial-nebentypus refinements with their exact determinants, local ordinary characters and compatible residual representations. (c) The new quotient `T^new_N` of Hida's ordinary Hecke algebra over `ℚ` (EPW Definition 2.2.1, Theorem 2.2.2: finite, reduced and torsion-free over `Λ`, classical primes corresponding to forms of tame conductor `N`, étale over `Λ_℘` at classical `℘`), and the correspondence between classical height-one primes of `T_N` and Galois-conjugacy classes of ordinary eigenforms (EPW Theorem 2.1.2 and after). (d) For the ordinary tower duality: (i) in Skinner–Wiles §3.2 the superscript `⁺` is the module `eH⁰(X(U_a), R)⁺` on which a Hecke operator `t` acts through its adjoint `t⁺` for the stabiliser-weighted pairing (§1.4), not a subspace cut out by a central-character or norm-form condition; `(ii)` the complete-DVR compact/discrete duality: for `L` finite free over `𝒪, Hom_𝒪(L, 𝒪) ≅ Hom_𝒪(L ⊗ K/𝒪, K/𝒪)`, and the continuous dual of a discrete direct limit is the inverse limit of the finite-level duals, compatibly with trace, restriction and the Hecke adjoints.

The Deligne–Ribet interpolation and integrality congruences, the Eisenstein constant-term formula and the Λ-adic Hilbert families are imported from the suppliers named in clause (a) and are not restated. Their use in the existence proof of permissible maximal ideals (SW99 Proposition 3.18) and in the p-adic L-function congruence (4.17) of the proof of Theorem A belongs to ClassicalSerreModularity `I.1/nearly-ordinary-hecke-algebras` and `I.1/residually-reducible-ordinary-lifting`, which consume nothing from this roadmap. Chai's form and Wiles' vanishing are stated in clause (a) as this roadmap's Hilbert Eisenstein refinements, with the exact weight congruence, cusp set and character range above. The Hilbert expansion and ordinary-family carriers and their integral coefficient API are those of PadicFamilies §§5.9a–5.10. The specialization at the determinant and labelled weights of §2.11 is an arithmetic comparison here; it retains the full totally real generality stated above. The EPW new quotient and its arithmetic-prime properties are constructed in §6.3. For the duality in clause (d), use DeformationAndDerivedPatchingAlgebra §7.6 for the complete-DVR fraction-quotient dual. Prove in clause (d) that its continuous dual sends these discrete direct limits to compact inverse limits, compatibly with the actual trace, restriction and adjoint action: a map out of the direct limit is exactly a compatible family of finite-level maps, and the finite-level duals carry their inverse-limit topology. The ordinary tower duality of SW99 §3.7, within ClassicalSerreModularity `I.1/ordinary-control-and-weight-change`, is where this duality is applied.

**Checks.**

- For `F = ℚ`, `p` odd and `γ` with `ε(γ) = 1 + p`, `f = 1` and Chai's weights are `n ≡ 2 mod p(p − 1)`; the modulus `p − 1` alone would admit `n = p + 1`, which is not `≡ 2 mod p`.
- Chai's form combined with the constant-term formula: `L(F, 1 − n, ψ)·g − E_n(1, ψ)` has zero constant term at every cusp `i = 1, …, h` by (3.10) and (3.11); a form with the prescribed constant term at one cusp only leaves nonzero constant terms at the other `h − 1` cusps when `h ≥ 2`.
- Wiles' vanishing is a statement about Eisenstein combinations over unramified p-power-order characters only: a nonzero cusp form of the same weight and level has zero constant terms at every cusp, and `E_n(1, ψ)` with `L(F, 1 − n, ψ) ≠ 0` has nonzero constant terms by (3.10), so neither is in the hypothesis's scope.
- The determinant `ε⁻²ω` reduces to `ε̄⁻¹`; `ε⁻²` alone changes the residual determinant.
- For a complete DVR, the dual of `K/𝒪` is `𝒪`; for an incomplete DVR it is its completion. The superscript `⁺` changes the Hecke action, while retaining the underlying module.

(Source: SW99 `(3.10)–(3.11)`, §3.4, pp. 46–48, and (4.17), §4.5; Newton–Thorne Lemma 3.1, pp. 13–14; EPW Definition 2.2.1 and Theorems 2.1.2, 2.2.2.)

*Needs:* IntegralIwasawaTheory:§§6.0–6.3; NoncommutativeAndEquivariantIwasawa:§§6.1, 6.22, F.5; PadicFamilies §§0.11–0.15, 5.9a–5.10; DeformationAndDerivedPatchingAlgebra §7.6. Clause (c) is the export of §6.3, rather than a prerequisite of clauses (a),(b),(d).

### Examples

A permissible Eisenstein ideal imposes both `T(ℓ)≡1+χ(Frob_ℓ)` and the selected unit `U_p` eigenvalue. The degree-one congruences `τ(2)=−24≡1+2¹¹` and `τ(3)=252≡1+3¹¹` modulo 691 test the Frobenius trace condition; they alone do not assert a permissible ordinary localization in the even-degree quaternionic setup, which is ClassicalSerreModularity §I.1's. Coefficient-of-identity duality on `𝒪[Δ]` sends the basis element `[1]` to 1 and `[δ]` with `δ≠1` to 0, whereas augmentation sends both to 1. For `k=(2,4)`, `v=(1,0)` and unramified smooth factor, the principal unit `1+p` has `δ_v(1+p)=(1+p)⁻¹≠1`, so smooth ordinarity holds while ordinarity fails.

### Dependencies

AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1; DeformationAndDerivedPatchingAlgebra:§7.6; GL2AutomorphicRepresentationsAndTransfer:§§R16.6.1–R16.6.5; §1.6; HilbertModularVarietiesAndShimuraCurves:§§R18.3.1–R18.3.22; IntegralIwasawaTheory:§§6.0–6.3; NoncommutativeAndEquivariantIwasawa:§§6.1, 6.22, F.5; PadicFamilies:Layer 5; PadicFamilies:§§0.11–0.15, 5.9a–5.10; §2.1; §2.9; mathlib:NumberField.IsTotallyReal; mathlib:QuaternionAlgebra.

## Layer 3: Local deformation refinements and the unit-rank bound

### 3.36 Ordinary local tangent conditions on the Hecke side

Let `k` have odd characteristic, `V = k²` with a continuous G_v-action and a chosen stable line `L`; write `χ₁,χ₂` for the characters of `L` and `V/L` and assume `χ₁ ≠ χ₂`. Put `b⁰ = {a ∈ ad⁰(V)` : `a(L) ⊆ L}`. The tangent space of fixed-determinant nearly ordinary deformations, with the line allowed to lift, maps isomorphically onto `ker(H¹(G_v,ad⁰(V)) → H¹(G_v,Hom(L,V/L)))`. If the quotient character on inertia is fixed, the tangent space is the image of `ker(H¹(G_v,b⁰) → H¹(I_v,k))`, where the last map is restriction followed by the action on `V/L`. A fixed-determinant arithmetic specialization of the ordinary Hecke-family representation factors through this local deformation condition; its tangent map therefore lands in this subspace. No equality with the Hecke tangent space is asserted before an `R=T` theorem.

`χ₁` and `χ₂` are distinct as G_v-characters, not necessarily as inertia characters. For the fixed-inertia variant, the prescribed quotient agrees with the residual quotient; use continuous cohomology and strict equivalence. The Hecke specialization has the integral ordinary line and the required quotient-character inertia from the family Galois construction. Require an actual integral Hecke representation at this specialization (for example the absolutely irreducible residual case), or a representation obtained by the explicit pseudo-deformation lifting. The residually reducible Hecke pseudo-representation alone is not such a representation.

The sequence `0 → b⁰ → ad⁰(V) → Hom(L,V/L) → 0` describes the first-order failure of line stability. Distinct characters give `H⁰(G_v,Hom(L,V/L)) = 0`, so its long cohomology sequence gives the tangent identification.

A first-order change of the quotient character is a k-valued cocycle. Fixing its inertia is precisely the kernel of its restriction to `I_v`.

Apply the ordinary local–global description of the Hecke family and the deformation-to-Hecke map. At auxiliary primes use the selected ramification-type tangent condition and the local duality contract instead of imposing an ordinary condition.

**Checks.**

- For a residual split pair, verify the forbidden lower-left cocycle is exactly `Hom(L,V/L)`.
- Distinguish nearly ordinary variable-inertia deformations from ordinary fixed-inertia specializations.
- Do not apply the smoothness theorem when the residual ratio is cyclotomic; the split versal ring can have a relation.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, Lemma 3.11 and Corollaries 3.12–3.13, pp. 41–42 (Numdam PDF pages `38–39`); §8.4, `(8.8)–(8.10)`, pp. 121–122 (Numdam PDF pages `118–119).`)

*Needs:* ClassicalSerreModularity `I.1/nearly-ordinary-hecke-algebras` (the Hecke pseudo-representation, its integral representation at an absolutely irreducible maximal ideal and the trace at auxiliary tame inertia); ArithmeticGaloisDuality:§R02.5.1; LocalGaloisDeformationRings:§6.3.

### 3.37 The determinant–flag comparison used by ordinary families

For the local rank-two rings of §3.39, using LocalGaloisDeformationRings Layers 6–8, take trivial residual representation and `d_v = [F_v:ℚ_p] > 4`. Over the weight-space open subset `U` where the two universal characters are distinct, the flag-ordinary and determinant-ordinary spectra coincide inside the framed deformation spectrum. Each weight-space component is dominated by exactly one determinant-ordinary component, of dimension `5 + 3d_v`; any other component lies over the equal-character locus and has dimension at most `3 + 3d_v`. Ordinary family arguments may use these assertions on points and components. They do not provide an isomorphism of the nonreduced representing rings or equality of their Artinian deformation functors.

Import the local definitions and comparison, including their scheme-theoretic conventions, from LocalGaloisDeformationRings §§7.1–7.6. The trivial residual representation and `d_v > 4` are essential to this contract; it is not the p-distinguished Skinner–Wiles local setup.

Specialize the supplier’s n-dimensional comparison to `n = 2`.

For each global family application restrict the weight map to `U` and record whether only a point, an underlying spectrum or a component is being compared.

Keep residual equal-character and nonreduced-coefficient questions outside this conclusion.

**Checks.**

- At `n = 2` the degree threshold is `d_v > 4`, and the dimensions are `5 + 3d_v` and at most `3 + 3d_v`.
- A comparison over `k[η]/(η²)` must not be inferred from equality of spectra.

([ACC](<https://arxiv.org/abs/1812.09999>) §6.2, Proposition 6.2.12 and proof, pp. 1036–1037 (author PDF pp. `140–141).`)

*Needs:* LocalGaloisDeformationRings:§§7.1–7.6; ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity` (the `Λ_𝒪`-structure of the deformation rings whose weight maps are compared).

### 3.38 Waldschmidt's lower bound for the p-adic rank of units

Let `k` be a number field, `φ` : `k → ℂ` and `φ_p` : `k → ℂ_p` embeddings, and `α_{ij} ∈ k (1 ≤ i ≤ d, 1 ≤ j ≤ ℓ)` with `|φ_p(α_{ij})|_p = 1`. Put `M⁰ = (log|φ(α_{ij})|)_{i,j}`, a real matrix, and `M_p = (log_p φ_p(α_{ij}))_{i,j}`, with `log_p` the Iwasawa logarithm of DirichletPadicLFunctions §0.6, normalized by `log_p(p)=0`. Then rk `M_p ≥` ½ rk `M⁰` (Waldschmidt, Theorem 1.1). Two consequences are used. (i) For a totally real field `F` of degree `d`, the p-adic rank `r_p` of the units of `F` satisfies `r_p ≥ (d − 1)/2`, so the ℤ_p-rank `δ_F` of the Galois group of the maximal abelian pro-p extension of `F` unramified outside `p` satisfies `δ_F ≤ ⌊(d + 1)/2⌋`, and `δ_F ≤ d/2` when `d` is even. `(ii)` For a totally real quadratic extension `F′/F` with `d = [F` : `ℚ]` and `p` odd, the ℤ_p-rank `δ⁻_{F′}` of the part of `Γ_Σ` on which `Gal(F′/F)` acts by `−1` (notation of SW01 Lemma 2.2, ClassicalSerreModularity `I.1/residually-irreducible-ordinary-lifting`) satisfies `δ⁻_{F′} ≤ d/2`.

The theorem holds for every prime p. In (i) and `(ii) p` is odd and the fields are totally real. For a CM quadratic `F′/F` the minus units are finite, the theorem gives nothing, and `δ⁻_{F′} = d` (see the Checks). The inequality is a lower bound for `r_p`, not Leopoldt's conjecture `r_p = d − 1`.

Waldschmidt proves Theorem 1.1 from a p-adic transcendence result for exponential functions in several variables, an extension of Schneider's method (Waldschmidt, §1, p. 1618, citing his Inventiones 1981 paper; §2 gives corollaries, p. 1619, and the proof is in §5, p. 1637).

For (i), take for `k` the Galois closure of `F`, for the `α_{ij}` the conjugates `σ_i(ε_j)` of a basis `ε_1, …, ε_{d−1}` of the units of `F` modulo torsion. Dirichlet's unit theorem gives rk `M⁰ = d − 1`, and the column space of `M_p` has dimension `r_p`. Class field theory gives `δ_F = 1 + (d − 1 − r_p)`, whence `δ_F ≤ 1 + (d − 1)/2`.

For `(ii)`, apply the theorem to a basis of the relative minus units of `F′/F`, of ℤ-rank `(2d − 1) − (d − 1) = d`, whose real logarithm matrix has rank `d`. Their p-adic rank `r_p⁻` is at least `d/2`. For `p` odd the class-field computation of `Γ_Σ` splits into ± parts under `Gal(F′/F)`, and the minus part has ℤ_p-rank `d − r_p⁻`.

**Checks.**

- For a real quadratic `F (d = 2)` the bound gives `r_p ≥ 1/2`, so `r_p = 1` (the p-adic logarithm of a unit of infinite order is nonzero) and `δ_F = 1`.
- Rounding: for `d = 4` the bound `(d + 1)/2 = 5/2` gives `δ_F ≤ 2 = d/2`; for `d = 3` it gives `δ_F ≤ 2`, not 3/2.
- For `F′/F` CM quadratic the minus units have rank 0 and rk `M⁰ = 0` on them, so the theorem says nothing; `δ⁻_{F′} = d` there, which is why the dihedral bound of SW01 Lemma 2.2 is restricted to totally real `F′`, and why §5.8 carries `CMComponentSupport`.

([Waldschmidt](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/CollMathSocBolyai1981.pdf) §1, Theorem 1.1, p. 1620; §1, p. 1618; §5, proof of Theorem 1.1, p. 1637; [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, (4.20), p. 78, and the proof of Theorem `B`, p. 79 (Numdam PDF pages 75–76; printed page `=` PDF page `+ 3).`)

*Needs:* mathlib:NumberField.Units; mathlib:PadicComplex; DirichletPadicLFunctions §0.6; TauCetiRoadmap.ClassFieldTheory Layer 11 (the global Artin map); DiophantineApproximationAndTranscendence:Layer 3 (the complex several-variable Schneider–Lang machinery whose p-adic form this target proves).

### 3.39 Ordinary deformation and tangent refinements

(a) The versal nearly ordinary deformation ring of a nonsplit `ρ₀|_{D_v} ≅ (χ_1 *`; `0 χ_2), χ_1 ≠ χ_2`, for `v | p` over a totally real `F`, with its relative dimension over `𝒪` (Skinner–Wiles 2001 Proposition 2.1 say it is analysed as in their 1999 Corollary 2.3, the split case `χ ⊕ 1`). (b) For the split datum of SW99 §2.1 and the irreducible datum of SW01 §2 (ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity` and `I.1/residually-irreducible-ordinary-lifting`): that the nearly ordinary ordered-flag condition at `v | p`, with only the residual character of the sub prescribed, is a deformation condition stable under Schlessinger fibre products; LocalGaloisDeformationRings §6.3 fixes the inertial characters and excludes a residual ratio 1 or `ε̄`.

Mazur's unframed presentation for a Schur residual representation with fixed determinant: `R ≅ 𝒪[[x_1, …, x_{g′}]]/(f_1, …, f_{r′})` with `g′ = h¹(F_Σ/F, ad⁰ρ̄)` and `r′ ≤ h²(F_Σ/F, ad⁰ρ̄)`([M, Proposition 2]).

The same identification with coefficients `C/λ^m` for a complete discrete valuation ring `C`: the injection `Hom(R, C ⊕ εC/λ^m) ↪ H¹(F_Σ/F, ad ρ/λ^m)` with the local conditions of Skinner–Wiles `(8.8)–(8.10)`, for a deformation ring `R` over `C`.

Construct the nearly ordinary ordered-flag deformation condition under distinct residual characters, with no additional fixed-inertia or cyclotomic-ratio exclusion. Prove identity and composition for coefficient change, unique lifting of the selected ordered line, fibre-product stability and the relative local generator/relation bounds. Apply it to the split case of SW99 §2.1 and the possibly nonsplit case of SW01 §2. Prove Mazur's unframed presentation under the Schur hypothesis and the discrete-valuation-coefficient tangent comparison used by the presentation bounds of SW99 Proposition 2.4 and SW01 Proposition 2.1 and by the characteristic-p Selmer counts of SW99 §6.

**Checks.**

- A split residual representation with two distinct characters has two lines; selecting their order is necessary, and a first-order extension in the opposite direction fails the chosen condition.
- A nonsplit residual extension admits only its sub-character line. The split versal calculation alone does not give its presentation.
- The cyclotomic ratio may occur in this condition; a fixed-inertial-character smoothness theorem excluding that ratio cannot replace fibre-product stability.
- For `m=1` the tangent comparison reduces to finite residue coefficients; for `m>1` it must retain λ-power torsion rather than only residue-field dimensions.

(Source: SW99 §2.1, Lemma 2.2, Corollary 2.3 and Proposition 2.4, pp. 11–14; SW01 Proposition 2.1, p. 189; Mazur `[M]`, Proposition 2, as cited in SW99; SW99 `(8.8)–(8.10).`)

*Needs:* LocalGaloisDeformationRings §§F.2.1–F.2.6, 6.2–6.3, Layers 7–8; GlobalGaloisDeformations §§3.4–3.8; ArithmeticGaloisDuality §§D8.1, R02.5.1. Clauses (a),(b) take the residual representation and ordered local flags as input; they are the local conditions that the deformation data of SW99 §2.1 and SW01 §2 impose.

### Examples

For `F=ℚ` and a CM quadratic inducing field in which `p` splits, the minus local-unit rank is 1 and the minus global-unit rank is 0: the dihedral parameter rank is 1, exceeding `d/2=1/2`. This refutes the universal dimension estimate of SW01 Lemma 2.2, not the ordinary lifting conclusion. For a real quadratic field the p-adic unit rank is 1 and `δ_F=1`. At `d_v=5` the determinant–flag component dimensions are 20 and at most 18; the comparison is on the distinct-character open set. A split residual local representation with distinct characters has two lines, and a first-order extension in the direction opposite to the selected order fails the ordered-flag condition.

### Dependencies

ArithmeticGaloisDuality:§§D8.1, R02.5.1; ClassicalSerreModularity:§I.1; DiophantineApproximationAndTranscendence:Layer 3; DirichletPadicLFunctions:§0.6; GlobalGaloisDeformations:§§3.4–3.8; LocalGaloisDeformationRings:§§F.2.1–F.2.6, 6.2–6.3, 7.1–7.6, Layers 7–8; TauCetiRoadmap.ClassFieldTheory Layer 11; mathlib:NumberField.Units; mathlib:PadicComplex.

## Layer 4: Commutative-algebra inputs and solvable descent

### 4.3 Components of `A/(f_1, …, f_r)` meet in large dimension

(Corollary `A.2.`) Let A be a Noetherian local Cohen–Macaulay ring of dimension `d` and `I = (f_1, …, f_r) ⊆ m_A` a proper ideal with `r ≤ d − 2`. If the set of irreducible components of `Spec(A/I)` is partitioned into two nonempty sets `𝒞_1 ⊔ 𝒞_2`, there are `C_1 ∈ 𝒞_1` and `C_2 ∈ 𝒞_2` with `C_1 ∩ C_2` containing a prime of dimension `d − r − 1`.

A Noetherian local Cohen–Macaulay; `I⊆m_A`; `r ≤ d − 2`.

Proposition A.1 (Raynaud, Corollaire 4.2): Prove that `Spec(A/I) ∖ {m_A/I}` is connected as the first assertion of this target.

Suggested.lean states these results as `puncturedSpectrum_connected` and `components_meet_in_large_dimension`. Its predicate `IsCohenMacaulayLocal` expresses Cohen–Macaulayness by a regular sequence of length `dim A`; the component statement uses Mathlib’s minimal primes over `I`.

Induction on `d − r`: for `d − r = 2` this is the proposition; otherwise pick a one-dimensional `𝔭` in `C′_1 ∩ C′_2` and pass to `A_𝔭` (Cohen–Macaulay of dimension `d − 1`), where the decomposition stays nontrivial.

**Checks.**

- The linchpin of the Main Theorem: it produces pro-modular and non-pro-modular components meeting in large dimension.
- At `d−r=2` the intersection contains a one-dimensional prime, the punctured-spectrum connectedness case.
- A partition with an empty side is excluded; connectedness alone gives no chosen pair in that case.
- In `A=k[[x,y,z]]`, `I=(1)` has one generator but gives an empty spectrum, which is not connected in Mathlib. The proper-ideal hypothesis excludes it.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) Appendix A, Corollary A.2, p. 123 (Numdam PDF page 120; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) Appendix A, proof of Corollary A.2, pp. 123–124 (Numdam PDF pages 120–121; printed page `=` PDF page `+ 3).`)

*Needs:* mathlib:IsLocalRing; DeformationAndDerivedPatchingAlgebra:§6.6. The punctured-spectrum connectedness assertion of SW99 Appendix A.1 is proved here before its intersection consequence.

### 4.6a Single-coefficient solvable descent

For totally real `F`, odd `p`, and a continuous `ρ:G_F→GL₂(Q̄_p)` unramified outside finitely many places, assume total oddness, `detρ=ψε^μ` with `μ≥1` and finite-order `ψ`, and the selected nearly ordinary local quotients of finite inertial order as in the Skinner–Wiles Main Theorem (ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity`). Let `L/F` be finite totally real with solvable Galois closure. Assume `ρ|G_L` is absolutely irreducible and attached to a cuspidal Hilbert form of regular weights at least 2, in the matching arithmetic convention. Prove single-coefficient solvable descent: `ρ` is attached to a cuspidal Hilbert form over `F`, with the chosen local ordinary characters transported under the attachment.

Let `E/F` be the Galois closure. Prove that the regular Hilbert attachment over `L` remains absolutely irreducible over the totally real field `E`. Use AutomorphicGaloisRepresentations §§3.15–3.16: a non-CM attachment remains irreducible on every open subgroup; a CM attachment is induced from a totally imaginary quadratic field, which cannot be contained in `E`. Its two inducing characters remain distinct after finite restriction because their labelled Hodge–Tate weights differ. Thus solvable base change from `L` to `E` stays cuspidal and matches `ρ|G_E`.

Choose a prime-cyclic tower from `E` down to `F`. At each step good-prime trace matching with `ρ` gives invariance of the cusp form by strong multiplicity one. Apply cyclic automorphic descent. Its regular archimedean type supplies an attached representation at this same coefficient place by AutomorphicGaloisRepresentations §§3.10–3.14. Schur's lemma on the common absolutely irreducible restriction gives a finite character of the cyclic quotient comparing that attachment with `ρ`; twist the descended form to obtain equality. Repeat to `F`. This construction uses one coefficient place and does not require a compatible family or a common twist index across coefficient places.

**Checks.**

- For `L=F` the input attachment gives the conclusion with trivial twist.
- On a cyclic step a nontrivial quotient character preserves the restricted representation but changes the descent; the finite-character twist selects the one matching `ρ`.
- For a nonnormal `L/F`, descend from its Galois closure rather than treating `G_L` as normal in `G_F`.
- A weight-one dihedral representation induced from a real quadratic field can become reducible over a totally real extension. The regular-weight attachment hypothesis excludes this failure of the irreducibility argument.

(Source: SW99 §4.5, Main Theorem and proof, pp. 73–74; SW01 proof of Theorem 5.1, pp. 203–204; cyclic descent and twist fibre in Arthur–Clozel, Chapter 3 Theorem 4.2(d), p. 202; regular Hilbert virtual reducibility in Ribet, On l-adic representations attached to modular forms II, Theorem 2.3, pp. 251–252, as in AutomorphicGaloisRepresentations §3.16.)

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.4.8–R17.4.11; AutomorphicGaloisRepresentations §§3.10–3.16; ArithmeticGaloisRepresentations Layer 5; ClassFieldTheory Layer 11.

### 4.20 The numerical complete-intersection criterion

Prove [de Smit–Rubin–Schoof, Criterion I](https://www.mat.uniroma2.it/~schoof/ci.pdf) in its full complete-DVR form. Let `C` be a complete DVR and `R↠T` a surjection of complete Noetherian local C-algebras with compatible surjective augmentations to `C`, with `T` finite flat over `C`. Put `H_R=ker(R→C)`, `G_T=Ann_T(ker(T→C))`, `δ:T→C` and `η_T=δ(G_T)`, and assume `η_T≠0`. Then `ℓ_C(H_R/H_R²)≥ℓ_C(C/η_T)`, with equality exactly when `R→T` is an isomorphism between complete intersections over `C`. Thus the opposite weak inequality suffices for the isomorphism. The lengths are taken in `ℕ∞`: `C/η_T` has finite length because `η_T ≠ 0`, while `H_R/H_R²` may have infinite length, in which case the inequality holds and equality fails; no finiteness hypothesis on `H_R/H_R²` is needed, because when `R→T` is an isomorphism `H_R ⊗ Frac(C)` is a direct factor of `T ⊗ Frac(C)` and `H_R/H_R²` is torsion. This includes the case with `R` finite and `T` a reduced complete intersection used in the level-raising step of SW99 §8; the general criterion allows an arbitrary complete Noetherian `R` and finite flat `T`. (Criterion I, Introduction, author PDF p. 1; proof in §3, pp. 10–11; in Modular Forms and Fermat's Last Theorem, Springer, 1997.)

Suggested.lean states Criterion I as `numerical_completeIntersection_criterion`. Its predicate `IsRelativeCompleteIntersection` means a presentation by a regular sequence in a finite-variable power-series algebra over `C`.

The characteristic-p patching of SW99 §5, with its rings `A_N = A[[s_1, …, s_n]]/(s_i^{N+1})` and `B_N = A[[t_1, …, t_n]]/(t_i^{(N+1)/2})`, `t_i ↦ s_i²/(1+s_i)`, its axioms `(5.1)–(5.11)` and the conclusions of Lemma 5.6 and Propositions 5.7–5.9, is part of ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity`. DeformationAndDerivedPatchingAlgebra §5.6's free-module consumer, `patching_surjection_iso`, requires equal numbers of scalar and presentation variables, local scalar lifts into the regular presentation ring and positive-rank free modules over the specified group-ring quotients; in the Skinner–Wiles datum the ring action is only through `B_N` while the module has an `A_N`-action, and the free conclusions occur after inverting `T`. That datum is therefore not an instance of the free-module consumer, and the numerical criterion above, applied after the DVR cut with the compatible augmentations, augmentation ideals and congruence ideal named here, is what the `R = T` conclusion at nice primes of all levels uses.

**Checks.**

- For the identity augmentation `R=T=C`, both lengths in the criterion are zero and the conclusion is the identity. Dropping compatible augmentations leaves `H_R` and `δ(G_T)` undefined.
- For `T=C[x]/(x²)` with `δ(x)=0`, `Ann_T(ker δ)=(x)` and `η_T=0`: the criterion does not apply, and `ker δ/(ker δ)² ≅ C` has infinite length although `T` is finite flat.
- For `R=C[[x]]/(x²)`, `T=C`, `ε(x)=0` and `δ=id`: `η_T=C`, `ℓ_C(C/η_T)=0` and `H_R/H_R² ≅ C` has infinite length, so the inequality holds, equality fails and `R→T` is not injective; the infinite-length case is a genuine instance, not a degenerate one.
- With no auxiliary variables, the supplied free-module consumer gives `R=T=𝒪` and `M=𝒪^s`, `s>0`; rank zero cannot imply faithfulness.
- The map `𝒪[[x]]↠𝒪`, with `M=𝒪`, has a faithful target action and nonzero kernel. It cannot satisfy the consumer's finite-level hypotheses.
- The substitution `t=s²/(1+s)` does not provide the scalar lifts or equal-variable regular presentation required by that consumer.

(Source: de Smit–Rubin–Schoof, Criteria for complete intersections, Criterion I and §3, author PDF pp. 1, 10–11, as used in SW99 §8; SW99 §5, `(5.1)–(5.11)`, pp. 80–82, for the datum recalled above.)

*Needs:* DeformationAndDerivedPatchingAlgebra §§1.7–1.9, 3.1–3.4, 5.1–5.6; mathlib:IsLocalRing.

### Examples

In `A=k[[x,y,z]]`, the proper ideal `(x)` has `d−r=2`, and the punctured spectrum of `A/(x)=k[[y,z]]` is connected; the unit ideal gives the empty spectrum and is excluded. For `R=C[[x]]/(x²)↠C` the cotangent length is infinite and the congruence length zero, so the inequality of §4.20 is strict. For `L=F` the single-coefficient descent of §4.6a returns the input attachment with trivial twist. Distinguish surjectivity `R→T`, pro-modularity of a prime, and the completed local `R=T` isomorphism of ClassicalSerreModularity §I.1; none can be substituted for either of the others.

### Dependencies

ArithmeticGaloisRepresentations:Layer 5; AutomorphicGaloisRepresentations:§§3.10–3.16; ClassFieldTheory:Layer 11; ClassicalSerreModularity:§I.1; DeformationAndDerivedPatchingAlgebra:§§1.7–1.9, 3.1–3.4, 5.1–5.6, 6.6; GL2AutomorphicRepresentationsAndTransfer:§§R17.4.8–R17.4.11; mathlib:IsLocalRing.

## Layer 5: Conditional lifting and arithmetic inputs

### 5.1 Hypothesis `H` on relative class groups

Hypothesis `H`: there are `0 < ε < 1/4` and `c(ε) > 0` such that for every totally real field `K` and finite set `S` of finite places of `K` there is an imaginary quadratic extension `L/K` with prescribed behaviour at each place of `S` whose relative class group has p-rank at most `c(ε)·[K` : `ℚ]^{1−ε}`.

Stated for a fixed odd prime `p`; Theorem `B` assumes it for all solvable totally real extensions of `F`.

A hypothesis, not a theorem: Skinner–Wiles expect it to be easier than extending Washington's theorem to non-abelian fields.

Provide the following operations and compatibility statements.

- Hypothesis `H` itself: the existence of controlled imaginary quadratic extensions for all `K` and `S`.
- Monotonicity: Hypothesis `H` for `F` implies it for every totally real extension of `F`, since it quantifies over all `K`.
- The extension: the imaginary quadratic `L/K` with prescribed local behaviour at `S` and relative class group of p-rank `≤ c(ε)[K` : `ℚ]^{1−ε}`.

**Checks.**

- For `S = ∅` the prescribed behaviour is vacuous and only the class-group bound matters.
- The lower bound `ε>0` makes the ratio `2^{n(1−ε)}d^{1−ε}/(2ⁿd)=2^{−nε}d^{−ε}` tend to zero; `ε<1/4` is the additional range in Hypothesis `H`. Thus the class-group bound grows slower than `2ⁿd`, the degree growth of the tower in Theorem B's proof.
- Allowing the constant `c` to depend on `K` or `S` gives a weaker predicate and fails the uniform growth estimate: for degrees `2ⁿd`, the normalized bound is `c(ε)(2ⁿd)⁻ε` with the same `c(ε)` for every `n`. Its convergence to zero is the input used by Theorem `B`.
- Theorem `B` is conditional on Hypothesis `H`; nothing downstream may use Theorem `B` unconditionally.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.5, Hypothesis `H`, p. 75 (Numdam PDF page 72; printed page `=` PDF page `+ 3).`)

*Needs:* ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity` (good pairs).

### 5.1a Abelian preparation with prescribed residue degrees

**Abelian preparation.** Let `F/ℚ` be totally real abelian, `p` odd, and `𝒟=(𝒪,Σ,c,ℳ)` a deformation datum of SW99 §2.1 (ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity`). For every rational `q≠p` below `Σ` choose a positive integer `m_q` divisible by `f(v/q)·ord(χ(Frob_v))` for each `v|q` at which `χ` is unramified and `ρ_c` is ramified; additional divisibility may be prescribed. There is a finite totally real abelian `E′/ℚ`, split completely at `p`, unramified at these `q`, with local residue degree exactly `m_q` there. It can be chosen so that `E=FE′` has even degree over `F`. Then `E/F` is permissible for `𝒟`, and at every `w∤p` where the restricted `ρ_c` is ramified, either `χ|I_w≠1` or `χ|D_w=1`.

Use ArithmeticGaloisDuality §R02.4.6's finite-character extension theorem. Prescribe the trivial characters at `p` and infinity and unramified characters of exact order `m_q` at the selected `q`. At one additional prime `q₀` outside this set, split completely in `F`, prescribe an unramified quadratic character. If `n` is the least common multiple of these orders, the global character has order `n` or, in the obstructed Grunwald–Wang case, `2n`. Its field is real and cyclic, hence abelian, but its local degrees need not equal its global degree. In particular, the quadratic local prescription at `q₀` forces `[E:F]` even. This construction does not prescribe ramification outside the stated places.

At `v|q`, the residue degree of `E_w/F_v` is `m_q/gcd(m_q,f(v/q))`, so it kills the unramified character when required. Inertia at `Σ∖𝒫` is unchanged, preserving both inertia conditions at `ℳ`, and the p-completions are unchanged. For global nonsplitting, `E/F` is abelian, so `G_E` contains the commutator subgroup of `G_F`; its residual image contains the nonzero unipotent commutators of `ρ_c`. Since `χ|G_E` remains nontrivial at every p-place, the restricted extension cannot split. These facts give all four permissible-extension conditions of SW99 Remark 2.1 and the tame good-pair condition of SW99 §4.1.

**Checks.**

- For local degree 8 at 2, the unramified local character takes `16` to `−1`. Grunwald–Wang can require a cyclic global degree 16, with two primes above 2 and local degree 8; global degree 8 with 2 inert is impossible.
- Take `F=ℚ`, `p=17`, `k=𝔽₁₇`, `χ=ω₁₇⁻¹`, `Σ={2,5,17,29}` and the Kummer class of `290=2·5·29`. Its valuation at 2 is 1, while `290=1+17²` is a seventeenth power in `ℚ₁₇` because the seventeenth-power map sends `1+17ℤ₁₇` onto `1+17²ℤ₁₇`. Thus it is a nonzero admissible class. At 2, `χ(Frob₂)=9` has order 8, so an unramified residue degree divisible by 8 is needed. The enlarged global degree permits precisely this local condition.
- Prescribing the trivial character at `p` gives complete splitting, independently of the residue degrees at the other primes. Prescribing the trivial real character makes `E′` totally real.
- If all required `m_q=1`, the local conditions at those primes are splitting conditions; the extra quadratic prescription still makes `[E:F]` even.

(Source: SW99 §4.6, proof of Theorem A, p. 76, first paragraph specifying the properties of `E`; [Conrad, Lifting global representations with local properties](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), Appendix A, Definition A.1 and Proposition A.3, pp. 31–32; [Milne, Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf), VIII §2, Example 2.2 and Theorems 2.3–2.4, pp. 231–232.)

*Needs:* ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity` (deformation data, permissible extensions and good pairs); ArithmeticGaloisDuality:§R02.4.6; ClassFieldTheory Layers 7, 11–12; Chebotarev Layer 10.

### 5.3 Skinner–Wiles Theorem `B` (conditional on Hypothesis `H`)

Let `F` be totally real and assume Hypothesis `H` for all solvable totally real extensions of `F`. Let `p` be odd and `ρ` : `Gal(F̄/F) → GL₂(Q̄_p)` continuous, irreducible and unramified outside finitely many places with `ρ̄^ss ≅ χ_1 ⊕ χ_2`. If `(χ_1/χ_2)(z) = −1` for every complex conjugation `z, (χ_1/χ_2)|_{D_v}` has even order for every `v | p, ρ|_{D_v}` has the nearly ordinary shape of Theorem A with `ψ^{(v)}_2` through a pro-p extension of `F_v` and finite order on `I_v`, and det `ρ = ψε^{k−1} (k ≥ 2, ψ` finite), then `ρ` is the representation of a Hilbert modular newform.

Hypothesis `H` for all solvable totally real extensions of `F`.

By base change it suffices to treat `F⁺`, the maximal totally real subfield of `F(χ)`; there `χ|_{D_v} ≠ 1` for `v | p` and `χ` is quadratic.

As in the proof of Theorem A (ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting`), using §5.1a over the abelian field `F⁺`, find a solvable permissible `E` of even degree with `L_p(E, −1, χω) ∈ 𝒪 ∖ 𝒪^×` and the ramification condition (4.21).

Hypothesis `H` gives totally imaginary quadratic characters `ψ` over `E` with prescribed local behaviour and small relative class groups; the splitting field of `χψ` is a totally real quadratic `L_1/E`, and iterating gives `L_n` with (4.22).

For `n_0` as in `(4.23), L = L_{n_0}` satisfies (4.24) and (4.25) (with Waldschmidt's bound), so `(L, 𝒟_L)` is good (the printed proof says `'(vi)'` for condition `(iv)`), and the Main Theorem of ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity` applies over `L`; descend by §4.6a.

**Checks.**

- Conditional: every consumer must carry Hypothesis `H`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.5, Theorem `B`, p. 75 (Numdam PDF page 72; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, proof of Theorem `B`, p. 78 (Numdam PDF page 75; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, end of the proof of Theorem `B`, p. 79 (Numdam PDF page 76; printed page `=` PDF page `+ 3).`)

*Needs:* ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity` (the Main Theorem) and `I.1/residually-reducible-ordinary-lifting` (the Theorem A tower); §5.1; §5.1a; GL2AutomorphicRepresentationsAndTransfer:§§R17.4.8–R17.4.11; §6.14; §4.6a; §3.38.

### 5.8 Full-scope irreducible lifting conditional on component support

Let `F≠ℚ` be totally real, `p` odd, and `ρ:G_F→GL₂(Q̄_p)` satisfy SW01 (5.1) (ClassicalSerreModularity `I.1/residually-irreducible-ordinary-lifting`), with absolutely irreducible distinguished residual representation and a χ₂-good nearly ordinary modular seed. Retain the ordered local quotients, their finite-order inertia restrictions and `detρ=ψε^μ`, `μ≥1`. No restriction on the signatures of quadratic inducing fields is imposed.

Define the additional hypothesis **component support** (written CMComponentSupport where consumers cite it) as follows. There exist a finite totally real `L/F` with solvable Galois closure and even absolute degree, a coefficient DVR `𝒪` containing the values of `ρ|G_L`, and an irreducible datum `𝒟_L=(𝒪,Σ_L,∅)` of SW01 §2 with the permissible level and Hecke ring of SW01 §3 (that target), such that the restricted residual representation is absolutely irreducible and distinguished with the transported χ₂-good seed. Let `x_L:R_{𝒟_L}→𝒪` classify `ρ|G_L` with those selected local flags and let `r_{𝒟_L}:R_{𝒟_L}↠T_{𝒟_L}` be the surjection of SW01 Proposition 3.4 supplied by that target. Require a minimal prime `q` of `R_{𝒟_L}` with `q⊆ker(x_L)` and `ker(r_{𝒟_L})⊆q`. Thus a component through the given characteristic-zero point has ordinary Hecke support. The kernel inclusion is the mathematical hypothesis; it is not inferred from a `d/2` estimate. This roadmap owns its definition and the conditional implication below.

**Conditional lifting.** Under these hypotheses and component support, `ρ` is attached to a cuspidal nearly ordinary Hilbert representation over `F`, with the specified local quotient labels. In the absence of complex-place inducing fields SW01 Theorem 5.1, as proved in ClassicalSerreModularity `I.1/residually-irreducible-ordinary-lifting`, supplies the lifting conclusion independently of this additional hypothesis. For `F=ℚ` the full classical conclusion and imaginary-quadratic correction are owned by that target.

Prove the implication through the supplied surjection: `ker(r_{𝒟_L})⊆q⊆ker(x_L)` gives a unique local `𝒪`-algebra map `θ_L:T_{𝒟_L}→𝒪` with `θ_L∘r_{𝒟_L}=x_L`. Surjectivity makes it a continuous map respecting the determinant and quotient weight coordinates. The determinant and finite-order inertial quotient make `θ_L` algebraic, so PadicFamilies §5.8 realizes it by a nearly ordinary form of parallel weight `μ+1`. Compare its Galois representation using the supplied representation over `T_{𝒟_L}` and the distinguished quotient recovery; then apply §4.6a's single-coefficient solvable descent.

Every use of this full-scope export for a complex-place inducing field carries component support. A bound of `δ⁻=d_L` on a CM constituent does not imply the required kernel inclusion.

**Checks.**

- If a prepared map is an isomorphism, `ker(r_{𝒟_L})=0`, and any minimal prime below `ker(x_L)` gives the support hypothesis.
- For `R=k[[t,x]]`, `T=R/(x)` and the point `R→k[[t]]` killing `x`, the point factors through `T`, but its component `(0)` does not have `ker(R→T)⊆(0)`. Component support is stronger than support of one special point. The coefficient factorization theorem assumes the actual component inclusion.
- For a CM quadratic inducing field with every p-place split, `δ⁻=d_L` as in §3.38. This rank calculation neither supplies nor refutes component support, and cannot replace it in the conditional theorem.
- With projective Klein four residual image, keep every inducing field and its chosen local flags. A totally real constituent does not remove the support hypothesis for the complex-place branch.

(Source: SW01 §4, definition of pro-modularity, p. 198, Proposition 4.1 and its component argument, pp. 199–202; §5, Theorem 5.1 and the algebraic-specialization/descent implication, pp. 202–204; §2, Lemma 2.2, pp. 190–191, with the signature-dependent calculation in §3.38. These give the factorization implication; the component-support inclusion is an additional hypothesis.)

*Needs:* ClassicalSerreModularity `I.1/residually-irreducible-ordinary-lifting` (SW01 (5.1), the datum and permissible level, the surjection of Proposition 3.4, good pairs and Theorem 5.1); §3.38; §4.6a; §6.14; PadicFamilies:§5.8; AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1.

### 5.9 The distinct-prime class-group bound in the abelian lifting route

Let `K` be an abelian number field, `ℓ` and `p` distinct primes, and `K_n/K` the layer of degree `ℓⁿ` of the cyclotomic `ℤ_ℓ`-extension of `K`. Then the orders of the p-primary parts of the class groups of the `K_n` are bounded independently of `n`, and so are eventually constant (Washington, §1, Theorem, p. 87). ClassicalSerreModularity `I.1/pseudo-deformation-rings-and-pro-modularity` proves the instances its criterion for `(P2)` and its Theorem A tower use, for the fields `E_n` and `E_n(χ)` abelian over `ℚ` with `ℓ ≠ p`; this section states the theorem for every abelian number field and, as Suggested.lean does, for every nested tower `L_0 = K ⊂ L_1 ⊂ L_2 ⊂ ⋯` inside `K(μ_{ℓ^∞})` with `[L_n : K] = ℓⁿ`, together with eventual constancy. That is the general form and the one tested.

Suggested.lean states the bound and eventual constancy as `cyclotomic_classGroup_primary_stabilizes`, with `pPrimaryClassNumber` the order of Mathlib's p-primary class subgroup. The layers are number fields with degree `ℓⁿ` over `K`, successive K-embeddings, and K-embeddings into finite `K(μ_{ℓ^m})`; nothing further pins them. For odd `ℓ` these conditions determine the cyclotomic layers: `Gal(K(μ_{ℓ^∞})/K)` is the product of a finite group of order prime to `ℓ` and a copy of `ℤ_ℓ`, so it has exactly one quotient of order `ℓⁿ`. For `ℓ = 2` they admit other towers, such as `ℚ ⊂ ℚ(√−2) ⊂ ℚ(ζ₈) ⊂ ℚ(ζ₁₆) ⊂ ⋯`; the statement covers them by the reduction below.

`K` abelian over `ℚ` and `ℓ ≠ p` are both essential. The bound concerns character sums with coefficients involving the two distinct primes; it is not a consequence of a same-prime Iwasawa μ-invariant statement.

By a reduction from Washington's earlier work it suffices to bound the minus parts, for every imaginary abelian field (Washington, §2, p. 88). Factor the relative class numbers along the odd abelian characters of the tower by the analytic class number formula, as products of generalized Bernoulli numbers `B_{1,θ}`. As the ℓ-power part of the conductor grows, prove that the character values controlling the p-parts are nonzero modulo `p`, using cyclotomic trace identities and simultaneous control of blocks of ℓ-adic digits (Washington, Lemma 1 and Propositions 1–4, pp. `89–97`); the remaining finitely many characters contribute a bounded factor.

Since `[L_{n+1} : L_n] = ℓ` is prime to `p`, extension of ideal classes followed by the norm is multiplication by `ℓ`, so the p-parts of the class groups inject along the tower; their orders are nondecreasing and, being bounded, eventually constant.

Reduction of a general nested tower to the cyclotomic layers. For odd `ℓ` the group `Gal(K(μ_{ℓ^∞})/K)`, an open subgroup of `ℤ_ℓ^×`, is the product of a finite group of order dividing `ℓ − 1` and a copy of `ℤ_ℓ`; a quotient of order `ℓⁿ` kills the finite factor, so each `L_n` (Galois over `K`, being inside an abelian extension) is the unique subextension of degree `ℓⁿ`, the n-th cyclotomic layer, and no reduction is needed. For `ℓ = 2` let `K′` be the fixed field of `Gal(K(μ_{2^∞})/K) ∩ (1 + 4ℤ_2)`; then `[K′ : K] ≤ 2`, `K′` is abelian over `ℚ`, and `Gal(K(μ_{2^∞})/K′) ≅ ℤ_2`. Each `L_nK′` is a layer of the cyclotomic `ℤ_2`-extension of `K′`, so its p-part is bounded by the theorem for `K′`; and `[L_nK′ : L_n] ≤ 2` is prime to the odd prime `p`, so the p-part of the class group of `L_n` injects into that of `L_nK′`. Hence the bound, and eventual constancy as before. (The analogous passage to the fixed field of the pro-`ℓ` part would not do for odd `ℓ`: its degree divides `ℓ − 1`, which `p` may divide.)

**Checks.**

- `K = ℚ` is within the theorem, with the same distinct-prime requirement.
- Replacing `ℓ` by `p` changes the assertion and is not justified by this result.
- For `ℓ = 2`, `K = ℚ` and the tower `ℚ ⊂ ℚ(√−2) ⊂ ℚ(ζ₈) ⊂ ℚ(ζ₁₆) ⊂ ⋯`, every field has degree `2ⁿ` and embeds in a `ℚ(μ_{2^m})`, but the first layer is not the cyclotomic `ℤ_2`-layer `ℚ(√2)`; the reduction passes to `K′ = ℚ(i)`, over which `ℚ(ζ_{2^{m}})` are the cyclotomic layers, and the p-parts for odd `p` inject along the degree-2 steps.
- For `ℓ` odd, two nested towers with the stated degrees inside `K(μ_{ℓ^∞})` coincide: the prime-to-`ℓ` factor of the Galois group has no quotient of order `ℓ`.
- Passing to the abelian compositum `E(χ)` preserves the hypothesis needed for the second tower in the proof of Theorem A.

([Washington](https://doi.org/10.1007/BF01399512) §1, Theorem, p. 87; proof, §§2–4, pp. 88–97; [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, (4.13), p. 76 (Numdam PDF page 73; printed page `=` PDF page `+ 3).`)

*Needs:* TauCetiRoadmap.ClassFieldTheory Layers 11–13 (class groups through the global Artin map); DirichletPadicLFunctions §§0.4–0.6, Layers 2–3 (abelian character values and cyclotomic arithmetic). The nonvanishing of the distinct-prime character sums is proved within this target; neither an unspecified class-group theorem nor a higher ordinary modularity statement supplies it.

### 5.10 The distinguished nearly ordinary residual seed over `ℚ`

Diamond, The refined conjecture of Serre (1995), Theorem 6.4, in the form Skinner–Wiles 2001 use for their Theorem 5.2: for `p` odd and `ρ̄` : `G_ℚ → GL₂(F̄_p)` irreducible, satisfying AlgebraicModularFormsAndSerreWeights §7.5's `IsModular`, and p-distinguished (`ρ̄|_{D_p} ≅ (χ_1 *`; `0 χ_2), χ_1 ≠ χ_2`), with `p ≠ 3` or `ρ̄|_{G_{ℚ(√−3)}}` irreducible, there is a nearly ordinary cuspidal `π_1` of `GL₂/ℚ` whose p-adic representation is nearly ordinary at `p`, with quotient of finite-order inertia reducing to `χ₂` (a χ₂-good lift). An ordinary lift with unramified quotient is asserted only when `χ₂` is unramified.

Choose its eigenform witness through the supplied `ArisesFrom` predicate, retaining the coefficient reduction map and residue embedding. Prove this nearly ordinary seed refinement here with that residual modularity hypothesis; it is the seed hypothesis of SW01 Theorem 5.2 over `ℚ` (ClassicalSerreModularity `I.1/residually-irreducible-ordinary-lifting` takes the seed as input) and the `ℚ`-instance of the seed required by §5.8. It does not turn the residually reducible route into an application of Serre's conjecture.

**Checks.**

- When the residual local characters coincide the stated distinguished seed theorem does not apply.
- At `p=3` the extra irreducibility on `G_{ℚ(√−3)}` is retained; oddness alone does not imply it.
- The chosen quotient reduces to `χ₂`; reversing the chosen flag gives a different seed problem even for a split local representation. Identical global Frobenius polynomials do not distinguish the two flags.
- For `E=X₀(11)` at `p=7`, `a₂=−2` gives Frobenius discriminant `3` modulo 7 (nonsquare), while `a₇=−2` is a unit. Twisting `E[7]` by `ω₇` gives distinguished inertia characters `ω₇²,ω₇`; the selected quotient `ω₇` is ramified and cannot be the reduction of an unramified character.

(Source: Diamond, The refined conjecture of Serre, Theorem 6.4, as used in SW01 Theorem 5.2, p. 204 (PDF p. 21).)

*Needs:* SerreWeightAndLevelOptimisation §§3.1–3.6, 4.7–4.8; GL2AutomorphicRepresentationsAndTransfer §§R16.6.1–R16.6.5; AlgebraicModularFormsAndSerreWeights §7.5.

### Examples

The abelian theorem uses a cyclotomic `ℤ_ℓ` tower with `ℓ≠p`; the same-prime tower does not have the bounded p-primary class-group assertion. Hypothesis `H` uses one `c(ε)` for the whole tower: at degree `2ⁿd` the class-rank bound divided by degree is `c(ε)(2ⁿd)⁻ε`, tending to zero. A separately chosen constant for every field would not imply this. For an ordinary even-weight classical representation with unramified finite determinant character and odd `p`, the two inertia characters are `ω^{k−1}` and 1; `p−1` is even while `k−1` is odd, so they differ. The `p=2` case has trivial `ω` and is outside this theorem. The totally real inducing-field route gives the required `d/2` dihedral bound; a CM field must use the separate conditional full-scope argument of §5.8. The class of `290` at `p=17` in §5.1a requires local degree divisible by 8 at 2 and permits more than one prime above 2.

### Dependencies

ArithmeticGaloisDuality:§R02.4.6; AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1; AlgebraicModularFormsAndSerreWeights:§7.5; Chebotarev:Layer 10; ClassFieldTheory:Layers 7, 11–13; ClassicalSerreModularity:§I.1; DirichletPadicLFunctions:§§0.4–0.6, Layers 2–3; GL2AutomorphicRepresentationsAndTransfer:§§R16.6.1–R16.6.5, R17.4.8–R17.4.11; §6.14; §4.6a; §3.38; PadicFamilies:§5.8; SerreWeightAndLevelOptimisation:§§3.1–3.6, 4.7–4.8; §5.1; §5.1a; §5.10.

## Layer 6: Classical interpolation and solvable preparation

### 6.3 The Galois representation of a Hida family over `ℚ`

Let `p` be an odd prime (the `p≥5` branch used for the interpolation in §6.4), `N` prime to `p, Λ = ℤ_p[[1 + pℤ_p]]` with fraction field `L, T_N` Hida's ordinary cuspidal Hecke algebra of tame level `N` (PadicFamilies Layer 0) and `T^new_N` its new quotient (the maximal quotient acting faithfully on the ordinary forms new at level `N`; constructed here with the EPW properties below). (EPW Theorem 2.3.1.) There is a continuous `ρ` : `G_ℚ → GL₂(T^new_N ⊗_Λ L)`, characterised by `(1) ρ` unramified outside Np and (2) for `ℓ ∤` Np, `ρ(Frob_ℓ)` has characteristic polynomial `X² − T_ℓX + ⟨ℓ⟩ℓ^{−1}`; moreover `(3) ρ` is absolutely irreducible, (4) det `ρ` is `x ↦ ⟨x⟩x^{−1}` composed with the full cyclotomic character into the tame/p-adic unit quotient, and (5) the I_p-coinvariants of `ρ` are free of rank one and `Frob_p` acts on them by `U_p`. (Proposition 2.3.2.) For each minimal prime `𝔞` of `T^new_N, ρ_𝔞` has tame conductor `N`. (Proposition 2.3.3.) At a classical height-one prime `℘`, for a ρ-stable (T^new_N)_℘-lattice `𝓛` and `ℓ ≠ p, 𝓛_{I_ℓ}` is free, commutes with `⊗_Λ L` and specialises to `(𝓛/℘𝓛)_{I_ℓ}`, and `𝓛/℘𝓛` carries `ρ_{f_℘}`. (Theorem 2.3.4.) Each maximal ideal `m` has a semisimple residual `ρ̄_m` with the same trace and determinant modulo `m` and `ρ̄_m|_{D_p} ≅ (χ *`; `0 ψ`) with `ψ` unramified and `ψ(Frob_p) = U_p mod m`. (Proposition 2.3.5.) If `ρ̄_m` is irreducible, `ρ_m` has a model over `(T^new_N)_m`, unique up to isomorphism. Its generic I_p-coinvariant quotient has rank one. The full integral I_p-coinvariants are free of rank one only with the additional hypothesis `dim_k(ρ̄_m)_{I_p}=1`. To select an ordinary quotient without that dimension condition, assume the residual decomposition characters `χ,ψ` are distinct and retain the generic family quotient reducing to the chosen unramified `ψ`. Construct its saturated kernel and free rank-one unramified quotient, with Frobenius `U_p`; its reduction is the selected p-stabilisation (Definitions `2.3.6–2.3.7`). The integral coinvariant clause of EPW Proposition 2.3.5 is used with this dimension qualification; integral reconstruction alone does not prove it.

The Hecke algebra and arithmetic control are supplied by PadicFamilies Layer 0; construct its EPW new quotient here with the properties below; the existence of the big ordinary Galois representation is PadicFamilies Layer 4. Keep here the EPW §2.3 refinements on the new quotient: Frobenius characterization, determinant, inertia coinvariants, conductor, lattice specialization and the residual and integral models. ClassicalSerreModularity `I.1/nearly-ordinary-hecke-algebras` covers even-degree totally real `F` only (Skinner–Wiles' quaternionic towers); this is the classical family over `ℚ`, from Hida (Invent. Math. 85, 1986, Theorem 2.1) and Greenberg–Stevens (Theorem 2.6) as recalled by EPW. The integral model in Proposition 2.3.5 needs `ρ̄_m` irreducible; in the residually reducible case only the pseudo-representation is integral.

Construct the new quotient `T^new_N` as the quotient of `T_N` by the common annihilator of ordinary eigenforms new at tame level `N`. Prove that it is finite, reduced and torsion-free over `Λ`, that its classical primes correspond exactly to forms of tame conductor `N`, and that it is étale over `Λ_℘` after localizing weight space at a classical prime `℘`. This is EPW Definition 2.2.1 and Theorem 2.2.2, pp. 8–10. Include the EPW Theorem 2.1.2 correspondence between classical height-one primes of `T_N` and Galois-conjugacy classes of ordinary eigenforms.

**Checks for the new quotient.**

- An ordinary eigensystem new at tame conductor `N` survives the quotient with its original Hecke eigenvalues.
- A system old from a proper tame divisor contributes no new eigensummand; simply retaining all tame-level `N` forms gives the wrong quotient.
- Étaleness is asserted at classical primes after localizing weight space; the assertion does not make every Eisenstein or nonclassical point étale.

Existence over each primitive branch: PadicFamilies §4.1 (Hida; Greenberg–Stevens, as cited by EPW), assembled over the minimal primes of `T^new_N` using (3) of EPW Theorem `2.2.2 (T^new_N ⊗ Λ_℘` is étale over `Λ_℘` at classical `℘`).

Proposition 2.3.2: compare dim `V_{I_ℓ}` with dim `V(℘)_{I_ℓ}` through the conductor formula; the determinant of `ρ_𝔞(σ) − 1` on `V^{J_ℓ}` lies in every classical `℘` of the normalisation, hence vanishes.

Theorem 2.3.4: reduce an integral model over the normalisation, semisimplify and descend.

Proposition 2.3.5, integral model: Carayol's theorem (LocalGaloisDeformationRings §F.2.7 and IntegralHeckeAndGaloisDeterminants Layer 1), since the traces lie in `(T^new_N)_m` and `ρ̄_m` is irreducible. For the full integral coinvariants, reduction commutes with coinvariants. If the residual coinvariant dimension is one, Nakayama makes them cyclic; their generically free rank-one property and the reduced, weight-torsion-free coefficient ring make the cyclic presentation injective, hence free.

For the selected quotient under distinct residual decomposition characters, choose a decomposition element separating them. Hensel lifting its two eigenvalues splits the integral rank-two module into free rank-one eigensummands. The generic family quotient selects one summand; generic stability and unramifiedness descend because the coefficient ring embeds in its generic algebra. Its complementary kernel is saturated, and the quotient has Frobenius `U_p`. This quotient need not equal the full inertia coinvariants.

Provide the following operations and compatibility statements.

- The family representation `ρ : G_ℚ → GL₂(T^new_N ⊗_Λ L)`.
- Characteristic polynomials: for `ℓ ∤ Np`, the characteristic polynomial of `ρ(Frob_ℓ)` is `X² − T_ℓX + ⟨ℓ⟩ℓ^{−1}`.
- Determinant: `det ρ = ⟨·⟩(·)^{−1}` composed with the cyclotomic character.
- Ordinarity: over the generic coefficient algebra, the I_p-coinvariants are free of rank one with `Frob_p` acting by `U_p`.
- Integral coinvariants: under residual global irreducibility and `dim_k(ρ̄_m)_{I_p}=1`, the full integral inertia coinvariants are free of rank one.
- The selected quotient: under residual global irreducibility and distinct decomposition characters, with the selected generic ordinary quotient reducing to `ψ`, construct the saturated integral kernel and free unramified quotient with Frobenius `U_p`.
- Tame conductor (Proposition 2.3.2): `ρ_𝔞` has tame conductor `N`.
- Integral model (Proposition 2.3.5): the model `ρ_m` over `(T^new_N)_m` when `ρ̄_m` is irreducible.
- Specialization: at a classical `℘`, the reduction of a lattice carries `ρ_{f_℘}`.

**Checks.**

- At the weight-2 point of the family through `X₀(11)` at `p = 5` (§6.5) the specialisation is `ρ_{f,5}`, with `U_5 ↦ a_5 ≡ 1 mod 5`.
- At a classical `℘` of weight `k` and trivial character, det `ρ_{f_℘} = ε^{k−1}`.
- For `ρ̄_m` reducible (the Eisenstein component through `X₀(11)` at 5), Proposition 2.3.5 does not apply; only the traces are integral.
- The unramified quotient reduces to `ψ` with `ψ(Frob_p) = U_p mod m` (Theorem 2.3.4).
- Check the ordinarity statement against the unit-root criterion: at a classical `℘` of weight `k, U_p ↦` the unit root `α_p` of `f_℘` and the unramified quotient is the one of PadicHodgeTheory §6.4.
- Do not claim a GL₂(T^new_N)-valued representation without an irreducibility hypothesis on `ρ̄_m`.
- Proposition 2.3.3 is about inertia coinvariants, not invariants. Track their quotient maps and specialization isomorphisms with subscript notation.
- For the CM theta family through `η(z)η(23z)` at `p=13`, the irreducible residual S₃ representation is unramified at 13. Its full residual inertia coinvariants have dimension two, so the integral coinvariants cannot be free of rank one. Here `a₁₃=−1` and `X²+X+1=(X−3)(X−9)` modulo 13; selecting one Frobenius eigenspace gives an ordinary quotient without identifying it with all coinvariants.
- A scalar residual decomposition action fails the distinct-character hypothesis for the integral selected-quotient construction; global residual irreducibility alone does not select its local line.

([EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Theorem 2.3.1, p. 10 (arXiv v1; printed page `=` PDF page); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, proof of Theorem 2.3.1, p. 10 (arXiv v1; printed page `=` PDF page); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Proposition 2.3.2, p. 11 (arXiv v1; printed page `=` PDF page); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Proposition 2.3.3, p. 12, and Theorem 2.3.4, p. 13 (arXiv `v1`); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Proposition 2.3.5 and Definitions 2.3.6–2.3.7, p. 13 (arXiv v1; printed page `=` PDF page); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Definition 2.3.7, p. 13 (arXiv v1; printed page `=` PDF page).)

*Needs:* PadicFamilies:§4.1; PadicFamilies:Layer 0; PadicFamilies:§0.11; PadicFamilies:§0.13; LocalGaloisDeformationRings:§F.2.7; AutomorphicGaloisRepresentations:§1.5; AutomorphicGaloisRepresentations:§6.4.

### 6.4 The exported ordinary newform lies in a Hida family

Let `p ≥ 5` and let `f` be a newform of weight `k ≥ 2` and level `N₀pᵃ`, with `p∤N₀` and `a≥0`, that is ordinary at `p (a` unit `U_p-` or T_p-eigenvalue root). Retain its actual finite p-power nebentypus and conductor in PadicFamilies §§0.11,0.13's finite-character control. Use its ordinary p-stabilisation `f_α` when `a=0`. Then this ordinary eigensystem is the specialisation at a classical height-one prime of a unique primitive component `𝒦` of Hida's ordinary Hecke algebra of tame level `N₀` (EPW Theorems 2.1.2 and 2.2.2(2),(3)), and the Galois representation of §6.3 specialises there to `ρ_{f,λ}`. In particular, if `ρ` is exported by ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting` or `I.1/residually-irreducible-ordinary-lifting`, with the level of `I.1/ordinary-exact-level`, under the ordinary hypothesis `ρ|_{I_p} ≅ (∗ ∗`; 0 1), the newform `f` with `ρ ≅ ρ_{f,λ}` is ordinary at `p` and lies in a Hida family whose representation interpolates `ρ`.

We take `p ≥ 5`, the range of PadicFamilies Layer 0's control theorem. Ordinarity of `f` from that of `ρ`: an unramified quotient of `ρ|_{G_{ℚ_p}}` forces a unit root (PadicHodgeTheory §6.4). For the full finite-character range, uniqueness of `𝒦` follows from EPW Theorem 2.2.2(2),(3) on the tame-new quotient constructed in §6.3.

EPW §2.1 (after Theorem 2.1.2): classical height-one primes of `T_N` of weight `k` correspond to Galois-conjugacy classes of p-ordinary normalised eigenforms of tame level `N` and weight `k ≥ 2`; hence `f_α` gives a classical prime `℘_f`.

EPW Theorem 2.2.2(2) puts the tame-new eigensystem at a classical prime of the new quotient; (3) makes that quotient finite étale over its classical weight DVR. The local ring at this prime is a DVR, hence has exactly one minimal prime: the point lies on a unique primitive component. Hida Corollary 3.7 supplies the Γ₁(N₀p) specialization; it alone does not cover primitive characters of conductor p².

Specialisation: §6.3 (Proposition 2.3.3 and the characterisation by traces).

For the export: `ρ|_{I_p} ≅ (∗ ∗`; 0 1) gives an unramified quotient, so `f` is ordinary by the ordinarity criterion.

**Checks.**

- Record multiplicity: a p-old `f` of level `N₀` has two p-stabilisations and only one is ordinary.
- `k = 2` is allowed for cusp forms (PadicFamilies Layer 0/hida-control-theorem uses `k ≥ 2` for cusp forms).
- A primitive wild nebentypus of conductor `p²` forces the primitive level to contain `p²`, even when the ordinary quotient is unramified. Its finite-character control quotient retains that conductor.

([EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.1, Theorem 2.1.2 and its following discussion, pp. 7–8; §2.2, Theorem 2.2.2(2),(3), p. 9 (arXiv v1); [Hida](<https://www.numdam.org/item/10.24033/asens.1507.pdf>) §3, Corollary 3.7, p. 253 (Numdam PDF page 24; printed page `=` PDF page `+ 229).`)

*Needs:* §6.3; ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting`, `I.1/residually-irreducible-ordinary-lifting` and `I.1/ordinary-exact-level` (the exported newform and its level); PadicFamilies:§0.15; PadicFamilies:§0.13; PadicHodgeTheory:§6.4.

### 6.5 Worked Check: `X₀(11)` at `p = 5`

Assume the explicit level-11 data: `f` is the normalised newform spanning `S₂(Γ₀(11)), X₀(11)` has genus 1, its Hecke algebra `T` is `ℤ`, and Mazur's Eisenstein ideal `𝔍 ⊆ T` (generated by `1 + w` and the `T_ℓ − 1 − ℓ, ℓ ≠ 11`) has `T/𝔍 ≅ ℤ/n` with `n = numerator((11 − 1)/12) = 5` (Proposition `II.9.7`). These finite data are hypotheses of this worked Check. Then `a_ℓ(f) ≡ 1 + ℓ mod 5` for every prime `ℓ ≠ 11`. Hence: (a) `a_5(f) ≡ 1 mod 5`, so `f` is ordinary at 5 (an ordinary weight-two form); (b) `ρ̄_{f,5}^{ss} ≅ 1 ⊕ ω` by Chebotarev and Brauer–Nesbitt, a residual split p-distinguished representation: `χ = ω` is odd and ramified at 5, so `χ|_{D_5} ≠ 1`; (c) `ρ_{f,5}` is irreducible and satisfies the hypotheses of the residually reducible ordinary theorem over `ℚ` (ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting`) with `k = 2`, so that theorem applies (and returns `f`); (d) the reducible `1 ⊕ ε₅` also has residual `1 ⊕ ω` and satisfies the same hypotheses apart from irreducibility, with `k = 2` and odd determinant, but is attached to no cuspidal newform, so the irreducibility hypothesis cannot be dropped; (e) `p = 5` is in the range of Hida theory, and the ordinary 5-stabilisation `f_α` of level 55 lies in a Hida family (§6.4) whose specialisations at weights `k ≡ 2 mod 4` have trivial character; for `k > 2` they are 5-old, since a form new at 5 of weight `k` and trivial character has `a_5² = 5^{k−2}`, not a unit.

This example exercises an ordinary weight-two form and its arithmetic specialisations, a residual p-distinguished split representation, and the irreducibility hypothesis on the characteristic-zero representation. The family's residual representation is reducible (Eisenstein), so only its pseudo-representation is integral (§6.3, Proposition 2.3.5 does not apply).

`n = numerator(10/12) = 5` and `T/𝔍 ≅ ℤ/5` (Mazur Proposition `II.9.7`); `T = ℤ` gives the congruences.

`a_5 ≡ 1 + 5 ≡ 1`: a unit, so `f` is 5-ordinary; the unramified quotient of `ρ_{f,5}|_{G_{ℚ_5}}` reduces to 1 and the sub to `ω`.

`ω` has order 4 on `I_5`, so the two residual characters differ on `I_5`.

`1 ⊕ ε₅` is reducible; cuspidal newforms have irreducible `ρ_{f,λ}` (AutomorphicGaloisRepresentations §1.5).

Weights: the family's character at weight `k` is `ω^{2−k}`, trivial exactly when `4 | k − 2`; for `f` new at 5 with trivial character, `a_5² = 5^{k−2}` (AutomorphicGaloisRepresentations §§4.4, 4.12 and 6.4, the Steinberg local factor).

**Checks.**

- Check the numerology in the arithmetic examples: `n = 5, a_5 ≡ 1 mod 5, ω` nontrivial of order 4, and `5 | a_5²` for new forms of weight `k > 2`.

([Mazur](<https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf>) Chapter II, Proposition 9.7 and the definition of Eisenstein primes, p. 96 (Numdam PDF page 65; printed page `=` PDF page `+ 31`); [Mazur](<https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf>) Chapter II, before Proposition 9.8, p. 96 (Numdam PDF page 65; printed page `=` PDF page `+ 31).`)

*Needs:* ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting`; §6.4; TauCetiRoadmap.ModularForms (the level-11 newform); AutomorphicGaloisRepresentations:§1.5; AutomorphicGaloisRepresentations:§6.4.

### 6.6 When p-distinguishedness holds and when it fails

(a) Let `ρ` satisfy (`ii) ρ|_{I_p} ≅ (∗ ∗`; 0 1) and det `ρ = ψε^{k−1}` of the residually reducible ordinary theorem over `ℚ` (ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting`) with `ψ` unramified at `p` and `p` odd. On `I_p` the residual sub-character is `ω^{k−1}` and the quotient is 1, so they differ as soon as `(p − 1) ∤ (k − 1)`; for `k` even this always holds, and the distinguishedness hypothesis `χ|_{D_p} ≠ 1` is automatic. (b) The hypothesis fails for the odd character `χ_{−23}` of `ℚ(√−23)` at `p = 3: 3` splits in `ℚ(√−23)` because `−23 ≡ 1 mod 3`, so `χ_{−23}|_{D_3} = 1`, and that theorem says nothing about `ρ` with `ρ̄^{ss} ≅ 1 ⊕ χ_{−23}`. By (a), an ordinary `ρ` of this kind with `ψ` unramified at 3 would need `k − 1` even. Whether such `ρ` exist is not asserted.

Distinguishedness is a condition on the residual character only; this example checks it against the other hypotheses.

(a) `ω^{k−1}|_{I_p} = 1` exactly when `(p − 1) | (k − 1)`; `p − 1` is even and `k − 1` is odd for `k` even.

(b) `−23 ≡ 1 mod 3` is a square, so 3 splits in `ℚ(√−23)` and `Frob_3 ↦ 1` under `χ_{−23}`; `χ_{−23}` is unramified at 3 and odd.

**Checks.**

- Check both parity facts and the splitting of 3 in the arithmetic examples.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) Introduction, p. 6 (Numdam PDF page 3).)

*Needs:* ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting`.

### 6.14 Solvable preparation for Skinner–Wiles lifting

Skinner–Wiles, Base change and a problem of Serre, Duke Math. `J`. 107 (2001), 15–25, unnumbered theorem on p. 17 and the weight-conversion paragraph there, with the local preparation on pp. 18–19. For an odd `p` and an absolutely irreducible modular residual representation over a totally real `F` arising from a weight-two Hilbert newform `f`, there is a solvable totally real `F′/F` in which all p-places split completely, the residual representation remains irreducible, and a weight-two form `g` realizes its restriction with level dividing the p-power part of level(f) times the product of residually ramified primes away from p. Ordinary or nearly ordinary, distinguishedness, and the chosen good quotient are preserved. Starting at weight `≥2` first use the Hida/Wiles family conversion to weight two on p. 17. Auxiliary prescribed splitting/ramification there is for a finite set outside level(f), not unrestricted level primes. The even-degree and large-local-degree preparation in the proof of SW01 Theorem 5.1 (ClassicalSerreModularity `I.1/residually-irreducible-ordinary-lifting`) is a further step, rather than a conclusion of this theorem alone.

Construct this level-lowering base change and its preservation of the selected nearly ordinary quotient. The construction uses solvable base change, ordinary Hilbert weight conversion and the local preparation at the specified auxiliary places.

**Checks.**

- Splitting every p-place in the first extension preserves its local degree; the large-local-degree extension in the proof of SW01 Theorem 5.1 is a separate construction.
- Prescribed auxiliary conditions apply outside the level of the initial form; they do not permit arbitrary changes at level primes.
- For an ordinary distinguished seed, transport the selected unramified quotient; for a nearly ordinary seed, retain its finite inertial character instead of asserting it becomes trivial.

(Source: SW base change, unnumbered theorem and weight conversion, p. 17; local preparation, pp. 18–19.)

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.4.8–R17.4.11; PadicFamilies §5.8; AutomorphicGaloisRepresentations §§3.11–3.14, 5.1.

### Examples

At `X₀(11), numerator(10/12)=5` gives the Eisenstein congruence `a_ℓ≡1+ℓ mod 5`. Thus `a₅≡1` and `ω` has order 4 on inertia at 5. The irreducible `ρ_{f,5}` satisfies the ordinary lifting hypotheses; the reducible `1⊕ε₅` has the same residual semisimplification but cannot be the representation of a cuspidal newform. The ordinary 5-stabilization lies in a primitive family; at `k≡2 mod 4` its character is trivial. For `k>2` a form new at 5 with trivial character has `a₅²=5^{k−2}`, so it cannot be ordinary: those ordinary specializations are 5-old. The family’s reducible residual system permits integral traces but does not meet the integral GL₂-valued model hypothesis. At `p=3` the odd quadratic character `χ_{−23}` is trivial on `D₃` because `−23≡1 mod 3`, so the distinguishedness hypothesis fails; no existence of a corresponding ordinary characteristic-zero representation is inferred.

### Dependencies

§6.3; ClassicalSerreModularity:§I.1; PadicFamilies §§0.11,0.13,0.15,4.1,5.8; PadicHodgeTheory §6.4; LocalGaloisDeformationRings §F.2.7; IntegralHeckeAndGaloisDeterminants Layer 1; AutomorphicGaloisRepresentations §§1.5,3.11–3.14,5.1,6.4; GL2AutomorphicRepresentationsAndTransfer §§R17.4.8–R17.4.11; TauCetiRoadmap.ModularForms.

## Downstream consumers

ClassicalSerreModularity §I.1 owns the Skinner–Wiles route and the two classical ordinary lifting theorems with their exact-level export; SmallRamificationAndAbelianVarietyBaseCases §5.0e owns the terminal ordinary and level-one cases. Consumers of those theorems cite those owners. What this roadmap supplies downstream: GL2ModularityLifting and later lifting roadmaps take the conditional Theorem `B` of §5.3 under Hypothesis `H`, the abelian preparation of §5.1a, the conditional full-scope export of §5.8, which requires component support for every complex-place inducing field, the χ₂-good seed of §5.10 and the solvable descent of §4.6a. PotentialModularityAndCompatibleSystems Layer 6 uses §§1.4–1.5 and 2.9–2.10, Layer 8 uses §2.1, Layer 9 uses the Hilbert Hida specialization of §2.11, and its later layers use the numerical criterion of §4.20 and the level-lowering base change of §6.14. General-weight consumers of §2.1 retain the full quotient character and distinguish ordinarity from smooth ordinarity.

## References

- **SW99.** C. M. Skinner and A. J. Wiles, [Residually reducible representations and modular forms](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>). Publications mathématiques de l'IHÉS 89 (1999), 5–126, DOI 10.1007/BF02698855; Numdam open-access scan (123 pages, OCR text layer; printed page = PDF page + 3).
- **SW01.** C. M. Skinner and Andrew J. Wiles, [Nearly ordinary deformations of irreducible residual representations](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>). Annales de la Faculté des Sciences de Toulouse (6) 10 (2001), no. 1, 185–215; Numdam open-access scan (32 pages, OCR text layer; printed page = PDF page + 183).
- **EPW.** Matthew Emerton, Robert Pollack and Tom Weston, [Variation of Iwasawa invariants in Hida families](<https://arxiv.org/pdf/math/0404484v1>). arXiv:math/0404484v1 (2004), 50 pages; published in Invent. Math. 163 (2006), no. 3, 523–580. Page numbers are those of the arXiv v1 PDF (printed page = PDF page).
- **Hida.** Haruzo Hida, [Iwasawa modules attached to congruences of cusp forms](<https://www.numdam.org/item/10.24033/asens.1507.pdf>). Ann. Sci. École Norm. Sup. (4) 19 (1986), no. 2, 231–273, DOI 10.24033/asens.1507; Numdam open-access scan (44 pages; printed page = PDF page + 229).
- **Mazur.** Barry Mazur, [Modular curves and the Eisenstein ideal](<https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf>). Publ. Math. IHÉS 47 (1977), 33–186; Numdam open-access scan (155 pages; printed page = PDF page + 31).
- **BLGG12.** Thomas Barnet-Lamb, Toby Gee and David Geraghty, [Congruences between Hilbert modular forms: constructing ordinary lifts](<https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMF.pdf>). Duke Math. J. 161 (2012), no. 8; author PDF with 47 numbered pages.
- **BLGG13.** Thomas Barnet-Lamb, Toby Gee and David Geraghty, [Congruences between Hilbert modular forms: constructing ordinary lifts, II](<https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMFpostBLGGTversion.pdf>). Math. Res. Lett. 20 (2013), no. 1, 67–72; six-page author PDF with provisional running pagination 10001–10006; locators use PDF pages.
- **NT.** James Newton and Jack A. Thorne, [Symmetric power functoriality for Hilbert modular forms](<https://arxiv.org/pdf/2212.03595v2>). Ann. of Math. 203 (2026), no. 1, 283–347, DOI 10.4007/annals.2026.203.1.4; locators use arXiv:2212.03595v2, 19 February 2025; locators are that version’s numbered PDF pages.
- **BCGP.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](<https://www.ma.imperial.ac.uk/~tsg/Index_files/abeliansurfacesmodular.pdf>). Publ. Math. IHÉS 134 (2021), 153–501; 292-page author version, arXiv:1812.09269; locators use its numbered pages.
- **ACC.** Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, [Potential automorphy over CM fields](<https://arxiv.org/abs/1812.09999>). Ann. of Math. 197 (2023), 897–1113; the author version carries the published running pagination.
- **SW base change.** C. M. Skinner and A. J. Wiles, [Base change and a problem of Serre](https://citeseerx.ist.psu.edu/document?doi=78be3e19b2caf9a472352165d0685620cf710b2f&repid=rep1&type=pdf), Duke Math. J. 107 (2001), no. 1, 15–25, DOI 10.1215/S0012-7094-01-10712-6; unnumbered theorem and weight conversion, p. 17; local preparation, pp. 18–19.
- **Waldschmidt.** M. Waldschmidt, [A lower bound for the p-adic rank of the units of an algebraic number field](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/CollMathSocBolyai1981.pdf), in Topics in Classical Number Theory (Budapest, 1981), Colloq. Math. Soc. János Bolyai 34, North-Holland (1984), 1617–1650; author scan with the printed pagination.
- **Washington.** L. C. Washington, [The non-p-part of the class number in a cyclotomic ℤ_p-extension](https://doi.org/10.1007/BF01399512), Invent. Math. 49 (1978), 87–97, §1 theorem, p. 87; proof §§2–4, pp. 88–97.
