# Roadmap: exponential sums and the circle method, part II

**Summary.** Build the geometric circle method of Browning and Sawin for polynomial maps of degree d with a fixed leading vector from the affine line to a smooth affine hypersurface X={f=0}⊂𝔸ⁿ of degree k whose leading form is smooth. From affine dimension and degree geometry, polynomial lattices over 𝔽_q((T⁻¹)), rational approximation by Hankel rank, the Artin–Schreier sheaves and compact-support six operations of the étale suppliers, and configuration spaces, construct the Fourier complex of the mapping scheme, its finite major-arc filtration and the signed configuration first page of the resulting spectral sequence. Geometric Weyl differencing and a polar point count that is uniform over all finite constant-field extensions give a conservative minor-arc vanishing range, hence a comparison between the first page and the compact-support cohomology of the mapping scheme. The end theorems are the uniform polar count (§8.9) and geometric irreducibility of the mapping scheme in its expected dimension d(n−k) whenever tδ>k−1 (§10.8). End winding shows that the compact-open space of maps with prescribed germ at infinity is not homotopy equivalent to the double loop space Ω²X (§11.12); controlled collars specify the stronger topology, and a perfect trace pairing the conjecture, under which the comparison with Ω²X and degeneration follow (§§12.5, 13.3).

The arithmetic argument is the polar-count argument of BS20 §6, combined here with the geometric Fourier transform and cohomological differencing. The sharp minor estimate is a proposition used only as an explicit hypothesis. A stronger germ topology and its comparison are specified as data, and trace perfection is a separate conjecture; the conservative theorems require none of these hypotheses.

`README.md` is definitive. `Suggested.lean` states, against the pinned Mathlib, the two end theorems that are statable there, `minor_arc_polar_count` (§8.9) and `mapping_geometrically_irreducible` (§10.8), with the six definitions they need: `mappingPolynomial`, `mappingEquation` and `mappingIdeal` (§3.1), `residuePhase` (§3.4), `hankelMatrix` (§4.1) and `polarCount` (§8.8). Every other target, API list and Check lives here.

## Scope and ownership

This roadmap owns the affine intersection and finite-grid applications (Layer 0); strict polynomial boxes and the polynomial lattices of 𝔽_q((T⁻¹))ᴺ with their orthogonal bases, successive minima, adjoint minima and the shrinking inequality for symmetric lattices (Layer 1); the prime-choice adapters (Layer 2); the coefficient mapping scheme, the residue phase, the 𝔾_a-equivariant Artin–Schreier cancellation lemma and the exponential-sum complex (Layer 3); reduced Hankel arcs and their Padé charts (Layer 4); major-arc cancellation and configuration descent (Layer 5); the universal-pair monodromy element and its two-factor Goursat argument (Layer 6); the localization-filtration adapter and the first page (Layer 7); geometric Weyl differencing, the polar count and the count-to-dimension adapter (Layer 8); conservative minor-arc vanishing (Layer 9); the comparison, irreducibility and the small-degree counterexample (Layer 10); and the prescribed-germ obstruction and controlled-collar applications (Layers 11–13). Layers 11–12 and §13.2 contain original examples and local collar arguments in the setting of BS20 §7.

Mathlib owns polynomial evaluation and homogeneous components, matrix rank, Laurent series, the infinity valuation, forward differences, the componentwise Krull height theorem, primes in progressions, quadratic reciprocity, Jacobson spaces, compact-open currying, the fundamental group of the additive circle with its winding number, and the spectral-object carrier; Tau Ceti owns the oriented fundamental-group equivalence of the complex unit circle. The affine dimension translation of §0.1 differs from Krull height by its finite-type geometric component statement. The finite localization adapter of §7.1 differs from a generic filtered-complex spectral sequence by constructing the filtration from geometric localization and identifying its compact-support abutment.

SchemeAndStackFoundations §§0.7–0.9 and §5.12 own finite-type dimensions, spreading and projective intersection degree; this roadmap supplies the arbitrary finite-grid application of §0.2. It differs from the uniform Lang–Weil bounds of SieveMethodsAndPrimePatterns §5.4, *Uniform algebraic point counts*, by allowing an arbitrary finite grid S⊂K and an explicit cumulative-degree constant; that Lang–Weil estimate is consumed in §8.10. EtaleCohomologyFoundations §§F.0–F.6 own coefficient categories, proper supports, the six operations and realization. FourierDeligneTransform §§2.2–2.5 own the Artin–Schreier sheaves L_ψ with their tensor, base-extension, coefficient-change and trace laws and their acyclicity, §2.8 their cohomology on the line, §3.4 Fourier orthogonality on a vector bundle, and §5.3 Fourier sheaves on the line; here only the 𝔾_a-equivariant cancellation lemma (§3.4a) and the one-parameter application (§5.8) are targets. EtaleDualityAndPerverseSheaves §0.4, *Top-degree compactly supported cohomology of a variety*, owns the top-component formula for singular schemes, and its §§0.6, 3.2–3.8 and 4.1–4.7 own duality, coefficient extension, comparison, Lefschetz and complete-intersection Betti numbers; only the componentwise irreducibility criterion (§10.7) is a target here. The polynomial polar-count argument belongs here in §§8.7–8.10, and so do its function-field lattice inputs (§§1.2–1.5). The finite-length rectangular-rank form in §4.4 differs from the infinite eventual-determinant criterion of ClassicalArithmeticCompletion §6.44.

InverseGaloisAndArithmeticFundamentalGroups §§IG.5.1 and IG.5.7 own configuration schemes, permutation torsors and finite-cover criteria for fundamental-group surjectivity. AlgebraicTopologyPartII owns split arrangement purity and the compact-support range of configuration cohomology (§2.1), the stable configuration diagonal (§3.5), tame polynomials and the tame fibre bouquet theorem (§§4.1–4.2), the double-loop Betti series (§5.1) and Fermat double-loop simple connectivity (§5.4). AlgebraicTopology Stages 4, 6 and 8 own CW pairs, universal coefficients and higher homotopy comparison. DGFloer Layer 1 item 1 owns degree-one Hurewicz, and Layer 2 items 2–3 own mapping-space restriction fibrations and sphere/loop comparisons. LefschetzPencilsAndVanishingCycles §§5.1, 5.8 and 5.10 own the pencil-to-universal image comparison and the symplectic and orthogonal image alternatives; only exclusion of the finite orthogonal case is requested from it as an extension. The two-factor Goursat application belongs to §6.5 here. No configuration carrier, generic Hurewicz theorem, circle fundamental-group calculation, Euler product, character sheaf, Fourier transform or universal monodromy foundation is constructed twice.

## Conventions

Work in arbitrary universes with fields K and finite index types Fin n. Geometry over K is tested after algebraic closure. Put f₀ equal to the homogeneous degree-k part of a degree-k polynomial f, X={f=0}⊂𝔸ⁿ, Z={f₀=0}⊂ℙⁿ⁻¹, and fix a vector x≠0 with f₀(x)=0. Layers 3–7 assume k≥3, n≥2, d≥1, smooth X and smooth Z, and in their finite-field statements p>k and ℓ≠p; §§6.4–6.5 and 7.4 add n≥3 and exclude (k,n)=(3,3),(3,4), and the stratum statements keep m≤d. Neither n>2ᵏ(k−1), d≥k−1 nor an even order of ℓ modulo p is used in those layers. Layers 8–10 and 13 add d≥k−1 where stated, and the minor-arc, comparison and irreducibility statements also n>2ᵏ(k−1); these are the main hypotheses, and each target names the ones it uses. Write L=kd, D=d(n−k), t=⌊d/(k−1)⌋ and δ=n/2ᵏ−k+1. D is an integer; subtraction in a dimension formula is signed. In the conservative irreducibility range n>k, its natural-number presentation agrees with signed subtraction. The strict conservative condition is tδ>k−1.

Finite-field Fourier constructions use p=char K>k, a prime ℓ≠p, E=ℚ_ℓ(μ_p), and a nontrivial ψ:𝔽_p→E×; extend ψ to 𝔽_q by the field trace. The character takes values in the units of the ring of integers of E, so every reduction of ψ is nondegenerate in the sense of FourierDeligneTransform, Conventions. The Weyl applications requiring coefficient conjugation assume that ℓ has even multiplicative order modulo p. General-field conclusions use characteristic zero or >k and spreading. No restriction to a preferred subset of primes is imposed on the geometric irreducibility result.

Complexes are cohomological: Hⁱ(K[r])=Hⁱ⁺ʳ(K). Thus RΓ_c(𝔸ᵃ,E)=E[−2a](−a), with geometric q-Frobenius acting on E(−a) by qᵃ. Character cancellation applies to a nontrivial phase, not to the zero frequency. The two-term normalization witness is RΓ_c(𝔸¹,E)=E[−2](−1) versus RΓ_c(𝔸⁰,E)=E: their sole degrees are 2 and 0 and their traces q and 1. Every affine factor below uses this same normalization. Geometric Frobenius at x∈𝔸¹(𝔽_q) acts on the stalk of L_ψ by ψ(Tr x), the convention of FourierDeligneTransform, Conventions (Lang torsor).

The residue is the coefficient of T⁻¹ at infinity; |a|=q^(deg a) for nonzero a∈𝔽_q((T⁻¹)), with deg the largest exponent of T present, and |0|=0. Hence |1|=1, |T|=q and |T⁻¹|=q⁻¹. For a vector, |v| is the maximum of the coordinate absolute values, and ‖β‖ is the absolute value of the strictly negative Laurent part of β, coordinatewise maximal for vectors. The strict h=0 ball contains 0 and excludes 1. Empty schemes and acyclic complexes have dimension or top cohomological degree −∞. Extended addition keeps −∞ absorbing; all finite cutoffs are rational numbers, with strict inequalities in the integer cohomological index.

Configurations carry the left action (σ·a)(i)=a(σ⁻¹i); the action on complexes includes Koszul signs. A transposition of two degree-(n−1) classes gives (−1)^(n−1), witnessed by −1 when n=4 and +1 when n=5. For topology use complex points and compact-open mapping spaces, based at the explicit Fermat polynomial map. Winding is oriented so exp(2πis) has degree +1; its reciprocal has degree −1. A pointwise germ bound allows its radius and constant to depend on the map. A uniform bound for a compact family is a separate assertion.

## Exact supplier contracts

### From Mathlib

Use `MvPolynomial.eval₂Hom` in `Mathlib/Algebra/MvPolynomial/Eval.lean:158`, `MvPolynomial.pderiv` in `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61`, and `MvPolynomial.homogeneousComponent` in `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:512`. The latter extracts exactly the degree-k monomials. `Polynomial.coeff`, `Ideal.span`, `Ideal.radical`, `Ideal.IsPrime` and `ringKrullDim` provide the coefficient-ring acceptance statement. `Ideal.IsPrime` includes properness, so an empty scheme cannot satisfy it; the prime-radical conclusion expresses irreducibility and does not assert reducedness of the defining ideal. `ringKrullDim` takes values in `WithBot ℕ∞`.

Use `Matrix.rank` in `Mathlib/LinearAlgebra/Matrix/Rank.lean:134` for the field-point rank test, and `LaurentSeries` in `Mathlib/RingTheory/LaurentSeries.lean:101` for coefficient expansions. `RatFunc.inftyValuation` in `Mathlib/FieldTheory/RatFunc/Valuation.lean:83` fixes the infinity absolute-value convention; its completion is the supplied completion, not a new carrier. Use `fwdDiff` in `Mathlib/Algebra/Group/ForwardDiff.lean:40`, `fwdDiff h f n = f (n + h) − f n`, for the iterated differences of the polar count; it is the negative of the difference Δ_h of §8.1. Use `Ideal.height_le_spanRank_toENat_of_mem_minimalPrimes` in `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:185` on each minimal prime in a Noetherian ring. This is the componentwise form needed in Layer 0.

Use `Nat.forall_exists_prime_gt_and_modEq` in `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:463`, for nonzero modulus and a coprime residue; `legendreSym.quadratic_reciprocity` and `legendreSym.at_two` in `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107` and line 60, retaining their prime, oddness and distinctness assumptions. Use `CategoryTheory.Abelian.SpectralObject` in `Mathlib/Algebra/Homology/SpectralObject/Basic.lean:41` as the spectral carrier. Use `ContinuousMap.curry` in `Mathlib/Topology/CompactOpen.lean:430`; evaluation on compact source spaces gives the family criterion used here. Use `nonempty_inter_closedPoints` in `Mathlib/Topology/JacobsonSpace.lean:105`, together with `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace` in `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:112`, for nonempty locally closed supports over finite fields. Neither declaration supplies constructibility of a cohomology support. Use `AddCircle.windingNumberIso` in `Mathlib/Topology/Covering/FundamentalGroupCircle.lean:49` with `AddCircle.windingNumber_eq_div` at line 61: the winding number of a loop is (f 1 − f 0)/p for any continuous real lift f.

### From Tau Ceti

Use `Circle.fundamentalGroupMulEquiv` and `Circle.fundamentalGroupMulEquiv_expLoop` in `TauCeti/AlgebraicTopology/UniversalCover/Circle/FundamentalGroup.lean:334` and line 431. The first identifies π₁ of the complex unit circle at any basepoint with `Multiplicative ℤ`; the second sends the class of the counterclockwise loop t↦exp(2πit) to `ofAdd 1` and fixes the sign of end winding. Use the radial retraction of ℂ× onto the unit circle; all based homotopy groups are those of the supplied topology library.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §0.7 for componentwise finite-type dimension, field-extension invariance and the dominant fibre formula; §§0.8–0.9 for smoothness opens, approximation and models of the whole pair (f,x); §5.12 for projective Bézout, applied to the closure of an irreducible affine variety and a hyperplane not containing it. Deleting the part at infinity and forgetting intersection multiplicities gives an inequality for the reduced affine cumulative degree. This deduction needs no equality for affine section degrees.

What SchemeAndStackFoundations must provide (gap:sf-fibre-strata): For finite-type morphisms over a field, provide constructible fibre-dimension level sets including empty fibres and the equality dim φ⁻¹(W)=dim W+e on each irreducible locally closed constant-nonempty-fibre-dimension stratum W.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Consume §§F.0.1–F.0.2 for constructible coefficient objects and geometric fundamental groups; §§0.6–0.7 and F.1 for enhanced finite diagrams and localization; §§F.2.4–F.2.7 and F.3 for compact direct image, exceptional base change, finiteness, generic lissity, cohomological dimension, projection and compact Künneth; §§F.4.1–F.4.6 for normalized adic realization, actual finite E coefficients, continuous actions and compatibility of the operations, with the rational realization of §F.4.5 carrying torsion-coefficient statements to E. F.5–F.6 provide trace and smooth purity. These imports retain separated finite type, ℓ invertible and bounded constructibility. The finite E package is consumed through its rational realization, not inferred from finite torsion alone. The affine normalization is the degree-2 line with twist −1 and trace q, as in Conventions.

### From TauCetiRoadmap.FourierDeligneTransform

Consume §2.2, *Character sheaves*, and §2.5, *Artin–Schreier sheaves*: for an 𝔽_p-scheme Y and f∈Γ(Y,O_Y), the lisse rank-one sheaf L_ψ(f)=f*L_ψ, with L_ψ(f+g)≅L_ψ(f)⊗L_ψ(g), pullback g*L_ψ(f)≅L_ψ(f∘g), coefficient change along Λ→Λ′, base extension to 𝔽_q through ψ∘Tr, and trace ψ(Tr_(𝔽_(qⁿ)/𝔽_p) f(y)) at y∈Y(𝔽_(qⁿ)). Consume §2.4, *Vanishing of cohomology*: RΓ_c(𝔸¹_(𝔽̄_q),L_ψ)=0 for nondegenerate ψ. Consume §2.8, *Artin–Schreier sheaves on the line*: for g∈k[a] of degree e≥1 prime to p, L_ψ(g) has H⁰_c=H²_c=0 on 𝔸¹_k̄ and H¹_c free of rank e−1. Consume §3.4, *Inversion*: Rpr_!L_ψ⟨ , ⟩≅σ_*Λ(−r)[−2r] for a vector bundle of rank r. Consume §5.3, *Fourier sheaves*: the naive transform of a Fourier sheaf is a Fourier sheaf, and the naive transform of the constant sheaf vanishes. These statements are made there for finite coefficient rings and O_E by realization, and in §5.3 for coefficient fields containing μ_p; E-coefficients are reached through EtaleCohomologyFoundations §F.4.5.

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

Consume §0.4, *Top-degree compactly supported cohomology of a variety*: for M separated of finite type of dimension ≤a over an algebraically closed field with ℓ invertible, H^q_c(M,ℤ/ℓᵐ)=0 for q>2a and H^(2a)_c(M,ℤ/ℓᵐ(a)) is free on the a-dimensional irreducible components, singular and nonreduced M included; EtaleCohomologyFoundations §F.4.5 carries this to E. Consume §0.6 for finite-E Poincaré duality on smooth schemes; §§3.2–3.4 for operation/reduction and finite coefficient extension preserving traces, localization and symmetry; §§3.5–3.8 for Betti comparison, orientations and trace compatibility; §§4.1, 4.3 and 4.6 for affine vanishing, complete-intersection cohomology and primitive kernel/quotient comparisons; §4.7, *Complete-intersection Betti numbers*, for the primitive-rank formula for smooth hypersurfaces of positive dimension. Spreading in §10.1 uses EtaleCohomologyFoundations §§F.1–F.4 for constant-coefficient cohomology of the modeled geometric objects and maps; the finite-field Fourier spectral sequence is transported abstractly through chosen E-vector-space isomorphisms. Trace on a singular mapping scheme is obtained through its top components and dense smooth opens, not by smooth purity on the entire scheme.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

Consume IG.5.1, *Ordered and unordered configurations*, for the unit-difference configuration schemes and the finite étale ordered-root S_m-torsor, in every characteristic, including m=0,1. Consume IG.5.7, *Finite-cover criteria for full monodromy image*, for a representable smooth surjection with nonempty geometrically connected fibres, and for a dense open in a connected normal target. Consume IG.0.T4, *Constant-sheaf point count for every finite extension*, with geometric Frobenius and every positive power, in the finite-field normalization Check of §6.3.

### From TauCetiRoadmap.DeligneWeightsAndPurity

Consume §§8.1 and 8.8, *Mixed complexes and complexes of weights ≤w* and *Rf_! preserves complexes of weights ≤w*: for a separated finite-type morphism over a finite field, compact direct image preserves an upper complex-weight bound. For the constant sheaf this bounds every eigenvalue on H_c^i by Q^(i/2) under a complex embedding. The affine-line witness is the degree-2 eigenvalue Q; the point has degree-0 eigenvalue 1.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

Consume §5.4, *Uniform algebraic point counts*: for a geometrically irreducible affine variety V of dimension e≥0 presented by at most r equations of degree at most d in n variables, |#V(𝔽_q)−q^e|≤C_(n,r,d)q^(e−1/2) over every finite field 𝔽_q. Geometric irreducibility is required; §8.10 applies it to one fixed presentation over all finite extensions of its field of definition.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

Consume §5.1, *Bertini for monodromy images*, §5.8, *The Kazhdan–Margulis theorem*, and §5.10, *Even dimension: orthogonal monodromy*, including its finite ADE alternative. Apply these to a general pencil of degree-k hypersurfaces and its primitive pairing; identify its vanishing space with primitive cohomology using complete-intersection Lefschetz. These give the symplectic image and the orthogonal open-or-finite alternative over ℚ_ℓ; take Zariski closure and then extend scalars to E. The boundary primitive term of §6.3 is in degree n−2 without an additional Tate twist.

What LefschetzPencilsAndVanishingCycles must provide (gap:lpv-universal-monodromy): For the universal family of smooth degree-k hypersurfaces in ℙ^N over an algebraically closed field of characteristic zero or p>k, with k≥3, N≥3 odd, ℓ invertible and primitive middle ℚ_ℓ-cohomology, prove that its geometric monodromy image is infinite unless (k,N)=(3,3).

### From TauCetiRoadmap.AlgebraicTopologyPartII

Invariants use characteristic-zero E, so averaging by 1/m! is valid even when ℓ divides m!. Configuration carriers and their permutation torsor are consumed from InverseGaloisAndArithmeticFundamentalGroups IG.5.1.

