# Roadmap: hermitian K-theory of Poincaré categories and the flavours of L-theory

**Summary.** Build algebraic surgery for perfect complexes with duality, identify Ranicki's short symmetric L-groups with genuine symmetric L-theory, and compare genuine and homotopy symmetric theories over coherent rings of finite global dimension. These results give the classical Grothendieck–Witt fibre sequence over arbitrary rings and the quadratic-to-symmetric comparison, including its improved range for 2-torsion-free rings. The main sources are Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle, Papers I–III; statement and page numbers below refer to the editions in the references.

## Scope and ownership

This roadmap owns connectivity bounds for Poincaré structures, bounded L-monoids, relative Lagrangian surgery, quadratic and symmetric surgery, the short-complex comparison, and the resulting general-ring comparison theorems. It treats associative rings and invertible coefficients, and includes the corresponding surgery and comparison results for connective ring spectra.

It also owns the coherent multiplicative refinement of the L-to-Tate comparison for symmetric monoidal Poincaré ∞-categories, together with its module and base-change compatibility (§§7.10–7.11). The underlying additive fundamental square remains supplied by GeometryOfNumbersAndQuadraticArithmetic.

The foundations are supplied by **GeometryOfNumbersAndQuadraticArithmetic**, Layer 6, especially §6.8a: perfect derived enhancements, coefficient dualities, Poincaré categories and objects, isotropic surgery, symmetric/quadratic/genuine structures, their shift comparisons, `GW` and `L` spectra, hermitian bordification, localization, the fundamental square and the Hebestreit–Steimle comparison. Here the metabolic category receives the relative-form and arrow-duality API needed for bounded Lagrangian surgery. The generic shift equivalence belongs to the supplier; it is an input, rather than a separate target here. The supplier's integral calculations in §6.10a provide the numerical checks over `ℤ`. Its heart theorem for symmetric L-theory remains the owner of the duality-exchanges-halves result. Our symmetric surgery instead permits a duality with a nonzero finite cohomological bound.

Dedekind localization and dévissage are supplied by GeometryOfNumbersAndQuadraticArithmetic §6.9; dyadic Dedekind L-group tables are outside this roadmap's scope. The finite-even-field homotopy-limit comparison and integral degree-zero/L-theory calculations belong to its §§6.10–6.11; higher integer Grothendieck–Witt tables are outside this roadmap. **QuadraticFormInvariants**, Layer 4, owns the Witt ring and fundamental ideal of a field of characteristic different from two; the comparison here uses that ring. The Arf classification over `𝔽₂` is constructed here in §7.9. **StablePeriodicCurved**, Layer 4, already supplies the uniform projective-dimension predicate for finite global dimension. We use its left-module version by passing to the opposite ring, and introduce no competing global-dimension predicate. General resolution comparison and the construction of ordinary derived categories are also inputs, rather than targets.

**EnhancedDerivedSheaves**, Layers E0 and E5, supplies stable categories, spectra, algebra and module objects, and compact objects; its §0.1 supplies the standard t-structure on enhanced derived modules. For a general stable category, §6.0 below lifts Mathlib's t-structure on its homotopy category to coherent truncation adjunctions. Group completion is consumed through GeometryOfNumbersAndQuadraticArithmetic §6.1.6 and its adapter to **GeneralizedCohomology** §G2.8. **GeneralizedCohomology**, §G5.4, supplies the commutative ring spectrum `ko` and its identification with the connective cover of `KO`, without a Tate calculation.

Some consequences have additional mathematical inputs. They are kept separate from the four main integral theorems:

- The symmetric structure on finite spectra is 0-quadratic assuming the `C₂` Segal–Lin equivalence `𝕊^{tC₂}≃𝕊̂₂`, as used in Paper III, Example 1.2.31. General `p`-completeness of a Tate construction does not supply this equivalence.
- Laurent-ring sharpness uses the Ranicki–Shaneson splitting for genuine and homotopy symmetric L-theory, under its `K₀` hypotheses. The `ℤ/4` calculation and the stronger results for specified regular domains quoted in Example 1.3.11 require those external theorems. They are evidence about optimality, not inputs to surgery or the comparison ranges.
- The optimality of the linear-part estimate in Remark 1.2.34 assumes `π_*(ko^{tC₂})=ℤ̂₂[u^{±1}]`, `|u|=4`. Constructing `ko` does not compute its Tate spectrum, and the calculation by itself does not establish sharpness of an L-group comparison range.
- Arbitrary form parameters require the equivalence with reduced degree-two polynomial functors on finite projectives (Paper I, p. 74, citing Schlichting, Lemma A.16), together with the derived extension of Paper I, Proposition 4.2.18. The restriction equivalence is `Fun^q(D^p(R))≃Fun^{2-poly}_*(Proj(R)^op,Sp)`. In particular an abelian-group-valued reduced degree-two polynomial functor, embedded by Eilenberg–Mac Lane spectra, has an essentially unique derived quadratic extension, with its specified cross-effect. The arbitrary-parameter consequences below assume this contract; the three standard flavours use the supplier's existing construction.
- Identifying odd genuine groups with the symmetric, even and quadratic formation groups requires the additional comparison in Paper III, Remark 1.2.17. Exact-category formation groups alone do not provide that comparison.
- The integral-to-periodic comparison after inverting two is supplied by GeometryOfNumbersAndQuadraticArithmetic §6.10b, target 6.10.6, using its `poincareTensorProduct`, `genuineLTheoryModule` and `symmetricLTheoryShiftTelescope` targets. It enters the final two-inverted splitting here.

## Conventions

`R` is an associative unital ring and all modules are left modules. A small skeleton is chosen for finite projectives and perfect complexes; ambient module categories may live in a larger universe. Write `D^p(R)` for the perfect derived stable category and `D=RHom_R(−,M)`. The coefficient `M` has two commuting `R`-actions and an additive involution `J` interchanging them. It is finitely generated projective for either action, and the action-swapping map `R→Hom_R(M₁,M₂)`, taking 1 to `J`, is an isomorphism. This is the invertible coefficient of Paper III, Definition R.1, p. 7, and Paper I, Definitions 4.2.2/4.2.4, p. 68. The sign twist `−M` negates `J`. The opposite coefficient is `M^∨=Hom_R(M,R)`.

Indexing is homological: `E` is `k`-connective if `π_iE=0` for `i<k`, and `k`-truncated if `π_iE=0` for `i>k`. A map is `k`-connective when its fibre is `k`-connective; its cofibre is then `(k+1)`-connective. Thus `Hℤ→H𝔽₂` is 0-connective, with fibre `H(2ℤ)`, and is not 1-connective. A 1-connective map induces an isomorphism on `π₀` and a surjection on `π₁`. Mathlib's cochain degree `i` corresponds to homological degree `−i`; its cohomological `≤0` half becomes the homological `≥0` half. All displayed intervals are homological.

Put `Q[k]=Σ^kQ`. An `n`-dimensional Poincaré object is a Poincaré object of `Q[−n]`; its underlying equivalence is `X≃DX[−n]`, and `L_n(C,Q)=L₀(C,Q[−n])=π_nL(C,Q)`. A projective `P` placed in degree `k` is `P[k]`, with `D(P[k])=(DP)[−k]`. For example the resolution `ℤ→²ℤ` of `ℤ/2` has terms in degrees `[0,1]`, and its dual has homology `ℤ/2` in degree `−1`.

The genuine family has endpoints `Q^q_M=Q^{≥+∞}_M` and `Q^s_M=Q^{≥−∞}_M`. Set `Q^gq=Q^{≥2}`, `Q^ge=Q^{≥1}`, `Q^gs=Q^{≥0}`. Increasing the index moves towards the quadratic end:

```text
Q^q → ··· → Q^{≥m+1} → Q^{≥m} → ··· → Q^s.
```

For an invariant `F`, write `F^α(R;M)=F(D^p(R),Q^α_M)`, and `F^{−α}(R)=F^α(R;R(−1))`; the minus sign changes the coefficient. Tate cohomology is `Ĥ^j(C₂;M)=π_(−j)(HM)^{tC₂}`. For an involution `σ`, `Ĥ^0=ker(1−σ)/im(1+σ)` and `Ĥ^{−1}=ker(1+σ)/im(1−σ)`. The action on Tate coefficients is the Tate-diagonal `R`-action, so on `R[2]` it is `r·a=r²a` for a commutative ring. It is never silently replaced by ordinary scalar multiplication.

`K` means connective K-theory throughout. `GW` and `L` are the stable, possibly nonconnective spectra. Classical `GW^s_cl`, `GW^q_cl` and `GW^ev_cl` are the connective group completions of unimodular symmetric, quadratic and even forms on finite projectives. Write `L^short=τ_{≥0}L^gs` for the connective spectrum; its groups in nonnegative degrees are Ranicki's short groups. Ranicki's negative-degree extension is a family of groups identified with the negative groups of `L^gs`, not with the negative homotopy of this connective cover. Coherence and global dimension always mean the left versions, unless a right version is stated.

## Exact supplier contracts

### From Mathlib and Tau Ceti

At Mathlib `6b7abb3`, use `CategoryTheory.ProjectiveResolution` for an augmented projective chain complex quasi-isomorphic to a module in degree zero. Use `ChainComplex`, `HomotopyEquiv` and `HomologicalComplex.homology` for ordinary homological complexes and chain homotopies. `Module.Projective`, `Module.Finite` and `Module.FinitePresentation` supply projective, finitely generated and finitely presented modules; `Module.Invertible` supplies line-module vocabulary. `CategoryTheory.HasProjectiveDimensionLE` is the `Ext`-vanishing projective-dimension bound on an abelian-category object. `IsNoetherianRing`, `IsSemisimpleRing` and `IsDedekindDomain` provide the ring hypotheses; the Dedekind convention includes fields. `Module.projective_of_isSemisimpleRing` supplies projectivity of modules over a semisimple ring, and `CategoryTheory.projective_iff_hasProjectiveDimensionLE_zero` supplies the dimension-zero bridge; §6.1 adds the converse characterization of semisimple rings. `Module.finitePresentation_of_finite` supplies finite presentation of finite modules over a Noetherian ring, and `Module.Finite.iff_fg` identifies finite generation with a finite spanning set. `DerivedCategory`, `DerivedCategory.TStructure.t`, `CategoryTheory.Triangulated.TStructure` and its `heart` supply the ordinary derived category and its cohomological t-structure. None of these identifies an ordinary category with the stable enhancement.

At Tau Ceti `a91d3aa`, `Rep.FiniteCyclicGroup.tateCohomologyIsoEven` and `Rep.FiniteCyclicGroup.tateCohomologyIsoOdd` in `TauCeti.RepresentationTheory.Homological.TateCohomology.Periodic` identify algebraic Tate cohomology with the two norm-minus-generator homology groups for a chosen cyclic generator. Apply them to `C₂` to obtain the two parity formulas above. The spectrum realization and Tate-diagonal action come from the following supplier, not from these algebraic isomorphisms. For the field Witt comparison, `TauCeti.WittRing` in `TauCeti.LinearAlgebra.QuadraticForm.Witt.Ring` is the quotient of the quadratic Grothendieck ring by the hyperbolic ideal, under `[Field K] [Invertible (2 : K)]`; use `TauCeti.wittClass` for the comparison. This API does not cover characteristic two.

### From GeometryOfNumbersAndQuadraticArithmetic, Layer 6

Consume §6.1a's stable categories and `C₂`-spectra, homotopy orbits and fixed points, norm and Tate constructions, their exactness, Eilenberg–Mac Lane realization and vanishing on induced objects. Consume the connective K-theory of §6.1b and the symmetric-monoidal-groupoid group-completion adapter of §6.1.6. These contracts fix the `C₂` action induced by a duality and preserve its coherences.

From §6.8a consume `PerfectDerivedInfinity`, `perfectDerivedHom`, `DerivedCoefficientLine`, `perfectDual`, `PoincareInfinityCategory`, `PoincareObject`, `PoincareSurgeryDatum`, and `poincareLinearPart`. Mapping spectra are derived `Hom` spectra with `π_jMap(X,Y)=Hom_D(X[j],Y)`. A Lagrangian includes a chosen null-homotopy and the induced cofiber equivalence. Isotropic surgery gives the trace and a cobordant result. The linear part is `cofib(B_Q(X,X)_{hC₂}→Q(X))`, with its quadratic reconstruction square.

Consume `symmetricPoincareStructure`, `quadraticPoincareStructure` and `genuinePoincareStructure`. For a perfect `X` the last is the pullback of `Q^s_M(X)→Map_R(X,M^{tC₂})` along `Map_R(X,τ_{≥m}M^{tC₂})→Map_R(X,M^{tC₂})`. The supplier supplies the Tate-diagonal action, the equivalence `B_M(X,X)^{tC₂}≃Map_R(X,M^{tC₂})`, projective identifications with symmetric/even/quadratic forms, and the shift equivalence

```text
Ω : (D^p(R), Q^{≥m}_M[2]) ≃ (D^p(R), Q^{≥m+1}_{−M}).
```

Here `m` may be either endpoint. This is Paper III, Proposition R.6, p. 9; Paper I, Lemma 3.5.1 and Proposition 3.5.3, pp. 59–60, Corollary 4.2.24, p. 73; Paper II, discussion before Corollary 4.3.4, p. 101. The double shift twists by `𝕊^{1−σ}` and suspends the genuine linear coefficient once; over `Hℤ` the twist is `−M`. Applying it twice raises the genuine index by two and restores `M`. Over an `𝔽₂`-algebra `−M=M`. These signs and endpoints are part of the contract.

Consume `stableGrothendieckWittSpectrum`, `stableLTheorySpectrum`, `PoincareVerdierSequence`, `stableGWVerdierLocalization`, `additiveHermitianBordification` and `stableGWFundamentalSquare`. They provide integer-shift delooping for bordism-invariant additive invariants, and the natural fibre sequence `K(C;D)_{hC₂}→GW(C,Q)→L(C,Q)`. A comparison that fixes the underlying duality fixes the first term, hence gives a cartesian `GW/L` comparison square. No localization statement for an idempotent-completed quotient is inferred without its cofinality hypothesis.

Consume `weightHeartGWComparison` only in its general weight-heart form: for perfect modules the weight heart is finite projectives, and classical symmetric/even/quadratic `GW` is the connective cover of genuine symmetric/even/quadratic `GW`. This is distinct from the Postnikov heart of finitely presented modules in Layer 6 below. Consume `symmetricHeartLTheory` when duality exchanges the t-structure halves, and the exact Witt group `ExactW0` of §6.4. The exact diagonal-Lagrangian assertion is GeometryOfNumbersAndQuadraticArithmetic §6.2.8; its stable analogue here retains the specified null-homotopy. The Dedekind-specific further comparison in §6.8a is not used to prove its own general surgery input. Finally, consume the `ℤ` calculations of §6.10a as worked instances, and the genuine-`L` comparison after inverting two of §6.10b only for §8.3. Sections 7.10–7.11 consume §6.10b's `poincareTensorProduct` on perfect modules, its coefficient tensor, symmetry and form-pullback API, and its `genuineLTheoryModule`; the extension to general small Poincaré categories and the multiplicative L-to-Tate comparison are constructed here.

### From the other roadmaps

Use **EnhancedDerivedSheaves** §E0 for stable categories, §E5:abstract for algebra objects and `leftModuleObjects`, and §E5:presentability for spectra and compact objects. Its §E5:spectra-comparison identifies `HR`-module spectra with the derived category for commutative `R`, using `eilenbergMacLane`, `moduleSpectra_equiv_derived` and their unit comparison. Its §0.1, `ClassicalDerived.enhancedCategory`, gives the enhanced derived category of modules on the point site and its standard t-structure. For a noncommutative ring use the perfect derived enhancement and module realization of GeometryOfNumbersAndQuadraticArithmetic §6.8a; commutativity is not added to a general-ring theorem.

Use **StablePeriodicCurved** Layer 4, `HasFiniteGlobalDimension`, as the uniform bound on all right modules; apply it to `R^op` for our left-module convention. No separate global-dimension predicate is introduced here. If a right-module model realizes the connective `K` contract of GeometryOfNumbersAndQuadraticArithmetic §6.1b, apply that model to `R^op` (or `A^op`) and retain the connective cover. Use **QuadraticFormInvariants** Layer 4 only for the characteristic-not-two Witt-ring comparison. Use **GeneralizedCohomology** §G5.4, “Canonical examples and maps”, for the commutative ring spectrum `ko`, its unit and the canonical equivalence `ko ≃ τ_{≥0}KO`; compare its concrete spectrum with the shared abstract spectra through EnhancedDerivedSheaves §E5:spectra-comparison. Only the additional Tate-calculation example uses this `ko` carrier; its Tate homotopy groups remain an explicit hypothesis.

## How to read the build

Layers 0–1 fix coefficient operations and the maps between invariants, culminating in Bott–Genauer and Karoubi periodicity. Layers 2–3 express truncation and connectivity through bounded projective complexes and relative Lagrangians. Layer 4 proves quadratic surgery and the short-complex comparison. Layer 5 extends the surgery argument to connective ring spectra. Layers 6–7 give symmetric surgery, the sharp comparison ranges and field computations. In Layer 7 build §§7.1–7.2, then §7.9 (including the Arf classification), then §§7.3–7.8 and §§7.10–7.11; §7.3 uses `field_l_groups`. Layer 8 combines these with the fundamental square to obtain the classical fibre sequences and comparison of Grothendieck–Witt groups. A *Needs* sentence cites named supplier contracts above or mathematical subsections earlier in this build order. Suggested.lean contains representative signatures only where the pinned libraries already have the carriers; this README is the full specification.

The headline statements in `Suggested.lean` are the Arf basis formula and completeness theorem of §7.9. Its module docstring identifies the missing carriers for the spectrum-level statements. Lean names in the other targets specify the library to be built.

## Layer 0: coefficient operations and the flavour family

Construct the coefficient operations and opposite-ring transport, and use the genuine family to organize invariants. The Tate-vanishing criterion records when adjacent indices give the same structure; the shifted classical comparison identifies the alternating theory.

### 0.1 Operations on invertible modules with involution

Let `R` be an associative unital ring and `M` an invertible `ℤ`-module with involution over `R` (an `R⊗R`-module with an involution `m ↦ m̄` exchanging the two actions, finitely generated projective for either action, with the map `R → Hom_R(M₁,M₂)` sending 1 to the involution an isomorphism (`M₁` uses the first `R`-action and `M₂` the second); GeometryOfNumbersAndQuadraticArithmetic §6.8a `DerivedCoefficientLine`, Calmès et al. III Definition R.1). (i) For `R` commutative, every finitely generated projective rank-one `R`-module `L` with the identity involution and `r⊗s` acting by `rs` is such an `M`. (ii) For a unit `ε ∈ R` and an `ε`-involution on `R` (a ring isomorphism `r ↦ r̄` from `R` to `R^op` with `r̄̄ = εrε⁻¹` and `ε̄ = ε⁻¹`), `M = R` with `r⊗s·x = r x s̄` and involution `J(x) = ε⁻¹x̄` (the convention fixed above) is invertible; it is denoted `R(ε)`. (iii) The sign twist `−M` has the same `R⊗R`-module and the involution `m ↦ −m̄`; `−R = R(−1)` and `−(−M) = M`. (iv) The dual `M^∨ = Hom_R(M,R)` is an invertible `ℤ`-module with involution over `R^op`. (Paper III, Example R.2, p. 7; Paper I, Definitions 4.2.2 and 4.2.4, p. 68.)

Here the `ε`-involution may square to conjugation by `ε`; it need not square to the identity.

(i) A rank-one projective `L` is invertible as an `R`-module (Mathlib `Module.Invertible`), so `R → End_R(L)` is bijective; the identity involution exchanges the two equal actions. (ii) With `J(x) = ε⁻¹x̄`, compute `J²(x) = ε⁻¹εxε⁻¹ε = x` and `J(r x s̄) = ε⁻¹s̄̄ x̄ r̄ = s J(x) r̄`. Thus `J` is linear from the action-swapped module `M^op` to `M`. Both actions make `R` free of rank one, and the unit map `r ↦ rJ` identifies `R` with `Hom_R(M₁,M₂)`; it is not the ordinary scalar map into `End_R(M₁)`. (iii) Negating `J` preserves `J² = 1` and `J((r⊗s)m) = (s⊗r)J(m)`; invertibility of the action-swapping unit map is unchanged. (iv) On finitely generated projective right modules, transport the coefficient duality `Hom_R(−,M)` through the contravariant Morita equivalence `Hom_R(−,R)`. The resulting duality has coefficient `Hom_R(M,R)` at `R^op`, with its involution and bidual coherence induced by transport. Finite projectivity and the Morita evaluation equivalences prove invertibility. This coefficient construction precedes the transport of `Q` in §0.4 (Remark R.11).

Give the coefficient operations the following API.

- `CoefficientLine.ofLineBundle`: A rank-one projective module over a commutative ring with the identity involution.
- `CoefficientLine.ofEpsInvolution`: For `r̄̄ = εrε⁻¹` and `ε̄ = ε⁻¹`, `R(ε)` has action `(r⊗s)x = r x s̄` and involution `J(x) = ε⁻¹x̄`.
- `CoefficientLine.neg`: The sign twist `−M`: same module, negated involution.
- `CoefficientLine.neg_neg`: `−(−M) = M`.
- `CoefficientLine.dual`: `M^∨ = Hom_R(M,R)` over `R^op`.
- `CoefficientLine.dual_dual`: The canonical isomorphism `M^∨∨ ≅ M` respects involutions.
- `CoefficientLine.involution_apply`: `J(J(m)) = m` and `J((r⊗s)m) = (s⊗r)J(m)`.
- `CoefficientLine.ext`: An equivalence is an `R⊗R`-linear equivalence commuting with `J`; two such maps agree when their underlying functions agree.

**Checks.**

- For any commutative ring with the identity involution, `R(−1)` is `−R(1)`, and the two have the same underlying `R⊗R`-module.
- Over an `𝔽₂`-algebra, `−M = M`, since `−m̄ = m̄`.
- The zero module with zero involution is not invertible when `R ≠ 0`, because `R → Hom_R(0,0) = 0` is not injective.
- For `R = ℤ`: `Ĥ^even(C₂;ℤ) = ℤ/2` and `Ĥ^odd(C₂;ℤ) = 0` for the trivial involution, and the parities are exchanged for `−ℤ`, so the twist changes Tate cohomology.
- In `R = Mat₂(ℤ)`, take `U = [[1,1],[0,1]]`, `x̄ = UxᵀU⁻¹` and `ε = U(Uᵀ)⁻¹ = [[0,1],[−1,1]]`. Then `x̄̄ = εxε⁻¹` and `ε̄ = ε⁻¹`. The incorrect `J_bad(x) = εx̄` has `J_bad²(E₁₁) = [[0,1],[0,1]] ≠ E₁₁`; `J(x) = ε⁻¹x̄` squares to 1 and swaps the actions.
- `R(1)` for the identity involution on a commutative ring is the symmetric coefficient `R` with trivial involution, and `R(−1) = −R`.
- `M^∨∨ ≅ M` canonically, compatibly with the involutions.

The sign operation enters the shift comparison (Paper III, Proposition R.6, p. 9), while the dual coefficient enters opposite-ring transport (Remark R.11, p. 11). The untwisted and sign coefficients over commutative 2-torsion-free rings give the identifications in Remark R.9, p. 10 and Remark 1.3.16, p. 32.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a; Mathlib Module.Invertible; Mathlib Module.Projective.

### 0.2 Flavoured Grothendieck–Witt and L-spectra of a ring

For a functor `F` from Poincaré ∞-categories to spectra (`GW`, `L`, or the Tate construction `K(−)^{tC₂}` on K-theory with the duality action), an invertible `ℤ`-module with involution `M` over `R` and a flavour `α ∈ {q, gq, ge, gs, s} ∪ {≥m : m ∈ ℤ}`, put `F^α(R;M) := F(D^p(R), Q^α_M)`, where `Q^q_M = Q^{≥∞}_M`, `Q^gq_M = Q^{≥2}_M`, `Q^ge_M = Q^{≥1}_M`, `Q^gs_M = Q^{≥0}_M` and `Q^s_M = Q^{≥−∞}_M` (GeometryOfNumbersAndQuadraticArithmetic §6.8a `genuinePoincareStructure`). For `M = R(ε)` write `F^α(R;ε)`; for `ε = ±1` write `F^α(R) := F^α(R;R)` and `F^{−α}(R) := F^α(R;R(−1))`. Homotopy groups are `F^α_n(R;M) := π_n F^α(R;M)`. The connective-cover maps `τ_{≥m+1} → τ_{≥m}` induce a sequence `F^q → ⋯ → F^{≥m+1} → F^{≥m} → ⋯ → F^s`, natural in `R` and `M`. (Paper III, Notation R.12, p. 11, and Definition R.3, p. 8; Paper I, Notation 4.2.23, p. 73.)

The structures `Q^{≥m}_M` and the maps between them are GeometryOfNumbersAndQuadraticArithmetic §6.8a; applying `F` to the identity Poincaré functors gives the comparison maps. The superscript `−α` refers to the coefficient `R(−1)`, not to a negated degree.

Define the flavour notation and its natural comparison maps as follows.

- `flavour`: The index set `{q, gq, ge, gs, s} ∪ {≥m}`.
- `flavourInvariant F α R M`: `F(D^p(R), Q^α_M)`.
- `flavourComparison`: The map `F^{≥m+1}(R;M) → F^{≥m}(R;M)` induced by `τ_{≥m+1} → τ_{≥m}`.
- `flavourComparison_comp`: Composites of comparison maps are comparison maps; `F^q → F^s` factors through every `F^{≥m}`.
- `flavourInvariant_neg`: `F^{−α}(R) = F^α(R; R(−1))`.

