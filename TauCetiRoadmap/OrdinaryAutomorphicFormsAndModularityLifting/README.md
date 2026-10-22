# Roadmap: ordinary automorphic forms and ordinary modularity lifting

**Summary.** Build the ordinary deformation–Hecke comparison for two-dimensional Galois representations, starting from ordinary quaternionic and Hilbert Hecke modules and ending with the Skinner–Wiles lifting theorems and classical interpolation in ordinary families. The reducible-residual route uses permissible Eisenstein maximal ideals and pro-modularity; the irreducible-residual route uses a chosen distinguished ordinary quotient and an existing modular residual seed.

## Scope and ownership

This roadmap owns the arithmetic comparisons of ordinary Hecke algebras with deformation and pseudo-deformation rings, the permissible and nice-prime conditions, the arithmetic verification of characteristic-p patching, the resulting localized `R = T` statements, and their ordinary modularity consequences. Suggested.lean states the connectedness and component-intersection theorems of §4.3, the numerical criterion of §4.20 and the distinct-prime class-group theorem of §5.9.

PadicFamilies, Layers 0a, 0, 4 and 5, owns ordinary projectors, towers, control, freeness, weight algebras and the classical big ordinary Galois representation. The comparisons and EPW new-quotient refinements below add arithmetic compatibility. HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.22 supplies fixed-central-character definite forms, neat levels and integral pairings. GL2AutomorphicRepresentationsAndTransfer §§R17.3.1–R17.3.9, R17.4.8–R17.4.11 and R17.4.16 supplies Jacquet–Langlands, solvable base change/descent and quadratic induction. Sections 1.6, 4.6a and 6.14 specify the additional arithmetic realization, single-coefficient descent and solvable preparation needed here.

LocalGaloisDeformationRings, Layer `F` and Layers 6–8, owns generic deformation functors, Schur representability, local ordinary rings and determinant–flag spectrum comparisons. GlobalGaloisDeformations §§3.4–3.8 owns relative global presentations, and Layer R04.6 §§6.7–6.8 owns the finite-flat Hecke–Galois datum and its unframed classifying maps. DeformationAndDerivedPatchingAlgebra §§3.1–3.2, 5.5–5.6 and 6.6 owns depth, free-module patching and connectedness dimension. The exact characteristic-p patching theorem and numerical criterion used here are targets of §4.20, and §4.3 proves the Cohen–Macaulay intersection bound. Wiles' ordered triples `(a,d,x)` present trace data relative to a fixed normalizing element; IntegralHeckeAndGaloisDeterminants §0.5 supplies their comparison with invariant pseudocharacters and determinants.

Existing Mathlib quaternion algebras, restricted products, finite fields, power series, local rings and finite/free modules supply the algebraic carriers. For the commutative algebra `𝒪[t]` the ordinary idempotent is the factorial-powers idempotent of TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants, Layer 2; §1.1 only compares Skinner–Wiles' exponent with it. TauCetiRoadmap.LocalGaloisGroups and ProfiniteArithmetic supply the general local/profinite arithmetic boundaries, and TauCeti's classical modular forms supply their existing Hecke and q-expansion infrastructure. Ordinary projection, permissible Eisenstein localization, the nonsplit residual extension conditions and the arithmetic `R = T` comparisons are additional targets here; generic local Galois groups, adèles and classical modular-form spaces are not reconstructed.

The distinct-prime abelian cyclotomic class-group bound needed in Theorem A is stated in §5.9 as part of this ordinary lifting route. Waldschmidt's lower bound for the p-adic rank of units, which gives the unit-rank inputs of §3.30, §5.2 and §5.3, is stated in §3.38. Neither a complex-logarithm estimate nor a `μ = 0` theorem in a same-prime tower supplies those two inputs. The full-scope export for `F≠ℚ` in §5.8 is conditional on `CMComponentSupport`: after the specified solvable preparation, a minimal prime `q⊆ker(x_L)` satisfies `ker(r_{𝒟_L})⊆q`. This explicit Hecke-support hypothesis retains the selected local quotients and is not supplied by the dihedral dimension bound of §3.30.

ClassicalSerreModularity §I.1 owns the classical ℚ ordinary lifting theorems, their full-scope imaginary-quadratic correction and general exact-level export. SmallRamificationAndAbelianVarietyBaseCases §5.0e owns the small terminal ordinary and level-one cases. Sections 5.4, 5.7 and 6.1 identify the specializations of the totally real arithmetic comparisons with those contracts; they do not duplicate their proof targets.

## Conventions

For the Skinner–Wiles constructions, `p` is an odd prime, `F` is totally real, `d = [F:ℚ], 𝒫 = {v₁,…,v_t}` is the set of places over `p`, and `d_i = [F_{v_i}:ℚ_p]`. Fix an identification of algebraic closures `Q̄_p` and `ℂ` when comparing algebraic eigenforms and p-adic Hecke eigenvalues. The quaternionic realization additionally requires `d` even and uses the algebra `D/F` ramified exactly at infinity and split at every finite place. Let `𝒪` be the ring of integers of a finite extension of `ℚ_p`, with uniformizer `ϖ`, fraction field `K` and finite residue field `k`. Complete local coefficient rings are Noetherian 𝒪-algebras with specified residue field. Equal-characteristic `k[[λ]]` enters only after reduction at a characteristic-p prime and in the patching argument, not as a replacement for `𝒪` in the arithmetic lifting hypotheses.

Write `X(U) = D×\Gᴰ(𝔸_f)/U` and identify `H⁰(X(U),R)` with functions `X(U) → R`. The stabilizer order is `c_U(x)`. The arithmetic pairing is `Σ_x c_U(x)⁻¹ f(x)g(x)`, defined over `R` when these orders are units. Over a field the finite-set pairing formula is defined for any counts, but perfectness requires every cast count to be nonzero; the inverse-of-zero convention does not remove this requirement. On one point over `ℚ, c=2` and `f=3,g=4` give 6; `c=0` gives 0 and a degenerate pairing. Over `𝔽₂, c=2` also gives zero. A unit-stabilizer two-point set gives `2·4+3·5=23`.

For a finite-set map `π:Y → X`, restriction is `f ↦ f∘π` and the fibre trace is `g ↦ (x ↦ Σ_{π(y)=x}g(y))`, with no division by the fibre size. Two values 2 and 3 in one fibre have trace 5, and an empty fibre has trace 0. The arithmetic level trace sums level cosets, so a class `y` above `x` occurs `c_U(x)/c_V(y)` times; it agrees with the unweighted fibre trace when the effective stabilizers are free. For `c_U(x)=2,c_V(y)=1` and `g(y)=3` it has value 6, making the target weighted value `(1/2)·6=3` equal the source value. The superscript `⁺` denotes the action through the Hecke adjoint `t⁺`, not a norm-factor subspace or a central-character condition. A central double coset `z` translates in one direction, and its adjoint translates by `z⁻¹`. The completed group-ring duality uses the coefficient of the identity, not the augmentation that sends every group element to 1.

Normalize the residually reducible representation as `ρ_c = (1 c;0 χ)`, with `χ` totally odd and `χ|D_i ≠ 1`. Require `c ≠ 0` where the Schur condition is used. Its ordinary local flag has sub-character reducing to `χ` and quotient reducing to 1; local admissibility permits that flag by requiring the residual extension to split at p. Distinguish this local flag from the displayed global upper-triangular presentation. With an irreducible residual representation use the specified local characters `χ₁⁽ⁱ⁾,χ₂⁽ⁱ⁾` and the χ₂-good ordinary modular seed. Distinctness is on `D_i`; it need not hold on inertia.

The weight algebras `Λ′_𝒪` and `Λ_𝒪` have determinant variables `X_i` and `T_i` respectively, and quotient-character variables `Y_j⁽ⁱ⁾`. A coordinate `1+T_i` is sent to `detρ(γ_i)`, not its inverse. If the inertia lattice has indices `p^{r_i}, Λ_𝒪` is free of rank `p^{Σ r_i}` over `Λ′_𝒪`. One index `r=1` at `p=5` gives rank 5, and all `r_i=0` give rank 1.

Wiles' ordered pseudo-representation has `tr(σ)=a(σ)+d(σ), det(σ)=a(σ)d(σ)−x(σ,σ)`, and `x(σ,τ)=b_σc_τ` for an actual matrix representation. A diagonal representation has `x=0`; `x` alone cannot distinguish nonzero extension classes. Conjugation by `diag(u,u⁻¹)` scales `b` by `u²` and `c` by `u⁻²`, leaving `x` invariant. All quotient-character recovery formulas divide by a difference of distinct residual eigenvalues, which is a unit in the complete local ring. With sub-eigenvalue `β` and quotient-eigenvalue `α`, the quotient is `(β trρ(σ)−trρ(gσ))/(β−α)`. For `β=3,α=1` and diagonal values 5,1, this is 1; multiplying instead of dividing gives 4. The §2.5 choice labels the sub-eigenvalue `α` and quotient `β` instead, giving `(trρ(gσ)−α trρ(σ))/(β−α)`.

Twisting by `Ψ` multiplies trace by `Ψ` and determinant by `Ψ²`; a local quotient eigenvalue `T₀(λ)` becomes `Ψ(λ)T₀(λ)`. For `Ψ(λ)=2` and eigenvalue 3 it becomes 6, rather than 3/2. All level maps, deformation quotient maps, specialization maps and completion maps below must respect these weight coordinates.

The Skinner–Wiles/classical convention has `detρ_f=ψ ε^{k−1}`. The dual regular-algebraic convention used by BLGG, BCGP and Newton–Thorne has weight-zero Hodge–Tate weights `{0,1}` and determinant `ε⁻¹` for trivial central character. Dualization reverses a filtration: `0→ε→V→1→0` becomes `0→1→V∨→ε⁻¹→0`. The Newton–Thorne weight change has weights `{0,2}` and determinant `ε⁻²ω`, whose reduction is `ε̄⁻¹`. Translate the representation and its chosen line together when switching conventions.

`R = T` below means the displayed minimal-level or all-level map after the stated weight base change, localization and completion at a nice prime. It does not mean an isomorphism of the unrestricted global rings. Likewise, the determinant–flag comparison is an assertion about points, underlying spectra and components on a distinct-character open subset; it does not identify nonreduced coefficient functors.

## Exact supplier contracts

Mathlib is pinned at `6b7abb3` and Tau Ceti at `a91d3aa`. The following are the mathematical inputs, with their coefficient, residual and normalization hypotheses retained. Sections §1.6, §2.12, §3.39, §4.6a, §4.20, §5.10 and §6.14 supply the arithmetic refinements specified here.

### From Mathlib and Tau Ceti

Use `Module.Free` (Mathlib.LinearAlgebra.FreeModule.Basic), `Module.Finite` (Mathlib.RingTheory.Finiteness.Defs), `MvPowerSeries` (Mathlib.RingTheory.MvPowerSeries.Basic), `IsLocalRing` (Mathlib.RingTheory.LocalRing.Defs), `IsIdempotentElem` (Mathlib.Algebra.Group.Idempotent), `FiniteField.pow_card_sub_one_eq_one` (Mathlib.FieldTheory.Finite.Basic), and `Fintype.sum_fiberwise`, the additive declaration generated by `Fintype.prod_fiberwise` (Mathlib.Algebra.BigOperators.Group.Finset.Basic). A basis, finite generation, Noetherianity, completeness and ordinary arithmetic control are separate assertions. The finite-field exponent identity requires a nonzero element; the empty function module has a vacuously perfect pairing.

The carriers `IsDedekindDomain.FiniteAdeleRing` (Mathlib.RingTheory.DedekindDomain.FiniteAdeleRing), `NumberField.IsTotallyReal` (Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex), `QuaternionAlgebra` (Mathlib.Algebra.Quaternion), `NumberField.Units.rank` (Mathlib.NumberTheory.NumberField.Units.DirichletTheorem), `PadicComplex` (Mathlib.NumberTheory.Padics.Complex) and `CharacterModule` (Mathlib.Algebra.Module.CharacterModule) supply finite adèles, real signatures, quaternion algebras, unit ranks, the completed algebraic p-adic field and algebraic additive characters. `CharacterModule` alone does not supply 𝒪-linear `K/𝒪` duality or compact/discrete topological duality; those are supplied below. The Iwasawa logarithm required by §3.38 is supplied by DirichletPadicLFunctions §0.6, with its nonzero domain and normalization `log_p(p)=0`.

Tau Ceti supplies `HeckeRing.GL2.Newform` and `HeckeRing.GL2.Newform.qExpansion_coeff_one` (TauCeti.NumberTheory.ModularForms.Newforms.Newform), `TauCeti.Newform.heckeTDiamondCuspNewCharacter` (TauCeti.NumberTheory.ModularForms.Newforms.Hecke.Algebra), and `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` (TauCeti.NumberTheory.ModularForms.Newforms.StrongMultiplicityOne). Use these classical newforms, their normalized q-expansions and Hecke characters at their existing scope. The Hilbert ordinary towers and Galois comparisons use the arithmetic contracts below.

### From roadmaps on main

- **ClassFieldTheory**, Layers 7 and 11–13: local reciprocity with arithmetic Frobenius normalization and the global Artin map identifying class groups with unramified abelian Galois groups, used in §§2.5, 3.38 and 5.9.
- **ModularForms**, Layers 2–5 and 10 and Worked examples, “Level 11, weight 2”: classical Hecke operators, newforms and conductor, and the dimension-one level-11 comparison. Explicit level-11 coefficients and Eisenstein-index data in §6.5 are hypotheses of the worked example.
- **LocalGaloisGroups**, Layer 0 and Conventions, and **ProfiniteArithmetic**, §§0.2–0.4, 1.1–1.3: local absolute Galois groups, their inertia and cyclotomic conventions, profinite coefficient projections and continuous pro-p powers.
- **SchemeAndStackFoundations**, §4.4: Schlessinger's four conditions, used for the ordered-presentation comparison calculation in §3.8. The representing ring itself is supplied by LocalGaloisDeformationRings §F.2.11.
- **DiophantineApproximationAndTranscendence**, Layer 3: the complex several-variable auxiliary-function, Schwarz-lemma and Schneider–Lang machinery. Section 3.38 proves the p-adic criterion and unit-rank consequence needed here.

### From IntegralHeckeAndGaloisDeterminants

Use §0.5's pseudocharacter/determinant comparison in dimension two, with 2 invertible, for the trace and determinant of the ordered Wiles triples of §3.7. For fixed `z₁` and 2 invertible, their trace `T` recovers the triple: `a(σ)=(T(σ)+T(z₁σ))/2`, `d(σ)=(T(σ)−T(z₁σ))/2` and `x(σ,τ)=a(στ)−a(σ)a(τ)`. This is a normalizer-dependent presentation of the invariant data. Section 2.3, “Factorial powers”, supplies the idempotent `e=lim t^(n!)` of a finite commutative algebra over a complete Noetherian local ring with finite residue field. Section 1.1 compares the Skinner–Wiles exponent with this idempotent; PadicFamilies §0a.14 specializes it to a possibly noncommutative finite algebra through its commutative subalgebra generated by `t`.

### From ArithmeticGaloisDuality

Use §R02.4.4 for the global Euler characteristic formula, §R02.5.1 for Selmer local conditions and the Greenberg–Wiles formula, and §D8.1 for the adjoint first-order calculation. Section R02.4.6 supplies finite-order local-character extension with the exact Grunwald–Wang obstruction and its possible doubling of global order, used in §5.1a. The `C/λ^m` tangent comparison with the actual ordinary local conditions is a target of §3.39. These inputs enter §§3.4, 3.29, 3.36, 4.8, 4.11, 4.15 and 4.18.

### From DeformationAndDerivedPatchingAlgebra