Consume §2.1, *Split arrangement purity*: for m≥1, H_c^a(PConf_m(𝔸¹)) vanishes outside m+1≤a≤2m, and for m=0 only a=0 survives, with ℓ invertible in 𝔽_q. Consume §3.5, *Stable configuration diagonal*: for n≥4, j,d,N≥0 with d(n−3)≥j and an N-dimensional rational V, the weighted truncated configuration diagonal Σ_(m=0)^d dim(H_c^(mn−m−j)(PConf_m(ℂ),ℚ)⊗V^⊗m⊗sgn^(ε_n))^(S_m) equals the degree-j coefficient of its Euler product, where ε_n is the parity of n−1. Consume §4.1, *Tame complex polynomial*: a complex polynomial of degree k≥2 whose leading form defines a smooth projective hypersurface satisfies ‖∇f(z)‖≥c‖z‖^(k−1) outside a ball and is tame. Consume §4.2, *Tame fibre bouquet theorem*: every fibre of a tame polynomial on ℂⁿ, n≥1, is homotopy equivalent to a finite bouquet of (n−1)-spheres, with μ(f) spheres at a regular value. Consume §5.1, *Double-loop Betti series*: for n≥4 and X homotopy equivalent to a bouquet of N spheres of dimension n−1, the rational Betti series of the connected space Ω²X is the Euler product of §3.5, so that its degree-j coefficient is the stable configuration diagonal when d(n−3)≥j. Consume §5.4, *Fermat double-loop simple connectivity*: for n≥5 and exponents k_i≥1, X={Σz_i^(k_i)=1}⊂ℂⁿ has π₂X=π₃X=0, so Ω²X is connected and simply connected.

### From TauCetiRoadmap.AlgebraicTopology

Consume Stage 4, *CW pairs, cellular homology and cofibrations*, for S¹↪D² and based homotopy extension; Stage 6, *Cohomology, products and manifold duality*, for cup products and universal coefficients; Stage 8, *Relative homotopy, Hurewicz, Whitehead, and ordinary representability*, for higher homotopy and fibre comparisons. These are used on the specified based component; connectedness of the whole germ space is not assumed.

### From TauCetiRoadmap.DGFloer

Consume Layer 1 item 1, *Hurewicz in degree one*: π₁(C)ᵃᵇ≅H₁(C,ℤ) naturally for a path-connected component C. Combining the end-winding quotient with universal coefficients gives nonzero H¹(C,ℚ), and hence nonzero H¹ of the whole space. A nonabelian test is π₁=S₃, whose abelianization is ℤ/2; the map kills commutators rather than identifying π₁ itself with H₁. Consume Layer 2 items 2–3 for compact-open restriction along closed cofibrations of compact Hausdorff spaces and Map_*(S²,X)≅Ω²X in the fixed-interval model.

## How to read the build

Layers 0–2 are independent prefixes: affine geometric counting, polynomial boxes and lattices over 𝔽_q((T⁻¹)), and prime choice. Layers 3–5 construct the coefficient scheme, the Fourier complex and the individual major-arc strata; Layers 6–7 make them relative and form the finite spectral sequence. Layer 8 supplies geometric Weyl differencing and the polynomial polar-count argument, and Layers 9–10 combine these to prove the conservative comparison and the irreducibility theorem. Layers 11–12 separate the compact-open obstruction from fixed-radius collar control. Layer 13 uses an explicitly specified stronger topology and a conjectural perfect trace pairing to derive a conditional degeneration statement. The sharp estimate is an explicitly assumed proposition, and the stronger topology is explicitly supplied comparison data; neither is required by the conservative results.

## Layer 0: Affine dimension and degree geometry

### 0.1 Affine dimension theorem for intersections

Over an algebraically closed field, if irreducible closed Y,Z⊂A^M meet, each component C of Y∩Z has dim C≥dim Y+dim Z−M. For irreducible closed Z and a closed V whose every component meets Z, dim(V∩Z)≤0 implies dim V≤M−dim Z. Independently, every component of the nonempty zero locus of r polynomials in A^M has dimension at least M−r. (BS20, §6, proof of Proposition 6.2, p. 939; BS20 line 2091.)

A proof route is as follows. Use the diagonal in 𝔸ᴹ×𝔸ᴹ and apply the supplied componentwise minimal-prime height bound to its M equations in Y×Z; the finite-type dimension formula gives the intersection bound. For the consequence select a maximal-dimensional component of V and use its assumed intersection with irreducible Z.

*Needs:* SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; `Ideal.height_le_spanRank_toENat_of_mem_minimalPrimes`.

**Checks.**

- Two coordinate planes in A³ meet in a line and attain the bound.
- Disjoint parallel lines do not satisfy the nonempty-intersection hypothesis.
- For the cone V={uv=0}⊂𝔸² and Z the diagonal, both components of V contain 0 and V∩Z={0}, so the consequence gives dim V≤2−1=1, which is attained; for a component missing Z the consequence says nothing about it.

### 0.2 Degree bound for a finite Cartesian grid

Let V⊂A^N_K be a nonempty closed algebraic set over any field K. Write V_i for its reduced geometric irreducible components, e_i=dim V_i, Δ_i=deg V_i, e=max_i e_i and Δ=Σ_i Δ_i. For every nonempty finite S⊂K, #(V(K)∩S^N)≤Σ_i Δ_i|S|^(e_i)≤Δ|S|^e. The empty set contributes zero; nilpotents do not change the count. The arbitrary-grid form adapts the slicing proof of Proposition 2.3, using only the inequality form of Bézout; Theorem 2.1 is its finite-field-grid antecedent. No change of coordinates, field-size restriction or coefficient-height bound is required. (LR14v2, Theorems 1.1 and 2.1 and Proposition 2.3, v2 pp. 3–5; LR14v2 line 124, line 144 and line 231; BV15, Lemma 2.8, v2 pp. 12–13; BV15 line 530.)

A proof route is as follows. Base change to an algebraic closure and sum over geometric irreducible components. For an e-dimensional component with e>0 choose an original coordinate nonconstant on it. Each nonempty coordinate slice has pure dimension e−1, and projective Bézout followed by removal of infinity bounds its reduced cumulative degree by the original degree. Induct on dimension and sum the disjoint slices over S; dimension zero is bounded by degree.

*Needs:* SchemeAndStackFoundations §5.12; SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; §0.1.

**Checks.**

- A coordinate e-plane attains |S|^e with degree one.
- A parabola y=x² has degree two but its section x=0 has degree one; an equality for every affine section is unnecessary.
- A line together with arbitrarily many isolated points requires cumulative degree, not just the degree of its top-dimensional component.
- The hyperbola xy=1 causes no exceptional-projection problem: the proof slices in the original coordinates.

### 0.3 Fibre-dimension strata for geometric Weyl differencing

For a finite-type morphism φ:V→Y between finite-type schemes over a field, use the fibre-strata supplier contract to choose a finite partition of Y into irreducible locally closed W_j with constant fibre dimension e_j∈Z∪{−∞}. For e_j≥0, dim φ⁻¹(W_j)=dim W_j+e_j; the pieces with e_j=−∞ have empty inverse image. This is the finite stratification adapter used to maximize base dimension plus fibre cohomological degree in Layer 8. (STACKS, Lemma 37.30.3 (05F9), STACKS line 4237 (More on Morphisms).)

A proof route is as follows. The fibre-dimension constructibility extension and Noetherian quasi-compactness give a finite irreducible locally closed refinement. Use its constant-fibre dimension formula on every nonempty piece and keep empty fibres separate.

*Needs:* SchemeAndStackFoundations §§0.7–0.8 (gap:sf-fibre-strata); SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9.

**Checks.**

- The projection of a union of a horizontal and a vertical line has distinct fibre-dimension strata.
- A point outside the image has dimension −∞, not zero.

### Examples

Two coordinate planes in 𝔸³ meet in a line: 1=2+2−3. For S={0,1}, the coordinate line has 2 points and degree 1; adjoining (0,1) off that line gives 3≤2·2 and defeats a top-degree-only count.

### Dependencies

SchemeAndStackFoundations §§0.7–0.8 (gap:sf-fibre-strata) and §5.12; `Ideal.height_le_spanRank_toENat_of_mem_minimalPrimes`.

## Layer 1: Polynomial boxes and lattices over a function field

Throughout this layer A=𝔽_q[T], K_∞=𝔽_q((T⁻¹)) is the completion of 𝔽_q(T) for `RatFunc.inftyValuation`, and O_∞=𝔽_q[[T⁻¹]] is its unit ball {|x|≤1}, with the absolute values of Conventions.

### 1.1 Degree-uniform polynomial point bound

Let V⊂A^N over F_q(T) be nonempty, of dimension e≥0 and geometric cumulative degree Δ. For each integer h≥1, the number of u∈V(F_q[T]) with max_j |u_j|<q^h is at most Δq^(he), where |0|=0 and |a|=q^(deg a) for a≠0. Empty V contributes zero. For h≤0 only the zero vector can occur, and it contributes exactly when it belongs to V. All constants are independent of q and of coefficient heights. (BV15, Lemma 2.8, v2 pp. 12–13; BV15 line 530; LR14v2, Theorems 1.1 and 2.1 and Proposition 2.3, v2 pp. 3–5; LR14v2 line 124, line 144 and line 231.)

A proof route is as follows. For h≥1 take S={a∈F_q[T]:deg a<h}, including zero, so |S|=q^h. Apply §0.2 in the original coordinates with the explicit constant Δ; its proof uses no projection or coordinate change. For h≤0 the strict ball contains only zero. In BV15 the inclusive height bound q^N corresponds to the present h=N+1; the boundary conventions therefore agree.

*Needs:* §0.2; `RatFunc.inftyValuation`.

**Checks.**

- A coordinate affine e-plane has exactly q^(he) points in the strict positive-height box.
- At h=0 nonzero constants are excluded; the count is zero or one.
- A zero-dimensional variety has at most its degree many rational points regardless of h.

### 1.2 Polynomial lattices and their adjoints

For N≥0 and an invertible M∈GL_N(K_∞), the polynomial lattice of M is Λ_M=M·Aᴺ⊂K_∞ᴺ, and its adjoint lattice is Λ_M*=M^(−T)·Aᴺ, the lattice of the inverse transpose. (BS20, §6, before Lemma 6.4, p. 937; BS20 line 2009.)

- Λ_M depends only on the coset M·GL_N(A), and so does Λ_M*, since (Mγ)^(−T)=M^(−T)γ^(−T) with γ^(−T)∈GL_N(A).
- Λ_M* is the dual lattice {w∈K_∞ᴺ : w·v∈A for every v∈Λ_M} for the standard dot product, and (Λ_M*)*=Λ_M.
- Λ_M is an A-submodule of rank N meeting every ball {|v|<r} in a finite set.
- Left multiplication by k∈GL_N(O_∞) preserves the norm |v|, so Λ_(kM) and Λ_M have the same number of vectors in every ball; multiplication by Tʲ scales every norm by qʲ.

A proof route is as follows. Coset independence and duality are matrix identities. Finiteness in balls follows from the bound |c|≤|M⁻¹||v| for v=Mc and the finiteness of polynomial boxes. For k∈GL_N(O_∞), both k and k⁻¹ have entries in O_∞, so |kv|≤|v|≤|k⁻¹kv|.

*Needs:* `LaurentSeries`; `RatFunc.inftyValuation`.

**Checks.**

- M=I gives Aᴺ, which is its own adjoint; M=T⁻¹I gives T⁻¹Aᴺ, whose adjoint is T·Aᴺ, not T⁻¹Aᴺ.
- A singular matrix is excluded: for N=1 the zero matrix gives the set {0}, of rank zero rather than one, with no minimum and no inverse transpose.
- For N=0 the lattice is the zero space, its adjoint is again the zero space, and every ball contains exactly one vector.

### 1.3 Orthogonal bases, successive minima and strict-ball counts

For a polynomial lattice Λ⊂K_∞ᴺ define its successive minima R̂₁≤⋯≤R̂_N: R̂_i is the least r∈q^ℤ such that {v∈Λ : |v|≤r} contains i vectors linearly independent over K_∞. Prove that Λ has an orthogonal A-basis v₁,…,v_N, meaning |Σc_iv_i|=max_i|c_i||v_i| for every c∈K_∞ᴺ, with |v_i|=R̂_i; equivalently, every M∈GL_N(K_∞) factors as M=k·diag(T^(e₁),…,T^(e_N))·γ with k∈GL_N(O_∞), γ∈GL_N(A), e₁≤⋯≤e_N and R̂_i=q^(e_i). Consequently, for every integer s, #{v∈Λ : |v|<q^(−s)}=∏_(i=1)^N max(1,q^(−s)R̂_i^(−1)). (BS20, §6, proof of Lemma 6.4, p. 938; BS20 line 2055 and line 2063 through line 2072, where the strict-ball count is quoted from Lee's thesis, Lemma 3.3.5.)

- The minima are integral powers of q, attained, and determined by Λ alone.
- ∏_i R̂_i=|det M|, with equality rather than an inequality up to a constant.
- Scaling Λ by Tʲ multiplies every minimum by qʲ, and left multiplication by GL_N(O_∞) preserves the minima.
- The strict-ball count holds for every integer radius exponent s, including the boundary radius q^(−s) equal to a minimum, which is excluded.

A proof route is as follows. Among all A-bases of Λ choose one minimizing Σ_i log_q|v_i|; the sum is bounded below by log_q|det M| because |det(v₁,…,v_N)|≤∏|v_i| in the ultrametric norm and the determinant of an A-basis is |det M|. Let ℓ(v_i)∈𝔽_qᴺ be the coefficient vector of the top power T^(log_q|v_i|) in v_i. If the ℓ(v_i) were linearly dependent, subtracting from the longest vector of a dependence the polynomial combination Σ a_iT^(log_q|v_j|−log_q|v_i|)v_i would cancel its top term and lower the sum; so they are independent, which is orthogonality. Then the columns v_i/T^(log_q|v_i|) form a matrix in GL_N(O_∞). For v=k·diag(T^e)·c the condition |v|<q^(−s) reads deg c_i<−s−e_i coordinatewise, with q^(max(0,−s−e_i)) solutions each.

*Needs:* §1.2.

**Checks.**

- For Λ=Aᴺ every minimum is 1; the strict ball |v|<1 contains only 0, while the closed ball |v|≤1 contains qᴺ vectors.
- The basis (1,T),(0,1) of A² has norms q and 1, but A² has minima 1 and 1; reading the minima off an arbitrary basis is wrong, and here the leading-coefficient vectors (0,1) and (0,1) are dependent.
- For Λ=diag(T⁻²,T)A² and s=−1 the count is max(1,q·q²)·max(1,q·q⁻¹)=q³: the vectors (T⁻²c₁,Tc₂) of norm less than q have deg c₁<3 and c₂=0.

### 1.4 Adjoint minima

For a polynomial lattice Λ⊂K_∞ᴺ with minima R̂_i, the adjoint lattice has minima R̂_i(Λ*)=R̂_(N+1−i)(Λ)^(−1) for 1≤i≤N. (BS20, §6, proof of Lemma 6.4, p. 938; BS20 line 2055 through line 2060, where this reciprocity is applied to the block lattice of §1.5.)

A proof route is as follows. Write M=k·diag(T^e)·γ as in §1.3. Then M^(−T)=k^(−T)·diag(T^(−e))·γ^(−T) with k^(−T)∈GL_N(O_∞) and γ^(−T)∈GL_N(A), so the adjoint minima are q^(−e_N)≤⋯≤q^(−e₁). The nonarchimedean factorization is used, not the Euclidean transference inequality, which holds only up to a constant.

*Needs:* §1.3.

**Checks.**

- Λ=diag(T,T⁻²)A² has minima q⁻² and q; its adjoint diag(T⁻¹,T²)A² has minima q⁻¹ and q², the reciprocals in reverse order.
- For Λ=Aᴺ both Λ and Λ* have all minima 1.
- Without the reversal, the formula R̂_i(Λ*)=R̂_i(Λ)⁻¹ would give R̂₁(Λ*)=q² and R̂₂(Λ*)=q⁻¹ in the first Check, which is not an increasing sequence.

### 1.5 Shrinking for symmetric lattices

For a finite field 𝔽_q, n≥0, a symmetric n×n matrix γ over K_∞ and integers a and c, put N_(γ,a,c)=#{x∈Aⁿ : |x|<q^a, ‖γx‖<q^(−c)}. For c>0 and s≥0, N_(γ,a,c)≤q^(ns+n·max(⌊(a−c)/2⌋,0))·N_(γ,a−s,c+s). This includes a≤0, where both counts are 1, s=0, where the ratio is 1, and n=0. (BS20, §6, Lemma 6.4 and its proof, pp. 937–938; BS20 line 2014 through line 2075.)

A proof route is as follows. For a≤0 only x=0 is counted on both sides. For a>0 put Λ_(a,c)=[[T^(−a)I,0],[T^cγ,T^cI]]∈GL_(2n)(K_∞). For (x,y)∈A^(2n), |Λ_(a,c)(x,y)|<1 says |x|<q^a and |γx+y|<q^(−c); since c>0 this forces y to be minus the polynomial part of γx, so N_(γ,a,c) is the number of vectors of norm <1 in the lattice of Λ_(a,c), and since Λ_(a−s,c+s)=TˢΛ_(a,c), N_(γ,a−s,c+s) is the number of norm <q^(−s). By §1.3 these are ∏max(1,R̂_i⁻¹) and ∏max(1,q^(−s)R̂_i⁻¹). Symmetry of γ gives T^(c−a)Λ_(a,c)^(−T)=JΛ_(a,c)J⁻¹ with J=[[0,I],[−I,0]], a signed permutation and hence an isometry; with §1.4 this yields R̂_iR̂_(2n+1−i)=q^(c−a), so R̂_(n+1)≥q^(⌈(c−a)/2⌉). Each of the 2n factor ratios is at most qˢ, and each with i≥n+1 is at most max(1,R̂_i⁻¹)≤q^(max(⌊(a−c)/2⌋,0)).

*Needs:* §§1.3–1.4.

**Checks.**

- For γ=0, q=5, n=1 and a=c=s=1: N_(0,1,1)=5, the constants, and N_(0,0,2)=1, so the inequality 5≤5·1 is an equality.
- For n=1, γ=T⁻², a=4, c=1, s=1: N_(γ,4,1)=q³ (x=x₀+x₂T²+x₃T³, since an x₁T term gives ‖γx‖=q⁻¹) and N_(γ,3,2)=q (x=x₂T²). The ratio q² exceeds q^(ns)=q and equals the bound q^(1+⌊3/2⌋), so the max term cannot be dropped.
- For n=1, γ=T⁻¹ and a=c=1, only x=0 satisfies ‖γx‖<q⁻¹, so N_(γ,1,1)=1; the non-strict condition would admit all q constants.

### Examples

Over 𝔽₂[T], h=2 gives S={0,1,T,T+1}. A coordinate line contains exactly 4 points, and a coordinate plane exactly 16. At h=0 only the zero vector remains. For n=1 and γ=0 the block lattice Λ_(a,c) of §1.5 has minima q^(−a) and q^c, whose product is q^(c−a), as the reciprocity of §1.4 predicts.

### Dependencies

§0.2; `RatFunc.inftyValuation`; `LaurentSeries`.

## Layer 2: Admissible coefficient and residue primes

### 2.1 Choose a coefficient prime for fixed odd characteristic

For each odd prime p and bound B there is a prime ℓ>max(B,p) with ℓ≡−1 mod p; hence ℓ≠p and the order of its residue in F_p× is exactly two. The assertion is independent of f,n,d. (BS20, Implicit input to published Corollary 2.9 and proof pp.907–908; BS20 line 637.)

A proof route is as follows. Apply the pinned primes-in-arithmetic-progressions theorem to the unit residue −1 modulo p. Since p is odd, −1≠1 and (−1)²=1. Enlarge the bound rather than choosing a possibly forbidden prime.

*Needs:* `Nat.forall_exists_prime_gt_and_modEq`.

**Checks.**

- For p=5 the residue 4 has order two.
- Exclude p=2, where −1 has order one.
- The chosen prime exceeds both B and p, so equality of coefficient and residue characteristic cannot occur.

### 2.2 Choose good residue characteristics for fixed coefficient prime

For a fixed prime ℓ, integers B,k and finite bad-prime set S, there are arbitrarily large primes p>max(B,k,ℓ), p∉S, for which ℓ is a nonsquare modulo p and therefore has even multiplicative order. For odd ℓ choose a nonzero quadratic nonresidue a mod ℓ and the CRT residue p≡a mod ℓ, p≡1 mod4; for ℓ=2 use p≡5 mod8. (BS20, Published spreading-out proof pp.906–907; BS20 line 585.)