**Checks.**

- On `π₀` of `L` over `ℤ` the map `L^gs → L^s` is the identity of `ℤ` under signature.
- On `π₀` of `L` over `ℤ` the map `L^gq → L^gs` is multiplication by 8, so the flavours are not all equivalent.
- If `2 ∈ R^×` all comparison maps `F^{≥m+1}(R;M) → F^{≥m}(R;M)` are equivalences.
- `F^{−gs}(ℤ)` uses the coefficient `ℤ(−1)`: `GW^{−gs}_0(ℤ) = ℤ` (symplectic forms, generated by the hyperbolic alternating plane) while `GW^{gs}_0(ℤ) = ℤ⊕ℤ`, so `F^{−α}` is a different invariant, not a regrading of `F^α`.
- `L^gs_0(ℤ) → L^s_0(ℤ)` is the identity on signature, while `L^gq_0(ℤ) → L^gs_0(ℤ)` is multiplication by 8 (GeometryOfNumbersAndQuadraticArithmetic §6.10a).

These are the maps compared throughout Paper III, §§1.2–1.3. The genuine symmetric notation is used in the short-complex comparison (Theorem 1.2.22, p. 21).

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a; §0.1.

### 0.3 When consecutive genuine structures agree

Beyond the supplier’s collapse when two is invertible, prove the individual-degree criterion. Write `Ĥ^k(C₂;M) := π_{−k}(HM^{tC₂})` for the Tate cohomology of the underlying `ℤ[C₂]`-module of `M`. If `Ĥ^{−m}(C₂;M) = 0` for some `m ∈ ℤ`, then `τ_{≥m+1}HM^{tC₂} → τ_{≥m}HM^{tC₂}` is an equivalence, hence so are `Q^{≥m+1}_M → Q^{≥m}_M` and the induced maps `GW(R;Q^{≥m+1}_M) → GW(R;Q^{≥m}_M)` and `L(R;Q^{≥m+1}_M) → L(R;Q^{≥m}_M)`. As `Ĥ^*(C₂;M)` is 2-periodic, the same then holds for every `m + 2k`. If `2 ∈ R^×` all members of the family coincide. If `R` is commutative and 2-torsion free and `M = R` with trivial involution, then `Ĥ^0(C₂;−R) = 0` and `Ĥ^{−1}(C₂;R) = 0`, so `Q^ge_{−R} = Q^gs_{−R}` and `Q^gq_R = Q^ge_R`. (Paper III, Remark R.4, p. 8, and Remark R.9, p. 10.)

The cofibre of `τ_{≥m+1}E → τ_{≥m}E` is `Σ^m Hπ_m E`; with `E = HM^{tC₂}`, `π_m E = Ĥ^{−m}(C₂;M)` (the supplier `C₂`-spectrum and Eilenberg–Mac Lane contract (§6.1a)). `Q^{≥m}_M` is the pullback of `Q^s_M` along `Map_R(−,τ_{≥m}HM^{tC₂}) → Map_R(−,HM^{tC₂})` (GeometryOfNumbersAndQuadraticArithmetic §6.8a), so an equivalence of covers gives an equivalence of Poincaré structures with the same duality, hence of `GW` and `L`. `Ĥ^*(C₂;−)` is 2-periodic (Tau Ceti `Rep.FiniteCyclicGroup.tateCohomologyIsoEven` and `Rep.FiniteCyclicGroup.tateCohomologyIsoOdd`). If 2 is a unit it acts invertibly and by zero on Tate cohomology, which therefore vanishes. For an abelian group A with involution `σ`, `Ĥ^0(C₂;A) = ker(1−σ)/im(1+σ)` and `Ĥ^{−1}(C₂;A) = ker(1+σ)/im(1−σ)`. For commutative `R` with trivial involution this gives `Ĥ^{−1}(C₂;R) = R[2]` (the 2-torsion) and, for `−R (σ = −1)`, `Ĥ^0(C₂;−R) = R[2]`. Both vanish when `R` is 2-torsion free, which gives `Q^gq_R = Q^ge_R (m = 1)` and `Q^ge_{−R} = Q^gs_{−R} (m = 0)`.

This gives `tate_collapse_criterion`.

**Checks.**

- For `R = ℤ`: `Ĥ^{−1}(C₂;ℤ) = 0`, so `Q^gq_ℤ = Q^ge_ℤ`; `Ĥ^1(C₂;ℤ) = 0`, so also `Q^{≥0}_ℤ = Q^{≥−1}_ℤ`; but `Ĥ^0(C₂;ℤ) = ℤ/2 ≠ 0`, and `Q^ge_ℤ → Q^gs_ℤ` is not an equivalence (the form `⟨1⟩` is symmetric and not even).
- Over `ℤ[1/2]` all flavours of `L` coincide.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a; the supplier `C₂`-spectrum and Tate API (§6.1a); Tau Ceti Rep.FiniteCyclicGroup.tateCohomologyIsoEven; Tau Ceti Rep.FiniteCyclicGroup.tateCohomologyIsoOdd; §0.2.

### 0.4 Transport of a Poincaré structure to the opposite ring

The functor `X ↦ Hom_R(X,R)` is an equivalence of stable ∞-categories `D^p(R)^op ≃ D^p(R^op)`. For a Poincaré structure `Q` on `D^p(R)` with duality `D`, the composite `Q^∨ : D^p(R^op)^op ≃ D^p(R) →^D D^p(R)^op →^Q Sp` is a Poincaré structure on `D^p(R^op)`, and the underlying functors give an equivalence of Poincaré ∞-categories `(D^p(R),Q) ≃ (D^p(R^op),Q^∨)`. Hence `GW(R^op;Q^∨) ≃ GW(R;Q)` and `L(R^op;Q^∨) ≃ L(R;Q)`. If `Q` is compatible with `M`, `Q^∨` is compatible with `M^∨`. (Paper III, Remark R.11, p. 11.)

`Hom_R(−,R)` exchanges finitely generated projective left and right modules and preserves finite complexes, hence perfect objects; its double application is the identity up to the evaluation equivalence. Pulling `Q` back along the duality and then along this equivalence gives a quadratic functor whose cross-effect is represented by the transported duality, so it is Poincaré. By construction the composite functor carries `Q^∨` to `Q`, which is an equivalence of Poincaré ∞-categories; apply `GW` and `L`.

Make transport and its coherence available through these declarations.

- `Poincare.opposite`: `Q ↦ Q^∨` on `D^p(R^op)`.
- `Poincare.oppositeEquiv`: `(D^p(R),Q) ≃ (D^p(R^op),Q^∨)` as Poincaré ∞-categories.
- `Poincare.opposite_compatible`: If `Q` is `M`-compatible then `Q^∨` is `M^∨`-compatible.
- `GW_opposite`: `GW(R^op;Q^∨) ≃ GW(R;Q)`, and likewise for `L`.
- `Poincare.opposite_opposite`: Double transport recovers `Q` through the canonical evaluation equivalences and `(R^op)^op ≃ R`.

**Checks.**

- For commutative `R` with `M = R` and trivial involution, `R^op = R` and `Q^∨ = Q` for `Q = Q^s`, `Q^q` and `Q^{≥m}`.
- `(Q^s_M)^∨ = Q^s_{M^∨}` and `(Q^q_M)^∨ = Q^q_{M^∨}`.
- For a noncommutative ring without involution, `D^p(R)` and `D^p(R^op)` need not be equivalent as stable categories by any equivalence fixing `R`; the transport uses the duality, not an identification of `R` with `R^op`.
- For a ring with involution and `M = R`, `Q^∨` is again the corresponding structure for `R ≅ R^op`, so `GW(R) ≃ GW(R^op)`.
- For `R = M = ℤ`, the covariant equivalence underlying transport sends `ℤ[1]` to `ℤ[1]`: the two contravariant duals each reverse the shift. Using `Hom_ℤ(−,ℤ)` alone would instead send it to `ℤ[−1]`.
- Double transport of the integral form `⟨1⟩` recovers signature `+1`, not `−1`; the evaluation coherence must recover the original form as well as its underlying module.

Transport preserves the symmetry and quadraticity bounds (Paper III, Example 1.1.5, p. 12), allowing the comparison theorems to be applied to right-coherent rings (Remark 1.3.12, p. 31).

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a; §0.1.

### 0.5 Shifted genuine Grothendieck–Witt spectra and symplectic forms

Let `R` be commutative and `GW^{[n]}(R) := τ_{≥0}GW(D^p(R),(Q^{≥0}_R)[n])`. Then `GW^{[0]}(R) ≃ GW^s_cl(R)`, `GW^{[2]}(R) ≃ GW^{−ev}_cl(R)` and `GW^{[4]}(R) ≃ GW^q_cl(R)`, the classical group completions of symmetric, `(−1)`-even and quadratic forms. Moreover the `(−1)`-even forms on a finitely generated projective `P` are exactly the symplectic forms, the skew-symmetric `b` with `b(x,x) = 0` for all `x`: `Ĥ^0(C₂;Hom_{R⊗R}(P⊗P,R(−1))) ≅ Hom_R(P, φ_*R[2])` where `R[2]` is the 2-torsion of `R` with the Frobenius-twisted action `r·a = r²a`, and a skew-symmetric `b` maps to `x ↦ b(x,x)`; the norm-lifting obstruction of `b` is this function, so `b` lifts exactly when it vanishes on the diagonal. (Paper III, Remark R.7, p. 9.)

Apply the supplier shift equivalence once and twice: `(Q^gs_R)[2] ≃ Q^ge_{−R}` and `(Q^gs_R)[4] ≃ Q^gq_R`. Take connective covers and apply the Hebestreit–Steimle comparison of connective genuine `GW` with classical `GW` (GeometryOfNumbersAndQuadraticArithmetic §6.8a `weightHeartGWComparison`). Compute `Ĥ^0 = (invariants)/(norms)` for `C₂` acting on `Hom_{R⊗R}(P⊗P,R(−1))` by `b ↦ (x,y ↦ −b(y,x))`: the invariants are the skew-symmetric forms and the norms are the forms `c(x,y) − c(y,x)`. The map `b ↦ (x ↦ b(x,x))` kills norms, is additive, takes values in `R[2]` because `2b(x,x) = 0` for skew `b`, and is linear for `r·a = r²a`. For `P = R` it is the identity of `R[2]` (the invariants are `a·xy` with `2a = 0` and there are no nonzero norms); additivity in `P` and passage to retracts give the general case. Hence a skew-symmetric form lifts along the norm exactly when it vanishes on the diagonal, which is the definition of symplectic.

This gives `shifted_gw_symplectic`.

**Checks.**

- For `R = ℤ`, symplectic `GW₀` is `ℤ` generated by the hyperbolic alternating plane (GeometryOfNumbersAndQuadraticArithmetic §6.11.1).
- Over `𝔽₂[t]` with `P = R` and `b(x,y) = xy`, `x ↦ b(x,x) = x²` is additive and `r²`-linear, not `R`-linear.
- Over `𝔽₂` the invertible pairing `[[0,1],[1,0]]` is `(−1)`-even, whereas the invertible line `[1]` is skew-symmetric but has nonzero diagonal and is not `(−1)`-even.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a; the supplier shift equivalence; the supplier `C₂`-spectrum and Tate API (§6.1a).

### Examples

For the trivial involution on `ℤ`, the norm is multiplication by 2: `Ĥ^0=ℤ/2` and `Ĥ^{−1}=0`. For the sign involution these groups exchange places. Thus `Q^gq_ℤ=Q^ge_ℤ`, whereas `Q^ge_ℤ→Q^gs_ℤ` fails on the symmetric line `⟨1⟩`. On `𝔽₂[t]` the diagonal of `b(x,y)=xy` is `x²`: at `x=1` and scalar `t` it is `t²`, rather than `t`, which fixes the Frobenius convention.

### Dependencies

GeometryOfNumbersAndQuadraticArithmetic §§6.1a and 6.8a; Mathlib finite projectives and invertible modules; Tau Ceti cyclic Tate cohomology.

## Layer 1: metabolic categories, Bott–Genauer and Karoubi periodicity

The metabolic arrow category makes a chosen Lagrangian part of the object. Its Verdier sequence yields the forgetful–hyperbolic fibre sequence and Karoubi periodicity without a hypothesis on two. Applying the supplier shift contract to bordism-invariant theories relates the different genuine flavours.

### 1.1 The metabolic Poincaré ∞-category

For a Poincaré ∞-category `(C,Q)` with duality `D`, `Met(C,Q)` is the arrow category `Ar(C) = Fun(Δ¹,C)` with the quadratic functor `Q^met(w → x) = fib(Q(x) → Q(w))`. Its bilinear part is `fib(B(x,x′) → B(w,w′))`, represented by the duality `D^met(w → x) = (fib(Dx → Dw) → Dx)`, so `Met(C,Q)` is Poincaré. A hermitian form on `f : w → x` is a pair `(q,η)` of a form `q ∈ Ω^∞Q(x)` and a null-homotopy `η` of `f^*q`; it is Poincaré exactly when `q^♯ : x → Dx` is an equivalence and the induced map `x/w → Dw` is an equivalence, i.e. when `f` is a Lagrangian of the Poincaré object `(x,q)`. Thus `Pn(Met(C,Q))` is the space `Pn^∂(C,Q)` of Poincaré objects with a Lagrangian, and forgetting the Lagrangian is induced by the Poincaré functor `met : Met(C,Q) → (C,Q)`, `(w → x) ↦ x`. (Paper I, Definition 2.3.5, p. 36, and Lemma 2.3.7, p. 37; Paper III, Recollection, pp. 9–10, and §1.1, pp. 13–14.)

`Q^met` is reduced and 2-excisive as a fibre of two such functors composed with exact functors. Compute the cross-effect as the fibre of cross-effects and represent it using the duality of `C`; this exhibits `D^met`. Unwind a Poincaré `Q^met`-form into the square with corners `w`, `fib(Dx → Dw)`, `x`, `Dx`; being an equivalence of arrows is the two conditions stated.

Extend the supplier’s metabolic construction with the relative-form and arrow-duality operations.

- `metabolic`: `(C,Q) ↦ Met(C,Q)` on `Ar(C)` with `Q^met(w → x) = fib(Q(x) → Q(w))`.
- `metabolic_duality`: `D^met(w → x) = (fib(Dx → Dw) → Dx)`.
- `metabolic_poincareObject_iff`: A `Q^met`-form `(q,η)` on `w → x` is Poincaré iff `q` is Poincaré and `w → x` is a Lagrangian.
- `metabolic.met`: The Poincaré functor `(w → x) ↦ x` forgetting the Lagrangian.
- `metabolic.incl`: The Poincaré functor `(C,Q[−1]) → Met(C,Q)`, `x ↦ (x → 0)`.
- `metabolic_map`: A Poincaré functor `(C,Q) → (C′,Q′)` induces `Met(C,Q) → Met(C′,Q′)` compatibly with `met` and `incl`.

**Checks.**

- `Met(0,0)` is the zero Poincaré ∞-category.
- For any `x`, `(x → x ⊕ Dx)` with the canonical null-homotopy is a Poincaré object of `Met(C,Q)` lying over `hyp(x)`.
- In `D^p(𝔽₂)` with `Q^s`, the 2-dimensional form with `b(v,v) = 0`, `b(v,u) = 1`, `b(u,u) = 1` has the Lagrangian `⟨v⟩` (so lifts to `Met`) but is not `hyp(𝔽₂)`: lying in the image of `met` does not mean hyperbolic.
- `incl` identifies `(C,Q[−1])` with the full subcategory of arrows `x → 0`, with `Q^met` restricting to `ΩQ`.
- `Met(0) = 0`.
- On the hyperbolic object `hyp(x)` the summand inclusion `x → x ⊕ Dx` is a Lagrangian, so `hyp(x)` is in the image of `Pn(Met)`.

Surgery inside this category changes a Lagrangian while controlling its target (Paper III, Construction 1.1.15, p. 14). The special datum in Proposition 1.2.14, p. 18 splits off a bottom-degree projective. The supplier's hermitian bordification characterizes bordism invariance by vanishing on metabolic categories.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a; EnhancedDerivedSheaves §E0 stable categories; the supplier Lagrangian API.

### 1.2 The Bott–Genauer sequence

For every Poincaré ∞-category `(C,Q)` the sequence `(C,Q[−1]) → Met(C,Q) → (C,Q)`, `x ↦ (x → 0)` and `(w → x) ↦ x`, is a Poincaré–Verdier sequence (both a fibre and a cofibre sequence of Poincaré ∞-categories). Consequently every Verdier-localising invariant `F` gives a fibre sequence `F(C,Q[−1]) → F(Met(C,Q)) → F(C,Q)`. (Paper II, Example 1.2.5, p. 20; Paper I, Lemma 2.3.7, p. 37; Paper III, Recollection, pp. 9–10.)

The functor `x ↦ (x → 0)` is fully faithful with image the arrows with zero target; this image is closed under the metabolic duality and `Q^met` restricts to `ΩQ` (Calmès et al. I, Lemma 2.3.7). The target functor `Ar(C) → C` is a Verdier projection with kernel exactly that image (an arrow with zero target is killed), and the Poincaré structure on `C` is the one induced by left Kan extension along the projection. Hence the sequence is a Poincaré–Verdier sequence (Calmès et al. II, Example 1.2.5); apply `F`.

This gives `bott_genauer_sequence`.

**Checks.**

- For `F = GW` and `C = 0` the sequence is trivially exact.
- For `F = L`, `L(Met(C,Q)) = 0` and the sequence gives `L(C,Q[−1]) ≃ ΩL(C,Q)`.

*Needs:* §1.1; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 1.3 `GW` of the metabolic category and the forgetful–hyperbolic sequence

For a Poincaré ∞-category `(C,Q)`, `GW(Met(C,Q)) ≃ K(C)` naturally, via the Poincaré functors `lag : Met(C,Q) ⇄ Hyp(C) : can` and the equivalence `GW(Hyp(C)) ≃ K(C)`. Under this identification the Bott–Genauer sequence becomes a fibre sequence of spectra `GW(C,Q[−1]) →^{fgt} K(C) →^{hyp} GW(C,Q)`, where `fgt` is induced by forgetting the form, `Pn(C,Q[−1]) → C^≃`, and `hyp` by the hyperbolic form, `C^≃ → Pn(C,Q)`. Writing `U(C,Q) := fib(hyp)` and `V(C,Q) := fib(fgt)`, one has `U(C,Q) ≃ GW(C,Q[−1])` and `V(C,Q) ≃ ΩGW(C,Q[1])`, hence `V(C,Q) ≃ ΩU(C,Q[2])`. (Paper II, Corollary 4.3.1, p. 100, and Corollary 4.3.3, pp. 100–101; Paper III, Recollection, p. 10.)

`lag` and `can` (the Poincaré functors of Calmès et al. I, Construction 2.3.8) induce inverse equivalences on `GW` (Calmès et al. II, Corollary 4.3.1, deduced there from its Example 2.3.3 and Corollary 3.1.5). `GW(Hyp(C)) ≃ K(C)` by hermitian additivity (GeometryOfNumbersAndQuadraticArithmetic §6.8a, the check that `GW` of the hyperbolic category is `K`). Here `Hyp(C) = C^op × C` with factor-exchange duality is GeometryOfNumbersAndQuadraticArithmetic §6.8a’s stable hyperbolic category, with its evaluation pairing. Apply `GW` to the Bott–Genauer sequence, which is a Poincaré–Verdier sequence, using that `GW` is Verdier localising (GeometryOfNumbersAndQuadraticArithmetic §6.8a `stableGWVerdierLocalization`). Read off `U` and `V`: the fibre of `hyp` is the first term; the sequence for `Q[1]` shows that the fibre of `fgt : GW(C,Q) → K(C)` is `ΩGW(C,Q[1])`; compare with `U(C,Q[2]) ≃ GW(C,Q[1])`.

This gives `forgetful_hyperbolic_sequence`.

**Checks.**

- For `C = D^p(R)` and `Q = Q^s_M`, the composite `fgt∘hyp` on `K₀` is `P ↦ [P] + [DP]`.
- For a field `F` of characteristic `≠ 2` with `Q = Q^s_F`, on `π₀` the map `hyp : K₀(F) = ℤ → GW₀(F)` sends 1 to the hyperbolic plane and `fgt : GW₀(F) → ℤ` is the rank, so `fgt∘hyp` is multiplication by 2.
- For the zero category, `K`, `GW`, `U` and `V` are all zero spectra; the displayed fibre identifications preserve that value.

*Needs:* §1.2; GeometryOfNumbersAndQuadraticArithmetic §6.8a; the supplier perfect-derived enhancement; the supplier connective K-spectrum.

### 1.4 Karoubi periodicity without inverting 2

Let `R` be a ring and `M` an invertible `ℤ`-module with involution over `R`. For every `m ∈ ℤ` there is a natural equivalence `V(R;Q^{≥m}_M) ≃ ΩU(R;Q^{≥m+1}_{−M})`, where `U(R;Q) = fib(K(R) → GW(R;Q))` and `V(R;Q) = fib(GW(R;Q) → K(R))` are the fibres of `hyp` and `fgt` on `D^p(R)`. (Paper III, Theorem R.8, p. 10; Paper II, Corollary 4.3.4, p. 101.)

The same formula holds at `m = ±∞`. No hypothesis on two is required.

By §1.3, `V(R;Q^{≥m}_M) ≃ ΩU(R;(Q^{≥m}_M)[2])`. By the supplier shift equivalence, `Ω : D^p(R) → D^p(R)` is an equivalence of Poincaré ∞-categories `(D^p(R),(Q^{≥m}_M)[2]) ≃ (D^p(R),Q^{≥m+1}_{−M})`; it induces equivalences on `K` and `GW` compatible with `hyp`, hence on `U`. Combine (Calmès et al. II, Corollary 4.3.4, specialised to discrete `R` over `Hℤ`, which is `2σ`-oriented).

This gives `karoubi_periodicity`.

**Checks.**

- If `2 ∈ R^×`, all `Q^{≥m}_M` agree and this is Karoubi's theorem `V(R;Q^s_M) ≃ ΩU(R;Q^s_{−M})`.
- The equivalence is natural for maps of rings with compatible modules with involution.

*Needs:* §1.3; the supplier shift equivalence.

### 1.5 Classical special cases of Karoubi periodicity

(i) If `2 ∈ R^×`, `V(R;Q^s_M) ≃ ΩU(R;Q^s_{−M})`. (ii) If `R` is commutative and 2-torsion free (for instance a ring of integers of a number field) and `M = R` with trivial involution, then `V(R;Q^gs_R) ≃ ΩU(R;Q^gs_{−R})`, `V(R;Q^gs_{−R}) ≃ ΩU(R;Q^gq_R)` and `V(R;Q^gq_R) ≃ ΩU(R;Q^gq_{−R})`; moreover `V(R;Q^gq_{−R}) ≃ ΩU(R;Q^{≥3}_R)`. (Paper III, Remark R.9, p. 10.)

(i) §1.4 with all `Q^{≥m}_M` equal by §0.3. (ii) Apply §1.4 with `(M,m) = (R,0)`, `(−R,0)`, `(R,2)`, `(−R,2)` and simplify with `Q^ge_{−R} = Q^gs_{−R} (Ĥ^0(C₂;−R) = 0)`, `Q^gq_R = Q^ge_R (Ĥ^{−1}(C₂;R) = 0)` and `Q^{≥3}_{−R} = Q^{≥2}_{−R} = Q^gq_{−R}` (`Ĥ^{−2}(C₂;−R) = Ĥ^0(C₂;−R) = 0` by 2-periodicity), all from §0.3.

This gives `karoubi_periodicity_special_cases`.

**Checks.**

- For `R = ℤ`, `π₁Q^{≥3}_ℤ(ℤ[0]) = ℤ/2`, whereas `Q^gq_ℤ(ℤ[0])` is discrete. The fibre sequence `Q^{≥3}_ℤ(ℤ[0]) → Q^{≥2}_ℤ(ℤ[0]) → Σ²H(ℤ/2)` detects the difference (the genuine pullback and Paper I, Proposition 4.2.22, p. 73).
- For `R = ℚ` the Tate term vanishes, so the last term also agrees with the quadratic endpoint.
- For `R = 𝔽₂` the 2-torsion-free hypothesis fails: `Q^ge_R → Q^gs_R` misses the symmetric line `⟨1⟩`.

*Needs:* §1.4; §0.3.

### 1.6 Periodicity of bordism-invariant functors on the genuine family

For every ring `R`, invertible `M` and `m ∈ ℤ ∪ {±∞}`, `L(R;Q^{≥m}_M) ≃ Ω²L(R;Q^{≥m+1}_{−M})` and `K(R;Q^{≥m}_M)^{tC₂} ≃ Ω²K(R;Q^{≥m+1}_{−M})^{tC₂}`. In particular `L(R;Q^s_M)`, `L(R;Q^q_M)` and `K(R;M)^{tC₂}` are 4-periodic, and 2-periodic when `R` is an `𝔽₂`-algebra; and `Σ⁴L^gs(R;M) ≃ L^gq(R;M)`, `Σ²L^gs(R;M) ≃ L^ge(R;−M)`. (Paper III, Recollection pp. 10–11 and Corollary R.10, p. 10; Paper II, Lemma 3.5.6 and Proposition 3.5.8, p. 87; Example 3.5.7, p. 87.)

More generally the displayed flavour formula holds for any spectrum-valued Verdier-localising `F` that vanishes on metabolic categories. The action on `K` is induced by the underlying duality.