Use §§3.1–3.2 for finite resolutions, depth and Auslander–Buchsbaum, §6.6 for connectedness dimension at its stated bound, and §7.6 for the complete-DVR fraction-quotient dual. The Cohen–Macaulay intersection estimate of §4.3 has the stronger bound of SW99 Appendix A.1–A.2. Use §§5.2–5.4 for compatible cutoff towers and their ring/module actions, §5.5 for the numerical depth comparison, and [§5.6, free-module patching consumer](../DeformationAndDerivedPatchingAlgebra/README.md#patching-surjection-iso), `patching_surjection_iso`, when the arithmetic system supplies its scalar maps, equal variable counts and positive-rank free modules. It permits equal characteristic and residue characteristic two. Section 4.20 retains the Skinner–Wiles characteristic-p datum, whose ring scalars are only `B_N`, and the complete-intersection numerical criterion used by §4.15; neither follows merely from balance. The independent-level patching interface follows the Imperial College London FLT project.

### From PadicHodgeTheory

Use §6.4 for the rank-two crystalline unit-root criterion and the Khare–Wintenberger ordinary branches, including the Berger–Li–Zhu weight-(p+1) branch. Retain each field, Hodge-type, determinant and residual-quotient hypothesis. The general labelled ordinary and dual/twist dictionary is §3.6. These inputs enter §§5.5, 6.3 and 6.4.

### From HilbertModularVarietiesAndShimuraCurves

Use §§R18.3.1–R18.3.7 for the definite class set with central quotient, fixed-central-character forms, neat reduction, the integral stabilizer-weighted pairing, split Hecke normalization and norm-factor support, including `definiteNormFibres` and `Nrd(D×)=F_+×`; §§R18.3.8–R18.3.9 for Ihara; §§R18.3.12–R18.3.14 for auxiliary-level freeness; and §R18.3.22 for Jacquet–Langlands realization after inverting the coefficient uniformizer. Keep the effective stabilizer-unit hypothesis. PadicFamilies §§5.2–5.3 supplies the central-unquotiented Skinner–Wiles class set, p-operators and integral ordinary Hecke-image identification, and §5.9a supplies the integral expansion lattice with its flat coefficient-change theorem. Section 1.6 compares these realizations, while §§1.4–1.5 and 2.7 compare their actual pairings and level maps. The arithmetic specialization of Ihara in §§2.9–2.10 retains its ray-class splitting and exact level hypotheses.

### From GL2AutomorphicRepresentationsAndTransfer

Use §§R16.2.1–R16.2.7 for newvectors and local unit-eigenline calculations, §§R16.6.1–R16.6.5 for Hilbert algebraic weights and the classical/adelic Hecke dictionary, and §§R17.3.1–R17.3.9 for global Jacquet–Langlands, the reduced-norm exception and definite cuspidal transfer. Section 1.6 separates this characteristic-zero module comparison from the supplied integral ordinary Hecke-image comparison. Use §§R17.4.8–R17.4.11 for solvable tower base change, cyclic descent with its finite-character fibre and prescribed splitting. Section 4.6a constructs the single-coefficient descent needed here from those transfer theorems and Hilbert Galois attachments. Section 6.14 supplies the Skinner–Wiles level-lowering base change.

### From GlobalGaloisDeformations and LocalGaloisDeformationRings

LocalGaloisDeformationRings §§F.1.3, F.2.1–F.2.2, F.2.5 and F.2.7 supply strict deformations, the Galois finiteness condition, Schur representability and trace generation; IntegralHeckeAndGaloisDeterminants Layer 1 supplies coefficient descent for representation reconstruction. GlobalGaloisDeformations §§3.4–3.8 supply global type representability and the relative framed presentation with tangent and obstruction bounds; §§4.1, 4.4 and 7.4 supply restriction, twists and fixed/variable determinant comparisons; §§5.6–5.7 supply Chebotarev selection detecting finite-field Selmer classes. The characteristic-p DVR counting is proved in §§4.11 and 4.18. Section 3.39 supplies the unframed Schur presentation and variable-character ordered-flag refinements. For absolutely irreducible residual representations and finite flat local `𝒪`-algebra Hecke quotients, use Layer R04.6 [§6.7](../GlobalGaloisDeformations/README.md#hecke-galois-datum)'s `HeckeGaloisDatum`, `HeckeGaloisDatum.classifying_surjective` and `HeckeGaloisDatum.classifying_unique`; [§6.8](../GlobalGaloisDeformations/README.md#hecke-galois-points) supplies `HeckeGaloisDatum.ofPoints` and `HeckeGaloisDatum.mem_of_points` for reduced quotients with jointly injective DVR points. Sections 3.32–3.34 supply the ordinary arithmetic realization and selected quotient. Finiteness over weight space alone does not make a big ordinary Hecke algebra finite flat over `𝒪`.

LocalGaloisDeformationRings §§F.1.9–F.1.10 and F.2.11 supply `PseudoDefRing` for the residual determinant of `1⊕χ` on `G_{F,Σ}`, its universal coefficients, Noetherianity under `Φ_p`, coefficient change and the representation-to-determinant map. Section 3.8 identifies its ordered Wiles presentation and imposes the auxiliary-inertia quotient; §3.9 specializes the supplied natural map.

LocalGaloisDeformationRings §6.2 supplies the split p-distinguished nearly ordinary versal ring, §6.3 supplies full-flag deformations with fixed inertial characters under its character-ratio exclusions, and §§7.1–7.6 supply the determinant–flag spectrum comparison. Its §§2.5, 2.26, 4.14, 8.5, 8.12–8.13 and 8.18 supply the indicated Barsotti–Tate, crystalline and semistable quotients, their components and Steinberg lifts. The variable-character ordered-flag condition with nonsplit residual data is specified in §3.39. A spectrum comparison does not identify nonreduced deformation functors.

### From AlgebraicModularFormsAndSerreWeights

Use [S-type and modularity predicates](../AlgebraicModularFormsAndSerreWeights/README.md#target-s-type-arises-from-and-modular) for `TauCeti.ResidualModularity.ArisesFrom` and `TauCeti.ResidualModularity.IsModular` in §§5.7 and 5.10 over `ℚ`. The former uses one coefficient ring map matching both Frobenius coefficients; the latter quantifies over the form with its weight and level. Its integral-model comparison retains absolute irreducibility and the coefficient-place identifications. The χ₂-good ordinary refinement is an additional local requirement here. For a general totally real field retain §5.6's Hilbert automorphic seed. The Eisenstein construction of §5.2 uses its residual characters rather than a cuspidal modularity hypothesis.

### From PadicFamilies

Use §§0a.1–0a.15 for ordinary projectors and their finite/profinite exactness, §§0.11, 0.13 and 0.15 for Hida control, arithmetic specialization and primitive components over `ℚ`, and §4.1 for the classical big ordinary representation. Sections 5.1–5.9 supply the totally real weight algebra, quaternionic projector and towers, nearly ordinary Hecke algebra, duality, projective descent and freeness, finite torsion-free Hecke algebra, higher-weight control and density of algebraic primes. Use the full torsion-character control and projective-descent theorem of §5.6, together with the integral moment comparison of §5.8. The Λ′-rank is the rank of its augmentation fibre; multiplying a trivial torsion-character rank by the torsion-group order requires equal ranks on all torsion-character factors and is not inferred from projectivity. No freeness of the Hecke algebra over weight space is assumed.

Use §§5.9a–5.10 for integral Hilbert expansions and Λ-adic Hilbert forms. The Deligne–Ribet, Chai and Eisenstein-congruence targets and the arbitrary-totally-real Hilbert specialization of determinant `ε⁻²ω` are specified in §2.12. The EPW new quotient is specified in §6.3 with its finite, reduced, torsion-free and classical-prime étaleness properties; the existing family representation is supplied, and its new-quotient conductor, coinvariant and integral-model refinements belong here. Superscript `⁺` denotes the adjoint Hecke action on the same module, as in §5.5 of PadicFamilies; it never denotes a norm-factor subspace.

### From AutomorphicGaloisRepresentations

Use §1.5 for rank-two classical newform realization; §§3.11–3.14 for the Hilbert normalization dictionary, Hodge–Tate property, determinant, total oddness, uniqueness and absolute irreducibility; §§4.10–4.12 for the finite-weight nearly ordinary packet, the Skinner–Wiles representation with quotient character specified by `T_y` and `T₀(v)`, and local compatibility away from `p`; §4.4 for all-Hilbert compatibility, including Steinberg and supercuspidal places; §§4.5–4.9 for coefficient-prime compatibility with the stated Hodge and quotient hypotheses; §5.1 for ordinary refinement and its stable lattice; and §6.4 for classical conductors and Euler factors. Section 2.1 uses the supplied full quotient character `δ_v(u)=ν_v(u)∏_ττ(u)^(−v_τ)` for `IsOrdinary`, and names Skinner–Wiles' smooth-factor condition `IsSmoothOrdinary`. The representation and chosen ordinary line are translated together under the dictionary. These are finite-weight inputs to §§2.11 and 3.14, not consequences of the ordinary lifting theorem being proved. Sections 3.15–3.16 supply the CM/virtual-reducibility dichotomy used for restriction to totally real fields in §4.6a.

### From SerreWeightAndLevelOptimisation and DirichletPadicLFunctions

SerreWeightAndLevelOptimisation §§3.1–3.6 and 4.7–4.8 supply the residual ordinary and weight/level optimization interfaces at their exact characteristic and local-type hypotheses. The χ₂-good seed in the form of Diamond Theorem 6.4 used by SW01 Theorem 5.2 is the target of §5.10. DirichletPadicLFunctions §§0.4–0.6 and Layers 2–3 supplies generalized Bernoulli comparison, abelian-character interpolation and the Iwasawa logarithm on `ℂ_p` to §§3.38 and 5.9; that section proves the distinct-prime character-sum nonvanishing and class-group bound.

## How to read the build

The first layer compares ordinary projectors and the definite Hecke realization. The second isolates the permissible localizations and their duality and level maps. The third supplies the reducible and irreducible deformation–Hecke interfaces, keeping their different integral representation hypotheses, and Waldschmidt's unit-rank bound that the dihedral and Theorem `A/B` dimension counts use (§3.38). The fourth applies characteristic-p patching and connectedness to pro-modularity and localized `R = T`. The fifth gives the lifting conclusions, separating the abelian and conditional class-group routes and the totally real dihedral case and the complex-place case conditional on `CMComponentSupport`. The sixth records classical interpolation and solvable preparation. Section 5.8 proves the full-scope lifting implication under that explicit support hypothesis.

The internal construction order is independent of section numbering. Use PadicFamilies §§5.2–5.3 before Layer 1; build §1.6's additional arithmetic refinements before §§1.2,1.4–1.5. Build §2.12(a),(d) before §§2.4,2.8, and §2.12(b) before §2.11; §2.12(c) records the export of §6.3. Build §3.39(a),(b), taking residual representations and selected local flags as input, before §§3.2,3.28. Build §4.3 from its connectedness theorem, then §4.20 before §§4.8–4.9, and the all-level comparison §4.15 before §4.6.

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

Use PadicFamilies §§5.2–5.3 for `T₂(U_a,𝒪)=eT(U_a,𝒪)`, its identification with Skinner–Wiles' ordinary Hilbert Hecke algebra, the transition maps, and `T_∞(U,𝒪)`. With its conventions, `X_i↦S_{x_i}−1` and `Y_j⁽ⁱ⁾↦T_{y_j⁽ⁱ⁾}−1`. The hypotheses are even totally real degree, odd `p`, `D` ramified exactly at infinity, and maximal level at `p` before forming the p-power tower. This section fixes the supplied identification used in Layers 2–4.

### 1.4 The stabiliser-weighted pairing and Hecke adjoints

For open compact `U` put Ū `= U/(U ∩ F^×)` and, for `x ∈ G^D(A_f), c_U(x) = #{u ∈` Ū : xu `= x}` in `D^×\G^D(A_f)`. For an 𝒪-algebra `R` in which every `c_U(x)` is invertible, ⟨f, `g⟩_U = Σ_{x ∈ X(U)} c_U(x)^{−1} f(x)g(x)` is a perfect R-bilinear pairing on `H⁰(X(U), R)`, and `f ↦` ⟨f, `·⟩_U` is an isomorphism `H⁰(X(U), R) ≅ Hom_R(H⁰(X(U), R), R)` functorial in `R`. It satisfies ⟨[UgU]f, `h⟩_U =` ⟨f, `[Ug^{−1}U]h⟩_U` for `g ∈ G^D(A_f)`, so every `t ∈ T(U_a, 𝒪)` has an adjoint `t⁺`, and `t ↦ t⁺` is an 𝒪-algebra isomorphism `T(U_a, 𝒪) ≅ T⁺(U_a, 𝒪)`. Writing `H⁰(X(U_a), R)⁺` for `H⁰` with `t` acting by `t⁺`, the pairing induces a perfect pairing of `T₂(U_a`, 𝒪)-modules `eH⁰(X(U_a), R) × eH⁰(X(U_a), R)⁺ → R`.

Every `c_U(x)` invertible in `R` (automatic for `R` an 𝒪-algebra once a is large, `R18.3`). Define the Skinner–Wiles pairing directly on the central-unquotiented `X(U)`. To compare with HilbertModularVarietiesAndShimuraCurves §R18.3.5, first restrict to matching central-character submodules and identify the central quotient. For trivial central character and trivial coefficients, write `C=A_f×/(F×(U∩A_f×))`, a finite group acting on `X(U)`, and `q:X(U)→X(U)/C`. For its stabilizer `C_x`, prove the exact sequence `1→Γ_X(x)→Γ_central(qx)→C_x→1`. Thus `c_central(qx)=c_U(x)·#C_x` and the fibre has size `#C/#C_x`. When both stabilizer orders are units in `R`, the pairings satisfy `B_X(q* f,q* g)=#C·B_central(f,g)`. No division by `#C` is made integrally.

Perfection on `X(U)` follows by the point-indicator basis with diagonal Gram entries `c_U(x)⁻¹`; reversing the finite double-coset correspondence gives the adjoint identity. The central-quotient comparison follows by the stabilizer exact sequence and orbit–stabilizer counting, rather than a literal identification of the two carriers.

`t ↦ t⁺` is the transpose for this pairing; it is an 𝒪-algebra isomorphism `T(U_a, 𝒪) ≅ T⁺(U_a, 𝒪)` because the generators are double cosets.

`e⁺` is the adjoint idempotent; `eH⁰` and `(1 − e⁺)H⁰` are orthogonal, so the pairing restricts to a perfect pairing between `eH⁰` and `e⁺H⁰ = eH⁰(X(U_a), R)⁺`.

Provide the following operations and compatibility statements.

- `stabiliserCount`: `c_U(x) =` #Stab_Ū(x).
- The stabilizer-weighted pairing: ⟨f, `g⟩_U = Σ c_U(x)^{−1} f(x)g(x)`.
- Perfection: `H⁰ ≅ Hom_R(H⁰, R)` when all `c_U(x)` are units. The full coefficient-ring form on a finite set `X` is: for unit weights `c:X→Rˣ` over any commutative ring and every linear functional `ℓ`, there is a unique `f` with `Σ_x c(x)⁻¹f(x)g(x)=ℓ(g)` for every `g`. Taking the units to be the stabilizer counts gives the arithmetic pairing; over a field this is the displayed finite-set pairing.
- `quaternionicPairing_hecke_adjoint`: ⟨[UgU]f, h⟩ `=` ⟨f, `[Ug^{−1}U]h⟩`.
- `heckeAdjoint`: `t ↦ t⁺`, an isomorphism `T(U_a, 𝒪) ≅ T⁺(U_a, 𝒪)`.
- `ordinaryPairing_perfect`: `eH⁰ × eH⁰⁺ → R` is perfect.
- `quaternionicPairing_central_scaling`: For parallel weight 2, trivial coefficients and trivial central character, with both effective stabilizer orders units, `B_X(q* f,q* g)=#C·IntegralPairing(f,g)` on the central quotient.
- Nondegeneracy: For any finite `X` and field `R`, the coefficient pairing is nondegenerate if every cast count `c(x)` is nonzero. Testing against the point indicator at `x` recovers `f(x)`. The arithmetic integral assertion requires unit counts.

**Checks.**

- Free effective stabilizers: If Ū acts freely (all `c_U(x) = 1`), ⟨f, g⟩ `= Σ f(x)g(x)` and the Gram matrix in the basis of point indicators is the identity.
- On `X(U)` one point with stabiliser order `c`: ⟨f, g⟩ `= c^{−1}fg`, perfect `iff c` is a unit in `R`; over `𝒪` with `p | c` the pairing is not defined.
- If the count at a point vanishes in the coefficient field, its point indicator is nonzero but pairs to zero with every function. Positive natural-number counts divisible by the characteristic have this defect too.
- `heckeAdjoint_central`: For central `g = z ∈ A_f^×`, [UzU] is translation by `z` and its adjoint is translation by `z^{−1}`.
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

Construct the additional arithmetic refinements: (d) trivial effective stabilisers `c_{U_a}(x)=1` for all large a, and free action after one auxiliary level (Skinner–Wiles Lemma 3.5 and Corollary 3.6); (e) freeness over `𝒪/πⁿ[Δ_w]` at a single auxiliary place `w` under the fixed-point-free hypothesis, with `(3.12)–(3.13)`; (f) specialize the supplied `definiteNormFibres` and norm image `Nrd(D×)=F_+×` of HilbertModularVarietiesAndShimuraCurves §R18.3.7 to the level, narrow ray-class quotient and strong-approximation hypotheses of Skinner–Wiles Lemma 3.26.

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

## Layer 2: Permissible localizations, duality and level maps

### 2.1 Nearly ordinary automorphic representations

Let `k = Σ_τ k_ττ` with every `k_τ ≥ 2, π ∈ Π_k(U_a)` a cuspidal automorphic representation of `GL₂(A_F)` of weight `k` with `V_π^{U_a} ≠ 0`, and `v | p` with prime `p_v`. A line in `V_{π,v}^{U_{a,v}}` on which `T₀(p_v)` acts through an element of `F̄` that is a unit in the ring of integers of `Q̄_p` is unique if it exists; it is called v-good. A v-good line exists `iff π_v` is a principal series `π(η_v|·|_v^{−1/2}, ξ_v|·|_v^{−1/2})` or a special representation `π(ξ_v|·|_v^{−1/2}, ξ_v|·|_v^{1/2})` with `λ_v^{−v}ξ_v(λ_v^{−1})` a p-adic unit (`λ_v` the uniformiser used in `T₀(p_v)`). `π` is nearly ordinary if a v-good line exists for every `v | p`. `Π^{n.o.}_k(U_a) ⊆ Π_k(U_a)` is the set of nearly ordinary `π` (Skinner–Wiles write `Π^ord_k(U_a)`).

`F` totally real of any degree (the definition does not need the quaternion algebra); `v = (v_τ)` with `m +` 2v `∈ ℤt, m = k −` 2t, as in Skinner–Wiles §3.1.

Uniqueness and the criterion are Hida's classification of unit U_p-eigenlines ([H3, Corollary 2.2]) on the local newform theory of R16.6.

Reuse AutomorphicGaloisRepresentations §4.10's finite-weight `NearlyOrdinaryEigenpacket`, including its local/global operator normalization. Write `ν_v` for the selected smooth character in that packet's inverse-action convention, transported from `ξ_v`. Its full arithmetic quotient character has unit values `δ_v(u)=ν_v(u)∏_{τ:F_v→Q̄_p}τ(u)^(−v_τ)`. Define ordinary by unramifiedness of this full character. Name Skinner–Wiles' condition on the smooth factor smooth ordinarity. Prove the exact comparison: `IsOrdinary` holds if and only if `IsSmoothOrdinary` holds and every local `v_τ=0`. Indeed a smooth character is finite on units; differentiating a trivial algebraic character on an open unit subgroup and using independence of the embeddings forces every exponent to vanish.

The general nearly ordinary consumers retain `δ_v` and the chosen quotient. The parallel-weight Skinner–Wiles control and finite twists in §§2.2, 3.14 and Layer 5 use `v_τ=0`, where the two ordinary predicates agree. In other weights a ramified finite twist can remove finite smooth ramification, but it cannot remove the labelled algebraic factor.

Provide the following operations and compatibility statements.

- `IsVGoodLine`: A T₀(p_v)-stable line with p-adic unit eigenvalue.
- `IsNearlyOrdinary`: A v-good line exists for every `v |` p.
- `IsSmoothOrdinary`: Nearly ordinary with the selected smooth character unramified at every `v | p`.
- `IsOrdinary`: The supplied `NearlyOrdinaryEigenpacket.isOrdinary`, requiring `δ_v|𝒪_{F_v}×=1` at every `v | p`.
- `isOrdinary_iff_smoothOrdinary`: Ordinary if and only if smoothly ordinary with every local exponent `v_τ=0`.
- `vGoodLine_unique`: At most one v-good line.
- `isNearlyOrdinary_twist`: Nearly ordinarity is preserved by twisting by finite characters.

**Checks.**

- `isOrdinary_X0_11`: `F = ℚ`, weight 2: the newform of `X₀(11)` has `a₃ = −1`, a unit, so it is ordinary at 3; `a₂ = −2` is not a 2-adic unit, so it is not ordinary at 2.
- `isNearlyOrdinary_not_ordinary`: At `v_τ=0`, the twist of an ordinary `π` by a finite character ramified at `v | p` is nearly ordinary but not ordinary.
- `supercuspidal_not_nearlyOrdinary`: If `π_v` is supercuspidal, `T₀(p_v)` has no unit eigenvalue on `V_{π,v}^{U_{a,v}}`, so `π` is not nearly ordinary.
- `vGoodLine_unique_product`: Two unit eigenvalues cannot both occur: the product of the two T₀(p_v)-eigenvalues of a principal series has positive valuation for `k_τ ≥ 2`.
- For `k=(2,4), v=(1,0)` and unramified smooth factor, the rational principal unit `u=1+p` has `δ_v(u)=(1+p)⁻¹≠1`. Smooth ordinarity holds, while ordinarity fails; at `p=3` the value is `1/4`. A finite twist cannot cancel this character on an open unit subgroup.
- At `v_τ=0` the full quotient on units is exactly the smooth factor, so the weight-two and parallel-weight ordinary comparisons agree with the supplier.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §§3.1–3.2, pp. 27–32, especially the weight action on pp. 27–28, inverse translation (3.1′), p. 30, and good-line classification, p. 31; AutomorphicGaloisRepresentations §§4.10–4.11, full locally algebraic quotient comparison.)

*Needs:* GL2AutomorphicRepresentationsAndTransfer:§§R16.6.1–R16.6.5; AutomorphicGaloisRepresentations:§§4.10–4.11; §1.6; mathlib:NumberField.IsTotallyReal.

### 2.2 The two definitions of the nearly ordinary Hecke algebra

For parallel `k` and `U_v = GL₂(𝒪_{F,v}) (v | p)`: let `S*_k(U_a)` be spanned by vectors `w(π) = ⊗_v w(π, v)` with `w(π, v)` spanning the v-good line, `π ∈ Π^{n.o.}_k(U_a)`, and `T_k(U_a) ⊆ End(S*_k(U_a))` the ℤ_p-algebra generated by the Hecke operators. Then `T_k(U_a)` is finite, flat, commutative and reduced, `T_k(U_a) ↪ ∏_{π ∈ Π^{n.o.}_k(U_a)} Q̄_p`, and `T_k(U_a) ⊗ 𝒪 = eT*_k(U_a, 𝒪)`, since `eV_π^{U_a} = 0` for `π ∉ Π^{n.o.}_k(U_a)` and `eV_π^{U_a} = (⊗_{v|p} L_v^{good}) ⊗ (⊗_{v∤p} V_{π,v}^{U_{a,v}})`, where `L_v^{good}` is the selected one-dimensional ordinary factor otherwise. For `k = 2` this is `T₂(U_a, 𝒪)` of Layer 1, and 𝒪-algebra maps `λ` : `T_∞(U, 𝒪) → Q̄_p` whose restrictions to `Z(U)` and to `(𝒪_F ⊗ ℤ_p)^×` have finite order factor through some `T₂(U_a, 𝒪)` and correspond to `π ∈ ⋃_a Π^{n.o.}_2(U_a)` with an eigenvector in the v-good lines.

Parallel weight for the comparison with `e`; general weights through Hida's control (Skinner–Wiles Proposition 3.7, supplied by PadicFamilies §5.8).

`e` acts on `V_π^{U_a} = ⊗_v V_{π,v}^{U_{a,v}}` factor by factor at `v | p`; on each factor it is the projector onto the unit-eigenvalue line of `T₀(p_v)`, which is the v-good line or 0.

The Hecke generators act by a scalar eigensystem on each nearly ordinary automorphic summand. Choosing one nonzero tensor at every `π` therefore detects the same algebra as the whole ordinary summand, even when tame-level invariant factors have dimension greater than one. The faithful eigenvalue embedding proves reducedness.

The finite-order weight characters kill an open weight subgroup. Apply PadicFamilies §5.8, at `μ=0`, to its finite-character ordinary control quotient: `λ` factors through `T₂(U_a,𝒪)` at the actual conductor. Section 2.1 then identifies the selected nearly ordinary automorphic eigensystem.

**Checks.**

- The comparison is between the same classical newform on `GL₂` and on `D` (through Layer 1's Jacquet–Langlands step); the Galois family is compared in Layer 3.
- A character of conductor `p²` requires its conductor-level quotient, not merely the first p-level.
- A map out of an inverse limit need not factor through a finite stage; finite-character ordinary control supplies that conclusion here.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.2, p. 31 (Numdam PDF page 28; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.2, p. 32 (Numdam PDF page 29; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.2, p. 37 (Numdam PDF page 34; printed page `=` PDF page `+ 3).`)

*Needs:* PadicFamilies:§5.8; §2.1; §1.3; PadicFamilies:§5.2; GL2AutomorphicRepresentationsAndTransfer:§§R16.6.1–R16.6.5; §1.6; PadicFamilies:Layer 5.

### 2.3 Permissible (Eisenstein) maximal ideals

Let `k` be a finite field of characteristic `p` and `χ` : `Gal(F̄/F) → k^×` a character with `χ|_{D_{v_i}} ≠ 1` for every `v_i | p` and `χ(c_j) = −1` for every complex conjugation `c_j`; let `𝒪` have residue field `k, χ̃` the Teichmüller lift and `ω` the Teichmüller character. A maximal ideal `m` of `T_∞(U, 𝒪)` is permissible if `(3.9): m ∩ 𝒪[[G(U)]]` is the maximal ideal of the character `G(U) → Z(U) --χω^{−1}--> k`; `m` contains `T₀(p_i) − 1` for `i = 1, …, t`; and `m` contains `T(ℓ) − 1 − χ̃(Frob_ℓ)` for every `ℓ ∤ p` with `U_ℓ = GL₂(𝒪_{F,ℓ})`. The same conditions define permissible maximal ideals of `T₂(U_a, 𝒪)`, and each determines one of `T_∞(U, 𝒪)`.

`p` odd; `F` of even degree (`T_∞` is built from `D`); `χ` totally odd and p-distinguished (`χ|_{D_v} ≠ 1` at every `v | p`).

Skinner–Wiles' first definition replaces the third condition by `ρ̄_m ≅ χ ⊕ 1` for the residual pseudo-representation; the two agree by Chebotarev and Brauer–Nesbitt once Layer 3 supplies `ρ̄_m (p > 2)`.

Provide the following operations and compatibility statements.

- `IsPermissible`: The three conditions (3.9) on a maximal ideal of `T_∞(U, 𝒪)`.
- `IsPermissible.ofLevel`: A permissible ideal of `T₂(U_a, 𝒪)` gives one of `T_∞(U, 𝒪)`.
- `IsPermissible.T0_sub_one_mem`: `T₀(p_i) − 1 ∈ m`.
- `IsPermissible.T_sub_mem`: `T(ℓ) − 1 − χ̃(Frob_ℓ) ∈ m`.

**Checks.**

- `permissible_ramanujan_691`: Degree-one analogue (outside the even-degree hypothesis): `p = 691, χ = ω^{11}`; Ramanujan's congruence `τ(ℓ) ≡ 1 + ℓ^{11} mod 691` is the weight-12 form of the condition `T(ℓ) ≡ 1 + χ(Frob_ℓ)`.
- `permissible_distinguished_fails`: If `χ|_{D_v} = 1` at some `v | p (e.g`. `χ` unramified with `χ(Frob_v) = 1), χ ⊕ 1` is not p-distinguished and the definition is not made.
- `permissible_weight_two_twist`: The weight-two Eisenstein series `E₂(1, ψ), ψ = χω^{−1}`, has T(ℓ)-eigenvalue `1 + ψ(ℓ)Nm(ℓ) ≡ 1 + χ(Frob_ℓ) mod π`, since `Nm(ℓ) ≡ ω(Frob_ℓ)`; using `ψ` in place of `χ` in (3.9) would be wrong.
- Uniqueness of a permissible ideal and the value of `S(ℓ) mod m` use det `ρ̄_m = χ`; they are proved in §3.16, not from (3.9) alone.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 41 (Numdam PDF page 38; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.4, p. 46 (Numdam PDF page 43; printed page `=` PDF page `+ 3).`)

*Needs:* PadicFamilies:§5.3.

### 2.4 Existence of permissible maximal ideals

Let `n` be the prime-to-p part of the conductor of `χω^{−1}`; for `ℓ | n` let `ℓ^{r(ℓ)} ∥ n` and `Δ_ℓ` be the Sylow p-subgroup of `(𝒪_F/ℓ^{r(ℓ)})^×`. Let `U^χ = ∏_ℓ U^χ_ℓ` with `U^χ_ℓ = {(a b`; `c d) ∈ GL₂(𝒪_{F,ℓ}`) : `c ∈ ℓ^{r(ℓ)}`, a `mod ℓ^{r(ℓ)} ∈ Δ_ℓ}` for `ℓ | n` and `GL₂(𝒪_{F,ℓ})` otherwise, and let `L_p(F, s, χω)` be the Deligne–Ribet p-adic L-function. If `ord_π(L_p(F, −1, χω)) > 0`, then some `T₂(U^χ_a, 𝒪)`, and hence `T_∞(U^χ, 𝒪)`, has a permissible maximal ideal.

`F` of even degree; `χ` totally odd and p-distinguished, as in §2.3.

Put `ψ = χω^{−1}`. The Eisenstein series `E_n(φ₁, φ₂) ∈ M_n(pn, ψ)` with Dirichlet series `L(F, s, φ₁)L(F, s − n + 1, φ₂)` span a complement of `S_n(n, ψ)`, and `a_i(E_n(1, ψ), 0) = 2^{−d}L(F, 1 − n, ψ)Nm(t_i)^{n/2} (3.10)` (PadicFamilies Layer 5, Deligne–Ribet p-adic L-functions and Hilbert Eisenstein series).

With `f = ord_p(ε(γ) − 1)`, choose `n = 2 + p^f(p − 1)m` so large that Chai's form `g ∈ M_n(np, ψ) ∩ M_n(np, 𝒪)` with `a_i(g, 0) = 2^{−d}Nm(t_i)^{n/2} (3.11)` exists; the p-adic L-function gives `ord_π(L(F, 1 − n, ψ)) > 0`, so `E₀ = E_n(1, ψ)` is integral and `f₀ = E₀ − L(F, 1 − n, ψ)g` has all constant terms 0.

`E₁ = eE₀` is the eigenform with Dirichlet series `ζ_F(s)L^{(p)}(s − n + 1, ψ)`; for its idempotent `ε₀`, the Eisenstein part of `ε₀f₀` is a combination of `E_n(λ, λ^{−1}ψ)` with zero constant terms, hence 0 (Wiles [W3, Prop. 1.6]).

So `F₁ = ε₀ef₀` is a cusp form with `F₁ ≡ E₁ ≢ 0 mod π`, giving an ordinary newform `f₁` congruent to `E₁` at the Dirichlet coefficients.

Wiles' Λ-adic forms ([W2, Theorem 1.4.1], PadicFamilies Layer 5) give a weight-two p-stabilised newform `f₂ ∈ S₂(np^a, ψ)` with the same congruence; it spans v-good lines (§2.2), and its maximal ideal satisfies (3.9).

Local–global compatibility at `ℓ | n`([W2, Theorem 2.1.3] or (3.3); AutomorphicGaloisRepresentations §§4.4, 4.12 and 6.4) puts `π_{f₂}` in `Π^{n.o.}_2(U^χ_a)`.

**Checks.**

- The hypothesis is on the p-adic L-value at `s = −1`; the congruence is built in weight `n ≡ 2 mod (p − 1)p^f` and moved to weight 2 by Hida theory, not by a weight-two construction.
- Since the L-value vanishes modulo `π`, `f₀≡E₀` and `F₁≡E₁`; the opposite definition of `f₀` gives `−E₁`, distinct from `E₁` for odd `p` and nonzero reduction.
- The maximal ideal lives at level `U^χ` (Γ₀-type at `n` with Δ-reduced diagonal), not at `U₁(n)`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.4, p. 46 (Numdam PDF page 43; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.4, proof of Proposition 3.18, p. 47 (Numdam PDF page 44; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.4, proof of Proposition 3.18, p. 48 (Numdam PDF page 45; printed page `=` PDF page `+ 3).`)

*Needs:* §2.3; §2.2; PadicFamilies:§5.2; §2.12 (Deligne–Ribet p-adic L-functions and Hilbert Eisenstein series); PadicFamilies:Layer 5; AutomorphicGaloisRepresentations:§§4.4, 4.12, 6.4; GL2AutomorphicRepresentationsAndTransfer:§§R16.6.1–R16.6.5; §1.6.

### 2.5 The weight algebra at a permissible maximal ideal

Let `m` be a permissible maximal ideal of `T_∞(U, 𝒪)` and `γ_1, …, γ_{δ_F} ∈ Gal(F̄/F), r_1, …, r_{δ_F}` as in Skinner–Wiles §2.5 (the `γ_j` generate a free summand `G₀` of `Gal(L₀/F)` and the `γ_j^{p^{r_j}}` generate `I₀`, with images `x_j ∈ Z(U)`). Let `D` : `Gal(F̄/F) → T_∞(U, 𝒪)_m^×` be the continuous character given by the central action composed with reciprocity, times `ε`; so `D(Frob_ℓ) = S(ℓ)Nm(ℓ)` for `ℓ ∤` np and `D(x) = S_xε(x)` on `Z(U)` (Skinner–Wiles' det `ρ^mod_m`). Then `T_∞(U, 𝒪)_m` is an algebra over `Λ_𝒪 = 𝒪[[T_1, …, T_{δ_F}, Y^{(i)}_j]]` via `1 + Y^{(i)}_j ↦ T_{y^{(i)}_j}` and `1 + T_j ↦ D(γ_j)`, and the map `Λ′_𝒪 → Λ_𝒪, 1 + X_j ↦ (1 + T_j)^{p^{r_j}}ε(γ_j^{−p^{r_j}}), Y ↦ Y`, is compatible with the Λ′_𝒪-structure of Layer 1 and makes `Λ_𝒪` a free Λ′_𝒪-module of rank `p^{Σ_j r_j}`.

`m` permissible; the choices of `γ_j, r_j` and `y^{(i)}_j` of Skinner–Wiles §2.5, with every `γ_j` taken in `Gal(F̄/F(χ, μ_p))`. This is possible because `[F(χ, μ_p)` : `F]` is prime to `p` while `Gal(L₀/F)` is pro-p, so restriction from `Gal(F̄/F(χ, μ_p))` onto `Gal(L₀/F)` is surjective. It gives `χ(γ_j) = ω(γ_j) = 1`, so `D(γ_j) − 1` lies in the maximal ideal and `ε(γ_j^{−p^{r_j}}) ∈ 1 + pℤ_p`, as the freeness step uses; Skinner–Wiles leave this choice implicit.

The centre `A_f^×` acts on `H⁰(X(U_a), 𝒪)` through the finite group `A_f^×/F^×(U_a ∩ A_f^×)`; with class field theory and `ε` this gives `D`, continuous in the limit over a; at `Frob_ℓ` it is translation by `ϖ_ℓ` times `Nm(ℓ)`.

Compatibility: `D(γ_j^{p^{r_j}}) = D(x_j) = S_{x_j}ε(x_j)`, i.e. `S_{x_j} = (1 + T_j)^{p^{r_j}}ε(γ_j^{−p^{r_j}})`.

Freeness: `ε(γ_j^{−p^{r_j}}) ∈ 1 + pℤ_p`, so `u(1 + T)^{p^r} − 1` is a unit times a distinguished polynomial of degree `p^r`; Weierstrass division gives the basis `T^i, 0 ≤ i < p^r`, in each variable.

Provide the following operations and compatibility statements.

- `centralDeterminant`: `D` : `Gal(F̄/F) → T_∞(U, 𝒪)_m^×`.
- `centralDeterminant_frob`: `D(Frob_ℓ) = S(ℓ)Nm(ℓ)` for `ℓ ∤` np.
- `permissibleLambdaAlgebra`: The Λ_𝒪-algebra structure on `T_∞(U, 𝒪)_m`.
- `lambdaPrimeToLambda_free`: `Λ_𝒪` is free of rank `p^{Σ r_j}` over `Λ′_𝒪`.

**Checks.**

- `lambdaPrimeToLambda_rank_one_variable`: `δ_F = 1, r_1 = 1: 𝒪[[T]]` over `𝒪[[X]]` with `1 + X ↦ u(1 + T)^p` has basis `1, T, …, T^{p−1}`, rank `p` (not `r_1 = 1`).
- `lambdaPrimeToLambda_r_zero`: If every `r_j = 0, Λ′_𝒪 → Λ_𝒪` is an isomorphism.
- `centralDeterminant_on_Z`: On `x ∈ Z(U), D(x) = S_xε(x)`, recovering the X-structure of Layer 1.
- The rank is `p^{Σ r_j}`; Skinner–Wiles print `Σ r_j`; the rank `p^{Σ r_j}` corrects the printed exponent. Only freeness and finiteness are used.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 41 (Numdam PDF page 38; printed page `=` PDF page `+ 3).`)

*Needs:* §2.3; PadicFamilies:§5.3; mathlib:MvPowerSeries; mathlib:Module.Free.

### 2.6 Finiteness and freeness at a permissible maximal ideal

If `m` is a permissible maximal ideal of `T_∞(U, 𝒪)`, then (i) `T_∞(U, 𝒪)_m` is a torsion-free finite Λ_𝒪-algebra; `(ii)` if every nonidentity element of `U/(U ∩ F^×)` acts on `D^×\G^D(A_f)` without fixed points, `M_∞(U)_m` and `M⁺_∞(U)_m` are free Λ_𝒪-modules of equal rank.

`m` permissible; for `(ii)` the fixed-point-free hypothesis of Skinner–Wiles Proposition 3.3.

`T_∞(U, 𝒪)` is finite and torsion-free over `Λ′_𝒪` and semilocal complete (Skinner–Wiles Corollary 3.4, from PadicFamilies Layer 5), so `T_∞(U, 𝒪)_m` is a direct factor, finite over `Λ′_𝒪` and hence over `Λ_𝒪`.

Torsion-freeness over `Λ_𝒪`: if `λt = 0` with `0 ≠ λ ∈ Λ_𝒪`, the norm `N(λ) ∈ Λ′_𝒪` is nonzero and kills `t`.

`M_∞(U)` is free over `Λ′_𝒪` (Proposition 3.3, PadicFamilies Layer 5); `M_∞(U)_m` is a direct summand, so free over `Λ′_𝒪`; a finite Λ_𝒪-module free over `Λ′_𝒪` has depth dim `Λ_𝒪`, so it is free over the regular local ring `Λ_𝒪` (Auslander–Buchsbaum).

Equal ranks: the ordinary pairing makes the m-parts of `eH⁰(X(U_a), 𝒪)` and `eH⁰(X(U_a), 𝒪)⁺` mutually 𝒪-dual.

**Checks.**

- `T_∞(U, 𝒪)_m` is only torsion-free and finite over `Λ_𝒪`; flatness is not asserted. Freeness is proved for `M_∞(U)_m` and `M⁺_∞(U)_m` under the fixed-point-free hypothesis.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, Lemma 3.10, p. 41 (Numdam PDF page 38; printed page `=` PDF page `+ 3).`)

*Needs:* §2.5; PadicFamilies:§5.5; §1.4; PadicFamilies:Layer 5; mathlib:Module.Free; mathlib:Module.Finite; mathlib:IsLocalRing; DeformationAndDerivedPatchingAlgebra:§§3.1–3.2.

### 2.7 Freeness over an auxiliary Δ_w-group

Let `w ∤ p` be a place with `U_w = GL₂(𝒪_{F,w}), Δ_w` the Sylow p-subgroup of `(𝒪_F/ℓ_w)^×` and `Δ′_w` a complement; `U′_w = {(a b`; `c d) ∈ GL₂(𝒪_{F,w}`) : `c ∈ ℓ_w}, U″_w = {(a b`; `c d) ∈ U′_w` : `ad^{−1} mod ℓ_w ∈ Δ′_w}, U′ = U′_w∏_{v≠w}U_v` and U″ `= U″_w∏_{v≠w}U_v`. Then `U′_a/U″_a ≅ Δ_w` via (`a b`; `c d) ↦` the image of `(ad^{−1})_w (3.12)`; `Δ_w` acts on `H⁰(X(U″_a), R)` commuting with `G(U″_a), T₀(p_i), T(ℓ)` and `S(ℓ) (ℓ ∤ pw)`, compatibly in a, and `H⁰(X(U″_a), R)^{Δ_w} = H⁰(X(U′_a), R) (3.13)`. If every nonidentity element of `U′/(F^× ∩ U′)` acts on `D^×\G^D(A_f)` without fixed points, then (i) `M_∞(U″)` and `M⁺_∞(U″)` are free Λ′_𝒪[[Δ_w]]-modules, and `(ii) M_∞(U″)_{Δ_w} = M_∞(U′)` and `M⁺_∞(U″)_{Δ_w} = M⁺_∞(U′)`.

`w ∤ p` with `U_w` maximal; the fixed-point-free hypothesis is at level `U′`.

(3.12) and (3.13) are statements about the quaternionic sets and their change of level `(R18.3)`.

`#H⁰(X(U″_a), 𝒪/πⁿ)_{Δ_w} = #H⁰(X(U″_a), 𝒪/πⁿ)^{Δ_w} = #H⁰(X(U′_a), 𝒪/πⁿ)`, and the hypothesis gives `#X(U″_a) = #Δ_w·#X(U′_a)`.

So `H⁰(X(U″_a), 𝒪/πⁿ)` is free over the local ring `𝒪/πⁿ[Δ_w]`: its minimal number of generators is `#X(U′_a)` and its order is `#(𝒪/πⁿ[Δ_w])^{#X(U′_a)}`.

Pass to ordinary parts (`e` commutes with `Δ_w`) and to the limit with Proposition 3.3 (PadicFamilies Layer 5).

**Checks.**

- Freeness over the auxiliary group `Δ_w` and finite flatness over weight space are separate statements; this one needs the fixed-point-free hypothesis at level `U′`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.5, Lemma 3.19, p. 49 (Numdam PDF page 46; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.5, proof of Lemma 3.19, p. 50 (Numdam PDF page 47; printed page `=` PDF page `+ 3).`)

*Needs:* PadicFamilies:§5.5; PadicFamilies:§5.2; HilbertModularVarietiesAndShimuraCurves:§§R18.3.1–R18.3.22; §1.6; PadicFamilies:Layer 5; mathlib:Module.Free; mathlib:IsLocalRing.

### 2.8 Duality between `M_∞` and `M⁺_∞` over `Λ`

(Skinner–Wiles §3.7.) If `U/(U ∩ F^×)` acts freely on `D^×\G^D(A_f)`: for each a, `Hom_{𝒪[[G(U)]]}(M⁺_∞(U), 𝒪[[G(U_a)]]) = Hom_𝒪(eH⁰(X(U_a), 𝒪), 𝒪) = eH⁰(X(U_a), 𝒪)⁺ (λ_a`, via the trace `𝒪[[G(U_a)]] → 𝒪` and the pairing), compatibly with `tr(U_b, U_a)`; hence `λ_∞` : `Hom_{𝒪[[G(U)]]}(M⁺_∞(U), 𝒪[[G(U)]]) ≅ M_∞(U)` and `β_∞(U)` : `Hom_{Λ′_𝒪}(M⁺_∞(U), Λ′_𝒪) ≅ M_∞(U)`, natural for maps compatible with `G(U) → G(V)`. At a prime `𝔭` of `T_∞(U, 𝒪)` with `P = Λ′_𝒪 ∩ 𝔭, M̂_∞(U)_𝔭 ≅ Hom_{Λ̂′_P}(M̂⁺_∞(U)_𝔭, Λ̂′_P) (3.16)`; at a permissible `m, M_∞(U)_m ≅ Hom_{Λ_𝒪}(M⁺_∞(U)_m, Λ_𝒪) (3.17)`.

Free action of `U/(U ∩ F^×)` on `D^×\G^D(A_f)`.

`λ_a`: under free action `M⁺_∞(U) ⊗_{𝒪[[G(U)]]} 𝒪[G(U_a)] = eH⁰(X(U_a), 𝒪)`; Frobenius reciprocity for the finite group `G(U_a)` identifies `Hom_{𝒪[G]}(M, 𝒪[G])` with `Hom_𝒪(M, 𝒪)` through the coefficient of the identity; the pairing does the rest (Layer 1).

`𝒪[[G(U)]] = Λ′_𝒪[Z_0]` with `Z_0` finite, and Hom over `Λ′_𝒪` and over `𝒪[[G(U)]]` agree through the trace (again Frobenius reciprocity), giving `β_∞`.

`(3.17): M_∞(U)_m` and `M⁺_∞(U)_m` are free over `Λ_𝒪` (Lemma 3.10). For `Λ′_𝒪→Λ_𝒪` of §2.5, use the Frobenius functional that extracts the coefficient of `∏_j T_j^(p^{r_j}−1)` in the distinguished-polynomial power basis. Its multiplication pairing is perfect and identifies `Hom_{Λ_𝒪}(M,Λ_𝒪)` with `Hom_{Λ′_𝒪}(M,Λ′_𝒪)`. Transport the adjoint duality through this comparison. The ordinary algebra trace is not a perfect integral pairing for this ramified weight extension: in the residue algebra `𝔽₅[T]/(T⁵)`, the algebra trace is zero, whereas the coefficient-of-T⁴ functional pairs `T^i` with `T^(4−i)` to 1.

**Checks.**

- Use coefficient-of-identity Frobenius reciprocity and Λ′_𝒪-freeness. Do not infer freeness over `𝒪[[G(U)]]` from freeness over `Λ′_𝒪`; the finite torsion subgroup need not act freely.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.7, p. 56 (Numdam PDF page 53; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.7, (3.17), p. 57 (Numdam PDF page 54; printed page `=` PDF page `+ 3).`)

*Needs:* PadicFamilies:§5.5; §1.4; §1.5; §2.6; PadicFamilies:§5.6.

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

(a) The Deligne–Ribet p-adic L-function `L_p(F, s, χω)` with its interpolation of `L^{(p)}(F, 1 − n, χω^{1−n})`; Hilbert Eisenstein series `E_n(φ₁, φ₂)` of parallel weight `n`, spanning a complement of the cusp forms, with constant terms `a_i(E_n(1, ψ), 0) = 2^{−d}L(F, 1 − n, ψ)Nm(t_i)^{n/2}` (Skinner–Wiles (3.10)); Chai's integral form `g` with `a_i(g, 0) = 2^{−d}Nm(t_i)^{n/2}` for large `n ≡ 2 mod (p − 1)p^f`([Ch, §4.5], (3.11)); Wiles' vanishing of Eisenstein combinations with zero constant terms ([W3, Proposition 1.6]); Wiles' Λ-adic forms ([W2, Theorem 1.4.1]); and the congruences for the Deligne–Ribet p-adic L-function under abelian p-extensions (Skinner–Wiles (4.17), citing `[Co], [D-R], [Se]`). Prove these totally real abelian p-adic L-function and Eisenstein comparisons here using the supplied Hilbert-family carriers. (b) For the Newton–Thorne Hilbert weight change: the Hilbert Hida family and its arithmetic specializations over an arbitrary totally real field (not only the even-degree definite-quaternion realization), with the tame branch giving determinant `ε⁻²ω`, residual constancy and ordinary local Galois shape; the residue-indistinguishable case handled without an unsupported p-distinguishedness assumption; arithmetic specializations covering the ordinary weight-zero seed and the weight-two/trivial-nebentypus refinements with their exact determinants, local ordinary characters and compatible residual representations. (c) The new quotient `T^new_N` of Hida's ordinary Hecke algebra over `ℚ` (EPW Definition 2.2.1, Theorem 2.2.2: finite, reduced and torsion-free over `Λ`, classical primes corresponding to forms of tame conductor `N`, étale over `Λ_℘` at classical `℘`), and the correspondence between classical height-one primes of `T_N` and Galois-conjugacy classes of ordinary eigenforms (EPW Theorem 2.1.2 and after). (d) For the ordinary tower duality: (i) in Skinner–Wiles §3.2 the superscript `⁺` is the module `eH⁰(X(U_a), R)⁺` on which a Hecke operator `t` acts through its adjoint `t⁺` for the stabiliser-weighted pairing (§1.4), not a subspace cut out by a central-character or norm-form condition; `(ii)` the complete-DVR compact/discrete duality: for `L` finite free over `𝒪, Hom_𝒪(L, 𝒪) ≅ Hom_𝒪(L ⊗ K/𝒪, K/𝒪)`, and the continuous dual of a discrete direct limit is the inverse limit of the finite-level duals, compatibly with trace, restriction and the Hecke adjoints.

Prove the Deligne–Ribet interpolation, Hilbert Eisenstein constant-term formulas, Chai form and congruence statements used in §2.4 and §5.2 as arithmetic targets here. The Hilbert expansion and ordinary-family carriers and their integral coefficient API are those of PadicFamilies §§5.9a–5.10. The specialization at the determinant and labelled weights of §2.11 is an arithmetic comparison here; it retains the full totally real generality stated above. The EPW new quotient and its arithmetic-prime properties are constructed in §6.3. For the duality in clause (d), use DeformationAndDerivedPatchingAlgebra §7.6 for the complete-DVR fraction-quotient dual. Prove in clause (d) that its continuous dual sends these discrete direct limits to compact inverse limits, compatibly with the actual trace, restriction and adjoint action: a map out of the direct limit is exactly a compatible family of finite-level maps, and the finite-level duals carry their inverse-limit topology. Section 2.8 applies this duality to the ordinary tower.

**Checks.**

- At weight `n≡2` modulo `(p−1)p^f` the constant terms give the value at `−1` by interpolation; replacing `ψ=χω⁻¹` by `χ` changes those terms.
- The determinant `ε⁻²ω` reduces to `ε̄⁻¹`; `ε⁻²` alone changes the residual determinant.
- For a complete DVR, the dual of `K/𝒪` is `𝒪`; for an incomplete DVR it is its completion. The superscript `⁺` changes the Hecke action, while retaining the underlying module.

(Source: SW99 `(3.10)–(3.11)`, §3.4, pp. 46–48, and (4.17), §4.5; Newton–Thorne Lemma 3.1, pp. 13–14; EPW Definition 2.2.1 and Theorems 2.1.2, 2.2.2.)

*Needs:* PadicFamilies §§0.11–0.15, 5.9a–5.10; DeformationAndDerivedPatchingAlgebra §7.6. Clause (c) is the export of §6.3, rather than a prerequisite of clauses (a),(b),(d).

### Examples

For `Λ′→Λ` with `X↦(1+T)⁵−1`, the polynomial is monic of degree 5, so the power basis has five elements; the index exponent `r=1` is not the rank. When all indices vanish, the weight-algebra extension is the identity. A permissible Eisenstein ideal imposes both `T(ℓ)≡1+χ(Frob_ℓ)` and the selected unit `U_p` eigenvalue. The degree-one congruences `τ(2)=−24≡1+2¹¹` and `τ(3)=252≡1+3¹¹` modulo 691 test the Frobenius trace condition; they alone do not assert a permissible ordinary localization in the even-degree quaternionic setup. Coefficient-of-identity duality on `𝒪[Δ]` sends the basis element `[1]` to 1 and `[δ]` with `δ≠1` to 0, whereas augmentation sends both to 1.

### Dependencies

AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1; AutomorphicGaloisRepresentations:§§4.4, 4.12, 6.4; DeformationAndDerivedPatchingAlgebra:§§3.1–3.2; GL2AutomorphicRepresentationsAndTransfer:§§R16.6.1–R16.6.5; §1.6; HilbertModularVarietiesAndShimuraCurves:§§R18.3.1–R18.3.22; §1.6; PadicFamilies:Layer 5; §2.12 (Deligne–Ribet p-adic L-functions and Hilbert Eisenstein series); PadicFamilies:§5.6; PadicFamilies:§5.3; PadicFamilies:§5.5; PadicFamilies:§5.2; mathlib:IsLocalRing; mathlib:Module.Finite; mathlib:Module.Free; mathlib:MvPowerSeries; mathlib:NumberField.IsTotallyReal; mathlib:QuaternionAlgebra.

## Layer 3: Nearly ordinary deformations and Galois–Hecke interfaces

### 3.1 Skinner–Wiles deformation data and the residual extension `ρ_c`

`F` is totally real of degree `d, p` odd, `v_1, …, v_t` the places above `p` with decomposition and inertia groups `D_i ⊇ I_i` and local degrees `d_i, z_1, …, z_d` the chosen complex conjugations, and `χ` : `Gal(F̄/F) → k₀^×` a character of a finite field of characteristic `p` with `χ|_{D_i} ≠ 1` for every `i` and `χ(z_j) = −1` for every `j`. A deformation datum is `𝒟 = (𝒪, Σ, c, ℳ): 𝒪` the ring of integers of a local field with finite residue field `k ⊇ k₀`; `Σ` a finite set of finite places containing those where `χ` ramifies and `𝒫 = {v_1, …, v_t}`; a class `0 ≠ c ∈ H_Σ(F, k) := ker(H¹(F_Σ/F, k(χ^{−1})) → ⊕_i H¹(D_i, k(χ^{−1}))) (c` is admissible); and `ℳ ⊆ Σ∖𝒫` a set of places at each of which `c` is ramified or `χ|_{I_v} ≠ 1`. Through `H¹(F_Σ/F, k(χ^{−1})) ≅ H¹(F_Σ/F(χ), k(χ^{−1}))^{Gal(F(χ)/F)}` the class `c` gives a unique `ρ_c` : `Gal(F_Σ/F) → GL₂(k), ρ_c = (1 *`; `0 χ`), with `ρ_c(z_1) = diag(1, −1)` and `ρ_c(σ) = (1 c(σ)`; 0 1) for `σ ∈ Gal(F_Σ/F(χ))`; for admissible `c, ρ_c|_{D_i} ≅ diag(1, χ)`.

`χ|_{D_i} ≠ 1` at every `v_i | p` (p-distinguished) and `χ` totally odd.

`ρ_c` is nonsplit because `c ≠ 0`; as `χ ≠ 1` its centraliser is the scalars, so `ρ_c` is Schur (the hypothesis of LocalGaloisDeformationRings §F.2.5).

Admissibility kills the restriction of `c` to `D_i`, and `χ|_{D_i} ≠ 1` splits the local extension.

Provide the following operations and compatibility statements.

- `DeformationDatum`: `(𝒪, Σ, c, ℳ)` with `c` admissible and `ℳ ⊆ Σ∖𝒫`.
- `admissibleClasses`: `H_Σ(F, k) =` ker(res to `⊕ H¹(D_i, k(χ^{−1}))`).
- `residualExtension`: `ρ_c = (1 *`; `0 χ`).
- `residualExtension_schur`: `End_{k[G]}(ρ_c) = k` for `c ≠ 0`.
- `residualExtension_local_split`: `ρ_c|_{D_i} ≅ diag(1, χ)` for admissible `c`.

**Checks.**

- `residualExtension_zero_excluded`: `c = 0` gives the split `1 ⊕ χ`, which is not Schur and is excluded from deformation data.
- `residualExtension_complex_conjugation`: `ρ_c(z_1) = diag(1, −1)` since `χ(z_1) = −1`.
- `deformationDatum_ribet_691`: `F = ℚ, p = 691, χ = ω¹¹`: take Ribet’s nonzero class coming from an unramified extension of `ℚ(ζ₆₉₁)`. Its local restriction is unramified, and `H¹_unr(D₆₉₁,k(ω⁻¹¹)) = H¹(D₆₉₁/I₆₉₁,k(ω⁻¹¹)^I₆₉₁) = 0` because the inertia invariants vanish. Thus the class is admissible; ramification of `ω⁻¹¹` alone would not make all local `H¹` vanish.
- `ρ_c` is reducible but not split: the absolutely irreducible representability theorem is never used.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.1, p. 9 (Numdam PDF page 6; printed page `=` PDF page `+ 3).`)

*Needs:* LocalGaloisDeformationRings:§F.1.3.

### 3.2 Nearly ordinary deformations of type `𝒟` and the ring `R_𝒟`

A deformation of `ρ_c` is a complete local Noetherian ring `A` with residue field `k` and a strict equivalence class of continuous `ρ` : `Gal(F̄/F) → GL₂(A)` lifting `ρ_c`. It is of type `𝒟` if A is an 𝒪-algebra, `ρ` is unramified outside `Σ` and `∞, ρ|_{D_i} ≅ (ψ^{(i)}_1 *`; `0 ψ^{(i)}_2`) with `χ = ψ^{(i)}_1 mod m_A` for each `i`, and `ρ|_{I_w} ≅ (1 *`; `0 χ̃`) for each `w ∈ ℳ (χ̃` the Teichmüller lift). There is a universal deformation of type `𝒟, ρ_𝒟` : `Gal(F_Σ/F) → GL₂(R_𝒟)`. For `Q` a finite set of places disjoint from `Σ`, type `𝒟_Q` adds ramification at `Q` with det `ρ` unramified at `Q`, giving `R_{𝒟_Q}`; a deformation is 𝒟_Q-minimal if `χ̃^{−1}det ρ` is trivial on the torsion `N_Σ` of `Gal(L_Σ/F)`, and `R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗_𝒪 𝒪[N_Σ]` with `ρ_{𝒟_Q} ≅ ρ^min_{𝒟_Q} ⊗ Ψ_Σ`.

`ρ_c` Schur; `Gal(F_Σ/F)` satisfies Mazur's `Φ_p` (LocalGaloisDeformationRings §§F.2.2, `F.2.5`).

The conditions are deformation conditions (stable under the Schlessinger fibre products); LocalGaloisDeformationRings §F.2.5 gives representability for Schur `ρ_c`.

The nearly ordinary condition at `v_i` is the ordered-flag condition with the χ-line as sub (§3.39, using LocalGaloisDeformationRings Layers `6–8`).

Minimal twist: `N_Σ` is a finite p-group with `p` odd, so every character of it is a square; `ρ^min ⊗ Ψ_Σ` with `Ψ_Σ` : `Gal(L_Σ/F) ↠ N_Σ` is universal for type `𝒟_Q` (Skinner–Wiles §2.3).

Provide the following operations and compatibility statements.

- `IsOfType`: The four conditions of type `𝒟`.
- `universalRing`: `R_𝒟` with `ρ_𝒟`.
- `universalRing_represents`: `R_𝒟` pro-represents deformations of type `𝒟`.
- `universalRingAux`: `R_{𝒟_Q}` for `Q` disjoint from `Σ`.
- `universalRingMin`: `R^min_{𝒟_Q}` and `R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗ 𝒪[N_Σ]`.

**Checks.**

- `isOfType_residual`: `ρ_c` over `k` is of type `𝒟` (the point `m_{R_𝒟}`).
- `isOfType_wrong_order`: Over `k[η]/(η²)` take a lift whose restriction to `D_i` is (`1 ηb`; `0 χ̃`) with `σ ↦ b(σ)χ(σ)⁻¹` a nonzero class in `H¹(D_i, k(χ⁻¹))`; such classes exist because that group has dimension at least `d_i`. Its only D_i-stable line has character reducing to 1, not `χ`, so the condition at `v_i` fails, although the residual `ρ_c|_{D_i} = diag(1, χ)` admits both orders. Exchanging the labels of a split lift tests only the chosen ordered flag.
- `isOfType_restriction`: For `F′/F` permissible for `𝒟`, restriction sends type `𝒟` to type `𝒟′` (Remark 2.1).
- `universalRingMin_twist`: Twisting by a character of `N_Σ` (odd order) moves between the components of `R_{𝒟_Q} ≅ R^min ⊗ 𝒪[N_Σ]`.
- Skinner–Wiles write 'det `ρ` is trivial on `N_Σ'`; since det `ρ ≡ χ`, the condition is on `χ̃^{−1}det ρ`.
- The determinant is not fixed: `R_𝒟` carries the Λ_𝒪-variables of §3.13.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.1, p. 10 (Numdam PDF page 7; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.3, p. 18 (Numdam PDF page 15; printed page `=` PDF page `+ 3).`)

*Needs:* §3.1; LocalGaloisDeformationRings:§F.2.5; GlobalGaloisDeformations:§3.4; LocalGaloisDeformationRings:Layers 6–8; §3.39.

### 3.3 Extensions permissible for a deformation datum

A totally real finite `F′/F` is permissible for `𝒟` if `ρ_c|_{Gal(F̄/F′)}` is nonsplit; for `v ∈ ℳ` with `χ|_{I_v} ≠ 1, χ|_{I_w} ≠ 1` at every `w | v` of `F′`; for `v ∈ ℳ` with `ρ_c|_{I_v} ≠ 1` but `χ|_{I_v} = 1, ρ_c|_{I_w} ≠ 1` at every `w | v`; and `χ|_{D_w} ≠ 1` at every `w | p` of `F′`. Then `𝒟′ = (𝒪, Σ′, c, ℳ′)` (places above `Σ` and `ℳ`) is a deformation datum for `F′`, and restriction sends deformations of type `𝒟` to type `𝒟′` (Remark 2.1).

`F′` totally real, so `χ` stays totally odd.

Each condition preserves one clause of the definition of a deformation datum or of type `𝒟` after restriction.

Provide the following operations and compatibility statements.

- `IsPermissibleExtension`: The four conditions on `F′/F`.
- `DeformationDatum.baseChange`: `𝒟 ↦ 𝒟′` for permissible `F′`.
- `isOfType_baseChange`: Restriction of a type-𝒟 deformation is of type `𝒟′`.

**Checks.**

- `permissible_self`: `F′ = F` is permissible for `𝒟`.
- `permissible_split_fails`: Restriction to a field containing the field cut out by `ρ_c` makes the representation trivial, hence split and not permissible. Since `χ` is odd, that field is not totally real: this also tests the ambient total-reality requirement, rather than supplying a totally real counterexample.
- `permissible_distinguished_fails`: A totally real extension with `χ|D_w=1` at a p-place `w` fails the distinguishedness condition. Local killing of `χ` can occur without killing `χ` globally. The global field `F(χ)`, which kills `χ` everywhere, is not a permitted totally real extension because `χ` is odd.
- Skinner–Wiles use base change to permissible `F′` to make the reducible locus of large codimension (§4); the choice of `F′` depends on `Σ`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.1, p. 10 (Numdam PDF page 7; printed page `=` PDF page `+ 3).`)

*Needs:* §3.1; §3.2; GlobalGaloisDeformations:§4.1.

### 3.4 The presentation of `R_𝒟` and its dimension bound

For every deformation datum `𝒟` there are integers `g, r` with `R_𝒟 ≅ 𝒪[[x_1, …, x_g]]/(f_1, …, f_r)` and `g − r ≥ d + δ_F −` 2t `− 3·#ℳ`, where `δ_F` is the ℤ_p-rank of the Galois group of the maximal abelian pro-p extension of `F` unramified outside `p` (Skinner–Wiles Proposition 2.4). Hence every component of `R_𝒟` has dimension `≥ 1 + d + δ_F −` 2t `− 3·#ℳ`.