A proof route is as follows. Choose the CRT unit class and use Dirichlet above every member of S. For odd ℓ, quadratic reciprocity has positive sign because p≡1 mod4. For ℓ=2 use the supplementary law. In a cyclic finite field unit group, an odd-order element is a square; conclude even order.

*Needs:* `Nat.forall_exists_prime_gt_and_modEq`; `legendreSym.quadratic_reciprocity`; `legendreSym.at_two`.

**Checks.**

- The class 5 mod8 makes 2 a nonsquare.
- For odd ℓ, a must be nonzero so the CRT class is a unit.
- Avoidance is uniform over any prescribed finite set, not a single ad hoc characteristic.

### Examples

For p=5 a coefficient prime ℓ=19 has residue −1 and order 2. With ℓ=2 the residue characteristic p=13 is 5 mod 8, and 2 has order 12 modulo 13.

### Dependencies

`Nat.forall_exists_prime_gt_and_modEq`; `legendreSym.quadratic_reciprocity`; `legendreSym.at_two`.

## Layer 3: Polynomial maps and compact-support Fourier transform

### 3.1 Polynomial mapping scheme with a fixed leading vector

Fix a field K, n≥2, k≥3, f∈K[x₁,…,x_n] of degree k, and a nonzero vector x with f₀(x)=0, where f₀ is the degree-k part. For d≥1 put g_j=x_jT^d+Σ_(0≤i<d)a_(i,j)T^i. Mor_(d,x)(A¹,X) is the closed coefficient scheme in A^(dn) cut out by all coefficients of f(g); its top coefficient is already zero, so kd equations suffice. Over a nonzero K-algebra the tuple has degree exactly d, though an individual coordinate can have smaller degree. Over the zero K-algebra there is a unique tuple and no degree assertion is made. Fix x itself, with no quotient by reparametrization or scalar rescaling. (BS20, §1, p.893; §2, eq. (2.1), p.899; BS20 line 4.)

The coefficient presentation in the acceptance test uses `mappingPolynomial` for the coordinate tuple, `mappingEquation` for f evaluated on that tuple, and `mappingIdeal` for the ideal spanned by all coefficients of the evaluated polynomial. The quotient of K[a_(i,j)] by this ideal is the coordinate ring of Mor. All three definitions carry their field parameter explicitly; no smoothness is needed to define them. The ideal uses every coefficient even when the leading coefficient does not vanish.

- Construct g_j=x_jT^d+Σ_(i<d)a_(i,j)T^i over every K-algebra.
- For i<d the coefficient is a_(i,j); at d it is x_j; above d it is zero.
- R-points of Mor are exactly prescribed tuples satisfying f(g)=0, naturally in K-algebra R.
- Coefficient extension gives the base change of the representing scheme, including nilpotents.
- Equality of all lower coefficients is equivalent to equality of tuples with the same fixed x.

The equation and ideal presentation additionally has the following API.

- Evaluation of f on the coordinate polynomials commutes with every coefficient-ring homomorphism, from K[a][T] to the corresponding scalar-extended polynomial ring.
- The coefficient ideal is generated by the coefficients in degrees below kd when f has degree k and f₀(x)=0; without incidence the coefficient in degree kd is retained.
- An assignment of the lower coefficients kills this ideal exactly when the full polynomial f(g) vanishes; the representing statement applies to all K-algebras, including square-zero thickenings.

A proof route is as follows. Use polynomial evaluation to construct the coefficient equations functorially in K-algebras. The leading coefficient is f₀(x); prove its vanishing before dropping that equation. Identify R-points with the prescribed polynomial tuples and retain the representing-scheme structure, including nilpotents.

*Needs:* SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; `MvPolynomial.eval₂Hom`.

**Checks.**

- For d=2,x=(1,0), the second coordinate has degree ≤1 while the tuple has degree two.
- With d=3, lower coefficients (a0,a1,a2) produce xT³+a2T²+a1T+a0.
- Replacing x by 2x in characteristic zero changes the prescribed leading-coefficient functor; scalar reparametrization is not quotiented out.
- The equations are evaluated over K[ε]/(ε²), not only over field-valued points; the representing scheme must preserve these nilpotent directions.
- Over the zero K-algebra all coefficients vanish and there is one R-point, corresponding to the unique map from its empty spectrum; the degree-exactness claim applies only to nonzero test algebras.
- For f=0 the equation is 0 and its coefficient ideal is (0); the representing functor is the whole coefficient affine space. A definition using only a nonzero frequency would lose it.
- For f=1 the equation is 1 and its coefficient ideal is the unit ideal; the zero scheme is empty. Dropping the constant coefficient would give the wrong functor.
- For f=Y₁, d=1, x₁=1, the equation is T+a₀ and the ideal is the unit ideal. Retaining only coefficients below d without incidence would incorrectly give the nonempty point a₀=0.

### 3.2 Expected dimension lower bound

Every irreducible component of a nonempty Mor_(d,x) has dimension at least D=d(n−k). No nonemptiness or equidimensionality assertion is implicit. (BS20, §1, p.893 (expected dimension); §2, proof of Corollary 2.9, p.907; BS20 line 4.)

A proof route is as follows. There are dn coefficient variables and at most kd coefficient equations. Apply the componentwise codimension bound of Layer 0.

*Needs:* §3.1; §0.1.

**Checks.**

- The bound is componentwise, so it can combine with top cohomology to exclude smaller components.
- When the scheme is empty, no component or dimension equality is inferred.

### 3.3 Smooth projective closure of X and its irreducibility

Assume X={f=0}⊂A^n is smooth and the degree-k hypersurface Z={f₀=0}⊂P^(n−1) is smooth. The homogenization defines a smooth projective X̄⊂P^n with boundary Z and X=X̄∖Z. For n≥2, X̄ is geometrically connected and geometrically irreducible of dimension n−1; its nonempty affine open X is geometrically irreducible. (BS20, §3, Lemma 3.7 (hypothesis) p.917, proof of Lemma 3.11 pp.919–920; §4, Lemma 4.2 pp.922–923; BS20 line 1090.)

A proof route is as follows. On the affine chart use smoothness of X; at infinity use a nonzero tangential derivative of f₀ on Z. Use connectedness of a positive-dimensional projective hypersurface, and the disjointness of components of a smooth scheme, to obtain geometric irreducibility. The boundary is a proper divisor, so the affine open is nonempty.

*Needs:* SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; EtaleDualityAndPerverseSheaves §§4.1, 4.3, 4.6.

**Checks.**

- Two parallel affine lines, cut out by Y₁(Y₁−1)=0, are smooth and reducible; their leading form Y₁² has nonsmooth projective zero locus, which excludes this negative control.
- At a boundary point the derivative test must use the leading form, not an affine chart with x₀≠0.

### 3.4 Residue-coefficient phase

Set L=kd and α=Σ₁≤r≤L b_rT⁻ʳ. Define the residue phase e on 𝔸^(dn)×𝔸ᴸ by e(a,b)=[T⁻¹]αf(g)=Σ₁≤r≤L b_r[T^(r−1)]f(g). It is regular, linear in b and of degree at most k in a. Its homogeneous degree-k part is obtained by substituting only the variable lower-coefficient tuple into f₀; the fixed leading vector contributes no a-variable degree. Lower-degree terms of the complete phase retain the whole f. (BS20, §2, pp.899–900; BS20 line 250.)

- The acceptance definition `residuePhase` is the finite coefficient sum Σ_(r=1)^L b_r coeff(f(g),r−1), evaluated at the lower-coefficient tuple.
- For fixed a the phase is a linear functional of b.
- This coefficient sum equals [T^(−1)]αf(g) in the Laurent-series carrier.
- Its homogeneous degree-k part in a is the polar-count top-phase polynomial of §8.7, not generally the entire phase.

A proof route is as follows. Expand the finite coefficient convolution; the top coefficient f₀(x) vanishes. Separate the degree-k homogeneous part in the a-variables from the complete phase.

*Needs:* §3.1; `MvPolynomial.eval₂Hom`.

**Checks.**

- b=0 gives e(a,0)=0.
- Replacing f by f+1 changes e by b₁; it cannot leave the whole phase unchanged.
- For f=Y₁³−Y₂³+1, d=1, x=(1,1), lower coefficients (a,c), e=b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c).

### 3.4a Additive-character cancellation

Let Y be a separated scheme of finite type over a separably closed field k of characteristic p, φ:Y→𝔸¹ a regular function, and a:Y×𝔾_a→Y an action of the additive group with φ(a(y,λ))=φ(y)+u(y)λ for an invertible function u on Y. Then RΓ_c(Y,L_ψ(φ))=0 with coefficients in E. In particular a nonzero affine-linear function c·v+c₀ on 𝔸ᴺ, with the translation action along a vector w with c·w=1, has acyclic compact-support complex. (BS20, §3, Lemma 3.2 and its proof, p. 910; BS20 line 772.)

A proof route is as follows. The action law forces u(a(y,λ))=u(y). The map a′(y,λ)=(a(y,λ/u(y)),λ) is an automorphism of Y×𝔸¹ with inverse (y,λ)↦(a(y,−λ/u(y)),λ), and φ(a(y,λ/u(y)))=φ(y)+λ, so additivity pulls pr₁*L_ψ(φ) back to L_ψ(φ)⊠L_ψ(λ). Compact Künneth then gives RΓ_c(Y,L_ψ(φ))[−2](−1)≅RΓ_c(Y,L_ψ(φ))⊗RΓ_c(𝔸¹,L_ψ), and the second factor vanishes.

*Needs:* FourierDeligneTransform §2.4, *Vanishing of cohomology*, and §2.5, *Artin–Schreier sheaves*; EtaleCohomologyFoundations §§F.2.4–F.2.7 and F.4.5.

**Checks.**

- Y=𝔸¹, φ(λ)=λ and translation with u=1 recover RΓ_c(𝔸¹,L_ψ)=0.
- With φ=0 and the trivial action, u=0 and RΓ_c(𝔸¹,E)=E[−2](−1)≠0: the phase must move.
- On Y=𝔸² with coordinates (t,v), φ=tv and translation in v, u=t vanishes on t=0 and RΓ_c(𝔸²,L_ψ(tv))=E[−2](−1)≠0, supported on that line; invertibility of u everywhere cannot be weakened to generic nonvanishing.

### 3.5 Geometric exponential-sum complex

Over F_q of characteristic p>k choose ℓ≠p, E=Q_ℓ(μ_p), and a nontrivial additive character ψ:F_p→E×. With π₂:A^(dn)×A^L→A^L define S_(d,f)=Rπ₂! e*L_ψ in the supplied bounded constructible E-complex category. Its geometric stalk at b is RΓ_c(A^(dn),L_ψ(e(−,b))). No descent from E to Q_ℓ is assumed. (BS20, §2, p.901; BS20 line 363.)

- Apply the supplied Rπ₂! to e*L_ψ with coefficients E.
- The geometric stalk is RΓ_c(A^(dn),L_ψ(e_b)).
- Finite E→E′ commutes with the construction via derived tensor.
- At b=0 its stalk is E[−2dn](−dn).

A proof route is as follows. Pull back the rank-one Artin–Schreier sheaf along e and apply the supplied compact-support direct image. Use exceptional base change to identify geometric stalks; distinguish a complex from its trace function.

*Needs:* §3.4; EtaleCohomologyFoundations §§F.2–F.4; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; FourierDeligneTransform §§2.2–2.5; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- At zero frequency the top nonzero degree is 2dn with Tate twist −dn.
- For k=3, p=5 and ℓ=2 use E=Q₂(μ₅). The order of 2 modulo 5 is four, and Q₂ itself has no nontrivial fifth-root-valued additive character.
- A fibre whose phase is a nonzero linear functional has zero compact-support complex, although its source affine space is nonempty.

### 3.6 Cohomological Fourier orthogonality

With the preceding finite-field data, RΓ_c(Mor_(d,x),E)≅RΓ_c(A^L,S_(d,f))[2L](L). Thus H_c^i(Mor,E)≅H_c^(i+2L)(A^L,S)(L), compatibly with geometric Frobenius and extension of E. (BS20, §2, Lemma 2.1, p.901; proof pp.901–902; BS20 line 363.)

A proof route is as follows. First integrate the phase over b. A nonzero coefficient vector gives an acyclic nontrivial linear Artin–Schreier sheaf (§3.4a, or the fibrewise form of FourierDeligneTransform §3.4). On the zero coefficient scheme the fibre is RΓ_c(A^L,E)=E[−2L](−L). Apply base change and Fubini to retain the scheme-theoretic zero locus.

*Needs:* §3.5; §3.4a; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; FourierDeligneTransform §§2.2–2.5 and 3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- At b=0 the phase is zero; linear-character cancellation cannot be applied there.
- The recovered mapping cohomology has shift +2kd and twist +kd.

### Examples

For f=Y₁³−Y₂³+1, d=1 and x=(1,1), the phase is b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c). The frequency b=0 gives E[−4](−2), with trace q².

### Dependencies

SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; `MvPolynomial.eval₂Hom`; §0.1; EtaleDualityAndPerverseSheaves §§4.1, 4.3, 4.6; EtaleCohomologyFoundations §§F.2–F.4; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; FourierDeligneTransform §§2.2–2.5 and 3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6.

## Layer 4: Hankel rank arcs and rational approximation

### 4.1 Hankel-rank geometric major arcs

For L≥0 and 0≤m≤L form the (L−m)×(m+1) matrix H_m(b)=(b_(i+j−1)) with 1≤i≤L−m, 1≤j≤m+1. Let D_m^L be the determinantal closed scheme defined by its (m+1)-minors, and let A_m^L be its associated reduced closed scheme. Both have field-valued locus rank H_m≤m. Set A_(−1)=∅ and saturate A_m=A^L for m>L. The minors give the base-change-compatible scheme model; nesting, dimensions and strata refer to the reduced loci. Reduction is not asserted to commute with arbitrary field extension. (BS20, §2, Definition 2.3, p.903; BS20 line 453.)

- The acceptance definition `hankelMatrix` builds H_m with Fin(L−m) rows, Fin(m+1) columns and entry b_(i+j+1) in zero-based indexing; the frequency vector itself uses Fin L and starts at b₁. This matrix constructor needs only a coefficient type; rank and the geometric loci use fields.
- Construct D_m from minors and A_m as its associated reduced closed scheme, with the common field-point rank characterization.
- A_(−1)=∅; for m>L the stage is A^L.
- The determinantal model D_m defined by minors commutes with field extension; take reduction after the chosen extension when forming reduced strata.

A proof route is as follows. Use the actual Matrix carrier and determinantal ideals, not a predicate standing in for a scheme. Make all out-of-range cases explicit; natural subtraction alone does not define the intended negative stage.

*Needs:* SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; `Matrix.rank`.

**Checks.**

- For L=3,m=0, rank≤0 forces b₁=b₂=b₃=0.
- For L=9,b₅=1 and all other b=0, H₄ is the 5×5 anti-identity and rank five.
- For m=L, H_m has zero rows and A_L=A^L; for m>L the scheme is saturated explicitly.

### 4.2 Closedness and nesting of major arcs

The reduced rank arcs are closed and nested, A_(m−1)⊂A_m. A₀ consists of the zero coefficient vector. These assertions use the Hankel relation between successive matrices, rather than an arbitrary rectangular matrix rank comparison. (BS20, §2, Lemma 2.4(1)–(2), p.903; proof pp.903–904; BS20 line 453.)

A proof route is as follows. Closedness follows from the determinantal model. Extend a kernel recurrence by one degree, or use the Padé recurrence argument directly, to obtain field-point nesting without assuming every matrix is square; pass to reduced closed loci to obtain the closed immersion.

*Needs:* §4.1.

**Checks.**

- For L=3, A₀ has all three coefficients zero.
- The geometric progression b=(1,2,4) has H₁=[[1,2],[2,4]] of rank 1 and H₀=(1,2,4)ᵀ of rank 1, so b lies in A₁ but not in A₀.

### 4.3 Exact automatic-full range

If m≥ceil(L/2), A_m^L=A^L. The preceding threshold cannot in general be replaced by floor(L/2): for L=9 the vector with b₅=1 and all other entries zero has rank H₄=5. (BS20, §2, Lemma 2.4(3), p.903; used with the ceiling in §5, proof of Proposition 2.6, p.934; BS20 line 453.)

A proof route is as follows. At the ceiling threshold the number L−m of rows is at most m. For the odd-length test compute the anti-identity matrix of size five.

*Needs:* §4.1.

**Checks.**

- L=9,m=4 is not full.
- L=9,m=5 is full.
- L=0 has a full zero-dimensional coefficient space.

### 4.4 Hankel rank and Padé approximation

For 0≤m≤L, b∈A_m^L exactly when there are 0≤m′≤m, a monic h₂ of degree m′, and h₁ of degree <m′, for which α=h₁/h₂+O(T^(−L−1+m−m′)). The formal O condition means every error exponent is at most the indicated integer; for m′=0 the numerator is zero. (BS20, §2, Lemma 2.4(4), p.903; proof p.904; BS20 line 453.)

A proof route is as follows. Translate a nonzero vector in ker H_m into a polynomial denominator. Separate its actual degree m′, clear the denominator and compare the consecutive Laurent coefficients. Conversely these coefficient equalities give the Hankel kernel vector.

*Needs:* §4.1; `LaurentSeries`.

**Checks.**

- For α=0 one may take h₂=1,h₁=0.
- Actual denominator degree can be smaller than m.
- The error bound changes by m−m′; replacing it by a fixed exact rational identity is wrong.

### 4.5 Unique reduced approximation on a rank stratum

If 0≤m≤L/2 and b∈A_m∖A_(m−1), the Padé triple (m′,h₁,h₂) is unique, with h₂ monic and gcd(h₁,h₂)=1. When m′<m the coefficient of T^(−L−1+m−m′) in the error is nonzero. (BS20, §2, Lemma 2.4(5), p.903; proof pp.904–905; BS20 line 453.)

A proof route is as follows. Compare two approximants by the degree of their cross-product numerator and the long Laurent agreement. Cancel any common factor; failure of coprimality or of the stated leading-error condition would put b in A_(m−1).

*Needs:* §4.4; §4.2.

**Checks.**

- Monicity removes scalar ambiguity.
- Uniqueness is asserted on the exact rank stratum and only in the stated m-range.

### 4.6 Exact-denominator major-arc open

For 0≤m≤L/2 let U_m be the points of A_m∖A_(m−1) whose reduced Padé denominator has degree exactly m. Equivalently α agrees through T^(−L) with h₁/h₂, where h₂ is monic of degree m, deg h₁<m and the pair is coprime. At m=0 the sole pair is (0,1). (BS20, §3, p.908; BS20 line 679.)

- Select exact-stratum points whose unique reduced denominator has degree m.
- Identify U_m with monic degree-m denominator/coprime numerator pairs.
- The forward chart map is the first L negative Laurent coefficients of h₁/h₂.
- The chart and its inverse are regular on the resultant-open pair space.

A proof route is as follows. Use unique Padé data to define the full-denominator open chart. Identify its inverse by the finite list of Laurent coefficients.

*Needs:* §4.5.

**Checks.**

- U₀ is the single pair (h₁,h₂)=(0,1).
- For m=1, h₁=c≠0,h₂=T−a gives b_r=c a^(r−1).
- The pair h₁=T−a,h₂=(T−a)(T−b) is excluded by coprimality and reduces to a smaller denominator.

### 4.7 Polynomial-pair model of the good arc

The coefficient expansion (h₁,h₂)↦([T^(−r)]h₁/h₂)_(1≤r≤L) identifies the open coprime-pair scheme in A^(2m) with U_m; the inverse is regular. Moreover dim A_m≤2m for m≤L/2, including the lower-denominator boundary. (BS20, §3, Lemma 3.1, pp.908–909; proof pp.909–910; dimension use in §5, proof of Proposition 2.6, p.934; BS20 line 679.)

A proof route is as follows. Use the relevant nonzero Hankel minor to solve the recurrence regularly on a cover. For each m′≤m count m′ numerator and m′ denominator parameters and m−m′ possible error coefficients: at most m+m′≤2m. Do not infer the full dimension bound from the open chart alone unless density has also been proved.

*Needs:* §4.6; §4.4; §0.3.

**Checks.**

- m=0 gives a point.
- m=1 uses a nonzero constant numerator.
- The lower-denominator strata are included in the dimension bound.

### Examples