Use the supplier integer-shift delooping for bordism-invariant functors. Its metabolic-vanishing criterion applies to `L` and to `K` with the duality action followed by Tate, because hyperbolization is induced. Combine with the supplier shift equivalence: `F(R;Q^{≥m}_M) ≃ Ω²F(R;(Q^{≥m}_M)[2]) ≃ Ω²F(R;Q^{≥m+1}_{−M})`. At `m = ±∞` apply twice and use `−(−M) = M`; over an `𝔽₂`-algebra `−M = M` already.

This gives `bordism_invariant_periodicity`.

**Checks.**

- `L^s_n(ℤ)` is `ℤ`, `ℤ/2`, 0, 0 for `n` ≡ 0,1,2,3 mod 4 and 4-periodic in `n` (GeometryOfNumbersAndQuadraticArithmetic §6.10a).
- `L^gs_{−2}(ℤ) ≅ L^ge_0(ℤ;−1)`, so Theorem 5's negative range is reached from even forms.

*Needs:* §1.2; the supplier shift equivalence; GeometryOfNumbersAndQuadraticArithmetic §6.8a; the supplier `C₂`-spectrum and Tate API (§6.1a).

### Examples

Over a field of characteristic different from two, `hyp` sends the generator of `K₀=ℤ` to the hyperbolic plane. Forgetting its form gives rank two. Thus `fgt∘hyp=1+D` is multiplication by two in this instance, even though the Bott–Genauer fibre sequence itself requires no inverse of two.

### Dependencies

Layer 0; GeometryOfNumbersAndQuadraticArithmetic §§6.1a, 6.1b and 6.8a, including connective K-theory and hermitian additivity.

## Layer 2: `r`-symmetric and `m`-quadratic structures

Two integer bounds measure the distance of a structure from its quadratic and symmetric endpoints. Prove their generator criteria and connectivity propagation, then translate connectivity of a perfect object and its dual into bounded projective representatives.

### 2.1 `r`-symmetric and `m`-quadratic Poincaré structures

Let `Q` be a Poincaré structure on `D^p(R)` compatible with `M`, i.e. with underlying duality `D = Hom_R(−,M)`. Then the canonical map `Q^q_M → Q^s_M` factors as `Q^q_M → Q → Q^s_M`, and `Q^q_M`, `Q^s_M` are the initial and the final `M`-compatible Poincaré structures. For `r ∈ ℤ`, `Q` is `r`-symmetric if for every `P ∈ Proj(R)` the fibre of `Q(P[0]) → Q^s_M(P[0])` is `(−r)`-truncated; for `m ∈ ℤ`, `Q` is `m`-quadratic if the cofibre of `Q^q_M(P[0]) → Q(P[0])` is `m`-connective. Here a spectrum `E` is `m`-connective if `π_kE = 0` for `k < m` and `m`-truncated if `π_kE = 0` for `k > m`. The fibre and the cofibre are exact functors, so it suffices to test `P = R`; if `Q` is `r`-symmetric the fibre at `X` is `(−r−k)`-truncated for every `k`-connective `X`, and if `Q` is `m`-quadratic the cofibre at `X` is `(m+k)`-connective whenever `DX` is `k`-connective. (Paper III, Remark 1.1.1, Definition 1.1.2 and Remark 1.1.3, p. 12; Paper I, Corollary 1.3.6, p. 23.)

The factorisation and extremality come from the linear-part description of quadratic functors with fixed bilinear part (Calmès et al. I, Construction 3.2.6 and Corollary 1.3.6; GeometryOfNumbersAndQuadraticArithmetic §6.8a `poincareLinearPart`). Fibre and cofibre of maps of reduced quadratic functors with the same bilinear part are linear (exact) functors, so their values are determined on the generator `R` by finite sums, retracts, shifts and extensions. Truncatedness is closed under extensions and under `Σ^{−1}`; connectivity is closed under extensions and `Σ`; apply this to cell decompositions of `k`-connective objects (for the symmetric case) and of objects with `k`-connective dual (for the quadratic case).

Provide generator tests and connectivity propagation for the two bounds.

- `IsRSymmetric Q r`: The fibre of `Q(R[0]) → Q^s_M(R[0])` is `(−r)`-truncated.
- `IsMQuadratic Q m`: The cofibre of `Q^q_M(R[0]) → Q(R[0])` is `m`-connective.
- `isRSymmetric_iff_projective`: Equivalent to the condition for every `P ∈ Proj(R)`.
- `IsRSymmetric.mono`: `r`-symmetric implies `r′`-symmetric for `r′ ≤ r`; similarly `m`-quadratic implies `m′`-quadratic for `m′ ≤ m`.
- `IsRSymmetric.fib_truncated`: The fibre at a `k`-connective `X` is `(−r−k)`-truncated.
- `IsMQuadratic.cofib_connective`: The cofibre at `X` is `(m+k)`-connective when `DX` is `k`-connective.
- `compatible_factorisation`: `Q^q_M → Q → Q^s_M`, with `Q^q_M` initial and `Q^s_M` final among `M`-compatible structures.

**Checks.**

- `Q^s_M` is `r`-symmetric for every `r` and `Q^q_M` is `m`-quadratic for every `m` (fibre, respectively cofibre, zero).
- Over `𝔽₂`, `Q^gs` is 2-symmetric but not 3-symmetric: its fibre over `R` is `τ_{≤−2}ΩH𝔽₂^{tC₂}`, with `π_{−2} = Ĥ^1(C₂;𝔽₂) = 𝔽₂ ≠ 0`.
- Over `ℤ`, `Q^gs` is 3-symmetric because `Ĥ^1(C₂;ℤ) = 0` kills `π_{−2}` of the fibre; the bound depends on `M`, not only on `m`.
- `Q^s_ℤ` is not `m`-quadratic for any `m`: the cofibre of `Q^q_ℤ(ℤ) → Q^s_ℤ(ℤ)` is `Hℤ^{tC₂}`, whose `π_{−2k} = ℤ/2` for all `k`, so it is not bounded below.
- Over `𝔽₂`, `Q^gs` is 0-quadratic but not 1-quadratic: the cofibre on `𝔽₂[0]` is `τ_{≥0}H𝔽₂^{tC₂}`, with nonzero `π₀ = 𝔽₂`.
- Over `𝔽₂`, `Q^gq` is 2-quadratic but not 3-quadratic: the corresponding cofibre is `τ_{≥2}H𝔽₂^{tC₂}`, with nonzero `π₂ = 𝔽₂`.

Quadratic surgery uses the `m`-bound (Paper III, Proposition 1.2.6, p. 16); bounded comparison and symmetric surgery use the `r`-bound (Lemma 1.2.24, p. 22 and Proposition 1.3.1, p. 27). They yield the ranges `2m−3` and `d−2r+3` (Corollaries 1.2.12 and 1.3.9). Arbitrary form parameters give both bounds zero, subject to their extension contract (Remark 1.3.17, p. 32).

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a; §0.2; EnhancedDerivedSheaves §E5:presentability.

### 2.2 Bounds for the genuine family

For every `m ∈ ℤ` the Poincaré structure `Q^{≥m}_M` is `m`-quadratic and `(2−m)`-symmetric. In particular `Q^gs_M` is 2-symmetric and 0-quadratic, `Q^ge_M` is 1-symmetric and 1-quadratic, and `Q^gq_M` is 0-symmetric and 2-quadratic. (Paper III, Example 1.1.4, p. 12.)

From the defining pullback (GeometryOfNumbersAndQuadraticArithmetic §6.8a) there are fibre sequences `τ_{≤m−2}ΩHM^{tC₂} → Q^{≥m}_M(R) → Q^s_M(R)` and `Q^q_M(R) → Q^{≥m}_M(R) → τ_{≥m}HM^{tC₂}`. The first fibre is `(m−2)`-truncated, i.e. `(−(2−m))`-truncated; the second cofibre is `m`-connective. Apply §2.1 with `P = R`.

This gives `genuine_family_bounds`.

**Checks.**

- `Q^gs_ℤ` is in fact 3-symmetric and `Q^gq_ℤ = Q^ge_ℤ` (§0.3), so the bounds are not optimal for every `M`.

*Needs:* §2.1; GeometryOfNumbersAndQuadraticArithmetic §6.8a; the supplier `C₂`-spectrum and Tate API (§6.1a).

### 2.3 The opposite structure keeps both bounds

If `Q` is an `M`-compatible `r`-symmetric and `m`-quadratic Poincaré structure on `D^p(R)`, then `Q^∨` (§0.4) is an `M^∨`-compatible `r`-symmetric and `m`-quadratic Poincaré structure on `D^p(R^op)`. (Paper III, Example 1.1.5, p. 12.)

Under the equivalence of Remark R.11 the map `Q^q_{M^∨}(R^op) → Q^∨(R^op)` is `Q^q_M(M[0]) → Q(M[0])`. `M` is finitely generated projective, so by §2.1 the cofibre is `m`-connective; the symmetric bound is checked the same way on the fibre.

This gives `opposite_ring_bounds`.

**Checks.**

- For commutative `R` and `M = R` with trivial involution, `R^op = R`, `M^∨ = R` and the genuine structures satisfy `(Q^{≥m}_R)^∨ = Q^{≥m}_R`; for a line bundle `L` with `L⊗L` not isomorphic to `R`, `L^∨ = L^{−1}` is not isomorphic to `L`, so the statement transports bounds between different coefficients.
- A nontrivial line of order two satisfies `L^∨ ≅ L`; nontriviality alone does not distinguish the transported coefficient.

*Needs:* §2.1; §0.4.

### 2.4 Connectivity criterion for complexes of bounded width

For `X ∈ D^p(R)` and integers `k ≤ l` the following are equivalent: (i) `X` is represented by a complex `0 → P_l → ⋯ → P_k → 0` of finitely generated projective `R`-modules with `P_i` in homological degree `i`; (ii) `X` is `k`-connective and `DX = Hom_R(X,M)` is `(−l)`-connective. The duality is not needed: (ii) may be read with `Hom_R(X,R) ∈ D^p(R^op)`. One-sidedly, `X` is `k`-connective exactly when it is represented by a complex of finitely generated projectives vanishing below degree `k`. If `M` is free and `X ∈ D^f(R)`, (ii) is equivalent to (i) with stably free `P_i`; more generally, for `Free(R) ⊆ 𝒞 ⊆ Proj(R)` closed under duality and sums and `X` represented by a bounded `𝒞`-valued complex, (ii) is equivalent to (i) with each `P_i` stably in `𝒞`. (Paper III, Lemma 1.1.6 and Remarks 1.1.7–1.1.8, pp. 12–13.)

(i) `⇒` (ii) is immediate. For (ii) `⇒` (i) take a representing complex `C` of minimal length. If `C_i ≠ 0` with `i < k` minimal then `H_i(C) = 0`, so `C_{i+1} → C_i` is a surjection of projectives, hence split with projective kernel; replacing `C_{i+1}` by the kernel and deleting `C_i` shortens `C`, a contradiction. The termwise dual complex `(DC)_i = D(C_{−i})` represents `DX` and is again of minimal length since `M` is finitely generated projective; the same argument places it in degrees `≥ −l`, so `C` is in degrees `≤ l`. The free and `𝒞`-valued refinements run the same argument, where the kernel of a split surjection between stably-`𝒞` modules is stably in `𝒞`.

This gives `width_criterion`. Its one-sided ordinary-complex assertion says that a bounded finite-projective chain complex with homology zero below `k` has a homotopy-equivalent bounded finite-projective model whose terms vanish below `k`, using native `ChainComplex`, `HomologicalComplex.homology` and `HomotopyEquiv`.

**Checks.**

- `X = ℤ/2[0] ∈ D^p(ℤ)` (resolved by `ℤ →² ℤ` in degrees `[0,1]`) is 0-connective and `Dℤ/2 ≃ ℤ/2[−1]` is `(−1)`-connective, so it is represented in `[0,1]` and not in `[0,0]`. Mathlib's two-term complex has `H₀ = ℤ/2` and no other homology; nonprojectivity of `ℤ/2` excludes a projective model supported in degree zero.
- `P[0]` for `P` finitely generated projective is 0-connective with 0-connective dual, so it is represented in `[0,0]`. More generally `P[k]` has finite-projective terms, support `{k}` and homology `P` in degree `k` and zero elsewhere.
- The zero complex has a projective representative in every interval `k≤l`, also for any complex that is a zero object. The condition `k≤l` prevents a nonzero single-degree complex from being assigned an empty support interval.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a; Mathlib Module.Projective; Mathlib ChainComplex; Mathlib HomotopyEquiv; Mathlib HomologicalComplex.homology.

### 2.5 Connectivity of an `m`-quadratic structure on a shifted projective

If `Q` is an `m`-quadratic Poincaré structure on `D^p(R)`, then for every `P ∈ Proj(R)` and `k ∈ ℤ` the spectrum `Q(P[k])` is `min(−2k, m−k)`-connective. (Paper III, Lemma 1.2.10, p. 17.)

The cofibre of `Q^q_M(P[k]) → Q(P[k])` is `(m−k)`-connective by §2.1, since `D(P[k]) = (DP)[−k]` is `(−k)`-connective. `Q^q_M(P[k]) = (Hom_{R⊗R}(P⊗P,M)[−2k])_{hC₂}` is `(−2k)`-connective because `P` is projective and homotopy orbits preserve connectivity (the supplier homotopy-orbit construction (§6.1a)).

This gives `shifted_projective_connectivity`.

**Checks.**

- For `Q = Q^gs_M (m = 0)` and `k = −1`, `Q(P[−1])` is 1-connective since `min(2, 1) = 1`; for `k = 1` the bound is `min(−2, −1) = −2`.

*Needs:* §2.1; the supplier `C₂`-spectrum and Tate API (§6.1a).

### Examples

The two-term complex `ℤ→²ℤ` in degrees `1→0` represents `ℤ/2`. It is connective and its dual is `(−1)`-connective, so its projective width is `[0,1]`. It cannot have width `[0,0]`, since `ℤ/2` is not projective. This separates a bound on homology from a bound on projective representatives.

### Dependencies

Layer 0; the supplier perfect enhancement, linear part and Tate API; Mathlib chain complexes, homotopy equivalences and projective modules.

## Layer 3: relative Lagrangian surgery and bounded L-monoids

Express L-groups through Poincaré objects and Lagrangians, and perform surgery on a Lagrangian while keeping its ambient form fixed. Bound the object, Lagrangian and fibre separately; their monoid quotient is the common interface used in both surgery arguments.

### 3.1 L-groups as cobordism groups

Let `(C,Q)` be a Poincaré ∞-category and `n ∈ ℤ`. Call Poincaré objects `(X,q)`, `(X′,q′)` cobordant if `(X ⊕ X′, q ⊕ (−q′))` admits a Lagrangian. Cobordism is a congruence for `⊕`, the diagonal `X → X ⊕ X` is a Lagrangian of `(X ⊕ X, q ⊕ (−q))`, and the set `L_n(C,Q)` of cobordism classes of Poincaré objects for `Q[−n] = Ω^nQ` is an abelian group. There is an exact sequence of commutative monoids `π₀Pn^∂(C,Q[−n]) → π₀Pn(C,Q[−n]) → L_n(C,Q) → 0`, `L_n(C,Q)` is the cokernel of the boundary map in commutative monoids, and `L_n(C,Q) ≅ π_n L(C,Q)` for the L-spectrum of GeometryOfNumbersAndQuadraticArithmetic §6.8a. (Paper III, Definition 1.1.9 and Remark 1.1.10, pp. 13–14; Paper I, Lemma 2.3.10 and Definition 2.3.11, p. 38; Paper II, Definition 4.4.4 and Corollary 4.4.6, p. 105.)

Congruence: a sum of Lagrangians is a Lagrangian of the sum. Diagonal: the diagonal of `X → X ⊕ X` with the evident null-homotopy of `q − q` is a Lagrangian (GeometryOfNumbersAndQuadraticArithmetic §6.2.8 in the exact setting; the same check in the stable setting). The cokernel in commutative monoids surjects onto the cobordism group with trivial kernel by exactness, and it is a group (Calmès et al. I, Lemma 2.3.10), hence they agree (Calmès et al. I, Definition 2.3.11). Paper II, Definition 4.4.4 constructs the L-spectrum, and Corollary 4.4.6 identifies `π_nL(C,Q) = L₀(C,Q[−n])` for every integer `n`, compatibly with the supplier's shift delooping.

This gives `cobordism_presentation`.

**Checks.**

- Over a field `F` of characteristic `≠ 2` with `Q = Q^s_F`, `L₀` is the Witt group of `F` (§4.5 and QuadraticFormInvariants Layer 4).
- The hyperbolic object `hyp(X)` is zero in `L₀`.
- Over `ℝ`, `⟨1⟩` is not null-cobordant: its signature is 1, whereas a metabolic form has signature 0. The sum `⟨1⟩⊕⟨−1⟩` has the diagonal Lagrangian and is zero.

*Needs:* §1.1; GeometryOfNumbersAndQuadraticArithmetic §6.8a; the supplier diagonal Lagrangian.

### 3.2 Lagrangian surgery

Let `(L → X, q, η)` be a Lagrangian of a Poincaré object `(X,q)`, viewed as a Poincaré object of `Met(C,Q)`. A surgery datum on it is a morphism `(Z → W) → (L → X)` in `Met(C,Q)` with a null-homotopy of the pulled-back `Q^met`-form; algebraic surgery (GeometryOfNumbersAndQuadraticArithmetic §6.8a) produces a new Poincaré object `(L′ → X′, q′, η′)` of `Met(C,Q)`, where `X′` is the surgery of `X` along `W → X` and `L′ = fib(L/Z → D(W/Z))` for the metabolic duality. A Lagrangian surgery datum is the case `W = 0`: a map `Z → N := fib(L → X)` together with a null-homotopy in `ΩQ(Z)`. Then `X′ ≃ X` canonically, and there are fibre sequences `L′ → L/Z → ΩDZ` and `N′ → N/Z → ΩDZ` with `N′ = fib(L′ → X)`. One then says that `L` is cobordant to `L′` relative to `X`. (Paper III, Remark 1.1.14 and Construction 1.1.15, pp. 14–15.)

A morphism `(Z → W) → (L → X)` in the arrow category with a null-homotopy of the `Q^met`-form is a surgery datum in `Met(C,Q)`; apply algebraic surgery there (GeometryOfNumbersAndQuadraticArithmetic §6.8a) and read off the underlying arrow using `D^met`. If `W = 0` the morphism is the same as a map `Z → N`, the form condition becomes a null-homotopy in `Q^met(Z → 0) = ΩQ(Z)`, the surgery on the target `X` is along `0 → X` and changes nothing, and the surgery diagram (Calmès et al. III, Remark 1.1.14) gives the two fibre sequences.

Package the datum, its result and functoriality in the following API.

- `LagrangianSurgeryDatum`: A map `Z → fib(L → X)` with a null-homotopy of the restricted form in `ΩQ(Z)`.
- `LagrangianSurgeryDatum.result`: The new Lagrangian `L′ → X`.
- `LagrangianSurgeryDatum.result_fib`: Fibre sequences `L′ → L/Z → ΩDZ` and `N′ → N/Z → ΩDZ`.
- `LagrangianSurgeryDatum.target_eq`: The underlying Poincaré object of the result is `X`.
- `Lagrangian.CobordantRel`: `L` and `L′` are cobordant relative to `X` when related by Lagrangian surgery data.
- `metabolicSurgery`: Surgery along a general datum `(Z → W) → (L → X)`, with `L′ = fib(L/Z → D(W/Z))`.
- `LagrangianSurgeryDatum.map`: An exact Poincaré functor carries a surgery datum, its specified null-homotopy and the resulting relative cobordism to the corresponding datum and result.

**Checks.**

- `Z = 0` gives `L′ = L` and `N′ = N`.
- In the shifted structure `Q[−n]`, if `N` is `l`-connective and `P[l] → N` (`P` projective) is onto on `H_l` with `−l−n−1 > l+1`, the sequence `N′ → N/P[l] → D(P)[−l−n−1]` shows `N′` is `(l+1)`-connective: this is the inductive step of quadratic surgery.
- Cobordism relative to `X` is an equivalence relation on Lagrangians of `X`.
- A datum with `W ≠ 0` is not Lagrangian surgery: surgery of `hyp(Y)` along its Lagrangian `Y → hyp(Y)` gives `X′ = fib(DY → DY) = 0`, so the underlying Poincaré object changes.
- Surgery along the zero datum returns `(L → X)`.
- If `Z → N` is an equivalence the new Lagrangian `L′` is computed from `L/N ≃ X`.

Use relative surgery to raise the connectivity of a Lagrangian and its fibre in quadratic surgery, symmetric surgery and ring-spectrum surgery (Paper III, Proposition 1.2.6(ii), p. 16; Proposition 1.3.1(ii), p. 27; Proposition 1.2.26(ii), p. 23). The datum `W=Z=L″` in Proposition 1.2.14, p. 18 instead splits off a bottom-degree projective.

*Needs:* §1.1; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 3.3 Bounded-width L-monoids

Let `Q` be an `M`-compatible Poincaré structure on `D^p(R)` and `n`, `a`, `b ∈ ℤ` with `a`, `b ≥ −1`, `b ≥ a − 1` and `n + a` even. `Pn^a_n(R,Q) ⊆ Pn(D^p(R),Q[−n])` is spanned by the Poincaré objects `(X,q)` with `X ((−n−a)/2)`-connective, and `M^{a,b}_n(R,Q) ⊆ Pn^∂(D^p(R),Q[−n])` by the Poincaré pairs `(L → X, q, η)` with `X ((−n−a)/2)`-connective, `L ⌈(−n−1−b)/2⌉`-connective and `N := fib(L → X) ≃ Ω^{n+1}DL ⌊(−n−1−b)/2⌋`-connective (allowed Lagrangians). Define `L^{a,b}_n(R;Q) := coker(π₀M^{a,b}_n(R,Q) → π₀Pn^a_n(R,Q))` in commutative monoids. By the width criterion, `X` is then represented by a complex of projectives in degrees `[(−n−a)/2, (−n+a)/2]` (width `a`); for `b + n` odd both `L` and `N` are represented in `[(−n−1−b)/2, (−n−1+b)/2]`; for `b + n` even (then `b ≥ a`) `L` is represented in `[(−n−b)/2, (−n+b)/2]` and `N` in `[(−n−b)/2 − 1, (−n+b)/2 − 1]`. If `b ≥ a` the diagonal of `(X,q) ⊕ (X,−q)` is allowed and `L^{a,b}_n(R;Q)` is a group; `Pn^{−1}_n` is contractible. The same definitions make sense for a stable ∞-category with a t-structure (§6.3) and for compact modules over a connective ring spectrum (§5.1). (Paper III, Definition 1.2.1 and Remarks 1.2.2–1.2.3, p. 15.)

Membership is a condition on components, so the subspaces and the monoid map are well defined; direct sums preserve all bounds. `DX ≃ X[n]` for a Poincaré object of `Q[−n]`, so the connectivity of `X` gives that of `DX` and §2.4 gives the representing interval. For `b + n` odd the bounds on `X` and `N` imply the one on `L`; for `b + n` even the bounds on `X` and `L` imply the one on `N`, using `DL ≃ N[n+1]`. If `b ≥ a` the diagonal Lagrangian of `(X ⊕ X, q ⊕ −q)` has `L = X`, which satisfies the bounds.

Expose the bounded spaces, their monoid quotient and universal property.

- `Pn.boundedWidth Q n a`: The subspace `Pn^a_n(R,Q)` of `((−n−a)/2)`-connective Poincaré objects of `Q[−n]`.
- `Pn.allowedLagrangians Q n a b`: The subspace `M^{a,b}_n(R,Q)` of Poincaré pairs with the three bounds.
- `boundedL Q n a b`: `L^{a,b}_n(R;Q)` as the cokernel monoid.
- `boundedL.toL`: The canonical monoid map `L^{a,b}_n(R;Q) → L_n(R;Q)`.
- `boundedL.map`: Functoriality in maps of Poincaré structures `Q → Q′` with the same duality.
- `boundedL.isGroup_of_le`: `b ≥ a` implies `L^{a,b}_n(R;Q)` is a group.
- `boundedL.representingInterval`: Objects are represented in `[(−n−a)/2, (−n+a)/2]`; Lagrangians in the intervals of the two parity cases.
- `boundedL.lift`: A monoid map out of `π₀Pn^a_n` factors uniquely through `boundedL` exactly when it sends every allowed metabolic boundary in `π₀M^{a,b}_n` to zero.

**Checks.**

- `Pn^{−1}_n(R,Q)` is contractible, so `L^{−1,b}_n(R;Q) = 0`.
- For `n = 0`, `a = 0` the objects are finitely generated projective modules in degree 0 with a Poincaré form.
- For `n + a` odd, `(−n−a)/2` is not an integer and the definition is not used; e.g. `(n,a) = (0,1)` is excluded.
- For `b = a − 1` the diagonal of `X ⊕ X` need not be allowed; `L^{a,a−1}_n` is shown to be a group only under quadraticity hypotheses (§4.1).
- `(n,a,b) = (0,0,1)`: objects are projective modules in degree 0 and allowed Lagrangians are represented in degrees `[−1,0]`.
- `(n,a,b) = (n,n,n+1)`, `n ≥ 0`: objects in degrees `[−n,0]` and Lagrangians in `[−n−1,0]`, Ranicki's lengths.

Quadratic surgery computes these monoids (Paper III, Proposition 1.2.6, p. 16). Their parameters `(n,n+1)` describe short complexes (Proposition 1.2.23, p. 21); the parameters `(d,d)` and `(d−1,d)` compute L-groups over coherent rings (Corollary 1.3.3, p. 28). The value at `(n,a,b)=(0,0,0)` is the Witt group of projectives (Remark 1.2.4, p. 15).