`ρ_c` is Schur; the split residual local nearly ordinary versal rings are imported from LocalGaloisDeformationRings §6.2 (`SW99` Lemma 2.2 and Corollary 2.3).

Auxiliary type: deformations with det `ρ = χ̃`, unramified outside `Σ`, with universal ring `R^aux_𝒟 ≅ 𝒪[[x_1, …, x_{g′}]]/(f_1, …, f_{r′}), g′ = h¹(F_Σ/F, ad⁰ρ_c), r′ ≤ h²(F_Σ/F, ad⁰ρ_c)` (Mazur's presentation, §3.39 (unframed presentation), using GlobalGaloisDeformations §§3.4–3.8).

At each `v_i, R^{(i)}_ord` is a quotient of the versal ring `R^{(i)}` by `d_i + ε_i ≤ d_i + 2` elements (Corollary 2.3); the images `J` of these kernels in `R^aux_𝒟` are generated by `Σ_i(d_i + 2) = d +` 2t elements (2.4).

Removing the determinant condition: `R_{𝒟′} ≅ R^aux_𝒟/J ⊗̂_𝒪 𝒪[[Gal(L(Σ)/F)]]` for `𝒟′ = (𝒪, Σ, c, ∅) (2.5)` (LocalGaloisDeformationRings §F.2.9 and GlobalGaloisDeformations §7.4, with `n = 2, p ∤ 2`), and `𝒪[[Gal(L(Σ)/F)]] ≅ 𝒪[[x_1, …, x_{δ_F}, y_1, …, y_s]]/(g_1, …, g_s) (2.6), s = dim_k` H¹(D-free part) as in (2.2).

The ℳ-conditions: `I = ker(R_{𝒟′} ↠ R_𝒟)` is generated by `a_v − 1, d_v − 1, c_v` at a generator `τ_v` of tame p-inertia, `3·#ℳ` elements (2.7).

Hence `g = g′ + s + δ_F` and `r = r′ + s + d +` 2t `+ 3·#ℳ`; the global Euler characteristic formula for `ad⁰ρ_c` (ArithmeticGaloisDuality §R02.4.4), with `ρ_c` odd, gives `g′ − r′ ≥` 2d, whence the bound.

**Checks.**

- The bound is on `g − r` for this particular presentation; dimension `≥ 1 + (g − r)` follows because `R_𝒟` is a quotient of a regular ring of dimension `g + 1` by `r` elements.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.1, p. 13 (Numdam PDF page 10; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.1, proof of Proposition 2.4, p. 14 (Numdam PDF page 11; printed page `=` PDF page `+ 3).`)

*Needs:* §3.2; GlobalGaloisDeformations:§§4.4, 7.4; GlobalGaloisDeformations:§§3.4–3.8; LocalGaloisDeformationRings:§6.2; ArithmeticGaloisDuality:§R02.4.4; PadicFamilies:§5.1.

### 3.5 `R_𝒟` is topologically generated by matrix entries

Fix a basis for `ρ_𝒟` and let `R′ ⊆ R_𝒟` be the 𝒪-subalgebra generated by the matrix entries `a_σ, b_σ, c_σ, d_σ, m′ = m_𝒟 ∩ R′, R_1 = R′_{m′}` and `R̂_1` its completion. Then `R̂_1 → R_𝒟` is surjective (Lemma 2.5). If `𝔭 ⊊ R_𝒟` is not maximal and `𝔭_1 = R_1 ∩ 𝔭`, then dim `R_1/𝔭_1 ≥ 1` (Lemma 2.6).

Lemma `2.5: ρ_1` over `R̂_1` composes to `ρ_𝒟`; universality gives `R_𝒟 → R̂_1/m_1` with kernel `m_𝒟`, so `m_1R_𝒟 = m_𝒟` and `dim_k R_𝒟/m_1R_𝒟 = 1`; then `R_𝒟` is generated as an R̂_1-module by one element (Matsumura, Theorem 8.4).

Lemma 2.6: if `𝔭_1` were maximal, `𝔭` would contain a uniformiser and `ρ_𝒟 mod 𝔭` would have entries in `k`, so by universality `𝔭 = m_𝒟`.

**Checks.**

- Used in Proposition 2.11 to compare `R_{𝒟_Q}` with the pseudo-deformation ring.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.1, p. 15 (Numdam PDF page 12; printed page `=` PDF page `+ 3).`)

*Needs:* §3.2.

### 3.6 Types A, `B, B′` and `C` at a place `w ∤ p`

For a field `𝒦` of characteristic 0 or `p` and `ρ` : `Gal(F̄/F) → GL₂(𝒦)` ramified at `w ∤ p`: type A if `ρ|_{I_w} ≅ (1 *`; 0 1) with `* ≠ 0`; type `B` if `ρ|_{I_w} ≅ diag(φ, 1)` with `φ` a finite character; type `B′` if `ρ|_{I_w} ≅ diag(φ, φ^{−1})` with `φ` finite; type `C` if `ρ|_{D_w} = Ind_{F_{w²}}^{F_w} ψ` for the unramified quadratic `F_{w²}/F_w` and `ψ` with `ψ|_{I_w} ≠ ψ^{Frob_w}|_{I_w}, ψ|_{I_w}` of p-power order and det `ρ|_{D_w}` of order prime to p. Type `C` occurs only in characteristic 0.

`w ∤ p`; `𝒦` a field of characteristic 0 or p.

The four shapes are the possibilities used later; they are not claimed to be exhaustive.

Provide the following operations and compatibility statements.

- `RamificationType`: The types A, `B, B′, C` at `w`.
- `ramificationType_of_pseudo`: The type of `ρ_Q` is inherited by `ρ_P` for `P ∈ 𝒳(Q)` (proof of Proposition 3.14).
- `typeC_charZero`: Type `C` forces characteristic 0.

**Checks.**

- `typeA_steinberg`: The ℓ-adic representation of an elliptic curve with split multiplicative reduction at `w` is of type A there.
- `typeB_character`: A principal series `π(μ, 1)` with `μ` tamely ramified gives type `B`.
- `typeC_charZero_example`: In characteristic `p` a character of p-power order is trivial (there are no nontrivial p-power roots of unity), so `ψ|_{I_w} = 1 = ψ^{Frob}|_{I_w}` and type `C` cannot occur.
- The types are properties of a representation over a field (`ρ_Q` over `Frac(T/Q)`, or a residue field), not of a pseudo-representation.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.3, p. 19 (Numdam PDF page 16; printed page `=` PDF page `+ 3).`)

*Needs:* §3.1.

### 3.7 Wiles pseudo-representations and pseudo-deformations

A (2-dimensional) pseudo-representation of `Gal(F̄/F)` into a commutative topological ring `A` with 2 invertible is `ρ = {a, d, x}` with continuous a, `d` : `Gal(F̄/F) →` A and `x` : `Gal(F̄/F)² →` A such that `a(στ) = a(σ)a(τ) + x(σ, τ)`; `d(στ) = d(σ)d(τ) + x(τ, σ)`; `x(σ, τ)x(α, β) = x(σ, β)x(α, τ)`; `x(στ, αβ) = a(σ)a(β)x(τ, α) + a(β)d(τ)x(σ, α) + a(σ)d(α)x(τ, β) + d(τ)d(α)x(σ, β)`; `a(1) = 1 = d(1)`; `a(z_1) = 1 = −d(z_1)`; and `x(σ, g) = 0 = x(g, σ)` for `g ∈ {1, z_1}`. Its trace is a `+ d` and its determinant is `a(σ)d(σ) − x(σ, σ)`. A representation with `ρ(z_1) = diag(1, −1), ρ(σ) = (a_σ b_σ`; `c_σ d_σ`), gives `{a_σ, d_σ, b_σc_τ}`. `ρ_0 = {1, χ, 0}` is the pseudo-representation of `1 ⊕ χ`; a pseudo-deformation is `(A, ρ)` with A complete local Noetherian with residue field `k` and `ρ mod m_A = ρ_0`; a pseudo-datum `𝒟^ps = (𝒪, Σ)` asks A to be an 𝒪-algebra and `ρ` to factor through `Gal(F_Σ/F)`; type `𝒟^ps_Q` adds places `Q` with det `ρ` unramified at `Q`.

`p` odd; the complex conjugation `z_1` normalises the basis.

The identities for `{a_σ, d_σ, b_σc_τ}` expand the matrix product.

The trace a `+ d` is a 2-dimensional pseudocharacter (IntegralHeckeAndGaloisDeterminants §0.5), 2 being invertible.

Provide the following operations and compatibility statements.

- The ordered data: `{a, d, x}` with the seven identities.
- Trace: a `+ d`.
- Determinant: `a(σ)d(σ) − x(σ, σ)`.
- Representation comparison: `{a_σ, d_σ, b_σc_τ}` for a continuous matrix representation `ρ` with `ρ(z_1) = diag(1, −1)`, over a commutative topological ring with 2 invertible.
- Residual triple: The actual continuous ordered triple `{1,χ,0}` for a character `χ` with `χ(z_1)=−1`.
- Diagonal conjugation leaves the ordered construction unchanged.
- Pseudocharacter comparison: The trace is an IHG.0 pseudocharacter of dimension 2.

**Checks.**

- For 2×2 matrices, `b_{στ}c_{αβ} = (a_σb_τ + b_σd_τ)(c_αa_β + d_αc_β)` expands to the fourth identity.
- Directly evaluate the trace and determinant at 1 to obtain `(2,1)`, and on the residual triple at `σ` to obtain `(1+χ(σ),χ(σ))`. On the ordered construction with matrix `[[2,1],[1,1]]` obtain trace 3, determinant 1 and `x(σ,σ)=1`; neither a negated trace nor a constant determinant passes these tests.
- `pseudoRep_residual`: `ρ_c` and `ρ_{c′}` have the same pseudo-representation `ρ_0 = {1, χ, 0}`, since `x =` bc vanishes when c-entries are 0.
- For `ρ = (a b`; `c d`), the ordered construction has trace `a_σ+d_σ=trρ(σ)` and determinant `a_σd_σ − b_σc_σ=detρ(σ)`.
- Conjugating by `diag(u, 1)` scales `b` by `u` and `c` by `u^{−1}`, leaving `b_σc_τ` fixed.
- For fixed `z₁` and 2 invertible, `a(σ)=(T(σ)+T(z₁σ))/2`, `d(σ)=(T(σ)−T(z₁σ))/2` and `x(σ,τ)=a(στ)−a(σ)a(τ)`. The normalizer-dependent ordered presentation carries no independent data beyond the trace. Equivalently, `2a(σ)=T(σ)+T(z₁σ)` and `2d(σ)=T(σ)−T(z₁σ)`.
- Every `ρ_c, c ∈ H¹(F_Σ/F, k(χ^{−1}))`, has pseudo-representation `ρ_0`: the pseudo-deformation ring forgets `c`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.4, p. 19 (Numdam PDF page 16; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.4, p. 21 (Numdam PDF page 18; printed page `=` PDF page `+ 3).`)

*Needs:* §3.1; IntegralHeckeAndGaloisDeterminants:§0.5.

### 3.8 The universal pseudo-deformation ring

Let `D̄` be the continuous degree-two determinant of `1⊕χ` on `G_{F,Σ}`. Define `R_{𝒟^ps}` to be LocalGaloisDeformationRings §F.2.11's `PseudoDefRing` for `D̄`. For a fixed involution `z₁` with `χ(z₁)=−1`, prove `orderedPseudoDefEquiv`, the natural equivalence between its determinant-deformation functor and §3.7's ordered Wiles functor `F_{𝒟^ps}`. Transport the universal determinant through this equivalence to obtain `ρ_{𝒟^ps}` on the same representing ring. For `Q` disjoint from `Σ`, define `R_{𝒟^ps_Q}` from the supplied ring for `G_{F,Σ∪Q}` by the closed ideal generated by `det(τ)−1` for every `τ∈I_w`, `w∈Q`.

The equivalence sends the ordered triple to its trace and then to the unique degree-two determinant supplied by IntegralHeckeAndGaloisDeterminants §0.5. Conversely the trace `T` recovers `a(σ)=(T(σ)+T(z₁σ))/2`, `d(σ)=(T(σ)−T(z₁σ))/2` and `x(σ,τ)=a(στ)−a(σ)a(τ)`. Prove the ordered identities using the degree-two Cayley–Hamilton relations and the idempotents `(1±z₁)/2`; the residual eigenvalues of the involution fix their order. Prove both inverse identities, continuity, compatibility with coefficient change and with the auxiliary-inertia quotient.

Retain the arithmetic tangent bound of Lemma 2.10: `#F_{𝒟^ps}(k[ε])=(#k)^r` with `r≤4·#Gal(F(χ)/F)+2(dim_k H¹(F_Σ/F(χ),k))²+4`.

`k` finite, `p` odd, `z₁²=1` and `χ(z₁)=−1`; `G_{F,Σ}` satisfies `Φ_p`, giving the supplied ring's Noetherianity. In particular `Gal(F_Σ/F(χ))` has finite maximal elementary abelian p-quotient, equivalently finite-dimensional `H¹` with trivial `k` coefficients (class field theory).

As a comparison calculation, verify fibre products coefficientwise in the ordered functions a,d,x: their identities and residual conditions glue uniquely, giving Schlessinger H1, H2 and H4; the arithmetic tangent bound gives H3. Identify this calculation with the supplied representor through `orderedPseudoDefEquiv`.

Over `k[ε]`, write `a=1+εa₁, d=χ+εd₁, x=εx₁` and `G_χ=Gal(F_Σ/F(χ))`, and set `s=dim_k H¹(G_χ,k)`. First map the tangent space linearly to `Hom(G_χ,Hom(G_χ,k))` by restricting `x₁`; its image has dimension at most `s²`. On the kernel of this map, and only there, `a₁|G_χ` and `d₁|G_χ` are homomorphisms, contributing at most `2s` further dimensions. Bound the image and this kernel separately.

The remaining data are cocycles vanishing on `G_χ` or constants on cosets of `G_χ`, giving the bound `(#k)^{s² +` 4s `+ 4·#Gal(F(χ)/F)} ≤ (#k)^{4·#Gal(F(χ)/F) +` 2s² `+ 4}`, since `s² +` 4s `≤` 2s² `+ 4`.

**Checks.**

- The stated bound is weaker than the one the proof gives; both suffice.
- On `G_χ`, `a₁(στ)=a₁(σ)+a₁(τ)+x₁(σ,τ)`. A nonzero `x₁` prevents the unrestricted homomorphism assertion.
- For the matrix `[[1,t],[t,1]]` over `k[t]/(t³)`, its square has diagonal `1+t²`; with `ε=t²`, the ordered data have `x₁(σ,σ)=1` and `a₁(σ²)=1` although `a₁(σ)=0`. The kernel condition removes this contribution.
- On `1⊕χ`, the supplied residual determinant recovers exactly `{1,χ,0}`. Changing a nonsplit extension class leaves this determinant and its representing ring unchanged.
- For `Q=∅` the inertia ideal is zero. For nonempty `Q`, imposing `det(τ)=1` for all auxiliary inertia elements does not impose triviality of the full representation on inertia.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.4, Lemma 2.10, p. 20 (Numdam PDF page 17; printed page `=` PDF page `+ 3).`)

*Needs:* §3.7; LocalGaloisDeformationRings:§§F.1.9–F.1.10, F.2.2, F.2.11; IntegralHeckeAndGaloisDeterminants:§0.5; SchemeAndStackFoundations:§4.4.

### 3.9 From pseudo-deformation rings to deformation rings

For every deformation `ρ` of some `ρ_c` over an 𝒪-algebra `A`, use LocalGaloisDeformationRings §F.1.10's natural representation-to-determinant map and §3.8's `orderedPseudoDefEquiv`. This gives its ordered pseudo-deformation of type `(𝒪,Σ)`. For a datum `𝒟` with `𝒟^ps=(𝒪,Σ)`, the universal property of the supplied `PseudoDefRing` therefore gives the unique `r_𝒟:R_{𝒟^ps}→R_𝒟` inducing the determinant of `ρ_𝒟`, and likewise `r_{𝒟_Q}:R_{𝒟^ps_Q}→R_{𝒟_Q}` and `r^min_𝒟:R_{𝒟^ps}→R^min_𝒟`.

Two bases with `ρ(z_1) = diag(1, −1)` differ by a diagonal matrix, which fixes `a_σ, d_σ` and `b_σc_τ`; universality of `R_{𝒟^ps}` gives `r_𝒟`.

Provide the following operations and compatibility statements.

- `pseudoToDeformation`: `r_𝒟` : `R_{𝒟^ps} → R_𝒟`.
- `pseudoToDeformation_unique`: The unique map inducing `ρ_𝒟's` pseudo-deformation.
- `pseudoToDeformation_aux`: `r_{𝒟_Q}` and `r^min_𝒟`.

**Checks.**

- `pseudoToDeformation_residual`: Modulo maximal ideals `r_𝒟` is the identity of `k`.
- `pseudoToDeformation_basis`: Changing the basis of `ρ_𝒟` by `diag(u, 1)` does not change `r_𝒟`.
- `pseudoToDeformation_not_onto`: Suppose an admissible class `c` has another admissible class `h` independent of `c` modulo coboundaries, with the same local conditions (for example `ℳ=∅`). Over `k[η]/(η²)` the upper-right cocycle `c+ηh` gives a deformation not strictly equivalent to the constant one, while its ordered pseudo-representation is `{1,χ,0}`. Thus the deformation-to-pseudo map is not injective on this tangent space, and `r_𝒟` cannot be surjective in this case.
- No surjectivity of `r_𝒟` is asserted in general. To detect failure, use a nonconstant first-order extension deformation with constant ordered pseudo-representation, rather than merely comparing two different residual data.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.4, p. 21 (Numdam PDF page 18; printed page `=` PDF page `+ 3).`)

*Needs:* §3.8; §3.2; LocalGaloisDeformationRings:§§F.1.10, F.2.11.

### 3.10 Localising at irreducible one-dimensional primes

If `𝔭 ⊆ R_{𝒟_Q}` is a one-dimensional prime with `ρ_{𝒟_Q} mod 𝔭` irreducible and `𝔭^ps = r_{𝒟_Q}^{−1}(𝔭)`, then `R̂_{𝒟^ps_Q, 𝔭^ps} → R̂_{𝒟_Q, 𝔭}` is surjective (Proposition 2.11). Consequently, for any prime `Q ⊆ R_𝒟` with `ρ_𝒟 mod Q` irreducible and `Q^ps = r_𝒟^{−1}(Q)`, dim `R_{𝒟^ps}/Q^ps ≥` dim `R_𝒟/Q`, with equality if `Q` has dimension one (Corollary 2.12).

`A = R_{𝒟_Q}/𝔭` is finite over `A^ps = R^ps/𝔭^ps` (A/m^psA is Artinian), so both have dimension one.

Irreducibility gives `τ_0` with `c_{τ_0} ∉ r(𝔭^ps)`; with `ρ(σ_0) = (* u`; `* *), u` a unit, the `b_σ` lie in the image after localising, so `R′_{𝔭′}` is the image of `R^ps` localised (`R′` the subring generated by im `r` and the `b_σ`).

With Lemma 2.5, `𝔭^psR_{𝒟_Q,𝔭} = 𝔭R_{𝒟_Q,𝔭}` and all residue fields agree, so the completed map is onto (Matsumura, Theorem 8.4).

Corollary 2.12 by induction on dimension through a one-dimensional `𝔭 ⊇ Q` with `ρ mod 𝔭` irreducible.

**Checks.**

- Irreducibility of `ρ mod 𝔭` is essential: at reducible primes the pseudo-deformation ring loses the extension data.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.4, Proposition 2.11, p. 21 (Numdam PDF page 18; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.4, Corollary 2.12, p. 22 (Numdam PDF page 19; printed page `=` PDF page `+ 3).`)

*Needs:* §3.9; §3.5.

### 3.11 Lattices with nonsplit reduction and their extension classes

Let A be a complete DVR with finite residue field `k, K =` Frac A, and `ρ` : `Gal(F_Σ/F) → GL₂(K)` continuous and irreducible with reduction `(ρ̄^ss) 1 ⊕ χ`. (i) There is a stable lattice `L` with `ρ̄_L(σ) = (1 b_σ`; `0 χ(σ)`) nonsplit with scalar centraliser. `(ii)` For two such lattices the classes `σ ↦ χ(σ)^{−1}b_i(σ)` in `H¹(F_Σ/F, k(χ^{−1}))` are nonzero scalar multiples (Lemma 2.13). Consequently, if `(A, φ)` is a pseudo-deformation of `ρ_0` unramified outside `Σ` with `x` not identically zero, there are `0 ≠ c ∈ H¹(F_Σ/F, k(χ^{−1}))` and a deformation `ρ_φ` of `ρ_c` with pseudo-deformation `φ, c` unique up to a scalar (Corollary 2.14).

A a complete DVR with finite residue field `k`; `ρ` continuous and `χ≠1`, as in §3.1.

For (i), apply IntegralHeckeAndGaloisDeterminants §1.4, Classical Ribet lattice, with ordered residual characters `(1,χ)`. The finite residue field makes the complete discretely valued fraction field locally compact, and the profinite Galois group is compact. Construct here (ii), the scalar uniqueness of the extension class, and its pseudo-deformation reconstruction consequence.

`(ii)` The change of lattice commutes with `diag(1, −1)`, so is `diag(1, a)`; unit entries force `ord(a) = 0`.

Corollary `2.14: ρ(σ) = (a(σ) x(σ, τ_0)/x(σ_0, τ_0)`; `x(σ_0, σ) d(σ)`) with ord `x(σ_0, τ_0)` minimal is an irreducible representation with pseudo-representation `φ`; apply the lemma.

**Checks.**

- The extension class is determined only up to a scalar.
- Reversing `(1,χ)` in the supplier reverses the nonsplit extension; retain the prescribed orientation.
- For the split residual lattice the diagonal scalars are independent; the nonsplit, `χ≠1` hypothesis is necessary for the scalar centralizer.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.4, Lemma 2.13, p. 23 (Numdam PDF page 20; printed page `=` PDF page `+ 3).`)

*Needs:* §3.7; IntegralHeckeAndGaloisDeterminants §1.4, Classical Ribet lattice.

### 3.12 Lifting pseudo-deformations at one-dimensional primes

(Proposition 2.15.) Let `R` be a local complete Noetherian 𝒪-domain, and let `(R, ρ)` be a pseudo-deformation of type `(𝒪, Σ), 𝔭 ⊆ R` a prime of dimension one with `x(σ, τ) mod 𝔭` not identically zero, and `k′` the residue field of the integral closure of `R/𝔭`. There are `0 ≠ c ∈ H¹(F_Σ/F, k′(χ^{−1}))`, unique up to a scalar, a local complete Noetherian 𝒪-domain `R⁺` with residue field `k′` and dim `R⁺ =` dim `R`, a local 𝒪-algebra map `R ↪ R⁺`, a dimension-one prime `𝔭⁺ ⊆ R⁺` over `𝔭`, and a deformation `ρ⁺` : `Gal(F_Σ/F) → GL₂(R⁺)` of `ρ_c` whose pseudo-deformation is induced from `ρ`. If moreover `ℳ, Q ⊆ Σ` satisfy (2.8) and `ρ⁺ ⊗ ℒ (ℒ =` Frac `R⁺`) satisfies (2.9), then `ρ⁺` is of type `𝒟_Q` for `𝒟 = (𝒪′, Σ∖Q, c, ℳ), 𝒪′ = 𝒪 ⊗_{W(k)} W(k′)`.

`(2.8): ℳ ⊆ Σ∖𝒫` are places where `ρ_c` ramifies and `Q ⊆ Σ∖(𝒫 ∪ ℳ)` places where it is unramified. (2.9): the nearly ordinary shape at every `v_i`, the shape (`1 *`; `0 χ̃`) on `I_w` for `w ∈ ℳ`, and det unramified on `Q`.

Corollary 2.14 gives `c` and `ρ_𝔭` over the normalisation A of `R/𝔭`.

Blow up: `R′ = R[α/β]` with `α/β` a uniformiser of `A`, then `R* = R′[i_1/i, …, i_r/i]` with `i` an `x(σ, τ)` of minimal valuation; complete at the preimage of `m_A` and pass to a quotient by a minimal prime `q⁺` (going down, Matsumura Theorem 9.5) to get a domain `R⁺` with dim `R⁺ =` dim `R`.

In `R⁺` the ideal `IR⁺ =` (i), `i = x(σ_0, τ_0)`, and `ρ⁺(σ) = (a(σ) x(σ, τ_0)/i`; `x(σ_0, σ) d(σ)`) is a deformation of some `ρ_{c′}`; reduction `mod 𝔭⁺` and Corollary 2.14 give `c′ = c` up to scalar.

**Checks.**

- The injection is asserted for a domain `R`. The construction adjoins ratios of elements, localizes, completes, and chooses a minimal-prime quotient; it is not asserted to be a finite R-algebra or a finite birational modification. A nonreduced `R` such as `k[η]/(η²)` cannot inject into a domain.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.4, p. 24 (Numdam PDF page 21; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.4, Proposition 2.15, p. 26 (Numdam PDF page 23); the domain hypothesis and construction are on pp. `24–25.`)

*Needs:* §3.11; §3.2.

### 3.13 The Λ_𝒪-algebra structures on deformation rings

Let `L_0` be the maximal abelian pro-p extension of `F` unramified outside `𝒫, I ⊆ Gal(L_0/F)` generated by the images of the `I_i, I_0 ⊆ I` a maximal free ℤ_p-summand (rank `δ_F), G_0 ⊇ I_0` a free summand of rank `δ_F` with generators the images of `γ_1, …, γ_{δ_F} ∈ Gal(F̄/F)` such that `γ_i^{p^{r_i}}` generate `I_0`, and `y^{(i)}_1, …, y^{(i)}_{d_i} ∈ U_i` generating a free summand of rank `d_i`. `Λ_𝒪 = 𝒪[[T_1, …, T_{δ_F}, Y^{(i)}_j]]` acts on `R_𝒟` and `R_{𝒟_Q}` by `T_i ↦` det `ρ_𝒟(γ_i) − 1` and `Y^{(i)}_j ↦ ψ^{(i)}_2(y^{(i)}_j) − 1`, and on `R_{𝒟^ps}` by `T_i ↦` det `ρ^ps(γ_i) − 1` and `Y^{(i)}_j ↦` (trace `ρ^ps(g_iσ^{(i)}_j) − α_i` trace `ρ^ps(σ^{(i)}_j))/(β_i − α_i) − 1`, where `χ(g_i) ≠ 1` and `α_i, β_i` are the roots of `X² −` trace `ρ^ps(g_i)X +` det `ρ^ps(g_i)` with `α_i ≡ χ(g_i)`. These are compatible with `r_𝒟`, with `R_{𝒟′} ↠ R_𝒟` for `Σ ⊆ Σ′, ℳ′ ⊆ ℳ`, and with `R_{𝒟^ps_2} → R_{𝒟^ps_1}` for `Σ_2 ⊇ Σ_1`.

`χ(g_i) ≠ 1` makes the roots distinct and `β_i − α_i` a unit (Hensel). The `γ_i` are taken in the kernel of the residual determinant and of `ω` (in `Gal(F̄/F(χ, μ_p))` for `ρ_c`, as in §2.5); this is possible because that kernel has index prime to `p` and `Gal(L₀/F)` is pro-p, and it is needed for `T_i ↦` det `ρ(γ_i) − 1` to land in the maximal ideal.

With `ρ|_{D_i}` upper triangular with diagonal `(ψ_1χ̃, ψ_2)` and `g_i` eigenvalues `α_i = ψ_1χ̃(g_i), β_i = ψ_2(g_i), trace(g_iσ) − α_i trace(σ) = (β_i − α_i)ψ_2(σ)` for `σ ∈ D_i`, so the two structures agree through `r_𝒟`.

Provide the following operations and compatibility statements.

- `deformationLambdaAlgebra`: The Λ_𝒪-algebra structure on `R_𝒟` and `R_{𝒟_Q}`.
- `pseudoLambdaAlgebra`: The Λ_𝒪-algebra structure on `R_{𝒟^ps}`.
- `pseudoToDeformation_lambda`: `r_𝒟` is Λ_𝒪-linear.
- `lambdaAlgebra_levelChange`: The transition maps are Λ_𝒪-linear.

**Checks.**

- `pseudoLambda_upper_triangular`: For `ρ = (u *`; `0 w`) on `D_i` and `g` with eigenvalues `α` (upper) and `β` (lower): `(tr(gσ) − α tr σ)/(β − α) = w(σ)`.
- `lambdaAlgebra_rank_zero`: If every `r_i = 0`, the `γ_i` themselves generate `I_0`.
- `lambdaAlgebra_residual`: Modulo `m` every `T_i` and `Y^{(i)}_j` maps to 0.
- `lambdaAlgebra_gamma_choice`: If some `γ_i` had `χ(γ_i) ≠ 1`, then det `ρ_𝒟(γ_i) − 1 ≡ χ(γ_i) − 1` would be a unit of `R_𝒟`, and `T_i ↦` det `ρ_𝒟(γ_i) − 1` would not define a continuous 𝒪-algebra map from `𝒪[[T_i]]`.
- The T-variables use `det(γ_i)`; the Y-variables record the selected nearly ordinary quotient character `ψ₂` on local unit generators. Its reduction is 1 but its inertia is variable. An unramified ordinary specialization sends these Y-variables to zero; the Hecke coordinates are those of §2.5.
- Twisting `ρ_c` by a nontrivial p-power finite character ramified at `p` and reducing to 1 is permitted when `ℳ=∅`. Its selected quotient is ramified, so its Y-coordinates need not vanish.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.5, p. 26 (Numdam PDF page 23; printed page `=` PDF page `+ 3).`)

*Needs:* §3.9; PadicFamilies:§5.1; mathlib:MvPowerSeries.

### 3.14 Hida's Galois representation over the nearly ordinary Hecke algebra

Let `F` have even degree and `Q` a prime of `T_∞(U, 𝒪), R = T_∞(U, 𝒪)/Q, L =` Frac `R`. There is a continuous semisimple `ρ_Q` : `Gal(F̄/F) → GL₂(L̄)` with (3.4): (i) `ρ_Q(z_1) = diag(1, −1)`; `(ii) ρ_Q` unramified at `ℓ ∤ 𝔫p`; (iii) trace `ρ_Q(Frob_ℓ) = T(ℓ) mod Q`; `(iv)` det `ρ_Q(Frob_ℓ) = S(ℓ)Nm(ℓ) mod Q`; `(v)` det `ρ_Q(x) = S_xε(x) mod Q` for `x ∈ Z(U)`; (`vi) ρ_Q|_{D_i} ≅ (ψ^{(i)}_1 *`; `0 ψ^{(i)}_2`) with `ψ^{(i)}_2(y) = T_y mod Q` for `y ∈ 𝒪_{F,v_i}^×` and `ψ^{(i)}_2(λ_{𝔭_i}^{(𝔭_i)}) = T_0(𝔭_i) mod Q`. Its pseudo-representation takes values in `R`.

`[F` : `ℚ]` even; `𝔫` the product of the `ℓ` with `U_ℓ ≠ GL₂(𝒪_{F,ℓ})`.

For ordinary `π`, Wiles' `ρ_π` with (3.2) (AutomorphicGaloisRepresentations §§3.11–3.14, 4.10–4.11 and 5.1); for nearly ordinary `π` twist to an ordinary `π ⊗ ψ`; local–global compatibility `π_v ≅ π_v(ρ_π) (3.3)` (AutomorphicGaloisRepresentations §4.12).

`Q` algebraic of weight `2: ρ_Q = ρ_π` for the `π` of any `λ ∈ ℋ(Q)`.

`Q` minimal: glue the `ρ_P` over the dense set `𝒳(Q)` (PadicFamilies §5.9) as in Wiles [W2, Theorem 2.2.1].

`(vi)` for minimal `Q`: the semisimplification of `ρ_Q|_{D_i}` is `ψ_1 ⊕ ψ_2` with `ψ_2(y) = T_y`; if `ψ_1|_{I} ≠ ψ_2|_{I}` choose `τ_0` separating them and the dense `𝒴 ⊆ 𝒳(Q)`; at `P ∈ 𝒵` the conjugated `ρ′_Q` is integral with nonsplit reduction, which forces the sub-character to be `ψ_1`; then `ψ_2(λ) = T_0(𝔭_i)` as in [W2, Lemma 2.2.4].

Nonminimal `Q ⊆ Q′`: reduce the pseudo-representation of `ρ_Q`; `(vi)` by choosing a basis adapted to `ψ_1 ≢ ψ_2 mod Q′`.

Provide the following operations and compatibility statements.

- `hidaGaloisRep`: `ρ_Q` : `Gal(F̄/F) → GL₂(L̄)` for a prime `Q` of `T_∞(U, 𝒪)`.
- `hidaGaloisRep_trace`: trace `ρ_Q(Frob_ℓ) = T(ℓ) mod Q`.
- `hidaGaloisRep_det`: det `ρ_Q(Frob_ℓ) = S(ℓ)Nm(ℓ)`, det `ρ_Q(x) = S_xε(x)`.
- `hidaGaloisRep_nearlyOrdinary`: The shape `(vi)` at each `v_i`.
- `hidaGaloisRep_specialise`: At an algebraic prime of weight 2 it is Wiles' `ρ_π`.

**Checks.**

- `hidaGaloisRep_complex_conj`: `ρ_Q(z_1) = diag(1, −1)`: trace 0, determinant `−1`.
- `hidaGaloisRep_weight_two`: At an algebraic prime of weight 2 with `λ` of `π`, trace `ρ_Q(Frob_ℓ) = λ(T(ℓ))`.
- `hidaGaloisRep_ordinary_line`: The quotient character `ψ_2` is the one with `ψ_2(y) = T_y`; it reduces to 1 modulo a permissible `m`.
- `ρ_Q` is only semisimple over `L̄`; integrality is for its pseudo-representation. Do not assert a representation over `T_∞(U, 𝒪)` or its localisation in the residually reducible case.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 38 (Numdam PDF page 35; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 39 (Numdam PDF page 36; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 40 (Numdam PDF page 37; printed page `=` PDF page `+ 3).`)

*Needs:* AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1; AutomorphicGaloisRepresentations:§§4.4, 4.12, 6.4; PadicFamilies:§5.9; PadicFamilies:§5.7; §3.7; §2.2.

### 3.15 The pseudo-representation into `T_∞(U, 𝒪)_m` and the map `R_{𝒟^ps} → T`

For a maximal ideal `m` of `T_∞(U, 𝒪)`, patching the pseudo-representations of the `ρ_Q` over the minimal primes `Q ⊆ m` gives a pseudo-representation `ρ^mod_m` into `T_∞(U, 𝒪)_m (3.5)`: unramified at `ℓ ∤ 𝔫p`, with trace `ρ^mod_m(Frob_ℓ) = T(ℓ)` and det `ρ^mod_m(Frob_ℓ) = S(ℓ)Nm(ℓ)`. If `m` is permissible, `ρ^mod_m` is a pseudo-deformation of type `𝒟^ps = (𝒪, Σ), Σ` the places with `U_v ≠ GL₂(𝒪_{F,v})` together with `𝒫`, giving `(3.6) R_{𝒟^ps} → T_∞(U, 𝒪)_m`, a map of Λ_𝒪-algebras.

`T_∞(U, 𝒪)` reduced (`it` embeds in a product of fields by Layer 2's comparison).

`T_∞(U, 𝒪)_m ↪ ∏_{Q ⊆ m` minimal} `T_∞/Q` (reduced), and the functions a, `d, x` of the `ρ_Q` land in the image because their values are determined by traces, which lie in `T_∞(U, 𝒪)_m`.

Permissibility makes the residual pseudo-representation `ρ_0 = {1, χ, 0}`.

The Λ_𝒪-structures agree: det `ρ^mod_m(γ_j) = D(γ_j)` and `ψ_2(y) = T_y` (§2.5).

Provide the following operations and compatibility statements.

- `heckePseudoRep`: `ρ^mod_m` into `T_∞(U, 𝒪)_m`.
- `heckePseudoRep_trace`: trace `ρ^mod_m(Frob_ℓ) = T(ℓ)`.
- `pseudoToHecke`: `(3.6) R_{𝒟^ps} → T_∞(U, 𝒪)_m` for permissible `m`.
- `pseudoToHecke_lambda`: (3.6) is Λ_𝒪-linear.

**Checks.**

- `heckePseudoRep_residual`: For permissible `m, ρ^mod_m mod m = {1, χ, 0}`.
- `heckePseudoRep_specialise`: Composing with `T_∞(U, 𝒪)_m → T_∞/Q` gives the pseudo-representation of `ρ_Q`.
- `pseudoToHecke_det`: (3.6) sends det `ρ^ps(Frob_ℓ)` to `S(ℓ)Nm(ℓ)`.
- This is a pseudo-representation, not a representation, into `T_∞(U, 𝒪)_m`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 41 (Numdam PDF page 38; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 41 (Numdam PDF page 38; printed page `=` PDF page `+ 3).`)

*Needs:* §3.14; §3.8; §3.13; §2.3; §2.5.

### 3.16 Permissible ideals are those with residual representation `χ ⊕ 1`

A maximal ideal `m` of `T_∞(U, 𝒪)` satisfies (3.9) (§2.3) `iff m ∩ 𝒪[[G(U)]]` is the ideal of `G(U) → Z(U) --χω^{−1}--> k, T_0(𝔭_i) − 1 ∈ m` for all `i`, and the residual pseudo-representation of `ρ^mod_m` is `χ ⊕ 1`. There is at most one permissible maximal ideal, and modulo it `S(ℓ) ≡ χω^{−1}(Frob_ℓ)` for `ℓ ∤ 𝔫p`.

`p` odd, so 2-dimensional semisimple representations over `k̄` are determined by traces and determinants.

(3.9) gives trace `≡ 1 + χ` on Frobenii; the first condition gives det `≡ χ (S(ℓ)Nm(ℓ) ≡ χω^{−1}(ℓ)ω(ℓ))`; Chebotarev and Brauer–Nesbitt give `ρ̄^ss ≅ χ ⊕ 1`. The converse reads traces off.

Uniqueness: `T_∞(U, 𝒪)_m` is generated over `Λ_𝒪` by `T(ℓ), S(ℓ)` (§3.17), whose residues are now fixed.

**Checks.**

- The residual determinant fixes `S(ℓ)` modulo `m`, in addition to the trace condition of §2.3.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 41 (Numdam PDF page 38; printed page `=` PDF page `+ 3).`)

*Needs:* §3.15; §2.3.

### 3.17 Generation of `T_m` by Hecke operators and surjectivity of `R_{𝒟^ps} → T_m`

Let `m` be a permissible maximal ideal of `T_∞(U, 𝒪)` and `S` a finite set of primes containing those with `U_ℓ ≠ GL₂(𝒪_{F,ℓ})`. Then `T_∞(U, 𝒪)_m` is generated over `Λ_𝒪` by `{T(ℓ), S(ℓ)` : `ℓ ∉ S}` (Lemma 3.11). Hence for `V ⊆ U` the map `T_∞(V, 𝒪)_m → T_∞(U, 𝒪)_m` is surjective (Corollary 3.12) and `(3.6) R_{𝒟^ps} → T_∞(U, 𝒪)_m` is surjective (Corollary 3.13).

`m` permissible.

`T^S` (the Λ_𝒪-subalgebra generated by `T(ℓ), S(ℓ), ℓ ∉ S`) is local complete; by Chebotarev and continuity it contains trace `ρ^mod(σ)` and det `ρ^mod(σ)` for all `σ`.

With `g_i ∈ D_i, χ(g_i) ≠ 1`, and `α_i ≡ 1, β_i` the roots of `X² −` trace `ρ^mod(g_i)X +` det `ρ^mod(g_i)` in `T^S` (Hensel): `T_y = (β_i − α_i)^{−1}(β_i` trace `ρ^mod(σ_y) −` trace `ρ^mod(g_iσ_y)`) and `T_0(𝔭_i) = (β_i − α_i)^{−1}(β_i` trace `ρ^mod(τ_i) −` trace `ρ^mod(g_iτ_i)`) lie in `T^S`; the printed formula omits the inverse, which is restored here.

These identities are checked at each `ρ_Q (Q` minimal) with `(3.4)(vi), T_∞(U, 𝒪)_m` being reduced.

Corollaries: generators of `T_∞(U, 𝒪)_m` come from level `V` and from `R_{𝒟^ps}` (trace and determinant of `ρ^ps`).

**Checks.**

- `β_i − α_i ≡ χ(g_i) − 1` is a unit, so the corrected formula is legitimate in `T^S`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, proof of Lemma 3.11, p. 42 (Numdam PDF page 39; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, Lemma 3.11, p. 41 (Numdam PDF page 38; printed page `=` PDF page `+ 3).`)

*Needs:* §3.15; §3.13.

### 3.18 The level of a minimal prime is controlled by its local type

(Proposition 3.14.) Let `w ∤ p` and `U_w ⊇ {(a b`; `c d`) : `c`, a `− 1 ∈ ℓ_w^s}` for some `s`. Each minimal prime `Q` of `T_∞(U, 𝒪)` descends to a prime at an enlarged level `V` containing `U`, with the following local-level conditions: (i) `V_w ⊇ GL₂(𝒪_{F,w})` if `ρ_Q` is unramified at `w`; `(ii) V ⊇ {c ∈ ℓ_w`, a `mod ℓ_w ∈ Δ_w}` if `ρ_Q` is of type A; (iii) `V ⊇ {a − 1, c ∈ ℓ_w^r}` if of type `B, ℓ_w^r` the conductor of det `ρ_Q|_{I_w}`; `(iv) V ⊇ {a − 1, c ∈ ℓ_w²}` if of type `C`. (Proposition 3.15.) If `ρ_Q|_{I_w} ≅ diag(φ, φ^{−1})` with `φ` of p-power order and `U′ = ∏_{v≠w}U_v × U′_w, U′_w = {c ∈ ℓ_w, ad^{−1} mod ℓ_w ∈ Δ′_w}`, there is a minimal `Q′ ⊆ T_∞(U′, 𝒪)` with `ρ_{Q′} ≅ ρ_Q` and the same inverse image in `T_∞(U ∩ U′, 𝒪)`.

`w ∤ p`; `Δ_w` the Sylow p-subgroup of `(𝒪_F/ℓ_w)^×` and `Δ′_w` a complement.

`ρ_P` for `P ∈ 𝒳(Q)` has the same type as `ρ_Q` at `w` (through the pseudo-representation and irreducibility of `ρ_P`).

By Corollary 3.9 (PadicFamilies Layer 5) it suffices that some `λ ∈ ℋ(P)` factors through level `V`, i.e. `π ∈ Π^{n.o.}_2(V)`.

Local–global compatibility (3.3) and newform theory give a vector at `w` fixed by the required subgroup (Carayol's `π_v ≅ π(σ_v)`, generalised in [W2]).

Proposition `3.15: ρ_P|_{I_w} ≅ diag(φ′, φ′^{−1})` with p-power order; `π_w` is principal series `π(μ_1, μ_2)` and a twisted new vector is U′_w-fixed.

**Checks.**

- The subgroups depend on the type; type `B′` is handled by Proposition 3.15, not 3.14.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 42 (Numdam PDF page 39; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 43 (Numdam PDF page 40; printed page `=` PDF page `+ 3).`)

*Needs:* §3.14; §3.6; PadicFamilies:§5.9; AutomorphicGaloisRepresentations:§§4.4, 4.12, 6.4.

### 3.19 Constraints on inertia characters at auxiliary levels

(Lemma 3.16.) Let `w ∤ p, Q` a minimal prime and `U_w ⊇ {c ∈ ℓ_w^r`, a `mod ℓ_w^r ∈ Δ_w}, r ≥ 1`. (i) If `ρ_Q|_{I_w} ≅ diag(φ_1, φφ_2)` with `φ_1, φ_2` of p-power order and `φ` nontrivial of order prime to `p` with conductor `ℓ_w^r`, then `φ_1` and `φ_2` are trivial. `(ii)` If `ρ_Q|_{D_w} ≅ (εφ *`; `0 φ`) and `(Nm(w) − 1, p) = 1`, then `φ|_{I_w}` has finite order prime to `p`, and `φ|_{I_w} = 1` if `r = 1`.

`w ∤ p`; `r ≥ 1`.

Reduce the characters modulo `P ∈ 𝒳(Q)` (orders are preserved) and compare conductors: (3.3) gives `cond(π_w) = cond(φ_Pφ_{2,P})cond(φ_{1,P})`, while the fixed vector gives `cond(π_w) | ℓ_w^r` and a central character of order prime to `p` on `I_w`.

`(ii) cond(π_w) =` max(ℓ_w, `cond(φ_P)²`) and the central character on `I_w` is `φ_P²`.

**Checks.**

- Used to bound the Galois side at the auxiliary levels of §3.6.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, p. 44 (Numdam PDF page 41; printed page `=` PDF page `+ 3).`)

*Needs:* §3.14; AutomorphicGaloisRepresentations:§§4.4, 4.12, 6.4.

### 3.20 Twisting Hida families by finite characters

(Lemma 3.17.) Let `Q ⊆ 𝔭` be primes of `T_∞(U, 𝒪)` with `Q` minimal, `R ⊆ L̄` a finite integral extension of `T_∞(U, 𝒪)/Q` and `Ψ` : `Gal(F̄/F) → R^×` of finite order. There are primes `Q′ ⊆ 𝔭′` of `T_∞(U ∩ U_1(cond^{(p)}(Ψ)²), 𝒪)` with `Q′` minimal, `ρ_{Q′} ≅ ρ_Q ⊗ Ψ` and `ρ_{𝔭′} ≅ ρ_𝔭 ⊗ Ψ, cond^{(p)}` the prime-to-p conductor.

`Ψ` of finite order.

For each `P` over `𝒳(Q), π ⊗ Ψ_P ∈ Π^{n.o.}_2(V_b)` gives `τ_P` : `T_∞(V, 𝒪) → R/P` with `(3.7): T(ℓ) ↦ T(ℓ)Ψ_P(Frob_ℓ), S(ℓ) ↦ S(ℓ)Ψ_P²(Frob_ℓ), S_x ↦ S_xΨ_P²(x), T_y ↦ T_yΨ_P(y)`, and `T_0(𝔭_i) ↦ T_0(𝔭_i)Ψ_P(λ^{(𝔭_i)}_{𝔭_i})` (the printed formula has the inverse; corrected here).

The product map lands in the diagonal image of `R`, giving `τ` : `T_∞(V, 𝒪) → R` with (3.8); `Q′ =` ker `τ` is minimal by dimension, and `𝔭′` is the kernel through `R/𝔭_1`.

**Checks.**

- Twisting changes the level only at the prime-to-p conductor of `Ψ` (squared).

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.3, Lemma 3.17, p. 45 (Numdam PDF page 42; printed page `=` PDF page `+ 3).`)

*Needs:* §3.14; §2.2.

### 3.21 Characteristic-p primes at auxiliary level come from level `U′`

(Proposition 3.20.) With `w, U′`, U″ as in §2.7 (`no` hypothesis on `U′/(U′ ∩ F^×)`), let `𝔭 ⊆ T_∞(U″, 𝒪)` be a prime with `p ∈ 𝔭`, det `ρ_𝔭 = χ, ρ_𝔭|_{D_v} ≅ (ψ_1 *`; `0 ψ_2`) with `(ψ_1/ψ_2)|_{I_v}` of infinite order for some `v | p`, and `ρ_𝔭` irreducible but not dihedral. Then `𝔭` is the inverse image of a prime of `T_∞(U′, 𝒪)`.

`F` of even degree; `ρ_𝔭` is the representation over the residue field of `𝔭` (§3.14).

Choose `σ ∈ I_v` at the p-place `v` in the infinite-order hypothesis with `ω(σ) = 1`, det `ρ_𝔭(σ) = 1` and `ρ_𝔭(σ)` of infinite order, and (non-dihedral) `τ` with `ω(τ) ≠ 1` and `ρ_𝔭(σ^{n_0}τ)` of infinite order; Chebotarev gives `ℓ ∤ 6` unramified with `Frob_ℓ` close to `σ^{n_0}τ`.

At `V′ = U′ ∩ U(ℓ)`, V″ `=` U″ `∩ U(ℓ)` the action is free `(R18.3)`, so `M_∞(V″)` is free over `Λ′_𝒪[[Δ_w]]` and `M_∞(V″)_{Δ_w} = M_∞(V′)` (§2.7); since `𝔭 ⊇ (δ − 1` : `δ ∈ Δ_w`) in the ring `T` generated by `Δ_w` and `T_∞(V″, 𝒪), T_∞(V″)/𝔭 = T_∞(V′)/im 𝔭`.