For L=3 and b=(1,2,4), the rank-one recurrence has h₁=1,h₂=T−2 in characteristic zero. For L=9 and b₅=1 alone, H₄ has determinant +1 and rank 5, while H₅ has only 4 rows and is automatically admissible.

### Dependencies

SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; `Matrix.rank`; `LaurentSeries`; §0.3.

## Layer 5: Major-arc complexes and signed configuration descent

Throughout this layer assume n≥2, k≥3, d≥1, p>k, ℓ≠p, smooth X and smooth leading boundary, and a fixed nonzero leading vector x with f₀(x)=0. Neither n>2ᵏ(k−1), d≥k−1 nor an even order of ℓ modulo p is used; m≤d is retained wherever it is stated.

### 5.1 Lower-denominator boundary cancellation

For 0≤m≤d, the restriction of S_(d,f) to (A_m∖A_(m−1))∖U_m is zero. At a point of denominator degree m′<m, a nonzero coordinate of ∇f₀(x) gives an additive translation of the polynomial tuple whose phase has nontrivial linear variation. (BS20, §3, Lemma 3.3, p.911; proof pp.911–912; BS20 line 804.)

A proof route is as follows. Choose a coordinate with nonzero leading gradient and translate it by λT^(d−m)h₂. The exact Padé error term makes the phase variation a nonzero multiple of λ. Apply the equivariant cancellation of §3.4a after base change to every geometric point.

*Needs:* §3.5; §3.4a; §4.5; §4.6.

**Checks.**

- The exponent d−m must be nonnegative.
- At m′=m the argument does not cancel the good chart.

### 5.2 Remainder fibration on the good arc

For m≤d and a monic denominator h₂ of degree m, divide each g_j by h₂. Over U_m this gives ρ:A^(dn)×U_m→A^(mn)×U_m, sending g to the remainders of degree <m. It is a trivial affine bundle of rank n(d−m), with the quotient’s leading term fixed by x. The residue phase descends to the remainder variables. (BS20, §3, pp.912–913, and proof of Lemma 3.4, p.913; BS20 line 845.)

- Construct quotient and remainder maps by monic division over the full pair base.
- Identify the fibres with A^(n(d−m)), preserving the fixed quotient leading term.
- The residue phase equals the reduced phase pulled back through ρ.
- The quotient/remainder formulas commute with K-algebra maps.

A proof route is as follows. Use monic division over arbitrary coefficient algebras to obtain regular quotient and remainder maps. After multiplying the quotient part by h₂, its contribution to the residue is polynomial in T and hence zero.

*Needs:* §3.1; §3.4; §4.6.

**Checks.**

- m=d gives a rank-zero affine bundle, not a positive-dimensional fibre.
- Dividing xT²+a₁T+a₀ by T−b gives remainder xb²+a₁b+a₀ and quotient with leading coefficient x.
- Division by a polynomial with a nonunit leading coefficient over a general coefficient algebra is not this trivial bundle.

### 5.3 Residue-class exponential complex

Let B_m be the affine scheme of monic degree-m polynomials. On coprime pairs (h₁,h₂) and n remainders modulo h₂ define ē by the coefficient of T^(−1) in h₁f(remainders)/h₂. Integrate ē*L_ψ first over the mn remainder coordinates and then over h₁ coprime to h₂; the resulting constructible complex on B_m is S̄_m. (BS20, §3, p.913; BS20 line 911.)

- Integrate the reduced phase over remainders and the coprime-numerator fibre to get a complex on B_m.
- At h₂ the stalk integrates exactly all h₁ with deg<h₂ and gcd(h₁,h₂)=1, together with the n remainder classes.
- Coprime factorization pulls it back to the external tensor product.
- Distinguish its B_m base from the U_m complex before the numerator pushforward.

A proof route is as follows. Construct the phase by monic division and finite Laurent expansion. Name the two direct-image maps, so the complex on U_m is not confused with its pushforward on B_m.

*Needs:* §5.2; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; FourierDeligneTransform §§2.2–2.5; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- For h₂=T−a the numerator is a nonzero constant h and the phase is h f(g(a)).
- At m=0 the only numerator-denominator pair is (0,1); the complex is E.
- The zero numerator for a positive-degree denominator is not in the coprime integration domain.

### 5.4 Affine-fibre shift and twist

For 0≤m≤d, integrating the quotient coordinates gives Rρ!E=E[−2n(d−m)](−n(d−m)). Consequently RΓ_c(U_m,S)≅RΓ_c(B_m,S̄_m)[−2n(d−m)](−n(d−m)). (BS20, §3, Lemma 3.4, p.913; proof pp.913–914; BS20 line 911.)

A proof route is as follows. Use the trace normalization of compact cohomology of affine space. Apply projection formula to the descended phase; then compose the two compact-support integrations.

*Needs:* §5.2; §5.3; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- At m=d the shift and twist are zero.
- For a single quotient coordinate the shift is −2, never +2.

### 5.5 Coprime multiplicativity

On the open locus of coprime monic factors l₁,l₂ of degrees m₁,m₂, multiplication pulls S̄_(m₁+m₂) back to S̄_m₁⊠S̄_m₂. The numerator correspondence is h=h₁l₂+h₂l₁, and the remainder correspondence is the Chinese remainder isomorphism modulo l₁l₂. Interchanging factors uses the derived tensor symmetry. (BS20, §3, Lemma 3.5, p.914; proof pp.914–915; BS20 line 947.)

A proof route is as follows. Use the Bézout identity to make both CRT and numerator changes regular on the resultant-open locus. The rational phase is the sum h₁f/l₁+h₂f/l₂ modulo polynomials. Apply Künneth including its Koszul commutativity constraint.

*Needs:* §5.3; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- Two distinct linear factors recover a tensor square.
- Do not multiply the numerator names in place of l₁l₂.

### 5.6 Nonsquarefree-modulus cancellation

If h₂ is not squarefree, the stalk of S̄_m at h₂ vanishes. After CRT reduction to (T−a)^r with r≥2, translate a remainder coordinate when ∇f is nonzero; when ∇f is zero, smoothness of X forces f≠0 and a numerator translation supplies the nontrivial character. (BS20, §3, Lemma 3.6, p.916; proof pp.916–917; BS20 line 1022.)

A proof route is as follows. Reduce by CRT to a repeated local factor. Partition according to the gradient and use the two distinct translations. Apply the cancellation of §3.4a in each case; do not assume every point lies on X.

*Needs:* §5.5; §3.4a.

**Checks.**

- A double root is excluded from the support.
- The f≠0 branch is essential at critical points away from X.

### 5.7 Reduced compact cohomology via trace fibre

For smooth geometrically irreducible X of dimension n−1 define RΓ_(c,red)(X,E) as the homotopy fibre of the trace RΓ_c(X,E)→E[−2(n−1)](−(n−1)). This removes top compact cohomology; it is not ordinary reduced cohomology formed by a basepoint. (BS20, §3, p.917; BS20 line 1090.)

- Take the homotopy fibre of the degree-2(n−1) trace.
- Give the fibre→RΓ_c(X)→E[−2(n−1)](−(n−1)) distinguished triangle.
- When top trace is an isomorphism, the fibre has no top cohomology.
- The fibre and trace commute with finite coefficient extension.

A proof route is as follows. Use the supplied trace and fibre in the enhanced constructible-complex formalism. Fix fibre, shift and twist by its distinguished triangle rather than by a dimension-only characterization.

*Needs:* §3.3; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- For X=A^(n−1) the trace is an isomorphism and the reduced complex is zero.
- The trace target is E[−2(n−1)](−(n−1)), not E in degree zero.
- For two disjoint copies of A^(n−1), the trace fibre retains one top-dimensional class; irreducibility cannot be omitted from top-isomorphism use.

### 5.8 One-parameter exponential cohomology

For the standing smooth affine hypersurface and smooth leading boundary, RΓ_c(G_m×A^n,L_ψ(hf(a)))≅RΓ_(c,red)(X,E)[−2](−1). This is a complex isomorphism compatible with trace, not just an equality of exponential sums. (BS20, §3, Lemma 3.7, p.917; proof pp.917–918; BS20 line 1090.)

A proof route is as follows. Integrating h over 𝔸¹ gives RΓ_c(X,E)[−2](−1); the h=0 section gives E[−2n](−n). To identify the intervening top-degree map, choose a coordinate in which f is nonconstant. First prove the one-variable input: for g∈𝔽_q[a] of degree 1≤e<p, H_c^i(𝔾_m×𝔸¹,L_ψ(hg(a)))=0 for i>2 (BS20 line 1161). For h≠0, hg has degree e prime to p, so by FourierDeligneTransform §2.8 and proper base change Rpr_h!L_ψ(hg(a)) on 𝔾_m is a constructible sheaf F of rank e−1 placed in degree 1, and the total degree is at most 2 exactly when H_c²(𝔾_m,F)=0. Since e is invertible in E, the trace splits g_*E=E⊕G. The summand G is a Fourier sheaf in the sense of FourierDeligneTransform §5.3: it is a middle extension, and for every t its twist G⊗L_ψ(tx) has neither H⁰ nor H_c², at t=0 because the constant summand carries H⁰ and H_c² of g_*E, and at t≠0 by §2.8 applied to tg. By the projection formula along g, F is the restriction to 𝔾_m of the naive transform of g_*E, which equals the naive transform of G because the naive transform of the constant sheaf vanishes. The naive transform of a Fourier sheaf is a Fourier sheaf, so its H_c² on 𝔸¹ vanishes, and the localization sequence at 0 gives H_c²(𝔾_m,F)=0. On the generic open in the other n−1 variables this bounds fibre cohomology by degree 2; on the exceptional subset of dimension at most n−2 the ambient bound is 4. Both total bounds are 2n. The resulting surjection onto the top line is a nonzero trace multiple; identifying that scalar gives the trace-fibre isomorphism.

*Needs:* §5.7; FourierDeligneTransform §2.5, *Artin–Schreier sheaves*, §2.8, *Artin–Schreier sheaves on the line*, and §5.3, *Fourier sheaves*; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- The h-parameter is nonzero.
- The affine h-integral contributes shift −2 and twist −1.
- For g=a the a-integral is acyclic at every h≠0, so the total complex is zero.
- For g=0 the constant complex has nonzero H_c⁴=E(−2), so nonconstancy is essential; for g=a^p−a and h=1 the a-fibre has H_c²=E(−1), so e<p is essential to the degree-one fibre argument.

### 5.9 Linear-modulus constant complex

S̄₁ is the constant complex on B₁≅A¹ with value RΓ_(c,red)(X,E)[−2](−1). Translation of the unique denominator root makes the identification independent of that root. (BS20, §3, Lemma 3.8, p.918; BS20 line 1155.)

A proof route is as follows. For h₂=T−a, evaluation of the remainder identifies the phase with h f(g(a)). Translate a and apply §5.8 with its trace compatibility.

*Needs:* §5.3; §5.8.

**Checks.**

- For the monic denominators T and T−1, translation gives the same phase h f(a); a root-dependent extra character would change this value.
- For the cubic Fermat hypersurface in 𝔸³, the common fibre is its rank-eight middle group in degree 4 with outer twist −1; a phase function alone would not retain that degree.
- At denominator degree one the numerator is a nonzero constant; adjoining the zero numerator would add the constant-sheaf contribution from all of 𝔸ⁿ.

### 5.10 Configuration-space descent for all moduli

For each m≥0, RΓ_c(B_m,S̄_m)≅(RΓ_c(PConf_m(A¹),E)⊗RΓ_(c,red)(X,E)^⊗m)^(S_m)[−2m](−m). Here PConf₀ is a point, and the ordered-root torsor lies over squarefree monic polynomials. Invariants are exact because E has characteristic zero, even when ℓ divides m!. (BS20, §3, Lemma 3.9, p.918; proof p.919; BS20 line 1155.)

A proof route is as follows. Use §5.6 to restrict to squarefree denominators. Pull back along the supplied finite étale root-ordering S_m-torsor and apply CRT repeatedly. Descend the derived complex using the full symmetric action, including tensor permutations.

*Needs:* §5.6; §5.9; §5.5; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; InverseGaloisAndArithmeticFundamentalGroups IG.5.1, *Ordered and unordered configurations*; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- m=0 gives E.
- m=1 has no nontrivial symmetric action.
- ℓ∣m! does not invalidate invariants over Q_ℓ.

### 5.11 Major-arc stratum complex

For 0≤m≤d, RΓ_c(A_m∖A_(m−1),S)≅(RΓ_c(PConf_m,E)⊗RΓ_(c,red)(X,E)^⊗m)^(S_m)[−2m−2n(d−m)](−m−n(d−m)). (BS20, §3, Corollary 3.10, p.919; BS20 line 1195.)

A proof route is as follows. Excision and §5.1 replace the exact stratum by U_m. Compose §5.4 with §5.10 without discarding the affine quotient contribution.

*Needs:* §5.1; §5.4; §5.10.

**Checks.**

- At m=0 the value is E[−2nd](−nd).
- The result is not asserted for m>d.

### 5.12 Reduced cohomology concentrated in the middle

For n≥2, k≥3, p>k, ℓ≠p, smooth X and smooth leading boundary, RΓ_(c,red)(X,E) has cohomology only in degree n−1, equal to V=H_c^(n−1)(X,E). The trace is an isomorphism in degree 2(n−1). (BS20, §3, Lemma 3.11, p.919; proof pp.919–920; BS20 line 1195.)

A proof route is as follows. Apply affine Artin vanishing below n−1. Use the closure/boundary localization sequence, weak Lefschetz and duality above the middle degree. Remove precisely the top trace summand using geometric irreducibility.

*Needs:* §5.7; §3.3; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§4.1, 4.3, 4.6; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- Projective hyperplane classes belong to X̄, not to affine X.
- The reduced complex removes top cohomology rather than degree zero.
- For a smooth affine plane cubic with smooth leading boundary, n=2 gives H_c⁰=0 and an isomorphism H_c²→E(−1); only H_c¹ survives in the trace fibre.

### 5.13 Middle compact cohomology and parity-twisted tensors

Write V=H_c^(n−1)(X,E). Define W_m=(V^⊗m⊗sgn^(n−1))^(S_m), with the S_m-action coming from place permutations and the Koszul sign of degree n−1. W₀=E. In stratum formulas take invariants only after tensoring with the configuration cohomology; replacing that diagonal action by W_m alone loses information. (BS20, §1, Theorem 1.1, p.894; §3, Corollary 3.12 and its proof, p.920; BS20 line 38.)

- V is the actual H_c^(n−1)(X,E).
- Form W_m=(V^⊗m⊗sgn^(n−1))^(S_m).
- The tensor unit and the trivial S₀-action give W₀=E.
- The transposition sign agrees with symmetry on complexes concentrated in degree n−1.

A proof route is as follows. Use the coefficient category’s tensor permutation and sign representation. Identify the action after replacing the reduced complex by V placed in degree n−1.

*Needs:* §5.12; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- m=0 yields E, not the zero vector space.
- m=1 yields V.
- Over characteristic-zero coefficients, m=2 gives exterior-square invariants for n even and symmetric-square invariants for n odd; omitting sgn reverses this distinction.

### 5.14 Explicit cohomology of each major-arc stratum