*Needs:* §3.1; §2.4; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 3.4 The Witt group of projectives as a bounded L-group

Let `Q` be a Poincaré structure on `D^p(R)` whose duality preserves `Proj(R)`. A Poincaré object `(P,q)` with `P ∈ Proj(R)` is strictly metabolic if it has a projective submodule `L` with `q|_L = 0` in `π₀Q(L)` and `0 → L → P → DL → 0` exact. The Witt group `W(Proj(R);Q)` is the quotient of `π₀Pn^0_0(R,Q)` by the submonoid generated by strictly metabolic objects; when `Q` restricts to an abelian-group-valued functor on `Proj(R)` it is the classical Witt group of the exact category with duality (GeometryOfNumbersAndQuadraticArithmetic §6.4, `ExactW0`). There is a canonical isomorphism `W(Proj(R);Q) ≅ L^{0,0}_0(R;Q)`. (Paper III, Remark 1.2.4, pp. 15–16.)

It suffices that `(P,q)` is strictly metabolic iff it admits an allowed Lagrangian of width 0. An allowed Lagrangian of width 0 is a projective `L` with fibre `DL[−1]`, i.e. a short exact sequence `0 → L → P → DL → 0` with `q|_L` null. Conversely any null-homotopy `η` of `q|_L` makes `(L → P, η)` allowed, because whether the square with corners `L`, `P`, 0, `DL` is cartesian is exactly exactness of the sequence and does not depend on `η`.

This gives `strictly_metabolic_witt`.

**Checks.**

- For a field `F` of characteristic `≠ 2` with `Q^gs_F` this is the usual Witt group `W(F)` of QuadraticFormInvariants Layer 4.
- For `ℤ` with `Q^gs_ℤ` the class of `⟨1⟩` has infinite order (signature).
- The zero projective with its unique form is strictly metabolic with `L=0` and represents zero in both quotients.
- The plane `[[0,1],[1,1]]` over `𝔽₂` is strictly metabolic with `L` the first coordinate but is not hyperbolic, so this Witt quotient kills more isometry classes than just the hyperbolic forms before group completion.

*Needs:* §3.3; GeometryOfNumbersAndQuadraticArithmetic §6.4, ExactW0; the supplier Lagrangian API; QuadraticFormInvariants Layer 4 and TauCeti.WittRing.

### 3.5 Strictly metabolic 1-quadratic forms are hyperbolic

Let `Q` be 1-quadratic, `P` finitely generated projective and `(P,q)` strictly metabolic with strict Lagrangian `L → P` (so `fib(L → P) ≃ DL[−1]` and `P ≅ L ⊕ DL`). Then `(P,q) ≃ hyp(L)`. (Paper III, Remark 1.2.5, p. 16; Paper I, Corollary 2.4.6, p. 43.)

By the algebraic Thom isomorphism (Calmès et al. I, Corollary 2.4.6), Poincaré structures on `L → P` in `Met(D^p(R),Q)` correspond to points of `ΩQ(DL[−1])`. As `Q` is 1-quadratic, §2.5 (or Remark 1.1.3 directly) shows this space is connected, so the metabolic object is equivalent to the hyperbolic one on `L`.

This gives `strictly_metabolic_hyperbolic`.

**Checks.**

- Over `𝔽₂` with `Q^s` (not 1-quadratic) the strictly metabolic plane with `b(v,v) = 0`, `b(u,u) = 1` is not hyperbolic, so the hypothesis is needed.
- This recovers the classical fact that a strictly metabolic quadratic form on a projective module is hyperbolic.

*Needs:* §3.4; §2.1; the supplier hyperbolic construction.

### 3.6 Widening the Lagrangian bound by one changes nothing

For any `M`-compatible Poincaré structure `Q` on `D^p(R)`, any `n ∈ ℤ` and `a ≥ 0` with `a + n` even, the canonical map `L^{a,a}_n(R;Q) → L^{a,a+1}_n(R;Q)` is an isomorphism. (Paper III, Proposition 1.2.14, pp. 18–19.)

Surjectivity: both are quotients of the same monoid `π₀Pn^a_n`. Injectivity reduces to: if `(L → X) ∈ π₀M^{a,a+1}_n` then `X` is zero in `L^{a,a}_n`. Write `k = (−n−a)/2`; `L` is represented in `[k−1, k+a]`, so there is a fibre sequence `L″ → L → L′` with `L″ = P[k−1]` for `P` projective and `L′ k`-connective. View `L″ → L` as a morphism in `Met(D^p(R),Q)` with source `L″ → L″`; since `Q^met` of an identity arrow is contractible it refines canonically to a surgery datum. Surgery gives a Lagrangian `L′ → X′` in `M^{a,a}_n` with `X′` still `k`-connective. Since `L″ → X` is null (`X` is `k`-connective), the datum splits as the trivial datum on `X` plus a datum `L″ → 0` given by a loop in `Ω^nQ(L″)`; so `X′ ≃ X ⊕ Z` where `Z` carries the Lagrangian `Ω^{n+1}DL″ = (DP)[−n−k]`, which is `k`-connective. Hence `[X] = [X′] = 0` in `L^{a,a}_n`.

This gives `widen_lagrangian_bound`.

**Checks.**

- `(n,a) = (0,0)`: `L^{0,0}_0 ≅ L^{0,1}_0`, which with §3.4 identifies the Witt group with `L^{0,1}_0`.

*Needs:* §3.3; §3.2; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### Examples

At `(n,a,b)=(0,0,1)`, an object has projective width `[0,0]` and both the Lagrangian and its fibre have width `[−1,0]`. At `(n,b)=(0,2)`, the two lower bounds are instead `−1` for `L` and `−2` for its fibre: the ceiling and floor differ. A zero surgery datum leaves both unchanged. The nonalternating metabolic plane over `𝔽₂` shows why 0-quadratic strict metabolicity cannot replace the 1-quadratic hypothesis in hyperbolicity.

### Dependencies

Layers 0–2; the supplier Poincaré objects, isotropic surgery and stable L-spectrum; exact Witt groups from GeometryOfNumbersAndQuadraticArithmetic §6.4.

## Layer 4: quadratic surgery and short symmetric L-theory

Raise connectivity using `m`-quadraticity and compare bounded representatives with unrestricted L-theory. This supplies the negative-degree comparison with quadratic L-theory, degree-zero Witt groups, and the comparison of genuine symmetric theory with Ranicki’s short complexes.

### 4.1 Surgery for `m`-quadratic Poincaré structures

Let `Q` be an `m`-quadratic Poincaré structure on `D^p(R)`, `n ∈ ℤ`, and `a`, `b ≥ 0` with `b ≥ a − 1` and `n + a`, `n + 1 + b` even. (i) If `a ≥ n − 2m`, every Poincaré object of `(D^p(R),Q[−n])` is cobordant to a `((−n−a)/2)`-connective one. (ii) If `b ≥ n − 2m + 1`, every Lagrangian `L → X` of a `((−n−a)/2)`-connective Poincaré object is cobordant relative to `X` to a Lagrangian `L′ → X` with `L′` and `fib(L′ → X)` both `((−n−1−b)/2)`-connective. If both inequalities hold, `L^{a,b}_n(R;Q)` is a group, `L^{a,b}_n(R;Q) → L_n(R;Q)` is an isomorphism, and `π₀M^{a,b}_n → π₀Pn^a_n → L^{a,b}_n` is exact in the middle. The objects in (i) are concentrated in `[(−n−a)/2, (−n+a)/2]` and the Lagrangians in (ii) in `[(−n−1−b)/2, (−n−1+b)/2]`. (Paper III, Proposition 1.2.6 and Remark 1.2.7, p. 16; proof pp. 17–18; Remark 1.2.11, p. 18.)

(i) If `X` is `k`-connective with `k < (−n−a)/2`, choose a projective `P` and `P[k] → X` onto on `H_k` (§2.4). By §2.5, `Q(P[k])` is `min(−2k, m−k)`-connective and `min(−2k, m−k) > min(n+a, (2m+n+a)/2) ≥ n`, so `Ω^{∞+n}Q(P[k])` is connected and `q` restricts to zero on `P[k]`: this is a surgery datum. Surgery (GeometryOfNumbersAndQuadraticArithmetic §6.8a) gives `X′ = fib(X/P[k] → D(P)[−k−n])`; since `−k−n > k+1` (from `−2k−1 > n+a ≥ n`), `X′` is `(k+1)`-connective. Induct. (ii) If `N = fib(L → X)` is `l`-connective with `l < (−n−1−b)/2`, choose `P[l] → N` onto on `H_l`; `Q^met(P[l] → 0) ≃ ΩQ(P[l])` is `(n+1)`-connective by the same estimate with `n+1+b`, so this is a Lagrangian surgery datum (§3.2). The new fibre `N′` fits into `N′ → N/P[l] → D(P)[−l−n−1]` and is `(l+1)`-connective. Induct; `L′` inherits the bound because `b ≥ a − 1`. The diagonal Lagrangian and (ii) make `L^{a,b}_n` a group; (i) gives surjectivity and (ii) injectivity onto `L_n(R;Q)`; (ii) also gives exactness in the middle.

This gives `quadratic_surgery`.

**Checks.**

- Numerical core: for integers with `n + a` even, `a ≥ n − 2m`, `a ≥ 0` and `2k < −n − a`, one has `n < −2k` and `n < m − k`.
- For `Q^q_M` (`m` arbitrary) every `n` is in range.

*Needs:* §3.3; §3.2; §2.5; §2.4; §3.1; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 4.2 Representatives for quadratic L-groups

`Q^q_M` is `m`-quadratic for every `m`. For `n = 2k`, every class of `L^q_n(R;M)` is represented by a Poincaré object concentrated in degree `−k`, which is zero iff it has a Lagrangian concentrated in degrees `[−k−1,−k]`. For `n = 2k+1`, every class is represented in degrees `[−k−1,−k]` and is zero iff it has a Lagrangian concentrated in degree `−k−1`. The same holds for any `m`-quadratic `Q` provided `n ≤ 2m` (surgery below the middle dimension). (Paper III, Example 1.2.8, pp. 16–17.)

Apply §4.1 with `(a,b) = (0,1)` for `n` even and `(1,0)` for `n` odd; read the intervals from §3.3.

This gives `quadratic_representatives`.

**Checks.**

- For `R = ℤ`, `L^q_0(ℤ) = ℤ` is generated by the `E₈` form in degree 0 (GeometryOfNumbersAndQuadraticArithmetic §6.10a).

*Needs:* §4.1; §2.2.

### 4.3 Representatives for genuine symmetric L-groups

For every `n ≥ 0`, every class of `L^gs_n(R;M)` is represented by a Poincaré object concentrated in degrees `[−n,0]`, and such an object is zero iff it has a Lagrangian concentrated in degrees `[−n−1,0]`. Equivalently `L^{n,n+1}_n(R;Q^gs_M) → L^gs_n(R;M)` is an isomorphism. (Paper III, Corollary 1.2.9, p. 17.)

`Q^gs_M` is 0-quadratic (§2.2); apply §4.1 with `m = 0`, `(a,b) = (n,n+1)`: `a = n ≥ n`, `b = n+1 ≥ n+1`, and `n + a`, `n + 1 + b` are even.

This gives `genuine_symmetric_representatives`.

**Checks.**

- `n = 0`: classes are symmetric forms on projective modules and Lagrangians are complexes in `[−1,0]`.

*Needs:* §4.1; §2.2.

### 4.4 Quadratic L-theory agrees with an `m`-quadratic flavour in low degrees

If `Q` is `m`-quadratic (for instance `Q = Q^{≥m}_M`), the map `L^q_n(R;M) = L_n(R;Q^q_M) → L_n(R;Q)` is an isomorphism for `n ≤ 2m − 3` and surjective for `n = 2m − 2`. The range is essentially optimal: for `R = ℤ` and `m = 0`, `ℤ/2 ≅ L^q_{−2}(ℤ) → L^gs_{−2}(ℤ) = 0` is not injective. (Paper III, Corollary 1.2.12 and Remark 1.2.13, p. 18.)

For `n ≤ 2m − 2` pick `a ∈ {0,1}` with `n + a` even; then `a ≥ n − 2m`, so both sides are represented by `((−n−a)/2)`-connective objects (§4.1 (i)). On such `X`, `DX ≃ ΣⁿX` is `((n−a)/2)`-connective, so the cofibre of `Q^q_M(X) → Q(X)` is `(m + (n−a)/2)`-connective and `m + (n−a)/2 ≥ n + 1`; hence `Q^q_M(X) → Q(X)` is onto on `π_n`: surjectivity. For `n ≤ 2m − 3` pick `b ∈ {0,1}` with `n + 1 + b` even; by (ii) a Lagrangian may be taken with `L` and its fibre `((−n−1−b)/2)`-connective; then `DL ≃ Σ^{n+1}N` is `((n+1−b)/2)`-connective and the cofibre on `L` is `(2m+n+1−b)/2 ≥ n + 2` connective, so `Q^q_M(L) → Q(L)` is bijective on `π_n` and onto on `π_{n+1}`: the Lagrangian refines to a `Q^q_M`-Lagrangian: injectivity.

This gives `quadratic_low_degree_comparison`.

**Checks.**

- `Q = Q^gs_M (m = 0)`: `L^q_n ≅ L^gs_n` for `n ≤ −3` and onto for `n = −2`.
- `Q = Q^gq_M (m = 2)`: `L^q_n ≅ L^gq_n` for `n ≤ 1` (compare GeometryOfNumbersAndQuadraticArithmetic §6.10a over `ℤ`).

*Needs:* §4.1; §2.1; §2.5.

### 4.5 Degree-zero L-groups are classical Witt groups

If `Q` is 0-quadratic, `W(Proj(R);Q) → L₀(R;Q)` is an isomorphism. Consequently (i) `L^gs_0(R;M)` is the Witt group of `M`-valued symmetric forms over `R`, (ii) `L^ge_0(R;M)` the Witt group of `M`-valued even forms, and (iii) `L₀(R;Q^{≥m}_M)` the Witt group of `M`-valued quadratic forms for every `m ≥ 2`. Combined with `L^gs_{−2k}(R;M((−1)^k)) ≅ L₀(R;Q^{≥k}_M)` (§1.6), every even non-positive genuine symmetric L-group is a Witt group of symmetric `(k = 0)`, even `(k = 1)` or quadratic `(k ≥ 2)` forms; the analogous descriptions of odd groups in degrees `≤ 1` by symmetric, even and quadratic formations assume the additional odd-formation comparison stated in Scope and ownership. (Paper III, Proposition 1.2.15, Corollary 1.2.16, p. 19, and Remark 1.2.17, p. 20; Paper I, Proposition 4.2.22, p. 73.)

`W(Proj(R);Q) ≅ L^{0,0}_0(R;Q)` (§3.4), `L^{0,0}_0 ≅ L^{0,1}_0` (§3.6) and `L^{0,1}_0 ≅ L₀` (§4.1 with `m = 0`, `(a,b) = (0,1)`). On `P[0]` the values of `Q^{≥2}`, `Q^{≥1}`, `Q^{≥0}` are the groups of quadratic, even and symmetric forms (GeometryOfNumbersAndQuadraticArithmetic §6.8a; Calmès et al. I, Proposition 4.2.22): this gives (i)–(iii) for `m = 0`, 1, 2. For `m > 2`, `L^q_0 → L₀(Q^{≥m})` is an isomorphism by §4.4 `(0 ≤ 2m − 3)`, reducing to `m = 2`. Shift with §1.6 for the negative even degrees.

This gives `witt_group_computes_L0`.

**Checks.**

- `L^gs_0(𝔽₂) = W(𝔽₂) = ℤ/2` generated by `⟨1⟩`; `L^ge_0(𝔽₂) = 0` because even forms in characteristic 2 are alternating and hence metabolic.
- `L^gs_0(ℤ) = ℤ` by signature and `L₀(ℤ;Q^gq) = ℤ` by signature/`8 (E₈)`.

*Needs:* §3.4; §3.6; §4.1; §4.4; §1.6; GeometryOfNumbersAndQuadraticArithmetic §6.8a; QuadraticFormInvariants Layer 4 and TauCeti.WittRing.

### 4.6 `Free` and `K₀`-controlled variants

Let `𝒞` be a full stable subcategory with `D^f(R) ⊆ 𝒞 ⊆ D^p(R)` closed under the duality, for instance the objects whose class in `K₀(R)` lies in a given involution-closed subgroup. Assume `M` is free so that `D^f(R)` is duality-stable. Then the results of §4.1, §4.3 and §4.5 hold for `(𝒞,Q|_𝒞)`, with projective modules replaced by stably free (respectively stably-`𝒞`) ones. For example, for 0-quadratic `Q` every element of `L_n(D^f(R),Q)`, `n ≥ 0`, is represented by a Poincaré form on a complex of stably free modules in degrees `[−n,0]`, vanishing iff it has a Lagrangian of stably free modules in degrees `[−n−1,0]`, and `L₀(D^f(R),Q)` is the Witt group of stably free Poincaré objects. (Paper III, Remark 1.2.18, p. 20.)

In the proof of quadratic surgery choose `P` free; the surgery then stays in `D^f(R)` (or in `𝒞`). The connectivity bounds translate into stably free representability by the refinement in §2.4. Repeat the proof of §4.5 with stably free modules.

This gives `controlled_variants`.

**Checks.**

- `𝒞 = D^p(R)` recovers the uncontrolled statements.
- For `R` a principal ideal domain, stably free `=` free and `D^f(R) = D^p(R)`.

*Needs:* §4.1; §4.5; §2.4.

### 4.7 Ranicki's short symmetric L-groups

Let `Ch^b(Proj(R))` be bounded chain complexes of finitely generated projective left `R`-modules, a strict `n`-dimensional model having `C_i = 0` for `i ∉ [0,n]`, and `DC` the dual complex `Hom_R(C,M)` with `(DC)_i = D(C_{−i})`. For `n ≥ 0`, an `n`-dimensional (symmetric) Poincaré complex is `(C,q)` with `C n`-dimensional and `q ∈ H_n(Hom_R(DC,C)^{hC₂})` (homotopy fixed points computed with the standard free resolution of `ℤ` over `ℤ[C₂]`) whose image in `H_n(Hom_R(DC,C)) = [DC[n],C]` is an isomorphism in the homotopy category. An `(n+1)`-dimensional Poincaré pair is `(f : C → C′, η)` with `C n`-dimensional, `C′ (n+1)`-dimensional and `η ∈ H_n(fib[Hom_R(DC,C) → Hom_R(DC′,C′)]^{hC₂})` whose images in `[DC[n],C]` and `[cof(DC′ → DC)[n],C′]` are isomorphisms. A Poincaré complex arising as the boundary of a pair is null-cobordant; `(C,q)`, `(C′,q′)` are cobordant if `(C ⊕ C′, q ⊕ −q′)` is null-cobordant. The cobordism classes form an abelian group `L^short_n(R;M)` under `⊕` with `−(C,q) = (C,−q)`; form-preserving quasi-isomorphisms give cobordant complexes, and `L^short_n` is the cokernel of `M^short_n(R) → Pn^short_n(R)` in commutative monoids. For negative `n`, Ranicki puts `L^short_n(R;M) := L^{short,ev}_{n+2}(R;−M)` for `n = −2`, `−1` and `L^short_n(R;M) := L^q_n(R;M)` for `n ≤ −3`, where `L^{short,ev}_n` is the cobordism group of even complexes: those whose Wu class `v₀(q) : H^n(C) → Ĥ^0(C₂;M)` vanishes, with even pairs defined by the vanishing of the relative Wu class on `H^{n+1}(f)`. Dimension is invariant under chain homotopy equivalence: an `n`-dimensional complex is one admitting such a strict projective model. The constructions and comparisons are independent of the chosen model. (Paper III, Definition 1.2.19, p. 20, and Remarks 1.2.20–1.2.21, pp. 20–21; Ranicki, §1, printed pp. 96–104 (PDF pp. 10–18: complexes, dimensions, standard resolution and `Q`-groups), pp. 112–114 (PDF pp. 26–28: Wu classes); §3, pp. 133–139 (PDF pp. 47–53: pairs, cobordism and even symmetric groups).)

Ranicki writes the coefficient as `R(ε)`; the construction here uses an arbitrary invertible `M` and its induced duality. The group `H^n(C)` means `H_{−n}(DC)`.

Ranicki's definitions (Ranicki 1980, §1 and §3) use only the duality `C ↦ DC` on complexes and the `C₂`-action on `Hom_R(DC,C)`, so they extend from `R(ε)` to any invertible `M`. A quasi-isomorphism `f : C → C′` with `f_*q = q′` gives a Poincaré pair with boundary `C ⊕ C′`, written `(id,f) : C → C ⊕ C′` in the Lagrangian convention of Remark 1.2.21, witnessing the cobordism; so quasi-isomorphism is finer than cobordism and the monoid presentation follows.

Provide strict models, their cobordism quotient and the Wu obstruction.

- `RanickiPoincareComplex R M n`: An `n`-dimensional complex of finitely generated projectives with a class `q ∈ H_n(Hom_R(DC,C)^{hC₂})` whose underlying map `DC[n] → C` is a homotopy equivalence.
- `RanickiPoincarePair`: An `(n+1)`-dimensional pair `(f, η)` with both duality maps homotopy equivalences.
- `RanickiPoincarePair.boundary`: The boundary Poincaré complex `(C, η|_C)`.
- `shortL R M n`: `L^short_n(R;M)`, cobordism classes; for `n < 0` Ranicki's even/quadratic extension.
- `shortL.neg`: `−[C,q] = [C,−q]`.
- `shortL.ofQuasiIso`: A quasi-isomorphism carrying `q` to `q′` gives a cobordism.
- `shortEvenL R M n`: Cobordism group of even complexes (Wu class `v₀ = 0`).
- `wuClassZero`: The Wu class `v₀(q) : H^n(C) → Ĥ^0(C₂;M)`.
- `shortL.lift`: An additive invariant of Poincaré complexes descends uniquely to `shortL` when it vanishes on boundaries of allowed Poincaré pairs.

**Checks.**

- For `n = 0`, a Poincaré complex is a projective module with a nondegenerate `M`-valued symmetric form, and `L^short_0(R;M)` is the symmetric Witt group; over `ℤ` with `M = ℤ` it is `ℤ` by signature.
- In dimension zero the integral line `⟨1⟩` has Wu class `ℤ → ℤ/2` given by reduction: its diagonal is `x² ≡ x (mod 2)`.
- For the line `⟨1⟩` over `𝔽₂`, the Wu class is the identity of `𝔽₂`; the line is not even.
- For the alternating hyperbolic plane over `𝔽₂`, the Wu class is zero, so the plane is even.
- For `n ≤ −3`, `L^short_n(R;M)` is by definition `L^q_n(R;M)`, so `L^short_{−3}(ℤ) = L^q_{−3}(ℤ) = L^q_1(ℤ) = 0`.
- Over `𝔽₂` the even L-group `L^{short,ev}_0(𝔽₂) = 0`: an even form in characteristic 2 is alternating, hence has a Lagrangian; so `L^short_{−2}(𝔽₂) = 0` while `L^s_{−2}(𝔽₂) = ℤ/2`.
- On `C = ℤ[0]` the symmetric structure `q = 2 ∈ H_0(Hom_ℤ(Dℤ,ℤ)^{hC₂})` has underlying map `2 : ℤ → ℤ`, not an isomorphism, so `(ℤ[0],2)` is a symmetric complex but not a Poincaré complex.
- `L^short_0(R;M)` is the Witt group of `M`-valued symmetric forms on projectives (compare §4.5).
- A strict symmetric pairing `C ⊗ C → R[−n]` does not specify Ranicki's structure: the latter is a class in homotopy fixed points of `Hom_R(DC,C)`, retaining its coherent symmetric data.

The short groups agree with genuine symmetric groups (Paper III, Theorem 1.2.22, p. 21). Their connective spectrum is the third term of the classical `GW` fibre sequence (Theorem 1 and Theorem 5, pp. 2 and 4). The resulting stable comparison improves Ranicki's Proposition 4.5 in the stated range (Paper III, Remark 1.3.13, p. 31).

*Needs:* Mathlib ChainComplex; Mathlib HomologicalComplex.homology; Mathlib Module.Projective; §0.1; the supplier `C₂`-spectrum and Tate API (§6.1a).

### 4.8 Ranicki's groups are bounded L-groups of the symmetric structure

Let `I_n ⊆ Ch^b(Proj(R))` be the `n`-dimensional complexes with quasi-isomorphisms and `J_{[0,n]} ⊆ D^p(R)^≃` the perfect modules representable in degrees `[0,n]`. Localisation restricts to `π : I_n → J_{[0,n]}`. Every object of `J_{[0,n]}` has such a model, and every equivalence between two chosen models' images is represented by a chain homotopy equivalence: the homotopy category of bounded projective complexes is fully faithful in `D^p(R)`. There are natural isomorphisms `H_n(Hom_R(DC,C)^{hC₂}) ≅ π_n(Hom_R(DπC,πC)^{hC₂}) ≅ π₀Ω^nQ^s_M(πDC)`. Sending `(C,q)` to the component of `(πDC, ρ(q))` is a monoid isomorphism `Pn^short_n(R) ≅ π₀Pn^n_n(R;Q^s_M)`, compatible with pairs, and induces `L^short_n(R;M) ≅ L^{n,n+1}_n(R;Q^s_M)` for `n ≥ 0`. (Paper III, Construction before Proposition 1.2.23, p. 21, and Proposition 1.2.23, p. 21.)