The minimal prime `Q ⊆ 𝔭_2` of `T_∞(V′)` is unramified at `ℓ` (types A and `C` are excluded by the choice of `ℓ`), so it comes from `T_∞(U′)` by §3.18.

**Checks.**

- No freeness hypothesis at level `U′` is needed: the auxiliary prime `ℓ` supplies it.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.5, Proposition 3.20, p. 50 (Numdam PDF page 47; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.5, proof of Proposition 3.20, p. 51 (Numdam PDF page 48; printed page `=` PDF page `+ 3).`)

*Needs:* §2.7; §3.14; §3.6; §3.18; HilbertModularVarietiesAndShimuraCurves:§§R18.3.1–R18.3.22; §1.6.

### 3.22 The trace at tame inertia acts through `δ_w + δ_w^{−1}`

(Lemma 3.21, Remark 3.22.) Assume `T_∞(U, 𝒪)` has a permissible maximal ideal `m` and `χ(Frob_w) = 1 = ω(Frob_w)`. Let `σ_w ∈ I_w` generate the p-part of tame inertia, identified with an element of `𝒪_{F,w}^×` by local reciprocity; `δ_w = (σ_w 0`; 0 1) generates `Δ_w` through (3.12). Then trace `ρ^mod(σ_w) ∈ T_∞(U″, 𝒪)_m` acts on `M_∞(U″)_m` as `δ_w + δ_w^{−1}`; so `δ_w + δ_w^{−1}` lies in `T_∞(U″, 𝒪)_m`, compatibly with change of `U`.

`χ(Frob_w) = 1 = ω(Frob_w)`.

On a T_∞(U″)-eigenspace `V ⊆ eH⁰(X(U″_a), 𝒪)_m ⊗ Q̄_p, π_w` is not supercuspidal (that would force type `C` and `χ(Frob_w) = −1`).

If `π_w` is special, `μ_1` is unramified and `δ_w` acts by 1; if principal series `π(μ_1, μ_2)` with `μ_1μ_2` unramified, `δ_w` acts by `μ_1(σ_w)` or `μ_1^{−1}(σ_w)`.

By (`3.3), ρ_P(σ_w) = (μ_1(σ_w) *`; `0 μ_1^{−1}(σ_w)`), so trace `ρ_P(σ_w) = δ_w + δ_w^{−1}` on `V`.

**Checks.**

- The identity is on `M_∞(U″)_m`, where both `T_∞(U″)_m` and `Δ_w` act.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.5, Lemma 3.21, p. 51 (Numdam PDF page 48; printed page `=` PDF page `+ 3).`)

*Needs:* §2.7; §3.15; GL2AutomorphicRepresentationsAndTransfer:§§R17.3.1–R17.3.9; AutomorphicGaloisRepresentations:§§4.4, 4.12, 6.4.

### 3.23 The Hecke rings `T_{𝒟_Q}, T^min_{𝒟_Q}` and modules `M_{𝒟_Q}`

Assume `L_p(F, −1, χω)` is integral but not a unit, so permissible ideals exist (§2.4). For an augmented datum `𝒟_Q = (𝒪, Σ, c, ℳ)_Q` with `r(w)` given by `ℓ_w^{r(w)} ∥ cond(χ_w^{−1})`, put `U_{𝒟_Q} = ∏_w U_{𝒟_Q,w}` with `U_{𝒟_Q,w} = GL₂(𝒪_{F,w})` for `w ∉ (Σ∖𝒫) ∪ Q`; `{c, a − 1 ∈ ℓ_w^{max(2, r(w)+1)}}` for `w ∈ Σ∖(𝒫 ∪ ℳ)`; `{c ∈ ℓ_w^{max(1, r(w))}, a mod ℓ_w^{max(1, r(w))} ∈ Δ_w}` for `w ∈ ℳ`; `{c ∈ ℓ_w, ad^{−1} mod ℓ_w ∈ Δ′_w}` for `w ∈ Q`. Then `T_{𝒟_Q} = T_∞(U_{𝒟_Q}, 𝒪)_m` with the pseudo-deformation `ρ^mod_{𝒟_Q}` of type `𝒟^ps_Q` and surjections `π_𝒟` : `R_{𝒟^ps} ↠ T_𝒟, π_{𝒟_Q}` : `R_{𝒟^ps_Q} ↠ T_{𝒟_Q}`; `T^min_{𝒟_Q} = T_{𝒟_Q}/∩_{q ∈ ℳ^min(𝒟_Q)} q`, where `ℳ^min(𝒟_Q)` (nonempty) is the set of minimal primes `q` with `(χ̃^{−1}det ρ_q)|_{N_Σ}` trivial; `M_{𝒟_Q} = M_∞(U^min_{𝒟_Q})_m` for the level `U^min_{𝒟_Q}` of Skinner–Wiles p. 55; `π^min_𝒟` : `R_{𝒟^ps} → T^min_𝒟`.

`F` of even degree; `L_p(F, −1, χω)` integral and not a unit.

`ρ^mod_{𝒟_Q}` is of type `𝒟^ps_Q` because of the level at `Q` (det unramified there) and `Σ`.

`ℳ^min ≠ ∅`: write det `ρ^mod = Θ·Ψ·χ̃` with `Ψ` trivial on `N_𝒟` and `Θ` trivial on the free part `M_𝒟`, choose `Φ² = Θ`, and use Lemma 3.17 to twist any `q` to `q_Φ` with `ρ_{q_Φ} ≅ ρ_q ⊗ Φ^{−1}`, which is minimal.

Provide the following operations and compatibility statements.

- `deformationLevel`: `U_{𝒟_Q} ⊆ GL₂(𝒪_F ⊗ Ẑ)`.
- `deformationHeckeRing`: `T_{𝒟_Q} = T_∞(U_{𝒟_Q}, 𝒪)_m`.
- `pseudoToDeformationHecke`: `π_{𝒟_Q}` : `R_{𝒟^ps_Q} ↠ T_{𝒟_Q}`.
- `minimalHeckeRing`: `T^min_{𝒟_Q}`.
- `minimalPrimes_nonempty`: `ℳ^min(𝒟_Q) ≠ ∅`.
- `deformationHeckeModule`: `M_{𝒟_Q} = M_∞(U^min_{𝒟_Q})_m`.

**Checks.**

- `deformationLevel_unramified`: For `w ∉ (Σ∖𝒫) ∪ Q` the level is maximal, so `T(ℓ_w)` and `S(ℓ_w)` are available.
- `deformationLevel_Q`: At `w ∈ Q` the level is `U″_w` of Lemma 3.19, so `Δ_w` acts on `M_{𝒟_Q}`.
- `minimalHeckeRing_twist`: Twisting by `Φ` with `Φ² = Θ` moves any minimal prime into `ℳ^min`.
- `χ̃^{−1}det ρ_q` (not det `ρ_q`) is the character restricted to `N_Σ`.
- The levels depend on the datum through `r(w), Q` and `ℳ`; `M_{𝒟_Q}` uses the auxiliary level `U^min`, not `U_{𝒟_Q}`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.6, p. 52 (Numdam PDF page 49; printed page `=` PDF page `+ 3).`)

*Needs:* §2.4; §3.15; §3.17; §3.20; §3.2.

### 3.24 `T_{𝒟_Q} ≅ T^min_{𝒟_Q} ⊗ 𝒪[N_𝒟]`

(Proposition 3.23, Corollary 3.24, Lemma 3.25.) The splitting field `L_Θ` of `Θ` has `Gal(L_Θ/F) ≅ N_𝒟`. Write `[n]` for the group-algebra basis element and `Φ²=Θ`. Specify the algebra isomorphism `α:T^min_{𝒟_Q}⊗_𝒪𝒪[N_𝒟] ≅ T_{𝒟_Q}` on its two factors by `α(1⊗[n])=Φ(n)`, `α(T(ℓ)⊗1)=T(ℓ)Φ(Frob_ℓ)⁻¹` and `α(S(ℓ)⊗1)=S(ℓ)Θ(Frob_ℓ)⁻¹`. Thus the mixed images are `T(ℓ)Φ(Frob_ℓ)⁻¹Φ(n)` and `S(ℓ)Θ(Frob_ℓ)⁻¹Φ(n)` respectively. The group factor has the same image in both formulas. Hence `T^min_{𝒟_Q}` is a finite, torsion-free Λ_𝒪-algebra, and `δ_w+δ_w⁻¹∈T^min_{𝒟_Q}` maps to `δ_w+δ_w⁻¹∈T_{𝒟_Q}`.

`Gal(L_Θ/F) ≅ N_𝒟`: for a character `ξ` of `N_𝒟`, Lemma 3.17 gives `P_ξ` with `ρ_{P_ξ} ≅ ρ_P ⊗ ξ`, so `ξ² = Θ mod P_ξ`; as `ξ²` ranges over all characters (odd order), `Θ|_{N_𝒟}` is injective.

For `q∈ℳ^min` and `ξ∈X(𝒟)`, Lemma 3.17 gives `τ(q,ξ):T_{𝒟_Q}→R(q,ξ)`, with trace and central eigenvalues multiplied by `ξ(Frob_ℓ)` and `ξ(Frob_ℓ)²`. Define `φ(q,ξ)(t⊗[n])=(t mod q)ξ(n)`. Then `τ(q,ξ)∘α=φ(q,ξ)`, and `ℳ′={q_ξ}=ℳ(𝒟_Q)`.

`τ = ∏τ(q, ξ)` and `φ = ∏φ(q, ξ)` have the same image, which gives the isomorphism.

Use the diagonal weight action on the tensor product: if `ḡ` is the `N_𝒟`-component of the image of `g` in `Gal(L_𝒟/F)`, the determinant coordinate is `detρ^min(g)⊗[ḡ]²` and the selected quotient coordinate is `ψ₂^min(u)⊗[ū]`. These map to `detρ(g)` and `ψ₂(u)` under `α`, so the isomorphism respects `Λ_𝒪`. This specifies the weight action even when a local unit has nontrivial torsion component.

**Checks.**

- At `n=1` the trace twist is `Φ(Frob_ℓ)⁻¹` and the central twist is its square. At `N_𝒟=1` both twists and the group factor are trivial.
- Choose a good `ℓ` with `χ(Frob_ℓ)=1`. The trace has residue 2 and is a unit since `p` is odd; the central operator is a unit too. Cancelling either in the mixed-tensor rule recovers the same value `α(1⊗[n])=Φ(n)`.
- Under a character `ξ`, the two corrected mixed images specialize to `(T(ℓ) mod q)ξ(n)` and `(S(ℓ) mod q)ξ(n)`. Both cancellations hold for arbitrary unit character values.
- A quotient coordinate twists by `[ū]` while the determinant twists by `[ḡ]²`; replacing the former by its square would change the chosen ordinary quotient.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.6, p. 54 (Numdam PDF page 51; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.6, Proposition 3.23, p. 55 (Numdam PDF page 52; printed page `=` PDF page `+ 3).`)

*Needs:* §3.23; §3.20; §3.22; §2.6.

### 3.25 No level raising at a non-Eisenstein auxiliary prime

(Lemma 3.29.) Let `(𝔫, p) = 1, 𝔭 ⊆ T_∞(U, 𝒪)` a prime with `p ∈ 𝔭, ρ_𝔭` irreducible and not dihedral, contained in a permissible `m`; let `ℓ ∤ 𝔫p` with `p ∤ Nm(ℓ) − 1` and the ratio of the eigenvalues of `ρ_𝔭(Frob_ℓ)` not `Nm(ℓ)^{±1}`; `U^{(0)} = U ∩ U_0(ℓ), U^{(1)} = U ∩ U_1(ℓ)`. Then (i) `T_∞(U^{(1)}, 𝒪)_𝔭 ≅ T_∞(U^{(0)}, 𝒪)_𝔭 ≅ T_∞(U, 𝒪)_𝔭`; `(ii) M̂_∞(U^{(1)})_𝔭 ≅ M̂_∞(U^{(0)})_𝔭 ≅ M̂_∞(U)_𝔭²` and `M̂⁺_∞(U^{(1)})_𝔭 ≅ M̂⁺_∞(U^{(0)})_𝔭 ≅ M̂⁺_∞(U)_𝔭²` as `T̂_∞(U^{(1)}`, 𝒪)_𝔭-modules.

The three conditions on `ℓ`; `ρ_𝔭` irreducible and not dihedral.

(i): the surjections of Corollary 3.12 are isomorphisms after localisation because every minimal prime of `T_∞(U^{(1)})_m` in `𝔭` has `ρ_Q` unramified at `ℓ` (the eigenvalue condition), hence comes from level `U` (Proposition 3.14).

`(ii)`: with `ξ =` lim `ξ_a` : `M⁺_∞(U)² → M⁺_∞(U^{(1)})` and `I = ker(T_∞(U^{(0)}) → T_∞(U))`, Jacquet–Langlands and newform theory give `eH⁰(X(U_a), K)[I_a] = im(ξ_a ⊗ K) (3.21)`; the snake lemma embeds the cokernel `C` into a quotient of lim `ker(ξ_a ⊗ K/𝒪)`.

Lemma 3.26 and Chebotarev over the ray class fields `F_a` make trace `ρ_m(σ) − 1 − ε(σ)` kill `C_m` for `σ ∈ Gal(F′/F_∞)`; if `C_𝔭 ≠ 0, ρ_𝔭` would be reducible or dihedral. So `M⁺_∞(U)²_𝔭 ≅ M⁺_∞(U^{(0)})[I]_𝔭 (3.20)`, whence (3.22), and `M⁺_∞(U^{(0)}) = M⁺_∞(U^{(1)})[S(ℓ) − 1]` gives (3.23).

**Checks.**

- The hypothesis on `ρ_𝔭(Frob_ℓ)` is what prevents level raising at `ℓ`; without it `T_∞(U^{(0)})_𝔭` can be larger.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.8, Lemma 3.29, p. 59 (Numdam PDF page 56; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.8, proof of Lemma 3.29, p. 61 (Numdam PDF page 58; printed page `=` PDF page `+ 3).`)

*Needs:* §2.9; §3.18; §3.17; GL2AutomorphicRepresentationsAndTransfer:§§R17.3.1–R17.3.9.

### 3.26 Arithmetic control at a permissible Eisenstein localization

Let `F` have even degree, `p` odd, `χ` totally odd with `χ|D_v ≠ 1` at all v|p, and `m` a permissible maximal ideal at the specified tame level. For an arithmetic character `λ` of `T_∞(U,𝒪)_m` whose central character is `ψε^μ, μ ≥ 0`, and whose torus character at `p` has finite order, Hida control identifies its Hecke eigensystem with a nearly ordinary cuspidal newform of parallel weight `(μ+2)t`, with the prescribed tame characters and v-good lines. The family’s Galois pseudo-representation specializes to that newform’s trace and determinant. The local algebra is finite and torsion-free over `Λ_𝒪`; with the fixed-point-free stabilizer hypothesis the two ordinary modules are finite free of equal rank. This supplies the permissible Eisenstein localization, not a claim that its Λ-adic Hecke algebra is flat. The finite classical weight Hecke algebra is finite flat over the coefficient DVR as in §2.2.

Use the exact permissible character and tame level of §2.3 and §2.4. Freeness of the modules requires the fixed-point-free action at the level in question; small stabilizer denominators cannot be ignored.

Localize the imported Hida control theorem at `m` and evaluate at the specified arithmetic character.

Use the v-good-line Hecke comparison to identify the newform and all unramified Hecke eigenvalues.

Specialize the pseudo-representation using its Frobenius trace/determinant formulas, and apply §2.6 for the integral module and algebra statements.

**Checks.**

- The distinguishedness is `χ|D_v ≠ 1`, not a claim that the residual characters differ on inertia.
- Keep finite classical flatness, Λ-torsion-freeness of the algebra and Λ-freeness of the modules distinct.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §3.2, Proposition 3.7 and Corollary 3.9, pp. 37–38; §3.3, Lemma 3.10 and `(3.4)–(3.6)`, pp. 39–41.)

*Needs:* §2.6; §2.2; §3.15; PadicFamilies:§5.8.

### 3.27 Dimension of the reducible and diagonal loci

(Lemmas `2.7–2.9.`) With R^red_𝒟 `= R_𝒟/I (I` generated by the lower-left entries `c_σ` in a basis with `ρ_𝒟(z_1) = diag(1, −1)`) the universal reducible deformation ring: dim R^red_𝒟 `≤ 1 + 2δ_F + dim_k H_Σ(F, k)`; if `q ⊆ R_𝒟` contains `p, ρ_𝒟 mod q` is reducible and its determinant has finite order, then dim `R_𝒟/q ≤ δ_F + dim_k H_Σ(F, k)`. For the universal diagonal deformation (`φ_1 0`; `0 φ_2`) of `1 ⊕ χ` of type `(𝒪, Σ)`, dim `R^diag ≤ 1 + 2δ_F`, and `≤ δ_F` modulo a prime containing `p` with det of finite order.

Write `G = Gal(L(Σ)(χ)/F) ≅ Δ × Γ × ℤ_p^{δ_F} (Γ` a finite p-group) and `A = ℤ_p[[G]]`; reducible deformations factor through the maximal abelian pro-p extension `M` of `L(Σ)(χ)` unramified outside `Σ∖𝒫` on which `Δ` acts through `χ^{−1}`.

`H = Gal(M/L(Σ)(χ))` is an A-module generated by `m = dim_k H_Σ(F, k)` elements; a presentation `𝔞 → ⊕Ae_i ↠ H` with `e_m ↦` an element with `ρ_c = (1 u`; `0 1), u ≠ 0`, gives the explicit universal reducible deformation over `B ⊗̂ A_2` (Skinner–Wiles p. 17), from which the dimension bounds are read.

**Checks.**

- These bounds are what make the reducible locus of small codimension after the base changes of §4.6.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.2, p. 15 (Numdam PDF page 12; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §2.2, Lemmas 2.7–2.9, p. 17 (Numdam PDF page 14; printed page `=` PDF page `+ 3).`)

*Needs:* §3.2; §3.4; PadicFamilies:§5.1.

### 3.28 Deformation data for an absolutely irreducible nearly ordinary `ρ₀`

Let `F` be totally real of degree `d, p` odd, `v_1, …, v_t` the places above `p` with decomposition groups `D_i`, and `k` finite of characteristic p. A residual representation `ρ₀` : `Gal(F̄/F) → GL₂(k)` satisfies (2.1) if (i) `ρ₀` is absolutely irreducible; `(ii)` det `ρ₀(z_i) = −1` for every complex conjugation `z_i`; (iii) `ρ₀|_{D_i} ≅ (χ^{(i)}_1 *`; `0 χ^{(i)}_2`) with `χ^{(i)}_1 ≠ χ^{(i)}_2` for every `i` (the extension may be nonsplit; when it splits a labelling is fixed); `(iv)` if `ρ₀` is ramified at `v ∤ p∞` then `ρ₀|_{D_v} ≅ (1 *`; `0 ω^{−1}`). A deformation datum is `𝒟 = (𝒪, Σ, ℳ): 𝒪` the integers of a local field with residue field `k, Σ` a finite set of finite places containing `𝒫 = {v_1, …, v_t}` and the places where `ρ₀` ramifies, and `ℳ ⊆ Σ ∖ 𝒫` a set of places where `ρ₀` ramifies; `Σ₀ = 𝒫 ∪` {ramified places}, `ℳ₀ = Σ₀ ∖ 𝒫` and `𝒟₀ = (𝒪, Σ₀, ℳ₀)` is the minimal datum. A deformation `ρ` : `Gal(F̄/F) → GL₂(A)` is of type `𝒟` if A is an 𝒪-algebra, `ρ` is unramified outside `Σ` and `∞, ρ|_{D_i} ≅ (ψ^{(i)}_1 *`; `0 ψ^{(i)}_2`) with `ψ^{(i)}_1 ≡ χ^{(i)}_1 mod m_A`, and `ρ|_{I_w} ≅ (1 *`; 0 1) for `w ∈ ℳ`. The universal deformation of type `𝒟` is `ρ_𝒟` : `Gal(F_Σ/F) → GL₂(R_𝒟)`. For `Q` disjoint from `Σ`, type `𝒟_Q` allows ramification at `Q` with det `ρ` unramified there, giving `R_{𝒟_Q}`; 𝒟_Q-minimality (det `ρ` trivial on the torsion `N_Σ` of `Gal(L_Σ/F)`) gives `R^min_{𝒟_Q}`, and `(2.2) R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗_𝒪 𝒪[N_Σ], ρ_{𝒟_Q} ≅ ρ^min_{𝒟_Q} ⊗ Ψ_Σ`. For `Σ ⊆ Σ′` and `ℳ′ ⊆ ℳ` the natural map `R_{𝒟′} ↠ R_𝒟` is a map of Λ_𝒪-algebras (the Λ_𝒪-structure of §3.13, with `T_i ↦` det `ρ_𝒟(γ_i) − 1` and `Y^{(i)}_j ↦ ψ^{(i)}_2(y^{(i)}_j) − 1`).

`p` odd; `ω` is the mod-p cyclotomic character, unramified at `v ∤ p`, so `(iv)` gives `ρ₀|_{I_v} ≅ (1 *`; 0 1) and the ℳ-condition lifts it. Unlike §3.1 there is no extension class `c` and no residual `χ ⊕ 1: ρ₀` is fixed and absolutely irreducible, and `ρ₀|_{D_i}` may be nonsplit.

Absolute irreducibility makes the deformation functor pro-representable (Mazur; LocalGaloisDeformationRings §§F.2.2, `F.2.5`).

The type-𝒟 conditions are deformation conditions: the nearly ordinary condition at `v_i` is the ordered-flag condition with the `χ^{(i)}_1`-line as sub (§3.39, using LocalGaloisDeformationRings Layers `6–8`), and `ρ|_{I_w} ≅ (1 *; 0 1)` is stable under fibre products.

Type `𝒟_Q` and minimality exactly as in Skinner–Wiles 1999 §2.3 (§3.2): `N_Σ` is a finite p-group and `p` is odd, so `ρ^min ⊗ Ψ_Σ` is universal for type `𝒟_Q`.

Provide the following operations and compatibility statements.

- `IrreducibleResidual`: `ρ₀` with the conditions `(2.1)(i)–(iv)` and the labelling `χ^{(i)}_1, χ^{(i)}_2`.
- `IrreducibleDatum`: `𝒟 = (𝒪, Σ, ℳ)`, with `𝒟₀ = (𝒪, Σ₀, ℳ₀)`.
- `IsOfIrreducibleType`: The conditions of type `𝒟` (and `𝒟_Q`) on a lift.
- `irreducibleUniversalRing`: `R_𝒟` with `ρ_𝒟`.
- `irreducibleUniversalRing_represents`: `R_𝒟` pro-represents deformations of type `𝒟`.
- `irreducibleUniversalRing_min`: `(2.2): R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗_𝒪 𝒪[N_Σ]`.

**Checks.**

- `isOfIrreducibleType_residual`: `ρ₀` over `k` is of type `𝒟`.
- `isOfIrreducibleType_wrong_sub`: If `ρ₀|_{D_i}` is nonsplit, its only stable line is the `χ^{(i)}_1`-line, so no lift has a `D_i`-stable line reducing to the `χ^{(i)}_2`-line. If `ρ₀|_{D_i}` is split, a lift over `k[η]/(η²)` of the form `(χ̃^{(i)}_2 ηb; 0 χ̃^{(i)}_1)`, with `b` giving a nonzero class in `H¹(D_i, k(χ^{(i)}_2/χ^{(i)}_1))`, has only the `χ^{(i)}_2`-line stable and is not of type `𝒟`.
- `irreducibleUniversalRing_shrink`: For `Σ ⊆ Σ′` and `ℳ′ ⊆ ℳ` the map `R_{𝒟′} ↠ R_𝒟` is surjective and Λ_𝒪-linear.
- `irreducibleResidual_dihedral_allowed`: An induced `ρ₀ = Ind_{F′}^F ψ₀` satisfying (2.1) is allowed: (2.1) does not exclude dihedral `ρ₀`.
- Check that `ρ₀` itself is of type `𝒟` for every `𝒟` (the closed point of `R_𝒟`).
- Reuse §3.2's minimal-twist construction; only the residual data change.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, (2.1) and the definition of deformation data, p. 188 (Numdam PDF page 5; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, p. 189 (Numdam PDF page 6; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, (2.2), p. 190 (Numdam PDF page 7; printed page `=` PDF page `+ 183).`)

*Needs:* §3.2; §3.13; LocalGaloisDeformationRings:§F.2.5; LocalGaloisDeformationRings:Layers 6–8; §3.39.

### 3.29 The presentation of `R_𝒟` for irreducible `ρ₀` (Proposition 2.1)

(Proposition 2.1.) For every deformation datum `𝒟 = (𝒪, Σ, ℳ)` relative to `F` and `ρ₀` there are integers `g` and `r` with `R_𝒟 ≅ 𝒪[[x_1, …, x_g]]/(f_1, …, f_r)` and `g − r ≥ d + δ_F −` 2t `− 3·#ℳ`, where `δ_F` is the ℤ_p-rank of the Galois group of the maximal abelian pro-p extension of `F` unramified away from the places above `p` (Skinner–Wiles 2001 omit "unramified away from p"; with it `δ_F` is the `δ_F` of Skinner–Wiles 1999 Proposition 2.4).

The bound is the irreducible-residual analogue of §3.4. The local nearly ordinary residual representation may be nonsplit; require the nonsplit versal local ring and its dimension from §3.39, using LocalGaloisDeformationRings Layers 6–8, rather than substituting the split calculation.

Skinner–Wiles omit the proof as essentially that of their 1999 Proposition 2.4: Mazur's presentation bounds `g` and `r` by `h¹` and `h²` of `ad ρ₀` with the local conditions, and the global Euler characteristic of the odd `ρ₀` (ArithmeticGaloisDuality §R02.4.4) gives the bound.

The only change is the universal nearly ordinary ring of `ρ₀|_{D_i}` when it is nonsplit (§3.39, using LocalGaloisDeformationRings Layers `6–8`), whose relative dimension enters as in the split case.

**Checks.**