For 0≤m≤d and every integer a, H_c^a(A_m∖A_(m−1),S)≅(H_c^(a+m(n−1)−2nd)(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m)(−m−n(d−m)). (BS20, §3, Corollary 3.12, p.920; BS20 line 1234.)

A proof route is as follows. Insert the middle-degree concentration into §5.11. Move the m factors of degree n−1 past one another, retaining their Koszul sign. Compute cohomological degree and twist independently.

*Needs:* §5.11; §5.13.

**Checks.**

- m=0 is supported only in degree 2nd.
- A transposition acts with sign (−1)^(n−1) on the shifted tensor factors.

### Examples

At m=0 every tensor and torsor is the unit, and the stratum complex is E[−2nd](−nd). At m=d the quotient affine factor has rank 0. A transposition gives −1 for n=4 and +1 for n=5.

### Dependencies

§3.5; §3.4a; §4.5; §4.6; FourierDeligneTransform §§2.2–2.5, 2.8 and 5.3; §3.1; §3.4; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; §3.3; InverseGaloisAndArithmeticFundamentalGroups IG.5.1, *Ordered and unordered configurations*; EtaleDualityAndPerverseSheaves §§4.1, 4.3, 4.6.

## Layer 6: Universal pairs and monodromy parity

Throughout this layer keep the hypotheses of Layer 5; §§6.4–6.5 add n≥3, and §6.5 excludes (k,n)=(3,3),(3,4). No large-n, d≥k−1 or even-order hypothesis is used.

### 6.1 Universal smooth polynomial and boundary-point family

M_(n,k) is the open parameter scheme of pairs (f,x), where f has degree k, {f=0} is smooth, its leading hypersurface is smooth, and x∈A^n∖{0} lies on that leading cone. Construct the universal affine hypersurface, projective closure and boundary, together with maps h_n and h_(n−1) to the two smooth projective hypersurface parameter spaces. Keep x as a vector, including its scalar direction. (BS20, §4, p.922; BS20 line 1315.)

- Construct the incidence open M_(n,k) retaining the nonzero boundary vector.
- Its geometric fibres supply exactly the fixed f,x data used in the mapping construction.
- Construct h_n by homogenization and h_(n−1) by the leading form.
- The incidence, smoothness opens and universal families commute with base change.

A proof route is as follows. Use incidence equations f₀(x)=0 and the smoothness open conditions. Construct homogenization and leading-form maps universally and verify smoothness of the two projective families. Prove the parameter scheme is irreducible via the incidence bundle/open description.

*Needs:* §3.1; §3.3; SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9.

**Checks.**

- x=0 is excluded even though every homogeneous form vanishes there.
- Distinct nonzero scalar representatives remain distinct points of M; they are not quotiented to P^(n−1).
- For ΣY_j^k−1 and x=(1,ζ,0,…), both smoothness opens and the incidence equation hold.

### 6.2 Universal affine compact-cohomology support

For the universal affine hypersurface family over M_(n,k), the compact-support cohomology sheaves vanish outside degrees n−1 and 2(n−1), are lisse in those degrees, and the top sheaf is E(−(n−1)). This is the relative version with geometric stalks fixed by the preceding conventions. (BS20, §4, Lemma 4.2(1),(3), pp.922–923; proof p.923; BS20 line 1315.)

A proof route is as follows. Use the relative compactification and smooth proper base change on closure and boundary. Apply their localization sequence and the fibrewise middle-concentration theorem; identify the top trace relatively.

*Needs:* §6.1; §5.12; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§4.1, 4.3, 4.6; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- The relative top trace has negative Tate exponent.
- Fibrewise dimension constancy alone is not a proof of lissity.

### 6.3 Extension by boundary and projective primitives

Let 𝒱=R^(n−1)π!E for the universal affine family. Put Prim(Z)=H^(n−2)(Z,E) modulo the middle hyperplane class when n−2 is even, and Prim(X̄)=H^(n−1)(X̄,E) modulo that class when n−1 is even; in odd middle degree use the whole middle group. Over E these quotients identify with the corresponding primitive kernels using the nonzero hypersurface degree. There is a short exact sequence 0→h_(n−1)*Prim(Z)→𝒱→h_n*Prim(X̄)→0. The boundary term has no extra Tate twist. No canonical splitting of this extension is asserted. (BS20, §4, Lemma 4.2(2), p.923; proof p.923; BS20 line 1356.)

A proof route is as follows. Apply the localization sequence RΓ_c(X)→RΓ(X̄)→RΓ(Z) for the universal smooth pair. Import the exact complete-intersection cohomology calculation: the cokernel in degree n−2 is the boundary primitive quotient and the kernel in degree n−1 is the projective primitive part. Identify the kernel with its primitive quotient over E by the nonzero hyperplane self-intersection; do not introduce a Gysin Tate twist into this restriction sequence. Use proper smooth base change to make both primitive terms lisse and export the exact sequence of monodromy representations. The sequence itself need not split canonically.

*Needs:* §6.2; EtaleDualityAndPerverseSheaves §§4.1, 4.3, 4.6–4.7; DeligneWeightsAndPurity §§8.1, 8.8 and InverseGaloisAndArithmeticFundamentalGroups IG.0.T4 for the finite-field normalization Check.

**Checks.**

- An eigenvalue statement for an extension does not make its action scalar.
- The even-dimensional hyperplane class must be quotiented out before invoking primitive monodromy.
- For the Fermat cubic pair X={Y₁³+Y₂³+Y₃³+Y₄³=1} over 𝔽₂₅, the boundary Z⊂ℙ³ is a split cubic surface: its 27 lines are defined over 𝔽₂₅ and their classes span H². Its degree-2 primitive group is E(−1)⁶, with eigenvalue 25. Independently, its 801 rational points give primitive trace 801−1−25²−25=150, forcing all six eigenvalues to be 25 by the weight bound. The cubic threefold closure has degree-3 primitive rank 10, so dim H_c³(X,E)=6+10=16=2⁴. An extra boundary twist (−1) would give E(−2)⁶ with eigenvalue 625 instead of 25. (EtaleDualityAndPerverseSheaves §4.7; BS20, Lemma 4.2(2), p.923, BS20 line 1369.)

### 6.4 Monodromy pullback along the universal pair maps

For n≥3 and the parameter maps used in the two-factor monodromy argument, prove surjectivity on geometric étale fundamental groups by smoothness, connected geometric generic fibre and normal connected target. Verify each fibre description, including the nonzero vector/scalar factors, rather than importing a topological surjection. (BS20, §4, proof of Lemma 4.3, p.924; BS20 line 1395.)

A proof route is as follows. Factor h_n through the dense open of H_(n,k) where the fixed hyperplane section is smooth; its fibres are the punctured affine cones over these connected sections. Factor h_(n−1) through the incidence of a leading form and a nonzero vector on its cone; the remaining lower coefficients form a nonempty smooth open of affine space. For n≥3 the projective sections are geometrically connected, and their punctured cones are 𝔾_m-bundles, hence geometrically connected. Apply IG.5.7 first to these smooth surjections and then to the dense opens in the normal connected spaces H_(n,k) and H_(n−1,k).

*Needs:* InverseGaloisAndArithmeticFundamentalGroups IG.5.7, *Finite-cover criteria for full monodromy image*; §6.1; EtaleCohomologyFoundations §§F.2–F.4.

**Checks.**

- At n=2 a smooth binary cubic has three boundary points, and the punctured cone over them is three disjoint copies of 𝔾_m: the fibres are disconnected and the criterion does not apply, which is why n≥3 is required.
- For n=3 and k=3 a smooth hyperplane section of the cubic surface is a smooth plane cubic, connected, and its punctured affine cone is a 𝔾_m-bundle over it, hence connected; the zero vector, where the cone is not a 𝔾_m-bundle, stays excluded.

### 6.5 A monodromy element with only eigenvalue minus one

For k≥3,n≥3 except (k,n)=(3,3),(3,4), the geometric monodromy of 𝒱 contains an element all of whose eigenvalues are −1. This need not act as −Id on the nonsplit primitive extension. Use the primitive-factor monodromy inputs with the small cubic cases retained as exceptions; prove the two-factor Goursat comparison here. Here geometric monodromy means the Zariski closure of the geometric fundamental-group image; membership in that closure is sufficient for equivariant maps. (BS20, §4, Lemma 4.3, p.923; proof pp.924–925; BS20 line 1356.)

A proof route is as follows. Apply LefschetzPencilsAndVanishingCycles §§5.1, 5.8 and 5.10 and gap:lpv-universal-monodromy to the two primitive factors. For the orthogonal factor in odd ambient dimension n₁, EtaleDualityAndPerverseSheaves §4.7's hypersurface formula with hypersurface dimension n₁−1 gives rank N₁=(k−1)((k−1)^n₁+1)/k≥6 outside the cubic-surface case (in fact ≥21 in the stated range). The symplectic and orthogonal Lie algebras then have no common nonzero simple quotient: the low-rank coincidences involve orthogonal dimensions 3, 4 or 5 (𝔰𝔬₃≅𝔰𝔭₂, 𝔰𝔬₄≅𝔰𝔭₂×𝔰𝔭₂, 𝔰𝔬₅≅𝔰𝔭₄), and 𝔰𝔬₆≅𝔰𝔩₄ is not symplectic. The algebraic-group Goursat argument gives the product, since the connected symplectic group has no nontrivial finite algebraic quotient. Lift simultaneous −Id to the extension; its sole eigenvalue is −1 even when the off-diagonal part is nonzero.

*Needs:* §6.3; §6.4; EtaleDualityAndPerverseSheaves §4.7, *Complete-intersection Betti numbers*; LefschetzPencilsAndVanishingCycles §§5.1, 5.8 and 5.10 (gap:lpv-universal-monodromy).

**Checks.**

- The two cubic exceptions are excluded even in a standalone proposition.
- A nontrivial Jordan extension may have only eigenvalue −1 without equalling −Id.
- The rank formula gives N₁=6 for (k,n₁)=(3,3), the excluded cubic surface, and N₁=21 for (4,3); the orthogonal ranks 3, 4 and 5 needed for low-rank coincidences do not occur.

### 6.6 Relative stratum formula and lissity

For 0≤m≤d the compact-support direct image of the m-th universal exact arc stratum is lisse in each degree and has the formula of §5.14 with V replaced by 𝒱. The configuration factor is constant and the entire expression is compatible with geometric stalks and monodromy. (BS20, §4, Lemma 4.4, p.925; proof pp.925–926; BS20 line 1437.)

A proof route is as follows. Repeat each major-arc isomorphism relatively, including trace and CRT symmetry. Use §6.2 and exact invariants to obtain lissity.

*Needs:* §6.2; §5.14; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- At m=d the quotient affine rank is n(d−m)=0 and contributes shift and twist (0,0); at m=d+1 the proposed rank is −n, so the affine-bundle input is unavailable.
- Monodromy acts diagonally on all m copies of 𝒱.

### Examples

For a Fermat parameter with ζᵏ=−1, x=(1,ζ,0,…) is nonzero and lies on the leading cone; replacing x by 2x changes the pair. The extension matrix with diagonal blocks −I and off-diagonal 1 has sole eigenvalue −1 and need not square to I.

### Dependencies

§3.1; §3.3; SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; §5.12; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§4.1, 4.3, 4.6–4.7; EtaleDualityAndPerverseSheaves §§3.2–3.8; EtaleCohomologyFoundations §§F.2–F.4; LefschetzPencilsAndVanishingCycles §§5.1, 5.8 and 5.10 (gap:lpv-universal-monodromy); DeligneWeightsAndPurity §§8.1, 8.8; InverseGaloisAndArithmeticFundamentalGroups IG.0.T4; §5.14.

## Layer 7: Finite arc filtration and the first page

§7.1 is stated for an arbitrary finite filtration. The remaining targets keep the hypotheses of Layer 5; §7.4 adds n≥3 and excludes (k,n)=(3,3),(3,4). No large-n, d≥k−1 or even-order hypothesis is used.

### 7.1 Finite localization filtration

For a finite closed filtration ∅=Y₋₁⊂Y₀⊂⋯⊂Y_d=Y of a separated finite-type scheme and a bounded constructible E-complex K, construct the compact-support spectral sequence E₁^(m,s)=H_c^(m+s)(Y_m∖Y_(m−1),K)⇒H_c^(m+s)(Y,K), with d_r of bidegree (r,1−r). Construct its finite filtration on the abutment, naturality, finite coefficient extension and relative sheaf form from the enhanced localization triangles, using the supplied spectral-object carrier. (STACKS, §12.24 (012K), Lemma 12.24.13 (0BK5), STACKS line 2964 and line 3202 (Homology).)

- Construct a Mathlib spectral object from the finite localization triangles.
- E₁^(m,s)=H_c^(m+s)(Y_m∖Y_(m−1),K).
- Identify E∞ with the associated graded of the finite filtration on H_c(Y,K).
- Compatible maps of filtered spaces/complexes give maps on every page and on the abutment.

A proof route is as follows. Apply localization triangles to complementary open steps and their relative pairs. Construct the functorial spectral object in the supplied carrier and identify its first page. Finite length gives boundedness and identifies E∞ with associated graded abutment; check indexing against Stacks 12.24.2 and 12.24.13.

*Needs:* EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; `CategoryTheory.Abelian.SpectralObject`; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- A filtration with a single nonempty stratum has E₁=E∞ and the expected cohomology.
- For two stages the d₁ is the localization boundary with bidegree (1,0).
- Negative cohomological s is allowed; convergence follows from finite column length, not from a false first-quadrant assertion.

### 7.2 Major-arc first page before the global shift

For d≥1, k≥3, n≥2, p>k, ℓ≠p, and smooth X and leading boundary, filter A_d by its exact rank strata. The unnormalized spectral sequence has E₁^(m,s)=(H_c^(s+mn−2nd)(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m)(−m−n(d−m)) for 0≤m≤d, zero otherwise, and abuts to H_c^(m+s)(A_d,S). (BS20, §2, Proposition 2.5(1)–(2), p.905; proof completed in §3, pp.921–922; BS20 line 540.)

A proof route is as follows. Apply §7.1 and substitute §5.14 with a=m+s. Check the m=0 column directly before normalizing.

*Needs:* §7.1; §5.14.

**Checks.**

- The unnormalized zero column is in total degree 2nd.
- There are d+1 columns, not infinitely many.

### 7.3 Relative major-arc spectral sequence over the universal pair

The universal phase on M_(n,k)×A^(dn)×A^L gives a relative S and a finite arc-filtration spectral sequence of constructible sheaves on M_(n,k), whose geometric stalks equal §7.2. Its E₁ terms are the lisse sheaves in §6.6. Every subsequent page is lisse and every differential commutes with geometric fundamental-group action. (BS20, §4, p.922 (relative S_(d,f), pr_(M,m)) and proof of Proposition 4.1, pp.926–927; BS20 line 1315.)

- Apply the relative compact-support filtration over M_(n,k).
- Every geometric stalk is the absolute arc spectral sequence with the same indices.
- Differentials are equivariant for the geometric fundamental group and its Zariski monodromy closure.
- All pages are kernels/cokernels in the category of lisse E-sheaves.

A proof route is as follows. Use relative compact-support base change for the universal phase. Apply the relative finite filtration. Kernels and cokernels of maps of lisse E-sheaves remain lisse. Identify stalk sequences before applying monodromy.

*Needs:* §6.1; §6.6; §7.1; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- At a Fermat parameter point the first page equals the fixed-fibre stratum formula.
- The m=0 term is the constant E[−2nd](−nd) before normalization.
- An equivariant odd-page differential between sole eigenvalues +1 and −1 must vanish; lissity alone would not imply this.

### 7.4 Odd-page differential vanishing

For d≥1, k≥3, n≥3, p>k, any ℓ≠p, smooth X and leading boundary, and outside (k,n)=(3,3),(3,4), every d_r with r odd is zero. No large-n bound, d≥k−1 bound or coefficient-prime order assumption is used. The element of §6.5 has sole generalized eigenvalue (−1)^m on column m, whereas an odd-r target has the opposite eigenvalue. (BS20, §4, Proposition 4.1, p.922, proof pp.926–927; §2, Proposition 2.5(3), p.905; BS20 line 1315.)

A proof route is as follows. Apply §6.5 to the relative spectral sequence, then take geometric stalks. The generalized eigenspaces with eigenvalues 1 and −1 admit no nonzero equivariant map over E. Propagate the column eigenvalue property to subquotients on subsequent pages.

*Needs:* §6.5; §7.3.

**Checks.**

- Odd-page vanishing alone says nothing about d₂.
- The main n-range excludes the small cubic cases automatically; the standalone theorem must still list them.
- For p=7 and ℓ=2, ord₇(2)=3 is odd, yet parity applies for n=5,k=3,d=1; only the Weyl sign-conjugation route needs even order.
- At n=2 a smooth binary cubic has three boundary points and its punctured cone is three disjoint copies of 𝔾_m; the connected-fibre monodromy route of §6.4 requires n≥3.

### 7.5 Shifted finite-field E1 formula

After shifting the abutment by [2dn] and twisting by (L), E₁^(m,s)=(H_c^(s+mn)(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m)(L−m−n(d−m)), 0≤m≤d, and zero otherwise. It abuts to H_c^(m+s+2dn)(A_d,S)(L), with differential degree (r,1−r) and odd differentials zero under §7.4. (BS20, §2, Theorem 2.7(1),(2), pp. 905–906; BS20 line 540.)

A proof route is as follows. Reindex §7.2 by s↦s+2dn and add the same Tate twist L to every term. Keep the major-arc abutment separate from the mapping-scheme comparison, which requires a minor-arc bound.

*Needs:* §7.2; §7.4.

**Checks.**

- At (m,s)=(0,0) the term is E(−D).
- At m=1 the configuration exponent is s+n.

### Examples

The normalized zero column is E(L−nd)=E(−D) in total degree 0. At n=40,k=3,d=2 this is E(−74). A possible d₂ changes the column by 2 and is not ruled out by parity alone.

### Dependencies

EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; `CategoryTheory.Abelian.SpectralObject`; EtaleDualityAndPerverseSheaves §§3.2–3.8; §5.14; §6.1; §6.6; §6.5.

## Layer 8: Geometric Weyl differencing

### 8.1 Finite-difference constancy locus with an explicit order

For G∈F_q[a₁,…,a_N] and an integer k≥1 with deg G≤k, define V_k(G)⊂(A^N)^(k−1) by requiring Δ_(y₁)⋯Δ_(y_(k−1))G(a) to be independent of a, where Δ_yG(a)=G(a)−G(a+y). Define dd_k(G)=dim V_k(G), with empty locus dimension −∞. Keep k as a parameter even for a specialization of smaller actual degree. (BS20, §5, Definition 5.1 and (5.1), p. 927; BS20 line 1518.)

- Define the closed locus by the a-dependent coefficients of the (k−1)-fold difference, which expands as Σ_I (−1)^|I| G(a+Σ_(i∈I)y_i) over subsets I of the increment indices; the empty subset has coefficient +1.
- The acceptance count `polarCount` of §8.8 composes Mathlib's forward difference `fwdDiff` over the k−1 increments. Since Δ_y=−`fwdDiff` y, the composite differs from Δ_(y₁)⋯Δ_(y_(k−1)) by the global sign (−1)^(k−1), which does not affect independence of a.
- Membership is equivalent to independence of the original a-variables.
- Return the extended dimension with empty value −∞.
- Base change retains k, even when the actual polynomial degree falls.

A proof route is as follows. Expand the iterated finite difference; its a-dependent coefficients are polynomial equations in the y-variables. For k=1 there are no y-variables, so V₁ is a point for constant G and empty for a nonconstant linear G.

*Needs:* §3.4; SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; `fwdDiff`.

**Checks.**

- For k=1, a constant has a point as locus; a nonconstant linear form has the empty locus.
- In characteristic ≠2, G=a₁² and k=2 gives y₁=0, hence dimension N−1.
- For the same G and k=3 all pairs of y lie in the locus, giving dimension 2N; k cannot be recomputed from actual degree.

### 8.2 Exponential compact-cohomological degree

For a polynomial G on A^N over F_q define cd_ψ(G)=sup{i∈Z : H_c^i(A^N_(F̄_q),L_ψ(G))≠0}, taking −∞ when the complex is acyclic. This extended degree is invariant under finite coefficient extension and polynomial coordinate isomorphism. All maxima and addition involving −∞ use extended-integer conventions. (BS20, §5, Definition 5.2, p. 928; used in the proof of Proposition 5.5, pp. 930–932; BS20 line 1562.)

- Take the maximum nonzero compact-support cohomology degree or −∞ if none.
- The degree is −∞ exactly when the exponential complex is acyclic.
- A finite field extension of E leaves the degree unchanged.
- Polynomial coordinate isomorphisms preserve the degree.

A proof route is as follows. Use finite cohomological amplitude of the supplied compact-support functor. Define support degree from its actual cohomology objects, not from exponential-sum size.

*Needs:* §3.4a; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; FourierDeligneTransform §§2.2–2.5; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- A constant polynomial on A^N has degree 2N geometrically.
- A nonzero linear polynomial has degree −∞, not zero.
- For G=H^p−H the Artin–Schreier sheaf is geometrically constant and has degree 2N, despite G possibly being nonconstant.

### 8.3 Sign reversal by coefficient conjugation

If ℓ has even multiplicative order modulo p, then cd_ψ(G)=cd_ψ(−G). More precisely, an automorphism of E=Q_ℓ(μ_p) sends every p-th root of unity to its inverse and yields semilinear isomorphisms on all relevant compact-support cohomology groups. (BS20, §5, Lemma 5.3 and proof, pp. 928–929; BS20 line 1562.)

A proof route is as follows. In the cyclic subgroup generated by ℓ mod p, the half-order power is −1. Use the corresponding unramified coefficient-field automorphism and compatibility of compact cohomology with coefficient change.

*Needs:* §8.2; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- This is semilinear over E, not a canonical E-linear self-map.
- Odd order does not give the required inversion.

### 8.4 Tensor-product and difference identities for cohomological degree

With N variables in each block, cd_ψ(G)+cd_ψ(−G)=cd_ψ(G(a)−G(b))=cd_ψ(G(a)−G(a+y)). The last equality is induced by the polynomial coordinate isomorphism (a,y)↦(a,a+y); the first uses derived Künneth and is valid also when one complex is acyclic. (BS20, §5, Lemma 5.4 and proof, p. 929; BS20 line 1596.)

A proof route is as follows. Tensor the two compact-support complexes using the additive-character product formula. Nonzero top cohomology tensors to a nonzero vector space over E; handle the acyclic case separately. Change variables by an actual affine automorphism.

*Needs:* §8.2; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- Do not replace extended addition with a natural-number maximum.
- Over 𝔽₅ with ℓ=2, N=1 and G=a²: cd_ψ(G)=cd_ψ(−G)=1 by FourierDeligneTransform §2.8, while G(a)−G(b)=a²−b² and G(a)−G(a+y)=−2ay−y² both have cohomological degree 2=1+1. A normalization factor or a shifted degree in either identity would break these values.

### 8.5 Closed points detect constructible supports over a finite field

For a bounded constructible E-complex K on a finite-type F_q-scheme, if the geometric stalk of H^i(K) vanishes at every F_(q^r)-point for every r≥1, then H^i(K)=0. A finite constructible stratification of its support reduces this to the existence of a closed point in every nonempty locally closed subset of a Jacobson space. (BS20, §5, proof of Proposition 5.8, p. 934, and the proof of Proposition 5.5, p. 931; BS20 line 1815.)

A proof route is as follows. Import the pinned Jacobson and locally closed closed-point lemmas. Request constructibility of the support from the constructible coefficient owner. A closed point has a finite residue-field extension of F_q; it need not be F_q-rational.

*Needs:* EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; `nonempty_inter_closedPoints`; `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- Vanishing only at F_q-points is insufficient.
- An empty constructible support has zero sheaf.
- No topological result alone establishes constructibility of a sheaf support.

### 8.6 Geometric Weyl-differencing bound

For deg G≤k, k≥2, p>k, and ℓ of even order modulo p, cd_ψ(G)≤[dd_k(G)+N(2^(k−1)−(k−1))]/2^(k−2). For k=1 use cd≤2N for a constant polynomial and cd=−∞ for a nonconstant linear polynomial; this agrees with the same formula interpreted rationally. An empty differencing locus yields the acyclic conclusion. (BS20, §5, Proposition 5.5, p. 930; proof pp. 930–932; BS20 line 1633.)

A proof route is as follows. Apply §8.3 and §8.4 to express twice the degree via G(a)−G(a+y). Stratify the y-space by the dimension of the fibre of V_k(G); keep the induction index k−1 when the actual degree drops. Use fibrewise induction, the support bound 2 dim W on a stratum W and closed-point detection. Optimize over the stratum dimension between 0 and N to obtain the displayed bound.

*Needs:* §8.1; §8.3; §8.4; §0.3; §8.5; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- For constant G, dd_k=N(k−1) and the right side is 2N.
- For G=a₁² and k=3 the third-degree parameter remains 3; replacing it by the actual degree invalidates induction.
- Every empty fibre contributes −∞ rather than zero.

### 8.7 Polar forms and their zero locus

For a homogeneous degree-k form f₀ over 𝔽_Q with p>k, write f₀(Y)=Σ c_(j₁,…,j_k)Y_(j₁)⋯Y_(j_k) with symmetric coefficients, and define Ψ_j(u¹,…,u^(k−1))=k!Σ c_(j₁,…,j_(k−1),j)u¹_(j₁)⋯u^(k−1)_(j_(k−1)). The symmetric coefficients are uniquely determined because the relevant multinomial coefficients are invertible. Then Ψ_j(u,…,u)=(k−1)!∂_j f₀(u). If the projective hypersurface of f₀ is smooth, the common zero locus V_Ψ in 𝔸^((k−1)n) has dimension at most (k−2)n and cumulative geometric degree at most (k−1)^n. For a degree-at-most-k G, the a-linear coefficients of its (k−1)-fold difference are (−1)^(k−1) times its corresponding polar forms; lower-degree terms contribute only an a-independent term. (BS20, §5 after Proposition 5.5, p. 932; §6, pp. 935–936 and proof of Proposition 6.2, p. 939; BS20 line 1732, line 1942 and line 2118; LR14v2, Theorem 1.1, LR14v2 line 124.)

- Construct the symmetric multilinear forms with the stated factorial normalization.
- Their diagonal restriction is (k−1)!∇f₀, and their coefficients commute with field extension.
- The closed zero locus and its polynomial-valued points use all n equations, including degree drops after specialization.
- For G_b from §3.4, its degree-k part is [T⁻¹]αf₀(A(T)), where A_j(T)=Σ_(i<d)a_(i,j)T^i; thus its differencing locus is determined by these polar equations.

A proof route is as follows. Polarize by coefficient comparison with k! invertible. The diagonal meets V_Ψ only at zero, by Euler's identity and smoothness of the leading projective hypersurface. Every component of this homogeneous cone contains zero, so §0.1 gives the dimension bound. The inequality form of Bézout bounds the cumulative degree of the n equations of degree k−1.

*Needs:* §8.1; §3.4; §§0.1–0.2; SchemeAndStackFoundations §5.12.

**Checks.**

- For k=3,f₀=Y³, Ψ(u,v)=6uv and Ψ(u,u)=6u²=2!∂f₀(u); V_Ψ is two lines, dimension 1 and degree 2, attaining (k−2)n=1 and (k−1)^n=2.
- For G=a²,k=2, the unary polar form is Ψ₁(y)=2y and Δ_yG=−2ay−y², so the a-linear term is −aΨ₁(y)=−2ay; at a=y=1 it is −2 and the full difference is −3. For G=a³,k=3 the a-linear term of Δ_uΔ_vG is +6auv. The signs are − and +, respectively.
- In characteristic 3 the cubic factorial vanishes and Ψ=0, so the scalar zero locus becomes all of 𝔸² of dimension 2; p>k excludes this wrong polarization model.

### 8.8 Polynomial interpretation and iterated shrinking of the polar count

For d≥1, α=Σ_(r=1)^L b_rT^(−r), L=kd, define N(α) to count polynomial tuples u¹,…,u^(k−1)∈𝔽_Q[T]^n with |u^i|<Q^d and ‖αΨ_j(u)‖<Q^(−d) for every j; the norm is the maximum of the coordinate absolute values, and ‖β‖ is the absolute value of its strictly negative Laurent part. Coefficient comparison gives #V_k(G_b)(𝔽_Q)=N(α). The acceptance definition `polarCount` counts the (k−1)-tuples of coefficient increments for which the composite of `fwdDiff` along them, applied to `residuePhase`, is constant in the base tuple. Here independence as a finite-field function equals the formal polar equation, since the remaining dependence is linear in that tuple. For every integer 0≤s≤d define N_s(α) by |u^i|<Q^(d−s) and ‖αΨ_j(u)‖<Q^(−d−(k−1)s). Then N(α)≤Q^((k−1)ns)N_s(α). (BS20, §6, Lemma 6.1, p. 936 and proof of Proposition 6.2, p. 938; BS20 line 1950, line 1967 and line 2076.)

- N(α) uses strict polynomial balls and exactly the d coefficients T⁻¹,…,T^(−d) of every polar expression.
- N₀(α)=N(α); the zero tuple is counted by every N_s.
- The count is identified with the actual coefficient scheme of §8.1 over every finite extension, retaining k when the degree drops.
- The shrinking inequality has explicit factor Q^((k−1)ns), without a hidden field-size constant.

A proof route is as follows. Expand the polynomial tuples into their d coefficients. The vanishing of the d indicated Laurent coefficients is precisely the polar system of G_b, since k! is invertible. Apply the shrinking inequality of §1.5 over 𝔽_Q successively in each of the k−1 blocks, using the symmetry of the polar coefficients in the varying block and equation index. At each step the initial polynomial radius exponent is at most the approximation exponent, so its extra max term is zero. For s=0 use equality.

*Needs:* §8.7; §8.1; §1.5; `LaurentSeries`; `RatFunc.inftyValuation`; `fwdDiff`.

**Checks.**

- For α=0, N=Q^(dn(k−1)) and N_s=Q^((d−s)n(k−1)), so shrinking is an equality.
- For k=3,n=1,d=2,α=T⁻⁴ in characteristic >3, write u=a+bT,v=c+eT. Only be=0 is imposed, giving N=Q²(2Q−1); at s=1 the constants satisfy ac=0, giving N₁=2Q−1 and N=Q²N₁.
- For d=0 the strict polynomial ball contains only zero; the counting interpretation above explicitly assumes d≥1, while the zero tuple still shows every denominator count in the generic shrinking inequality is positive.

### 8.9 Rank exclusion and the uniform polar-count bound

Assume d≥k−1≥2, d≤m≤kd/2, p>k, smooth leading projective hypersurface, and b∉A_mᴸ. Put h=⌊m/(k−1)⌋ and s=d−h, so 0≤h≤d. Every tuple counted by N_s(α) has Ψ_j(u)=0 for all j. Consequently N(α)≤(k−1)^n Q^(dn(k−1)−nh), uniformly in Q and in every finite constant-field extension. The acceptance headline `minor_arc_polar_count` states this on any finite field K, with the leading Jacobian tested over AlgebraicClosure K and rank H_m>m. Its form permits any fixed x, including zero and vectors outside f₀=0: x and the lower-degree part of f do not affect the polar equations. The displayed natural exponent is nonnegative because h≤d and k≥3. (BS20, §6, Proposition 6.2 and proof, pp. 936–939; BS20 line 1981, line 2083 and line 2114; BV15, Lemma 2.8, BV15 line 530.)

A proof route is as follows. If r=Ψ_j(u)≠0, its degree is at most (h−1)(k−1)≤m. Put a equal to the polynomial part of αr. The small-value condition and (k−1)s≥d(k−1)−m give |αr−a|<Q^(−kd+m). Dividing by r, then reducing a/r, gives the Padé approximation of §4.4 and forces b∈A_m, a contradiction. For h=0 the strict ball has only zero and needs no division. Apply §1.1 to V_Ψ at height h≥1, using its dimension and degree bounds from §8.7; at h=0 its point count is one. Multiply by the shrinking factor and simplify (k−1)ns+(k−2)nh=dn(k−1)−nh.

*Needs:* §8.7; §8.8; §4.4; §1.1; §0.1.

**Checks.**

- For k=3,d=2,m=2, h=1,s=1 and −d−(k−1)s=−4=−kd+m; the strict inequality still contradicts rank exclusion at this equality of exponents.
- In the scalar cubic test with α=T⁻⁴, H₂ has a 3×3 anti-diagonal minor of determinant −1, so b∉A₂. The count 2Q³−Q²≤2Q³ agrees with the exponent 3 and constant 2.
- At h=0 all u are zero, so N_s=1 and no nonzero r or denominator is introduced; at s=0 the shrinking factor is 1.
- For b=0 in the scalar cubic test over 𝔽₅, every increment tuple is admitted: 5⁴=625>2·5³=250. Its Hankel rank is 0, so the rank-exclusion hypothesis is essential.
- In the same test over 𝔽₃ with α=T⁻⁴, the cubic function is additive and every second difference is constant, giving 3⁴=81>2·3³=54; p>k excludes this failure.

### 8.10 Uniform finite-extension counts detect dimension

For a separated finite-type 𝔽_q-scheme V and real c, assume #V(𝔽_(q^r))≤Cq^(rc) for every integer r≥1 and one finite C≥0. Then dim V≤c, allowing the empty scheme dimension −∞, singularities and nilpotents. (BS20, §5, Lemma 5.6 and proof, p. 932; BS20 line 1745.)

A proof route is as follows. For nonempty V choose a top geometric component of dimension e, descend it over 𝔽_(q^a), and choose a geometrically integral affine open U of it avoiding the other components, with one fixed presentation over 𝔽_(q^a). The uniform Lang–Weil estimate applied to this presentation over every 𝔽_(q^(ar)) gives #U(𝔽_(q^(ar)))≥q^(are)−C′q^(ar(e−1/2)), while #U(𝔽_(q^(ar)))≤#V(𝔽_(q^(ar))). If e>c, division by q^(arc) contradicts the fixed C as r→∞. For e=0, a geometric point descends over a finite extension and its multiples already force c≥0. Passing to the reduced scheme leaves counts and dimension unchanged.

*Needs:* SchemeAndStackFoundations §§0.7–0.9; SieveMethodsAndPrimePatterns §5.4, *Uniform algebraic point counts*.

**Checks.**

- For V=𝔸^e, #V(𝔽_(q^r))=q^(re), and c=e,C=1 attains equality.
- For V=Spec 𝔽_(q²), the count is 0 at odd r and 2 at even r. The subsequence r=2j rules out every c<0, though the initial 𝔽_q-count alone is zero.
- For V=Spec 𝔽_q[ε]/(ε²), the count is 1 for every r and dimension is 0; for the empty scheme the count is 0 and dimension is −∞.

### Examples

For N=1,p=5 and G=a², Δ_yG=−2ay−y²; V₂={0}, dd₂=0 and the Weyl bound is cd≤1. If k=3 is retained, every pair is admitted, dd₃=2 and the weaker bound is cd≤2. A constant has cd=2.

### Dependencies

§3.4; SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; FourierDeligneTransform §§2.2–2.5; EtaleDualityAndPerverseSheaves §§3.2–3.8; `nonempty_inter_closedPoints`; `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace`; §0.3; §1.1; §1.5; §3.4a; §4.4; SchemeAndStackFoundations §5.12; SieveMethodsAndPrimePatterns §5.4; `fwdDiff`; `LaurentSeries`; `RatFunc.inftyValuation`.

## Layer 9: Minor arcs with a controlled remainder

### 9.1 Differencing-dimension bound outside a rank arc

Let d≥k−1≥2, d≤m≤kd/2, p>k, and let f₀ define a smooth projective hypersurface. For b∉A_mᴸ the phase polynomial G_b in dn coefficient variables satisfies dd_k(G_b)≤dn(k−1)−n⌊m/(k−1)⌋. The point bound of §8.9 holds over every finite extension with one constant; §8.10 detects dimension. (BS20, §5, Proposition 5.7, p. 933; §6, Lemma 6.1 and Proposition 6.2, pp. 936–939; BS20 line 1745, line 1950 and line 1981.)

A proof route is as follows. Identify the differencing equations with the homogeneous polar equations by §8.7, translate to polynomial counts by §8.8, apply §8.9 over every finite extension and then §8.10. Lower-degree terms of the full phase do not change this locus.

*Needs:* §8.1; §3.4; §§8.7–8.10.

**Checks.**

- For the scalar cubic polar test at d=2,m=2, the count 2Q³−Q²≤2Q³ yields dimension at most 3, equal to dn(k−1)−n⌊m/(k−1)⌋ for n=1.
- For b=0, V_k is the full space of dimension dn(k−1); this frequency lies in A_m and fails the exclusion hypothesis.
- Constant-field extension leaves the exponents and the bound (k−1)^n independent of the extension degree.

### 9.2 Stalk cohomology supported on a major arc

Under d≥k−1≥2, p>k, smooth f₀ and even order of ℓ mod p, for m≥d the sheaf H^a(S) on A^L∖A_m is zero whenever a>n(2d−floor(m/(k−1))/2^(k−2)). For m≥ceil(L/2) the open set is empty. (BS20, §5, Proposition 5.8 and proof, pp. 933–934; BS20 line 1753.)

A proof route is as follows. For d≤m<L/2 combine §9.1, §8.6 and the geometric-stalk formula. Apply the argument over every finite extension and use closed-point detection. Treat the saturated full-arc case separately.

*Needs:* §9.1; §8.6; §3.5; §4.3; §8.5.

**Checks.**

- For the scalar cubic test k=3, n=1, d=m=2 the cutoff is 1·(4−⌊2/2⌋/2)=3.5, so vanishing starts in degree 4; the inequality is strict in the cohomological degree.
- The last odd-L stratum lies below L/2 and is covered by the estimate.

### 9.3 Correct finite stratification of the minor arcs

For L=kd and d≥k−1≥2, A^L∖A_d is the disjoint union of A_(m+1)∖A_m over d≤m≤ceil(L/2)−1. The ceiling is required at odd L. (BS20, §5, proof of Proposition 2.6 (end of §5), p. 934; with ceiling in place of the printed floor; BS20 line 1815.)

A proof route is as follows. Telescope the nested closed filtration up to its first guaranteed full stage. Test the top missing stratum at L=9 rather than assuming floor(L/2) is full.

*Needs:* §4.2; §4.3.

**Checks.**

- For L=9 the cover includes m=4.
- For L=12 it ends at m=5.

### 9.4 Conservative minor-arc vanishing with rounding retained

Write t=floor(d/(k−1)), δ=n/2^k−k+1>0. Under the main finite-field hypotheses, H_c^a(A^L∖A_d,S)=0 for a>2dn+4(k−1)−4tδ. This is the bound that the stratification argument supports, with its remainder term retained. (BS20, §2, Proposition 2.6, p. 905; proof at the end of §5, p. 934; conservative form of the printed statement; BS20 line 540.)

A proof route is as follows. On A_(m+1)∖A_m, dimension at most 2(m+1) and the stalk cutoff give B(m)=2dn−n⌊m/(k−1)⌋/2^(k−2)+4(m+1). Write m=(k−1)q+r, 0≤r≤k−2, to obtain B(m)=2dn−4qδ+4(r+1)≤2dn−4tδ+4(k−1). For the final full stage at odd L, its ambient dimension L is at most 2⌈L/2⌉, so the same bound applies there. Apply finite localization to the complete ceiling-indexed cover, including that final stratum.

*Needs:* §9.2; §4.7; §9.3; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- Keep the remainder term 4(r+1).
- For k=3,d=4,n=24, B(5)=192 while the printed sharper cutoff is 188.
- At equality with the conservative cutoff the proof gives no vanishing.
- At odd L=9 the last full-stage stratum has dimension at most 9≤2·5=10; its bound follows from ambient dimension even though the unsaturated Padé-chart bound was stated only up to L/2.

### 9.5 Sharp minor-arc bound as an explicit hypothesis

Define the proposition SharpMinorArcBound(d,f,x,E,ψ) to mean that, with the finite-field data and main hypotheses fixed, H_c^a(𝔸ᴸ∖A_d,S)=0 for every integer a>2dn+4−4tδ. It is used only as an explicit hypothesis of §10.3 and its sharp-range consequences; no theorem here asserts this proposition. The stratum estimates of §§9.2–9.4 do not establish it. (BS20, §2, Proposition 2.6, p. 905; printed proof p. 934; BS20 line 540 and line 1856.)

- The proposition quantifies all integer degrees above its strict cutoff for the actual complex S.
- A proof implies conservative vanishing because k≥3 gives 4≤4(k−1).
- Restricting its degree range preserves the vanishing assertion.

*Needs:* §3.5; the notation of §9.4.

**Checks.**

- For k=3,d=4,n=24 the proposed cutoff is 188; the conservative cutoff is 192, so a=190 is not reached by the conservative theorem.
- The equality degree a=188 is excluded from this proposition.
- Changing a stratum bound from 192 to 188 is an additional assumption, not an arithmetic simplification of 4(r+1).

### Examples

For k=3,d=4,n=24, δ=1 and t=2. At m=5 the remainder r=1 gives B(5)=192, the conservative cutoff 192 and the unsupported printed cutoff 188. For L=9 the last stratum has m=4.

### Dependencies

§8.1; §3.4; §§8.7–8.10; §8.6; §3.5; §4.3; §8.5; §4.2; §4.7; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§3.2–3.8.

## Layer 10: Comparison, spreading and irreducible mapping schemes

### 10.1 Spreading out the pair and cohomology

For a general field K of characteristic zero or >k, spread f and its fixed nonzero vector x to an integral finitely generated subring R⊂K, together with X, its projective closure and boundary, Mor_(d,x), the configuration spaces and the geometric maps between these objects defined over R. After localization preserve degree, x≠0 and both smoothness conditions, invert ℓ and choose a common connected lisse open for their finitely many constant-coefficient compact-cohomology sheaves and cohomology maps. In characteristic zero, for a prescribed ℓ choose a good closed finite-field fibre with p>k and even order of ℓ modulo p. In characteristic p>k retain p and any prescribed admissible ℓ; choosing a new ℓ is allowed only for a coefficient-independent geometric conclusion. Construct the Fourier spectral sequence of Layers 3–7 on this finite-field fibre. Transport the finite-field major-arc spectral sequence, its pages, differentials and its abstract abutment with its finite filtration, through chosen E-vector-space isomorphisms, and identify its E₁ terms with those formed from the geometric cohomology over K. Transport the compact-support cohomology of the modeled Mor_(d,x) in the same way. No identification of the abutment with mapping cohomology is made in this target. Spec K lies over the generic point of Spec R and need not be that point. (BS20, §2, proof of Theorem 1.1 after Theorem 2.7, pp.906–907; BS20 line 619 through line 641.)

- Choose an integral finitely generated model containing both f coefficients and x coordinates.
- Localize to preserve degree, x≠0 and the two smoothness hypotheses.
- Restrict to a common lisse open for the constant-coefficient cohomology of the modeled schemes and geometric maps.
- Choose a closed finite-field fibre satisfying the residue/coefficient prime conditions.
- Identify the finite-fibre and K-fibre geometric cohomology as vector spaces, compatibly with their geometric permutation actions; transfer the finite-fibre spectral sequence by conjugating its differentials and carrying its abutment filtration along these chosen isomorphisms.

A proof route is as follows. Include every coordinate of x in R and invert a chosen nonzero coordinate. Apply constructible compact-support finiteness, base change and generic lissity to the constant-coefficient cohomology of the modeled schemes and maps. There are finitely many groups by bounded cohomological dimension and finitely many configurations with m≤d. Use constant ℚ_ℓ coefficients first, then extend to E if E is chosen with the finite-field fibre. Chosen étale paths in the common connected open give the geometric cohomology comparisons and preserve the modeled permutation actions. In characteristic zero use §2.2 and constructibility of the generic image over Spec ℤ to obtain a suitable closed point; in positive characteristic retain p and admissible ℓ. The Fourier complex, localization triangles and their geometric differentials are constructed on that fibre. Abstract vector-space transport preserves the spectral-sequence identities, sign actions and finite filtration. This asserts neither an Artin–Schreier complex over a characteristic-zero generic fibre nor specialization of its Fourier maps. Frobenius equivariance belongs to the finite-field construction.

*Needs:* §2.1; §2.2; §3.1; §7.5 for the finite-fibre spectral sequence; EtaleCohomologyFoundations §§F.1–F.4.6 for constant-coefficient finiteness, base change, generic lissity and path transport; EtaleDualityAndPerverseSheaves §3.4; SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9.

**Checks.**

- If x has a coordinate transcendental over the coefficient ring of f, that ring alone is not a model of the pair.
- Invert a nonzero coordinate before choosing a closed point, so the boundary vector cannot specialize to zero.
- Holding ℓ fixed uses the good-residue-characteristic adapter; holding p fixed uses the coefficient-prime adapter.
- The model includes the actual vector, not just its projective line or the coefficients of f.
- For a statement with prescribed coefficients in positive characteristic, the coefficient prime is retained.
- Comparisons over general K are noncanonical vector-space comparisons; finite-field Frobenius equivariance is asserted only where constructed.
- For y⁵−y=a, the y-derivative in characteristic 5 is −1, whereas over ℂ it is 5y⁴−1 with four zeros. The finite-field Artin–Schreier cover is étale and its characteristic-zero polynomial model is ramified; abstract transport of cohomology does not extend its character sheaf.
- For K=ℂ,k=3,d=2,n=40, the transported sequence has D=74 and a zero-column top term of dimension one. These values use geometric cohomology comparisons alone, with no characteristic-zero Fourier complex; the comparison range i>−4 is §10.2's.

### 10.2 Conservative cohomology comparison range

Let d≥k−1≥2, n>2^k(k−1), X and its leading boundary be smooth, and D=d(n−k), t=floor(d/(k−1)), δ=n/2^k−k+1. In finite characteristic require p>k and ℓ of even order mod p. The normalized major-arc abutment in total degree i identifies with H_c^(i+2D)(Mor,E) for i>−4(tδ−(k−1)). Over finite fields the comparison is Frobenius-equivariant; over general K use spread and assert an E-vector-space spectral sequence without a canonical Galois comparison. (BS20, §2, Theorem 2.7(3) and proof, p. 906; §1, Theorem 1.1, p. 894; the range is the conservative form of the printed one, see §9.4; BS20 line 585.)

A proof route is as follows. For U=A^L∖A_d, the compact-support triangle is RΓ_c(U,S)→RΓ_c(A^L,S)→RΓ_c(A_d,S)→RΓ_c(U,S)[1]. At degree j use vanishing of H_c^j(U,S) and H_c^(j+1)(U,S); both follow from the strict minor cutoff j>2dn+4(k−1)−4tδ. Apply §3.6 and the [2dn](L) normalization, noting 2dn−2L=2D. This proves the finite-field comparison first. Then apply §10.1 to transport that proved comparison and the modeled mapping cohomology to the general-field fibre; do not descend the Artin–Schreier sheaf to Q_ℓ.

*Needs:* §§7.5, 9.4 and 3.6 for the finite-field comparison; §10.1 for the general-field transport.

**Checks.**

- The comparison range is strict.
- At k=3,d=2,n=40 it is i>−4.
- Tate twists are retained over finite fields; dimension statements alone do not recover Frobenius.

### 10.3 Original sharp comparison target, explicitly gated

Assume SharpMinorArcBound(d,f,x,E,ψ) from §9.5. Then the normalized major-arc comparison holds for i>−4(tδ−1); its adjacent-degree vanishing follows from that same strict cutoff. This is the range printed in Theorem 1.1, not a consequence of the conservative argument. (BS20, §1, Theorem 1.1, p. 894; §2, Theorem 2.7(3) and (2.3), p. 906; BS20 line 38.)

A proof route is as follows. Repeat §10.2 with the improved minor cutoff. Use the proof of SharpMinorArcBound as an explicit hypothesis for both adjacent degrees.

*Needs:* §10.2; §9.5.

**Checks.**

- For k=3 and tδ=3 the proposed sharp interval is i>−8, while the conservative interval is i>−4; i=−6 requires the extra sharp proposition.
- At tδ=1 the proposed strict interval is i>0, so degree zero is still excluded; changing > to ≥ would give an unsupported endpoint.
- For k=3,d=4,n=24, the separate stratum cutoff at m=5 is 192 rather than the desired 188; the new estimate has to recover these four degrees.

### 10.4 E1 support region

The normalized first page can be nonzero only at (m,s)=(0,0), or at 1≤m≤d with −m(n−1)+1≤s≤−m(n−2). The configuration input is H_c^a(PConf_m)=0 outside m+1≤a≤2m for m≥1. (BS20, §2, Lemma 2.8, p. 907; also (1.3), p. 895; BS20 line 637.)

A proof route is as follows. Import the configuration cohomology range of AlgebraicTopologyPartII §2.1, including the translation factor A¹. Insert a=s+mn into §7.5.

*Needs:* §7.5; AlgebraicTopologyPartII §2.1, *Split arrangement purity*.

**Checks.**

- For m=1 the only configuration degree is 2.
- PConf_m has dimension m; its translation quotient has dimension m−1.

### 10.5 Compact cohomology vanishing bands

Within the conservative comparison range, H_c^(i+2D)(Mor,E) can be nonzero only if i=0 or for some 1≤m≤d, 1−m(n−2)≤i≤−m(n−3). In particular it vanishes for i>0 in that range. (BS20, §1, Corollary 1.2, p. 895; conservative form of the printed range; BS20 line 94.)

A proof route is as follows. Add m to the two bounds in §10.4. A finite spectral sequence cannot create support outside the union of its first-page total degrees. Use §10.2 only inside its stated range.

*Needs:* §10.2; §10.4.

**Checks.**

- The support statement does not automatically extend to the printed sharper range.
- For n=40 the total degree −1 lies in none of the bands.

### 10.6 Automatic E1 degeneration near the top

For m+s>1−2(n−2)(n−3), the major-arc spectral sequence has E∞^(m,s)=E₁^(m,s). To identify this with mapping cohomology also require the conservative comparison range, or an independently proved sharper comparison. (BS20, §1, paragraph after Conjecture 1.3, p. 898; BS20 line 209.)

A proof route is as follows. Use §10.4 and the bidegree to show a potentially nonzero r≥2 differential forces a sufficiently large column, m≥r(n−3)+2. Use §7.4 for r=1 and the support inequalities for incoming as well as outgoing differentials.

*Needs:* §10.4; §7.4.

**Checks.**

- For n=40,k=3,d=2, automatic degeneration applies for total degree above 1−2·38·37=−2811, while the mapping comparison of §10.2 is known only above −4; degree −5 satisfies the first bound but not the second.
- Odd-page vanishing alone does not prove the whole spectral sequence degenerates.

### 10.7 Componentwise criterion for irreducible mapping schemes

Let M be a separated finite-type scheme over an algebraically closed field and D≥0. Assume every irreducible component of M has dimension at least D, H_c^j(M,E)=0 for j>2D, and dim_E H_c^(2D)(M,E)=1. Then M is irreducible of dimension D. (BS20, §2, proof of Corollary 2.9, pp.907–908; BS20 line 637.)

A proof route is as follows. By EtaleDualityAndPerverseSheaves §0.4, carried to E by EtaleCohomologyFoundations §F.4.5, H_c^j(M,E) vanishes above 2a for a=dim M, and H_c^(2a)(M,E) has dimension the number of a-dimensional irreducible components, singular and nonreduced M included. If a>D, its nonzero top group contradicts vanishing above 2D. The componentwise lower bound and the rank-one group force nonemptiness and a=D, and then all components have dimension D. The same top group counts them, so there is exactly one.

*Needs:* EtaleDualityAndPerverseSheaves §0.4, *Top-degree compactly supported cohomology of a variety*; EtaleCohomologyFoundations §F.4.5; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.6; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- A disjoint line and point has top cohomology rank one but is reducible.
- The lower bound on every component is necessary.

### 10.8 Conservative irreducibility and expected dimension

Under the main geometric hypotheses in characteristic zero or >k, if tδ>k−1 then Mor_(d,x) is geometrically irreducible of dimension D=d(n−k). This strict inequality puts i=0 inside the conservative comparison range. On an algebraically closed K the acceptance statement `mapping_geometrically_irreducible` says that the radical of `mappingIdeal` is prime and its quotient coordinate ring has Krull dimension d(n−k), with explicit affine and leading-form Jacobian conditions. Apply this to the polynomial and vector after base change to an algebraic closure for the arbitrary-field conclusion. (BS20, §1, Corollary 1.4, p. 898; §2, Corollary 2.9 and proof, pp. 907–908; conservative sufficient hypothesis; BS20 line 209.)

A proof route is as follows. At i=0 only the zero column contributes, giving rank-one H_c^(2D); §10.5 gives vanishing above it. Apply §10.7 and §3.2 after base change to an algebraic closure.

*Needs:* §10.2; §10.5; §3.2; §10.7.

**Checks.**

- The equality tδ=k−1 does not reach i=0.
- Even with the printed sharp range, equality tδ=1 would not reach i=0.

### 10.9 Small-degree excess-dimension example

For k≥3,n≥3 and 1≤d<k−1 over an algebraically closed field of characteristic zero or >k, let f=Y₁^(k−1)Y₂+Y₂ᵏ+Σ_(j≥3)Y_jᵏ+1 and x=(1,0,…,0). The affine hypersurface and its leading boundary are smooth. The locus g₂=0 has a nonempty family of dimension at least D−d+k−1>D. (BS20, §1, Remark 1.5, pp. 898–899; BS20 line 209.)

A proof route is as follows. Check the gradient equations for affine and leading smoothness. With g₂=0, g₁ has d free coefficients and the remaining coordinates have degree ≤d−1 and satisfy Σg_j^k+1=0. Choose constant solutions to establish nonemptiness before using variables-minus-equations.

*Needs:* §3.1; §0.1.

**Checks.**

- At n=2 the displayed restricted equation is 1=0, so this construction needs n≥3.
- Zero leading coordinates do not define a zero projective point.

### 10.10 Unproved E1-degeneration proposition

Define the unproved proposition DegenerationConjecture(d,f,x,E): for every i>−4(tδ−1), H_c^(i+2D)(Mor,E) is isomorphic as an E-vector space to the direct sum over m≥0 of (H_c^(i+m(n−1))(PConf_m,E)⊗V^⊗m⊗sgn^(n−1))^(S_m). The main geometric, degree and characteristic hypotheses are part of the proposition’s parameters. No canonical splitting, Frobenius-compatible splitting or proof is supplied. Distinguish this from E₁ degeneration of the actual spectral sequence, whose abutment comparison is only known in the conservative range. (BS20, §1, Conjecture 1.3, p. 897; BS20 line 164.)

- Form a proposition quantifying vector-space isomorphisms in the stated strict range.
- A proof restricts to any subset of its integer-degree range.
- A proof implies the finite sum of first-page dimensions equals the mapping cohomology dimension.
- Configuration support permits truncation to m≤d in the conjectured interval.

A proof route is as follows. Package Conjecture 1.3 as a proposition with quantified integer degree and strict range. Use configuration support to show terms with m>d vanish in that range. State restriction and consequence APIs as implications from an explicit proof of the proposition.

*Needs:* §3.1; §5.13; §10.4.

**Checks.**

- The equality i=−4(tδ−1), when integral, is excluded.
- A spectral sequence with d₁=d₃=0 and d₂≠0 does not satisfy E₁ degeneration.
- At i=0 the proposed sum is the one-dimensional m=0 term; positive m have no total degree zero when n>3.

### Examples

For n=40,k=3,d=2, D=74, t=1, δ=3 and tδ=3>2. Comparison holds for i>−4, includes i=0 and i=−1, and gives the dimension-74 irreducibility conclusion and H_c^147=0.

### Dependencies

§2.1; §2.2; §3.1; EtaleCohomologyFoundations §§F.2–F.4; EtaleCohomologyFoundations §§F.1–F.4.6; EtaleDualityAndPerverseSheaves §3.4; EtaleDualityAndPerverseSheaves §§3.2–3.8; SchemeAndStackFoundations §§0.2–0.3, 0.7–0.9; §7.5; §9.4; §3.6; §9.5; AlgebraicTopologyPartII §2.1, *Split arrangement purity*; §7.4; EtaleCohomologyFoundations §§F.4.5 and F.5–F.6; EtaleDualityAndPerverseSheaves §§0.4 and 0.6; §3.2; §0.1; §5.13.

## Layer 11: Infinity germs and the compact-open obstruction

### 11.1 Continuous mapping space with prescribed infinity germ

Over C fix the same leading vector x, P=[x:0] and d≥1. A prescribed-germ map is a continuous F:P¹(C)→X̄ with F(∞)=P, F(C)⊂X, and a local homogeneous lift [x₁+O(|z|):⋯:x_n+O(|z|):z^d+O(|z|^(d+1))] for z=1/T near zero. The radius and constants in this condition are allowed to depend on F. This defines the set of maps; a topology and a rule for compact families are additional data. (BS20, §7, definition of Hom_(d,P)(C,X) and (7.1), p. 940; BS20 line 2142.)

- Specify the pointwise local homogeneous asymptotic condition with the fixed leading vector.
- In normalized product coordinates u=O(|z|) and v/z^d=1+O(|z|).
- Every polynomial tuple with prescribed leading vector satisfies this germ.
- A normalized smooth boundary-chart change preserves the condition, with its leading normal coefficient transported explicitly.

A proof route is as follows. Use local product coordinates for the smooth boundary to express an invariant germ condition with its leading normal coefficient fixed by x. Separate membership of an individual map from uniform bounds for a family of maps.

*Needs:* §3.3.

**Checks.**

- For g=(T^d,ζT^d,1,0,…,0), the local homogeneous lift is [1:ζ:z^d:0:…:0:z^d], with the last coordinate the homogenizing coordinate.
- A normal coordinate z^(d+1) is not the prescribed order-d germ.
- The normal coordinate 2z^d is excluded after fixing the normalized leading coefficient one.

### 11.2 Compact-open prescribed-germ mapping space

Hco is the set of prescribed-germ maps equipped with the subspace compact-open topology from C(P¹(C),X̄(C)). Germ radii and constants are pointwise data and are not locally uniform by definition. A parameter family is continuous exactly when its map to the ambient compact-open space is continuous and every member satisfies the germ condition. (BS20, §7, equation (7.1) and Lemma 7.2, pp.940–941; topology specified here as a test interpretation; BS20 line 2142.)

- Use the subtype topology on the prescribed-germ subset of C(P¹,X̄).
- The inclusion into the supplied compact-open continuous-map space is continuous.
- A family is continuous if its ambient adjoint is continuous and each member satisfies the germ condition.
- Evaluation is the restriction of supplied compact-open evaluation.

A proof route is as follows. Construct the subtype of the supplied continuous-map carrier with its induced topology. Use compact-open adjunction for continuous families; add no uniform normalized-germ condition to this topology.

*Needs:* §11.1; `ContinuousMap.curry`.

**Checks.**

- The explicit Fermat polynomial extension is an element.
- The escaping phase family defines a continuous circle map into Hco.
- A compact family need not satisfy |v/z^d−1|<1/2 on a common tail; the escaping loop violates it at a moving parameter.

### 11.3 Analytic polynomial-map inclusion into the germ mapping space

The map ι:Mor_(d,x)(C)^an→Hco sends g to [g(T):1] at finite T and to P at infinity. It is continuous: in z-coordinates it is [x+O(z):z^d], and the coefficient bounds are locally uniform on the coefficient space. This proves compact-open continuity only; continuity for a proposed stronger global germ topology must be proved for that topology. (BS20, §7, sentence after (7.1), p. 940; BS20 line 2142.)

- Extend [g(T):1] at infinity by P.
- Evaluation at finite T agrees with polynomial evaluation in the affine chart.
- The map from the analytic coefficient scheme to Hco is continuous.
- The normalized normal coordinate has leading term z^d fixed by the leading vector.

A proof route is as follows. Extend the evaluation map across infinity using the fixed leading vector. Prove joint continuity on Mor^an×P¹, with a coefficient neighbourhood giving a common bound near infinity. Curry into the supplied compact-open mapping space and factor through the prescribed-germ subtype.

*Needs:* §3.1; §11.2; `ContinuousMap.curry`.

**Checks.**

- The Fermat tuple is sent to the chosen basepoint g of Hco.
- A bounded neighbourhood of coefficients provides one asymptotic bound for all its members.
- If the leading vector is allowed to approach zero, the asserted joint extension at infinity need not hold.

### 11.4 Shrinking phase

For 0≤s≤1 and 0<r≤1/4 put h(s,r)=max(0,min(1,(s−r)/r)) and σ(s,r)=exp(2πi h(s,r)). Since h(0,r)=0 and h(1,r)=1, σ descends from the interval to its circle quotient. The radius parameter is strictly positive. (Original to this roadmap; BS20 supplies the setting refined here: §7, Lemma 7.2, pp.940–941; BS20 line 2142.)

- Define h=max(0,min(1,(s−r)/r)) for positive r.
- Define σ=exp(2πi h).
- σ(0,r)=σ(1,r)=1 for 0<r≤1/4.
- Descend the interval map to its based circle quotient.

A proof route is as follows. Define the clamped real function and compose with the usual complex exponential. Use equality of the two endpoint phases to descend to the standard based circle.

*Needs:* `ContinuousMap.curry`.

**Checks.**

- For s≤r, h=0 and σ=1.
- At s=3r/2, h=1/2 and σ=−1.
- For s≥2r, h=1 and σ=1; the lift endpoint remains one, preserving degree.

### 11.5 Pointwise eventual constancy does not imply uniform germ control

σ is jointly continuous for positive r. For each fixed s, σ(s,r)=1 for all sufficiently small positive r, while for each fixed r its circle map has degree +1. At s=3r/2 one has σ=−1. Thus eventual pointwise constancy as r→0 does not imply uniform constancy in s. (Original to this roadmap; BS20 supplies the setting refined here: §7, (7.1) and Lemma 7.2 with its proof, pp. 940–941; BS20 line 2142.)

A proof route is as follows. Check the clamped function on its three intervals and the endpoint values. Its real lift increases from zero to one, giving degree +1 under the pinned circle-cover convention. Use the moving parameter s=3r/2 to disprove uniformity.

*Needs:* §11.4; `AddCircle.windingNumber_eq_div`; `Circle.fundamentalGroupMulEquiv_expLoop`.

**Checks.**

- The circle degree is +1, not zero.
- The midpoint phase is −1 even at arbitrarily small radii.

### 11.6 Fermat hypersurface and polynomial reference map

For k≥3,n≥3,d≥1 choose ζ∈C with ζ^k=−1 and let X={Σx_j^k=1}. Its closure {Σx_j^k=x₀^k} and boundary are smooth. With x=(1,ζ,0,…,0), P=[x:0], the tuple g=(T^d,ζT^d,1,0,…,0) belongs to Mor_(d,x), and its extension gives a specified basepoint of Hco. (Original to this roadmap; BS20 supplies the setting refined here: §7, equation (7.1), p.940; BS20 line 2142.)

- Build (T^d,ζT^d,1,0,…).
- The k-th power sum equals one and the leading vector is (1,ζ,0,…).
- Verify smoothness of both closure and leading boundary.
- Its extension is a based prescribed-germ map at P.

A proof route is as follows. The first two k-th powers cancel and the third contributes one. Check smoothness by the simultaneous vanishing of all relevant partial derivatives. At infinity divide homogeneous coordinates by T^d.

*Needs:* §3.1; §11.2.

**Checks.**

- The third coordinate equals one; dropping it would give power sum zero.
- Dividing by T^d gives limit [1:ζ:0:…:0] with last homogeneous coordinate zero.
- The construction needs n≥3 to supply its constant third coordinate.

### 11.7 Continuous loop with an escaping phase transition

For finite T set r(T)=1/(4(1+|T|)), a_s(T)=T^d σ(s,r(T)), and F_s(T)=(a_s(T),ζa_s(T),1,0,…,0). Put F_s(∞)=P. This is a based loop in Hco at the Fermat reference g. For each fixed s it agrees with g on a sufficiently far tail, but the agreement is not uniform over the whole circle of parameters. (Original to this roadmap; BS20 supplies the setting refined here: §7, Lemma 7.2, pp.940–941; BS20 line 2142.)

- Use a_s(T)=T^d σ(s,1/(4(1+|T|))) in the Fermat tuple.
- At s=0 and s=1 the map is the reference g.
- The family extends jointly continuously over parameter circle times P¹.
- For each fixed parameter it equals g on some tail, with no uniform tail over the parameter circle.

A proof route is as follows. The Fermat equation holds identically by cancellation. Use |a_s(T)|=|T|^d for uniform projective convergence to P, hence joint continuity at infinity. For each fixed s the phase is eventually one; use compact-open currying to obtain the based loop.

*Needs:* §11.6; §11.4; §11.5; `ContinuousMap.curry`.

**Checks.**

- For every s,T, |a_s(T)|=|T|^d.
- For large R and s=3r(R)/2, a_s(R)=−R^d, so normalized normals are not uniformly near one.
- For any fixed s>0 choose r<s/2; then the phase is one. At s=0 it is always one.

### 11.8 A compact parameter family has a common projective chart at infinity

If K is compact and K→Hco is continuous, there is a common sufficiently small neighbourhood of infinity on which every map lies in a fixed projective chart containing P. For the Fermat reference use x₁≠0 and v=x₀/x₁. At finite T in that tail, v never vanishes. This does not provide a uniform estimate for v/z^d−1. (Original to this roadmap; BS20 supplies the setting refined here: §7, (7.1) and Lemma 7.2 with its proof, pp. 940–941; BS20 line 2142.)

A proof route is as follows. Use compact-open evaluation and the tube lemma at K×{∞}. Finite points map into X, where x₀≠0, so the chart coordinate v is nonzero.

*Needs:* §11.2.

**Checks.**

- Apply this to K=S¹ and K=I×S¹.
- A common projective chart is weaker than a common normalized germ bound.

### 11.9 Winding of a mapping-space loop at infinity

For a based loop γ in the Fermat Hco and sufficiently large positive real R, evaluate v(γ_s(R))/v(g(R))∈C× and take its positively oriented circle winding number. This defines endWind:π₁(Hco,g)→Z once radius- and homotopy-independence are proved. Use the supplied oriented circle-cover computation, rather than a new fundamental-group object. (Original to this roadmap; BS20 supplies the setting refined here: §7, Lemma 7.2, pp.940–941; BS20 line 2142.)

- Evaluate the nonzero normalized normal coordinate at a sufficiently large positive R and take oriented winding.
- Changing R within a common tail leaves the integer unchanged.
- Descend to a group homomorphism π₁(Hco,g)→Z.
- The escaping-loop class maps to −1 with the chosen positive circle orientation.

A proof route is as follows. Use §11.8 for the loop to choose R and normalize at its basepoint. Retract C× radially to the unit circle and apply the supplied integer deck-translation invariant.

*Needs:* §11.8; `Circle.fundamentalGroupMulEquiv`; `Circle.fundamentalGroupMulEquiv_expLoop`; AlgebraicTopology Stage 8.

**Checks.**

- The constant loop has winding zero.
- The escaping loop has value −1 because v=1/a_s.
- Concatenating the escaping loop with itself has value −2; concatenating it with its reverse has value zero.

### 11.10 End winding is independent of radius and based homotopy

The integer defining endWind is independent of sufficiently large R, invariant under based homotopy, and additive under concatenation. It therefore gives a group homomorphism on π₁. (Original to this roadmap; BS20 supplies the setting refined here: §7, (7.1) and Lemma 7.2 with its proof, pp. 940–941; BS20 line 2142.)

A proof route is as follows. Vary R within the common tail to get a homotopy of nonzero evaluation loops. For a based homotopy use §11.8 with compact parameter I×S¹. Concatenation commutes with evaluation and winding is additive.

*Needs:* §11.9; §11.8; AlgebraicTopology Stage 8.

**Checks.**

- A radius chosen separately for each member of a homotopy is insufficient.
- The constant loop has winding zero.

### 11.11 Infinite-order loop in the compact-open germ space

For the escaping loop, v(F_s(R))/v(g(R))=σ(s,r(R))^(−1), so endWind([F])=−1. Hence endWind is onto Z, [F] has infinite order, and this loop has no filling disc in Hco. (Original to this roadmap; BS20 supplies the setting refined here: §7, (7.1) and Lemma 7.2 with its proof, pp. 940–941; BS20 line 2142.)

A proof route is as follows. Compute v=1/a_s in the chart, then use §11.5 and §11.10. A filling disc would make its winding zero, contradicting the explicit value.

*Needs:* §11.7; §11.5; §11.10.

**Checks.**

- The reciprocal normal coordinate reverses the sign.
- Surjectivity follows from the value −1 and the group law.

### 11.12 Compact-open interpretation of Lemma7.2 fails in the main range

For the cubic Fermat hypersurface in C^40 and d=2, the nonempty compact-open space Hco has π₁ surjecting onto Z. X is homotopy equivalent to a bouquet of 2⁴⁰ spheres S³⁹ (AlgebraicTopologyPartII §§4.1–4.2, with μ=(k−1)ⁿ), and π₂X=π₃X=0 (AlgebraicTopologyPartII §5.4, since n=40≥5), so Ω²X is connected and simply connected. Thus Hco is not homotopy equivalent, or weakly equivalent, to Ω²X. This disproves the compact-open interpretation of Lemma 7.2. (Original to this roadmap; BS20 §7, Lemma 7.2, pp. 940–941 supplies the setting refined here, and Lemma 7.6, p. 944 supplies the bouquet route; BS20 line 2142.)

A proof route is as follows. Use §11.6 and §11.11 for the left side. Import the Fermat double-loop simple connectivity of AlgebraicTopologyPartII §5.4. Compare fundamental groups, without assuming the disputed germ straightening.

*Needs:* §11.11; AlgebraicTopology Stage 8; AlgebraicTopologyPartII §§4.1–4.2 and §5.4, *Fermat double-loop simple connectivity*.

**Checks.**

- Nonemptiness is witnessed by a polynomial map.
- The obstruction concerns the specified compact-open topology.

### Examples

For r=1/4 the phase at s=0,3/8,1 is respectively 1,−1,1 and its lifted endpoint difference is 1. The reciprocal normal ratio has winding −1. The Fermat tuple has power sum T^(dk)−T^(dk)+1=1.

### Dependencies

§3.3; `ContinuousMap.curry`; §3.1; `AddCircle.windingNumber_eq_div`; `Circle.fundamentalGroupMulEquiv`; `Circle.fundamentalGroupMulEquiv_expLoop`; AlgebraicTopology Stage 8; AlgebraicTopologyPartII §§4.1–4.2 and §5.4, *Fermat double-loop simple connectivity*.

## Layer 12: Controlled collars and the stronger topology

### 12.1 A chart with uniform control of the normalized germ

Fix a product chart (u,v) at P with boundary v=0 and normal coordinate normalized to have prescribed leading coefficient one. Fix ε>0, a convex tangential ball around zero, and a normal disc large enough for |v|<(3/2)ε^d. A controlled tail on 0<|z|≤ε has u=O(|z|), w=v/z^d=1+O(|z|), u in that ball, and |w−1|<1/2. Topologize it by the weighted sup distances sup||Δu||/|z| and sup|Δw|/|z|, combined with compact-open topology off the tail. The fixed radius is part of the object. (Original to this roadmap; BS20 supplies the setting refined here: §7, Lemma 7.2 proof, pp.940–941; BS20 line 2142.)

- Record the fixed chart, radius, convex balls and weighted-bounded tail functions.
- The bound |w−1|<1/2 implies v=z^d w≠0 for z≠0.
- Use the two weighted supremum distances and compact-open control outside.
- Restriction to a smaller positive radius preserves the bounds and is continuous.

A proof route is as follows. Use the local product chart for a smooth divisor and fix the leading normal normalization. The O conditions make the weighted distances finite; the bound on w keeps v nonzero on the punctured disc. Glue this fixed-radius chart model to the outside continuous map with matching boundary.

*Needs:* §11.1; §11.2.

**Checks.**

- u=0,w=1 has weighted distance zero from the standard model.
- w=1.1 satisfies the half-disc bound but fails w−1=O(|z|), so is excluded.
- w=−1 is nonzero but violates |w−1|<1/2 and cannot be straightened by the stated convex formula.

### 12.2 Cutoff straightening within a fixed controlled collar

Choose a radial cutoff χ equal to one on an inner disc and zero near |z|=ε. For a controlled collar define u_t=(1−tχ)u and v_t=z^d[1+(1−tχ)(w−1)]. This is a continuous homotopy in the fixed-radius controlled model, leaves the outer collar fixed, and at t=1 is standard on the inner disc. The bracket stays within distance 1/2 of one, so no punctured-disc zero appears. A map standard on the inner disc can still move on its transition annulus; this homotopy fixes the outer collar and the fully standard model. (Original to this roadmap; BS20 supplies the setting refined here: §7, Lemma 7.2 proof, pp.940–941; BS20 line 2142.)

- Apply the cutoff convex formulas for u_t and w_t.
- Where χ=0, the map is unchanged for every t.
- At t=1 where χ=1 the normalized tail is (0,1).
- The homotopy is jointly continuous in t and in the weighted topology.

A proof route is as follows. Use convexity of the tangential ball and of the normal disc about one. Estimate the two weighted differences uniformly in t and in the collar data. For comparison with a chosen reference collar replace zero and one by its normalized pair and use the same convex bound.

*Needs:* §12.1.

**Checks.**

- At t=0 the original collar is recovered.
- If |w−1|<1/2 then |1+(1−tχ)(w−1)|>1/2 for all t,χ∈[0,1].
- A collar already standard on the inner disc may have nonstandard transition annulus, which this homotopy changes; it is not fixed pointwise as an SDR would require.

### 12.3 Fixed-collar extension-space comparison contract

Let β:S¹→X be a based loop and choose an extension β̃:D²→X. Its compact-open extension space Ext(β) is homotopy equivalent to Ω²X after choosing that reference extension. The based restriction Map_*(D²,X)→Map_*(S¹,X) is a Hurewicz fibration by the CW boundary cofibration; its total space contracts by a disc contraction fixing the boundary basepoint. This is the disc-pair application of DGFloer Layer 2 items 2–3. (Original to this roadmap; BS20 supplies the setting refined here: §7, Lemma 7.2, pp.940–941; BS20 line 2142.)

A proof route is as follows. Pull the supplied unbased restriction C(D²,X)→C(S¹,X) back along Map_*(S¹,X)↪C(S¹,X); its total space is exactly Map_*(D²,X), since the basepoint belongs to S¹. This gives the based Hurewicz fibration for the compact disc pair. The total based disc mapping space contracts by contraction of D² to its boundary basepoint. The chosen extension identifies the fibre over β with the homotopy fibre over the constant loop, giving Ω²X.

*Needs:* DGFloer Layer 2 items 2–3; AlgebraicTopology Stage 4; AlgebraicTopology Stage 8; `ContinuousMap.curry`.

**Checks.**

- A chosen extension is a hypothesis, not a consequence of any boundary loop.
- For contractible X and constant β the extension space is contractible.
- The basepoint remains fixed during the disc contraction.
- Over the constant boundary loop the fibre is Map_*(D²/S¹,X)=Map_*(S²,X)≅Ω²X; for X=S² it has components indexed by ℤ, as does Ω²S².

### 12.4 Stronger-germ topology and comparison data

Define StrongGermData(d,f,x,g) to consist of a topology H on the prescribed-germ set, a chosen reference map g, a continuous polynomial inclusion ι:Mor^an→H, continuous changes of normalized boundary coordinates, and continuous maps between H and the fixed-collar extension model Ext(β_g) with specified homotopies making them homotopy inverses. Require that every continuous map from a compact Hausdorff parameter space into H has a common positive collar radius and bounded weighted normalized-germ seminorms in one of the charts of §12.1. These are explicit data and properties, not a construction or an existence theorem. (Original to this roadmap; BS20 §7, (7.1) and Lemma 7.2, pp. 940–941 supplies the setting refined here; BS20 line 2142.)

- Forget the topology and comparison maps to recover the prescribed-germ set and reference map.
- The included polynomial map is continuous for this specified topology.
- The supplied comparison maps have source H and target Ext(β_g), and the reverse source and target; their two homotopies are part of the data.
- The compact-family condition includes a common radius and weighted bounds, rather than pointwise radii alone.

*Needs:* §11.1; §12.1; §12.3.

**Checks.**

- For the escaping loop at s=3r(R)/2 the normalized normal ratio is −1, with deviation 2; it cannot be a compact continuous family in such H.
- The normalized collar u=az,w=1+bz has weighted seminorms ‖a‖ and |b|; bounded a,b give uniform bounds on a common small radius.
- Hco with the escaping loop fails the uniform-family condition, so it is not an instance of these data.

### 12.5 Continuous mapping space versus the double loop space

Given StrongGermData(d,f,x,g) as in §12.4, the nonempty prescribed-germ space is homotopy equivalent to Ω²X after choosing a reference map. For Hco the asserted equivalence is false. (Original conditional formulation here; BS20 §7, Lemma 7.2 and its proof, pp. 940–941 supplies the setting refined here; BS20 line 2142.)

A proof route is as follows. Apply the comparison maps and homotopies supplied as StrongGermData to the fixed-collar extension space. Use §12.3 with the reference extension; retain its dependence on a chosen basepoint/reference.

*Needs:* §12.4; §12.3.

**Checks.**

- For X a point and its unique reference map, the fixed-collar extension space and Ω²X are both points.
- For the cubic Fermat example in 40 variables, Hco has a fundamental-group quotient ℤ while Ω²X has trivial fundamental group; the topology in this conditional comparison cannot be Hco.
- A chosen reference extension identifies the fibre over its boundary loop with the constant-boundary homotopy fibre; a non-null boundary loop in S¹ has no such extension.

### Examples

For u=az and w=1+bz, weighted distances from the standard collar are ||a|| and |b|. Under straightening their factors become (1−tχ); a bracket within distance 1/2 of 1 never vanishes. A constant offset w=1.1 has infinite weighted distance.

### Dependencies

§11.1; §11.2; DGFloer Layer 2 items 2–3; AlgebraicTopology Stage 4; AlgebraicTopology Stage 8; `ContinuousMap.curry`; §11.3; §11.12.

## Layer 13: Trace comparison and conditional degeneration

### 13.1 Unproved algebraic-to-continuous trace comparison

For K=C and the main degree/geometric hypotheses, fix a topology H on the prescribed-germ set, a continuous ι:Mor^an→H (supplied by StrongGermData when that hypothesis is used), and a geometrically justified degree-2D trace τ; §10.8 supplies τ when tδ>k−1, while outside that range its justification is an additional hypothesis. Define the pairing H_c^(2D−j)(Mor,Q)⊗H^j(H,Q)→Q by pullback along ι, compact-support cup product and τ. TraceComparisonConjecture(H,ι,τ) is the unproved proposition that this pairing is perfect for every 0≤j<4(tδ−1). Its content depends on H. The compact-open instance is false in the Fermat example. (BS20, §7, Conjecture 7.1, p. 940; BS20 line 2142.)

- Pull back H^j(H,Q), cup with H_c^(2D−j)(Mor,Q), and apply the specified geometric trace.
- Define perfection for all integer j with 0≤j<4(tδ−1) as a proposition.
- A proof gives dim H_c^(2D−j)(Mor,Q)=dim H^j(H,Q).
- A homeomorphism respecting the algebraic inclusion transports the proposition; a set bijection alone does not.

A proof route is as follows. Use the analytic comparison preserving compact supports, cup product and trace. Form the pairing from the specified maps and state perfection as a proposition, never as an instance or axiom. Keep the original range separate from the conservative range used to establish the trace geometrically.

*Needs:* §3.1; §11.1; §11.3; §12.4 for StrongGermData; §10.8 for the conservative trace; EtaleDualityAndPerverseSheaves §§3.2–3.8.

**Checks.**

- When the supported irreducibility theorem applies and H is connected, j=0 uses the one-dimensional trace class.
- j=4(tδ−1), when integral, is excluded.
- For the cubic forty-variable example, the algebraic factor at j=1 is zero but H¹(Hco,Q) is nonzero, so perfection fails.

### 13.2 Conjecture 7.1 fails for the compact-open germ space in the Fermat example

For X={Σ_(j=1)^40 x_j³=1}, d=2 and the compact-open Hco, D=74 and tδ=3. End winding implies H¹(Hco,Q)≠0, whereas §10.5 in the conservative range i>−4 gives H_c^147(Mor,Q)=0. Since j=1 lies in 0≤j<8, the pairing demanded by the compact-open reading of Conjecture 7.1 is not perfect. (Original to this roadmap; BS20 §7, Conjecture 7.1 and (7.1), p. 940 supplies the setting refined here; BS20 line 2142.)

A proof route is as follows. Use the natural degree-one Hurewicz theorem on the reference component and its universal-coefficient isomorphism H¹(−,ℚ)=Hom(H₁,ℚ) to carry the winding quotient to a nonzero class. In the conservative range i=−1>−4 none of the total-degree support bands contains −1, so H_c^147(Mor,ℚ)=0. Pairing the zero space with a nonzero space cannot be perfect.

*Needs:* §11.11; §10.5; AlgebraicTopology Stage 8; EtaleDualityAndPerverseSheaves §§3.2–3.8; AlgebraicTopology Stage 6; DGFloer Layer 1 item 1.

**Checks.**

- This example has tδ>k−1, so its trace and irreducibility are within the supported range.
- The failure occurs strictly inside the conjectural interval.

### 13.3 Conditional implication from the comparison conjecture

Assume K=C, d≥k−1≥2, n>2^k(k−1), StrongGermData(d,f,x,g), a specified geometric trace τ, and TraceComparisonConjecture(H,ι,τ) for its topology H and inclusion ι. For −4(tδ−1)<i≤0 the pairing gives dim H_c^(i+2D)(Mor,Q)=dim H^(−i)(Ω²X,Q). Import the stable configuration diagonal and the double-loop Betti series of AlgebraicTopologyPartII §§3.5 and 5.1 (n≥4), with the bouquet type of X from its §§4.1–4.2, to identify this with the sum of the normalized E₁ dimensions. In every degree where the actual abutment comparison also holds, this forces all differentials entering or leaving that total degree to vanish. For i>0 use §10.5 in the conservative range; extending to the printed sharp range additionally assumes SharpMinorArcBound from §9.5 and uses §10.3. No unconditional E₁ degeneration follows. (BS20, §7, the argument before Theorem 7.7 and Theorem 7.7, pp. 945–946; BS20 line 2381.)

A proof route is as follows. Use perfection of the explicitly assumed pairing for the negative-degree dimension identity. Import the configuration/rational-homotopy identity with j=−i<4(tδ−1)≤d(n−3), and compare singular and étale cohomology. Where comparison is known, equality between the sum of E₁ dimensions and the abutment dimension forbids any loss on subsequent pages. Treat i>0 by the support theorem, and state the sharp-range requirement separately.

*Needs:* §13.1; §12.4; §12.5; §10.5; §10.2; §10.3 only for the sharp-range extension; EtaleDualityAndPerverseSheaves §§3.2–3.8; AlgebraicTopologyPartII §3.5, *Stable configuration diagonal*; AlgebraicTopologyPartII §4.1, *Tame complex polynomial*; AlgebraicTopologyPartII §4.2, *Tame fibre bouquet theorem*; AlgebraicTopologyPartII §5.1, *Double-loop Betti series*.

**Checks.**

- Use compact-support cohomology on the algebraic side.
- Use n≥4 for the connected full double-loop space; the cubic n=3 case has multiple components.
- The desired E₁ dimension equality is a conclusion of the AlgebraicTopologyPartII formulas, not an assumption obtained from the conjectured degeneration.

### Examples

At n=40,k=3,d=2 the trace-perfection interval is 0≤j<8. At j=1 its algebraic factor is H_c^147=0 and its compact-open factor contains a nonzero rational winding class. With a stronger topology and a perfect pairing, this contradiction is avoided only after the different topology and its comparison are actually proved.

### Dependencies

§3.1; §11.1; §11.3; §12.4 for StrongGermData; §10.8 for the conservative trace; EtaleDualityAndPerverseSheaves §§3.2–3.8; §11.11; §10.5; AlgebraicTopology Stage 8; AlgebraicTopology Stage 6; DGFloer Layer 1 item 1; §12.5; §10.2; §10.3; §10.10; AlgebraicTopologyPartII §3.5, *Stable configuration diagonal*; AlgebraicTopologyPartII §4.1, *Tame complex polynomial*; AlgebraicTopologyPartII §4.2, *Tame fibre bouquet theorem*; AlgebraicTopologyPartII §5.1, *Double-loop Betti series*.

## Downstream consumers

Polynomial-map geometry consumes the conservative irreducibility and dimension theorem, and may use the independent finite-grid and strict-box bounds without importing the cohomological layers. Configuration and mapping-space comparisons consume the signed first page with its actual finite abutment range. A trace-perfection application must specify the stronger germ topology and continuous inclusion and must retain the sharp-range hypothesis wherever the conservative comparison does not reach. The prime adapters apply to every admissible characteristic or prescribed coefficient prime and finite excluded set.

## References

- BS20 — Tim Browning and Will Sawin, *A geometric version of the circle method*, Annals of Mathematics 191 (2020), 893–948, DOI 10.4007/annals.2020.191.3.4. Published open text; §§1–7. The conservative remainder bound and the explicit germ obstructions are deductions and additional examples, not assertions attributed verbatim to its printed theorems.
- BV15 — Tim Browning and Pankaj Vishe, *Rational points on cubic hypersurfaces over 𝔽_q(t)*, Geometric and Functional Analysis 25 (2015), 671–732; arXiv:1502.00772v2, §2.5, Lemma 2.8. Page numbers here refer to the preprint.
- LR14v2 — Gilles Lachaud and Robert Rolland, *On the number of points of algebraic sets over finite fields*, arXiv:1405.3027v2, §§1–2.1, Theorems 1.1 and 2.1 and Proposition 2.3, pp. 2–5. The arbitrary-grid theorem adapts the slicing argument and uses only the hyperplane-degree inequality.
- STACKS — The Stacks Project Authors, *The Stacks Project*, More on Morphisms, Lemma 37.30.3 (05F9); Homology, §12.24 (012K), especially Lemma 12.24.13 (0BK5). Stable tags identify the statements independently of chapter pagination.