The localisation `Ch^b(Proj(R)) → D^p(R)` identifies homotopy classes of maps and preserves sums; complexes in `[0,n]` go to objects representable in `[0,n]` (§2.4), and `DπC` is then concentrated in `[−n,0]`, matching the bounds of `Pn^n_n`. The `Hom` complex computes the mapping spectrum (GeometryOfNumbersAndQuadraticArithmetic §6.8a `perfectDerivedHom`) and the explicit resolution computes homotopy fixed points, giving `ρ`. Applying the same construction to arrow categories gives `M^short_n(R) → π₀M^{n,n+1}_n(R;Q^s_M)` compatibly; every arrow of `D^p(R)` lifts to a chain map, which gives surjectivity, hence an isomorphism of quotients.

This gives `short_to_bounded`.

**Checks.**

- `n = 0`: both sides are Witt groups of symmetric forms on projectives (§3.4).
- For `n = 1` and `R ≠ 0`, the contractible complex `R →^{id} R` in degrees `[0,1]` and the zero complex have equivalent derived images. The quasi-isomorphism to zero is not an isomorphism of chain complexes. Thus the comparison uses homotopy classes of chain maps and quasi-isomorphism classes of forms; it does not identify the ordinary category `I_n` with a groupoid.

*Needs:* §4.7; §3.3; §2.4; GeometryOfNumbersAndQuadraticArithmetic §6.8a; Mathlib DerivedCategory.

### 4.9 Symmetric and `r`-symmetric forms agree in bounded width

Let `Q` be `r`-symmetric and `a`, `b`, `n` as in §3.3 with `a ≤ n + 2r − 4` and `b ≤ n + 2r − 3`. Then `L^{a,b}_n(R;Q) → L^{a,b}_n(R;Q^s_M)` is an isomorphism. In particular, `Q^gs_M` being 2-symmetric, `L^{n,n+1}_n(R;Q^gs_M) ≅ L^{n,n+1}_n(R;Q^s_M)` for every `n ≥ 0`. (Paper III, Lemma 1.2.24, p. 22.)

It suffices that `π₀Pn^a_n(R;Q) → π₀Pn^a_n(R;Q^s_M)` and `π₀M^{a,b}_n(R;Q) → π₀M^{a,b}_n(R;Q^s_M)` are bijections. For `((−n−a)/2)`-connective `X` the fibre of `Q(X) → Q^s_M(X)` is `(−r + (n+a)/2)`-truncated (§2.1), and `−r + (n+a)/2 ≤ n − 2` because `a ≤ n + 2r − 4`; a map whose fibre is `(n−2)`-truncated induces an equivalence on `Ω^{∞+n}`. For pairs, the map `Q^met(L → X) → Q^{s,met}(L → X)` must have `(n−2)`-truncated fibre; the top map of the square (on `X`) is `(n−2)`-truncated as above and the bottom map (on `L`, which is `⌈(−n−1−b)/2⌉`-connective) is `(n−1)`-truncated by `b ≤ n + 2r − 3`, so the total fibre is `(n−2)`-truncated.

This gives `genuine_symmetric_bounded_agreement`.

**Checks.**

- `(r,a,b) = (2,n,n+1)`: `a = n ≤ n`, `b = n+1 ≤ n+1`.

*Needs:* §3.3; §2.1; §2.2.

### 4.10 Ranicki's even L-groups are genuine even L-groups

For `n ≥ 0`, sending an `n`-dimensional even Poincaré complex `(C,φ)` to `(DC, ρ(φ))` induces isomorphisms `L^{short,ev}_n(R;M) ≅ L^{n,n+1}_n(R;Q^ge_M) ≅ L^ge_n(R;M)`. The refinement of a genuine symmetric to a genuine even structure is controlled by the fibre sequence `Ω^nQ^ge(X) → Ω^nQ^gs(X) → Hom_R(X, Ĥ^0(C₂;M)[−n])`, whose last term has `Ω^∞ ≃ Hom_R(H_{−n}(X), Ĥ^0(C₂;M))`; the image of the symmetric structure there is Ranicki's Wu class `v₀(φ)`. (Paper III, Proof of Theorem 1.2.22, p. 22.)

By §4.8 and §4.9, `(C,φ)` gives a class in `L^{n,n+1}_n(R;Q^gs_M)` represented by `X = DC`. By the defining pullbacks (GeometryOfNumbersAndQuadraticArithmetic §6.8a) the cofibre of `Q^ge_M → Q^gs_M` at `X` is `Hom_R(X, cofib(τ_{≥1}HM^{tC₂} → τ_{≥0}HM^{tC₂})) = Hom_R(X, HĤ^0(C₂;M))`; after `Ω^n` this is the displayed fibre sequence. Tracing the definitions, the image of the symmetric structure is Ranicki's Wu class `v₀(φ)`, which vanishes for even complexes, so the class refines canonically to `Q^ge_M`; the same holds for even pairs, and reversing the argument gives the inverse map. `L^{n,n+1}_n(R;Q^ge_M) ≅ L^ge_n(R;M)` by §4.1 since `Q^ge_M` is 1-quadratic `(a = n ≥ n − 2, b = n + 1 ≥ n − 1)`.

This gives `short_even_comparison`.

**Checks.**

- `n = 0`: `L^{short,ev}_0` is the Witt group of even forms, matching §4.5 (ii).

*Needs:* §4.7; §4.8; §4.9; §4.1; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 4.11 Ranicki's symmetric L-groups are the genuine symmetric L-groups

For every ring `R`, invertible `ℤ`-module with involution `M` over `R` and every `n ∈ ℤ` there is a natural isomorphism `L^short_n(R;M) ≅ L^gs_n(R;M)`. In particular `L^short(R;M) := τ_{≥0}L^gs(R;M)` is a connective spectrum whose homotopy groups are Ranicki's original symmetric L-groups, and Ranicki's negative groups are `L^gs_n(R;M) = L^ev_{n+2}(R;−M)` for `n = −2`, `−1` and `L^q_n(R;M)` for `n ≤ −3`. (Paper III, Theorem 1.2.22, p. 21, with proof p. 22; Theorem 5 and its addendum, p. 4.)

`n ≥ 0`: compose `L^short_n ≅ L^{n,n+1}_n(R;Q^s_M)` (§4.8) `≅ L^{n,n+1}_n(R;Q^gs_M)` (§4.9) `≅ L^gs_n(R;M)` (§4.3). `n ≤ −3`: `L^q_n ≅ L^gs_n` by §4.4 with `m = 0`, matching Ranicki's definition. `n = −2`, `−1`: `L^gs_n(R;M) ≅ L^ge_{n+2}(R;−M)` by §1.6, and `L^ge_{n+2}(R;−M) ≅ L^{short,ev}_{n+2}(R;−M)` by §4.10.

This gives `ranicki_genuine_symmetric`.

**Checks.**

- `L^gs_n(ℤ)` for `n = 0`, 1 is `ℤ` (signature) and `ℤ/2` (de Rham invariant), as in GeometryOfNumbersAndQuadraticArithmetic §6.10a.
- `L^gs_{−2}(𝔽₂) = L^ge_0(𝔽₂) = 0`.

*Needs:* §4.8; §4.9; §4.3; §4.4; §4.10; §1.6.

### 4.12 Ranicki's quadratic L-groups and a warning

For `n ≥ 0`, Ranicki's `n`-th quadratic L-group (quadratic Poincaré complexes of dimension `n`) coincides with `L^{n,n+1}_n(R;Q^q_M)` and hence with `L^q_n(R;M)`; these are Wall's quadratic L-groups, the recipients of surgery obstructions. They are not `L^gq_n(R;M)`: by periodicity `L^gq_n(R;M) ≅ L^gs_{n−4}(R;M)`. (Paper III, Remark 1.2.25, p. 23.)

Run §4.8 with homotopy orbits in place of fixed points to get Ranicki's quadratic group `≅ L^{n,n+1}_n(R;Q^q_M)`, then §4.1 (`Q^q_M` is `m`-quadratic for all `m`). `Σ⁴L^gs ≃ L^gq` by §1.6.

This gives `ranicki_quadratic_wall`.

**Checks.**

- Over `ℤ`, `L^q_2(ℤ) = ℤ/2` (Arf invariant) whereas `L^gq_2(ℤ) ≅ L^gs_{−2}(ℤ) = 0`, so Ranicki's (Wall's) quadratic L-groups are not the genuine quadratic ones.

*Needs:* §4.8; §4.1; §1.6.

### Examples

For `Q^gs` the parameters are `m=0` and `r=2`. Quadratic surgery with `(a,b)=(n,n+1)` for `n≥0` gives objects in `[−n,0]` and Lagrangians in `[−n−1,0]`. The `r`-symmetric comparison has inequalities `a≤n` and `b≤n+1`, exactly the same bounds. Their composite identifies short symmetric groups with genuine symmetric groups. In degree `−2` over `ℤ`, quadratic L-theory is `ℤ/2` while genuine symmetric L-theory is zero, so the low-degree isomorphism bound `−3` cannot be raised.

### Dependencies

Layers 0–3; the supplier perfect-derived mapping spectra, genuine structures and classical form identifications; Mathlib chain complexes and derived categories.

## Layer 5: surgery over connective ring spectra

Replace perfect complexes over a discrete ring by compact modules over a connective `E₁`-ring. Recognize the projectives needed for surgery, lift them across a `π₀`-isomorphism, and control the effect of a ring-spectrum map on forms and L-groups.

### 5.1 Poincaré structures on compact modules over a connective ring spectrum

Let `A` be a connective `E₁`-ring (a connective associative algebra in spectra, `⊗` over `𝕊`) and `Mod^ω_A` its stable ∞-category of compact left modules; `Proj(A) ⊆ Mod^ω_A` are the retracts of `A^n`. Let `M` be an invertible module with involution over `A` (Calmès et al. I, Definition 3.1.1) that is projective in either `A`-module structure, so the duality `D = hom_A(−,M)` preserves `Proj(A)`. The quadratic and symmetric structures are `Q^q_M(X) = hom_{A⊗A}(X⊗X,M)_{hC₂}` and `Q^s_M(X) = hom_{A⊗A}(X⊗X,M)^{hC₂}`; the genuine symmetric structure `Q^gs_M` is the pullback of `Q^s_M(X) → hom_A(X,M^{tC₂})` along `hom_A(X,τ_{≥0}M^{tC₂})`; for a connective `E∞`-ring `B` the Tate structure `Q^t_B` is the pullback of `Q^s_B(Y) → hom_B(Y,B^{tC₂})` along the Tate-valued Frobenius `hom_B(Y,B) → hom_B(Y,B^{tC₂})`; and on `Mod^ω_𝕊` the universal structure `Q^u` has linear part `hom(−,𝕊)` and agrees with `Q^t_𝕊`. An `A`-module is `k`-connective if its underlying spectrum is; `Q` is `m`-quadratic if the cofibre of `Q^q_M → Q` is `m`-connective on `A`, equivalently on `Proj(A)`; `Λ_Q` denotes the linear part. `Pn^a_n`, `M^{a,b}_n` and `L^{a,b}_n(A;Q)` use the same connectivity bounds and cokernel as §3.3. The maps A `→ π₀A` and `M → π₀M` induce Poincaré functors `(Mod^ω_A, Q^α_M) → (Mod^ω_{π₀A}, Q^α_{π₀M})` for `α = q`, `gs`, and `B → π₀B` induces one for `Q^t`. A map of spectra is `k`-connective when its fibre is `k`-connective, equivalently its cofibre is `(k+1)`-connective; thus a 1-connective map induces an isomorphism on `π₀` and a surjection on `π₁`. (Paper III, §1.2, 'Surgery for connective ring spectra', p. 23, and the paragraph before Corollary 1.2.33, p. 26; Paper I, Definition 3.1.1, p. 47; Example 1.2.15, p. 21; Example 3.2.12, p. 53.)

Construct `Mod_A` using EnhancedDerivedSheaves §E5:abstract, `leftModuleObjects`, and take its compact objects using §E5:presentability. These form a small stable idempotent-complete category. Extension of scalars along `A→B` is `B⊗_A−` on left modules. The formulas define Poincaré structures with duality `hom_A(−,M)` by Calmès et al. I, §3 (Lemma 3.2.5, Construction 3.2.6, Examples 3.2.8 and 3.2.12); the pullback along a connective cover of the Tate term is the genuine construction of GeometryOfNumbersAndQuadraticArithmetic §6.8a over a ring spectrum. The universal structure is Calmès et al. I, Example 1.2.15; its linear part is `hom(−,𝕊)`, and the Frobenius `𝕊 → 𝕊^{tC₂}` identifies it with `Q^t_𝕊`. Base change along `A → π₀A` preserves compact modules and the forms, giving the Poincaré functors.

Extend the supplier’s Poincaré structures to these connective ring-spectrum constructions.

- `ConnRingPoincare A M`: A connective `E₁`-ring, a projective invertible module with involution and a Poincaré structure on `Mod^ω_A` with duality `hom_A(−,M)`.
- `ConnRingPoincare.quadratic`: `Q^q_M` on `Mod^ω_A`.
- `ConnRingPoincare.genuineSymmetric`: `Q^gs_M` by pullback along `τ_{≥0}M^{tC₂} → M^{tC₂}`.
- `ConnRingPoincare.tate`: `Q^t_B` for a connective `E∞`-ring `B`, via the Tate-valued Frobenius.
- `ConnRingPoincare.universal`: `Q^u` on `Mod^ω_𝕊`, equal to `Q^t_𝕊`.
- `ConnRingPoincare.toPi0`: The Poincaré functors to `(Mod^ω_{π₀A}, Q^α_{π₀M})`.
- `ConnRingPoincare.linearPart`: `Λ_Q(A) = cofib(Q^q_M(A) → Q(A))`.
- `ConnRingPoincare.isConnectiveMap`: A map `f` is `k`-connective iff `fib(f)` is `k`-connective, iff `π_i(f)` is an isomorphism for `i < k` and surjective for `i = k`.

**Checks.**

- For `A = HR` with `R` discrete, `Mod^ω_A ≃ D^p(R)` and `Q^gs_M` is the supplier’s genuine symmetric structure.
- The linear part of `Q^t_B` on `B` is `B` itself, mapping to `B^{tC₂}` by the Frobenius; for `B = Hℤ`, `π₀` of the Frobenius `ℤ → ℤ^{tC₂}` is the surjection `ℤ → ℤ/2`.
- `Q^u` is 0-quadratic because its linear part `hom(−,𝕊)` is connective on `𝕊`.
- Compact is weaker than projective: over `A = 𝕊` the cofibre `𝕊/2` of `2 : 𝕊 → 𝕊` is compact and connective, but `π₀(𝕊/2) = ℤ/2` is not a projective `ℤ`-module, so `𝕊/2 ∉ Proj(𝕊)`.
- `Hℤ → H𝔽₂` has 1-connective cofibre but fibre `H(2ℤ)` in degree 0, so it is only 0-connective and fails the 1-connective hypothesis of Proposition 1.2.29. A `→ Hπ₀A` for connective `A` has 1-connective fibre.
- For `A = Hℤ` discrete, `Mod^ω_A ≃ D^p(ℤ)` and the structures are those of GeometryOfNumbersAndQuadraticArithmetic §6.8a.
- `Λ_{Q^q_M} = 0`.

Quadratic surgery and comparison along a 1-connective map use this setting and its linear-part functor (Paper III, Proposition 1.2.26, p. 23 and Proposition 1.2.29, p. 24). It also supports the comparisons of `q`, `gs`, `t` and `u` with their `π₀` versions (Corollary 1.2.33 and Examples 1.2.31, 1.2.35).

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §6.8a; EnhancedDerivedSheaves §E5:abstract, leftModuleObjects; EnhancedDerivedSheaves §E5:presentability, compact objects; the supplier connective K-spectrum; the supplier `C₂`-spectrum and Tate API (§6.1a); §2.1; §3.3.

### 5.2 Compact connective modules and recognition of projectives

Let `A` be a connective `E₁`-ring. If `X ∈ Mod^ω_A` is connective then `π₀X` is finitely presented over `π₀A`, so there is `A^n → X` with 1-connective cofibre. If `X` is projective so is `DX` and both are connective; conversely if `X` and `DX` are connective then `X` is projective, and more generally `X` is the `k`-fold suspension of a projective iff `X` is `k`-connective and `DX` is `(−k)`-connective. If `X` is connective and `DX` is `(−1)`-connective, `X` is the cofibre of a map `P → Q` of projectives; more generally `X` is `k`-connective with `DX (−k−1)`-connective iff `X` is the `k`-fold suspension of such a cofibre. (Paper III, Lemma 1.2.27, p. 23, and Remark 1.2.28, pp. 23–24; Paper III, Remark 1.2.28, p. 23.)

`π₀A ⊗_A X` is connective and perfect over the discrete ring `π₀A` with the same `π₀`; over a discrete ring connective perfect modules are finite complexes of projectives in non-negative degrees (§2.4), so `π₀` is finitely presented. Given `A^n → X → Y` with `Y 1`-connective, invertibility of `M` gives `hom_A(X,Y) ≃ hom_A(M,Y) ⊗_A DX`, which is 1-connective when `DX` is connective; so `X → Y` is null and `A^n → X` splits up to homotopy. For the two-term case, `P := ΩY` is connective with `D_MP` the cofibre of `D_MX → M^n`, hence connective, so `P` is projective by the first case and `X = cofib(P → A^n)`.

This gives `compact_connective_pi0`.

**Checks.**

- For `A` discrete these reduce to §2.4 with intervals `[k,k]` and `[k,k+1]`.

*Needs:* §5.1; §2.4.

### 5.3 Quadratic surgery over connective ring spectra

Let `Q` be an `m`-quadratic Poincaré structure on `Mod^ω_A`, `n ∈ ℤ`, and `a`, `b ≥ 0` with `b ≥ a − 1` and `n + a`, `n + 1 + b` even. (i) If `a ≥ n − 2m`, every Poincaré object of `(Mod^ω_A, Q[−n])` is cobordant to a `((−n−a)/2)`-connective one. (ii) If `b ≥ n − 2m + 1`, every Lagrangian `L → X` of such an object is cobordant relative to `X` to one with `L′` and `fib(L′ → X)` both `((−n−1−b)/2)`-connective. If both hold, `L^{a,b}_n(A;Q)` is a group and `L^{a,b}_n(A;Q) → L_n(A;Q)` is an isomorphism. (Paper III, Proposition 1.2.26 and its proof, p. 23.)

The estimate in §2.5 holds for `Σ^kP` with `P ∈ Proj(A)`. The only use of discreteness in §4.1 is the existence of `P[k] → X` with `(k+1)`-connective cofibre for `k`-connective `X`; this is §5.2. The remaining surgery and relative-surgery steps are those of §4.1.

This gives `ring_spectrum_surgery`.

**Checks.**

- For `A = HR` this is §4.1.

*Needs:* §5.1; §5.2; §4.1.

### 5.4 Lifting projectives along a `π₀`-isomorphism

Let `f` : A `→ B` be a map of connective `E₁`-rings inducing an isomorphism `π₀A → π₀B` (for instance a 1-connective map). Then extension of scalars `B ⊗_A − : Proj(A) → Proj(B)` induces an equivalence of homotopy categories. Hence each projective `B`-module lifts up to isomorphism in the homotopy category. Once source and target lifts are fixed, each map has a unique homotopy class of lifts. Perfect `B`-modules presented as (co)fibres of maps of projectives therefore lift to perfect `A`-modules of the same kind. (Higher Algebra, Corollary 7.2.2.19, pp. 1245–1246; Paper III, Remark 1.2.32, p. 25.)

Full faithfulness: for `P` free, `Ext⁰_A(P,Q)` is a product of copies of `π₀Q` and `Ext⁰_B` is a product of copies of `π₀(B ⊗_A Q) ≅ Tor^{π₀A}_0(π₀B, π₀Q) ≅ π₀Q`. Essential surjectivity: a projective `B`-module is a retract of `B^n`; lift the idempotent on `π₀` and realise it on `A^n` (Lurie, HA, Corollary 7.2.2.19 and the preceding Proposition 7.2.2.18). Lifting (co)fibres of maps of projectives follows by lifting the map.

This gives `lifting_projectives`.

**Checks.**

- For `A = 𝕊`, `B = Hℤ`: `π₀` is `ℤ` in both; free `𝕊`-modules `𝕊^n` lift `ℤ^n` and maps `ℤ^n → ℤ^m` (integer matrices) lift to `𝕊^n → 𝕊^m`.
- The same example does not give an equivalence of projective ∞-categories: `Map_𝕊(𝕊,𝕊)` has `π₁ = ℤ/2`, whereas `Map_{Hℤ}(Hℤ,Hℤ)` has `π₁ = 0`. Uniqueness here concerns homotopy classes, not a contractible space of lifts.

*Needs:* EnhancedDerivedSheaves §E5:abstract, leftModuleObjects; EnhancedDerivedSheaves §E5:abstract, algebra objects.

### 5.5 Comparison of L-groups along a 1-connective map

Fix `m`, `p ∈ ℤ`. Let `f` : A `→ B` be a 1-connective map of connective ring spectra, `M` and `N` projective invertible modules with involution over `A` and `B`, and `Q_M`, `Q_N` Poincaré structures on `Mod^ω_A` and `Mod^ω_B` that are `m`-quadratic with respect to `M` and `N`. Suppose `f_!` refines to a Poincaré functor `(Mod^ω_A,Q_M) → (Mod^ω_B,Q_N)` whose map on bilinear parts `M = B_{Q_M}(A,A) → B_{Q_N}(B,B) = N` is 1-connective and whose map on linear parts `Λ_{Q_M}(A) → Λ_{Q_N}(B)` is `p`-connective. Then `L_n(A;Q_M) → L_n(B;Q_N)` is an isomorphism for `n ≤ min(2p−1, 2m)` and surjective for `n = min(2p, 2m+1)`. (Paper III, Proposition 1.2.29, p. 24, with proof pp. 25–26.)

For `X` with `DX r`-connective, compare the cofibre sequences `Q^q(X) → Q(X) → Λ_Q(X)` for `M` and `N`: the map on the quadratic terms is `(2r+1)`-connective (bilinear part 1-connective) and on linear terms `(r+p)`-connective; hence `Q_M(X) → Q_N`(`f_!X`) is `min(2r+1, r+p)`-connective. Surjectivity for `n ≤ min(2p, 2m+1)`: with `a ∈ {0,1}`, `n + a` even, classes on both sides are represented by `((−n−a)/2)`-connective objects (§5.3); such `B`-objects are shifted projectives or two-term objects (§5.2) and lift to `A` (§5.4); for them `DX` is `r = (n−a)/2 ≤ p` connective and the form map is onto on `π_n`. Injectivity for `n ≤ min(2p−1, 2m)`: with `b ∈ {0,1}`, `n + 1 + b` even, a Lagrangian over `B` may be taken with `L` and its fibre `((−n−1−b)/2)`-connective; write `L = fib(U → V)` with `U`, `V` projective shifts, factor `L → f_!X` through `f_!Q`, lift `U → V` and the map to `Q`, and check that `Q_M(L′) → Q_N`(`f_!L′`) is injective on `π_n` and onto on `π_{n+1}`, which follows from the estimate with `r′ = (n+1−b)/2`.

This gives `connective_comparison`.

**Checks.**

- `f =` id with form map `Q^q_M → Q` on `A`: Corollary 1.2.30 uses `p = m − 1` and recovers the quadratic-to-`Q` comparison. The two structures need not be equal.
- For `Q^q` structures (`Λ = 0` on both sides, `p = ∞`) and `m = ∞` the map is an isomorphism in all degrees.

*Needs:* §5.3; §5.2; §5.4; §5.1.

### 5.6 Quadratic comparison over a ring spectrum and the sphere

If `Q_M` on `Mod^ω_A` is `m`-quadratic with respect to a projective invertible `M`, then `L^q_n(A;M) → L_n(A;Q_M)` is an isomorphism for `n ≤ 2m − 3` and surjective for `n = 2m − 2`. For the sphere: `Q^u` on `Mod^ω_𝕊` is 0-quadratic, so `L^q_n(𝕊) → L^u_n(𝕊)` is an isomorphism for `n ≤ −3`; and since `𝕊^{tC₂}` is the 2-completed sphere, which is connective by Lin's theorem, `Q^s` on `Mod^ω_𝕊` is also 0-quadratic and `L^q_n(𝕊) → L^s_n(𝕊)` is an isomorphism for `n ≤ −3`. (Paper III, Corollary 1.2.30 and Example 1.2.31, pp. 24–25.)

Only the assertion about `Q^s` on finite spectra assumes the Segal–Lin equivalence `𝕊^{tC₂}≃𝕊̂₂`, stated among the additional inputs in Scope and ownership.

Apply §5.5 to `f =` id and `Q^q_M → Q_M`: the bilinear map is the identity, and the map `0 = Λ_{Q^q_M}(A) → Λ_{Q_M}(A)` has fibre `ΩΛ_{Q_M}(A)`, which is `(m−1)`-connective because `Q_M` is `m`-quadratic; with `p = m − 1` the ranges are `n ≤ min(2m−3, 2m) = 2m − 3` and `n = min(2m−2, 2m+1) = 2m − 2`. `Λ_{Q^u}(𝕊) = 𝕊` is connective; `Λ_{Q^s}(𝕊) = 𝕊^{tC₂} ≃ 𝕊^∧₂` is connective by Lin's theorem.

This gives `ring_spectrum_quadratic_comparison`.

**Checks.**

- The same conclusions follow from Weiss–Williams' formula for the cofibre of `L^q → L^u` (cited in the source).

*Needs:* §5.5; §5.1; the supplier `C₂`-spectrum and Tate API (§6.1a).

### 5.7 Comparison of the L-theory of a ring spectrum with that of its `π₀`