- Compare with §3.4: the same numerical bound, with the residual data of §3.28.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, Proposition 2.1, p. 189 (Numdam PDF page 6; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, Proposition 2.1, p. 189 (Numdam PDF page 6; printed page `=` PDF page `+ 183).`)

*Needs:* §3.28; §3.4; LocalGaloisDeformationRings:Layers 6–8; §3.39; GlobalGaloisDeformations:§§3.4–3.8; ArithmeticGaloisDuality:§R02.4.4.

### 3.30 Dihedral deformations and the dimension of the dihedral locus (Lemma 2.2)

A deformation `ρ` of `ρ₀` is dihedral if `ρ|_{Gal(F̄/F′)}` factors through an abelian quotient for some quadratic `F′/F`; equivalently for some abelian `L/F (2.3)(i)`, and only if `ρ₀` is dihedral `(2.3)(ii)`, with a chosen inducing field `F′`. The inducing field is unique if the projective dihedral image has order at least 6; a projective Klein four image has three choices (ArithmeticGaloisRepresentations §4.6). Fix one such `F′` and `ρ₀=Ind_{F′}^F ψ₀`, with `ψ₀≠ψ₀′`. Deformations induced through this field are `Ind_{F′}^F Ψ` with `Ψ≡ψ₀`. The full dihedral locus is the finite union over all residual inducing fields, and the dimension estimate is applied to each constituent. With `Γ_Σ = Gal(L′_Σ/F′) (L′_Σ` the maximal abelian pro-p extension of `F′` unramified outside `Σ), ψ` the projection onto `Γ_Σ` and `Ψ_Σ = ψ̃₀ψ` : `Gal(F_Σ/F′) → 𝒪[[Γ_Σ]]^×, Ind_{F′}^F Ψ_Σ` is the universal dihedral deformation of type `(𝒪, Σ, ℳ)` when every place above `p` splits in `F′` and `ℳ = ∅`, and surjects onto it otherwise. Let `δ⁻_{F′}` be the ℤ_p-rank of the summand of `Γ_Σ` on which `Gal(F′/F)` acts by `−1`. (Lemma 2.2, first inequality.) If `q ⊆ R_𝒟` contains `p` and `ρ_𝒟 mod q` is induced through this `F′` with finite-order determinant, then `dim(R_𝒟/q)≤δ⁻_{F′}`. For the union over inducing fields take the maximum of these bounds. (Second inequality.) If `F′` is totally real, `δ⁻_{F′} ≤ d/2`. If `F′` is CM, `δ⁻_{F′} = d`, and the bound dim `R_𝒟/q ≤ d/2` printed in Lemma 2.2 fails when every place above `p` splits in `F′` and `ℳ = ∅`.

The unit-rank input is Waldschmidt’s p-adic rank theorem, as cited by SW99 [Wal], in the relative minus-unit form of §3.38. The universal `d/2` assertion requires the inducing quadratic field to be totally real. For `F′` totally real the minus part of the units of `F′` has ℤ-rank `d`, and Waldschmidt's bound (p-adic rank at least half the rank) gives `δ⁻_{F′} ≤ d/2`. For `F′` CM the minus part of the units is finite, while the minus part of the local units at the places above `p` has ℤ_p-rank `d`, so `δ⁻_{F′} = d`.

A dihedral `ρ` over a domain `A` of characteristic `p` with det `ρ` of finite order is Ind `Ψ` with `ΨΨ′` of finite order, so `Ψ = ψ̃₀·ψ⁻` with `ψ⁻` factoring (`up` to a finite group) through the minus part of `Γ_Σ`.

`R_𝒟/q` is topologically generated by traces (§3.31), which lie in the image of `k′[[Γ_Σ⁻]]`; hence dim `R_𝒟/q ≤ δ⁻_{F′}`.

Class field theory: rank `Γ_Σ = [F′` : `ℚ] −` (p-adic rank of the units of `F′) (up` to the Leopoldt defect of `F` on the plus side); split into ± parts under `Gal(F′/F)`.

Counterexample to the printed `d/2` for CM `F′`, all `v | p` split, `ℳ = ∅: Ind(ψ̃₀ψ⁻)` over `k[[Γ_Σ⁻]]` is of type `𝒟` (nearly ordinary at each split `v_i` as `Ψ|_{D_w} ⊕ Ψ|_{D_w̄}`), has finite-order determinant, and its trace ring has dimension `d`.

**Checks.**

- The matrices `diag(1,−1)` and `[[0,1],[1,0]]` generate the irreducible dihedral group of order 8 in odd characteristic; its projective image is Klein four and has three index-two inducing subgroups. A single chosen field does not cover all constituents.
- The totally real case is the one Skinner–Wiles' citation covers; do not use the `d/2` bound for CM `F′`.
- For an induced representation with two distinct inducing characters, restriction to the inducing quadratic field is a sum of characters; a representation whose restriction remains absolutely irreducible cannot be dihedral through that field.
- Check the CM rank count on a small case: `F = ℚ, F′` imaginary quadratic, `δ⁻ = 1 > 1/2`.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, `(2.3)–(2.4)`, p. 190 (Numdam PDF page 7; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, before Lemma 2.2, p. 191 (Numdam PDF page 8; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, Lemma 2.2, p. 191 (Numdam PDF page 8; printed page `=` PDF page `+ 183).`)

*Needs:* §3.28; §3.31; §3.38; ArithmeticGaloisRepresentations:§4.6.

### 3.31 `R_{𝒟_Q}` is generated over `Λ_𝒪` by traces of Frobenius (Lemma 2.3)

(Lemma 2.3.) If `𝒟_Q = (𝒪, Σ, ℳ)_Q` is any augmented deformation datum and `S` is any finite set of places containing `Σ ∪ Q`, then `R_{𝒟_Q}` is generated as a Λ_𝒪-algebra by `{trace ρ_{𝒟_Q}(Frob_ℓ)` : `ℓ ∉ S}`.

`ρ₀` absolutely irreducible `(2.1)(i)`.

Carayol: for absolutely irreducible `ρ₀` the universal deformation is defined over the closed subring generated by its traces (LocalGaloisDeformationRings §F.2.7 and IntegralHeckeAndGaloisDeterminants Layer 1), so the universal property forces `R_{𝒟_Q}` to be that subring.

Chebotarev: the Frobenius elements at `ℓ ∉ S` are dense, so their traces generate the trace ring topologically; the Λ_𝒪-structure only adds the variables `T_i` and `Y^{(i)}_j`.

**Checks.**

- This is the irreducible-residual replacement for the pseudo-representation arguments of §3.5; no pseudo-deformation ring is needed.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, Lemma 2.3, p. 192 (Numdam PDF page 9; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §2, end, p. 191 (Numdam PDF page 8; printed page `=` PDF page `+ 183).`)

*Needs:* §3.28; LocalGaloisDeformationRings:§F.2.7.

### 3.32 The Galois representation over `T_∞(U, 𝒪)_m` for irreducible `ρ_m`

Assume (H_even): `[F` : `ℚ]` is even. For a maximal ideal `m` of `T_∞(U, 𝒪)` (§1.3) there is `ρ_{U,m}` : `Gal(F̄/F) → GL₂(T_∞(U, 𝒪)_m ⊗_{Λ′_𝒪} F_{Λ′_𝒪})` satisfying the properties (3.2) of §3.14 without 'mod Q'. If the residual representation `ρ_m` is irreducible, then in a suitable basis `ρ_{U,m}` takes values in `GL₂(T_∞(U, 𝒪)_m)`, and `T_∞(U, 𝒪)_m` is a Λ_𝒪-algebra through `1 + T_i ↦` det `ρ_{U,m}(γ_i)` and `1 + Y^{(i)}_j ↦ T_{y^{(i)}_j}`, with `Λ_𝒪` finite and free over `Λ′_𝒪`. (Lemma 3.3.) (i) For any finite `S ⊇ Σ(U)` (the places `w` with `U_w ≠ GL₂(𝒪_{F,w})`, together with `𝒫), T_∞(U, 𝒪)_m` is generated over `Λ_𝒪` by `{T(ℓ)` : `ℓ ∉ S}`; `(ii)` if `U` is sufficiently small, `M_∞(U)_m` and `M⁺_∞(U)_m` are free Λ_𝒪-modules of equal rank.

(H_even) is needed for the definite quaternionic modules of Layer 1. `U` sufficiently small means `U ⊆ U₁(ℓ_1 ⋯ ℓ_s)` for unramified primes as in Skinner–Wiles 1999 Corollary 3.6.

Glue the `ρ_Q` of §3.14 over the minimal primes `Q` of `T_∞(U, 𝒪)_m` to a representation over the total ring of fractions.

If `ρ_m` is irreducible, the traces lie in `T_∞(U, 𝒪)_m` and Carayol's theorem (Wiles 1995, pp. 482–483; LocalGaloisDeformationRings §F.2.7 and IntegralHeckeAndGaloisDeterminants Layer 1) gives an integral model.

Lemma `3.3(i)` as Skinner–Wiles 1999 Lemma 3.11 (§3.17), with traces in place of the pseudo-representation; `(ii)` from (i) and PadicFamilies Layer 5/hida-freeness.

For a fixed-weight local quotient `T` that is finite flat over `𝒪`, with the specified residue field and Frobenius traces topologically generating `T` over `𝒪`, realize GlobalGaloisDeformations Layer R04.6 §6.7's `HeckeGaloisDatum` using the specialized representation. Its arithmetic coordinates are `t_ℓ=T(ℓ)` and `s_ℓ=S(ℓ)`, so the constant coefficient is `Nm(ℓ)S(ℓ)`. For reduced such `T`, §6.8's `ofPoints` construction applies when the algebraic DVR points are jointly injective and carry the matching residual identifications. The big algebra above is only finite torsion-free over weight space; its integral model uses the supplied Carayol theorem directly.

Provide the following operations and compatibility statements.

- `heckeGaloisRep`: `ρ_{U,m}` over `T_∞(U, 𝒪)_m` when `ρ_m` is irreducible.
- `heckeGaloisRep_trace`: trace `ρ_{U,m}(Frob_ℓ) = T(ℓ)` for `ℓ ∤ 𝔫p`.
- `heckeGaloisRep_det`: det `ρ_{U,m}(Frob_ℓ) = S(ℓ)Nm(ℓ)` and det `ρ_{U,m}(x) = S_xε(x)` for `x ∈ Z(U)`.
- `heckeGaloisRep_ordinary`: `ρ_{U,m}|_{D_i} ≅ (ψ^{(i)}_1 *`; `0 ψ^{(i)}_2`) with `ψ^{(i)}_2(y) = T_y` and `ψ^{(i)}_2(λ_{𝔭_i}) = T_0(𝔭_i)`.
- `heckeLocal_lambdaAlgebra`: The Λ_𝒪-algebra structure on `T_∞(U, 𝒪)_m`.
- `heckeLocal_generated`: Lemma `3.3(i)`: generation by `T(ℓ), ℓ ∉ S`.

**Checks.**

- `heckeGaloisRep_residual`: `ρ_{U,m} mod m` is `ρ_m`.
- `heckeGaloisRep_specialise`: At an algebraic prime `P ⊇` the minimal prime, `ρ_{U,m} mod P` is `ρ_π` for the `π` of Proposition 3.2.
- `heckeLocal_generated_enlarge`: Enlarging `S` keeps the generation statement (fewer generators, same algebra).
- `lambda_over_lambda_prime_free`: `Λ_𝒪` is free of rank `p^{Σ r_i}` over `Λ′_𝒪`.
- Integrality is claimed only when `ρ_m` is irreducible; for residually reducible `m` use §3.15.
- The datum's finite-flat hypothesis concerns `𝒪`, not `Λ_𝒪`; `𝒪[[Y]]` is not finite over `𝒪`.
- For `T=𝒪[ε]/(ε²)` all DVR points kill `ε`; they cannot reconstruct the representation by joint injectivity.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, (H_even), p. 193 (Numdam PDF page 10; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, before Lemma 3.3, p. 195 (Numdam PDF page 12; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, Lemma 3.3, p. 195 (Numdam PDF page 12; printed page `=` PDF page `+ 183).`)

*Needs:* §3.14; PadicFamilies:§5.3; §3.17; LocalGaloisDeformationRings:§F.2.7; PadicFamilies:§5.6; PadicFamilies:§5.7; GlobalGaloisDeformations Layer R04.6 §§6.7–6.8.

### 3.33 Permissible levels `U_{𝒟_Q}, (H_def)` and the Hecke rings `T_{𝒟_Q}`

A maximal ideal `m` of `T_∞(U, 𝒪)` is permissible if `ρ_m ≅ ρ₀` and `T_0(𝔭_i) − χ^{(i)}_2(λ_{𝔭_i}) ∈ m` for `1 ≤ i ≤ t (it` is then unique; the uniformisers `λ_{𝔭_i}` are chosen with `(χ^{(i)}_1/χ^{(i)}_2)(λ_{𝔭_i}) ≠ 1`). For an augmented datum `𝒟_Q = (𝒪, Σ, ℳ)_Q` let `U_{𝒟_Q} = ∏_{w∤∞} U_{𝒟_Q,w}` with `U_{𝒟_Q,w} = GL₂(𝒪_{F,w})` for `w ∉ Σ ∖ 𝒫 ∪ Q`; `{(a b`; `c d`) : `c`, a `− 1 ∈ ℓ_w²}` for `w ∈ Σ ∖ (𝒫 ∪ ℳ)`; `{c ∈ ℓ_w`, a `mod ℓ_w ∈ Δ_w}` for `w ∈ ℳ`; and `{c ∈ ℓ_w, ad^{−1} mod ℓ_w ∈ Δ′_w}` for `w ∈ Q`, where `Δ_w` is the Sylow p-subgroup of `(𝒪_F/ℓ_w)^×` and `Δ′_w` a complement. `(H_def): T_∞(U_{𝒟₀}, 𝒪)` has a permissible maximal ideal; then so does every `T_∞(U_{𝒟_Q}, 𝒪)`. Put `T_{𝒟_Q} = T_∞(U_{𝒟_Q}, 𝒪)_m, T_𝒟 = T_{𝒟_∅}`, and `ρ^mod_{𝒟_Q}` the representation of §3.32 in a basis with `ρ^mod_{𝒟_Q} mod m = ρ₀`. The `T_{𝒟_Q}`-modules `M_{𝒟_Q}, M⁺_{𝒟_Q}` are those of Skinner–Wiles 1999 after Lemma 3.25 with `ℳ_c` replaced by `ℳ₀` and `r(w) = 1` (localisations of `M_∞(U^min_{𝒟_Q}), M⁺_∞(U^min_{𝒟_Q})` at `m`), with the commuting action of `Δ_Q = ∏_{w∈Q} Δ_w`, generators `δ_w` and `σ_w ∈ I_w` mapping to `δ_w`; `T^min_{𝒟_Q}` is the quotient of Skinner–Wiles 1999 §3.6 (essentially the largest reduced quotient through which `R_{𝒟_Q} → T_{𝒟_Q}` factors via `R^min_{𝒟_Q}`), with the 𝒟_Q-minimal `ρ^mod_{𝒟^min_Q}`.

(H_even) and `(H_def)`.

`U_{𝒟_Q} ⊆ U_{𝒟₀}`, so a permissible maximal ideal at level `U_{𝒟₀}` pulls back to every `U_{𝒟_Q}`.

Uniqueness of `m: ρ_m ≅ ρ₀` fixes the `T(ℓ) mod m`, and `T_0(𝔭_i) mod m` is fixed as `χ^{(i)}_2(λ_{𝔭_i})` (the other root `χ^{(i)}_1(λ_{𝔭_i})` is distinct by the choice of `λ_{𝔭_i}`).

The modules and `T^min` are Skinner–Wiles 1999's (§3.23) with the stated substitutions.

Provide the following operations and compatibility statements.

- `IsPermissibleIrr`: `ρ_m ≅ ρ₀` and `T_0(𝔭_i) ≡ χ^{(i)}_2(λ_{𝔭_i})`.
- `permissibleIrr_unique`: A permissible maximal ideal is unique.
- `levelOfDatum`: `U_{𝒟_Q}` from `𝒟_Q`.
- `heckeOfDatum`: `T_{𝒟_Q} = T_∞(U_{𝒟_Q}, 𝒪)_m` with `ρ^mod_{𝒟_Q}`.
- `heckeModuleOfDatum`: `M_{𝒟_Q}, M⁺_{𝒟_Q}` with the Δ_Q-action.
- `heckeMinOfDatum`: `T^min_{𝒟_Q}` and `ρ^mod_{𝒟^min_Q}`.

**Checks.**

- `levelOfDatum_mono`: `U_{𝒟_Q} ⊆ U_{𝒟₀}` for every `𝒟_Q`.
- `levelOfDatum_empty`: For `Q = ∅` and `Σ = Σ₀, ℳ = ℳ₀` the level is `U_{𝒟₀}`.
- `permissibleIrr_residual`: `ρ^mod_{𝒟_Q} mod m = ρ₀` in the chosen basis.
- `delta_action_commutes`: The Δ_w-actions for different `w ∈ Q` commute with each other and with `T_{𝒟_Q}`.
- `(H_def)` is an assumption here; Theorem 5.1 obtains it after base change from Skinner–Wiles, Base change and a problem of Serre, which is required of GL2AutomorphicRepresentationsAndTransfer §§R17.4.8–R17.4.11 (Exact supplier contracts).

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, permissible maximal ideals, p. 195 (Numdam PDF page 12; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, `U_{𝒟_Q}` and `(H_def)`, p. 196 (Numdam PDF page 13; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, after Proposition 3.4, p. 197 (Numdam PDF page 14; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, `T^min_{𝒟_Q}`, p. 198 (Numdam PDF page 15; printed page `=` PDF page `+ 183).`)

*Needs:* §3.32; §3.28; §3.23; §2.3.

### 3.34 `ρ^mod_{𝒟_Q}` is of type `𝒟_Q` and `R_{𝒟_Q} ↠ T_{𝒟_Q}` (Proposition 3.4)

(Proposition 3.4.) Under (H_even) and `(H_def), ρ^mod_{𝒟_Q}` is a deformation of `ρ₀` of type `𝒟_Q`, and the corresponding map `r_{𝒟_Q}` : `R_{𝒟_Q} → T_{𝒟_Q}` is a surjection of Λ_𝒪-algebras.

(H_even) and `(H_def)`; `ρ₀` absolutely irreducible.

For each minimal prime `P` of `T_{𝒟_Q}` put `ρ_P = ρ^mod_{𝒟_Q} mod P`. det `ρ_P` is unramified at `w ∈ Q`: reduce modulo algebraic primes and use local–global compatibility (Proposition `3.2 =` PadicFamilies Layer 5/hida-control-nearly-ordinary; AutomorphicGaloisRepresentations §§4.4, 4.12 and 6.4).

At `v_i`: choose `σ_i ∈ D_i` mapping to `λ_{𝔭_i}`; in a basis with `ρ_P(σ_i) = diag(α, β), α ≡ χ^{(i)}_1(λ_{𝔭_i}), (3.2)(vi)` and `T_0(𝔭_i) − χ^{(i)}_2(λ_{𝔭_i}) ∈ m` give `ρ_P|_{D_i} ≅ (ψ^{(i)}_1 *`; `0 ψ^{(i)}_2`) with `ψ^{(i)}_2 ≡ χ^{(i)}_2`.

At `w ∈ ℳ`: at algebraic points `ρ_π|_{D_w}` is unramified or of Type A (§3.6) by the level `U_{𝒟_Q,w}`; the argument of Skinner–Wiles 1999 Proposition 3.13 (§3.18) transfers this to `ρ_P ⊗ L`; `ρ₀` ramified at `w` excludes unramified, so (`ρ_P ⊗ L)|_{I_w} ≅ (1 *`; 0 1) with `* ≠ 0`. For `σ ∈ I_w` a generator of pro-p tame inertia, `(σ − 1)²` kills a free rank-two R-lattice `M, N = M/M[σ − 1]` reduces to a one-dimensional quotient of `ρ₀`, so `N ≅ R` and `M[σ − 1] ≅ R`, giving `ρ_P|_{I_w} ≅ (1 *`; 0 1) integrally.

The maps `r_P` : `R_{𝒟_Q} → T_{𝒟_Q}/P` assemble to `r_{𝒟_Q}` : `R_{𝒟_Q} → ∏_P T_{𝒟_Q}/P (3.3)`; its image is `T_{𝒟_Q}` because traces of Frobenius map to the `T(ℓ)` (§3.31 and Lemma `3.3(i)`).

The induced representation into `GL₂(T_{𝒟_Q})` agrees with `ρ^mod_{𝒟_Q}` modulo every minimal prime, so they are equal (`T_{𝒟_Q}` reduced); hence `ρ^mod_{𝒟_Q}` is of type `𝒟_Q`.

At the finite-flat specializations of §3.32, this is the supplied unframed classifying map: GlobalGaloisDeformations' `HeckeGaloisDatum.classifying_surjective` proves surjectivity and `classifying_unique` identifies it by the unramified Frobenius traces. Use `mem_of_points` to factor through the ordinary global problem when the jointly injective DVR points satisfy its coefficient-changed local conditions and the selected residual quotient. For the big algebra, the preceding minimal-prime argument and §3.31 supply this arithmetic refinement directly. The residual absolute irreducibility here excludes the permissible Eisenstein case of §3.16.

**Checks.**

- The surjection is onto the full Hecke ring, not only onto a trace subring; compare §3.17, which in the reducible case goes through pseudo-deformations.
- Extending a representation from `𝒪` to `𝒪[ε]/(ε²)` with unchanged traces leaves its trace image in `𝒪`; the datum's generation hypothesis fails.
- Formal framing coordinates can take distinct values with identical traces; the classifying uniqueness statement is unframed.
- A local ordinary equation vanishing at all points vanishes in `T` only with joint injectivity; testing only one branch of a reducible `T` is insufficient.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, Proposition 3.2, p. 194 (Numdam PDF page 11; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, proof of Proposition 3.4, p. 196 (Numdam PDF page 13; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, end of the proof of Proposition 3.4, p. 197 (Numdam PDF page 14; printed page `=` PDF page `+ 183).`)

*Needs:* §3.33; §3.31; §3.18; §3.6; PadicFamilies:§5.8; AutomorphicGaloisRepresentations:§§4.4, 4.12, 6.4; GlobalGaloisDeformations Layer R04.6 §§6.7–6.8.

### 3.35 `T_{𝒟_Q} ≅ T^min_{𝒟_Q} ⊗ 𝒪[N_Σ]` and the trace at auxiliary primes (Lemma 3.5)

(Lemma 3.5.) (i) There is an isomorphism `T_{𝒟_Q} ≅ T^min_{𝒟_Q} ⊗_𝒪 𝒪[N_Σ]` compatible with `r_{𝒟_Q}, r^min_{𝒟_Q}` and (2.2). `(ii) T^min_{𝒟_Q}` is a finite, reduced, torsion-free Λ_𝒪-algebra. (iii) For each `w ∈ Q`, trace `ρ^mod_{𝒟^min_Q}(σ_w)` acts on `M_{𝒟_Q}` and `M⁺_{𝒟_Q}` as `δ_w + δ_w^{−1}`. The map `r^min_{𝒟_Q}` : `R^min_{𝒟_Q} → T^min_{𝒟_Q}` is surjective by Proposition 3.4.

(H_even) and `(H_def)`.

From the definition of `T^min_{𝒟_Q}` and the arguments of Skinner–Wiles 1999 Proposition 3.23 and Lemmas 3.21 and 3.25 (§3.24, §3.22).

Surjectivity of `r^min` from §3.34 and (2.2).

**Checks.**

- (iii) is the identity the patching argument uses to make `M_{𝒟_Q}` a module over `𝒪[[s_1, …, s_r]]` through `s_i = δ_{w_i} − 1` compatibly with `t_i = trace(ρ(σ_{w_i})) − 2`.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §3, Lemma 3.5, p. 198 (Numdam PDF page 15; printed page `=` PDF page `+ 183).`)

*Needs:* §3.33; §3.34; §3.24; §3.22.

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

*Needs:* §3.14; §3.15; §3.19; ArithmeticGaloisDuality:§R02.5.1; LocalGaloisDeformationRings:§6.3; §3.32; §3.12.

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

*Needs:* LocalGaloisDeformationRings:§§7.1–7.6; §3.13.

### 3.38 Waldschmidt's lower bound for the p-adic rank of units

Let `k` be a number field, `φ` : `k → ℂ` and `φ_p` : `k → ℂ_p` embeddings, and `α_{ij} ∈ k (1 ≤ i ≤ d, 1 ≤ j ≤ ℓ)` with `|φ_p(α_{ij})|_p = 1`. Put `M⁰ = (log|φ(α_{ij})|)_{i,j}`, a real matrix, and `M_p = (log_p φ_p(α_{ij}))_{i,j}`, with `log_p` the Iwasawa logarithm of DirichletPadicLFunctions §0.6, normalized by `log_p(p)=0`. Then rk `M_p ≥` ½ rk `M⁰` (Waldschmidt, Theorem 1.1). Two consequences are used. (i) For a totally real field `F` of degree `d`, the p-adic rank `r_p` of the units of `F` satisfies `r_p ≥ (d − 1)/2`, so the ℤ_p-rank `δ_F` of the Galois group of the maximal abelian pro-p extension of `F` unramified outside `p` satisfies `δ_F ≤ ⌊(d + 1)/2⌋`, and `δ_F ≤ d/2` when `d` is even. `(ii)` For a totally real quadratic extension `F′/F` with `d = [F` : `ℚ]` and `p` odd, the ℤ_p-rank `δ⁻_{F′}` of the part of `Γ_Σ` on which `Gal(F′/F)` acts by `−1` (notation of §3.30) satisfies `δ⁻_{F′} ≤ d/2`.

The theorem holds for every prime p. In (i) and `(ii) p` is odd and the fields are totally real. For a CM quadratic `F′/F` the minus units are finite, the theorem gives nothing, and `δ⁻_{F′} = d` (§3.30). The inequality is a lower bound for `r_p`, not Leopoldt's conjecture `r_p = d − 1`.

Waldschmidt proves Theorem 1.1 from a p-adic transcendence result for exponential functions in several variables, an extension of Schneider's method (Waldschmidt, §1, p. 1618, citing his Inventiones 1981 paper; the proof begins in §2, p. 1622).

For (i), take for `k` the Galois closure of `F`, for the `α_{ij}` the conjugates `σ_i(ε_j)` of a basis `ε_1, …, ε_{d−1}` of the units of `F` modulo torsion. Dirichlet's unit theorem gives rk `M⁰ = d − 1`, and the column space of `M_p` has dimension `r_p`. Class field theory gives `δ_F = 1 + (d − 1 − r_p)`, whence `δ_F ≤ 1 + (d − 1)/2`.

For `(ii)`, apply the theorem to a basis of the relative minus units of `F′/F`, of ℤ-rank `(2d − 1) − (d − 1) = d`, whose real logarithm matrix has rank `d`. Their p-adic rank `r_p⁻` is at least `d/2`. For `p` odd the class-field computation of `Γ_Σ` splits into ± parts under `Gal(F′/F)`, and the minus part has ℤ_p-rank `d − r_p⁻`.

**Checks.**

- For a real quadratic `F (d = 2)` the bound gives `r_p ≥ 1/2`, so `r_p = 1` (the p-adic logarithm of a unit of infinite order is nonzero) and `δ_F = 1`.
- Rounding: for `d = 4` the bound `(d + 1)/2 = 5/2` gives `δ_F ≤ 2 = d/2`; for `d = 3` it gives `δ_F ≤ 2`, not 3/2.
- For `F′/F` CM quadratic the minus units have rank 0 and rk `M⁰ = 0` on them, so the theorem says nothing; `δ⁻_{F′} = d` there, which is why §3.30 restricts the `d/2` bound to totally real `F′`.

([Waldschmidt](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/CollMathSocBolyai1981.pdf) §1, Theorem 1.1, p. 1620; §1, p. 1618; [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, (4.20), p. 78, and the proof of Theorem `B`, p. 79 (Numdam PDF pages 75–76; printed page `=` PDF page `+ 3).`)

*Needs:* mathlib:NumberField.Units; mathlib:PadicComplex; DirichletPadicLFunctions §0.6; TauCetiRoadmap.ClassFieldTheory Layer 11 (the global Artin map); DiophantineApproximationAndTranscendence:Layer 3 (the complex several-variable Schneider–Lang machinery whose p-adic form this target proves).

### 3.39 Ordinary deformation and tangent refinements

(a) The versal nearly ordinary deformation ring of a nonsplit `ρ₀|_{D_v} ≅ (χ_1 *`; `0 χ_2), χ_1 ≠ χ_2`, for `v | p` over a totally real `F`, with its relative dimension over `𝒪` (Skinner–Wiles 2001 Proposition 2.1 say it is analysed as in their 1999 Corollary 2.3, the split case `χ ⊕ 1`). (b) For §3.2 and §3.28: that the nearly ordinary ordered-flag condition at `v | p`, with only the residual character of the sub prescribed, is a deformation condition stable under Schlessinger fibre products; LocalGaloisDeformationRings §6.3 fixes the inertial characters and excludes a residual ratio 1 or `ε̄`.

Mazur's unframed presentation for a Schur residual representation with fixed determinant: `R ≅ 𝒪[[x_1, …, x_{g′}]]/(f_1, …, f_{r′})` with `g′ = h¹(F_Σ/F, ad⁰ρ̄)` and `r′ ≤ h²(F_Σ/F, ad⁰ρ̄)`([M, Proposition 2]).

The same identification with coefficients `C/λ^m` for a complete discrete valuation ring `C`: the injection `Hom(R, C ⊕ εC/λ^m) ↪ H¹(F_Σ/F, ad ρ/λ^m)` with the local conditions of Skinner–Wiles `(8.8)–(8.10)`, for a deformation ring `R` over `C`.

Construct the nearly ordinary ordered-flag deformation condition under distinct residual characters, with no additional fixed-inertia or cyclotomic-ratio exclusion. Prove identity and composition for coefficient change, unique lifting of the selected ordered line, fibre-product stability and the relative local generator/relation bounds. Apply it to the split case of §3.2 and the possibly nonsplit case of §3.28. Prove Mazur's unframed presentation under the Schur hypothesis and the discrete-valuation-coefficient tangent comparison used by §§3.4, 3.29 and 4.11.

**Checks.**

- A split residual representation with two distinct characters has two lines; selecting their order is necessary, and a first-order extension in the opposite direction fails the chosen condition.
- A nonsplit residual extension admits only its sub-character line. The split versal calculation alone does not give its presentation.
- The cyclotomic ratio may occur in this condition; a fixed-inertial-character smoothness theorem excluding that ratio cannot replace fibre-product stability.
- For `m=1` the tangent comparison reduces to finite residue coefficients; for `m>1` it must retain λ-power torsion rather than only residue-field dimensions.

(Source: SW99 §2.1, Lemma 2.2, Corollary 2.3 and Proposition 2.4, pp. 11–14; SW01 Proposition 2.1, p. 189; Mazur `[M]`, Proposition 2, as cited in SW99; SW99 `(8.8)–(8.10).`)

*Needs:* LocalGaloisDeformationRings §§F.2.1–F.2.6, 6.2–6.3, Layers 7–8; GlobalGaloisDeformations §§3.4–3.8; ArithmeticGaloisDuality §§D8.1, R02.5.1. Clauses (a),(b) take the residual representation and ordered local flags as input and supply §§3.2,3.28.

### Examples

With local matrices `diag(β,α)` and `diag(u,v), trρ(gσ)=βu+αv`. The quotient-character expression `(β(u+v)−(βu+αv))/(β−α)` is `v` when `β−α≠0`; at `β=α` the denominator vanishes and recovery is unavailable. The Wiles four-term identity is the expansion `(aσbτ+bσdτ)(cαaβ+dαcβ)`. A nonsplit global extension has a Schur endomorphism ring when `χ≠1`, but the split extension admits independent diagonal scalars and cannot be inserted into the same representability argument. For `F=ℚ` and a CM quadratic inducing field in which `p` splits, the minus local-unit rank is 1 and the minus global-unit rank is 0: the dihedral parameter rank is 1, exceeding `d/2=1/2`. This refutes the universal dimension estimate, not the ordinary lifting conclusion. At `d_v=5` the determinant–flag component dimensions are 20 and at most 18; the comparison is on the distinct-character open set.

### Dependencies

ArithmeticGaloisDuality:§R02.4.4; ArithmeticGaloisDuality:§R02.5.1; AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1; AutomorphicGaloisRepresentations:§§4.4, 4.12, 6.4; SchemeAndStackFoundations:§4.4; DiophantineApproximationAndTranscendence:Layer 3; GL2AutomorphicRepresentationsAndTransfer:§§R17.3.1–R17.3.9; GlobalGaloisDeformations:§4.1; LocalGaloisDeformationRings:§F.1.3; LocalGaloisDeformationRings:§F.2.7; GlobalGaloisDeformations:§§4.4, 7.4; GlobalGaloisDeformations:§3.4; LocalGaloisDeformationRings:§F.2.5; GlobalGaloisDeformations:§§3.4–3.8; HilbertModularVarietiesAndShimuraCurves:§§R18.3.1–R18.3.22; §1.6; IntegralHeckeAndGaloisDeterminants:§0.5; TauCetiRoadmap.ClassFieldTheory; LocalGaloisDeformationRings:§6.3; LocalGaloisDeformationRings:§6.2; LocalGaloisDeformationRings:Layers 6–8; §3.39; LocalGaloisDeformationRings:§§7.1–7.6; PadicFamilies:§5.9; PadicFamilies:§5.8; PadicFamilies:§5.6; PadicFamilies:§5.7; PadicFamilies:§5.3; PadicFamilies:§5.1; mathlib:MvPowerSeries; mathlib:NumberField.Units; mathlib:PadicComplex.

## Layer 4: Pro-modularity and localized `R = T`

### 4.1 Pro-modular primes and components of `R_𝒟`

Let `F` have even degree, `L_p(F, −1, χω)` not a unit (so `T_𝒟` exists), and `𝒟^ps = (𝒪, Σ)`. A prime `q` of `R_𝒟` is pro-modular if `φ_q` : `R_{𝒟^ps} → R_𝒟/q`, the map of the pseudo-deformation of `ρ_𝒟 mod q`, factors through `π_𝒟` : `R_{𝒟^ps} ↠ T_𝒟`, i.e. `φ_q = θ_q ∘ π_𝒟 (4.1)` for some `θ_q` : `T_𝒟 → R_𝒟/q`; then `θ_q(T(ℓ)) =` trace `ρ_𝒟(Frob_ℓ) mod q` for `ℓ ∉ Σ`. A deformation is pro-modular if its kernel is. If `q` is pro-modular so is every `𝔭 ⊇ q`; a component of Spec `R_𝒟` is pro-modular if its minimal prime is.

`F` of even degree; `L_p(F, −1, χω) ∈ 𝒪` not a unit.

Specialisation: if `q ⊆ 𝔭`, compose `θ_q` with `R_𝒟/q ↠ R_𝒟/𝔭`.

Provide the following operations and compatibility statements.

- `IsProModular`: `φ_q` factors through `π_𝒟`.
- `IsProModular.of_le`: Pro-modularity passes to larger primes.
- `IsProModularComponent`: The minimal prime of the component is pro-modular.
- `IsProModular.trace`: `θ_q(T(ℓ)) =` trace `ρ_𝒟(Frob_ℓ) mod q`.

**Checks.**

- `isProModular_maximal`: The maximal ideal of `R_𝒟` is pro-modular: `ρ_0 = {1, χ, 0}` is the residual pseudo-representation of `T_𝒟` at the permissible `m`.
- `isProModular_specialise`: If a minimal prime is pro-modular, every prime of its component is.
- `isProModular_not_representation`: Pro-modularity of `q` says nothing about the extension class of `ρ_𝒟 mod q`; two `ρ_c` with the same traces are both pro-modular or both not.
- For the coefficient factorization condition take `S=R=k[[t,x]]`, `T=S/(x)`, `π:S↠T` and `S→R` the identity. At `q=(x)` the reduction factors through `T` by the identity.
- At `q=(t,x)` it factors by evaluation of the remaining variable at zero.
- At `q=(t)` it does not factor: `x` survives in `k[[x]]` whereas `π(x)=0`. These coefficient Checks supplement the arithmetic specialization Checks.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.1, p. 61 (Numdam PDF page 58; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.1, p. 62 (Numdam PDF page 59; printed page `=` PDF page `+ 3).`)

*Needs:* §3.23; §3.9.

### 4.2 Good pairs, nice primes and the properties `(P1), (P2)`

`(F, 𝒟)` is good if `d` is even; `L_p(F, −1, χω) ∈ 𝒪 ∖ 𝒪^×`; `d > 2 + δ_F + 8(#Σ + dim_k H_{Σ_0}(F, k))`; `d_{v_i} > 2 +` 2t `+ 7(#Σ + dim_k H_{Σ_0}(F, k))` for every `v_i | p`; and, for `w ∤ p` with `ρ_c|_{I_w} ≠ 1`, either `χ|_{I_w} ≠ 1` or `χ|_{D_w} = 1`. A nice deformation (Skinner–Wiles §2.3) is one over a one-dimensional domain of characteristic `p`, of type `𝒟_c`, with `ψ^{(i)}_1/ψ^{(i)}_2` of infinite order at each `v_i`. A dimension-one prime `𝔭` of `T_𝒟` is nice for `𝒟` if `ρ_𝔭` is irreducible, `𝔭` comes from `T_{𝒟_c}`, the class `c′` of Lemma 2.13 for `ρ_𝔭` is a scalar multiple of `c`, and a conjugate of the associated `ρ` is a nice deformation of type `(𝒪′, Σ, c, ℳ)`; then `R_𝒟 →` A gives the nice prime `𝔭_𝒟`. A prime of `R_𝒟` is good if `ρ_𝒟 mod 𝔭` is nice, and nice if moreover it is the inverse image of a pro-modular prime of `R_{𝒟_c}`. `(P1)`: for every prime `𝔭 ⊆ T_𝒟` nice for `𝒟`, every `Q ⊆ 𝔭_𝒟` is pro-modular. `(P2): R_{𝒟_c}` has a pro-modular prime whose deformation is nice.

`Σ_0` is the set of places where `χ` ramifies, with `𝒫`; `𝒟_c = (𝒪, Σ_c, c, ℳ_c)` as in Skinner–Wiles §2.3.

For `𝔭` of dimension one with `ρ_𝔭` irreducible, Lemma 2.13 gives `ρ` over the normalisation A of `T_𝒟/𝔭` deforming some `ρ_{c′}`; (3.4) and permissibility `(T_0(𝔭_i) ≡ 1)` force `ρ|_{D_i}` to be split or (`ψ_1 *`; `0 ψ_2`) with `ψ_2 ≡ 1`, so `c′` is admissible and `ρ` is of type `(𝒪′, Σ, c′, ∅)`.

Provide the following operations and compatibility statements.

- `IsGoodPair`: The five conditions on `(F, 𝒟)`.
- `IsNiceDeformation`: One-dimensional, characteristic `p`, type `𝒟_c, ψ_1/ψ_2` of infinite order.
- `IsNiceFor`: A prime of `T_𝒟` nice for `𝒟`.
- `PropertyP1`: `(P1)`.
- `PropertyP2`: `(P2)`.
- `IsGoodPair.mono`: `(F, 𝒟)` good and `Σ′ ⊆ Σ ⇒ (F, 𝒟′)` good.

**Checks.**

- `isGoodPair_degree_bound`: `d` must exceed `2 + δ_F + 8(#Σ +` dim `H_{Σ_0}`): for `F = ℚ (d = 1)` no datum is good, which is why §4.6 base changes to large even-degree `F`.
- `isGoodPair_local_degree`: Each `d_{v_i}` must exceed `2 +` 2t `+ 7(#Σ +` dim `H_{Σ_0}`), so `p` must be highly ramified or inert in `F`.
- `isNiceDeformation_characteristic`: A nice deformation lives in characteristic `p`: in characteristic 0 the definition does not apply.
- Goodness is preserved by shrinking `Σ` but not by base change; §4.6 exploits that a base change can become good.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.2, p. 62 (Numdam PDF page 59; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.2, p. 63 (Numdam PDF page 60; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.2, p. 63 (Numdam PDF page 60; printed page `=` PDF page `+ 3).`)

*Needs:* §4.1; §3.11; §3.14; §3.2.

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

### 4.4 The key proposition: every prime of `R_𝒟` is pro-modular

(Proposition 4.1.) Let `𝒟` be a deformation datum for `F`. If `(F, 𝒟)` is good and `(P1)` and `(P2)` hold for `𝒟` and `𝒟_c`, then every prime of `R_𝒟` is pro-modular.

`(F, 𝒟)` good; `(P1)` and `(P2)` for `𝒟` and `𝒟_c`.

Case `𝒟 = 𝒟_c`, step one: a component containing a nice prime is pro-modular by `(P1)`; with `(P2)` some component is.

Step two: if a non-pro-modular component `C_2` existed, Proposition 2.4 and Corollary A.2 give `C_1` pro-modular with `C_1 ∩ C_2 ⊇ Q` of dimension `d −` 2t `+ δ_F − 3#ℳ_c`; a minimal `Q_1` over (`Q, p`, det `ρ(γ_i) − 1`) has dimension `≥ d −` 2t `− 3#ℳ_c − 1 > 1 + δ_F + (#Σ +` dim `H_{Σ_0}`) by `(G)`, so `ρ mod Q_1` is irreducible (Lemma 2.6 with Lemmas `2.7–2.8`).

`Q_1` is pro-modular; by Corollary 2.12 (printed as 'Proposition `2.12'`) dim `T/Q^mod_1 ≥` dim `R/Q_1`, and `T` is integral over `Λ_𝒪`; if `Q^mod_1` contained all `Y^{(i)}_j` then dim `≤ d − d_i`, contradicting `(G)`, so some `Y^{(i)}_1 ∉ Q_1`.

A one-dimensional `𝔭 ⊇ Q_1` avoiding `c_{σ_0}` and the `Y^{(i)}_1` is nice (`ψ_2(y_1) = 1 + Y_1` of infinite order and det `= χ`), hence `C_2` is pro-modular by step one: contradiction.

General `𝒟`: good primes of `R_𝒟` come from nice primes of `R_{𝒟_c}`, so components with a good prime are pro-modular; a minimal `Q` with a minimal `Q_2` over `(Q, I_2)` of dimension `≥ d − 7#Σ − 1` lies in a good prime.

**Checks.**

- The argument is dimension counting under `(G)`; no `R = T` isomorphism is claimed at this stage.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.3, Proposition 4.1, p. 64 (Numdam PDF page 61; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.3, proof of Proposition 4.1, p. 64 (Numdam PDF page 61; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.3, end of the proof, p. 66 (Numdam PDF page 63; printed page `=` PDF page `+ 3).`)

*Needs:* §4.2; §4.3; §3.4; §3.10; §3.5; §3.17; §3.13; PadicFamilies:§5.7.

### 4.5 A criterion for property `(P2)`

(Proposition 4.2.) Let `𝒟 = (𝒪, Σ, c, ℳ)` be a deformation datum. If `(F, 𝒟)` is a good pair and `(P1)` holds for every datum `(𝒪′, Σ′, c′, ℳ′)` with `Σ′ ⊆ Σ` and `𝒪′ ⊇ 𝒪`, then `(P2)` holds for `𝒟`.

`(F, 𝒟)` good; `(P1)` for all data with smaller `Σ` and larger `𝒪`.

Step one: for `𝒟_0 = (𝒪′, Σ_0, c_0, ℳ_0) (Σ_0` the ramification of `χ` with `𝒫), T_χ = T_∞(U^χ, 𝒪)_m` exists (Proposition 3.18, printed as 3.14); for a minimal prime `Q` of `T_χ/(p, T_1, …, T_{δ_F})` the pseudo-representation has `x ≢ 0` (otherwise a diagonal deformation, and Lemma 2.9 would give `d ≤ 1 + δ_F`, contradicting `(G)`); a one-dimensional `𝔭 ⊇ Q` avoiding `x(σ_0, τ_0)` and the `Y^{(i)}_1` gives, by Corollary 2.14, a nice pro-modular deformation of type `𝒟_0`.

If `c` is a multiple of `c_0` this gives `(P2)` for `𝒟_c`. Otherwise let `𝒟_1 = (𝒪′, Σ_c, c_0, ℳ_1)`; `(P2)` for `𝒟_0` and `(P1)` with Proposition 4.1 make every prime of `R_{𝒟_1}` pro-modular.

Step two: cut `R_{𝒟_1}` by `s − 2` linear conditions killing `c` and `c_0` on generators of `Gal(F_0(χ)/F(χ))` and by det `ρ(γ_ℓ) − 1`; by `(G), (4.2)` and Proposition 2.4 every minimal prime has dimension `> δ_F +` dim `H_{Σ_c} (4.3)`, so `ρ` is irreducible there (Lemma 2.6). The reducible deformation with cocycle `c_0 +` cX gives a one-dimensional `𝔭`; with `A^tr = T_{𝒟_1}/Q^mod`, a height-one `P_0 ⊇ Σβ_i x(σ_i, ·)` exists; Lemma 2.9 and Corollary 2.12 (printed as Proposition 2.12) exclude `x ⊆ P_0`, and `(G)` gives `Y^{(i)}_1 ∉ P_0`.

A one-dimensional `𝔭_1 ⊇ P_0` avoiding `x(σ′, τ′)` and the `Y^{(i)}_1` gives `ρ_1` (Corollary 2.14) with `c_1 = c` up to scalar, hence a deformation of type `(𝒪, Σ_c, c, ∅)`.

Step three: `ρ_1` is of type `𝒟_c` (each `w ∈ ℳ_c` has `χ|_{I_w} ≠ 1` or `χ|_{D_w} = ω^{−1} = 1, (4.4)`; the p-power-order type `B′` case at these places is impossible in characteristic `p`), and the prime `𝔭_2` of `R_{𝒟_c}` is pro-modular: Lemma 3.16, twisting (Lemma 3.17), the levels `U′`, U″ (4.8), Lemma 3.15 and Proposition 3.20 show `𝔭_3` comes from `T_{𝒟_c}`.

**Checks.**

- The proof builds a pro-modular nice prime for `𝒟_c` from the Eisenstein ideal of `χ`; this is where the p-adic L-function hypothesis of `(G)` enters.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.4, Proposition 4.2, p. 66 (Numdam PDF page 63; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.4, proof of Proposition 4.2, p. 69 (Numdam PDF page 66; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.4, end of the proof, p. 73 (Numdam PDF page 70; printed page `=` PDF page `+ 3).`)

*Needs:* §4.2; §4.4; §2.4; §3.17; §3.11; §3.27; §3.4; §3.5; §3.10; §3.18; §3.19; §3.20; §3.21; PadicFamilies:§5.7.

### 4.6 Property `(P1)` holds for every deformation datum

(Proposition 8.4.) If `F` has even degree and `𝒟` is a deformation datum for `F`, then `(P1)` holds for `𝒟`: for every prime `𝔭` of `T_𝒟` nice for `𝒟`, every prime `Q ⊆ 𝔭_𝒟` of `R_𝒟` is pro-modular.

`F` of even degree.

Let `Q ⊆ 𝔭_𝒟` be minimal, `ρ = ρ_𝒟 mod Q` and `R = R_𝒟/Q`. Choose a p-power-order `ψ` with `χ̃^{−1}det(ρ ⊗ ψ)` trivial on `N_Σ`; the kernel `Q_1` of `R_𝒟 → R` for `ρ ⊗ ψ` factors through `R^min_𝒟` and lies in `𝔭_𝒟`.

`Q_1` is pro-modular by Proposition 8.1 (§4.15: `R̃^min_𝒟 ≅ T̃^min_𝒟` at nice primes).

Lemma 3.17 twists back: `cond^{(p)}(ψ)` is square-free and supported on `Σ∖ℳ`, so `U_𝒟 ⊆ U_1(cond^{(p)}(ψ)²)` and `ρ` is pro-modular; primes contained in `𝔭_𝒟` follow.

**Checks.**

- The substance is Proposition 8.1; this target only records the reduction to the minimal case.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §8, Proposition 8.4, p. 123 (Numdam PDF page 120; printed page `=` PDF page `+ 3).`)

*Needs:* §4.2; §3.23; §3.20; §3.2; §4.15.

### 4.6a Single-coefficient solvable descent

For totally real `F`, odd `p`, and a continuous `ρ:G_F→GL₂(Q̄_p)` unramified outside finitely many places, assume total oddness, `detρ=ψε^μ` with `μ≥1` and finite-order `ψ`, and the selected nearly ordinary local quotients of finite inertial order as in §4.7. Let `L/F` be finite totally real with solvable Galois closure. Assume `ρ|G_L` is absolutely irreducible and attached to a cuspidal Hilbert form of regular weights at least 2, in the matching arithmetic convention. Construct `singleCoefficientSolvableDescent`: `ρ` is attached to a cuspidal Hilbert form over `F`, with the chosen local ordinary characters transported under the attachment.

Let `E/F` be the Galois closure. Prove that the regular Hilbert attachment over `L` remains absolutely irreducible over the totally real field `E`. Use AutomorphicGaloisRepresentations §§3.15–3.16: a non-CM attachment remains irreducible on every open subgroup; a CM attachment is induced from a totally imaginary quadratic field, which cannot be contained in `E`. Its two inducing characters remain distinct after finite restriction because their labelled Hodge–Tate weights differ. Thus solvable base change from `L` to `E` stays cuspidal and matches `ρ|G_E`.

Choose a prime-cyclic tower from `E` down to `F`. At each step good-prime trace matching with `ρ` gives invariance of the cusp form by strong multiplicity one. Apply cyclic automorphic descent. Its regular archimedean type supplies an attached representation at this same coefficient place by AutomorphicGaloisRepresentations §§3.10–3.14. Schur's lemma on the common absolutely irreducible restriction gives a finite character of the cyclic quotient comparing that attachment with `ρ`; twist the descended form to obtain equality. Repeat to `F`. This construction uses one coefficient place and does not require a compatible family or a common twist index across coefficient places.

**Checks.**

- For `L=F` the input attachment gives the conclusion with trivial twist.
- On a cyclic step a nontrivial quotient character preserves the restricted representation but changes the descent; the finite-character twist selects the one matching `ρ`.
- For a nonnormal `L/F`, descend from its Galois closure rather than treating `G_L` as normal in `G_F`.
- A weight-one dihedral representation induced from a real quadratic field can become reducible over a totally real extension. The regular-weight attachment hypothesis excludes this failure of the irreducibility argument.

(Source: SW99 §4.5, Main Theorem and proof, pp. 73–74; SW01 proof of Theorem 5.1, pp. 203–204; cyclic descent and twist fibre in Arthur–Clozel, Chapter 3 Theorem 4.2(d), p. 202; regular Hilbert virtual reducibility in Ribet, On l-adic representations attached to modular forms II, Theorem 2.3, pp. 251–252, as in AutomorphicGaloisRepresentations §3.16.)

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.4.8–R17.4.11; AutomorphicGaloisRepresentations §§3.10–3.16; ArithmeticGaloisRepresentations Layer 5; ClassFieldTheory Layer 11.

### 4.7 Skinner–Wiles Main Theorem

Let `F` be totally real (any degree), `𝒟 = (𝒪, Σ, c, ℳ)` a deformation datum for `F` and `ρ` : `Gal(F_Σ/F) → GL₂(𝒪)` a deformation of type `𝒟` with `ρ` irreducible, det `ρ = ψε^μ (μ ≥ 1, ψ` of finite order) and `ρ|_{D_i} ≅ (χ̃ψ^{(i)}_1 *`; `0 ψ^{(i)}_2`) with `ψ^{(i)}_2|_{I_i}` of finite order for each `i`. If there is a totally real `L/F` with (i) solvable Galois closure over `F, (ii) [L` : `ℚ]` even, (iii) `L` permissible for `𝒟` and `(iv) (L, 𝒟_L)` good, then `ρ ⊗ Q̄_p` is the representation of a Hilbert modular newform.

The four conditions on `L`; `ρ` irreducible.

`ρ_1 = ρ|_{Gal(F̄/L)}` is of type `𝒟_L` (permissibility). `(P1)` holds for all data over `L` (Proposition `8.4, L` of even degree), so Propositions 4.1 and 4.2 make `ρ_1` pro-modular: some `λ` : `T_{𝒟_L} → 𝒪` induces its pseudo-representation.

`λ` satisfies the hypotheses of Proposition 3.7 (det and the local shape), giving a Hilbert newform `f_1` over `L` with trace `ρ_1(Frob_ℓ) = λ(T(ℓ)) (4.10)`; `ρ_{f_1}` (Wiles, (3.2)) has the same traces (4.11); Chebotarev and Brauer–Nesbitt identify the semisimplification of `ρ_1 ⊗ Q̄_p` with the absolutely irreducible representation `ρ_{f_1}` attached to the cuspidal newform (AutomorphicGaloisRepresentations §§3.11–3.14, 4.10–4.11 and 5.1). Thus `ρ_1` itself is absolutely irreducible and `ρ_1 ⊗ Q̄_p ≅ ρ_{f_1}`.

Apply §4.6a to the regular Hilbert attachment just constructed. Its single-coefficient cyclic descent and finite-character twist give a newform over `F` whose representation is `ρ⊗Q̄_p`.

**Checks.**

- Irreducibility of the characteristic-zero `ρ` is assumed even though `ρ̄` is reducible.
- The even-degree convention of §§3–4 is dropped: only `L` needs even degree.
- The chosen `L/F` need not be normal; §4.6a first passes to its solvable Galois closure with irreducibility justified by the regular Hilbert attachment.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.5, p. 73 (Numdam PDF page 70; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.5, proof of the Main Theorem, p. 74 (Numdam PDF page 71; printed page `=` PDF page `+ 3).`)

*Needs:* §4.6; §4.5; §4.4; §3.3; PadicFamilies:§5.8; AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1; GL2AutomorphicRepresentationsAndTransfer:§§R17.4.8–R17.4.11; §6.14; §4.6a.

### 4.8 Arithmetic verification of the Skinner–Wiles patching axioms

For a nice prime `𝔭` of the permissible minimal nearly ordinary deformation problem `𝒟_c`, the auxiliary-prime rings, trace subrings and ordinary quaternionic modules constructed in Skinner–Wiles §7 satisfy the characteristic-p formal patching axioms `(5.1)–(5.11)` over `A = k[[T]]`. The auxiliary-prime cardinality is independent of `N`; the presentation dimensions and T-primary tangent and trace-cokernel bounds are uniform in `N` and in the cutoff a; and the congruence annihilators `z` and `x^(N)` have the required nonzero, uniformly bounded T-orders.

The nice-prime hypotheses of §4.2, the minimal level `𝒟_c`, and the auxiliary primes of §4.11 (Skinner–Wiles §6). The formal datum is specified in §4.20; A has characteristic p.

Use the auxiliary sets and the local/global tangent comparison to bound the torsion terms in the deformation rings uniformly.

Use quaternionic auxiliary-level freeness and the trace identity to obtain the required module ranks and coinvariants.

Verify `(7.17)–(7.25)` and the trace-ring bounds: these give (5.10) and the annihilator in (5.11), with its T-order independent of `N`.

**Checks.**

- Verify every uniformity assertion at the arithmetic level; the abstract theorem of §4.20 alone does not supply arithmetic uniformity.
- `A_N` has the module action; only `B_N` naturally acts on the patched deformation ring.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §7, `(7.17)–(7.25)`, pp. 107–110 (Numdam PDF pages `104–107`); §5, `(5.1)–(5.11)`, pp. 80–82 (Numdam PDF pages `77–79).`)

*Needs:* §4.11; §4.12; §2.7; §3.22; ArithmeticGaloisDuality:§R02.5.1; §4.20 (characteristic-p patching).

### 4.9 Arithmetic consequences of Skinner–Wiles patching

Apply the characteristic-p patching theorem of §4.20 to the arithmetic datum of §4.8, at a nice prime for `𝒟_c`. With `K = Frac(k[[T]])`, the patched ring is `K[[x₁,…,xₙ]]` and its patched ordinary module is free. For all sufficiently large `N, dim_K(R^(N)_1 ⊗ K) ≥ 2ⁿ dim_K(R^(N)_0 ⊗ K)`; `M^(0) ⊗ K` is free over `R^(0) ⊗ K`; and `R^(0) ⊗ K` is a complete intersection. These are conclusions for the arithmetic system, after inverting `T`.

The arithmetic datum satisfies the uniform bounds and annihilator conditions supplied by §4.8.

Apply §4.20’s extraction, freeness and complete-intersection theorem over `k[[T]]`, retaining all of its uniform bounds.

Identify its finite-level ring and module with the minimal arithmetic deformation problem and its ordinary quaternionic module.

Retain the distinction between the generic-fibre conclusion and integral `R=T`, obtained by the following arithmetic arguments.

**Checks.**

- The conclusions are after `⊗_A K` (the generic fibre over `A = k[[T]]`), not integral.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §5, Lemma 5.6, p. 85 (Numdam PDF page 82; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §5, Remark 5.10, p. 88 (Numdam PDF page 85; printed page `=` PDF page `+ 3).`)

*Needs:* §4.8; §4.20 (characteristic-p patching); §4.20 (the numerical complete-intersection criterion).

### 4.10 Irreducibility and eigenvalue lemmas in characteristic `p`

(Lemmas `6.1–6.5.`) Let `A ≅ k[[λ]]` with fraction field `K` and `ρ` : `G_Σ → GL₂(A)` with `(6.2): ρ ⊗ K̄` irreducible and of type A, `B` or unramified at each `w ∤ p`; `ρ mod λ = ρ_c`; `Σ ⊇` primes above `p` and where `ρ̄` ramifies; `ρ` of type A or `B` exactly where `ρ̄` is; det `ρ = χ`; `ρ|_{D_v} ≅ (χ_1 *`; `0 χ_2`) with `χ_1/χ_2` of infinite order for each `v |` p. Then `W = ad⁰ρ ⊗ K̄` is irreducible (`ρ ⊗ K̄` not dihedral); `ρ ⊗ K̄|_{Gal(F_Σ/F⁺)}` is neither reducible nor dihedral (`F⁺ ⊆ F′` the real subfield of the splitting field of det `ρ` with `μ_{p^∞}`); there are `σ ∈ Gal(F_Σ/F′)` and `σ ∈ Gal(F_Σ/F⁺) ∖ Gal(F_Σ/F′)` whose ρ-eigenvalues have infinite order and lie in `A`; `ρ ⊗ K̄` is irreducible on every finite-index normal subgroup of `Gal(F_Σ/F⁺)`; and there is `N_2` with `λ^{n−(a−N_2)}𝒯_n ⊆ M` for every submodule `M ⊆ 𝒯_n = ad⁰ρ/λⁿ` containing an `m` with `λ^a m ≠ 0`, a `> N_2`.

`(6.2)(i)–(vi)`; characteristic of `K` is p.

An infinite-order ordinary eigenvalue ratio and self-duality of `ad⁰ρ` reduce a hypothetical invariant summand to a quadratic inducing character. The residual local distinguishedness excludes splitting of that quadratic field at the selected p-place; if it is nonsplit, the induced local representation cannot have the assumed ordinary filtration with infinite-order character ratio. This rules out the dihedral decomposition.

Lemma 6.3: finite-order eigenvalues in characteristic `p` on a pro-p image are 1; a unipotent `τ` and trace comparisons force triangularity otherwise; Hensel gives eigenvalues in `A`.

Lemma `6.5: A[G]x ⊇ λ^r ad⁰ρ` with `r = r(x)` continuous, hence bounded.

**Checks.**

- Finite-order eigenvalues on the pro-p subgroup used in Lemma 6.3 are 1 in characteristic `p`; finite-order eigenvalues of the whole Galois group need not have p-power order. Test dihedrality after extension to `K̄`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §6, `(6.1)–(6.2)` and Lemmas 6.1–6.5, pp. 88–91 (Numdam PDF pp. `85–88).`)

*Needs:* §3.6; §3.1.

### 4.11 Auxiliary prime sets in characteristic `p`

(Proposition 6.10, with `(6.3)–(6.11)` and Lemmas `6.7–6.9.`) With `ρ` as in §4.10 and `σ ∈ Gal(F_Σ/F′)` whose ρ-eigenvalues lie in `A` and have infinite order, there is `r = r(ρ)` such that for every `m > 0` there are infinitely many sets `Q = {w_1, …, w_r}` with `Nm(w_i) ≡ 1 mod p^m, ρ(Frob_{w_i}) ≡ ρ(σ) mod λ^m`, and `lim_n H_{Σ_Q}(𝒯_n) ≅ (K/A)^r ⊕ X_{Σ_Q}` with `#X_{Σ_Q} < C(σ, r)` independent of `Q (Σ_Q = Σ_0 ∪ Q)`.

(6.2); the Selmer groups `H_Σ(𝒯_n)` use `L_w = ker(H¹(D_w, 𝒯_n) → H_w(𝒯_n))` with `H_v` the ordinary condition at `v | p` and `H_w` the type-A/B condition at ramified `w ∤` p.

Wiles' formula `#H_Σ(𝒯_n)/#H*_Σ(𝒯_n) = h_∞∏h_w (6.3)`([W1, Proposition 1.6], generalised to totally real `F`; Poitou–Tate, ArithmeticGaloisDuality §R02.4.4 and §R02.5.1); `h_∞ ≍ #(A/λⁿ)^{2[F:ℚ]}, h_w ≍ 1` at type `A/B` places, `h_v ≍ #(A/λⁿ)^{−2[F_v:ℚ_p]} (6.4)–(6.8)`, whence `#H_Σ ≍ #H*_Σ·∏_{w∈Σ′}#H⁰(D_w, 𝒯_n(1)) (6.9)`.

`(6.10)–(6.11)` and Lemmas 6.7–6.8: the direct limits are `(K/A)^r ⊕` finite.

Lemma 6.9 (after [W1, Proposition 1.11]`): λ^{N_1}` kills `H¹(E_∞/F, 𝒯_n(1))` — a measure argument on the map `σ ↦` lim `σ^{1+p^n}` with Lemma 6.4.

Choose primes `w_j` inductively by Chebotarev (GlobalGaloisDeformations §§5.6–5.7) so that each kills a `(K/A)` summand of lim `H*`: after `r` steps lim `H*_{Σ_r}` is bounded, and (6.9) gives the claim.

**Checks.**

- The coefficients are the characteristic-p DVR A: GlobalGaloisDeformations §5.6's finite-coefficient Taylor–Wiles primes are used only for the Chebotarev choice; the counting is done here.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §6, Lemma 6.9, p. 95 (Numdam PDF page 92; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §6, Proposition 6.10, p. 97 (Numdam PDF page 94; printed page `=` PDF page `+ 3).`)

*Needs:* §4.10; ArithmeticGaloisDuality:§R02.5.1; GlobalGaloisDeformations:§§5.6–5.7; ArithmeticGaloisDuality:§R02.4.4.

### 4.12 The map `ψ(𝒟, 𝔭)` from deformation to Hecke rings

(Lemma 7.1, Remark 7.2.) Let `F` have even degree, `𝒟` a deformation datum and `𝔭 ⊆ T_𝒟` nice for `𝒟` (so `𝔭` comes from `T^min_𝒟`; A `=` the normalisation of `T^min_𝒟/𝔭 ≅ k′[[λ]]`). With `Λ̃_𝒪 = 𝒪′[[W_1, …, W_m]]` finite free over `Λ_𝒪 (7.2)`, tilded rings `R̃ = R ⊗_{Λ_𝒪} Λ̃_𝒪` and localisations-completions at primes `𝔭̃` over `𝔭`, there is a natural local surjection `ψ(𝒟, 𝔭)` : `(R̃^min_𝒟)_{𝔭̃} ↠ (T̃^min_𝒟)_{𝔭̃}` with trace `ρ^min(Frob_ℓ) ⊗ 1 ↦ T(ℓ) ⊗ 1` and det `ρ^min(Frob_ℓ) ⊗ 1 ↦ S(ℓ)Nm(ℓ) ⊗ 1` for `ℓ ∉ Σ`; the same holds for the auxiliary data `𝒟_Q`.

`𝔭` nice for `𝒟`.

For each minimal `Q ⊆ 𝔭̃` and each two-dimensional prime `𝔔` of the normalisation `B` of `T̃/Q` over a regular point of `Λ̃_{𝒪,P}`, Proposition 2.15 lifts the pseudo-deformation to (`𝒪_j, Σ, c`, ℳ)-minimal deformations `ρ_j`, giving maps from `R̃^min`.

Injectivity of the completed products `(7.4)–(7.5)` and Proposition 2.11 make `R̃^ps → T̂_{𝔭_i}` factor through `R̃^min`; the image in `∏(T̃^min)_{𝔭̃}/Q` is that of `(T̃^min)_{𝔭̃}`, giving the surjection (7.6).

**Checks.**

- There is no natural map `R^min → T^min: ψ` exists only after localising and completing at a nice prime.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §7, Remark 7.2, p. 103 (Numdam PDF page 100; printed page `=` PDF page `+ 3).`)

*Needs:* §4.2; §3.12; §3.10; §3.23; §3.17.

### 4.13 `R = T` at nice primes of minimal level

(Proposition 7.3.) Let `F` be totally real of even degree, `𝒟 = 𝒟_c` and `𝔭 ⊆ T_𝒟` nice for `𝒟`. Then (i) `ψ(𝒟, 𝔭)` : `(R̃^min_𝒟)_{𝔭̃} → (T̃^min_𝒟)_{𝔭̃}` is an isomorphism and `(R̃^min_𝒟)_{𝔭̃}` is a complete intersection over `Λ̃_{𝒪,P}` and reduced; `(ii) M̃_{𝒟,𝔭̃}` is a free `(T̃^min_𝒟)_{𝔭̃}`-module.

`F` of even degree; `𝒟 = 𝒟_c (Σ = Σ_c, ℳ = ℳ_c = Σ_c ∖ 𝒫)`; `𝔭` nice.

Patching data: `N^{(0)} = im(M̃_𝒟 → (M̃_𝒟)_{𝔭̃}/P) (7.7)`; `R^{(0)}, R^{tr(0)}` as images in `(R̃^min)_{𝔭̃}/(𝔭̃F_0, P) (7.8)–(7.9)` with `F_0` the Fitting ideal; for odd `N` the sets `Q_N` of Proposition 6.10 give `R^{(N)}_a, R^{tr(N)}_a (7.11)–(7.13)` and `M^{(N)}_a (7.10)`, with `s_i = δ_{w_i} − 1` (Lemma 3.21).

Verification of `(5.2)–(5.11)`: generator bounds from dim `H¹(F_{Σ∪Q}/F, ad⁰ρ_c)` and Lemma 2.10; freeness `(5.10vi)` via Lemma 3.19 after auxiliary Γ₁(ℓ_1⋯ℓ_s)-level at primes chosen by `(7.15)–(7.16)` with Lemma 3.29 and Corollary 3.6; the element `x^{(N)}` of (5.11) built in `(7.21)–(7.25)`.

Proposition 5.9 gives `R^{(0)} ⊗ K` a complete intersection and Proposition 5.8 makes `M^{(0)} ⊗ K` free; with Lemma `5.2 (R^{tr(0)} ⊗ K ≅ R^{(0)} ⊗ K)` and the surjection to `(T̃^min)_{𝔭̃}/P, ψ mod P` is an isomorphism; freeness of `M̃` over `Λ̃_{𝒪,P}` lifts this to `ψ` and gives `F_0 = 0 ((7.27)–(7.28))`.

**Checks.**

- Complete intersection and freeness are proved at the localisation-completion at `𝔭̃`, not globally.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §7, p. 103 (Numdam PDF page 100; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §7, p. 106 (Numdam PDF page 103; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §7, Proposition 7.3, p. 111 (Numdam PDF page 108; printed page `=` PDF page `+ 3).`)

*Needs:* §4.12; §4.9; §4.11; §2.7; §3.22; §3.25; §3.24; §3.8; §3.4; §4.20 (the numerical complete-intersection criterion).

### 4.14 Congruence maps between levels

(Skinner–Wiles §8.2, Lemma 8.2 and (8.1).) For deformation data `𝒟_c = 𝒟_0 ≤ 𝒟_1 ≤ ⋯ ≤ 𝒟_n = 𝒟` (strict steps adding one place `w_i`, either to `Σ` or removing it from `ℳ`) and `𝔭` nice: `R_i = (R̃^min_{𝒟_i})_{𝔭̃}` and `T_i = (T̃^min_{𝒟_i})_{𝔭̃}`. The modules `M_i` and `M⁺_i` are finite free over `Λ̃_{𝒪,P}`, with `M_i^{2^s} ≅ Hom(M⁺_i, Λ̃_{𝒪,P})^{2^s}` (Lemma 8.2); and there are T_i-maps `Φ_i` : `M_{i−1}^{2^s r_i} → M_i^{2^s}, Φ̂_i, Ψ_i, Θ_i (r_i = 2` or 3) with `Φ_i` injective with Λ̃-free cokernel, `Φ̂_i` surjective, `Θ_i∘Φ̂_i∘Φ_i∘Ψ_i =` (unit·η_i `*`; `0 A_i`) with det `A_i` not a zero divisor in `T_0`, and `η_i = (q_i − 1)(T(ℓ_i)² − S(ℓ_i)(q_i + 1)²), (q_i − 1)(q_i + 1)` or `(q_i − 1)` according as `w_i ∈ Σ_i ∖ Σ_{i−1}, w_i ∈ ℳ_{i−1}` with `χ|_{I_{w_i}} = 1`, or with `χ|_{I_{w_i}} ≠ 1 (q_i = Nm(ℓ_i))`.

`𝔭` nice for `𝒟`.

Lemma 8.2 from Lemma 3.29 at auxiliary primes `r_1, …, r_s` and Proposition 3.3 with (3.17).

`Φ_i = 2^s` copies of `f ↦ f + α_i g (+ α_i² h)`, with kernels and cokernels killed by `T(ℓ) − 1 − Nm(ℓ)` (Lemmas `3.26–3.28`), hence trivial after localising at the non-Eisenstein `𝔭 (8.1a)`.

Explicit `Ψ_i, Θ_i` and the 3×3 matrix give the determinant `(q_iS(ℓ_i)^{−2})^{2^s}η_i^{2^s−1} (8.1b)`.

**Checks.**

- `η_i` is the level-raising congruence factor at `w_i`.
- Lemma 8.2 gives weight-space freeness of `M_i,M_i⁺`; no freeness of `R_i` or `T_i` is used in this congruence-map input.
- Identifying the all-level rings is the conclusion of §4.15, and cannot be used as an input to these maps.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §8.2, Lemma 8.2, p. 113 (Numdam PDF page 110; printed page `=` PDF page `+ 3).`)

*Needs:* §2.9; §2.10; §3.25; §2.8; PadicFamilies:§5.6.

### 4.15 `R = T` at nice primes (all levels)

(Proposition 8.1.) If `𝔭 ⊆ T_𝒟` is nice for `𝒟 (F` of even degree), then `ψ(𝒟, 𝔭)` : `(R̃^min_𝒟)_{𝔭̃} → (T̃^min_𝒟)_{𝔭̃}` is an isomorphism.

`F` of even degree; `𝔭` nice for `𝒟`.

For `𝒟 = 𝒟_c` this is Proposition 7.3 (printed as 'Proposition 7.2' on p. 119). In general, compose the chain `𝒟_c ≤ ⋯ ≤ 𝒟` of Skinner–Wiles §8.2 (§4.14); Lemma 8.4 cuts by a regular sequence `y_1, …, y_{m−1}` to a DVR `C (8.3)`.

`T′_0` is a reduced complete intersection over `C`, so `ℓ_C(H_0/H_0²) = ℓ_C(C/δ(G_0)) (8.4)` by de Smit–Rubin–Schoof Criterion `I` (§4.20).

The congruence maps give `ℓ_C(C/(δ∘α)(G_n)) ≥ ℓ_C(C/δ(G_0)) + ℓ_C(C/δ(η)) (8.5)`; deformation theory gives `ℓ_C(H_n/H_n²) ≤ ℓ_C(H_0/H_0²) + ℓ_C(C/δ(η)) (8.7)`, via `Hom_C(R′_n, C ⊕ εC/λ^m) ↪ H¹(F_Σ/F, ad ρ/λ^m) (8.8)` and the local count (8.10).

Hence `ℓ_C(H_n/H_n²) ≤ ℓ_C(C/(δ∘α)(G_n))`; DRS Criterion `I` makes `R′_n → T″_n` an isomorphism of complete intersections, and faithful flatness over `B` gives `ψ(𝒟, 𝔭)`.

**Checks.**

- This is the 'R `=` T' of the paper: it holds only after localisation and completion at a nice prime, and it uses the numerical (Wiles–Lenstra–de Smit–Rubin–Schoof) criterion, not an explicit presentation.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §8.4, p. 119 (Numdam PDF page 116; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §8.4, p. 120 (Numdam PDF page 117; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §8.4, end of the proof, p. 122 (Numdam PDF page 119; printed page `=` PDF page `+ 3).`)

*Needs:* §4.13; §4.14; §4.12; §3.5; §4.20 (the numerical complete-intersection criterion); ArithmeticGaloisDuality:§R02.5.1.

### 4.16 Good pairs, nice primes and property `(P)` for irreducible `ρ₀`

`(F, ρ₀)` is a good pair if (i) `d/2 > 2 +` 2t `+ 7·#ℳ₀, (ii) d_i > 2 +` 2t `+ 7·#ℳ₀` for `i = 1, …, t (d_i = [F_{v_i}` : `ℚ_p]`), and (iii) (H_even) and `(H_def)` hold (4.1). A prime `q` of `R_𝒟` is pro-modular if it is the inverse image under `r_𝒟` of a prime of `T_𝒟` (§4.1); a deformation over a domain is pro-modular if its kernel is. A prime `𝔭` of `R_𝒟` is nice for `𝒟` if (4.2): (i) `𝔭` is a dimension-one prime containing `p`; `(ii) ρ_𝒟 mod 𝔭` is not dihedral and det `ρ_𝒟 mod 𝔭` has finite order; (iii) for each `v_i, (ρ_𝒟 mod 𝔭)|_{D_i} ≅ (ψ^{(i)}_1 *`; `0 ψ^{(i)}_2`) with `ψ^{(i)}_1/ψ^{(i)}_2` of infinite order; `(iv) 𝔭` is the inverse image of a prime of `T_{𝒟₀}`. A prime with (i)–(iii) and `ρ_𝒟 mod 𝔭` of type `𝒟₀` is merely nice. Property `(P)` for `𝒟`: if `𝔭` is nice for `𝒟`, every prime `q ⊆ 𝔭` is pro-modular.

The good-pair inequalities depend only on `(F, ρ₀)`, not on `Σ`; the general component argument additionally needs the displayed bound on `#(Σ∖𝒫)` in §4.17.

Pro-modularity of `q` is equivalent to a map `θ_q` : `T_𝒟 → R_𝒟/q` with `θ_q ∘ r_𝒟` the reduction modulo `q`.

Provide the following operations and compatibility statements.

- `IsGoodPairIrr`: The conditions (4.1)(i)–(iii).
- `IsNiceIrr`: The conditions `(4.2)(i)–(iv)` for `𝒟`.
- `PropertyP`: Property `(P)` for a datum.
- `isNiceIrr_proModular`: A prime nice for `𝒟` is pro-modular (condition `(iv)`).

**Checks.**

- `isGoodPairIrr_base_change`: `d_L/2 > 2 + 7·#Σ_L` and `d_v > 2 + 7·#Σ_L` imply `(4.1)(i)–(ii)` for `L`.
- `isNiceIrr_dimension_one`: A prime `𝔭` with `dim(R_𝒟/𝔭)=1` is not maximal; if every irreducible component of Spec `R_𝒟` has dimension at least 2, it is not minimal either. Do not confuse quotient dimension with height.
- `isNiceIrr_not_dihedral`: A prime whose quotient representation is dihedral is not nice, whatever its dimension.
- `merelyNice_vs_nice`: For the quotient `R_𝒟 ↠ R_{𝒟₀}`, the inverse image of a merely nice prime of `R_{𝒟₀}` is merely nice in `R_𝒟`, since the quotient rings and their representations agree. A general prime cannot be pushed through a quotient unless it contains its kernel.
- Compare with §4.2: one property `(P)` replaces `(P1)` and `(P2)`, and there is no p-adic L-function or class-group condition.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §4, (4.1) and pro-modular primes, p. 198 (Numdam PDF page 15; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §4, (4.2) and property `(P)`, p. 199 (Numdam PDF page 16; printed page `=` PDF page `+ 183).`)

*Needs:* §4.1; §3.34; §3.30.

### 4.17 Every prime of `R_𝒟` is pro-modular (Proposition 4.1, irreducible `ρ₀`)

Let `(F,ρ₀)` be a good pair and `𝒟=(𝒪,Σ,ℳ)` a deformation datum. Assume `d/2>2+2t+7#(Σ∖𝒫)`, and, if `ρ₀` is dihedral, assume that every finite-determinant dihedral locus encountered for the auxiliary data `𝒟′` has dimension at most `d/2`. For projective image of order at least 6 there is one residual inducing field; for projective Klein four image take the union over its three fields. Require the bound for every constituent: it holds when all inducing fields are totally real, not universally for a CM constituent. If property `(P)` holds for each `(𝒪,Σ′,ℳ′)` with `ℳ⊆ℳ′` and `Σ′⊆Σ`, then every prime of `R_𝒟` is pro-modular. For `Σ=Σ₀` the displayed numerical bound specializes to the minimal good-pair bound.

The component proof requires both the displayed bound on `Σ∖𝒫` and the bound on every dihedral locus that it encounters. In §5.6 the chosen extension has `d_L/2>2+7#Σ_L`, which implies the required bound since `#𝒫_L=t_L`.

`𝒟 = 𝒟₀`, step one: `T_{𝒟₀}` is finite torsion-free over `Λ_𝒪` (Lemma 3.1), so for a minimal prime `Q` of `R = T_{𝒟₀}/(p, T_1, …, T_{δ_F}), R/Q` is integral over `k[[Y^{(i)}_j]]` and has dimension `d`; by the assumed dihedral-locus bound `ρ^mod mod Q` is not dihedral, and infinitely many dimension-one primes avoiding the `Y^{(i)}_1` give a prime nice for `𝒟₀ ((3.2)(vi))`.

Step two: by `(P)` every component of Spec `R_{𝒟₀}` through a nice prime is pro-modular, so `C^mod_{𝒟₀} ≠ ∅`.

Step three: if `C′ = C_{𝒟₀} ∖ C^mod_{𝒟₀} ≠ ∅`, Proposition 2.1 and Corollary A.2 (§4.3) give `C_1 ∈ C^mod, C_2 ∈ C′` meeting in `Q` of dimension `d −` 2t `+ δ_F − 3#ℳ₀`; a minimal `Q_1` over (`Q, p`, det `ρ(γ_i) − 1`) has dimension `≥ d −` 2t `− 3#ℳ₀ − 1 > 1 + d/2` by (4.1), so `ρ mod Q_1` is not dihedral by the assumed dihedral-locus bound; `Q_1` is pro-modular; if `Q^mod_1` contained all `Y^{(i)}_j` then `d_i ≤` 2t `+ 3#ℳ₀ + 1`, contradicting `(4.1)(ii)`; a dimension-one `𝔭 ⊇ Q_1` avoiding the `Y^{(i)}_1` is nice, so `C_2` is pro-modular by step two: contradiction.

General `𝒟`: a nice prime of `R_𝒟` comes from a nice prime of `R_{𝒟₀}`, and composing `θ` with `T_𝒟 ↠ T_{𝒟₀}` shows it is nice for `𝒟`, so `(P)` makes its components pro-modular. For a minimal prime `Q` of `R_𝒟`, choose `τ_v` and a basis at each `v ∈ Σ ∖ 𝒫` and let `I_2 = (p`; `a_v − 1, b_v − u_v, c_v, d_v − 1`; det `ρ_𝒟(γ_j) − 1`); a minimal `Q_2` over `(Q, I_2)` has dimension `≥ d −` 2t `− 3#ℳ − 4#(Σ ∖ 𝒫) ≥ d/2 + 1` by the strengthened general-level inequality, so `ρ mod Q_2` is not dihedral by the assumed dihedral-locus bound, is of type `𝒟₀`, and lies in a nice prime; hence `Q` is pro-modular.

**Checks.**

- Check each inequality in the arithmetic examples: step three's bound from `(4.1)(i)`, the contradiction with `(4.1)(ii)`, and that (4.1) alone does not give the bound of the general step, which is why the statement adds the general-level inequality.
- No `R = T` isomorphism is claimed here; that is property `(P)`.
- With projective Klein four residual image, the dimension of the full dihedral locus is the maximum of the dimensions of its three constituents; bounding one chosen inducing field does not suffice.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §4, Proposition 4.1, p. 199 (Numdam PDF page 16; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §4, proof of Proposition 4.1, step three, p. 200 (Numdam PDF page 17; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §4, proof of Proposition 4.1, step three, p. 201 (Numdam PDF page 18; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §4, proof of Proposition 4.1, general `𝒟`, p. 202 (Numdam PDF page 19; printed page `=` PDF page `+ 183).`)

*Needs:* §4.16; §3.29; §3.30; §4.3; §3.34; PadicFamilies:§5.7.

### 4.18 Selmer groups and auxiliary primes in characteristic `p` (Lemma 7.1, Proposition 7.2)

Let `ρ` : `G_Σ = Gal(F_Σ/F) → GL₂(A)`, `A ≅ k[[λ]]`, with `ρ ⊗ K̄` irreducible and not dihedral, `ρ mod λ = ρ₀, Σ ⊇ 𝒫 ∪` {ramified places of `ρ₀}, ρ` ramified at `w ∤ p` exactly where `ρ₀` is and then `ρ|_{I_w} ≅ (1 *`; 0 1), det `ρ =` det `ρ₀`, and `ρ|_{D_v} ≅ (χ^{(v)}_1 *`; `0 χ^{(v)}_2`) with `χ^{(v)}_1/χ^{(v)}_2` of infinite order for `v |` p. Let `F′` be the splitting field of det `ρ` with all p-power roots of unity adjoined and `F⁺` its fixed field under `z_1`. (Lemma 7.1.) There are `σ ∈ Gal(F_Σ/F′)`, and `σ ∈ Gal(F_Σ/F⁺) ∖ Gal(F_Σ/F′)`, such that the eigenvalues of `ρ(σ)` lie in `A` and have infinite order. With `𝒰` the space of `ρ`, the filtrations `𝒰_{1,i}` at `v_i` and `𝒰^w_1` at ramified `w ∤ p, 𝒯 = {f ∈ ad ρ` : trace `f = 0}, 𝒯^{ord}_{v_i}, 𝒯^w` and `𝒯_n = 𝒯/λⁿ`, put `H_{v_i}(𝒯_n) = H¹(I_i, 𝒯_n/𝒯^{ord}_{n,i}), H_w(𝒯_n) = H¹(I_w, 𝒯_n/𝒯^w_n) (0` if `ρ₀` is unramified at `w), L_w = ker(H¹(D_w, 𝒯_n) → H_w(𝒯_n)`) and `H_Σ(𝒯_n)` the classes locally in `L_w` for all `w ∈ Σ`. (Proposition 7.2.) For `σ` as in Lemma `7.1(i)` there is `r = r(ρ)` such that for every `m > 0` there are infinitely many `Q = {w_1, …, w_r}` with (i) `Nm(w_i) ≡ 1 mod p^m, (ii) ρ_𝔭(Frob_{w_i}) ≡ ρ_𝔭(σ) mod λ^m`, and (iii) `lim_n H_{Σ_Q}(𝒯_n) ≅ (K/A)^r ⊕ X_{Σ_Q}` with `Σ_Q = Σ₀ ∪ Q` and `#X_{Σ_Q} < C(σ, r)` depending only on `σ` and `r`.

A is a characteristic-p discrete valuation ring; `K =` Frac A. Assuming `ρ` not dihedral replaces the proof of non-dihedrality needed in the reducible case.

Lemma 7.1 exactly as Skinner–Wiles 1999 Lemma 6.3 (§4.10); here `ρ` is assumed non-dihedral from the start.

Proposition 7.2 exactly as Skinner–Wiles 1999 Proposition 6.10 (§4.11): Wiles' Selmer formula (ArithmeticGaloisDuality §R02.4.4 and §R02.5.1) and Chebotarev (GlobalGaloisDeformations §§5.6–5.7).

**Checks.**

- The Selmer groups use the ordinary line `𝒰_{1,i}` at `v_i` and the unipotent line at ramified `w ∤ p`, matching type `𝒟₀`.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §7, the assumptions on `ρ`, p. 207 (Numdam PDF page 24; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §7, Lemma 7.1, p. 208 (Numdam PDF page 25; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §7, Proposition 7.2, p. 209 (Numdam PDF page 26; printed page `=` PDF page `+ 183).`)

*Needs:* §4.10; §4.11; ArithmeticGaloisDuality:§R02.5.1; GlobalGaloisDeformations:§§5.6–5.7.

### 4.19 `R = T` at nice primes and property `(P)` (Propositions `8.1–8.2`)

Assume (H_even) and `(H_def)`. (Proposition 8.1.) If `𝔭 ⊆ T_{𝒟₀}` is nice for `𝒟₀`, then (i) `ψ(𝒟₀, 𝔭)` : `(R̃^min_{𝒟₀})_𝔭̃ → (T̃^min_{𝒟₀})_𝔭̃` is an isomorphism and `(R̃^min_{𝒟₀})_𝔭̃` is a reduced complete intersection over `Λ̃_{𝒪,P}`; `(ii) M̃_{𝒟₀,𝔭̃}` is a free `(T̃^min_{𝒟₀})_𝔭̃`-module. Here the integral closure of `T^min_𝒟/𝔭` is `A ≅ k′[[λ]]`, finite over `Λ_𝒪 = 𝒪[[z_1, …, z_m]]` with `z_i ↦ λ^{r_i}u_i (r_i > 0, u_1` a unit), `Λ̃_𝒪 = 𝒪′[[W_1, …, W_m]] →` A by `W_1 ↦ λ, W_i ↦ 0, Λ_𝒪 → Λ̃_𝒪` by `z_1 ↦ W_1^{r_1}ũ_1, z_i ↦ −W_i + W_1^{r_i}ũ_i`, tildes denote base change to `Λ̃_𝒪, 𝔭̃` a prime above `𝔭`, and `P = (π, W_2, …, W_m)`. (Proposition 8.2.) For every datum `𝒟` and every prime `𝔭 ⊆ R_𝒟` nice for `𝒟, ψ(𝒟, 𝔭)` is an isomorphism and property `(P)` holds for `𝔭`.

The map `ψ(𝒟, 𝔭)` is Skinner–Wiles 1999's (§4.12) with the irreducible data.

Rings and modules: `N^{(0)} = im(M̃_𝒟 → (M̃_𝒟)_𝔭̃/P)` and `R^{(0)} = im(R̃^min_𝒟 → (R̃^min_𝒟)_𝔭̃/(𝔭̃F_0, P))` with `F_0` the Fitting ideal of `(M̃_𝒟)_𝔭̃`; for odd `N` the sets `Q_N` of Proposition 7.2 (§4.18) give `M^{(N)}_a` over `A_a = A[[s_1, …, s_r]]/(s_i^{a+1}), s_i = δ_{w_i} − 1`, and `R^{(N)}_a` over `B_a` via `t_i ↦ (trace(ρ_{𝒟_Q}(σ_{w_i})) − 2) ⊗ 1`, with `R^{(N)}_0 = R^{(0)}, M^{(0)} = ⊕_{i=1}^{2^r} N^{(0)}` and `M^{(N)}_0 = M^{(0)} (8.1)`.

Verify `(6.2)–(6.8)`: the number of generators is bounded by `dim_k H¹(F_{Σ∪Q}/F, ad⁰ρ₀)`; `(6.7)(vi)` from Skinner–Wiles 1999 Lemma 3.19 (§2.7) after shrinking `U^min_{𝒟_Q}`; `d(a) = d_1(a)d_1(1) + 1`; `(6.5ii)` from Proposition 7.2(iii) and `𝔛_Q = Hom_A((𝔭̃^min_{𝒟_Q}/(𝔭̃^min_{𝒟_Q})², P), λ^{−n}A/A) ≅ H_{Σ_Q}(𝒯_n)`; `x^{(N)}` as in Skinner–Wiles 1999 §7; Lemma 3.5(iii) (§3.35) for compatibility of the `A_a-` and B_a-structures.

Proposition 6.1 (Skinner–Wiles 1999 Propositions 5.8–5.9 with `R^{tr} = R`: the abstract characteristic-p patching theorem proved in §4.20, applied as in §4.9): `R^{(0)} ⊗_A K` is a complete intersection and `M^{(0)} ⊗_A K` is free over it.

Hence `(T̃^min_{𝒟₀})_𝔭̃^s → (M̃_{𝒟₀})_𝔭̃ (8.2)` is an isomorphism, `(T̃^min_{𝒟₀})_𝔭̃` is free over `Λ̃_{𝒪,P}, (8.3)` is an isomorphism, `F_0 = 0`, and `(R̃^min_{𝒟₀})_𝔭̃` is a complete intersection; `T^min` is reduced (Lemma `3.5(ii)`).

Proposition `8.2: ψ(𝒟, 𝔭)` is an isomorphism for every `𝒟` by the congruences of Skinner–Wiles 1999 §3.8 (§4.14), and property `(P)` follows as in their Proposition 8.4 (§4.6).

**Checks.**

- The rings are localised and completed at `𝔭̃` and the isomorphism is after base change to `Λ̃_𝒪`; a formalisation must keep both, as in §4.15.
- At the identity matrix the parameter is `tr(I₂)−2=0`; putting `2I₂` inside the trace instead gives `−2`.
- For diagonal auxiliary inertia `(δ,δ⁻¹)` the parameter is `δ+δ⁻¹−2`, matching the B_a-action.

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §6, Proposition 6.1, p. 207 (Numdam PDF page 24; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §8, opening, p. 209 (Numdam PDF page 26; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §8, verification of `(6.2)–(6.8)`, p. 212 (Numdam PDF page 29; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §8, Proposition 8.1, p. 213 (Numdam PDF page 30; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §8, Proposition 8.2, p. 214 (Numdam PDF page 31; printed page `=` PDF page `+ 183).`)

*Needs:* §4.18; §4.20 (characteristic-p patching); §4.12; §4.14; §4.6; §2.7; §3.35; §4.16.

### 4.20 Characteristic-p patching and the numerical criterion

Use DeformationAndDerivedPatchingAlgebra §§5.2–5.5 for compatible cutoff extraction, the limit actions and the regular-base depth comparison. Its [§5.6 free-module consumer](../DeformationAndDerivedPatchingAlgebra/README.md#patching-surjection-iso), `patching_surjection_iso`, supplies `R≃T`, module freeness and a complete-intersection presentation when the given surjection and faithful nonzero Hecke module admit that theorem's independent finite-level data: equal numbers of scalar and presentation variables, local scalar lifts into the regular presentation ring, and positive-rank free modules over the specified group-ring quotients with the prescribed augmentation quotient. No transition maps between original auxiliary levels are required. The theorem includes `k[[T]]` coefficients. In the general Skinner–Wiles system below the ring action is only through `B_N` while the module has an `A_N`-action, and the free conclusions occur after inverting `T`. These hypotheses require the separate comparison below rather than an application of the free-module consumer to the original levels.

The numerical criterion applies in §4.15 after its DVR cut, with the compatible augmentations, augmentation ideals and congruence ideal stated below.

Prove [de Smit–Rubin–Schoof, Criterion I](https://www.mat.uniroma2.it/~schoof/ci.pdf) in its full complete-DVR form. Let `C` be a complete DVR and `R↠T` a surjection of complete Noetherian local C-algebras with compatible surjective augmentations to `C`, with `T` finite flat over `C`. Put `H_R=ker(R→C)`, `G_T=Ann_T(ker(T→C))`, `δ:T→C` and `η_T=δ(G_T)`, and assume `η_T≠0`. Then `ℓ_C(H_R/H_R²)≥ℓ_C(C/η_T)`, with equality exactly when `R→T` is an isomorphism between complete intersections over `C`. Thus the opposite weak inequality suffices for the isomorphism. This includes the case with `R` finite and `T` a reduced complete intersection used in the arithmetic argument; the general criterion allows an arbitrary complete Noetherian `R` and finite flat `T`. (Criterion I, Introduction, author PDF p. 1; proof in §3, pp. 10–11; in Modular Forms and Fermat's Last Theorem, Springer, 1997.)

Suggested.lean states Criterion I as `numerical_completeIntersection_criterion`. Its predicate `IsRelativeCompleteIntersection` means a presentation by a regular sequence in a finite-variable power-series algebra over `C`.

Skinner–Wiles characteristic-p patching over `k[[T]]`, with its data, all axioms `(5.1)–(5.11)`, and the conclusions of Lemma 5.6 and Propositions 5.7–5.9. Let `k` be a finite field of characteristic `p`, `A = k[[T]]` with fraction field `K`, and `𝓛 = {0} ∪ {N_j : j≥1}`, where the `N_j` are strictly increasing positive odd integers, and `n ≥ 1`; Set `A₀=B₀=A`. For each positive odd `N∈𝓛`, define `A_N = A[[s_1, …, s_n]]/(s_i^{N+1})` and `B_N = A[[t_1, …, t_n]]/(t_i^{(N+1)/2}) ⊆ A_N` via `t_i ↦ s_i²/(1+s_i) = (1+s_i)+(1+s_i)⁻¹−2`. A patching datum is: rings `R^{(N)} = A[[x_1, …, x_m]]/𝔞^{(N)}` (`m` independent of `N`) finite free over `A` with `𝔞^{(N)} ⊆ (x_i)`, surjections `R^{(N)} ↠ R^{(0)}`, B_N-algebra structures, and for `a=0` or odd `1≤a≤N`, rings `R^{(N)}_a` with `(5.2)–(5.5)` (`𝔭^{d(a)} = 0` in `R^{(N)}_a, 𝔭/𝔭² ≅ Aⁿ ⊕ Tor` with `Tor` bounded independently of `N` and `a`); trace subrings `R^{tr(N)} = A[[y_1, …, y_m]]/𝔟^{(N)}` with `(5.6)–(5.8)` (the cokernel of `𝔮/𝔮² → 𝔭/𝔭²` bounded independently of `N`); modules `M^{(N)}` free over `A` of rank `r·rank_A A_N`, compatible over `A_N`, with quotients `M^{(N)}_a` satisfying `(5.9)–(5.10)` (in particular `M^{(N)}_a ⊗ K` free over `A_a ⊗ K` with (s_i)-coinvariants `M^{(0)} ⊗ K`, and `z·M^{(0)} ⊆ M^{(N)}_0` for a fixed `z` with `ord_T(z mod 𝔮^{(0)}) ≠ 0`); and `x^{(N)} ∈ R^{tr(N)}` annihilating `ker(M^{(N)}_a/(s_i) ↠ M^{(N)}_0)` with `ord_T(x^{(N)} mod 𝔮^{(N)}) = t` independent of `N` (5.11).

Prove the abstract characteristic-p extraction, freeness and complete-intersection conclusions of SW99 Lemma 5.6 and Propositions 5.7–5.9 for precisely this datum. Supply the indicated augmentation ideals `H_R` and `G_T` and congruence map `δ` of de Smit–Rubin–Schoof Criterion `I` when using the numerical criterion: the compatible augmentations `R→C` and `T→C` are part of the data, `H_R=ker(R→C), G_T=Ann_T(ker(T→C))`, and `δ:T→C`. The length inequality is asserted when the displayed lengths are finite. These are mathematical existence and comparison theorems. Their arithmetic verification is §4.8; their generic-fibre applications are §4.9. The stronger Cohen–Macaulay connectedness and intersection theorem is proved in §4.3 from SW99 Appendix A.1–A.2.

**Checks.**

- The substitution `t=s²/(1+s)` starts at degree two, fixing the cutoff `(N+1)/2` for positive odd `N`; its linear term is zero.
- At `N=0` both rings equal `A`, with identity inclusion. Applying the positive-odd formula with natural-number division would give exponent zero and the zero ring, which cannot embed unitally into `A`.
- The modules carry A_N-actions, whereas the deformation rings carry only the displayed B_N-actions; interchanging them adds an unsupported square root.
- Inverting `T` gives the generic-fibre freeness and complete intersection, and does not assert an integral isomorphism before the numerical criterion.
- For the identity augmentation `R=T=C`, both lengths in the criterion are zero and the conclusion is the identity. Dropping compatible augmentations leaves `H_R` and `δ(G_T)` undefined.
- With no auxiliary variables, the supplied free-module consumer gives `R=T=𝒪` and `M=𝒪^s`, `s>0`; rank zero cannot imply faithfulness.
- The map `𝒪[[x]]↠𝒪`, with `M=𝒪`, has a faithful target action and nonzero kernel. It cannot satisfy the consumer's finite-level hypotheses.
- The substitution `t=s²/(1+s)` does not provide the scalar lifts or equal-variable regular presentation required by that consumer.

(Source: SW99 §5, `(5.1)–(5.11)`, pp. 80–82, Lemma 5.6 and Propositions 5.7–5.9, pp. 85–88; de Smit–Rubin–Schoof, Criteria for complete intersections, Criterion I and §3, author PDF pp. 1, 10–11, as used in SW99 §8.)

*Needs:* DeformationAndDerivedPatchingAlgebra §§1.7–1.9, 3.1–3.4, 5.1–5.6; §4.3.

### Examples

The patching parameter is `t=(1+s)+(1+s)⁻¹−2=s²/(1+s)`; in the truncated power-series ring 1+s is a unit. For `s=1` over `ℚ` the value is 1/2. For `s=−1` the rational formula is not defined. Minimal-level good-pair bounds do not imply the general `Σ` bound: `d=40,t=1,#ℳ₀=0` satisfies `2+2t+7#ℳ₀<d/2`, while `d−7#Σ−1=11<21=d/2+1` at `#Σ=4`. Requiring `d/2>2+2t+7#(Σ∖𝒫)` repairs the general component argument. Distinguish surjectivity `R→T`, pro-modularity of a prime, and the completed local `R=T` isomorphism; none can be substituted for either of the others.

### Dependencies

ArithmeticGaloisDuality:§R02.4.4; ArithmeticGaloisDuality:§R02.5.1; ArithmeticGaloisDuality:§R02.5.1; AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1; §4.20 (the numerical complete-intersection criterion); §4.20 (characteristic-p patching); DeformationAndDerivedPatchingAlgebra:§6.6; §4.3 (the Cohen–Macaulay intersection bound); GL2AutomorphicRepresentationsAndTransfer:§§R17.4.8–R17.4.11; §6.14; §4.6a; GlobalGaloisDeformations:§§5.6–5.7; PadicFamilies:§5.8; PadicFamilies:§5.6; PadicFamilies:§5.7; mathlib:IsLocalRing.

## Layer 5: Ordinary modularity lifting

### 5.1 Hypothesis `H` on relative class groups

Hypothesis `H`: there are `0 < ε < 1/4` and `c(ε) > 0` such that for every totally real field `K` and finite set `S` of finite places of `K` there is an imaginary quadratic extension `L/K` with prescribed behaviour at each place of `S` whose relative class group has p-rank at most `c(ε)·[K` : `ℚ]^{1−ε}`.

Stated for a fixed odd prime `p`; Theorem `B` assumes it for all solvable totally real extensions of `F`.

A hypothesis, not a theorem: Skinner–Wiles expect it to be easier than extending Washington's theorem to non-abelian fields.

Provide the following operations and compatibility statements.

- `HypothesisH`: The existence of controlled imaginary quadratic extensions for all `K` and `S`.
- `HypothesisH.mono`: Hypothesis `H` for `F` implies it for totally real extensions (`it` quantifies over all `K`).
- `HypothesisH.extension`: The imaginary quadratic `L/K` with prescribed local behaviour at `S` and relative class group of p-rank `≤ c(ε)[K` : `ℚ]^{1−ε}`.

**Checks.**

- `hypothesisH_trivial_S`: For `S = ∅` the prescribed behaviour is vacuous and only the class-group bound matters.
- `hypothesisH_exponent`: The lower bound `ε>0` makes the ratio `2^{n(1−ε)}d^{1−ε}/(2ⁿd)=2^{−nε}d^{−ε}` tend to zero; `ε<1/4` is the additional range in Hypothesis `H`. Thus the class-group bound grows slower than `2ⁿd`, the degree growth of the tower in Theorem B's proof.
- `hypothesisH_uniform_constant`: Allowing the constant `c` to depend on `K` or `S` gives a weaker predicate and fails the uniform growth estimate: for degrees `2ⁿd`, the normalized bound is `c(ε)(2ⁿd)⁻ε` with the same `c(ε)` for every `n`. Its convergence to zero is the input used by Theorem `B`.
- Theorem `B` is conditional on Hypothesis `H`; nothing downstream may use Theorem `B` unconditionally.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.5, Hypothesis `H`, p. 75 (Numdam PDF page 72; printed page `=` PDF page `+ 3).`)

*Needs:* §4.2.

### 5.1a Abelian preparation with prescribed residue degrees

**Abelian preparation** (`abelianOrdinaryPreparation`). Let `F/ℚ` be totally real abelian, `p` odd, and `𝒟=(𝒪,Σ,c,ℳ)` as in §3.1. For every rational `q≠p` below `Σ` choose a positive integer `m_q` divisible by `f(v/q)·ord(χ(Frob_v))` for each `v|q` at which `χ` is unramified and `ρ_c` is ramified; additional divisibility may be prescribed. There is a finite totally real abelian `E′/ℚ`, split completely at `p`, unramified at these `q`, with local residue degree exactly `m_q` there. It can be chosen so that `E=FE′` has even degree over `F`. Then `E/F` is permissible for `𝒟`, and at every `w∤p` where the restricted `ρ_c` is ramified, either `χ|I_w≠1` or `χ|D_w=1`.

Use ArithmeticGaloisDuality §R02.4.6's finite-character extension theorem. Prescribe the trivial characters at `p` and infinity and unramified characters of exact order `m_q` at the selected `q`. At one additional prime `q₀` outside this set, split completely in `F`, prescribe an unramified quadratic character. If `n` is the least common multiple of these orders, the global character has order `n` or, in the obstructed Grunwald–Wang case, `2n`. Its field is real and cyclic, hence abelian, but its local degrees need not equal its global degree. In particular, the quadratic local prescription at `q₀` forces `[E:F]` even. This construction does not prescribe ramification outside the stated places.

At `v|q`, the residue degree of `E_w/F_v` is `m_q/gcd(m_q,f(v/q))`, so it kills the unramified character when required. Inertia at `Σ∖𝒫` is unchanged, preserving both inertia conditions at `ℳ`, and the p-completions are unchanged. For global nonsplitting, `E/F` is abelian, so `G_E` contains the commutator subgroup of `G_F`; its residual image contains the nonzero unipotent commutators of `ρ_c`. Since `χ|G_E` remains nontrivial at every p-place, the restricted extension cannot split. These facts give all four permissible-extension conditions of §3.3 and the fifth good-pair condition of §4.2.

**Checks.**

- For local degree 8 at 2, the unramified local character takes `16` to `−1`. Grunwald–Wang can require a cyclic global degree 16, with two primes above 2 and local degree 8; global degree 8 with 2 inert is impossible.
- Take `F=ℚ`, `p=17`, `k=𝔽₁₇`, `χ=ω₁₇⁻¹`, `Σ={2,5,17,29}` and the Kummer class of `290=2·5·29`. Its valuation at 2 is 1, while `290=1+17²` is a seventeenth power in `ℚ₁₇` because the seventeenth-power map sends `1+17ℤ₁₇` onto `1+17²ℤ₁₇`. Thus it is a nonzero admissible class. At 2, `χ(Frob₂)=9` has order 8, so an unramified residue degree divisible by 8 is needed. The enlarged global degree permits precisely this local condition.
- Prescribing the trivial character at `p` gives complete splitting, independently of the residue degrees at the other primes. Prescribing the trivial real character makes `E′` totally real.
- If all required `m_q=1`, the local conditions at those primes are splitting conditions; the extra quadratic prescription still makes `[E:F]` even.

(Source: SW99 §4.6, proof of Theorem A, p. 76, first paragraph specifying the properties of `E`; [Conrad, Lifting global representations with local properties](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), Appendix A, Definition A.1 and Proposition A.3, pp. 31–32; [Milne, Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf), VIII §2, Example 2.2 and Theorems 2.3–2.4, pp. 231–232.)

*Needs:* §3.1; §3.3; ArithmeticGaloisDuality:§R02.4.6; ClassFieldTheory Layers 7, 11–12; Chebotarev Layer 10.

### 5.2 Skinner–Wiles Theorem A

Let `F` be a totally real abelian extension of `ℚ, p` an odd prime and `ρ` : `Gal(F̄/F) → GL₂(Q̄_p)` continuous, irreducible and unramified outside finitely many places, with `ρ̄^ss ≅ χ_1 ⊕ χ_2`. If `F(χ_1/χ_2)` is abelian over `ℚ, (χ_1/χ_2)(z) = −1` for every complex conjugation `z, (χ_1/χ_2)|_{D_v} ≠ 1` for every `v | p, ρ|_{D_v} ≅ (ψ^{(v)}_1χ̃_1 *`; `0 ψ^{(v)}_2χ̃_2`) with `ψ^{(v)}_2` factoring through a pro-p group of `F_v` and `ψ^{(v)}_2|_{I_v}` of finite order, and det `ρ = ψε^{k−1}` with `k ≥ 2` and `ψ` of finite order, then `ρ` is the representation of a Hilbert modular newform.

`F` and `F(χ_1/χ_2)` abelian over `ℚ`; `p` odd.

`ρ_1 = ρ ⊗ χ̃_2^{−1}` with `χ = χ_1/χ_2` is, in a suitable lattice, a deformation of type `𝒟 = (𝒪, Σ, c, ∅)` for an admissible `c` (Lemma 2.13 and the local hypotheses); it remains to build `L` as in the Main Theorem.

Use §5.1a to take `E/F` even, permissible and abelian over `ℚ`, with all p-places split and sufficiently divisible unramified residue degrees at the other places in `Σ`. Choose an odd `ℓ∤p·#k^×` below no place of `Σ`, and let `E_n` be the ℤ/ℓ^n-layer of the cyclotomic ℤ_ℓ-extension. Then `#Σ_n, #𝒫_n` stabilise (4.12), and by Washington's theorem the p-parts of the class groups of `E_n(χ)` and `E_n` stabilise (4.13).

Adjoin abelian p-extensions `L_n/E_n` ramified at a set `S_n` of `e_n + c_n + 1` places with `χ(Frob_w) = 1` and `p^{e_n + c_n + 1} | Nm(w) − 1 (4.16)`; congruences of p-adic L-functions give `L_p(L_n, −1, χω) ∈ 𝒪 ∖ 𝒪^× (4.17)`, and dim `H_{Σ_0}(L_n, k) ≤ p^{e_n+2c_n+1}(r_n + e_n + c_n + 1) (4.18)`.

For `n_0` large (4.19) and Waldschmidt's `δ_L ≤ d_L/2, L = L_{n_0}` satisfies `(G) (4.20)`, so the Main Theorem applies.

Verify permissibility and the tame good-pair condition throughout this tower. The `ℓ`-power steps are prime to `p·#imχ`, so restriction preserves the nonzero extension class and distinguished local characters. The abelian p-extensions `L_n/E_n` also preserve nonsplitting by the commutator argument of §5.1a, and preserve the prime-to-p order of every nontrivial `χ|D_v` above `p`. Both parts of the tower are unramified above `Σ∖𝒫`; the unramified characters already killed there stay trivial. The numbers of places may exceed those in a cyclic/inert construction, but they stabilize in the cyclotomic tower, which is what the degree estimates require.

**Checks.**

- The abelian hypotheses are exactly what Washington's theorem needs; for non-abelian `F` one uses Theorem `B`.
- The class of 290 at `p=17` in §5.1a requires local degree divisible by 8 at 2, and permits more than one prime above 2; no inertness prescription is used.
- `E(χ)` is still abelian over `ℚ`, so the corrected preparation preserves the hypothesis of the distinct-prime class-group bound.
- The numerical good-pair inequalities use the actual stabilized numbers of places, not the global degree as a substitute for each local residue degree.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.5, Theorem A, p. 74 (Numdam PDF page 71; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, proof of Theorem A, p. 75 (Numdam PDF page 72; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, proof of Theorem A, p. 77 (Numdam PDF page 74; printed page `=` PDF page `+ 3).`)

*Needs:* §5.1a; §4.7; §3.1; §3.11; §4.2; §2.12 (Deligne–Ribet p-adic L-functions and Hilbert Eisenstein series); §5.9 (Washington’s distinct-prime class-group bound); §3.38.

### 5.3 Skinner–Wiles Theorem `B` (conditional on Hypothesis `H`)

Let `F` be totally real and assume Hypothesis `H` for all solvable totally real extensions of `F`. Let `p` be odd and `ρ` : `Gal(F̄/F) → GL₂(Q̄_p)` continuous, irreducible and unramified outside finitely many places with `ρ̄^ss ≅ χ_1 ⊕ χ_2`. If `(χ_1/χ_2)(z) = −1` for every complex conjugation `z, (χ_1/χ_2)|_{D_v}` has even order for every `v | p, ρ|_{D_v}` has the nearly ordinary shape of Theorem A with `ψ^{(v)}_2` through a pro-p extension of `F_v` and finite order on `I_v`, and det `ρ = ψε^{k−1} (k ≥ 2, ψ` finite), then `ρ` is the representation of a Hilbert modular newform.

Hypothesis `H` for all solvable totally real extensions of `F`.

By base change it suffices to treat `F⁺`, the maximal totally real subfield of `F(χ)`; there `χ|_{D_v} ≠ 1` for `v | p` and `χ` is quadratic.

As in Theorem A, find a solvable permissible `E` of even degree with `L_p(E, −1, χω) ∈ 𝒪 ∖ 𝒪^×` and the ramification condition (4.21).

Hypothesis `H` gives totally imaginary quadratic characters `ψ` over `E` with prescribed local behaviour and small relative class groups; the splitting field of `χψ` is a totally real quadratic `L_1/E`, and iterating gives `L_n` with (4.22).

For `n_0` as in `(4.23), L = L_{n_0}` satisfies (4.24) and (4.25) (with Waldschmidt's bound), so `(L, 𝒟_L)` is good (the printed proof says `'(vi)'` for condition `(iv)`).

**Checks.**

- Conditional: every consumer must carry Hypothesis `H`.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.5, Theorem `B`, p. 75 (Numdam PDF page 72; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, proof of Theorem `B`, p. 78 (Numdam PDF page 75; printed page `=` PDF page `+ 3`); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, end of the proof of Theorem `B`, p. 79 (Numdam PDF page 76; printed page `=` PDF page `+ 3).`)

*Needs:* §4.7; §5.1; §5.2; GL2AutomorphicRepresentationsAndTransfer:§§R17.4.8–R17.4.11; §6.14; §4.6a; §3.38.

### 5.4 The reducible-residual comparison over `ℚ`

ClassicalSerreModularity §I.1 owns the classical ordinary lifting theorem: for odd `p`, a continuous odd irreducible finitely ramified `ρ:G_ℚ→GL₂(E)`, with `E/ℚ_p` finite, residual semisimplification `1⊕χ`, `χ|D_p≠1`, unramified ordinary quotient and determinant `ψε^{k−1}` (`k≥2`, `ψ` finite order), comes from a classical newform of weight `k`. This section supplies the specialization of §5.2 to that contract, retaining the chosen quotient and determinant.

Label the residual character of the unramified quotient `χ₂` and the other character `χ₁`. Then `χ₁/χ₂=χ^{±1}` is odd, nontrivial on `D_p` and cuts out an abelian extension of `ℚ`. The quotient divided by its Teichmüller residual lift reduces to 1, factors through a pro-p group and has finite-order inertia. Thus all hypotheses of §5.2 hold for `F=ℚ`. Identify its Hilbert automorphic realization with the classical one through AutomorphicGaloisRepresentations §1.5. This compatibility supplies the totally real comparison to the classical owner; the classical theorem is not a second proof target here.

**Checks.**

- Odd determinant gives `χ(c)=−1`, the total oddness required by §5.2.
- An unramified quotient stays unramified after division by its unramified Teichmüller lift.
- Coincident residual characters violate distinguishedness; a reducible characteristic-zero representation violates irreducibility.

(Source: SW99 Introduction, p. 6, and Theorem A, pp. 74–75; Khare Introduction, p. 3.)

*Needs:* §5.2; AutomorphicGaloisRepresentations:§1.5; ClassicalSerreModularity:§I.1 (classical export).

### 5.5 The residually reducible `p = 3` branch (Dieulefait–Pacetti Theorem 1.7)

Let `ρ` : `G_ℚ → GL₂(ℚ̄₃)` be continuous, irreducible, odd and finitely ramified, with `ρ̄^{ss} ≅ 1 ⊕ χ̄₃` (the mod-3 cyclotomic character), `ρ|_{I₃} ≅ (∗ ∗`; 0 1) and det `ρ = ψχ₃^{k−1} (k ≥ 2, ψ` of finite order). Then `ρ` is modular of weight `k`. This is §5.4 at `p = 3` with `χ = χ̄₃`: hypothesis (i), `χ̄₃|_{D₃} ≠ 1`, holds automatically because `χ̄₃` is ramified at 3. Pan's residually reducible theorem does not cover this case: his Theorem 1.0.2 holds for every odd `p`, but at `p = 3` it excludes exactly `χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω`, and here `χ̄₁χ̄₂^{−1} = χ̄₃^{∓1}` restricts to `ω` on `G_{ℚ₃}`. Dieulefait–Pacetti quote Pan only for `p ≥ 5`.

DP’s second hypothesis compares the local representation with the identity; the condition needed from Skinner–Wiles is nontriviality of `χ̄₃` on `D₃`, which is automatic here; this corrects the reading of DP's second hypothesis. DP Paso 6 obtains ordinarity at weights 2 and 4 from the crystalline-to-ordinary criterion imported from PadicHodgeTheory R06.4; its BLZ/Wach proof belongs to that supplier. Pan's `p = 3` exclusion is the reason this branch still needs Skinner–Wiles.

Specialise §5.4 to `p = 3, χ = χ̄₃`.

`χ̄₃` is odd and ramified at 3.

Check that `ω² = 1 mod 3`, so `χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω` for either ordering of `1 ⊕ χ̄₃`; this puts `ρ` outside Pan's Theorem 1.0.2.

**Checks.**

- Check `χ̄₃(c) = −1` and `χ̄₃|_{I₃} ≠ 1`.
- Check that DP's Theorem 1.7 conclusion (modular of weight `k`) matches.
- Check that Pan's Theorem 1.0.2 excludes this `ρ̄^{ss}` at `p = 3`.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.7, p. 4 of arXiv:2108.07577v2; [DP](<https://arxiv.org/pdf/2108.07577v2>) Proof of Theorem 1.7, p. 5; [DP](<https://arxiv.org/pdf/2108.07577v2>) Paso 6, p. 14; [Pan](<https://arxiv.org/pdf/1901.07166v2>) Introduction, Theorem 1.0.2, p. 3 (arXiv `v2).`)

*Needs:* §5.4; PadicHodgeTheory:§6.4.

### 5.6 Skinner–Wiles lifting for irreducible residual representations over totally real fields (Theorem 5.1)

Let `F` be totally real, `p` odd, and `ρ` : `Gal(F̄/F) → GL₂(Q̄_p)` satisfy (5.1): continuous and irreducible, unramified outside a finite set `Σ`, det `ρ(τ) = −1` for every complex conjugation `τ`, det `ρ = ψε^μ` with `μ ≥ 1` and `ψ` of finite order, and `ρ|_{D_i} ≅ (ψ^{(i)}_1 *`; `0 ψ^{(i)}_2`) with `ψ^{(i)}_2|_{I_i}` of finite order for each `v_i |` p. Call `ρ` D_i-distinguished if `ρ̄^{ss}|_{D_i} ≅ (χ^{(i)}_1 *`; `0 χ^{(i)}_2`) with `χ^{(i)}_1 ≠ χ^{(i)}_2`, labelled so that `χ^{(i)}_2 = ψ^{(i)}_2 mod λ`; another `ρ′` satisfying (5.1) is a χ₂-good lift of `ρ̄^{ss}` if `(ρ̄′)^{ss} ≅ ρ̄^{ss}` and `ρ′|_{D_i} ≅ (φ^{(i)}_1 *`; `0 φ^{(i)}_2`) with `φ^{(i)}_2` reducing to `χ^{(i)}_2`. (Theorem 5.1.) If (i) `ρ̄^{ss}` is irreducible and D_i-distinguished for all `i, (ii)` there is a nearly ordinary automorphic representation `π₀` of `GL₂/F` with `ρ_{π₀}` a χ₂-good lift of `ρ̄^{ss}`, and (iii) `ρ̄^{ss}` is not induced from a quadratic extension `F′/F` with a complex place (the hypothesis the printed proof needs), then `ρ ≅ ρ_π` for an automorphic representation `π`.

Skinner–Wiles state the theorem without (iii); their proof, through Lemma 2.2, covers a dihedral `ρ̄^{ss}` only when the dihedral locus has dimension at most `d_L/2`, which holds for `F′` totally real and fails for CM `F′` in which the places above `p` split (§3.30). `ρ̄^{ss}` is allowed to be reducible on `Gal(F̄/F(ζ_p))`: these are the cases Wiles, Diamond and Fujiwara exclude. The level-lowering base change input, Skinner–Wiles, Base change and a problem of Serre (Duke Math. `J`. 107 (2001)), is the target of §6.14, using GL2AutomorphicRepresentationsAndTransfer §§R17.4.8–R17.4.11.

Choose `𝒪, λ, k` with `ρ` valued in `GL₂(𝒪)`, and list every quadratic inducing field of `ρ̄^{ss}` if dihedral: one for projective image of order at least 6, three in the Klein four case. Condition (iii) requires every field in this list to be totally real; after base change apply §3.30 to every remaining constituent. By the main result of Skinner–Wiles, Base change and a problem of Serre, and hypothesis `(ii)`, there is a totally real `L/F` with solvable Galois closure over `F` such that `ρ₀ = ρ̄^{ss}|_{Gal(F̄/L)}` satisfies (2.1) and (H_even), `(H_def)` hold for `L` and `ρ₀`.

Enlarge `L` by a large real subfield of a cyclotomic extension so that `d_L/2 > 2 + 7·#Σ_L` and `d_v > 2 + 7·#Σ_L` for `v | p`; then `(L, ρ₀)` is a good pair and the extra general-level bound of §4.17 holds.

`ρ_1 = ρ|_{Gal(F̄/L)}` is of type `𝒟_L = (𝒪, Σ_L, ∅)`; `(P)` holds by Proposition 8.2 (§4.19), so `ρ_1` is pro-modular by Proposition 4.1 (§4.17), and the homomorphism `T_{𝒟_L} → 𝒪` is algebraic.

Proposition 3.2 (PadicFamilies Layer 5/hida-control-nearly-ordinary) gives `ρ_1 ≅ ρ_{π_1}` for a nearly ordinary `π_1` of `GL₂/L`; the single-coefficient solvable descent of §4.6a gives `π` over `F`.

**Checks.**

- Record the hypotheses individually: `p` odd, `(5.1)(i)–(v)`, D_i-distinguishedness, the χ₂-good nearly ordinary `π₀`, and (iii).
- D_i-distinguishedness stays an explicit hypothesis of the exported lifting theorem; it is not implied by (5.1).
- A projective Klein four residual representation requires all three inducing fields in the dihedral bound; a complex-place constituent is excluded by (iii).

([SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §5, (5.1), p. 202 (Numdam PDF page 19; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §5, proof of Theorem 5.1, p. 203 (Numdam PDF page 20; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §5, proof of Theorem 5.1, p. 204 (Numdam PDF page 21; printed page `=` PDF page `+ 183`); [SW01](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>) §5, end of the proof of Theorem 5.1, p. 204 (Numdam PDF page 21; printed page `=` PDF page `+ 183).`)

*Needs:* §4.17; §4.19; §3.28; PadicFamilies:§5.8; GL2AutomorphicRepresentationsAndTransfer:§§R17.4.8–R17.4.11; §6.14; §4.6a; AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1.

### 5.7 The irreducible-residual comparison over `ℚ`

ClassicalSerreModularity §I.1 owns ordinary lifting over `ℚ` for absolutely irreducible modular residual representations, including the imaginary-quadratic correction. Here identify the specialization of §5.6 with that contract on its proved scope. Let `p` be odd and `ρ:G_ℚ→GL₂(E)` continuous, odd, irreducible and finitely ramified, with unramified ordinary quotient and determinant `ψε^{k−1}` (`k≥2`, `ψ` finite order). Require `TauCeti.ResidualModularity.IsModular(ρ̄)` from AlgebraicModularFormsAndSerreWeights, absolute irreducibility, p-distinguishedness with selected quotient matching `ρ`, and noninduction from every imaginary quadratic field for this use of §5.6. The supplied `ArisesFrom.iff_integral_model` comparison identifies the residual modularity witness with a reduction of the attached representation after compatible coefficient extension; it does not choose the ordinary quotient.

SerreWeightAndLevelOptimisation §§3.1–3.6, 4.7–4.8 and the refinement of §5.10 give the χ₂-good nearly ordinary seed in Diamond Theorem 6.4's range (`p≠3` or irreducibility on `G_{ℚ(√−3)}`). The remaining seed cases require the χ₂-good seed as input, as in §5.6. Apply §5.6 with `F=ℚ`, then use AutomorphicGaloisRepresentations §1.5. The full imaginary-quadratic branch, including induction from `ℚ(√−p)` when `p≡3 mod 4`, is supplied by ClassicalSerreModularity §I.1; it is not deduced from the restricted dihedral estimate here.

**Checks.**

- The unramified quotient fixes `χ₂`, and p-distinguishedness must hold on `D_p`. The global `IsModular` predicate alone does not select that quotient.
- The characteristic-zero representation is required to be irreducible.
- A projective Klein four image has three inducing fields; the restricted specialization requires all three to be totally real. The full classical contract retains imaginary-quadratic cases.

(Source: SW01 Introduction, pp. 186–187, and Theorem 5.2 and proof, p. 204, PDF p. 21.)

*Needs:* §5.6; §5.10; ClassicalSerreModularity §I.1; AlgebraicModularFormsAndSerreWeights, [S-type and modularity predicates](../AlgebraicModularFormsAndSerreWeights/README.md#target-s-type-arises-from-and-modular).

*Needs:* §5.6; §5.10; SerreWeightAndLevelOptimisation:§§3.1–3.6, 4.7–4.8; AutomorphicGaloisRepresentations:§1.5; ClassicalSerreModularity:§I.1 (full classical export).

### 5.8 Full-scope irreducible lifting conditional on component support

Let `F≠ℚ` be totally real, `p` odd, and `ρ:G_F→GL₂(Q̄_p)` satisfy §5.6's (5.1), with absolutely irreducible distinguished residual representation and a χ₂-good nearly ordinary modular seed. Retain the ordered local quotients, their finite-order inertia restrictions and `detρ=ψε^μ`, `μ≥1`. No restriction on the signatures of quadratic inducing fields is imposed.

Define the additional hypothesis `CMComponentSupport` as follows. There exist a finite totally real `L/F` with solvable Galois closure and even absolute degree, a coefficient DVR `𝒪` containing the values of `ρ|G_L`, and an irreducible datum `𝒟_L=(𝒪,Σ_L,∅)` satisfying §§3.28, 3.33–3.34, such that the restricted residual representation is absolutely irreducible and distinguished with the transported χ₂-good seed. Let `x_L:R_{𝒟_L}→𝒪` classify `ρ|G_L` with those selected local flags and let `r_{𝒟_L}:R_{𝒟_L}↠T_{𝒟_L}` be §3.34's map. Require a minimal prime `q` of `R_{𝒟_L}` with `q⊆ker(x_L)` and `ker(r_{𝒟_L})⊆q`. Thus a component through the given characteristic-zero point has ordinary Hecke support. The kernel inclusion is the mathematical hypothesis; it is not inferred from a `d/2` estimate. This roadmap owns its definition and the conditional implication below.

**Conditional lifting** (`fullScopeOrdinaryLifting`). Under these hypotheses and `CMComponentSupport`, `ρ` is attached to a cuspidal nearly ordinary Hilbert representation over `F`, with the specified local quotient labels. In the absence of complex-place inducing fields §5.6 supplies the lifting conclusion independently of this additional hypothesis. For `F=ℚ` the full classical conclusion and imaginary-quadratic correction are owned by ClassicalSerreModularity §I.1 and consumed through §5.7.

Prove the implication through the supplied surjection: `ker(r_{𝒟_L})⊆q⊆ker(x_L)` gives a unique local `𝒪`-algebra map `θ_L:T_{𝒟_L}→𝒪` with `θ_L∘r_{𝒟_L}=x_L`. Surjectivity makes it a continuous map respecting the determinant and quotient weight coordinates. The determinant and finite-order inertial quotient make `θ_L` algebraic, so PadicFamilies §5.8 realizes it by a nearly ordinary form of parallel weight `μ+1`. Compare its Galois representation using §3.34 and the distinguished quotient recovery; then apply §4.6a's single-coefficient solvable descent.

Every use of this full-scope export for a complex-place inducing field carries `CMComponentSupport`. A bound of `δ⁻=d_L` on a CM constituent does not imply the required kernel inclusion.

**Checks.**

- If a prepared map is an isomorphism, `ker(r_{𝒟_L})=0`, and any minimal prime below `ker(x_L)` gives the support hypothesis.
- For `R=k[[t,x]]`, `T=R/(x)` and the point `R→k[[t]]` killing `x`, the point factors through `T`, but its component `(0)` does not have `ker(R→T)⊆(0)`. Component support is stronger than support of one special point. The coefficient factorization theorem assumes the actual component inclusion.
- For a CM quadratic inducing field with every p-place split, `δ⁻=d_L` as in §3.30. This rank calculation neither supplies nor refutes `CMComponentSupport`, and cannot replace it in the conditional theorem.
- With projective Klein four residual image, keep every inducing field and its chosen local flags. A totally real constituent does not remove the support hypothesis for the complex-place branch.

(Source: SW01 §4, definition of pro-modularity, p. 198, Proposition 4.1 and its component argument, pp. 199–202; §5, Theorem 5.1 and the algebraic-specialization/descent implication, pp. 202–204; §2, Lemma 2.2, pp. 190–191, with the signature-dependent calculation in §3.30. These give the factorization implication; the component-support inclusion is an additional hypothesis.)

*Needs:* §5.6; §3.30; §§3.28, 3.33–3.34; §4.16; §4.6a; §6.14; PadicFamilies:§5.8; AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1.

### 5.9 The distinct-prime class-group bound in the abelian lifting route

Let `K` be an abelian number field, `ℓ` and `p` distinct primes, and `K_n/K` the layer of degree `ℓⁿ` of the cyclotomic ℤ_ℓ-extension of `K`. Then the orders of the p-primary parts of the class groups of the `K_n` are bounded independently of `n`, and so are eventually constant (Washington, §1, Theorem, p. 87). §5.2 applies this to `E` and `E(χ)`, both abelian over `ℚ`, with `ℓ ≠` p.

Suggested.lean states the bound and eventual constancy as `cyclotomic_classGroup_primary_stabilizes`, with `pPrimaryClassNumber` the order of Mathlib’s p-primary class subgroup. The layers are number fields with degree `ℓⁿ` over `K`, successive field embeddings, and embeddings into finite `K(μ_{ℓ^m})`; these conditions express the cyclotomic tower on native field carriers.

`K` abelian over `ℚ` and `ℓ ≠ p` are both essential. The bound concerns character sums with coefficients involving the two distinct primes; it is not a consequence of a same-prime Iwasawa μ-invariant statement.

By a reduction from Washington's earlier work it suffices to bound the minus parts, for every imaginary abelian field (Washington, §2, p. 88). Factor the relative class numbers along the odd abelian characters of the tower by the analytic class number formula, as products of generalized Bernoulli numbers `B_{1,θ}`. As the ℓ-power part of the conductor grows, prove that the character values controlling the p-parts are nonzero modulo `p`, using cyclotomic trace identities and simultaneous control of blocks of ℓ-adic digits (Washington, Lemma 1 and Propositions 1–4, pp. `89–97`); the remaining finitely many characters contribute a bounded factor.

Since `[K_{n+1}` : `K_n] = ℓ` is prime to `p`, extension of ideal classes followed by the norm is multiplication by `ℓ`, so the p-parts of the class groups inject along the tower; their orders are nondecreasing and, being bounded, eventually constant.

**Checks.**

- `K = ℚ` is within the theorem, with the same distinct-prime requirement.
- Replacing `ℓ` by `p` changes the assertion and is not justified by this result.
- Passing to the abelian compositum `E(χ)` preserves the hypothesis needed for the second tower in Theorem A.

([Washington](https://doi.org/10.1007/BF01399512) §1, Theorem, p. 87; proof, §§2–4, pp. 88–97; [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) §4.6, (4.13), p. 76 (Numdam PDF page 73; printed page `=` PDF page `+ 3).`)

*Needs:* TauCetiRoadmap.ClassFieldTheory Layers 11–13 (class groups through the global Artin map); DirichletPadicLFunctions §§0.4–0.6, Layers 2–3 (abelian character values and cyclotomic arithmetic). The nonvanishing of the distinct-prime character sums is proved within this target; neither an unspecified class-group theorem nor a higher ordinary modularity statement supplies it.

### 5.10 The distinguished nearly ordinary residual seed over `ℚ`

Diamond, The refined conjecture of Serre (1995), Theorem 6.4, in the form Skinner–Wiles 2001 use for their Theorem 5.2: for `p` odd and `ρ̄` : `G_ℚ → GL₂(F̄_p)` irreducible, satisfying AlgebraicModularFormsAndSerreWeights' `TauCeti.ResidualModularity.IsModular`, and p-distinguished (`ρ̄|_{D_p} ≅ (χ_1 *`; `0 χ_2), χ_1 ≠ χ_2`), with `p ≠ 3` or `ρ̄|_{G_{ℚ(√−3)}}` irreducible, there is a nearly ordinary cuspidal `π_1` of `GL₂/ℚ` whose p-adic representation is nearly ordinary at `p`, with quotient of finite-order inertia reducing to `χ₂` (a χ₂-good lift). An ordinary lift with unramified quotient is asserted only when `χ₂` is unramified.

Choose its eigenform witness through the supplied `ArisesFrom` predicate, retaining the coefficient reduction map and residue embedding. Prove this nearly ordinary seed refinement here with that residual modularity hypothesis; it supplies §5.7. It does not turn the residually reducible route into an application of Serre's conjecture.

**Checks.**

- When the residual local characters coincide the stated distinguished seed theorem does not apply.
- At `p=3` the extra irreducibility on `G_{ℚ(√−3)}` is retained; oddness alone does not imply it.
- The chosen quotient reduces to `χ₂`; reversing the chosen flag gives a different seed problem even for a split local representation. Identical global Frobenius polynomials do not distinguish the two flags.
- For `E=X₀(11)` at `p=7`, `a₂=−2` gives Frobenius discriminant `3` modulo 7 (nonsquare), while `a₇=−2` is a unit. Twisting `E[7]` by `ω₇` gives distinguished inertia characters `ω₇²,ω₇`; the selected quotient `ω₇` is ramified and cannot be the reduction of an unramified character.

(Source: Diamond, The refined conjecture of Serre, Theorem 6.4, as used in SW01 Theorem 5.2, p. 204 (PDF p. 21).)

*Needs:* SerreWeightAndLevelOptimisation §§3.1–3.6, 4.7–4.8; GL2AutomorphicRepresentationsAndTransfer §§R16.6.1–R16.6.5; AlgebraicModularFormsAndSerreWeights, S-type and modularity predicates.

### Examples

The abelian theorem uses a cyclotomic `ℤ_ℓ` tower with `ℓ≠p`; the same-prime tower does not have the bounded p-primary class-group assertion. Hypothesis `H` uses one `c(ε)` for the whole tower: at degree `2ⁿd` the class-rank bound divided by degree is `c(ε)(2ⁿd)⁻ε`, tending to zero. A separately chosen constant for every field would not imply this. For an ordinary even-weight classical representation with unramified finite determinant character and odd `p`, the two inertia characters are `ω^{k−1}` and 1; `p−1` is even while `k−1` is odd, so they differ. The `p=2` case has trivial `ω` and is outside this theorem. The totally real inducing-field route gives the required `d/2` dihedral bound; a CM field must use the separate conditional full-scope argument.

### Dependencies

AutomorphicGaloisRepresentations:§1.5; AutomorphicGaloisRepresentations:§§3.11–3.14, 4.10–4.11, 5.1; GL2AutomorphicRepresentationsAndTransfer:§§R17.4.8–R17.4.11; §6.14; §4.6a; §2.12 (Deligne–Ribet p-adic L-functions and Hilbert Eisenstein series); PadicFamilies:§5.8; PadicHodgeTheory:§6.4; SerreWeightAndLevelOptimisation:§§3.1–3.6, 4.7–4.8; §5.10; §5.9 (Washington’s distinct-prime class-group bound).

## Layer 6: Classical interpolation and solvable preparation

### 6.1 Compatibility with the classical exact-level exports

ClassicalSerreModularity §I.1 owns the general exact-level ordinary export, and SmallRamificationAndAbelianVarietyBaseCases §5.0e owns its small terminal and level-one instances. For a classical newform `f` of weight `k≥2` attached to `ρ` under those contracts, compare the representation and chosen ordinary flag with the `F=ℚ` specializations of §§5.4,5.7. Preserve the actual finite determinant character and the full p-power conductor.

The supplied local–global compatibility identifies `v_ℓ(level(f))` with the Artin conductor exponent for `ℓ≠p`, and identifies `p∤level(f)` with crystallinity at `p`. These exact-level conclusions are used at their owners' scope, including the full imaginary-quadratic classical branch. The comparison here respects the same newform attachment, Hecke eigenvalues and determinant; uniqueness up to coefficient conjugacy follows from strong multiplicity one.

**Checks.**

- The small terminal case unramified outside `p` and crystalline at `p` is the level-one export of SmallRamificationAndAbelianVarietyBaseCases §5.0e.
- A finite determinant character of conductor `p²` cannot be discarded when passing to Hida control in §6.4.
- An imaginary-quadratic inducing field requires the full classical contract, rather than §5.6's restricted dimension argument.

(Source: SW99 Theorem A, p. 74; SW01 Theorem 5.2, p. 204; Khare Lemma 5.4 and proof, p. 22.)

*Needs:* §§5.4,5.7; ClassicalSerreModularity:§I.1; SmallRamificationAndAbelianVarietyBaseCases:§5.0e; AutomorphicGaloisRepresentations:§§4.4–4.9, 4.12, 6.4; AutomorphicGaloisRepresentations:§1.5.

### 6.2 The ordinary theorems do not use Serre's conjecture

The residually reducible lifting route of §5.2 starts from an Eisenstein congruence, not from a cuspidal residual modularity theorem. Its mathematical inputs are the quaternionic ordinary towers, Galois representations attached to Hilbert eigenforms, pseudo-deformations, characteristic-p patching, Deligne–Ribet congruences, solvable base change, and the connectedness, class-group and unit-rank bounds stated here. The specialization over `ℚ` uses the classical realization and conductor of a newform. Require constructions of those supplier results that do not invoke Serre’s conjecture or the lifting theorem being proved.

Use solvable base change and the ordinary eigenform realization independently of residual modularity lifting.

Trace the proof of Theorem A from the permissible Eisenstein maximal ideal through pro-modularity, arithmetic specialization and solvable descent. The residual input is the pair of characters, and every characteristic-zero Galois representation used before descent is attached to an already constructed eigenform.

**Checks.**

- An Eisenstein congruence supplies the reducible residual system without asserting the existence of a cuspidal form for an arbitrary irreducible residual representation.
- The classical and Hilbert eigenform suppliers must establish realization, irreducibility and local compatibility without a circular ordinary lifting input.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) Introduction, p. 6 (Numdam PDF page 3); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) Introduction, p. 8 (Numdam PDF page 5).)

*Needs:* §5.2; §4.7; §2.4; §2.3; §5.4.

### 6.3 The Galois representation of a Hida family over `ℚ`

Let `p` be an odd prime (the `p≥5` branch used for the interpolation in §6.4), `N` prime to `p, Λ = ℤ_p[[1 + pℤ_p]]` with fraction field `L, T_N` Hida's ordinary cuspidal Hecke algebra of tame level `N` (PadicFamilies Layer 0) and `T^new_N` its new quotient (the maximal quotient acting faithfully on the ordinary forms new at level `N`; constructed here with the EPW properties below). (EPW Theorem 2.3.1.) There is a continuous `ρ` : `G_ℚ → GL₂(T^new_N ⊗_Λ L)`, characterised by `(1) ρ` unramified outside Np and (2) for `ℓ ∤` Np, `ρ(Frob_ℓ)` has characteristic polynomial `X² − T_ℓX + ⟨ℓ⟩ℓ^{−1}`; moreover `(3) ρ` is absolutely irreducible, (4) det `ρ` is `x ↦ ⟨x⟩x^{−1}` composed with the full cyclotomic character into the tame/p-adic unit quotient, and (5) the I_p-coinvariants of `ρ` are free of rank one and `Frob_p` acts on them by `U_p`. (Proposition 2.3.2.) For each minimal prime `𝔞` of `T^new_N, ρ_𝔞` has tame conductor `N`. (Proposition 2.3.3.) At a classical height-one prime `℘`, for a ρ-stable (T^new_N)_℘-lattice `𝓛` and `ℓ ≠ p, 𝓛_{I_ℓ}` is free, commutes with `⊗_Λ L` and specialises to `(𝓛/℘𝓛)_{I_ℓ}`, and `𝓛/℘𝓛` carries `ρ_{f_℘}`. (Theorem 2.3.4.) Each maximal ideal `m` has a semisimple residual `ρ̄_m` with the same trace and determinant modulo `m` and `ρ̄_m|_{D_p} ≅ (χ *`; `0 ψ`) with `ψ` unramified and `ψ(Frob_p) = U_p mod m`. (Proposition 2.3.5.) If `ρ̄_m` is irreducible, `ρ_m` has a model over `(T^new_N)_m`, unique up to isomorphism. Its generic I_p-coinvariant quotient has rank one. The full integral I_p-coinvariants are free of rank one only with the additional hypothesis `dim_k(ρ̄_m)_{I_p}=1`. To select an ordinary quotient without that dimension condition, assume the residual decomposition characters `χ,ψ` are distinct and retain the generic family quotient reducing to the chosen unramified `ψ`. Construct its saturated kernel and free rank-one unramified quotient, with Frobenius `U_p`; its reduction is the selected p-stabilisation (Definitions `2.3.6–2.3.7`). The integral coinvariant clause of EPW Proposition 2.3.5 is used with this dimension qualification; integral reconstruction alone does not prove it.

The Hecke algebra and arithmetic control are supplied by PadicFamilies Layer 0; construct its EPW new quotient here with the properties below; the existence of the big ordinary Galois representation is PadicFamilies Layer 4. Keep here the EPW §2.3 refinements on the new quotient: Frobenius characterization, determinant, inertia coinvariants, conductor, lattice specialization and the residual and integral models. §3.14 covers even-degree totally real `F` only (Skinner–Wiles' quaternionic towers); this is the classical family over `ℚ`, from Hida (Invent. Math. 85, 1986, Theorem 2.1) and Greenberg–Stevens (Theorem 2.6) as recalled by EPW. The integral model in Proposition 2.3.5 needs `ρ̄_m` irreducible; in the residually reducible case only the pseudo-representation is integral.

Construct `ordinaryNewQuotient` as the quotient of `T_N` by the common annihilator of ordinary eigenforms new at tame level `N`. Prove `ordinaryNewQuotient_finite`, `ordinaryNewQuotient_reduced`, `ordinaryNewQuotient_torsionFree`, `ordinaryNewQuotient_classical` (classical primes correspond exactly to forms of tame conductor `N`), and `ordinaryNewQuotient_etale` (étale after localizing weight space at a classical prime). This is EPW Definition 2.2.1 and Theorem 2.2.2, pp. 8–10. Include the EPW Theorem 2.1.2 correspondence between classical height-one primes of `T_N` and Galois-conjugacy classes of ordinary eigenforms.

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

- `hidaFamilyRep`: `ρ` : `G_ℚ → GL₂(T^new_N ⊗_Λ L)`.
- `hidaFamilyRep_charpoly`: For `ℓ ∤` Np, charpoly `ρ(Frob_ℓ) = X² − T_ℓX + ⟨ℓ⟩ℓ^{−1}`.
- `hidaFamilyRep_det`: det `ρ = ⟨·⟩(·)^{−1} ∘` cyclotomic character.
- `hidaFamilyRep_ordinary`: Over the generic coefficient algebra, the I_p-coinvariants are free of rank one with `Frob_p` acting by `U_p`.
- `hidaFamilyRep_integralCoinvariants`: Under residual global irreducibility and `dim_k(ρ̄_m)_{I_p}=1`, the full integral inertia coinvariants are free of rank one.
- `hidaFamilyRep_selectedQuotient`: Under residual global irreducibility and distinct decomposition characters, with the selected generic ordinary quotient reducing to `ψ`, construct the saturated integral kernel and free unramified quotient with Frobenius `U_p`.
- `hidaFamilyRep_tameConductor`: Proposition `2.3.2: ρ_𝔞` has tame conductor `N`.
- `hidaFamilyRep_integral`: Proposition 2.3.5: the model `ρ_m` over `(T^new_N)_m` when `ρ̄_m` is irreducible.
- `hidaFamilyRep_specialise`: At a classical `℘`, the reduction of a lattice carries `ρ_{f_℘}`.

**Checks.**

- `hidaFamilyRep_weight_two_point`: At the weight-2 point of the family through `X₀(11)` at `p = 5` (§6.5) the specialisation is `ρ_{f,5}`, with `U_5 ↦ a_5 ≡ 1 mod 5`.
- `hidaFamilyRep_det_weight`: At a classical `℘` of weight `k` and trivial character, det `ρ_{f_℘} = ε^{k−1}`.
- `hidaFamilyRep_reducible_residual`: For `ρ̄_m` reducible (the Eisenstein component through `X₀(11)` at 5), Proposition 2.3.5 does not apply; only the traces are integral.
- `hidaFamilyRep_ordinary_quotient`: The unramified quotient reduces to `ψ` with `ψ(Frob_p) = U_p mod m` (Theorem 2.3.4).
- Check (5) against the ordinarity criterion: at a classical `℘` of weight `k, U_p ↦` the unit root `α_p` of `f_℘` and the unramified quotient is the one of PadicHodgeTheory §6.4.
- Do not claim a GL₂(T^new_N)-valued representation without an irreducibility hypothesis on `ρ̄_m`.
- Proposition 2.3.3 is about inertia coinvariants, not invariants. Track their quotient maps and specialization isomorphisms with subscript notation.
- For the CM theta family through `η(z)η(23z)` at `p=13`, the irreducible residual S₃ representation is unramified at 13. Its full residual inertia coinvariants have dimension two, so the integral coinvariants cannot be free of rank one. Here `a₁₃=−1` and `X²+X+1=(X−3)(X−9)` modulo 13; selecting one Frobenius eigenspace gives an ordinary quotient without identifying it with all coinvariants.
- A scalar residual decomposition action fails the distinct-character hypothesis for the integral selected-quotient construction; global residual irreducibility alone does not select its local line.

([EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Theorem 2.3.1, p. 10 (arXiv v1; printed page `=` PDF page); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, proof of Theorem 2.3.1, p. 10 (arXiv v1; printed page `=` PDF page); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Proposition 2.3.2, p. 11 (arXiv v1; printed page `=` PDF page); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Proposition 2.3.3, p. 12, and Theorem 2.3.4, p. 13 (arXiv `v1`); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Proposition 2.3.5 and Definitions 2.3.6–2.3.7, p. 13 (arXiv v1; printed page `=` PDF page); [EPW](<https://arxiv.org/pdf/math/0404484v1>) §2.3, Definition 2.3.7, p. 13 (arXiv v1; printed page `=` PDF page).)

*Needs:* PadicFamilies:§4.1; PadicFamilies:Layer 0; PadicFamilies:§0.11; PadicFamilies:§0.13; LocalGaloisDeformationRings:§F.2.7; AutomorphicGaloisRepresentations:§1.5; AutomorphicGaloisRepresentations:§6.4.

### 6.4 The exported ordinary newform lies in a Hida family

Let `p ≥ 5` and let `f` be a newform of weight `k ≥ 2` and level `N₀pᵃ`, with `p∤N₀` and `a≥0`, that is ordinary at `p (a` unit `U_p-` or T_p-eigenvalue root). Retain its actual finite p-power nebentypus and conductor in PadicFamilies §§0.11,0.13's finite-character control. Use its ordinary p-stabilisation `f_α` when `a=0`. Then this ordinary eigensystem is the specialisation at a classical height-one prime of a unique primitive component `𝒦` of Hida's ordinary Hecke algebra of tame level `N₀` (EPW Theorems 2.1.2 and 2.2.2(2),(3)), and the Galois representation of §6.3 specialises there to `ρ_{f,λ}`. In particular, if `ρ` is exported by §6.1 (under (`ii) ρ|_{I_p} ≅ (∗ ∗`; 0 1)), the newform `f` with `ρ ≅ ρ_{f,λ}` is ordinary at `p` and lies in a Hida family whose representation interpolates `ρ`.

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

*Needs:* §6.3; §6.1; PadicFamilies:§0.15; PadicFamilies:§0.13; PadicHodgeTheory:§6.4.

### 6.5 Worked Check: `X₀(11)` at `p = 5`

Assume the explicit level-11 data: `f` is the normalised newform spanning `S₂(Γ₀(11)), X₀(11)` has genus 1, its Hecke algebra `T` is `ℤ`, and Mazur's Eisenstein ideal `𝔍 ⊆ T` (generated by `1 + w` and the `T_ℓ − 1 − ℓ, ℓ ≠ 11`) has `T/𝔍 ≅ ℤ/n` with `n = numerator((11 − 1)/12) = 5` (Proposition `II.9.7`). These finite data are hypotheses of this worked Check. Then `a_ℓ(f) ≡ 1 + ℓ mod 5` for every prime `ℓ ≠ 11`. Hence: (a) `a_5(f) ≡ 1 mod 5`, so `f` is ordinary at 5 (an ordinary weight-two form); (b) `ρ̄_{f,5}^{ss} ≅ 1 ⊕ ω` by Chebotarev and Brauer–Nesbitt, a residual split p-distinguished representation: `χ = ω` is odd and ramified at 5, so `χ|_{D_5} ≠ 1`; (c) `ρ_{f,5}` is irreducible and satisfies (i)–(iii) of §5.4 with `k = 2`, so that theorem applies (and returns `f`); (d) the reducible `1 ⊕ ε₅` also has residual `1 ⊕ ω` and satisfies (i)–(iii) with `k = 2` and odd determinant, but is attached to no cuspidal newform, so the irreducibility hypothesis cannot be dropped; (e) `p = 5` is in the range of Hida theory, and the ordinary 5-stabilisation `f_α` of level 55 lies in a Hida family (§6.4) whose specialisations at weights `k ≡ 2 mod 4` have trivial character; for `k > 2` they are 5-old, since a form new at 5 of weight `k` and trivial character has `a_5² = 5^{k−2}`, not a unit.

This example exercises an ordinary weight-two form and its arithmetic specialisations, a residual p-distinguished split representation, and the irreducibility hypothesis on the characteristic-zero representation. The family's residual representation is reducible (Eisenstein), so only its pseudo-representation is integral (§6.3, Proposition 2.3.5 does not apply).

`n = numerator(10/12) = 5` and `T/𝔍 ≅ ℤ/5` (Mazur Proposition `II.9.7`); `T = ℤ` gives the congruences.

`a_5 ≡ 1 + 5 ≡ 1`: a unit, so `f` is 5-ordinary; the unramified quotient of `ρ_{f,5}|_{G_{ℚ_5}}` reduces to 1 and the sub to `ω`.

`ω` has order 4 on `I_5`, so the two residual characters differ on `I_5`.

`1 ⊕ ε₅` is reducible; cuspidal newforms have irreducible `ρ_{f,λ}` (AutomorphicGaloisRepresentations §1.5).

Weights: the family's character at weight `k` is `ω^{2−k}`, trivial exactly when `4 | k − 2`; for `f` new at 5 with trivial character, `a_5² = 5^{k−2}` (AutomorphicGaloisRepresentations §§4.4, 4.12 and 6.4, the Steinberg local factor).

**Checks.**

- Check the numerology in the arithmetic examples: `n = 5, a_5 ≡ 1 mod 5, ω` nontrivial of order 4, and `5 | a_5²` for new forms of weight `k > 2`.

([Mazur](<https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf>) Chapter II, Proposition 9.7 and the definition of Eisenstein primes, p. 96 (Numdam PDF page 65; printed page `=` PDF page `+ 31`); [Mazur](<https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf>) Chapter II, before Proposition 9.8, p. 96 (Numdam PDF page 65; printed page `=` PDF page `+ 31).`)

*Needs:* §5.4; §6.4; TauCetiRoadmap.ModularForms (the level-11 newform); AutomorphicGaloisRepresentations:§1.5; AutomorphicGaloisRepresentations:§6.4.

### 6.6 When p-distinguishedness holds and when it fails

(a) Let `ρ` satisfy (`ii) ρ|_{I_p} ≅ (∗ ∗`; 0 1) and (iii) det `ρ = ψε^{k−1}` of §5.4 with `ψ` unramified at `p` and `p` odd. On `I_p` the residual sub-character is `ω^{k−1}` and the quotient is 1, so they differ as soon as `(p − 1) ∤ (k − 1)`; for `k` even this always holds, and hypothesis (i) `χ|_{D_p} ≠ 1` is automatic (this is also why Dieulefait–Pacetti's second hypothesis is automatic). (b) The hypothesis fails for the odd character `χ_{−23}` of `ℚ(√−23)` at `p = 3: 3` splits in `ℚ(√−23)` because `−23 ≡ 1 mod 3`, so `χ_{−23}|_{D_3} = 1`, and §5.4 says nothing about `ρ` with `ρ̄^{ss} ≅ 1 ⊕ χ_{−23}`. By (a), an ordinary `ρ` of this kind with `ψ` unramified at 3 would need `k − 1` even. Whether such `ρ` exist is not asserted.

(i) is a condition on the residual character only; this example checks it against the other hypotheses.

(a) `ω^{k−1}|_{I_p} = 1` exactly when `(p − 1) | (k − 1)`; `p − 1` is even and `k − 1` is odd for `k` even.

(b) `−23 ≡ 1 mod 3` is a square, so 3 splits in `ℚ(√−23)` and `Frob_3 ↦ 1` under `χ_{−23}`; `χ_{−23}` is unramified at 3 and odd.

**Checks.**

- Check both parity facts and the splitting of 3 in the arithmetic examples.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) Introduction, p. 6 (Numdam PDF page 3).)

*Needs:* §5.4; §5.5.

### 6.14 Solvable preparation for Skinner–Wiles lifting

Skinner–Wiles, Base change and a problem of Serre, Duke Math. `J`. 107 (2001), 15–25, unnumbered theorem on p. 17 and the weight-conversion paragraph there, with the local preparation on pp. 18–19. For an odd `p` and an absolutely irreducible modular residual representation over a totally real `F` arising from a weight-two Hilbert newform `f`, there is a solvable totally real `F′/F` in which all p-places split completely, the residual representation remains irreducible, and a weight-two form `g` realizes its restriction with level dividing the p-power part of level(f) times the product of residually ramified primes away from p. Ordinary or nearly ordinary, distinguishedness, and the chosen good quotient are preserved. Starting at weight `≥2` first use the Hida/Wiles family conversion to weight two on p. 17. Auxiliary prescribed splitting/ramification there is for a finite set outside level(f), not unrestricted level primes. The even-degree and large-local-degree preparation in §5.6 is a further step, rather than a conclusion of this theorem alone.

Construct this level-lowering base change and its preservation of the selected nearly ordinary quotient. The construction uses solvable base change, ordinary Hilbert weight conversion and the local preparation at the specified auxiliary places.

**Checks.**

- Splitting every p-place in the first extension preserves its local degree; the large-local-degree extension in §5.6 is a separate construction.
- Prescribed auxiliary conditions apply outside the level of the initial form; they do not permit arbitrary changes at level primes.
- For an ordinary distinguished seed, transport the selected unramified quotient; for a nearly ordinary seed, retain its finite inertial character instead of asserting it becomes trivial.

(Source: SW base change, unnumbered theorem and weight conversion, p. 17; local preparation, pp. 18–19.)

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.4.8–R17.4.11; PadicFamilies §5.8; AutomorphicGaloisRepresentations §§3.11–3.14, 5.1.

### Examples

At `X₀(11), numerator(10/12)=5` gives the Eisenstein congruence `a_ℓ≡1+ℓ mod 5`. Thus `a₅≡1` and `ω` has order 4 on inertia at 5. The irreducible `ρ_{f,5}` satisfies the ordinary lifting hypotheses; the reducible `1⊕ε₅` has the same residual semisimplification but cannot be the representation of a cuspidal newform. The ordinary 5-stabilization lies in a primitive family; at `k≡2 mod 4` its character is trivial. For `k>2` a form new at 5 with trivial character has `a₅²=5^{k−2}`, so it cannot be ordinary: those ordinary specializations are 5-old. The family’s reducible residual system permits integral traces but does not meet the integral GL₂-valued model hypothesis. At `p=3` the odd quadratic character `χ_{−23}` is trivial on `D₃` because `−23≡1 mod 3`, so the distinguishedness hypothesis fails; no existence of a corresponding ordinary characteristic-zero representation is inferred.

### Dependencies

§6.3; PadicFamilies §§0.11,0.13,0.15,4.1,5.8; PadicHodgeTheory §6.4; LocalGaloisDeformationRings §F.2.7; IntegralHeckeAndGaloisDeterminants Layer 1; AutomorphicGaloisRepresentations §§1.5,3.11–3.14,5.1,6.4; GL2AutomorphicRepresentationsAndTransfer §§R17.4.8–R17.4.11.

## Downstream consumers

ClassicalSerreModularity §I.1 owns the two classical ordinary lifting theorems, the full-scope imaginary-quadratic correction and general exact-level specialization. SmallRamificationAndAbelianVarietyBaseCases §5.0e owns the terminal ordinary and level-one cases. The totally real deformation–Hecke comparisons here specialize to those contracts through §§5.4,5.7,6.1; their classical proof targets and terminal applications stay with those owners. GL2ModularityLifting consumes Layer 5 in §§5.18,10.8–10.9,10.13,10.15, §§5.6–5.8 in §5.9, §5.5 in §§7.4,11.1–11.2,12.5,12.8, and §5.4 in §§11.1–11.2,12.3. A use of §5.8 with a complex-place inducing field requires `CMComponentSupport`; §5.6 retains its stated exclusion. PotentialModularityAndCompatibleSystems Layer 6 uses §§1.4–1.5,2.9–2.10, Layer 8 uses §2.1, and Layer 9 uses the Hilbert Hida specialization of §2.11. General-weight consumers of §2.1 retain the full quotient character and distinguish `IsOrdinary` from `IsSmoothOrdinary`.

## References

- **SW99.** C. M. Skinner and A. J. Wiles, [Residually reducible representations and modular forms](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>). Publications mathématiques de l'IHÉS 89 (1999), 5–126, DOI 10.1007/BF02698855; Numdam open-access scan (123 pages, OCR text layer; printed page = PDF page + 3).
- **BLZ.** Laurent Berger, Hanfeng Li and Hui June Zhu, [Construction of some families of 2-dimensional crystalline representations](<https://arxiv.org/pdf/math/0310275v1>). arXiv:math/0310275v1 (17 October 2003), the preprint of Math. Ann. 329 (2004), 365–377. Locators give the arXiv page numbers.
- **DP.** Luis Victor Dieulefait and Ariel Martín Pacetti, [A simplified proof of Serre's conjecture](<https://arxiv.org/pdf/2108.07577v2>). arXiv:2108.07577v2, 3 May 2022. Locators give the arXiv version's page numbers.
- **Khare.** Chandrashekhar Khare, [On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Q̄/Q) unramified outside p](<https://arxiv.org/pdf/math/0504080v1>). arXiv:math/0504080v1 (5 April 2005), published as 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006), 557–589. Locators give the preprint's page numbers.
- **SW01.** C. M. Skinner and Andrew J. Wiles, [Nearly ordinary deformations of irreducible residual representations](<https://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf>). Annales de la Faculté des Sciences de Toulouse (6) 10 (2001), no. 1, 185–215; Numdam open-access scan (32 pages, OCR text layer; printed page = PDF page + 183).
- **EPW.** Matthew Emerton, Robert Pollack and Tom Weston, [Variation of Iwasawa invariants in Hida families](<https://arxiv.org/pdf/math/0404484v1>). arXiv:math/0404484v1 (2004), 50 pages; published in Invent. Math. 163 (2006), no. 3, 523–580. Page numbers are those of the arXiv v1 PDF (printed page = PDF page).
- **Hida.** Haruzo Hida, [Iwasawa modules attached to congruences of cusp forms](<https://www.numdam.org/item/10.24033/asens.1507.pdf>). Ann. Sci. École Norm. Sup. (4) 19 (1986), no. 2, 231–273, DOI 10.24033/asens.1507; Numdam open-access scan (44 pages; printed page = PDF page + 229).
- **Mazur.** Barry Mazur, [Modular curves and the Eisenstein ideal](<https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf>). Publ. Math. IHÉS 47 (1977), 33–186; Numdam open-access scan (155 pages; printed page = PDF page + 31).
- **Pan.** Lue Pan, [The Fontaine–Mazur conjecture in the residually reducible case](<https://arxiv.org/pdf/1901.07166v2>). J. Amer. Math. Soc. 35 (2022); arXiv:1901.07166v2.
- **BLGG12.** Thomas Barnet-Lamb, Toby Gee and David Geraghty, [Congruences between Hilbert modular forms: constructing ordinary lifts](<https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMF.pdf>). Duke Math. J. 161 (2012), no. 8; author PDF with 47 numbered pages.
- **BLGG13.** Thomas Barnet-Lamb, Toby Gee and David Geraghty, [Congruences between Hilbert modular forms: constructing ordinary lifts, II](<https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMFpostBLGGTversion.pdf>). Math. Res. Lett. 20 (2013), no. 1, 67–72; six-page author PDF with provisional running pagination 10001–10006; locators use PDF pages.
- **NT.** James Newton and Jack A. Thorne, [Symmetric power functoriality for Hilbert modular forms](<https://arxiv.org/pdf/2212.03595v2>). Ann. of Math. 203 (2026), no. 1, 283–347, DOI 10.4007/annals.2026.203.1.4; locators use arXiv:2212.03595v2, 19 February 2025; locators are that version’s numbered PDF pages.
- **BCGP.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](<https://www.ma.imperial.ac.uk/~tsg/Index_files/abeliansurfacesmodular.pdf>). Publ. Math. IHÉS 134 (2021), 153–501; 292-page author version, arXiv:1812.09269; locators use its numbered pages.
- **ACC.** Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, [Potential automorphy over CM fields](<https://arxiv.org/abs/1812.09999>). Ann. of Math. 197 (2023), 897–1113; the author version carries the published running pagination.
- **SW base change.** C. M. Skinner and A. J. Wiles, [Base change and a problem of Serre](https://citeseerx.ist.psu.edu/document?doi=78be3e19b2caf9a472352165d0685620cf710b2f&repid=rep1&type=pdf), Duke Math. J. 107 (2001), no. 1, 15–25, DOI 10.1215/S0012-7094-01-10712-6; unnumbered theorem and weight conversion, p. 17; local preparation, pp. 18–19.
- **Waldschmidt.** M. Waldschmidt, [A lower bound for the p-adic rank of the units of an algebraic number field](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/CollMathSocBolyai1981.pdf), in Topics in Classical Number Theory (Budapest, 1981), Colloq. Math. Soc. János Bolyai 34, North-Holland (1984), 1617–1650; author scan with the printed pagination.
- **Washington.** L. C. Washington, [The non-p-part of the class number in a cyclotomic ℤ_p-extension](https://doi.org/10.1007/BF01399512), Invent. Math. 49 (1978), 87–97, §1 theorem, p. 87; proof §§2–4, pp. 88–97.