Let `A` be a connective ring spectrum, `M` a projective invertible module with involution over `A` and `B` a connective `E∞`-ring. (i) `L^q(A;M) → L^q(π₀A;π₀M)` is an equivalence. (ii) `L^t_n(B) → L^t_n(π₀B)` is an isomorphism for `n ≤ 0` and surjective for `n = 1`. (iii) `L^gs_n(A;M) → L^gs_n(π₀A;π₀M)` is an isomorphism for `n ≤ −3` and surjective for `n = −2`; if the `C₂`-action on the spectrum underlying `M` is trivial, it is an isomorphism for `n ≤ −1` and surjective for `n = 0`. Assuming the additional `ko` Tate computation in Scope and ownership, the linear-part connectivity estimate used in (iii) is optimal: for `𝕊^{2−2σ} ⊗ ko` over `ko`, `(𝕊^{2−2σ}⊗ko)^{tC₂} → ℤ^{tC₂}` is not onto on `π₀`, since `π_*(ko^{tC₂}) = ℤ^∧₂[u^{±1}]` with `|u| = 4` gives `Σ²ko^{tC₂}` trivial `π₀` while `ℤ^{tC₂}` has `π₀ = ℤ/2`; under the additional Segal–Lin input, `𝕊^{2−2σ}` over `𝕊` is another example. The example assumes the separate `ko` Tate computation stated in Scope and ownership. It tests the linear-part estimate; it does not prove failure of an L-group isomorphism outside the range. (Paper III, Corollary 1.2.33 and Remark 1.2.34, p. 26.)

Apply §5.5 to `A → π₀A`: for `Q^q` the linear parts vanish `(p = ∞, m = ∞)`, giving (i) in all degrees. For `Q^t`, `B` is 0-quadratic and the map on linear parts `B → π₀B` is 1-connective `(p = 1)`: iso for `n ≤ min(1, 0) = 0`, onto for `n = 1`. For `Q^gs`, 0-quadratic, the map on linear parts `τ_{≥0}M^{tC₂} → τ_{≥0}(π₀M)^{tC₂}` is `(−1)`-connective `(p = −1)`: iso for `n ≤ −3`, onto for `n = −2`. With trivial action, `M` is a retract of `M^{hC₂}`, so `π₀M^{hC₂} → π₀(π₀M)^{hC₂} = π₀M` is onto, hence `π₀` of the Tate map is onto and the linear map is 0-connective `(p = 0)`: iso for `n ≤ −1`, onto `n = 0`. For the linear-part counterexample use `ko` from GeneralizedCohomology §G5.4, “Canonical examples and maps”. The separate calculation `π_*(ko^{tC₂}) = ℤ₂^∧[u^{±1}]`, `|u| = 4`, is the additional input quoted in Remark 1.2.34, p. 26.

This gives `pi0_comparison`.

**Checks.**

- (i) is the algebraic `π–π` theorem of Lurie's notes, recovered here.
- For `A = 𝕊` and `M = 𝕊` with trivial action, `L^gs_n(𝕊) → L^gs_n(ℤ)` is an isomorphism for `n ≤ −1`.

*Needs:* §5.5; §5.1; GeneralizedCohomology §G5.4 (`ko` only); EnhancedDerivedSheaves §E5:spectra-comparison.

### 5.8 L-theory of the sphere compared with the integers

`Q^u = Q^t` on `Mod^ω_𝕊`, so `L^u_n(𝕊) → L^t_n(ℤ)` is an isomorphism for `n ≤ 0` and surjective for `n = 1`. For the canonical Poincaré functor `(Mod^ω_𝕊, Q^u) → (D^p(ℤ), Q^gs_ℤ)`, both structures are 0-quadratic and the map on linear parts `𝕊 → τ_{≥0}ℤ^{tC₂}` is 0-connective, so `L^u_n(𝕊) → L^gs_n(ℤ)` is an isomorphism for `n ≤ −1` and surjective for `n = 0`. (Paper III, Example 1.2.35, p. 27.)

First claim: §5.7 (ii) with `B = 𝕊`. Second: §5.5 with `m = 0`, `p = 0`: iso for `n ≤ min(−1, 0) = −1`, onto for `n = min(0, 1) = 0`.

This gives `sphere_integers_comparison`.

**Checks.**

- `L^gs_n(ℤ)` for `n ≤ −3` is `L^q_n(ℤ)` (§4.4), consistent with `L^u_n(𝕊) ≅ L^q_n(𝕊) ≅ L^q_n(ℤ)` in that range.

*Needs:* §5.7; §5.5.

### Examples

For `A→Hπ₀A`, the general comparison uses `min(2p−1,2m)`. Genuine symmetric theory has `m=0`, `p=−1` and therefore isomorphisms through `−3` and a surjection in `−2`; with trivial coefficient involution `p=0` improves these to `−1` and 0. The Tate structure has `p=1`, giving degree 0 and 1. These calculations use the fibre convention for connectivity.

### Dependencies

Layers 0–4; EnhancedDerivedSheaves §§E0 and E5 for module spectra and compact objects; the supplier Tate and linear-part contracts. The symmetric finite-sphere and `ko` optimality examples have the additional assumptions stated in Scope and ownership.

## Layer 6: coherent rings and symmetric surgery

Coherence and a uniform projective-dimension bound make Postnikov truncations preserve perfect complexes. In a general bounded t-structure, an upper bound on the dual of the coconnective half supports symmetric surgery; for discrete rings this gives projective interval representatives.

### 6.0 Enhanced truncations and the homotopy-category t-structure

For a supplied stable ∞-category `C`, use Mathlib's `CategoryTheory.Triangulated.TStructure` on hC. Lift its halves to full subcategories of `C` and construct `enhancedTruncationFunctor` with the truncation adjunctions: `τ_{≤n}` is left adjoint to inclusion and `τ_{≥n}` right adjoint. Prove `enhancedTruncationComparison`, identifying their homotopy-category functors with the supplied truncations, and retain the natural fibre sequence `τ_{≥n}X → X → τ_{≤n−1}X`. The API includes functoriality, units and counits, commutation of the two truncations, shift compatibility, the abelian heart comparison and transport under an equivalence preserving the halves. Boundedness means each object lies in some finite interval; it is an explicit hypothesis of symmetric surgery. (Higher Algebra, Definition 1.2.1.4, Proposition 1.2.1.5, Notation 1.2.1.7, Proposition 1.2.1.10 and Remark 1.2.1.12, pp. 38–40.)

**Checks.**

- For the zero stable category every truncation and its fibre sequence is zero.
- For `Perf(K)` with its standard t-structure, `τ_{≥1}K[0] = 0` and `τ_{≤0}K[0] = K[0]`; shifting the input by one shifts the cutoffs by one.
- The unbounded derived category contains `⊕_{n∈ℤ}K[n]`, which lies in no finite interval. Having truncations does not imply boundedness.
- On enhanced derived modules these functors agree with EnhancedDerivedSheaves §0.1's standard truncations after the fixed reversal of cochain degrees.

*Needs:* Mathlib CategoryTheory.Triangulated.TStructure; GeometryOfNumbersAndQuadraticArithmetic §6.1a stable mapping spectra; EnhancedDerivedSheaves §E0.4 stable categories and §0.1 standard derived truncations.

### 6.1 Coherent rings of finite global dimension

A ring `R` is left-coherent if its finitely presented left modules form an abelian category, equivalently if every finitely generated left ideal is finitely presented. Consume AdicSpacesPartIII R2.10, `coherent-modules`, for `Module.IsCoherent`, `IsCoherentRing`, the Noetherian bridge `IsNoetherianRing.isCoherentRing` and the finite-presentation/abelian API over commutative rings. Extend these same carriers and their kernel, cokernel and finite-presentation API to associative rings and left modules here, with the commutative specialization agreeing with the supplier's declarations. Use the supplier uniform left projective-dimension bound `≤d`, expressed on ModuleCat `R` by Mathlib `CategoryTheory.HasProjectiveDimensionLE`. If `R` is coherent of global dimension `≤ d`, every finitely presented module has a resolution of length `≤ d` by finitely generated projectives. Noetherian rings and valuation rings are coherent; `R` has global dimension 0 iff it is semisimple; Dedekind domains have global dimension `≤ 1`. Commutativity is not assumed; 'coherent' and 'global dimension' mean the left versions. (Paper III, §1.3, p. 27 and Remark 1.3.5, p. 28; Example 1.3.7, p. 30; Corollary 1.3.14 and its preceding discussion, p. 31.)

The equivalence of the two coherence conditions is Chase's theorem; finitely presented modules are closed under kernels exactly when finitely generated ideals are finitely presented. For finitely presented `N`, a resolution by finitely generated free modules exists by coherence (kernels of maps between finitely presented modules are finitely presented); truncating at stage `d` gives a projective `d`-th syzygy, since all `Ext^{d+1}` vanish. Semisimple `⇔` every module projective `⇔` global dimension 0; for a Dedekind domain every submodule of a projective is projective (hereditary).

Extend the shared coherence API and add the following bridges to projective dimension. The ideal-finiteness formulation of coherence is `∀ I : Ideal R, I.FG → Module.FinitePresentation R I`.

- `Module.IsCoherent`, `IsCoherentRing`: Extend to associative rings and left modules, retaining the characterization by finite presentation of finitely generated left ideals and the Noetherian bridge.
- Global dimension 0 iff `IsSemisimpleRing`.
- Dedekind domains have global dimension `≤ 1`.
- Over a coherent ring of global dimension `≤ d`, finitely presented modules have length-`≤d` resolutions by finitely generated projectives.

**Checks.**

- For a commutative ring, the extended `IsCoherentRing` is the supplier's predicate, and `Module.IsCoherent R N ↔ Module.FinitePresentation R N` over a coherent ring is the supplier's comparison.
- A field has global dimension 0 and is coherent; the dimension bound holds for every module.
- `ℤ` has global dimension 1, not 0: `ℤ/2` has projective dimension exactly 1.
- The non-maximal order `ℤ[√−3] = ℤ[X]/(X²+3)` has Krull dimension 1 but infinite global dimension. At `(2,X−1)` its cotangent space has dimension 2: on writing `y=X−1`, the relation `y²+2y+4` lies in `(2,y)²`. Its localization is not regular; [Stacks, Tag 00OC](https://stacks.math.columbia.edu/tag/00OC) excludes finite global dimension. Thus Krull dimension cannot supply the bound `≤1`.
- `k[ε]/(ε²)` is Noetherian (hence coherent) but its residue field `k` has infinite projective dimension. Multiplication by `ε` gives a periodic free resolution; tensoring with `k` makes all differentials zero, so every positive Tor group is `k`. Source: [Stacks, Tag 00OC, Proposition 10.110.5](https://stacks.math.columbia.edu/tag/00OC): this Noetherian local ring has Krull dimension zero and cotangent dimension one, so it is not regular and its residue field has infinite projective dimension.
- `ℤ` and every field are coherent of global dimension `≤ 1`, resp. 0.

These conditions let Postnikov truncations preserve perfect complexes (Paper III, §1.3, p. 27) and supply `d` in the surgery and comparison ranges (Corollaries 1.3.3, 1.3.9 and 1.3.10). Dedekind rings give `d≤1` (Corollary 1.3.14, p. 31).

*Needs:* AdicSpacesPartIII R2.10, coherent-modules, Module.IsCoherent, IsCoherentRing, IsNoetherianRing.isCoherentRing and the finite-presentation/abelian API; Mathlib CategoryTheory.HasProjectiveDimensionLE; Mathlib Module.FinitePresentation; Mathlib IsNoetherianRing; Mathlib IsSemisimpleRing; Mathlib IsDedekindDomain.

### 6.2 The Postnikov t-structure on perfect complexes

Let `R` be coherent of global dimension `≤ d`. The connective cover and truncation functors of `D(R)` preserve perfect modules, so `D^p(R)` inherits the Postnikov t-structure with `D^p(R)_{≥0}` the 0-connective and `D^p(R)_{≤0}` the 0-truncated perfect modules. It is bounded, its heart consists of the finitely presented `R`-modules, and for an invertible `M` the duality `D = Hom_R(−,M)` satisfies `D(D^p(R)_{≥0}) ⊆ D^p(R)_{≤0}` and `D(D^p(R)_{≤0}) ⊆ D^p(R)_{≥−d}`. (Paper III, §1.3, p. 27.)

The lowest non-vanishing homology of a perfect complex is finitely presented by coherence; a finite resolution by finitely generated projectives (§6.1) shows truncations remain perfect. The t-structure axioms are inherited from `D(R)` (Mathlib `DerivedCategory.TStructure.t` on the homotopy category, with enhanced truncations from EnhancedDerivedSheaves §0.1 and the comparison of §6.0). `D(D^p(R)_{≥0}) ⊆ D^p(R)_{≤0}` is the one-sided width criterion (§2.4, Remark 1.1.7). For a finitely presented heart module `N`, a length-`≤d` finite-projective resolution (§6.1) computes `RHom_R(N,M)` in homological degrees `[−d,0]`. A coconnective perfect `X` has a finite Postnikov filtration (§6.0) with factors `H_i(X)[i]`, `i≤0`. Their duals are `D(H_i(X))[−i]`, all `(−d)`-connective. Exactness of `D` and extension closure of connectivity give `D(D^p(R)_{≤0}) ⊆ D^p(R)_{≥−d}`. Mathlib DerivedCategory uses cochain complexes. Reindex cochain degree `i` to homological degree `−i`; its cohomological `t.le 0` corresponds to homological connectivity `≥0` and `t.ge 0` to homological truncation `≤0`. Transport shifts, truncations and homology through that reindexing before applying either duality bound.

Expose the restricted t-structure, its heart and both duality bounds.

- `perfectTStructure R`: The Postnikov t-structure on `D^p(R)` for coherent `R` of finite global dimension.
- `perfectTStructure_bounded`: It is bounded.
- `perfectTStructure.heart_eq`: Its heart is the finitely presented modules (of projective dimension `≤ d`).
- `dual_connective_le_zero`: `D(D^p(R)_{≥0}) ⊆ D^p(R)_{≤0}`.
- `dual_coconnective_ge_neg_d`: `D(D^p(R)_{≤0}) ⊆ D^p(R)_{≥−d}`.

**Checks.**

- For a field `K` the heart is finite-dimensional K-vector spaces `= Proj(K)`.
- Over `ℤ`, `D(ℤ/n[0]) ≃ ℤ/n[−1]` for `n ≥ 2`, so the bound `−d = −1` is attained. For `n = 1` the module is zero and does not witness sharpness; for `n = 0` it is `ℤ` and its dual is `ℤ[0]`.
- Over `R = k[x₁,x₂,…]/(x₁x_i : i ≥ 1)` the complex `R →^{x₁} R` is perfect but its `H₁ = Ann(x₁) = (x₁,x₂,…)` is not finitely generated. The linear classes of the variables are independent modulo the square of that ideal, while coherence would make this kernel finite ([Stacks, Tag 05CW](https://stacks.math.columbia.edu/tag/05CW)). In `MvPolynomial ℕ k` the distinguished variable `x₁` is indexed by 0. Thus `τ_{≥1}` need not preserve perfect complexes and `D^p(R)` does not inherit the t-structure.
- For `R = ℤ (d = 1)`: `D(ℤ/2[0]) = ℤ/2[−1]` lies in `D^p(ℤ)_{≥−1}` and not in `D^p(ℤ)_{≥0}`.
- For a field `(d = 0)` the duality exchanges the two halves and the heart is `Proj(K)`.

Apply symmetric surgery to this t-structure to obtain the coherent-ring comparison (Paper III, Corollary 1.3.3, p. 28 and Corollary 1.3.9, p. 30). The torsion-module counterpart enters Dedekind dévissage (Theorem 2.2.4, p. 38), owned by GeometryOfNumbersAndQuadraticArithmetic §6.9.

*Needs:* §6.1; §2.4; Mathlib DerivedCategory.TStructure.t; Mathlib CategoryTheory.Triangulated.TStructure; Mathlib CategoryTheory.Triangulated.TStructure.heart; §6.0; EnhancedDerivedSheaves §0.1, ClassicalDerived.enhancedCategory; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 6.3 `r`-symmetry and bounded L-monoids for a t-structured category

Let `C` be a stable ∞-category with a t-structure `(C_{≥0}, C_{≤0})` and a Poincaré structure `Q` with duality `D`. `Q` is `r`-symmetric if the fibre of `Q(X) → Q^s_D(X)` is `(−r)`-truncated for every `X ∈ C_{≥0}`, where `Q^s_D(X) = hom_C(X,DX)^{hC₂}`. For `a`, `b ≥ −1` define `Pn^a_n(C,Q)`, `M^{a,b}_n(C,Q)` and `L^{a,b}_n(C,Q)` as in §3.3, reading every connectivity condition in the given t-structure. `L^{a,b}_n(C,Q)` is a group if `b ≥ a`, and for `C = D^p(R)` with `R` coherent of finite global dimension and the Postnikov t-structure these agree with the earlier definitions. (Paper III, §1.3, p. 27, before Proposition 1.3.1.)

The definitions only use connectivity of objects, which makes sense in any t-structure. The diagonal argument of §3.3 for `b ≥ a` uses only the bounds on `X`. For `D^p(R)`, the Postnikov connectivity of a perfect module is the connectivity used in Layer 3 (§6.2), and the two `r`-symmetry notions agree by §2.1 (testing on `P[0]` is testing on the heart's projectives and propagating).

Extend the bounded constructions to the chosen t-structure.

- `IsRSymmetricT Q r`: The fibre of `Q → Q^s_D` is `(−r)`-truncated on `C_{≥0}`.
- `boundedLT C Q n a b`: `L^{a,b}_n(C,Q)` for the given t-structure.
- `boundedLT.isGroup_of_le`: Group if `b ≥ a`.
- `boundedLT_perfect_eq`: For `C = D^p(R)` with the Postnikov t-structure, agrees with `boundedL`.
- `boundedLT.lift`: The same cokernel universal property as boundedL.lift, with all three connectivity bounds interpreted in the chosen t-structure.

**Checks.**

- With the standard t-structure on `Perf(𝔽₂)`, `Q^gs` is 2-symmetric but not 3-symmetric: the comparison fibre at `𝔽₂[0]` has nonzero `π_{−2} = 𝔽₂`.
- On `Perf(ℤ)` with its standard t-structure, `Q^gs` is 3-symmetric but not 4-symmetric: the fibre at `ℤ[0]` has `π_{−2} = 0` and `π_{−3} = ℤ/2`. The propagation of §2.1 gives the bound on every connective perfect object.
- `Q^s` is `r`-symmetric for every integer `r`, whereas `Q^q` on `Perf(𝔽₂)` is `r`-symmetric for no integer `r`: its fibre at `𝔽₂[0]` is `ΩH𝔽₂^{tC₂}`, with nonzero homotopy in arbitrarily high degrees.
- For `C = D^p(K)`, `K` a field, `L^{0,0}_0(C,Q^s_K)` is the symmetric Witt group of `K`.
- For the zero category all monoids are zero.
- Shifting the t-structure by `[1]` changes `Pn^a_n`: the same Poincaré object can be `((−n−a)/2)`-connective for one t-structure and not for the shifted one, so the monoids depend on the t-structure, not only on `(C,Q)`.
- On `Perf(K)`, transport symmetric duality through the shift `[1]`, obtaining `D(X) = X^∨[2]` and a symmetric Poincaré form on `K[1]`. With the standard bounded t-structure `D(C_{≤0}) ⊆ C_{≥0}`, so `d = 0` is allowed. For `n = a = b = 0`, `K[1]` is an allowed 0-connective object but is not 0-truncated. Thus `boundedLT` uses connectivity and does not assert concentration in `[0,0]`.
- For a field with the Postnikov t-structure, `L^{0,0}_0(D^p(K),Q^s)` is the Witt group of `K`.

This is the setting of general symmetric surgery (Paper III, Proposition 1.3.1, p. 27). Its application to torsion modules over a Dedekind ring is part of the supplier's dévissage (Theorem 2.2.4, p. 38).

*Needs:* §3.3; §6.2; §2.1; §6.0; EnhancedDerivedSheaves §0.1, ClassicalDerived.enhancedCategory.

### 6.4 Surgery for `r`-symmetric Poincaré structures

Let `C` be a stable ∞-category with a bounded t-structure, `Q` an `r`-symmetric Poincaré structure with duality `D` such that `D(C_{≤0}) ⊆ C_{≥−d}` for some `d ≥ 0`. Fix `n ∈ ℤ` and integers `a ≥ d − 1`, `b ≥ d` with `b ≥ a`, `n + a` even and `a ≥ −n + 2d − 2r`. Then (i) every Poincaré object of `(C,Q[−n])` is cobordant to a `((−n−a)/2)`-connective one; (ii) every Lagrangian `L → X` of a `((−n−a)/2)`-connective Poincaré object is cobordant relative to `X` to a Lagrangian `L′ → X` with `L′ ⌈(−n−1−b)/2⌉`-connective and `fib(L′ → X) ⌊(−n−1−b)/2⌋`-connective. In particular `L^{a,b}_n(C,Q) → L_n(C,Q)` is an isomorphism and `π₀M^{a,b}_n → π₀Pn^a_n → L^{a,b}_n` is exact in the middle. For `C = D^p(R)` with the discrete coefficient duality `Hom_R(−,M)`, the width criterion §2.4 additionally represents objects in `[(−n−a)/2, (−n+a)/2]` and Lagrangians in `[⌈(−n−1−b)/2⌉, ⌈(−n−1+b)/2⌉]`. These interval assertions are not conclusions for a general `C` under the single stated duality bound. (Paper III, Proposition 1.3.1 and Remark 1.3.2, p. 27; proof pp. 28–29; Remark 1.3.6, p. 29.)

(i) Put `k = (−n−a−2)/2`, `W := Ω^nDτ_{≤k}X` and `f : W → Ω^nDX ≃ X` dual to `X → τ_{≤k}X`. `W` is `(−n−k−d)`-connective and `DW ≃ Σ^nτ_{≤k}X` is `(n+k)`-truncated, so `Ω^n hom_C(W,DW)^{hC₂}` is `(n+2k+d)`-truncated; by `r`-symmetry the fibre of `Ω^nQ(W) → Ω^nQ^s_D(W)` is `(k+d−r)`-truncated. Hence `Ω^nQ(W)` is `max(n+2k+d, k+d−r)`-truncated, and the hypotheses give `max(n+2k+d, k+d−r) < 0`. So `Ω^{∞+n}Q(W) ≃ *` and `q|_W` is null: surgery along `f` gives `X′ = cofib(W → τ_{≥k+1}X)`, which is `(k+1)`-connective because `W` is `(k+1)`-connective `(−2k = n+a+2 ≥ n+d+1)`. (ii) If `L` is not `⌈(−n−1−b)/2⌉`-connective, put `l = ⌈(−n−1−b)/2⌉ − 1`, `N′ := Ω^{n+1}Dτ_{≤l}L` and `f : N′ → N` dual to `L → τ_{≤l}L`; the same estimate shows `Ω^{n+1}Q(N′)` is `(−1)`-truncated `(max(n+1+2l+d, l+d−r) < 0)`, giving a Lagrangian surgery datum (§3.2); the new Lagrangian `L′ = cofib(N′ → τ_{≥l+1}L)` is `(l+1)`-connective. Bijectivity of `L^{a,b}_n → L_n` follows as in §4.1.

This gives `symmetric_surgery`.

**Checks.**

- Numerical core: with `n + a` even, `a ≥ d − 1` and `a ≥ −n + 2d − 2r`, `k = (−n−a−2)/2` satisfies `n + 2k + d < 0` and `k + d − r < 0`.
- `r = ∞`, `d = 0` with the additional condition that `D` exchanges both halves: symmetric surgery gives the Witt groups of the heart (GeometryOfNumbersAndQuadraticArithmetic §6.8a `symmetricHeartLTheory`). The single inclusion `D(C_{≤0}) ⊆ C_{≥0}` does not by itself say that both halves are exchanged.

*Needs:* §6.3; §3.2; §3.1; GeometryOfNumbersAndQuadraticArithmetic §6.8a; §2.4.

### 6.5 Symmetric surgery over a coherent ring

Let `R` be coherent of global dimension at most `d`, `M` invertible and `Q` an `r`-symmetric `M`-compatible Poincaré structure on `D^p(R)`. For `n ≥ d − 2r`: if `n + d` is even, `L^{d,d}_n(R;Q) → L_n(R;Q)` is an isomorphism; if `n + d` is odd, `L^{d−1,d}_n(R;Q) → L_n(R;Q)` is an isomorphism. (Paper III, Corollary 1.3.3, p. 28.)

Apply §6.4 to `C = D^p(R)` with the Postnikov t-structure (§6.2), `(a,b) = (d,d)` or `(d−1,d)`: `a ≥ d − 1`, `b ≥ d`, `b ≥ a`, `n + a` even, and `a ≥ −n + 2d − 2r ⇔ n ≥ d − 2r` (`n+d` even) or `n ≥ d − 2r + 1`, automatic by parity (`n+d` odd).

This gives `coherent_symmetric_surgery`.

**Checks.**

- For a Dedekind ring `(d = 1)` and `Q^gs (r = 2)`: `L^{1,1}_n ≅ L^gs_n` for odd `n ≥ −3` and `L^{0,1}_n ≅ L^gs_n` for even `n ≥ −3`.

*Needs:* §6.4; §6.2; §6.1.

### 6.6 Odd vanishing and Witt groups in global dimension at most one

Let `R` be coherent of global dimension at most `d`, `M` invertible and `Q` `r`-symmetric and `M`-compatible. (i) If `d = 0`, `L_{2k−1}(R;Q) = 0` for every `k ≥ 1 − r`. (ii) If `d ≤ 1`, `L_{2k}(R;Q) ≅ W(Proj(R); Ω^{2k}Q(Ω^k −))` for every `k ≥ 1 − r`, via `(P,q) ↦ (P[−k],q)`. For `Q = Q^{≥m}_M (r = 2 − m)`, `π_{2k}Q^{≥m}_M(P[−k]) ≅ π₀Q^{≥m−k}_{(−1)^kM}(P)`, so the Witt group is that of `(−1)^k`-quadratic forms for `k = m − 2`, `(−1)^k`-even forms for `k = m − 1` and `(−1)^k`-symmetric forms for `k ≥ m`; the L-group statement covers `k ≥ m − 1` only, the case `k = m − 2` being §4.5 (iii) transported by §1.6. If `d = 0` (`R` semisimple) the odd symmetric and quadratic L-groups vanish in all degrees; for a field `K` of characteristic `≠ 2`, `L^q_{4k+2}(K) ≅ L^s_{4k+2}(K) = 0`; and the heart of `D^p(R)` is `Proj(R)`, whose symmetric Witt group is `W(Proj(R);Q^gs_M)`. (Paper III, Corollary 1.3.4 and Remark 1.3.5, p. 28; Example 1.3.7, p. 30.)

(i) §6.4 with `d = 0`, `(a,b) = (−1,0)`, `n = 2k−1`: the condition `a ≥ −n − 2r` reads `k ≥ 1 − r`; `Pn^{−1}_n` is contractible (§3.3). (ii) §6.5 with `d = 1` (`n = 2k`, `n + d` odd) gives `L_{2k} ≅ L^{0,1}_{2k}`; §3.6 gives `L^{0,1}_{2k} ≅ L^{0,0}_{2k}`; shifting by `k` and §3.4 identify `L^{0,0}_{2k}` with `W(Proj(R);Ω^{2k}Q(Ω^k−))`. A ring of global dimension 0 also satisfies the hypotheses with `d = 1`, so the same argument applies. The value on `P[−k]` follows from the supplier shift equivalence, and the classical form groups from GeometryOfNumbersAndQuadraticArithmetic §6.8a `(m − k = 2, 1, ≤ 0)`. Semisimple rings: `Q^s_M` is `r`-symmetric for all `r`, giving all odd symmetric groups; for the quadratic ones reduce by §1.6 to `L^q_{−3}(R;M′)`, which is `L^gs_{−3}(R;M′)` by §4.4, and vanishes by (i) with `k = −1 ≥ 1 − 2`. For a field of characteristic `≠ 2`, `L^s_{4k+2}` is the Witt group of antisymmetric forms, which have symplectic bases and so Lagrangians.

This gives `low_dimension_witt`.

**Checks.**

- `R = ℤ (d = 1)`, `Q = Q^gs (r = 2)`, `k = 0`: `L^gs_0(ℤ)` is the Witt group of symmetric forms, `ℤ` by signature.
- `R = 𝔽₂`, `Q = Q^{≥1} (r = 1)`, `k = 0`: `L^ge_0(𝔽₂)` is the Witt group of even forms, which is 0.

*Needs:* §6.4; §6.5; §3.6; §3.4; the supplier shift equivalence; §4.4; §1.6; §4.5; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### Examples

For a field take `d=0`; the even-degree target reduces to the appropriate Witt group and the odd groups in the stated range vanish. For `ℤ` take `d=1`; finitely presented modules are perfect, including `ℤ/2` with its length-one resolution. By contrast `k[ε]/(ε²)` is coherent but has no finite uniform projective-dimension bound, since the module `k` has a periodic resolution.

### Dependencies

Layers 0–4; §6.0; Mathlib projective dimensions, finite presentation and ordinary t-structures; StablePeriodicCurved Layer 4; EnhancedDerivedSheaves §0.1; the supplier perfect enhancement and symmetric heart theorem.

## Layer 7: comparison ranges and field computations

Combine symmetric surgery and bounded-width agreement to prove the comparison ranges. Transport them to right-coherent rings, specialize to Dedekind rings, improve them for 2-torsion-free coefficients, and compute the field cases. The form-parameter and sharpness consequences retain their additional input hypotheses.

### 7.1 Comparison of an `r`-symmetric flavour with symmetric L-theory

Let `R` be coherent of global dimension at most `d`, `M` invertible and `Q` an `r`-symmetric `M`-compatible Poincaré structure on `D^p(R)`. Then `L_n(R;Q) → L_n(R;Q^s_M) = L^s_n(R;M)` is injective for `n ≥ d − 2r + 2` and bijective for `n ≥ d − 2r + 3`. (Paper III, Corollary 1.3.9 and proof, p. 30.)

Compare `L^{d,d}_n` (`n + d` even) or `L^{d−1,d}_n` (`n + d` odd) for `Q` and `Q^s_M`; by §6.5 both compute `L_n` (`Q^s_M` is `r`-symmetric for all `r`). Bijectivity for `n ≥ d − 2r + 3`: the bounded groups agree by §4.9, whose conditions `a ≤ n + 2r − 4`, `b ≤ n + 2r − 3` hold for `(a,b) = (d,d)` (using the parity of `n − d`) and `(d−1,d)`. Injectivity at `n = d − 2r + 2` (so `n + d` even, `(a,b) = (d,d)`): by exactness in the middle (§6.4) it suffices that a `(−d+r−1)`-connective `Q`-Poincaré object whose symmetric image has a `(−d+r−1)`-connective Lagrangian `L` has a `Q`-Lagrangian. The fibre of `Ω^nQ(L) → Ω^nQ^s_M(L)` is `(−1)`-truncated by `r`-symmetry, so the map is injective on `π₀` and onto on `π₁`, and the Lagrangian lifts.

This gives `symmetric_comparison_range`.

**Checks.**

- `Q = Q^gs_M (r = 2)`: injective `n ≥ d − 2`, bijective `n ≥ d − 1`.
- `Q = Q^gq_M (r = 0)`: injective `n ≥ d + 2`, bijective `n ≥ d + 3`.

*Needs:* §6.5; §4.9; §6.4; §2.1.

### 7.2 Comparison of the genuine flavours

Let `R` be coherent of global dimension at most `d` and `M` invertible. Then `L^gs_n(R;M) → L^s_n(R;M)` and `GW^gs_n(R;M) → GW^s_n(R;M)` are injective for `n ≥ d − 2` and bijective for `n ≥ d − 1`; `L^gq_n(R;M) → L^s_n(R;M)` and `GW^gq_n(R;M) → GW^s_n(R;M)` are injective for `n ≥ d + 2` and bijective for `n ≥ d + 3`; and `L^gq_n(R;M) → L^gs_n(R;M)` is injective for `n ≥ d + 2` and bijective for `n ≥ d + 3`. For non-negative `n` this recovers Ranicki's comparison for Noetherian rings of global dimension at most `d` (injective for `n ≥ 2d − 3`, bijective for `n ≥ 2d − 2`), through Theorem 5, and improves those bounds when `d ≥ 2`. For `d = 0` or 1 both comparisons already cover all non-negative degrees. (Paper III, Corollary 1.3.10, pp. 30–31; Theorem 6, p. 4; Remark 1.3.13, p. 31; Ranicki, Proposition 4.5, §4, printed p. 153 (PDF p. 67).)

L-theory: §7.1 with `r = 2` for `Q^gs_M` and `r = 0` for `Q^gq_M` (§2.2). `GW`: the identity functors `(D^p(R),Q^gq_M) → (D^p(R),Q^gs_M) → (D^p(R),Q^s_M)` are Poincaré functors with the same duality, so they induce equivalences on `K(R;M)_{hC₂}`; by the fundamental fibre sequence `K_{hC₂} → GW → L` (GeometryOfNumbersAndQuadraticArithmetic §6.8a `stableGWFundamentalSquare`) the squares from `GW` to `L` are cartesian and the cofibres of the `GW` maps are those of the `L` maps. Use Paper II, Corollary 4.4.13, p. 107 for this fibre sequence. `L^gq_n → L^gs_n`: compose with `L^gs_n → L^s_n`, which is bijective for `n ≥ d − 1 ≤ d + 2`. Comparison with Ranicki: identify `L^gs_n` with `L^short_n` for `n ≥ 0` (§4.11); `d − 1 ≤ 2d − 2` for `d ≥ 1`.

This gives `genuine_comparison_theorem`.

**Checks.**

- `d = 0` (semisimple): `L^gs_n ≅ L^s_n` for `n ≥ −1`.
- `R = ℤ (d = 1)`: `L^gs_n ≅ L^s_n` for `n ≥ 0` and `L^gq_n ≅ L^gs_n` for `n ≥ 4`, consistent with GeometryOfNumbersAndQuadraticArithmetic §6.10a's sharper `ℤ`-ranges.

*Needs:* §7.1; §2.2; §4.11; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 7.3 Sharpness and non-optimality of the comparison ranges

Assume the Ranicki–Shaneson splitting `L(R[ℤ];Q)≃L(R;Q)⊕ΣL(R;Q)`, natural in `Q=Q^gs`,`Q^s`, when `K₀(R)≅K₀(R[ℤ])≅ℤ`. The following sharpness consequences use this additional input.

The bijectivity bound `n ≥ d − 1` for `L^gs → L^s` is sharp: for the `d`-dimensional ring `𝔽₂[ℤ^d]` with the involution induced by inversion, `L^gs → L^s` is not surjective on `π_{d−2}`. Similarly, for `ε = −1`, `L^gs_0(ℤ[ℤ];ε) → L^s_0(ℤ[ℤ];ε)` is not surjective. For `d=0` this already uses a field with trivial involution. (Paper III, Example 1.3.11, p. 31.)

Two further consequences assume separate external comparison theorems. Read's Corollary F gives failure of `L^gs_n(ℤ/4) → L^s_n(ℤ/4)` to be an isomorphism for some `0 ≤ n ≤ 5` and for every sufficiently large `n`, with trivial involution; its proof gives failure of injectivity in every sufficiently large degree (Read, pp. 6–7). Conversely, assume Schlichting's Theorem 1.1 and let `R` be a commutative regular Noetherian domain of finite Krull dimension, with trivial involution. If two is invertible, `R` contains a field, or `R` is smooth over a Dedekind domain, that theorem gives `L^gs_n(R) ≅ L^s_n(R)` for `n ≥ −1` and injectivity at `n = −2`, independently of the dimension. If moreover two is a non-zero divisor, the ranges improve to bijectivity for `n ≥ −2` and injectivity at `n = −3` (Schlichting, pp. 2–3). Thus the general dimension-dependent bounds can be far from optimal on this specified class of rings. These two quoted theorems are additional inputs, rather than consequences of Laurent-ring surgery.

At each induction step, GeneralAlgebraicKTheory §10.12a supplies `regularRing_K0_laurent` and the polynomial and central-localization global-dimension bounds: `𝔽₂[ℤ^j]` is Noetherian of global dimension `≤j`, and scalar extension identifies its `K₀` with `ℤ` generated by the free line. These verify the hypotheses of the Ranicki–Shaneson splitting. Induction then makes `Σ^dL^gs(𝔽₂) → Σ^dL^s(𝔽₂)` a retract of `L^gs(𝔽₂[ℤ^d]) → L^s(𝔽₂[ℤ^d])`; `field_l_groups` (§7.9) supplies its degree-`−2` discrepancy. The `ε = −1` statement over `ℤ[ℤ]` follows by the same retract argument from degree `−1` over `ℤ`; Read’s and Schlichting’s comparisons remain separate assumptions, rather than consequences of this retract argument.

This gives `sharpness_examples`.

**Checks.**

- The example shows that the bijectivity bound `d − 1` for `L^gs → L^s` cannot be improved; since the comparison maps are compatible with `L^gq ≃ Σ⁴L^gs` and `L^s ≃ Σ⁴L^s` (§1.6), the bound `d + 3` for `L^gq → L^s` cannot be improved either. The source presents this as sharpness of the bounds of Corollary 1.3.10; the injectivity bounds are not addressed by the example.
- For `R = 𝔽₂`, `L^gs_{−2}(R) = 0` and `L^s_{−2}(R) = ℤ/2`, so Schlichting's characteristic-two bijectivity range cannot be extended to degree `−2`. For `d > 0` the Laurent examples have a nontrivial inversion involution, outside that theorem's trivial-involution hypothesis. The ring `ℤ/4` is not regular, so Read's failure in high degrees does not contradict the regular-domain result.

*Needs:* §7.2; §7.9; GeneralAlgebraicKTheory §10.12a, regularRing_K0_laurent and polynomial/localization global-dimension bounds.

### 7.4 The right-handed versions

If `R` is right-coherent of finite right global dimension at most `d`, the conclusions of §6.6 (including Ranicki's vanishing), §7.1 and §7.2 hold for `R`. (Paper III, Remark 1.3.12, p. 31.)

Apply the left-handed results to `R^op` with `Q^∨` (§0.4), which is `r`-symmetric when `Q` is (§2.3). Transport along `(D^p(R^op),Q^∨) ≃ (D^p(R),Q)`.

This gives `right_coherent_version`.

**Checks.**

- For commutative `R` left and right agree, and the statement adds nothing.

*Needs:* §0.4; §2.3; §7.2; §7.1; §6.6.

### 7.5 The Dedekind case

Let `R` be a Dedekind ring (for instance a ring of integers of a number field) and `M` invertible. Then `L^gs_n(R;M) → L^s_n(R;M)` and `GW^gs_n(R;M) → GW^s_n(R;M)` are injective for `n = −1` and bijective for `n ≥ 0`; in particular the non-negative homotopy groups of `L^gs(R;M)` are 4-periodic. Likewise `L^gq_n → L^s_n` and `GW^gq_n → GW^s_n` are injective for `n = 3` and bijective for `n ≥ 4`. (Paper III, Corollary 1.3.14, pp. 31–32.)

Dedekind rings are Noetherian of global dimension `≤ 1` (§6.1); apply §7.2 with `d = 1`. 4-periodicity of `L^s` (§1.6) transfers to `L^gs` in non-negative degrees. The classical Dedekind comparisons are supplied by GeometryOfNumbersAndQuadraticArithmetic §6.8a (Paper III, Corollary 1.3.15, p. 32); this target specializes the genuine-to-symmetric group ranges.

This gives `dedekind_comparison`.

**Checks.**

- `L^gs_n(ℤ)` for `n ≥ 0` is `ℤ`, `ℤ/2`, 0, 0 periodically.
- `L^gs_{−1}(ℤ) → L^s_{−1}(ℤ) = 0` is injective, so `L^gs_{−1}(ℤ) = 0`.

*Needs:* §7.2; §6.1; §1.6; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 7.6 The improvement for 2-torsion-free rings

Let `R` be commutative, coherent of global dimension at most `d`, with `M = R`. Then `Σ²L^gs(R) ≃ L^{−ge}(R)` and `Σ²L^ge(R) ≃ L^{−gq}(R)`. If `R` is moreover 2-torsion free (for instance a Dedekind domain with fraction field of characteristic `≠ 2`), `Q^{−ge} → Q^{−gs}` and `Q^gq → Q^ge` are equivalences, so `Σ²L^gs(R) ≃ L^{−gs}(R)` and `Σ²L^gq(R) ≃ L^{−gq}(R)`, compatibly with the comparison map; hence `L^gq_n(R) → L^gs_n(R)` and `GW^q_{cl,n}(R) → GW^s_{cl,n}(R)` are injective for `n = d` and bijective for `n ≥ d + 1`. (Paper III, Remark 1.3.16, p. 32.)

The two double-shift equivalences are §1.6 with `(M,m) = (R,0)` and `(R,1)`. `Q^{−ge} = Q^{−gs}` and `Q^gq = Q^ge` by §0.3 `(R[2] = 0)`. So `L^gq(R) → L^gs(R)` is `Ω²` of `L^{−gq}(R) → L^{−gs}(R)`; §7.2 for `M = R(−1)` gives injectivity in degree `d+2` and bijectivity from `d+3` for the latter, i.e. degrees `d` and `d+1` for the former. Transfer to classical `GW` by the cartesian squares and the Hebestreit–Steimle comparison (GeometryOfNumbersAndQuadraticArithmetic §6.8a).

This gives `two_torsion_free_improvement`.

**Checks.**

- For `R = ℤ (d = 1)`: `GW^q_{cl,n}(ℤ) → GW^s_{cl,n}(ℤ)` is injective for `n = 1` and bijective for `n ≥ 2`. Paper III, Theorem 3.2.9 and its proof, pp. 58–59, give `GW^q_{cl,1} = (ℤ/2)²`, `GW^s_{cl,1} = (ℤ/2)³` and symmetrisation an isomorphism from degree 2.

*Needs:* §1.6; §0.3; §7.2; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 7.7 Genuine Poincaré structures of form parameters

Assume the form-parameter/polynomial-functor equivalence and derived extension specified in Scope and ownership. The construction is for arbitrary `R` and invertible `M`; only the comparison conclusions require coherence and global dimension at most one.

Here a quadratic `R`-module is an abelian group with a unital, zero-preserving multiplicative action `R→End_ℤ(Q)` whose cross-effect in `R` is bilinear; additivity in the ring variable is replaced by this quadratic law. The maps `τ` and `ρ` below are additive and commute with these quadratic actions, with the diagonal action on the coefficient invariants and coinvariants. A form parameter `λ` on `(R,M)` (Bak, Baues, Schlichting) is a quadratic `R`-module `Q_λ` with maps `M_{C₂} →^τ Q_λ →^ρ M^{C₂}` composing to the trace, whose `R`-action has cross-effect `(a ⟂ b)x = τ((a⊗b)ρ(x))`; a `λ`-hermitian form on `P ∈ Proj(R)` is a `σ`-symmetric `M`-valued form `φ` with a map `q : P → Q_λ` such that `q`(rv) `= r·q(v)`, `q(v+u) − q(v) − q(u) = τ(φ(v,u))` and `ρ q(v) = φ(v,v)`. The functor `P ↦` {`λ`-hermitian forms on `P`} extends as a non-abelian derived functor to a Poincaré structure `Q^{gλ}_M` on `D^p(R)` with duality `Hom_R(−,M)`. `Q_λ = M^{C₂}`, `M_{C₂}` and `im(M_{C₂} → M^{C₂})` give `Q^gs`, `Q^gq` and `Q^ge`. Since `Q^{gλ}_M(P[0])` is discrete, `Q^{gλ}_M` is 0-quadratic and 0-symmetric (1- or 2-symmetric, resp. 1- or 2-quadratic, in the even and symmetric, resp. even and quadratic, cases). For `R` coherent of global dimension `≤ 1`, `L^{gλ}_n(R) → L^s_n(R)` is injective for `n = 3` and bijective for `n ≥ 4`, and `L^{gλ}_2(R)` is the Witt group of the form parameter `(−M, ker(M → Q_λ))`. (Paper III, Remark 1.3.17, p. 32; Paper I, Definition 4.2.26, p. 73, and the discussion on p. 74.)

Schlichting's equivalence between form parameters and reduced degree-two polynomial functors on `Proj(R)` gives the functor of `λ`-hermitian forms; extend by Calmès et al. I, Proposition 4.2.18 (non-abelian derivation) to `D^p(R)`. Discreteness of values on `P[0]` gives fibre and cofibre to `Q^s_M` and from `Q^q_M` concentrated so that the structure is 0-symmetric and 0-quadratic (§2.1). Comparison: §7.1 with `r = 0` and `d = 1`. Degree two: §6.6 (ii) with `k = 1 ≥ 1 − r`; `Ω²Q^{gλ}(Ω−)` on projectives is the form-parameter functor for `(−M, ker(M → Q_λ))`.

Give form parameters and their derived structures the following operations.

- `FormParameter R M`: A quadratic `R`-module `Q_λ` with `τ : M_{C₂} → Q_λ` and `ρ : Q_λ → M^{C₂}`, `ρτ` the trace, and the cross-effect condition.
- `FormParameter.hermitianForms`: `P ↦` the group of `λ`-hermitian forms `(φ,q)` on `P`.
- `FormParameter.poincare`: `Q^{gλ}_M` on `D^p(R)`, the derived functor of hermitian forms.
- `FormParameter.symmetric`: `Q_λ = M^{C₂}` gives `Q^gs_M`.
- `FormParameter.quadratic`: `Q_λ = M_{C₂}` gives `Q^gq_M`.
- `FormParameter.even`: `Q_λ = im(M_{C₂} → M^{C₂})` gives `Q^ge_M`.
- `FormParameter.zeroSymmetric`: `Q^{gλ}_M` is 0-symmetric and 0-quadratic.
- `FormParameter.mapForms`: A map of quadratic `R`-modules commuting with `τ` and `ρ` sends `(φ,q)` to `(φ,f∘q)`, preserves sums and pullbacks, and induces the derived Poincaré functor conditional on the form-parameter extension contract in Scope and ownership.

**Checks.**

- Over `ℤ` with `M = ℤ`, `Q_λ = ℤ ×_{ℤ/2} ℤ` and `M → Q_λ` the pair `(2,0)` is a form parameter (the Burnside form parameter) with `τ(n)=(2n,0)`, `ρ(a,b)=a` and quadratic action `r·(a,b)=`(`r²a`,rb). Its cross-effect is `(2rs a,0)=τ(rsρ(a,b))`; it differs from both the quadratic and symmetric parameters.
- For `Q_λ = M^{C₂}`, `τ` the norm and `ρ` the identity, `λ`-hermitian forms are symmetric forms.
- `ρ = 0` and `τ = 0` do not form a form parameter on `(ℤ,ℤ)` since `ρτ` must be the trace, which is multiplication by `2 ≠ 0`.
- `Q^{gλ}_M(P[0])` is the discrete group of `λ`-hermitian forms on `P`.
- `Q_λ = M^{C₂}` recovers the symmetric case, where the ranges improve to those of `Q^gs`.

The Burnside parameter is the example in Paper III, Example 1.3.18, p. 32. The same construction extends the classical `GW` comparison from quadratic forms to any form parameter (Theorem 3 and Remark 1.3.17).

*Needs:* §2.1; §7.1; §6.6; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 7.8 L-theory of the Burnside form parameter over `ℤ`

Assume the form-parameter extension contract of §7.7 for the identification with its Burnside parameter. Let `Q^b` on `D^p(ℤ)` be the pullback of `Q^gs(X) → Hom_ℤ(X,τ_{≥0}ℤ^{tC₂})` along `Hom_ℤ(X,τ_{≥1/2}ℤ^{tC₂})`, where `τ_{≥1/2}ℤ^{tC₂} := ℤ ×_{ℤ/2} τ_{≥0}ℤ^{tC₂}`. It is the Poincaré structure of the Burnside form parameter `(Q_λ = ℤ ×_{ℤ/2} ℤ, M = ℤ, M → Q_λ = (2,0))`. Then `L^b_n(ℤ) → L^s_n(ℤ)` is an isomorphism for `n ≥ 2`; `L^u_n(𝕊) → L^b_n(ℤ)` is an isomorphism for `n ≤ 0` and onto for `n = 1`; and `L^q_1(ℤ) → L^b_1(ℤ)` is onto, so `L^b_1(ℤ) = 0`. Hence `L^b_n(ℤ) = L^s_n(ℤ)` for `n ≥ 2`, `L^b_1(ℤ) = 0` and `L^b_n(ℤ) = L^u_n(𝕊)` for `n ≤ 0`. (Paper III, Example 1.3.18, pp. 32–33.)

By §7.7 with `d = 1`, `L^b_n(ℤ) → L^s_n(ℤ)` is injective for `n = 3` and bijective for `n ≥ 4`; as `L^s_3(ℤ) = 0` it is bijective at `n = 3`. At `n = 2`, since `M → Q_λ` is injective, `L^b_2(ℤ)` is the Witt group of the form parameter `(−ℤ, 0)`, i.e. of symplectic forms over `ℤ`, which vanishes, as does `L^s_2(ℤ)`. The Poincaré functor `(Mod^ω_𝕊, Q^u) → (D^p(ℤ), Q^b)` has 1-connective map on linear parts `𝕊 → τ_{≥1/2}ℤ^{tC₂}`; §5.5 with `p = 1`, `m = 0` gives iso for `n ≤ 0` and onto for `n = 1`. For `L^b_1`: represent a class on `X` in degrees `[−1,0]`; `π₀X` is free; surgery along `π₀(X) → X` leaves a Poincaré object of `ΩQ^b` with homology a torsion group `T` in degree `−1`, on which the form lifts to `ΩQ^q` because `π₀Ωhom_ℤ(T[−1], τ_{≥1/2}ℤ^{tC₂}) = 0` for torsion `T`; as `L^q_1(ℤ) = 0`, `L^b_1(ℤ) = 0`.

This gives `burnside_l_theory`.

**Checks.**

- The maps `Q^gq_ℤ→Q^b→Q^gs_ℤ` recover quadratic and symmetric structures after the corresponding change of form parameter.
- On `ℤ[0]`, a refinement of the symmetric line `⟨1⟩` can have `q(1)=(1,1)` or `(1,3)` in `ℤ×_{ℤ/2}ℤ`. Both have the same bilinear diagonal under `ρ`, but the refinements differ.
- At the zero complex `Q^b(0)=0`; the pullback of reduced quadratic functors remains reduced.
- In degree 2, `L^b_2(ℤ)=0=L^s_2(ℤ)`, whereas `L^q_2(ℤ)=ℤ/2`, so this parameter does not have quadratic L-theory in every degree.

*Needs:* §7.7; §5.5; §5.8; §4.1; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 7.9 L-groups of a field in every flavour

#### Quadratic Witt group over `𝔽₂`

Construct `arfInvariantF2` for nonsingular quadratic forms on finite-dimensional `𝔽₂`-vector spaces. For a symplectic basis `(e_i,f_i)` of the polar form, it is `Σ_i q(e_i)q(f_i) ∈ 𝔽₂`. Prove independence of the symplectic basis, invariance under isometry, orthogonal additivity and vanishing on metabolic forms. Using the quadratic Witt quotient of §3.4, prove `arfInvariantF2_wittEquiv : W^q(𝔽₂) ≃ ℤ/2` as an isomorphism of additive groups. Split into nonsingular planes and reduce to the hyperbolic plane and the Arf-one plane; two Arf-one planes have a Lagrangian. This supplies both completeness of the invariant and the representative of its nonzero class. (Source: Paper III, proof of Corollary 2.3.10, p. 45, for the finite-characteristic-two Witt calculation.)

In `Suggested.lean`, `arfInvariantF2` is defined intrinsically from the cardinalities of the zero and one fibres of a quadratic form. The statement `arfInvariantF2_eq_sum` identifies it with the symplectic-basis formula, and `arfInvariantF2_classifies` states that two nonsingular forms have the same invariant exactly when their orthogonal sum has a half-dimensional subspace on which the quadratic form vanishes. This expresses the complete Witt invariant on Mathlib's `QuadraticForm` and `Submodule` carriers.

**Checks.**

- The hyperbolic plane `q(x,y)=xy` has Arf invariant 0 and is metabolic.
- The plane `q(x,y)=x²+xy+y²` has Arf invariant 1; its only isotropic vector is zero, so its Witt class is nonzero.
- The orthogonal sum of two Arf-one planes is metabolic: the diagonal copy of `𝔽₂²` is a quadratic Lagrangian. Thus the nonzero class has order two.

*Needs:* §3.4; GeometryOfNumbersAndQuadraticArithmetic §6.8a for quadratic forms on projectives and §6.4 for the exact Witt quotient.

#### Field calculations

Let `K` be a field and `M = K` with an involution of sign `ε`. (a) For every `r`-symmetric `Q` and `k ≥ 1 − r`, `L_{2k−1}(K;Q) = 0` and `L_{2k}(K;Q) ≅ W(Proj(K); Ω^{2k}Q(Ω^k−))`; in particular all odd `L^s` and `L^q` groups vanish. (b) If `char K ≠ 2`, all flavours coincide; for `ε = +1`, `L^s_{4k}(K) = W(K)` (the Witt ring of QuadraticFormInvariants Layer 4) and `L^s_{4k+2}(K) = 0`, and for `ε = −1` the two residues are exchanged, `L^s_{n+2}(K;−1) ≅ L^s_n(K;+1)`. (c) If `char K = 2`, `−M = M` and `L^s`, `L^q`, `K^{tC₂}` are 2-periodic; `L^s_{2k}(K)` is the Witt group `W^s(K)` of symmetric bilinear forms and `L^q_{2k}(K)` the Witt group `W^q(K)` of quadratic forms; `L^gs_n(K) → L^s_n(K)` is an isomorphism for `n ≥ −1`, `L^gs_n(K) ≅ L^q_n(K)` for `n ≤ −3`, and `L^gs_{−2}(K) = L^ge_0(K) = 0` because even forms in characteristic 2 are alternating and hence metabolic. For `K = 𝔽₂`: `L^s_{2k}(𝔽₂) = ℤ/2` (rank mod 2), `L^q_{2k}(𝔽₂) = ℤ/2` (Arf invariant), `L^gs_{−2}(𝔽₂) = 0`. (Paper III, Corollary 1.3.4 and Remark 1.3.5, p. 28; Paper III, Example 1.3.11, p. 31; Paper III, Corollary R.10, p. 10.)

(a) §6.6 with `d = 0`. (b) 2 is a unit, so §0.3 makes all flavours equal; for `ε = +1`, `L^s_{4k+2} = 0` by §6.6 and `L^s_0 = W(K)` by §4.5 and QuadraticFormInvariants Layer 4; the case `ε = −1` follows from `L(K;Q^s_M) ≃ Ω²L(K;Q^s_{−M})` (§1.6). (c) Periodicity by §1.6 with `−M = M`. The comparison `L^gs → L^s` for `n ≥ −1` is §7.2 with `d = 0`; `L^gs ≅ L^q` for `n ≤ −3` is §4.4; `L^gs_{−2}(K) ≅ L^ge_0(K;−M) = L^ge_0(K)` by §1.6, which is the Witt group of even forms (§4.5 (ii)), and an even form `b = c + c^t` satisfies `b(x,x) = 2c(x,x) = 0`, so it is alternating, has a symplectic basis and is metabolic. For `𝔽₂`: `W^s(𝔽₂) = ℤ/2` via rank mod 2, and the local `arfInvariantF2_wittEquiv` computes `W^q(𝔽₂) = ℤ/2`.

This gives `field_l_groups`.

**Checks.**

- `L^s_{−2}(𝔽₂) = ℤ/2 ≠ 0 = L^gs_{−2}(𝔽₂)`: this is the input to the sharpness example §7.3.
- For `K = ℝ`, `L^s_0(ℝ) = ℤ` by signature.

*Needs:* §6.6; §7.2; §0.3; §4.5; §1.6; §4.4; arfInvariantF2_wittEquiv above; QuadraticFormInvariants Layer 4 and TauCeti.WittRing only in characteristic different from two.

### 7.10 Multiplicative comparison with Tate K-theory

<a id="finite-even-multiplicative-l-tate"></a>

**Multiplicative L-to-Tate comparison** (`finite-even-multiplicative-l-tate`). Let `A=(C,Q)` be a commutative algebra object in the symmetric monoidal ∞-category of small Poincaré ∞-categories: tensor is exact in each variable, the multiplication and unit are Poincaré functors, and the associativity, symmetry and unit coherences are specified. Consume GeometryOfNumbersAndQuadraticArithmetic §6.10b's `poincareTensorProduct` on perfect modules, including its derived coefficient tensor, symmetry signs and form pullbacks. Extend it to general small Poincaré categories and construct compatible lax symmetric monoidal refinements of `K`, `GW`, `L` and the natural comparison `Ξ_A : L(A) → K(A)^{tC₂}`. The perfect-module specialization agrees with the supplied tensor and spectrum-module structures. Thus `Ξ_A` is a unital `E∞`-ring map, natural in maps of commutative algebra objects. In particular this applies to `(D^p(R),Q^s_R)` for every commutative ring `R`, without a finiteness or characteristic hypothesis. (Sources: Paper I, Introduction, item (vi), p. 6, Theorem 5.2.7, p. 102, Corollary 5.3.18, p. 111, and Example 5.4.10(i), p. 115; Paper III, Remark 3.1.5, p. 51, attributing the spectrum refinement to Paper IV.)

Forgetting multiplication recovers the supplier's `Ξ`, the factorization of `GW(A) → K(A)^{hC₂} → K(A)^{tC₂}` through `GW(A) → L(A)`. Refine the square `GW(A) → L(A)` over `K(A)^{hC₂} → K(A)^{tC₂}` to a cartesian square of `E∞`-rings. Its underlying fibre sequence `K(A)_{hC₂} → GW(A) → L(A)` is a fibre sequence of `GW(A)`-modules, with action on K-theory through forgetting the form and on L-theory through bordification. The norm and hyperbolic maps are module maps here. These structures include the coherent spectrum products and units, extending the products on groups of Paper I, Proposition 7.5.3 and Corollary 7.5.10, pp. 172–175. The additive square and fibre sequence are Paper II, Corollary 4.4.13, p. 107.

**Checks.**

- For `R=𝔽_(2^e)`, `e≥1`, both homotopy rings are `𝔽₂[u,u⁻¹]`, `|u|=2`. The graded unital map sends `1` to `1` and `u` to `u`, so `Ξ_R` is an `E∞` equivalence, refining the underlying equivalence of GeometryOfNumbersAndQuadraticArithmetic's `finiteEvenFieldHomotopyLimit` (Paper III, Proposition 3.1.4 and Remark 3.1.5, pp. 50–51).
- For `R=𝔽₂×𝔽₂`, `π₀L^s(R)=𝔽₂×𝔽₂` has orthogonal idempotents `(1,0)` and `(0,1)`; `Ξ_R` preserves their products and sum `1`. The additive automorphism `(a,b)↦(a,a+b)` fails to preserve `1=(1,1)`, so an additive equivalence alone does not provide this refinement.
- For the zero Poincaré category with its unique multiplication, all four spectra in the square vanish and `Ξ` is the unique unital map between zero ring spectra. The fibre sequence is the zero sequence.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §§6.1a, 6.8a and 6.10b, including the coherent K-duality action, `stableGWFundamentalSquare`, `poincareTensorProduct`, its coefficient tensor, symmetry and form-pullback API, and `genuineLTheoryModule`; EnhancedDerivedSheaves §E5:abstract for coherent algebra and module objects and §E5:presentability for the common spectra.

### 7.11 Modules and base change for the multiplicative comparison

<a id="multiplicative-l-tate-base-change"></a>

**Module and base-change compatibility** (`multiplicative-l-tate-base-change`). Let `A` be as in §7.10 and `P` an `A`-module object in Poincaré ∞-categories, with its action exact in each variable. Construct `L(P)` as an `L(A)`-module and `K(P)^{tC₂}` as a `K(A)^{tC₂}`-module, and refine `Ξ_P` to an `L(A)`-linear map after restricting scalars along `Ξ_A`. Equivalently, `Ξ_P(a·x)=Ξ_A(a)·Ξ_P(x)` with the coherent module structure, rather than only on homotopy groups. Refine the fundamental square for `P` and its fibre sequence to `GW(A)`-modules, using the maps of §7.10 for the scalar actions. (Sources: Paper I, §5.4's module-objects construction and Examples 5.4.11–5.4.13, pp. 115–116; Paper II, Corollary 4.4.13, p. 107; the multiplicative refinement of Paper IV identified in Paper III, Remark 3.1.5, p. 51.)

For a commutative-algebra map `A→B` and an exact Poincaré functor `F:P→P′` compatible with the scalar action, where `P′` is a `B`-module, require the square with rows `Ξ_P`, `Ξ_P′` and vertical maps `L(F)`, `K(F)^{tC₂}` to commute as semilinear module maps, coherently for identities and composites. The resulting scalar-extension maps `L(P)⊗_{L(A)}L(B) → L(P′)` and `K(P)^{tC₂}⊗_{K(A)^{tC₂}}K(B)^{tC₂} → K(P′)^{tC₂}` commute with the induced comparison between their sources. These maps need not be equivalences.

For a map of commutative rings `R→S`, use derived extension `S⊗ᴸ_R−` on perfect complexes and carry an invertible central coefficient line `M`, its involution and every integer shift to `M_S=S⊗_R M` with the same shift. The theories for `Q^s_M[r]` have the stated module compatibility over the untwisted symmetric theory; a twisted or shifted coefficient does not by itself supply a ring unit. Construct compatibility adapters for GeometryOfNumbersAndQuadraticArithmetic §6.10b's `poincareTensorProduct`, retaining its coefficient tensor, symmetry, evaluation maps and form pullbacks. On L-theory, restriction along `L^gs(ℤ) → L^s(R)` recovers its `genuineLTheoryModule` action, compatibly with base change and shifts.

**Checks.**

- For `𝔽₂→𝔽₄`, scalar extension sends the symmetric unit line to the unit line, so both comparisons induce `1↦1` on `π₀=𝔽₂`, including in this even-degree extension. This is compatible with the `E∞` equivalences of §7.10.
- For the nonflat map `ℤ→𝔽₂`, derived extension still preserves perfect complexes. The symmetric line `⟨−1⟩` becomes `⟨1⟩`, and the coefficient involution on `ℤ(−1)` becomes the trivial involution on `𝔽₂`; the semilinear comparison carries these coefficient changes and any specified shift.
- For the zero module category, every module spectrum in the comparison is zero. Along `R→0`, the target spectra and the scalar-extension sources vanish; the naturality square retains the unique maps from the original spectra to zero.

*Needs:* §7.10; GeometryOfNumbersAndQuadraticArithmetic §§6.1a, 6.8a and 6.10b for the additive square, perfect derived extension, coefficient dualities, `poincareTensorProduct`, its coefficient tensor, symmetry and form-pullback API, and `genuineLTheoryModule`; EnhancedDerivedSheaves §E5:abstract for module objects and relative tensor products of spectrum modules.

### Examples

In characteristic two the plane with pairing matrix `[[0,1],[1,1]]` is metabolic with Lagrangian the first coordinate, but is not alternating. Even forms are alternating, so `L^gs_{−2}(𝔽₂)=L^ge_0(𝔽₂)=0`. Homotopy symmetric theory is two-periodic with `L^s_{−2}(𝔽₂)=ℤ/2`. This difference tests both the sign-shift convention and the genuine-to-symmetric range at `d=0`.

### Dependencies

Layers 0–6; the supplier common-duality fundamental square and weight-heart `GW` comparison; the field Witt ring. The Laurent sharpness and arbitrary form-parameter consequences assume their explicit additional contracts.

## Layer 8: classical Grothendieck–Witt fibre sequences and comparisons

Use the common K-homotopy-orbit term in the fundamental fibre sequence to pass from the L-comparisons to classical Grothendieck–Witt theory. Connective covers give the symmetric and quadratic fibre sequences; inverting two also gives Karoubi's splitting.

### 8.1 The fibre sequence for classical symmetric Grothendieck–Witt theory

For every associative ring `R` and every duality `D = Hom_R(−,M)` on `Proj(R)` given by an invertible `ℤ`-module with involution `M`, there is a natural fibre sequence of connective spectra `K(R;M)_{hC₂} →^{hyp} GW^s_cl(R;M) → L^short(R;M)`, where `GW^s_cl(R;M)` is the group completion of the groupoid of unimodular `M`-valued symmetric forms, `K(R;M)` carries the `C₂`-action `P ↦ DP`, and `L^short(R;M) := τ_{≥0}L^gs(R;M)` has `π_nL^short(R;M) ≅ L^short_n(R;M)`, Ranicki's symmetric L-groups of `n`-dimensional Poincaré complexes. If `2 ∈ R^×`, Ranicki's groups are 4-periodic and equal to the Witt groups, and the sequence is Schlichting's. (Paper III, Theorem 1, p. 2, and its derivation, pp. 3–4; Paper II, Corollary 4.4.13, p. 107.)

The fundamental fibre sequence `K(D^p(R),Q)_{hC₂} → GW(D^p(R),Q) → L(D^p(R),Q)` for `Q = Q^gs_M` (GeometryOfNumbersAndQuadraticArithmetic §6.8a `stableGWFundamentalSquare`). `K(R;M)` is connective, so `K(R;M)_{hC₂}` is connective (the supplier homotopy-orbit construction (§6.1a)); hence `π₀GW^gs → π₀L^gs` is onto and `τ_{≥0}` preserves the fibre sequence. `τ_{≥0}GW^gs(R;M) ≃ GW^s_cl(R;M)` by Hebestreit–Steimle (GeometryOfNumbersAndQuadraticArithmetic §6.8a `weightHeartGWComparison`), compatibly with `hyp`. Form the classical connective spectrum with GeometryOfNumbersAndQuadraticArithmetic §6.1.6’s symmetric-monoidal-groupoid/Γ-space adapter. `π_nτ_{≥0}L^gs(R;M) ≅ L^short_n(R;M)` for `n ≥ 0` by Theorem 5 (§4.11). If 2 is a unit all genuine structures agree (§0.3), `L^s` is 4-periodic (§1.6) and its groups are Witt groups of forms and formations.

This gives `classical_gw_fibre_sequence`.

**Checks.**

- `R = ℤ` on `π₀`: `K₀(ℤ)_{C₂} = ℤ` maps to `GW^s_{cl,0}(ℤ) = ℤ⟨1⟩ ⊕ ℤ⟨−1⟩` by `1 ↦ ⟨1⟩ + ⟨−1⟩` (the hyperbolic plane), and the cokernel maps isomorphically to `L^short_0(ℤ) = ℤ` by the signature `(a,b) ↦ a − b`.
- `R` a field of characteristic `≠ 2`: on `π₀`, `GW₀(K) → W(K)` is onto with kernel the hyperbolic multiples, the classical Witt sequence.

*Needs:* §4.11; §0.3; §1.6; GeometryOfNumbersAndQuadraticArithmetic §6.8a; the supplier `C₂`-spectrum and Tate API (§6.1a).

### 8.2 The quadratic fibre sequence

For every ring `R` and invertible `M` there is a fibre sequence `K(R;M)_{hC₂} →^{hyp} GW^q_cl(R;M) → τ_{≥0}(Σ⁴L^gs(R;M))`, where `GW^q_cl` is the group completion of unimodular `M`-valued quadratic forms. (Paper III, Introduction, p. 4.)

Apply the fundamental fibre sequence (GeometryOfNumbersAndQuadraticArithmetic §6.8a) to `Q^gq_M` and take connective covers as in §8.1. `τ_{≥0}GW^gq(R;M) ≃ GW^q_cl(R;M)` by Hebestreit–Steimle (GeometryOfNumbersAndQuadraticArithmetic §6.8a). `L^gq(R;M) ≃ Σ⁴L^gs(R;M)` by applying §1.6 twice (`Σ²L^gs_M ≃ L^ge_{−M}` and `Σ²L^ge_{−M} ≃ L^gq_M`).

This gives `quadratic_gw_fibre_sequence`.

**Checks.**

- `R = ℤ`: `π₀` of the cofibre term is `L^gs_{−4}(ℤ) = L^q_{−4}(ℤ) = ℤ` (`signature/8`), and `GW^q_{cl,0}(ℤ) = ℤ⊕ℤ` is generated by the hyperbolic plane and `E₈`.

*Needs:* §8.1; §1.6; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 8.3 Karoubi's splitting after inverting 2

Use the two-inverted comparison `L(R;Q^{≥m}_M)[1/2]≃L^s(R;M)[1/2]` supplied by GeometryOfNumbersAndQuadraticArithmetic §6.10b, 6.10.6 (Paper III, Proposition 3.1.14), built from its `poincareTensorProduct`, `genuineLTheoryModule` and `symmetricLTheoryShiftTelescope` targets.

After inverting 2, polarisation gives `GW^q_cl(R;M)[1/2] ≃ GW^s_cl(R;M)[1/2]`, and there is a natural splitting `GW^s_{cl,*}(R;M)[1/2] ≅ (K_*(R;M)[1/2])^{C₂} ⊕ W_*(R;M)[1/2]`, with `K_*` the K-groups with the duality action and `W_*` the 4-periodic Witt groups of symmetric forms (even degrees) and formations (odd degrees), here `π_*L^s(R;M)` in non-negative degrees. (Paper III, Introduction, p. 2; Paper II, Corollary 4.4.14, p. 107.)

Invert 2 in §8.1: `π_*(K_{hC₂})[1/2] = (K_*[1/2])_{C₂} ≅ (K_*[1/2])^{C₂}`. The fundamental square splits after inverting 2: `GW[1/2] ≃ K[1/2]_{hC₂} ⊕ L[1/2]` (Calmès et al. II, Corollary 4.4.14). `L^gs[1/2] ≃ L^gq[1/2] ≃ L^s[1/2]` (the supplier 6.10.6), so the quadratic and symmetric sequences agree after inverting 2 and the L-term has the 4-periodic Witt groups.

This gives `karoubi_splitting_recovered`.

**Checks.**

- `R` a field of characteristic `≠ 2`: `GW₀(K)[1/2] ≅ ℤ[1/2] ⊕ W(K)[1/2]` via `rank/2` and Witt class.

*Needs:* §8.1; §8.2; GeometryOfNumbersAndQuadraticArithmetic §6.10b, 6.10.6; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### 8.4 Quadratic versus symmetric Grothendieck–Witt groups

Let `R` be coherent of global dimension at most `d` and `M` invertible. Then the polarisation map `GW^q_{cl,n}(R;M) → GW^s_{cl,n}(R;M)` is injective for `n ≥ d + 2` and an isomorphism for `n ≥ d + 3`. If moreover `R` is commutative and 2-torsion free and `M = R`, it is injective for `n ≥ d` and an isomorphism for `n ≥ d + 1`. The same holds for right-coherent rings of finite right global dimension, and the first statement (ranges `d + 2` and `d + 3`) holds with the Grothendieck–Witt groups of any form parameter in place of quadratic forms. (Paper III, Theorem 3, p. 3; Corollary 1.3.10, pp. 30–31; Remarks 1.3.12, 1.3.16 and 1.3.17, pp. 31–32.)

The extension to arbitrary form parameters assumes the additional construction in §7.7. The quadratic-to-symmetric theorem uses only the standard genuine structures.

For `n ≥ 0`, `GW^q_{cl,n} = GW^gq_n` and `GW^s_{cl,n} = GW^gs_n` (Hebestreit–Steimle, GeometryOfNumbersAndQuadraticArithmetic §6.8a). By §7.2, `GW^gq_n → GW^s_n` is injective for `n ≥ d+2` and bijective for `n ≥ d+3`, and `GW^gs_n → GW^s_n` is bijective for `n ≥ d − 1`; compose. The 2-torsion-free improvement is §7.6. Right-coherent rings: §7.4; form parameters: §7.7 with the same cartesian-square argument.

This gives `quadratic_symmetric_gw_comparison`.

**Checks.**

- `R = ℤ` (`d = 1`, 2-torsion free): bijective for `n ≥ 2` and injective at `n = 1`, matching Paper III, Theorem 3.2.9 and its proof, pp. 58–59 (`GW^q_1(ℤ) = (ℤ/2)²`, `GW^s_1(ℤ) = (ℤ/2)³`).
- The source makes no sharpness claim for Theorem 3 itself; §7.3 concerns the L-theoretic comparisons `L^gs → L^s` and `L^gq → L^s`.

*Needs:* §7.2; §7.6; §7.4; §7.7; §8.1; GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### Examples

For `R=ℤ`, `d=1` gives the general quadratic-to-symmetric classical `GW` comparison injective at 3 and bijective from 4. The coefficient is 2-torsion-free, so the improved theorem is injective at 1 and bijective from 2. After inverting two, the same fibre sequence separates the invariant part of ordinary K-theory from the corresponding Witt summand, using the two-inverted supplier comparison.

### Dependencies

Layers 0–1, 4 and 6–7; the supplier group-completion, weight-heart and fundamental-square contracts. Only §8.3 also needs the two-inverted comparison of GeometryOfNumbersAndQuadraticArithmetic §6.10b.

## Downstream consumers

Arithmetic applications can use the coefficient sign changes, `K₀`-controlled surgery, degree-zero Witt descriptions, field computations and genuine-to-periodic comparisons of this roadmap. Sections 7.10–7.11 supply the multiplicative L-to-Tate comparison and its module and scalar-extension compatibility. Applications retain the supplier Poincaré carriers; Dedekind localization, dévissage and arithmetic L-group tables remain outside this roadmap's scope.

## References

Statement numbers and page numbers below refer to the following editions.

- **Paper III.** B. Calmès, E. Dotto, Y. Harpaz, F. Hebestreit, M. Land, K. Moi, D. Nardin, T. Nikolaus and W. Steimle, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings*, [arXiv:2009.07225v4](https://arxiv.org/abs/2009.07225v4), PDF dated 28 April 2026, 63 pages. Locators use the preprint's printed pages, equal to PDF page numbers. The corresponding publication is Annals of Mathematics 204(1) (2026), 119–220, [DOI 10.4007/annals.2026.204.1.2](https://doi.org/10.4007/annals.2026.204.1.2); preprint and journal pagination are not interchanged.
- **Paper I.** The same authors, *Hermitian K-theory for stable ∞-categories I: Foundations*, [arXiv:2009.07223v3](https://arxiv.org/abs/2009.07223v3), 27 December 2021. Printed and PDF pages agree.
- **Paper II.** The same authors, *Hermitian K-theory for stable ∞-categories II: Cobordism categories and additivity*, [arXiv:2009.07224v5](https://arxiv.org/abs/2009.07224v5), 11 April 2025. Printed and PDF pages agree.
- **Paper IV.** The same authors, *Hermitian K-theory for stable ∞-categories IV: Karoubi–Grothendieck–Witt theory*. The multiplicative L-to-Tate comparison is stated with attribution to this paper in [Paper III, Remark 3.1.5, p. 51](https://arxiv.org/html/2009.07225v4#S3.SS1); the series bibliography on p. 61 identifies the title. Paper I, Introduction, item (vi), p. 6, gives the corresponding attribution for the `E∞` structures on `GW` and `L`.
- **Ranicki.** A. Ranicki, *The algebraic theory of surgery I. Foundations*, Proceedings of the London Mathematical Society (3) 40 (1980), 87–192, [author archive](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/ats1.pdf). Printed page `p` is PDF page `p−86`. Complexes and Wu classes are in §1; pairs, cobordism and even groups are in §3.
- **Higher Algebra.** J. Lurie, *Higher Algebra*, [author PDF](https://www.math.ias.edu/~lurie/papers/HA.pdf), 18 September 2017, §1.2.1, pp. 37–40, and §7.2.2, Proposition 7.2.2.18 and Corollary 7.2.2.19, pp. 1244–1246.
- **Read.** T. Read, *On the geometric fixed points of the real topological cyclic homology of `ℤ/4`*, [arXiv:2411.11993v2](https://arxiv.org/abs/2411.11993v2), 14 February 2026, Corollary F, pp. 6–7. Used only as the additional comparison input in §7.3.
- **Schlichting.** M. Schlichting, *Symmetric versus genuine symmetric forms in Hermitian K-theory*, [arXiv:2503.14288v3](https://arxiv.org/abs/2503.14288v3), 19 June 2025, Theorem 1.1, pp. 2–3. Used only as the additional comparison input in §7.3.
