# Roadmap: modular curves, Part II — uniformization, integral boundary and Hecke cohomology

**Summary.** Build the comparison between arithmetic modular curves and analytic congruence quotients, their integral compactifications and bad fibres, and the geometric Hecke action on Jacobians and cohomology. The end results are compact uniformization with cusp fields, connected fixed-pairing and paired twisted curves, the weight-two differential and Hecke dictionaries, integral coarse curves with their precise base-change range, Ihara injectivity and saturation, Shimura's dimension theorem for modular abelian varieties, and finite-level Taylor–Wiles freeness. The definitive roadmap is this README; [Suggested.lean](Suggested.lean) states headline acceptance theorems on the pinned carriers. The public interfaces specified below are mathematical targets of the roadmap.

## Scope and ownership

ModularCurves is the first prerequisite. Its layers are imported, never rebuilt:

- **Layers 0–2**: relative effective Cartier divisors, finite locally free group schemes and Cartier duality, finite quotients and torsors, finite étale descent and spreading out (0A–0E); projective Weierstrass models, pole sheaves and the scheme-theoretic group law (1A–1D); isogenies, quotients, the Cartier–Nishi duality and the Weil pairing, endomorphism degree and rigidity (2B, 2E, 2F).
- **Layers 3–9**: the four level structures and their naive variants (3C, 3D, 3N); Tate normal form and `Y₁(N)` for `N≥4`, full ordered bases and fixed pairing, the twisted curve `Y(ρ)` (5A–5C); the integral level problems (Layer 6); local algebra, p-divisible groups, Serre–Tate theory and the three characteristic-p calculations (7B, 7E–7H); generator schemes, cyclicity and `Γ₀(N)` (8B–8D); the Katz–Mazur quotient problems, coarse moduli schemes, the coarse j-line and `Y₀(N)` (9A–9E).
- **Layer 10**: the compactified coarse curves `X_H` over `ℤ[1/N]` for prime `N≥5` and diamond subgroups H of `(ℤ/N)ˣ/{±1}`, their cusps and widths, the characteristic-2/3 stabilizer table and the Shimura covering. On exactly that range this roadmap proves agreement with its own construction ([§5.18](#s5-18)) and builds nothing again. Full, fixed-pairing, composite, small and level-dividing compactifications are new work here.

The new generalized elliptic, full-level, fixed-pairing, composite-level and level-dividing boundary problems retain their stack inertia. They extend ordinary elliptic level structures to polygons; they do not define ordinary full or cyclic level again. The local models are model-dependent: the stack, its framed formal chart, its coarse space and a regular or semistable model are separate carriers.

The generalized elliptic curve itself is imported, not defined here. AdicSpacesPartIII Layer R2.11 owns the carrier `GeneralisedEllipticCurve`, the standard polygons `EllipticModuli.nGon`, the n-gon Tate family `GeneralisedEllipticCurve.tateCurve` and, on its representable range (full level `N≥3` over `ℤ[1/N]`, cyclic level with an invertible factor `d≥5`), the fine compactified moduli scheme `GeneralisedEllipticCurve.moduli` with its universal curve and level. This roadmap proves Deligne–Rapoport's description of that carrier and builds on it the integral theory over `ℤ` at every level: stacks with inertia, contractions, Drinfeld structures in bad characteristic and the refined `Γ₀` problem. Likewise the lattice uniformization of complex abelian varieties and the genus-one family over the upper half-plane are AbelianSchemesAndArithmeticModuli A5.1 (`AbelianLattice`) and A5.8 (`SiegelFamily`), and the analytic cusp data and cusp ramification of Fuchsian quotients are FuchsianOrbifolds Layers 3–4; Layers 1, 3, 4 and 6 specialize them.

The field-curve Jacobian, its dimension and principal polarization, and the pointed Abel–Jacobi construction are supplied by JacobianChallenge Layers D, E and F. JacobianChallengePartII §§1.2–1.4 supplies the positive-genus relative Jacobian with its canonical principal polarization and arbitrary-base-change comparisons; §13.1 specializes these to modular curves and retains the trivial principally polarized genus-zero case and modular functoriality. StableReduction supplies nodes, dual graphs, blowups, semistable existence and stabilization (Layers 1–4, 7–9); the new outputs here identify their components, inertia actions, thicknesses and modular operators. ModularForms supplies analytic quotient surfaces (10A), compact surface cohomology (10B), automorphy sections (10C), Hecke algebra and slash operators (2), Petersson theory and oldforms (3), primitive forms and multiplicity one (4–5, 8G), and integral full modular symbols and period quotients (8). The geometric symbol comparison here uses the cuspidal kernel and the coefficient dual, rather than identifying the full symbol module with compact cohomology.

The generic Bruhat–Tits tree and local `SL₂` amalgam are owned by ReductiveGroupsPartII §RG2.2.4; strong approximation is AdelicAlgebraicGroups §4.2, and surjectivity of `SL₂(ℤ)→SL₂(ℤ/N)` is Tau Ceti's `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`. The arithmetic principal-level fundamental-edge calculation here is the additional target. AlgebraicVectorBundles owns sheaf symmetric powers and pullback; DifferentialGeometry and AlgebraicTopology own general manifold and cohomological duality. None of their general constructions is rebuilt for modular curves.

The construction of eigenform Galois representations, higher-weight Deligne congruences, level lowering, Serre weights, patching, `R=T` and identification of a modular quotient with a specified elliptic curve belong to the downstream roadmaps named below. This roadmap supplies modular character maps and their finite lattice errors. The quaternionic character sequence of Ribet–Stein (3.2) requires a separately owned quaternionic/Cerednik–Drinfeld construction.

The shared arithmetic-cohomology interfaces have the following ownership. Each comparison below is a specialization on a neat fine `GL₂` level, followed by the stated finite-cover descent where needed; it does not consume higher-rank boundary theorems or conditional Galois inputs.

| Interface | Supplier | Modular specialization and retained work |
| --- | --- | --- |
| Betti coefficients and supported complexes | [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces) ALS.1.1–ALS.1.8 | §§14.1–14.4 compare the chosen `GL₂/ℚ` component with `Γ \ ℍ`. Use the dual of the fibre homology representation for `R¹f_*` and `Sym^r` thereof. Match the row-frame convention with ALS.1.1’s whole-inverse endpoint transport. §14.4a supplies the boundary-compatible finite CW pair and uses ALS.F.3/ALS.1.4 only with finite coefficients; O-adic complexes are derived limits of those finite complexes, and K-complexes are their scalar extensions. The elliptic-family construction and finite étale comparison stay here. |
| Hecke and boundary/support maps | ALS.3.5–ALS.3.9 and ALS.4.1 | §§14.3–14.4 and 14.8 identify pullback/trace with the actual modular isogeny correspondence and the support map. In weight two this is unnormalized curve trace; higher weights retain §14.8’s coefficient transport. Cusp inertia and the weight-two Eisenstein calculation of §14.9 stay here. |
| Coefficient duality and adjoint ideals | ALS.5a.3–ALS.5a.5 | §14.11 uses §14.4a’s finite-pair and derived-limit construction to identify evaluation/trace with the elliptic coefficient cup pairing, including twists; inverse double cosets become reversed modular legs and transposed coefficient maps. The duality projector is at `m†`, with inverse diamonds at `r=0`. The Fricke pairing of §14.7 is a separate transport. |
| Finite-cover descent | ALS.6.1–ALS.6.3, using AlgebraicTopology Stage 5 | §§17.8–17.10 identify descent and augmentation for the actual `Δ_Q`-cover. The principal-level Ihara argument, conjugation minus complex, retained auxiliary level and selected-root Taylor–Wiles geometry stay here. |
| Finite Hecke images, local factors and operator summands | [IntegralHeckeAndGaloisDeterminants](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants) §§2.1–2.3 | §§14.10–14.11 and 17.8–17.10 apply the supplied finite-image and idempotent constructions over the complete DVR O. Commuting selected-root and minus projectors restrict these summands; no second general localization theory is specified here. |

These supplier layers use general arithmetic quotients, local coefficients and Hecke algebra; the specialization comparisons here use the modular family and cusp charts. They require none of this roadmap’s Ihara or Taylor–Wiles conclusions, and none of ALS.4.12–ALS.5b’s Galois existence hypotheses.

The outbound interface to AlgebraicModularFormsAndSerreWeights R15.5A.1 is §§14.1–14.4a: the geometric `Sym^r R¹f_*` system, the support map and its parabolic image, finite/adic comparison, characteristic-zero scalar extension, and level/isogeny/Hecke transport. §14.11 supplies its pairing on the stated coefficient domain. That downstream roadmap owns the higher-weight logarithmic de Rham comparison, Hodge/Eichler–Shimura decomposition, primitive newspace projector, rank-two multiplicity and Galois attachment. These are not consequences of the weight-two Shimura theorem here. With `r=k−2`, `V≃V^∨(−r)` and the curve trace give `M_m × M_(m†)→K(−r−1)`, hence `M_m^∨≃M_(m†)(r+1)`, with transported Hecke action. The Galois attachment uses the dual of its primitive cohomological multiplicity; replacing that dual by an adjoint block requires this twist. At `k=2` it agrees with the Jacobian dual realization of §14.13. No integral self-duality outside §14.11’s factorial and vanishing hypotheses is exported.

## Conventions

These conventions apply throughout. The letters Z, Q, C and H in formulas denote `ℤ`, `ℚ`, `ℂ` and the upper half-plane `ℍ`.

**Primes and levels.** N is a positive level; p is a residue characteristic or Hecke prime; `ℓ` is a coefficient prime, invertible wherever étale coefficients are used. An open level subgroup is an open `H ⊂ GL₂(Ẑ)`; for n with `Γ(n)=ker(GL₂(Ẑ)→GL₂(ℤ/n)) ⊂ H`, `H̄` is its image in `GL₂(ℤ/n)`, and `±H` is generated by H and `−1`. Level one is `H=GL₂(Ẑ)`.

**Frames and the row action.** A frame of `E[n]` is an ordered basis `(P,Q)`. A matrix `γ=[[a,b],[c,d]]` acts on the right by `(P,Q)γ=(aP+cQ, bP+dQ)`, as in ModularCurves. Then `Γ₁(N)={a≡1, c≡0}` fixes P, `Γ₀(N)={c≡0}` fixes the line through P, and `Γ₁^μ(N)={c≡0, d≡1}` records an embedding `μ_N→E[N]`. On the upper half-plane `ℍ` the same action is `τ·γ=(dτ+b)/(cτ+a)` with fibre map `z↦z/(a+cτ)`; in the usual left-action notation `τ↦(ατ+β)/(γτ+δ)` the corresponding label matrix is `[[δ,β],[γ,α]]`. A row action of determinant r sends a pairing value `ζ` to `ζ^r`, and the diamond action on `Γ₁` is `P↦aP`.

**Weil pairing.** The pairing is Tau Ceti's `e_N(S,T)=τ_S^*g_T/g_T` (Silverman III.8). On `ℂ/(ℤ+ℤτ)` with `τ∈ℍ`, `e_N(τ/N,1/N)=ζ_N=e^{2πi/N}` and `e_N(1/N,τ/N)=ζ_N⁻¹`. The open uniformization of a fixed-pairing curve is `Γ(N) \ ℍ → Y(N,ζ_N)`, `τ↦(ℂ/Λ_τ,(τ/N,1/N))`. Complex conjugation inverts pairing values.

**Moduli problems are not interchangeable.** Strict full ordered level `(Xfull(N), Y_full(N))`, a fixed Weil-pairing fibre `(X(N,ζ), Y(N,ζ))`, projective frames modulo scalars, the point-of-exact-order problem (`X₁(N)`, whose objects are pairs (E,P)), the naive cyclic problem `X₀(N)^naive` and Česnavičius's refined `X₀(N)`, and the mixed problems `Γ₁(N;n)` and `Γ₁(N)∩Γ₀(p)` are different moduli problems. Full level carries its cyclotomic determinant algebra and is not geometrically connected; a fixed pairing selects one component over `ℤ[ζ_N]`. The naive and refined `Γ₀` stacks have the same coarse curve but are different stacks for N not squarefree. `Γ₀` always has generic inertia `{±1}`.

**Stacks, coarse curves and models.** `X(1)=Ell₁` is the stack of generalized elliptic curves with irreducible geometric fibres and `Ell_m` that of curves whose degenerate fibres are m-gons. For an open H, `𝒳_H` is the level-H stack (the normalization of `X(1)` in the level-H cover of the elliptic locus, the level-H construction in Layers 3 and 5); for the standard levels it is Layers 3 and 4's moduli stack (`Xfull(N), X₁(N)`, refined `X₀(N)`). `X_H` is its coarse curve, `Y_H` the elliptic open (each statement says whether the stack or the coarse space is meant), and `X_H^∞` the scheme-theoretic fibre of `X_H` over `j=∞`. A stack, its formal framed atlas, its coarse space, a regular model and a semistable model after base extension are different objects; no property passes from one to another without the theorem that transfers it. In particular stack finite flatness does not give coarse finite flatness, and coarse formation commutes with arbitrary base change only in the range of [§5.3](#s5-3).

**Degrees.** `𝒳_H` has degree `[GL₂(Ẑ):H]` over `X(1)` and `X_H` has degree `[GL₂(Ẑ):±H]` over `ℙ¹_j`. The correspondence `A_m` uses every subgroup of order m and `C_m` only the cyclic ones; in characteristic zero their degrees are `σ₁(m)` and `ψ(m)=m∏_{p|m}(1+1/p)`. Hermite normal form data are `ad=m`, `0≤b<d`, with the cyclic filter `gcd(a,b,d)=1`; for `m=4` there are seven branches, six of them cyclic.

**Cusps, widths and the Hodge frame.** The effective cusp width w is computed in `PSL₂` (with `±Γ`), the strict width h in `Γ`; `h=2w` at an irregular cusp. Tau Ceti's `integerCuspWidth` is the strict width at `∞`. The Tate coordinate is `u=e^{2πiz}`, the Tate parameter `q=e^{2πiτ}`, and the modular Hodge frame is `2πi dz=du/u`; a weight-two form f corresponds to the differential `2πi f(τ)dτ=f dq/q`. The individual-curve normalization `dx/(2y)↔dz` of the lattice cubic `y²=x³−g₂x/4−g₃/4` is separate from this frame.

**Hecke conventions.** `π₁` is the forgetful leg and `π₂` the quotient leg of a degeneracy correspondence. On weight-k sections in characteristic zero the Hecke operator is `n⁻¹` times raw isogeny pullback and trace (Layer 7); on regular differentials the curve pullback and trace are used directly. The integral coherent trace on weight-k forms is `pT_p`, and division by p is a separate local theorem (Layer 9, Layer 10). On Jacobians the Picard (upper) action is `π₁∗π₂^∗=Alb(π₁)∘Pic⁰(π₂)` and the Albanese (lower) action is `π₂∗π₁^∗=Alb(π₂)∘Pic⁰(π₁)`; the classical cotangent action is the Albanese one, the Picard action is its adjoint, and `w_ζ` transports one to the other. The modular quotient `A_f` is formed with the Albanese action. Picard norms and étale traces count lengths and are never divided by the degree. On `X₁(N)` the Atkin–Lehner map is `w_ζ`, defined over the cyclotomic field; on `X₀(N)` exact divisors give rational involutions. A bad-prime `U_p` never uses a diamond `⟨p⟩` that does not exist.

**Cohomology conventions.** For weight `k≥2` put `r=k−2` and use `Sym^r` of the relative first cohomology of the actual universal elliptic curve over a fine level. Integral and adic statements keep their inverse-limit and torsion hypotheses; O is a complete discrete valuation ring finite over `ℤ_ℓ`. Parabolic cohomology is the image of compactly supported cohomology in ordinary cohomology. For nontrivial coefficients the cusps are truncated to boundary circles with their monodromy, rather than extended across the compact curve. Integral self-duality of `Sym^r` needs r! invertible or a separately compared divided-power dual lattice. Kummer theory gives `T_ℓ Pic⁰ ≅ H¹_et(X,ℤ_ℓ(1))`, and comparisons keep the twist and the transpose between the Picard and Albanese actions. Rational rank two over a Hecke factor never means integral rank two.

**Graphs and degenerations.** Dual graphs keep oriented branches, loops, multiple edges, component genera, cusp fields, node thicknesses and Galois actions. The character lattice is `H₁` of the graph. Thicknesses weight the monodromy pairing and its component-group cokernel, and a ramified base change multiplies them. A local node `uv=ϖⁿ` is normal but not regular for `n>1`; regular resolution subdivides it into unit edges.

**Taylor–Wiles data.** `ℓ` is odd, `Δ_Q` is the actual finite abelian `ℓ`-group of the auxiliary primes, the auxiliary fine level `R≥5` is kept at both ends, and `ξ=diag(−1,1)` acts with the minus eigenspace taken; minus cohomology is free over `O[Δ_Q]`, with no Hecke multiplicity-one claim.

Use `X_s(ℓ)` for the ordered split-Cartan curve and `X_s⁺(ℓ)` for the monomial split-Cartan curve, including in the semistable-model formulas. For odd `ℓ` the monomial subgroup is the normalizer of the diagonal Cartan; at `ℓ=2` it preserves the unordered coordinate lines and has order 2, whereas the normalizer of the trivial diagonal subgroup is all `GL₂(𝔽₂)`. In these formulas `X_s⁺≅X₀(ℓ²)/w_(ℓ²)`; the citation dictionary in §9.6 records the source notation. Write `J₁(N)=Pic⁰(X₁(N))` for the point-of-exact-order model with `N≥5` over `ℤ[1/N]`.

Every division has its stated range: nonzero periods and positive levels in uniformization, nonzero q on the smooth Tate fibre, p-divisibility before coherent normalization, r! invertible for integral symmetric-power self-duality, and 2 invertible for the minus projector. The nonvanishing and integrality requirements survive specialization.

**Supplier shorthand.** MC followed by a layer label (MC5C, MC9B) is a layer of TauCetiRoadmap ModularCurves, and MF10A–MF10C are layers of TauCetiRoadmap ModularForms. AlgebraicModuliForArithmeticGeometry and SchemeAndStackFoundations are cited by section and target name. A2–A6 are layers of AbelianSchemesAndArithmeticModuli, C−1–C6 layers of ComplexComparisonPartII, R11.k layers of NeronModelsAndSemistableAbelianVarieties, and LPV.7a the semistable-curve layer of LefschetzPencilsAndVanishingCycles. The étale support, finite-trace and curve-duality contracts are EtaleCohomologyFoundations §§0.7–0.11; finite/adic geometric cohomology is EtaleCohomologyFoundations §§F.1–F.4.

## Exact supplier contracts

The prerequisite inventory consists of the contracts below and the arithmetic-cohomology table in Scope and ownership. Étale support, trace, curve duality and finite/adic cohomology use EtaleCohomologyFoundations §§0.7–0.11 and F.1–F.4; LefschetzPencilsAndVanishingCycles supplies the semistable-curve layer 7a.

### Existing Mathlib and Tau Ceti

The acceptance statements use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The declarations below supply the ordinary algebraic and analytic carriers; the geometric constructions specified in the layers use the named roadmap contracts.

- `PeriodPair` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`): A pair of real-linearly independent complex periods; its lattice and integer basis already exist.
- `PeriodPair.weierstrassP` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`): The lattice Weierstrass function, including totalized values at lattice points; only its restriction off the lattice is used for affine coordinates.
- `PeriodPair.derivWeierstrassP` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`): The native derivative function, periodic and odd.
- `PeriodPair.g₂` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`): The invariant 60 `G₄` of a native period pair.
- `PeriodPair.g₃` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`): The invariant 140 `G₆` of a native period pair.
- `PeriodPair.derivWeierstrassP_sq` (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`): For z outside the lattice, `℘′(z)² = 4℘(z)³ − g₂℘(z) − g₃`.
- `WeierstrassCurve` (`Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`): The five-coefficient Weierstrass equation over a commutative ring and its discriminant.
- `WeierstrassCurve.IsElliptic` (`Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`): The class asserting that the Weierstrass discriminant is a unit; over C this is precisely nonsingularity.
- `Polynomial.natDegree_cyclotomic` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`): For a nontrivial ring R, `Φ_n` has natural degree `φ(n)`.
- `TauCeti.Subgroup.integerCuspWidth` (`TauCeti/NumberTheory/ModularForms/Cusps/Basic.lean`): For a subgroup `𝒢` of `GL₂(ℝ)`, the least positive n with `[[1,n],[0,1]]∈𝒢`, or zero if none; positivity needs finite relative index in `SL₂(Z)`. It is the strict width at `∞` of `𝒢` itself (`−1` is not adjoined); other cusps `σ∞` use `σ⁻¹𝒢σ`, and at an irregular cusp it is twice the effective `PSL₂` width.
- `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk` (`TauCeti/AlgebraicGeometry/IrreducibleOfConnectedDomainStalk.lean`): A locally Noetherian connected scheme with all stalks domains is irreducible.
- `HeckeRing.GL2.qExpansion_coeff_one_heckeRingHomCharSpace_heckeTCompositeGamma0` (`TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Composite.lean`): For [NeZero N], a character `χ` of `(Z/N)^×` and `n≠0`, `a₁(T_n F)=a_n(F)` for F in the `χ`-part of `M_k(Γ₁(N))` (width-one q-expansion); trivial `χ` is the `Γ₀(N)` case. `T_n` is the native composite operator, bad-prime blocks included; no coprimality hypothesis.
- `HeckeRing.GL2.heckeT_mul_of_coprime` (`TauCeti/NumberTheory/HeckeRing/GL2/Basic.lean`): For `m,n:ℕ+` and `Nat.Coprime(m:ℕ)(n:ℕ)`, `HeckeRing.GL2.heckeT m * HeckeRing.GL2.heckeT n = HeckeRing.GL2.heckeT (m*n)`. This is the abstract full-subgroup integral `GL₂` Hecke product, not the cyclic repeated-prime law.
- `AlgebraicGeometry.Flat` (`Mathlib/AlgebraicGeometry/Morphisms/Flat.lean`): Flat morphisms of schemes
- `AlgebraicGeometry.IsFinite` (`Mathlib/AlgebraicGeometry/Morphisms/Finite.lean`): Finite morphisms of schemes
- `AlgebraicGeometry.IsIntegralHom` (`Mathlib/AlgebraicGeometry/Morphisms/Integral.lean`): Integral morphisms of schemes
- `AlgebraicGeometry.IsOpenImmersion` (`Mathlib/AlgebraicGeometry/OpenImmersion.lean`): Open immersions of schemes
- `AlgebraicGeometry.Scheme.Hom.finrank` (`Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean`): The rank function of a scheme morphism; it is locally constant when the morphism is finite, flat and locally of finite presentation
- `AlgebraicGeometry.Scheme.Hom.normalization` (`Mathlib/AlgebraicGeometry/Normalization.lean`): The relative normalization of the target in a quasi-compact quasi-separated morphism of schemes
- `AlgebraicGeometry.Scheme.Hom.normalization.hom_ext` (`Mathlib/AlgebraicGeometry/Normalization.lean`): Uniqueness of morphisms out of the relative normalization over an affine morphism
- `AlgebraicGeometry.Scheme.Hom.normalizationDesc` (`Mathlib/AlgebraicGeometry/Normalization.lean`): The universal property of relative normalization: a morphism to any integral factorisation
- `AlgebraicGeometry.Scheme.Hom.normalizationPullback` (`Mathlib/AlgebraicGeometry/Normalization.lean`): The comparison morphism from the normalization of a base change to the base change of the normalization; an isomorphism for smooth (hence étale) base change (instance tagged Stacks 03GV)
- `CongruenceSubgroup.Gamma` (`Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`): `Γ(N)` in `SL(2,ℤ)`: matrices `≡ identity` mod N
- `CongruenceSubgroup.Gamma0` (`Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`): `Γ₀(N)` in `SL(2,ℤ)`: lower-left entry `≡0` mod N
- `CongruenceSubgroup.Gamma1` (`Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`): `Γ₁(N)` in `SL(2,ℤ)`: `a≡1`, `d≡1` and `c≡0` mod N
- `IsIntegrallyClosed` (`Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean`): Integrally closed commutative rings
- `IsPrimitiveRoot` (`Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean`): Primitive roots of unity
- `Matrix.GeneralLinearGroup` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`): The general linear group `GL(n,R)` as units of matrices
- `Matrix.GeneralLinearGroup.det` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`): The determinant homomorphism `GL(n,R)→Rˣ`
- `Polynomial.cyclotomic` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`): Cyclotomic polynomials
- `Subgroup.index` (`Mathlib/GroupTheory/Index.lean`): The index of a subgroup
- `Subgroup.normalizer` (`Mathlib/Algebra/Group/Subgroup/Defs.lean`): The normaliser of a subset in a group
- `WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq` (`TauCeti/AlgebraicGeometry/EllipticCurve/Aut.lean`): For an elliptic Weierstrass curve over a domain with `j≠0,1728`, every change of variables fixing it is the identity or the negation change; over a field these are its automorphisms
- `AlgebraicGeometry.Scheme.EllAdicCohomology` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`): Untwisted pro-étale `ℤ_ℓ` sheaf cohomology carrier with additive group; does not supply twisted finite coefficients, comparison or a `ℤ_ℓ`-module instance.
- `AlgebraicGeometry.Scheme.ellAdicSheaf` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`): Continuous `ℤ_ℓ`-valued pro-étale sheaf, for `ℓ` prime.
- `TauCeti.LocalCoefficientSystem` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`): Module-valued functors on the fundamental groupoid; the abstract local-system carrier is imported.
- `TauCeti.LocalCoefficientSystem.pullback` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`): Pullback functor along a continuous map, with identity and composition isomorphisms in that file.
- `Representation.symmetricPower` (`TauCeti/RepresentationTheory/SymmetricPower.lean`): Action on `Sym^r` of a representation; includes pure-tensor evaluation and functorial intertwining maps. The abstract symmetric-power representation is not a new target.
- `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`): Actual proper geometrically integral group-scheme carrier over a field; not a Jacobian or a quotient construction.
- `RingHom.ker` (`Mathlib/RingTheory/Ideal/Maps.lean`): Kernel ideal of a ring homomorphism.
- `Ideal.comap` (`Mathlib/RingTheory/Ideal/Maps.lean`): Inverse image of an ideal along a ring homomorphism.
- `LinearMap.coprod` (`Mathlib/LinearAlgebra/Prod.lean`): Sum map from a product of two modules, used only after geometric pullbacks have been constructed.
- `LinearMap.range` (`Mathlib/Algebra/Module/Submodule/Range.lean`): Image submodule, used to define parabolic cohomology from the actual compact-support map.
- `groupCohomology.H1` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean`): Group-cohomology carrier for an actual representation. With trivial action, degree one is additive characters, not compact curve cohomology.
- `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` (`TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean`): Same-level newforms, with equal characters and good eigenvalues outside a finite set, are equal. This does not prove cross-level multiplicity one or integral saturation.
- `groupCohomology.coindIso` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean`): Shapiro isomorphism for coinduction from a subgroup, in every degree; use this existing theorem rather than plan another Shapiro theorem.
- `groupCohomology.H1IsoOfIsTrivial` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean`): Existing trivial-action `H¹/character` isomorphism; `congruenceClasses_H1` specializes this result rather than reproving it.
- `CongruenceSubgroup.Gamma_le_Gamma_of_dvd` (`TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean`): Existing antitonicity of principal congruence subgroups under divisibility of levels; use it in refinement and restriction tests.
- `Module.free_of_flat_of_isLocalRing` (`Mathlib/RingTheory/LocalRing/Module.lean`): A finite flat module over a commutative local ring is free. Finite projective modules supply flatness; this is not an unrestricted infinitely generated freeness assertion.
- `SymmetricPower.finrank_eq` (`TauCeti/LinearAlgebra/SymmetricPower/Basis.lean`): For a finite free module over a commutative semiring with strong rank condition, the nth symmetric power has finrank `multichoose(finrank M,n)`; supplies the rank checks for relative rank-two coefficients.
- `RingHom.quotientKerEquivRange` (`Mathlib/RingTheory/Ideal/Quotient/Operations.lean`): For a commutative ring R and a ring S, R/ker f is canonically ring-isomorphic to the image subring f.range. This is an integral image theorem, not a rational coefficient-field identification.
- `TauCeti.frickeGL` (`TauCeti/NumberTheory/ModularForms/Fricke/Matrix.lean`): The Fricke matrix `[[0,−1],[N,0]]` in `GL₂(K)` for a field K in which N is invertible, of determinant N and square `−N`. Through Mathlib's `UpperHalfPlane.glAction` (`Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean`) it gives the analytic Fricke map `τ↦−1/(Nτ)` of §9.3.
- `TauCeti.IsAtkinLehnerMatrix` and `TauCeti.atkinLehnerMatrix` (`TauCeti/NumberTheory/ModularForms/AtkinLehner/Matrix.lean`), `TauCeti.Nat.IsExactDivisor` (`TauCeti/Data/Nat/ExactDivisor.lean`): Atkin–Lehner matrices for an exact divisor Q‖N and the exact-divisor predicate; the operators on forms built from them are ModularForms Layer 6.
- `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective` (`TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean`): Reduction `SL₂(ℤ)→SL₂(ℤ/N)` is surjective.
- `cosetToCuspOrbit` and `surjective_cosetToCuspOrbit` (`Mathlib/NumberTheory/ModularForms/Cusps.lean`): For an arithmetic subgroup of `GL₂(ℝ)`, the surjection from cosets onto the cusp orbits; §6.3 compares these orbits with the algebraic boundary labels.

The Weil pairing `TauCeti.Isogeny.weilPairing` in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean` fixes the Silverman convention. The elliptic Tate module and Tate equation APIs supply their ordinary carriers and coefficient formulas; they do not supply the proper generalized n-gon family or a relative modular Jacobian. Connectedness of affine spectra under algebraically closed scalar extension is supplied by `TauCeti.connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed` (`TauCeti/RingTheory/Idempotents/Connected/ScalarExtension.lean`), with descent by `TauCeti.connectedSpace_primeSpectrum_of_injective` (`TauCeti/RingTheory/Idempotents/Connected/Spectrum.lean`); the finite-type scheme contract below handles their geometric interpretation. The equation-level Tate curve over `ℤ((q))` is Tau Ceti's `TauCeti.tateCurve` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Basic.lean`), with its coefficients, discriminant order and j-expansion; §3.6 uses it as the generic fibre of the imported n-gon family.

The finite-normal recognition criterion is imported from ModularCurves Layer 10, item 1. Let `T→ℙ¹_j` be finite with T normal, and let the given elliptic open `Y→T` be an open immersion with schematically dense image meeting every irreducible component. Then T is the relative normalization of `ℙ¹_j` in Y. Finiteness, normality, the open immersion and meeting every component are all required; a merely normal proper extension need not be finite over the fixed j-line. The identity case passes; adding a component disjoint from the open does not. The modular normalization comparisons use this existing criterion.

For a finite commutative `ℓ`-group `Δ` over a commutative local ring O with `ℓ` nonunit, Tau Ceti supplies `TauCeti.MonoidAlgebra.isLocalRing_of_isPGroup` and `isLocalHom_lift_one_of_isPGroup` in `TauCeti/Algebra/MonoidAlgebra/LocalRing.lean`. `TauCeti.MonoidAlgebra.augmentation` and `TauCeti.MonoidAlgebra.ker_augmentation_eq_span` in `TauCeti/Algebra/MonoidAlgebra/Exactness.lean` identify the maximal ideal as the inverse image of the maximal ideal of O, generated by it and `[δ]−1`. With `Δ` trivial this is O; for `Δ=C₂` and odd `ℓ` the trivial and sign factors prevent locality. Together with Mathlib `Module.free_of_flat_of_isLocalRing` this is the algebra input to the finite projective Taylor–Wiles module.

### AbelianSchemesAndArithmeticModuli

- **A2**: Scheme representability of abelian algebraic spaces (A2.1, `raynaudRepresentability`), dual abelian schemes and the Poincaré bundle (A2.2) and polarizations (A2.5). Section 13.1 uses JacobianChallengePartII §§1.2–1.4's canonical relative Jacobian polarization and proves the norm/pullback transpose identity; the underlying line-bundle norm is SchemeAndStackFoundations §3.5.
- **A3**: Quotients by finite locally free subgroups (A3.3) and polarized Weil pairings (A3.7).
- **A4**: The integral `ℓ`-adic Tate module (A4.1): actual `ℓ`-power torsion, its inverse limit of rank 2g and its Weil pairing. In characteristic p the weight-two special-fibre calculation uses Frobenius and Verschiebung from MC7E and the connected–étale structure of A4 over a perfect field. The curve-Picard Kummer comparison `T_ℓPic⁰≅H¹_et(−,ℤ_ℓ(1))` is §13.5's `jacobianTateModule_kummer`.
- **A5**: Lattice uniformization of complex abelian varieties (A5.1, `AbelianLattice`), specialized to dimension one in §1.2; analytic families of complex tori and the algebraic comparison (A5.6), whose locally constant polarization type holds for one-dimensional families with their standard principal polarization; and the Siegel universal family (A5.8, `SiegelFamily`), whose genus-one case carries the marking of §3.13.
- **A6**: Faithfulness on Tate modules (A6.2), Poincaré complete reducibility (A6.5), finite freeness of Hom (A6.7, `homFreeFinite`) and relative Hom with normal-base extension (A6.25, `relativeHom`). The quotient of an abelian variety by a positive-dimensional abelian subvariety is constructed from A6.5 and A3.3 in §16.2.

### AlgebraicModuliForArithmeticGeometry

- **§7.3**: The relative fppf Picard sheaf, its base-change and section-rigidification interfaces, and `picard_infinitesimal_lifting`: for a flat small Artinian thickening with kernel I, the obstruction to lifting a line bundle lies in `H²(C₀,O)⊗I`. Its vanishing gives formal smoothness for curves. **§7.9**, `spaceSectionComponentCriterion`, supplies the general algebraic-space component construction used by ComplexComparisonPartII C3.2f.2.
- **§§5.1–5.4**: `ArithmeticModuli.NormalInertiaSubgroup`, the rigidification carrier and its stabilizer, coarse-space and base-change theorems; `ArithmeticModuli.FiniteCorrespondence` with coarse finiteness; `ArithmeticModuli.tame_finite_flat_descent`; `ArithmeticModuli.DMNormalization.stack` and `.finite`; schematic closures and normalized correspondences. The identification of the Katz–Mazur coarse scheme with the elliptic stack coarse space is proved here in §§3.9 and 5.17, from ModularCurves 9D and SchemeAndStackFoundations §1.23.
- **§8.3, `completedAtlasPresentation_equivalence`**: The identity-framed object/relation formal groupoid presentation of a smooth atlas with its stated residue and finiteness hypotheses. Residual automorphisms outside the identity relation completion are retained separately; the coarse invariant-ring theorem is §0.1 here.
- **§7.5, `arithmetic_normalization_genericallyEtale`**: Finite relative normalization over a field or an excellent base, with generic étaleness only for the separable field-extension case.

### [EtaleCohomologyFoundations](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EtaleCohomologyFoundations)

- **§§0.7–0.8, `ClassicalAlgebraic.supportLocalization`, `ClassicalAlgebraic.properSupports`**: Étale extension by zero, open–closed localization and compactification-defined `D⁺` torsion lower shriek with its forget-supports map. Constructible operations and finiteness use EtaleCohomologyFoundations §§F.1–F.4.
- **§0.8, `ClassicalAlgebraic.finiteTrace`**: Finite locally free trace, the degree formula, length-weighted geometric stalks, composition, base change and Kummer norm compatibility. Section 9.12 specializes this supplied trace to modular `H¹` and identifies it with the Jacobian norm.
- **§0.11, `ClassicalAlgebraic.smoothTrace`, `ClassicalAlgebraic.curveDuality`**: Smooth curve trace and Poincaré–Lefschetz/étale duality with coefficient duals and twists, for invertible finite coefficients and constructible finite-Tor complexes. Integral parabolic perfection here additionally requires the displayed torsion and boundary vanishings. The comparison with complex cohomology is ComplexComparisonPartII §§C6.3–C6.6.

### NeronModelsAndSemistableAbelianVarieties

- **§5.0a** (finite-étale specialization of abelian torsion): For an abelian scheme over the integers of a nonarchimedean local field and `ℓ` different from the residue characteristic, reduction identifies geometric `ℓ`-power torsion equivariantly and compatibly with transition maps (§13.5).
- **§5.0b** (good reduction and the Frobenius polynomial): The resulting Tate module is unramified; arithmetic Frobenius agrees with the Tate action of the special-fibre Frobenius endomorphism (§13.5).
- **`R11.1`**: Néron extension of generic Jacobian homomorphisms over a DVR when the modular coarse fibre is singular; do not claim abelian good reduction at level-dividing primes.
- **`R11.3`**: Semistable integral Tate filtration at `ℓ≠p`: `T_tor⊂T_f=T^{I_p}⊂T`, toric term `Hom(X*(T),Z_ℓ(1))`, finite quotient `T_ℓ` of the abelian reduction; keep saturation hypotheses.
- **`R11.4`**: Comparison of the Néron identity fibre with `Pic⁰` of a proper regular semistable curve, the thickness-weighted graph monodromy pairing and its component-group discriminant. Import the general theorem; this part supplies the modular component/branch data. Additional consuming contract: Generic graph identification `X*(T)=H₁(dual graph,Z)`, weighted monodromy into its Z-dual and component-group cokernel, retaining all node thicknesses and primary torsion.
- **§§4.2–4.7**: The common integral graph carrier `DualGraph.cycleLattice`, thickness form `DualGraph.edgeForm` and monodromy cokernel. The shared finite-torsion interface is assigned to this supplier: `SemistableTorsionDatum` over a commutative Hecke ring, with its commuting finite Galois action and the toric, identity-component and finite-part filtration; its laws retain the abelian part. Section 17.7 supplies the modular specialization from the Jacobian's actual torsion, rather than another graph or torsion carrier.
- **`R11.6`**: Generic Néron extension and contravariant maps on characters; exact character sequences only when an exact sequence of reduction tori is given. This does not prove exactness for an arbitrary old/new modular isogeny.
- **5.1**: The Néron–Ogg–Shafarevich criterion and the isogeny invariance of good reduction, used for the modular quotients of §16.2.

### SchemeAndStackFoundations

- **§0.20, `nagata_normalization_finite`**: Finiteness of normalization over a Nagata base. **§0.7, `geometric_irreducible_components`**: Invariance of irreducible components under extension of a separably closed field. The connected-component version (Stacks, tag 0363) is §4.9's theorem here.
- **§§1.18–1.21**: Stacks in groupoids with fppf descent, 2-fibre products, representable diagonals, inertia, quotient stacks and the Deligne–Mumford criterion by unramified diagonal. No generalized elliptic structure is supplied here.
- **§1.23, `keel_mori`, `finite_quotient_coarse`, `IsTame`, `tame_local_structure`**: Coarse spaces with finite inertia, affine finite quotient stacks and the étale-local structure of tame stacks. The possibly wild Deligne–Mumford local quotient theorem is §0.1 here.
- **§§1.1, 1.22 and 2.2**: Quasi-coherent stack modules, fpqc descent and the Čech-to-cohomology spectral sequence. A flat surjective representable scheme cover `P→𝒳` computes cohomology using its fibre powers.
- **§§2.6 and 2.19–2.21, `trace`**: Coherent restriction and flat base change, relative dualizing sheaves and proper coherent trace. On smooth proper curves `ω=Ω¹`; its field-trace comparison is §7.3 here. Restriction injectivity along a schematically dense open or a boundary meeting every component is §4.4 here.
- **§2.20 (SF.2), `RelativeDualizingComplex`, `relativeDualizingModule`, `relativeDualizingModule_baseChange`, `cm_serre_duality` and `curve_dualizing_comparison`**: The relative dualizing object for flat Cohen–Macaulay morphisms, its base change, field duality and agreement with StableReduction Layer 2's Gorenstein-curve duality. Sections 13.7–13.9 specialize these constructions to integral modular models and their correspondences.
- **§3.5, `lineBundleNorm`, `lineBundleNorm_pullback`, `lineBundleNorm_comp`, `lineBundleNorm_baseChange`, `lineBundleNorm_divisor`**: The norm of invertible sheaves under finite locally free maps, its degree, composition and base-change laws and scheme-theoretic divisor multiplicities. Section 13.1 restricts this supplied norm to the relative neutral Picard scheme and proves its polarization transpose identity.
- **§4.14**: Hilbert and Quot schemes of projective morphisms for the tricanonical atlas of polygon-count stacks. **§4.9, `stein_factorization`**: Stein factorization of a proper Noetherian morphism.
- **§4.10, `Formal.grothendieck_existence`, `Formal.algebraize_hom`**: Coherent existence and full faithfulness for compatible morphisms on given proper schemes. Effective algebraization of a polarized proper formal family is supplied by AdicSpacesPartIII §F0.8 below.
- **Layer 5**: Projection formula for proper cycle pushforward and flat pullback. Section 9.13 identifies the degree of a pulled-back divisor under a finite curve map.

### TauCetiRoadmap AlgebraicCurves

- **Layer 12**: Use the anti-equivalence between function fields and regular projective curves (12C): generic finite maps extend uniquely and the normalization of a plane model is the regular projective model.

### TauCetiRoadmap AlgebraicTopology

- **Stage 2**: Use relative/twisted singular chains, functoriality and compactification-pair homology; the specific modular-symbol comparison and tree stabilizers remain here.
- **Stage 5**: Use finite-cover/local-coefficient descent, transfer, Cartan–Leray and permutation coefficient systems; Shapiro itself is already pinned. Keep noninvertible deck orders and derived invariants explicit.
- **Stage 6**: Use cochains with local coefficients, relative/compact-support cohomology, cup product and Poincaré–Lefschetz duality with the chosen orientation; the general twisted cochain construction is supplied there.

### TauCetiRoadmap FuchsianOrbifolds

- **Layer 2**: Supply the finite-sided polygon and cofinite-group presentation. Together with the cusp truncation of Layers 3–4 these are inputs to this roadmap’s `modularOpenFiniteGraph` in §14.9a, which constructs the finite graph retract and the free fundamental group.
- **Layer 3**, **Layer 4**: Cusp data with their widths and q-coordinates `q=exp(2πiσ(z)/w)` (Layer 3), and the compactified quotient with the ramification index `e=w_{Γ′}/w_Γ` of a finite-index inclusion at a cusp (Layer 4, item 4); §§4.8 and 6.2 compare these with the algebraic Tate charts and level maps.

### TauCetiRoadmap JacobianChallenge

- **Layer D**: The field-curve Picard/Jacobian scheme and its field-base change. **Layer E**: Its dimension and canonical principal polarization from the theta divisor. Use both for the field comparisons in §13.1; JacobianChallengePartII §§1.2–1.4 supplies their positive-genus family extension, and the relative norm comparison remains here.
- **Layer F**: Use the supplied generic Abel–Jacobi morphism `x↦[x−c]` and its universal property. Section 13.2 proves its cotangent comparison from Layer E’s tangent identification and Layer B’s Serre duality; §§17.3 and 16.8 specialize the rational cusp, change-of-base-point formula and quotient composite.

### JacobianChallengePartII

- **§§1.2–1.4**: `RelativeJacobian.RelativeJacobian`, `RelativeJacobian.jacobianBaseChange` and `RelativeJacobian.PrincipalPolarization` supply the positive-genus relative neutral Picard abelian scheme, its dimension, canonical principal polarization and comparisons for every base change, including nonreduced and non-Noetherian pullbacks. The construction is section-free for smooth projective geometrically connected curves over a Noetherian base. Section 13.1 applies it on the modular smooth bases, using étale local projective charts over locally Noetherian bases, and identifies the modular norm, divisor classes and Hecke actions. The genus-zero case is the trivial principally polarized abelian scheme here.

### TauCetiRoadmap ModularCurves

- **Layer 0A**: Relative effective Cartier divisors, their sums, flat inverse images and arbitrary base change; use the existing divisor carrier.
- **Layer 0B**: Use the existing finite locally free group-scheme, Cartier duality and subgroup carrier; polygon torsion/quotients specialize it.
- **Layer 0C**: Affine finite-group invariant quotients, with the finite-type hypothesis for module finiteness; finite locally free group-scheme torsors, affine finite locally free equivalence relations and free actions with an invariant affine open cover. Keep the scheme-versus-algebraic-space hypotheses.
- **Layer 0D**: Finite étale schemes, Galois actions and Galois descent of their points.
- **Layer 0E**: Effective faithfully flat descent of schemes, morphisms, sections, polarized curves, groups, level structures, actions and torsors in the supplier’s stated cases, and finite-presentation spreading out. Invariance of connectedness under field extension is §4.9 here.
- **Layer 1A**: Use the existing smooth projective Weierstrass curve with identity and projective-point dictionary.
- **Layer 1C**: Use the invariant-differential line, `dx/(2y+a₁x+a₃)`, coordinate-change multiplier and Weierstrass differential identities.
- **Layer 1D**: Use the algebraic pointed elliptic group scheme and its translation-invariant differential; ordinary group laws are not reconstructed here.
- **Layer 2B**: Algebraic isogenies and elliptic quotients `E→E/C` by finite locally free subgroup schemes, the universal quotient isogeny and its kernel, dual, degree and base-change API; no second elliptic or quotient carrier is defined here.
- **Layer 2E**: Cartier–Nishi duality and the relative scheme Weil pairing, alternating and scheme-theoretically perfect, with isogeny/dual-isogeny compatibility, degree multiplier and `e_N((P,Q)g)=e_N(P,Q)^{det g}`. The equation-level convention is Tau Ceti’s `TauCeti.Isogeny.weilPairing`; the scheme comparison is this supplier’s contract.
- **Layer 2F**: Rigidity of elliptic curves with naive full level `N≥3` structure over `ℤ[1/N]` (Katz–Mazur 2.7).
- **Layer 3C**: Use the ordinary elliptic Drinfeld full, point and cyclic level definitions/full-set theorems.
- **Layer 3D**: Prime-to-characteristic comparison of Drinfeld and naive structures after inverting N, including the exact full/point rigidity ranges.
- **Layer 3N**: Naive level structures and the finite étale N-torsion over `ℤ[1/N]`.
- **Layer 5A**: The fine open `Y₁(N)` for `N≥4` over `ℤ[1/N]` via Tate normal form, with its moduli and universal-object interface.
- **Layer 5B**: Ordinary full ordered-basis moduli `Y_full(N)` for `N≥3` over `ℤ[1/N]`, its determinant to `μ_N^{prim}`, and the fine fibres `Y(N,ζ)`. Connectedness is proved in Layers 4 and 6 here.
- **Layer 5C**: The paired finite-module symplectic-frame twist `Y(ρ)/ℚ` for `N≥3`, with smooth finite-type quotient/descent and conditional geometric irreducibility. Its three comparison contracts are discharged in Layers 4 and 6 here.
- **Layer 7B**: Use the existing Katz–Mazur ordinary local/deformation-ring and regularity statements at bad primes, with their stated hypotheses; this is the local algebra input to the cyclic-isogeny construction of §11.2.
- **Layer 7E**: Import the existing elliptic PD-3 target: relative Frobenius and Verschiebung in characteristic p with `V∘F=[p]=F∘V`, together with the PD-1 finite locally free torsion levels and Cartier duality from Layer 2E. Quotients remain the existing Layer 2B interface; these elliptic notions are not new A3 definitions. Additional consuming contract: for the ordinary-locus proof of the special-fibre Eichler–Shimura relation (Conrad, Theorem 5.16), use PD-2 (connected–étale sequence over a henselian local base, giving the connected and étale order-p subgroups of an ordinary curve and of its lifts) and PD-5 (the ordinary/supersingular dichotomy).
- **Layer 7F**: The universal ordinary elliptic deformation with Serre–Tate parameter and the supersingular one-dimensional deformation, including Frobenius/Verschiebung torsion and Drinfeld-generator conditions. The ModularCurves Layer 7F–7H and Layer 8C outputs supply these deformation calculations.
- **Layers 7D–7F**: Formal elliptic deformations and their ordinary/supersingular parameters. **Layer 7G**: The three characteristic-p rigidity calculations. The cyclic `pⁿ`-isogeny deformation ring and its source/target comparison are this roadmap’s `cyclicIsogenyDeformationRing` in §11.2.
- **Layer 8B**: Use generator schemes, finite locally free rank `φ(N)`, cyclicity and standard subgroup/quotient identities on ordinary elliptic curves.
- **Layer 8C**: Import the actual cyclic-generator comparison and its supersingular deformation rings; combine with Layer 7F–7H and the existing rigidifier/representability package. The mixed-level subsection §11.5 supplies only the modular one-factor component calculation.
- **Layer 8D**: The ordinary cyclicity locus, the integral `[Γ₀(N)]` level functor and `Y₀(N)`; boundary extension is the generalized-level construction of Layers 2–4 here.
- **Layer 9A**: Katz–Mazur quotient problems `[Γ(n)]/H̄` over `ℤ` with Q1–Q2, and after inverting n their identification with the fppf sheaf quotient of the naive full-level problem.
- **Layer 9B**: The seven quotient identifications of Katz–Mazur 7.4.2, including full-to-point-to-cyclic quotients, in the row action `(P,Q)γ=(aP+cQ,bP+dQ)`; upper triangular labels act on P by `a=d⁻¹` and diamonds by `P↦aP`.
- **Layer 9D**: The affine coarse moduli scheme `M(𝒫)` of a relatively representable affine level problem, classifying map, normality and categorical universal property; `M(𝒫)/H≅M(𝒫/H)` (KM 8.1.5), the precise base-change cases of KM 8.1.6 and quotient smoothness for a smooth affine relative curve over a regular noetherian base. Preserve stack inertia versus coarse objects.
- **Layer 9E**: The coarse j-line `Spec ℤ[j]` and its arbitrary ring-base versions (`coarseJLine_int`, coarseJLine), and `M([Γ₀(N)])⊗ℤ[1/N]≅Y_full(N)/B` for `N≥3`, with source/quotient-invariant maps.
- **Layer 10**: Only prime `N≥5` diamond quotients `X_H` over `ℤ[1/N]`, constructed as normalizations of `ℙ¹_j` in `Y₁(N)/H`, with their cusp divisor, Tate level covers, integral closures, labels, widths, characteristic-2/3 ramification and stabilizers, and Shimura covering. Sections 5.18–5.19 prove identity-compatible agreement on this range; no composite or bad-level extension is inferred.
- **Layer 6**: The integral level problems `[Γ(N)]`, `[Γ₁(N)]` and balanced `[Γ₁(N)]` over `ℤ`.

### TauCetiRoadmap ModularForms

- **Layer 10A**: Use the analytic congruence quotient and compactification, effective cusp widths, local finite stabilizer charts, branched maps and orbit/genus input.
- **Layer 10B**: Use compact Riemann-surface integral homology, bilinear period relation/positivity, canonical cohomology and the genus computation; the genus formula is supplied there.
- **Layer 10C**: Use modular/cusp-form spaces as equivariant automorphy-line sections and the weight-two canonical differential dictionary, including finite stabilizer invariance.
- **Layer 2**: Use the native analytic full Hecke algebra/slash operators, commutativity, span/product relations and composite coefficient theorem including bad-prime blocks; retain the anchor’s normalization and character conventions.
- **Layer 2**: Existing double-coset Hecke algebra/action and its full-subgroup multiplication convention; this part realizes those relations on the actual integral modular correspondence.
- **Layer 3**: Existing abstract Hecke/diamond relations and bad-prime U convention; import, never build another abstract Hecke algebra.
- **Layer 4**: Use the all-degeneracy-map oldspace span and primitive conductor/newform input; for f of conductor N at level M count the copies indexed by `d|M/N`, retaining arbitrary linear combinations.
- **Layer 5**: Use the strong multiplicity-one/eigenform characterization to identify the primitive simple factor independently of the ambient old level; analytic multiplicity one is supplied there.
- **Layer 8**: Import the existing integral symbol module `𝕄_N,k`, its boundary map, diamond/bad-prime action, and the period-induced quotient onto the form-side Hecke image. Layer 8 proves `ker(eval_𝕄)⊆ker(eval_S)`, not equality. The compact-curve/Jacobian image is compared only after the integral cuspidal-symbol comparison specified in §14.15; no existing integral Betti isomorphism is attributed to Layer 8. Additional consuming contract: Import the integral homological symbol lattice, Manin presentation, cuspidal boundary map, period functional into the dual of symbols, integral finite Hecke algebra and eigenvalue field; comparison to actual geometric cohomology is new here.
- **Layer 8G**: Use the coefficient-field and Galois-conjugate rationality statements to descend the weight-two differential block and its Hecke ideal.
- **Layer 6**: Atkin–Lehner and Fricke operators on forms for exact divisors, with `W_QW_R=W_{QR/gcd(Q,R)²}`; §§9.3–9.4 construct the corresponding involutions of the curves, and §§10.2 and 14.5 compare the Fricke involution with the Fricke operator.

### TauCetiRoadmap StableReduction

- **Layer 1**: Use the existing at-worst-nodal relative curves, Fitting-ideal singular locus, normalization exact sequence, dual graph and arithmetic-genus formula.
- **Layer 1**: Existing dual multigraph of a proper nodal curve with loops, multiple edges, arithmetic genus `Σ g_v+b₁` and the branch data; import rather than define a second graph carrier.
- **Layer 2**: Use the existing relative dualizing sheaf of nodal curves with its componentwise degree formula, Cartier divisors from smooth sections, ampleness criterion, relative Proj, cohomology and base change and contraction descent.
- **Layer 3**: Use the existing prestable/semistable pointed families and the single-marking contraction primitive by relative Proj of a section algebra.
- **Layer 4**: Existing arithmetic-surface blowups, total transforms, exceptional self-intersection, contractions of admissible `−1` curves, regular resolutions and compatibility with flat base change. This part adds only the modular input rings and stabilizer actions.
- **Layer 7**: Import the existing semistable-reduction existence theorem with identified generic fibre. Canonical contraction to the unpointed stable model is a separate Layer 8 input, for genus at least two.
- **Layer 8**: Import the canonical contraction of a proper prestable family of genus `g≥2`, its uniqueness and coherent arbitrary base change. For marked stability use Layer 9 with `2g−2+r>0` instead; do not attribute stabilization to Layer 7.

### AdicSpacesPartIII

- **F0.8** (*grothendieck-algebraization*, `FormalScheme.grothendieck_algebraization`): A proper noetherian formal scheme over Spf A, for A noetherian adic, with a compatible ample invertible sheaf on its thickenings, has a proper algebraization. The carrier comparison is F0.1/F0.7; full faithfulness for maps on proper algebraizations is SchemeAndStackFoundations §4.10. Section 2.9 applies this to polarized polygon families and transports group actions by uniqueness.
- **R2.11** (*compactified-moduli-generalised-elliptic-curves*): The carriers `EllipticModuli.GroupCurve` with `GroupCurve.Iso`, `GroupCurve.baseChange` and `ofElliptic`; the standard polygons `EllipticModuli.nGon S n` with `nGon_normalization`, `nGon_smoothLocus` and `nGon_smoothPoints`; `GeneralisedEllipticCurve S`; the levels `GeneralisedEllipticCurve.Level` and `LevelStructure` (full level over `ℤ[1/N]`, cyclic level with an invertible factor `d≥5`); the fine moduli scheme `moduli` with `universalCurve`, `universalLevel`, properness and finite presentation; the identity formal group `formalGroup`; and the n-gon Tate family `tateCurve n` over `ℤ[[Q]]`. No second generalized elliptic curve, polygon or Tate family is defined here; Layers 2–4 build the integral theory over `ℤ` on these carriers.

### ComplexComparisonPartII

- **C−1.1–C−1.3**: `ComplexAnalyticSpace` with nilpotent local models, open and closed subspaces, gluing and fibre products; `complexSchemeAnalytification` on locally finite-type complex schemes with its functor, Hom and étale-local comparisons; `completedAnalyticStalkComparison` for the algebraic and analytic local rings. Analytification and finite-coefficient Artin comparison are distinct contracts.
- **C1.9**: `properSchemeGagaPushforward` compares coherent higher direct images for a proper morphism of finite-type complex schemes; its base need not be proper. `properSchemeGagaEquivalence` is the coherent equivalence for a proper complex scheme, including `H⁰`, `H¹`, `Ω¹` and line powers on proper curves. Use the canonical comparison functors and their composition and exact-sequence compatibilities.
- **C3.2d.2–C3.2d.3**: `relative_picard_algebraicSpace` for a proper flat finitely presented curve with universal functions: `O_T≅(f_T)_*O_(C_T)` for every `T→S`. The relative fppf class sheaf is quasi-separated and locally of finite presentation; it is separated when the geometric fibres are integral. A global line bundle representing a sheaf point requires the section-rigidification contract or fppf localization.
- **C3.2f.1–C3.2f.2**: `picardZeroSheaf` and `picardZeroCriterion`, retaining the full neutral component. Over locally Noetherian S, smooth geometric identity components of locally constant dimension give an open group subspace of finite type. Smoothness holds over reduced S, and over nonreduced S with formal smoothness along the component. Proper geometric components and separatedness of the Picard space give properness. Formation commutes with arbitrary base change. JacobianChallengePartII uses these contracts for the relative Jacobian supplied to §13.1; that subsection identifies the modular norm/pullback transpose.
- **C2.1** (`gagaBaseChange`) and **C2.2** (`projectiveGeometricDictionaries`): Proper coherent GAGA with base change, and the projective dictionaries for ideals, sections and bundles.
- **C4.4** (`properSourceMorphismAlgebraicity`, `familyMorphismInterface`): Holomorphic maps out of proper complex schemes are algebraic, also in families.
- **C4.5** (`affineCurveCompletionInterface`, `affineCurveConnectedness`): The smooth projective model of a smooth affine complex curve, and connectedness of the curve is equivalent to connectedness of its analytification.
- **C5.7** (`curveResidueLocalization`): The residue sequence of logarithmic forms along a finite set of points of a smooth proper curve.

### LefschetzPencilsAndVanishingCycles

- **§§7a.1–7a.5** (normalization complex, node nearby cycles and specialization, nodal monodromy, and choice/base-change compatibility): The normalization and specialization sequences, the monodromy filtration and their compatibility with choices and base change for a proper semistable curve over a henselian trait; §12.3 applies them to the modular nodal models.

### Finite, compact-support and adic étale cohomology

EtaleCohomologyFoundations §§F.1–F.4 supplies `VanishingCycles.finiteCoefficientCohomology`, proper and smooth base change, `VanishingCycles.etaleCompactSupports`, `VanishingCycles.compactSupportCohomology`, `VanishingCycles.etaleFiniteness`, `VanishingCycles.compactSupportFiniteness` and normalized finite/adic realization. The coefficients are locally constant finite modules with invertible annihilator, or their compatible adic systems, on the supplied Noetherian geometric domain. ComplexComparisonPartII §§C6.2–C6.6 supplies `riemannExistence`, `artinComparison`, `artinComparisonCompactSupport`, `relativeArtinComparison` and `adicArtinComparison`, including trace, cup products and support maps. Section 14.4 identifies the resulting degree-one limit with Mathlib's pro-étale `EllAdicCohomology` carrier.

### Arithmetic cohomology and derived limits

- ArithmeticLocallySymmetricSpaces §§ALS.F.3, ALS.1.1–ALS.1.8, ALS.2.1–ALS.2.4, ALS.3.5–ALS.3.9, ALS.4.1, ALS.5a.3–ALS.5a.5 and ALS.6.1–ALS.6.3 supply the Betti/support, Hecke, adjoint and finite-cover interfaces in the table above. Section 14.4a constructs the modular finite pair and uses the topological coefficient comparison with finite coefficients before passing to adic limits.
- DerivedModuleAlgebra §§1.T.1 and 1.1 supply module towers, the Milnor sequence, Mittag–Leffler vanishing and derived limits for §14.4a's finite cellular models and their coefficient transitions.

### Shared Hecke eigensystems

AutomorphicFormsOnReductiveGroups §§5.8 and 7.3 owns the common arithmetic GL₂ presentation `𝕋^S`, with generators `T_v,S_v` away from a finite set S and eigensystems given by coefficient-algebra maps. The required presentation is the polynomial algebra in these two generators at each good place, with Frobenius polynomial `X²−T_v X+N(v)S_v`. Section 13.3 realizes its faithful anemic image with `S_v` acting by the diamond operator; the full modular image additionally contains bad-prime operators and all diamonds. Neither image is identified with the free presentation.

### Arithmetic tree suppliers

From ReductiveGroupsPartII §RG2.2.4, use the lattice tree of `SL₂(ℚ_p)`, its type-preserving action without inversions, the adjacent vertex stabilizers `SL₂(ℤ_p)` and `diag(p,1)SL₂(ℤ_p)diag(p,1)⁻¹`, their Iwahori intersection and the local amalgam. From AdelicAlgebraicGroups §4.2, use strong approximation for the simply connected `SL₂` group with S containing a noncompact place; reduction surjectivity `SL₂(ℤ)→SL₂(ℤ/m)` is Tau Ceti's `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`. The principal congruence subgroup calculation in Layer 15 must still identify its vertex and edge stabilizers and prove that the edge is a fundamental domain.

## How to read the build

The order is a construction order. Layer 0 states two general inputs on Deligne–Mumford stacks and invariant rings that no supplier states. Then build the individual-curve uniformization and generalized polygons, then integral level stacks and formal cusps. Construct coarse curves algebraically before comparing their compact complex fibres; the analytic input does not define the integral model. Hodge and descent dictionaries precede correspondence comparisons. Bad fibres give explicit degeneration data. The Jacobian carrier and actions precede cohomological rank computations, followed by Ihara, modular quotients and Taylor–Wiles control. Each named theorem retains the hypotheses of its own carrier: passing from a stack to a coarse space, from a rational comparison to an integral lattice or from an isogeny to an exact torus sequence requires the stated intervening theorem.

## Layer 0: General inputs on stacks and invariant rings

These two results are general, not modular; they are stated here because the integral modular constructions below need them at residue characteristics 2 and 3, where the stabilizers are not tame, and no supplier roadmap states them.

<a id="s0-1"></a>

### 0.1 Étale-local structure of a Deligne–Mumford stack over its coarse space

Let `𝒳` be a separated Deligne–Mumford stack, locally of finite type over a locally Noetherian scheme S, with finite inertia, and `π:𝒳→X` its coarse space (SchemeAndStackFoundations `1.23/keel_mori`). For a geometric point `x̄` of `𝒳` with automorphism group `Γ_x̄` there are an étale neighbourhood `U→X` of `π(x̄)` and a finite U-scheme V with an action of `Γ_x̄` such that `𝒳×_X U≅[V/Γ_x̄]` and `U=V/Γ_x̄`. Consequently the strict henselization of X at `π(x̄)` is the ring of `Γ_x̄`-invariants of the strict henselization of `𝒳` at `x̄`, and the same holds for their completions. The order of `Γ_x̄` need not be invertible on S.

Separated, locally of finite type, finite inertia. The tame case, with linearly reductive stabilizers and base change of coarse spaces, is `1.23/tame_local_structure`; this statement makes no base-change claim.

Establish this as follows. Take an étale chart `W→𝒳` through `x̄` and the strict henselization `X^sh` of X at `π(x̄)`. A connected component V of `W×_X X^sh` through `x̄` is finite over `X^sh`; the relation scheme `V×_𝒳` V splits as `V×Γ_x̄`, which gives the group action with quotient `X^sh`. Spread out from `X^sh` to an étale neighbourhood by limit arguments. Strict henselization is ind-étale and completion of a Noetherian local ring is flat, and invariants of a finite group commute with flat base change, which gives the invariant descriptions.

The public interface should expose:

- `DMStack.etaleLocalQuotient`: The étale neighbourhood U of `π(x̄)`, the finite U-scheme V with its `Γ_x̄`-action, the isomorphism `𝒳×_X U≅[V/Γ_x̄]` and `U=V/Γ_x̄`.
- `DMStack.coarse_strictHenselization`: `O^sh_{X,π(x̄)}=(O^sh_{𝒳,x̄})^{Γ_x̄}`.
- `DMStack.coarse_completion`: The same identity after completion.

**Checks.**

- For a scheme `𝒳=X` every `Γ_x̄` is trivial and `U=V`.
- For `X(1)` over `ℤ` at `j=0` in characteristic 2 the stabilizer has order 24, which is not invertible; the statement still applies there.
- For [Spec A/G] with G a finite constant group, the coarse space is `Spec A^G (1.23/finite_quotient_coarse)`, and the invariant description recovers its strictly henselian local rings.

*Needs:* `SchemeAndStackFoundations §1.23/keel_mori`; `SchemeAndStackFoundations §1.19`; `SchemeAndStackFoundations §1.20`; `SchemeAndStackFoundations §1.21`; `SchemeAndStackFoundations §1.23/finite_quotient_coarse`.

([Compactifying the space of stable maps](https://arxiv.org/pdf/math/9908167), Lemma 2.2.3 and its sketch of proof, pp.4–5 (arXiv v2); [The Keel–Mori theorem via stacks](https://math.stanford.edu/~conrad/papers/coarsespace.pdf), Theorem 3.1 and its proof, pp.5–6.)

<a id="s0-2"></a>

### 0.2 Regular invariants and pseudo-reflections

Let A be a Noetherian regular local ring with maximal ideal m and residue field k, and G a finite group of automorphisms of A such that the characteristic of k does not divide the order of G, G acts trivially on k, and A is a finite `A^G`-module. Then `A^G` is regular if and only if the image of G in `GL_k(m/m²)` is generated by pseudo-reflections. Here an endomorphism `σ` of a finite-dimensional k-vector space is a pseudo-reflection when `1−σ` has rank at most one.

All three hypotheses are used; at residue characteristics dividing the order of G the criterion is not asserted, and the wild calculations of §11.4 do not use it.

**Finite invariant modules.** Under the hypotheses above, prove `finiteInvariantModule_completion`: `B=A^G` is Noetherian local, A is a finite B-module, and completion identifies B̂ with `(Â)^G` and Â with `A⊗_B` B̂. Prove `regularInvariants_freeness`: B is regular exactly when A is a finite free B-module. Include the local depth/freeness and faithfully flat regularity-descent arguments in this target, for both equal and mixed characteristic.

**Checks.**

- For trivial G the finite module is B itself and the completion comparison is the identity.
- For `A=ℤ_p[[x]]` and p odd, `x↦−x` gives `B=ℤ_p[[x²]]` and A is free with basis 1,x; mixed characteristic is included.
- For `k[[x,y]]` with `char k≠2` and simultaneous negation, the singular invariant ring does not make A a free invariant module.

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), Theorem 1.1.4.1 and its Serre reference [15], Théorème I₅, p.35; the local invariant-module argument is part of this target.)

**Cotangent and inertia comparison.** With the same hypotheses and `σ∈G`, prove `tameInertiaIdeal_cotangent`: the ideal `I_σ=(σ(a)−a : a∈A)` is principal, allowing zero, exactly when `1−σ` on `m/m²` has rank at most one. Prove the tame local generation step in Serre’s criterion: B is regular exactly when G is generated by automorphisms with principal `I_σ`. Carry out this step on the local ring, including the residue-characteristic parameter in mixed characteristic; no identification of the local invariant ring with a polynomial invariant ring is assumed. The equivalent principal-inertia generation criterion is stated as `regularInvariants_iff_principalInertia` in [Suggested.lean](Suggested.lean), using Mathlib's fixed subring, regular local rings and ideals generated by the differences `σ(a)−a`.

**Checks.**

- `σ=id` gives `I_σ=0` and cotangent rank zero.
- On `ℤ_p[[x]]` for p odd, `σ(x)=−x` gives `I_σ=(x)` and cotangent rank one.
- On `k[[x,y]]` in characteristic different from two, simultaneous negation gives `I_σ=(x,y)`, which is not principal and has cotangent rank two.

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), Theorem 1.1.4.1, Remark 1.1.4.2 and Serre [15], Théorème I₅, p.35.)

Establish the regularity criterion by these finite-module and local inertia comparisons. Tame averaging and Nakayama give the cotangent-to-inertia comparison; Serre’s local invariant-theory argument supplies the generation step. This proof includes the required local algebra instead of assuming a general invariant-theory or homological theorem.

The public interface should expose:

- `regularInvariants_iff_pseudoReflection`: Under the three hypotheses, `A^G` is regular if and only if the image of G in `GL(m/m²)` is generated by pseudo-reflections.

**Checks.**

- The identity is a pseudo-reflection, since `1−id` has rank zero.
- Over a field of characteristic different from 2, `diag(−1,1)` is a pseudo-reflection and `diag(−1,−1)` is not; correspondingly `k[[x,y]]` has regular invariants `k[[x²,y]]` under the first and singular invariants `k[[x²,xy,y²]]` under the second.
- `diag(ω,ω²)` with `ω` a primitive cube root of unity is not a pseudo-reflection; its invariant ring is the singular ring of §11.4's inverse-character case.

*Needs:* Mathlib `LinearMap.range`.

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), Theorem 1.1.4.1 (Serre’s theorem) and Remark 1.1.4.2, p.35.)

### Examples

The group of order two generated by `(x,y)↦(−x,−y)` on `k[[x,y]]` contains no pseudo-reflection other than the identity, so its invariants are singular; this is the ordinary `j=1728` point of §11.3.

### Dependencies

External contracts: SchemeAndStackFoundations.

## Layer 1: Lattice uniformization of complex elliptic curves

<a id="s1-1"></a>

### 1.1 The normalized lattice Weierstrass model

For a native PeriodPair L, define `W_L` with `a₁=a₂=a₃=0`, `a₄=−L.g₂/4` and `a₆=−L.g₃/4`. Its discriminant is `L.g₂³−27L.g₃²` and is nonzero. The projective map `z↦[℘_L(z):℘′_L(z)/2:1]` off the lattice extends across each lattice point by `O=[0:1:0]` and descends to a pointed biholomorphism C/L.lattice `≅ W_L^an`. It intertwines addition with the algebraic group law.

The lattice has rank two over Z and spans C over R. Its orientation is not part of PeriodPair; choose an oriented basis only when normalizing to H.

Projective affine coordinates use the native Weierstrass equation `y²=x³−g₂x/4−g₃/4`. Totalized native ℘ values at a pole are not projective coordinates.

Establish this as follows. Use the native differential equation away from the lattice. Laurent expansions `℘=z⁻²+O(z²)`, `℘′=−2z⁻³+O(z)` give the projective extension at O. Count zeros of the elliptic function `℘−x` to obtain a two-sheeted x-map and injectivity once ℘′ is included. Its three nonzero half-periods have distinct x-values; hence the cubic discriminant is nonzero. Periodicity descends the map; compactness and the local charts show it is a biholomorphism. The explicit ℘ addition formula identifies the group laws.

The public interface should expose:

- `latticeUniformization`: A pointed analytic group isomorphism `C/Λ_L→W_L^an`.
- `latticeUniformization_zero`: The zero class maps to the projective identity.

**Checks.**

- For `z∉Λ_L`, `(℘′_L(z)/2)²=℘_L(z)³−g₂℘_L(z)/4−g₃/4`.
- The class of any lattice point maps to O, not the affine pair of totalized native function values.
- For `Λ=Z+iZ`, `g₃=0`, `W_L.a₆=W_L.c₆=0` and `j(W_L)=1728`.
- Periods 1 and 2 do not form a PeriodPair, so no elliptic `W_L` is produced by this construction.
- Verify the factors `1/2`, `1/4` and `Δ=g₂³−27g₃²` against the native equation.
- The zero lattice class maps to O; no evaluation of a native junk value is used.

*Needs:* Mathlib `PeriodPair`; Mathlib `PeriodPair.weierstrassP`; Mathlib `PeriodPair.derivWeierstrassP`; Mathlib `PeriodPair.g₂`; Mathlib `PeriodPair.g₃`; Mathlib `PeriodPair.derivWeierstrassP_sq`; Mathlib `WeierstrassCurve`; Mathlib `WeierstrassCurve.IsElliptic`; [ModularCurves Layer 1A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1a-projective-weierstrass-models); [ModularCurves Layer 1D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law); `ComplexComparisonPartII` C4.4 (`properSourceMorphismAlgebraicity`); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA).

([Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, Propositions 3.11–3.13, pp.46–47; [Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Proposition 2.9, p.4, corrected domain away from lattice poles.)

<a id="s1-2"></a>

### 1.2 Pointed elliptic uniformization

For a smooth projective Weierstrass elliptic curve `E/C` with identity O, the complex analytification of ComplexComparisonPartII C−1.1–C−1.3 is a compact connected one-dimensional complex Lie group. There is a rank-two discrete lattice `Λ⊂C` and a pointed holomorphic group isomorphism `C/Λ→E^an`. Conversely every such lattice is realized by the preceding Weierstrass model. Isomorphisms of pointed elliptic curves correspond to nonzero homotheties `uΛ=Λ′`; general holomorphic group homomorphisms correspond to complex-linear maps `z↦uz` with `uΛ⊂Λ′`, including `u=0`. Algebraic and analytic pointed morphisms agree.

The uniformization `C/Λ≅E^an` with `Λ=H₁(E^an,ℤ)`, and the description of holomorphic homomorphisms by lattice-preserving linear maps, are the dimension-one case of AbelianSchemesAndArithmeticModuli A5.1 (`AbelianLattice`, with tangent space C). This subsection adds the realization of every lattice by the Weierstrass model of §1.1, pointed isomorphisms as homotheties, and the Weierstrass coordinates.

E is smooth, projective, geometrically connected of genus one, with its algebraic group law.

Use the projective points dictionary, not only the affine solution set.

Establish this as follows. Analytify the smooth projective curve and its group maps. Proper coherent comparison (properSchemeGagaPushforward in ComplexComparisonPartII C1.9) gives `H⁰(E^an,O)=C`, hence connectedness, and compact-surface cohomology identifies its analytic genus as one; choose the nonzero algebraic invariant differential `ω`. Integrate `ω` around an oriented integral homology basis. The bilinear relation and positivity of `iω∧conjugate(ω)` make its two periods real-linearly independent. Integration from O defines `E^an→C/Λ`; it is a local isomorphism since `ω` never vanishes. Compactness and connectedness make it a covering onto the torus. Its induced homology image is the whole period lattice by definition, hence the covering has degree one. Invariance of `ω` identifies the group law. Use the explicit lattice Weierstrass map for the inverse construction. Lift pointed group maps to the universal covers; their additive holomorphic lifts are complex-linear. Proper-source morphism comparison algebraizes maps between the proper algebraic curves.

The theorem is `pointedEllipticUniformization`.

**Checks.**

- O maps to the zero class, and the map is a group isomorphism.
- A translation by a nonzero point is excluded from pointed group homomorphisms.
- At `j=0` and 1728 retain the extra pointed automorphisms.

*Needs:* [§1.1](#s1-1); [ModularCurves Layer 1A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1a-projective-weierstrass-models); [ModularCurves Layer 1D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law); `ComplexComparisonPartII` C4.4 (`properSourceMorphismAlgebraicity`); [ModularForms Layer 10B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology); [ModularCurves Layer 1C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes); `AbelianSchemesAndArithmeticModuli` A5.1 (`AbelianLattice`); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA).

([Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, pp.41–47, especially Propositions 3.12–3.13; [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1, pp.17–18.)

<a id="s1-3"></a>

### 1.3 Homotheties and lattice isogenies

If `u≠0` and `Λ′=uΛ`, then `g₂(Λ′)=u⁻⁴g₂(Λ)`, `g₃(Λ′)=u⁻⁶g₃(Λ)`, and the corresponding cubic isomorphism is `(x,y)↦(u⁻²x,u⁻³y)`. For `uΛ⊂Λ′` the induced pointed map has kernel `u⁻¹Λ′/Λ` and degree `[Λ′:uΛ]`. Its pullback sends dz on `C/Λ′` to u dz on `C/Λ`. These comparisons commute with composition, dual isogenies and the imported algebraic quotient.

u is a nonzero complex number; the inclusion of full lattices has finite index.

The coordinate change is for the forward map `z↦uz`, so its differential multiplier is u.

Establish this as follows. Reindex the absolutely convergent Eisenstein sums and ℘ series under multiplication by u. Pass to the quotients and count the kernel by the lattice index. Algebraize the pointed map using C4 and compare degrees on a finite covering. Composition gives the isogeny and differential compatibilities; identify duals by their composite with multiplication.

The theorem is `homothetyAndIsogenyCompatibility`.

**Checks.**

- For `Λ′=Λ` and `u=n`, multiplication by n has degree `n²`.
- For `u=2` with `Λ′=2Λ` the map is an isomorphism and pulls dz back to 2 dz.

*Needs:* [§1.2](#s1-2); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients); [ModularCurves Layer 1C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes); `ComplexComparisonPartII` C4.4 (`properSourceMorphismAlgebraicity`).

([Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, pp.41–47; [Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §5, Proposition 5.16, p.13.)

<a id="s1-4"></a>

### 1.4 Invariant differentials and periods

Under the normalized lattice uniformization, the algebraic invariant differential dx/(2y) pulls back to dz. For any `E/C` and nonzero invariant differential `ω`, its period homomorphism `H₁(E^an,Z)→C` has image a full lattice `Λ_ω`, and integration from O gives `E^an≅C/Λ_ω` with `ω` corresponding to dz. Changing `ω` to `cω` changes the period lattice to `cΛ_ω`. An oriented integral homology basis gives `τ=ω₂/ω₁∈H` and the usual positive Riemann bilinear area.

Use the complex orientation on `E^an` and a positively oriented homology basis.

The differential line is imported from MC1C. The period map is the concrete integration map, not an arbitrary rank-two subgroup.

Establish this as follows. Compute `dx/(2y)=d℘/℘′=dz` off the finite half-period locus and extend the equality of holomorphic forms. Pull an invariant differential back along the preceding pointed lattice uniformization; translation invariance makes it a constant nonzero multiple of dz. A lift of a homology loop ends at the corresponding lattice point, so integration identifies `H₁` with the period lattice. Positivity of `iω∧ω̄` fixes the orientation; rescaling the differential gives the homothety formula.

The theorem is `invariantDifferentialsAndPeriods`.

**Checks.**

- The invariant form is dz, whereas the modular/Tate frame used in Layer 7 is `2πi` dz.
- Rescaling `ω` changes both periods by the same scalar and leaves `τ` unchanged.

*Needs:* [§1.2](#s1-2); [§1.3](#s1-3); [ModularCurves Layer 1C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes); [ModularForms Layer 10B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology).

([Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §1, p.2; §6, Example 6.2, p.14; [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §3, Proposition 3.12, p.47.)

<a id="s1-4a"></a>

### 1.4a Sigma, quasi-periods and the oriented Legendre relation

**Lattice sigma function.** For a native `PeriodPair` L with lattice `Λ`, construct `latticeSigma` by the canonical product `σ(z)=z∏_{λ∈Λ ∖ {0}}(1−z/λ)exp(z/λ+z²/(2λ²))`. Prove normal convergence, entire oddness, `σ′(0)=1` and simple zeros exactly at `Λ`. Its logarithmic derivative is meromorphic and its negative derivative agrees with the native ℘ off `Λ`.

**Checks.**

- `σ(0)=0` and `σ′(0)=1`, fixing the multiplicative constant.
- `σ` has no zeros off `Λ`, so the quotient used in §1.5 is meromorphic with the stated divisor.
- Changing an integer basis of the same lattice does not change `σ`.

*Needs:* [§1.2](#s1-2); Mathlib `PeriodPair.weierstrassP`.

([NIST DLMF](https://dlmf.nist.gov/23.2), (23.2.4)–(23.2.8) and the zero/pole description in §23.2(ii).)

**Quasi-period and Legendre comparison.** Construct `latticeQuasiPeriod`: the additive homomorphism `η:Λ→ℂ` satisfying `(σ′/σ)(z+λ)−(σ′/σ)(z)=η(λ)` for `z∉Λ`. For a positive basis `ω₁,ω₂`, prove `latticeSigma_quasiPeriod`: `σ(z+aω₁+bω₂)=(−1)^(a+b+ab)exp(η(aω₁+bω₂)(z+(aω₁+bω₂)/2))σ(z)`, and `latticeQuasiPeriod_legendre`: `η(ω₁)ω₂−η(ω₂)ω₁=2πi`. Here `a,b∈ℤ` and `Im(ω₂/ω₁)>0`.

**Checks.**

- For either primitive basis period, the sigma multiplier includes a minus sign.
- Translating by `ω₁` then `ω₂` in either order agrees because `exp(2πi)=1`.
- Reversing the basis reverses the Legendre determinant; the displayed positive sign requires positive orientation.

*Needs:* `latticeSigma`; [§1.4](#s1-4).

([NIST DLMF](https://dlmf.nist.gov/23.2), (23.2.11)–(23.2.17); its generators are half-periods, so η here is twice its quasi-period and the Legendre determinant is 2πi.)

<a id="s1-5"></a>

### 1.5 The analytic Weil-pairing comparison

Fix `Λ=Zω₁+Zω₂` with `Im(ω₂/ω₁)>0` and `N≥1`. With the Tau Ceti pairing `e_N(S,T)=τ_S^*g_T/g_T` of Silverman III.8, where `g_T` has divisor `[N]^*(T)−[N]^*(O)` and `τ_S` is translation `X↦X+S`, `e_N((aω₁+bω₂)/N,(cω₁+dω₂)/N)=exp(−2πi(ad−bc)/N)`. This is the imported algebraic Weil pairing evaluated on the corresponding torsion sections, and is compatible with homotheties, isogenies and their duals, and change of level. In particular on `Λ_τ=Z+Zτ` the ordered frame `(τ/N,1/N)` has pairing `ζ_N=exp(2πi/N)`, and the frame `(1/N,τ/N)` has pairing `ζ_N⁻¹`.

The displayed coefficients are integers interpreted modulo N.

The sign is fixed by the Tau Ceti definition `e_N(S,T)=τ_S^*g_T/g_T`; exchanging the roles of S and T inverts every value. Conrad’s normalization `⟨τ/N,1/N⟩=ζ_N` (proof of Proposition 7.16) is the same as the Tau Ceti one; the caution there concerns Silverman’s Advanced Topics, Exercise 1.15, not the AEC III.8 divisor definition. Milne’s Lemma 8.7 uses the same frame (z/N,1/N).

The algebraic group-scheme pairing and its comparison with the equation-level pairing are MC2E inputs, not reconstructed here.

Establish this as follows. Identify N-torsion by the quotient `(1/N)Λ/Λ`. For `T=t` mod `Λ` with `λ=Nt∈Λ` take `g_T(z)=σ(Nz−t)σ(Nz)⁻¹exp(η(λ)z)`, with `σ` the Weierstrass sigma function and `η` the quasi-period homomorphism; it is `Λ`-periodic with divisor `[N]^*(T)−[N]^*(O)`. Quasi-periodicity of `σ` gives `e_N(S,T)=g_T(z+s)/g_T(z)=exp((η(λ)μ−η(μ)λ)/N)` for `μ=Ns`. Legendre’s relation `η(ω₁)ω₂−η(ω₂)ω₁=2πi` for `Im(ω₂/ω₁)>0` gives `e_N(ω₁/N,ω₂/N)=exp(−2πi/N)`; bilinearity gives every coefficient. Apply the imported algebraic isogeny and change-of-level laws.

The theorem is `analyticAlgebraicWeilPairing`.

**Checks.**

- For `N=3` on `Λ_τ`, `e(τ/3,1/3)=ζ₃` and `e(1/3,τ/3)=ζ₃⁻¹`.
- A Jacobi-theta evaluation of `g_T(z+s)/g_T(z)` for `N=3` and a sample `τ` in H returns `ζ₃⁻¹` for `S=1/3`, `T=τ/3`.
- The determinant of a changed frame is the pairing exponent.
- For `N=1` the pairing is 1 and the single trivial level is retained.

*Needs:* [§1.4a](#s1-4a); [§1.2](#s1-2); [§1.4](#s1-4); [ModularCurves Layer 2E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing).

([Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Proposition 7.16 and its proof, Remark 7.17, p.17; §8, Theorem 8.5 and Remark 8.7, pp.17–19.)

### Examples

The class of any lattice point maps to O, not the affine pair of totalized native function values.

For `Λ=Z+iZ`, `g₃=0` and `j(W_L)=1728`.

### Dependencies

External contracts: AbelianSchemesAndArithmeticModuli, ComplexComparisonPartII. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 2: Generalized elliptic curves and polygon operations

<a id="s2-1"></a>

### 2.1 Semistable genus-one curves and split polygons

A semistable genus-one curve `C/S` is proper, flat and finitely presented, with geometrically connected reduced fibres having only ordinary double points and trivial dualizing sheaf. Its smooth locus is `Cˢᵐ`. Every singular geometric fibre of a semistable genus-one curve is a standard polygon; the smooth fibres are genus-one curves. The standard m-gon `C_m` is AdicSpacesPartIII's `EllipticModuli.nGon S m`: infinity on the ith `P¹_S` glued to zero on the `(i+1)st`, indexed by `Z/mZ`, with its normalization, its smooth locus `C_mˢᵐ=G_m×Z/mZ` and its base change (`nGon_normalization`, `nGon_smoothLocus`, `nGon_smoothPoints`, `GroupCurve.baseChange_polygon`). This subsection adds the semistable-curve carrier, the classification of its singular fibres and the integral plane equation of the one-gon. For `m=1` the gluing identifies two distinct sections of one `P¹`; an integral plane model is `y²z+xyz=x³`, with identity [0:1:0].

`m≥1` and S is arbitrary; `m=1` is a self-gluing, not a cycle with two independent components.

The nodal-curve, normalization, dual-graph and dualizing-sheaf machinery is imported from TauCetiRoadmap StableReduction Layers 1–3. No chosen identity or group law is part of the semistable-curve definition.

Establish this as follows. Use nodal gluing of marked `P¹` components, including the two distinct branches in the one-component case. Compute arithmetic genus from the StableReduction normalization exact sequence and dual-graph formula, and identify the dualizing sheaf using differentials with opposite residues at each glued pair. For a singular connected nodal curve with trivial dualizing sheaf, the StableReduction componentwise degree formula forces every rational component to have valency two; its dual graph is a cycle, so the fibre is a standard polygon. Smooth genus-one components cannot carry a node under the same formula.

The public interface should expose:

- `SemistableGenusOneCurve`: The proper flat finitely presented curve with the stated geometric-fibre conditions.
- `SemistableGenusOneCurve.singularFibre_isPolygon`: Every singular geometric fibre is isomorphic to a standard polygon `nGon`.
- `nGon_isSemistableGenusOne`: The standard m-gon is a semistable genus-one curve.
- `nGon_one_equation`: The one-gon identifies with `y²z+xyz=x³`.

**Checks.**

- For `m=1`, the normalization is one `P¹` and the node has two distinct preimages; `x=t(t+1)`, `y=t²(t+1)` gives the plane equation.
- The tangent cone at `(0,0)` is `y(y+x)`, so the two branches remain distinct in characteristic two.
- The integral one-gon equation has `b₂=1`, `b₈=0` and `Δ=0`.
- `C₃` has three geometric irreducible components and three nodes.
- The cuspidal cubic `y²z=x³` is excluded because its singularity is not an ordinary double point.
- The split one-gon has two normalization preimages at its node, in every characteristic.
- The structure sheaf and the singular scheme are retained over nonreduced bases.

*Needs:* AdicSpacesPartIII R2.11 (`EllipticModuli.nGon`, `nGon_normalization`, `nGon_smoothLocus`); [StableReduction Layer 1](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs); [StableReduction Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity); [StableReduction Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves).

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), II §§1.1–1.5, pp.173–176; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 2.1.2, p.4, and the standard polygons, pp.4–5.)

<a id="s2-2"></a>

### 2.2 Generalized elliptic curves

The carrier is AdicSpacesPartIII's `GeneralisedEllipticCurve S`: a proper flat finitely presented curve whose geometric fibres are elliptic curves or standard polygons, with an action `Eˢᵐ×_S E→E` of its smooth locus that restricts to a commutative group law on `Eˢᵐ` and rotates the components of every singular geometric fibre, together with `EllipticModuli.GroupCurve`, `GroupCurve.Iso`, `GroupCurve.baseChange` and `ofElliptic`. This subsection proves Deligne–Rapoport's description of the same objects and adds their homomorphisms. A generalized elliptic curve `E/S` is equivalently a semistable genus-one curve with a commutative S-group structure on `Eˢᵐ` and an action `Eˢᵐ×_S E→E` extending translation on `Eˢᵐ`, such that on each singular geometric fibre translation rotates the components, equivalently acts trivially on `Pic⁰` and transitively on the components. Its identity is a section of `Eˢᵐ`. A homomorphism is an S-map carrying smooth locus to smooth locus, inducing a group homomorphism there and respecting the action. The standard m-gon has `(u,i)(v,j)=(uv,i+j)` on its smooth locus; this action extends to the glued curve. Smooth generalized elliptic curves recover the imported elliptic-curve group-scheme carrier.

S is arbitrary; the smooth group is usually not proper. The complete curve is not itself a group scheme in the degenerate case.

The compatibility with the rotation action is part of the data and does not follow from putting any group structure on `Eˢᵐ`.

Establish this as follows. A geometric fibre of a semistable genus-one curve is smooth of genus one or a standard polygon by §2.1, which gives the equivalence of the two fibre conditions. Extend multiplication on each `G_m` component of the split polygon to the corresponding `P¹` and check agreement at the glued sections. Descend the group and action along fppf trivializations, using the generic descent supplier. On a smooth fibre the curve equals its smooth locus and the data are precisely a pointed genus-one group scheme.

The public interface should expose:

- `GeneralisedEllipticCurve.toSemistableGenusOneCurve`: The underlying curve of a generalized elliptic curve is a semistable genus-one curve.
- `GeneralisedEllipticCurve.ofDeligneRapoport`: A semistable genus-one curve with a commutative group law on its smooth locus and an extending action that rotates the components of the singular geometric fibres is a generalized elliptic curve, uniquely.
- `GeneralisedEllipticCurve.Hom`: Smooth-locus-preserving equivariant group morphisms.
- `GeneralisedEllipticCurve.Hom.baseChange`: Pullback of homomorphisms, compatible with composition and with `GroupCurve.baseChange`.

**Checks.**

- The one-gon has smooth group `G_m`, with identity at `u=1`.
- If every fibre is smooth, `Eˢᵐ=E` and this is an ordinary elliptic curve.
- Pulling back twice identifies with pullback along the composite, including the action.
- Contracting a component may send its smooth points to a node, so the curve map need not be a homomorphism.
- The standard group law extends to every component and both branches at a node.
- A contraction may send smooth points to nodes and is not automatically a homomorphism under this definition.

*Needs:* [§2.1](#s2-1); AdicSpacesPartIII R2.11 (`GeneralisedEllipticCurve`, `EllipticModuli.GroupCurve`, `GroupCurve.baseChange`, `ofElliptic`); [ModularCurves Layer 1D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `SchemeAndStackFoundations Layer 1`.

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), II §§1.1–1.12, pp.173–178; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 2.1.4, p.5; §2.2, pp.7–8.)

<a id="s2-3"></a>

### 2.3 Automorphisms and torsion of split polygons

For `m≥1`, the group scheme of automorphisms of the generalized m-gon is `μ_m×(Z/2Z)_S`. A root `ζ` acts by `(u,i)↦(ζ^i u,i)`, and the other factor acts by `(u,i)↦(u⁻¹,−i)`; the two actions commute. Its rank is 2m and its `μ_m` factor is not étale at primes dividing m. For `N≥1`, `C_mˢᵐ[N]=μ_N×(Z/mZ)[N]`, of finite locally free rank N `gcd(N,m)`. It has rank `N²` exactly when N divides m. These formulas are group-scheme identities compatible with arbitrary base change.

The constant `Z/2` factor remains étale in characteristic two; `μ_m` is the possible infinitesimal factor.

Do not replace `μ_m` by its geometric-point set in bad characteristic.

Establish this as follows. An automorphism fixes the identity, permutes components through a group automorphism and preserves their cyclic adjacency. The action condition leaves component permutation `i↦i` `or −i`. On each component, equivariance gives `u↦c_i` u or `c_i/u`; compatibility forces `c_i=ζ^i` with `ζ^m=1`. Check directly that inversion commutes with this scaling. Compute the N-kernel separately on `G_m` and the constant component group. The latter has `gcd(N,m)` elements.

The theorem is `neronPolygonAutomorphisms`.

**Checks.**

- For `m=5` over C there are ten automorphisms and the two factors commute.
- For `m=p` in characteristic p the automorphism scheme has rank 2p but only two geometric points.
- For `N=2` on a one-gon the torsion rank is two, not four.

*Needs:* [§2.2](#s2-2); [ModularCurves Layer 0B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality).

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), II 1.10, pp.177–178; 1.20, p.184; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 2.1.6, p.7; Lemma 2.1.11, p.8; [Bakker–Tsimerman, preprint](https://arxiv.org/pdf/1403.7168v2), §2.2, pp.5–6.)

<a id="s2-4"></a>

### 2.4 The degeneration scheme and polygon strata

For a generalized elliptic curve `E/S` define `Eˢⁱⁿᵍ` by `Fitt₁(Ω¹_E/S)` and define `S∞` as its schematic image in S. Formation of these closed subschemes commutes with arbitrary base change. The degeneration scheme decomposes into open and closed strata `S∞_m` on which the geometric fibres are m-gons; `Eˢⁱⁿᵍ→S∞_m` is finite étale of degree m. Over `S∞_m` the curve is fppf locally the split m-gon, including when `S∞_m` is nonreduced. The complement `S ∖ S∞` is the largest open elliptic locus.

The statement is about schematic degeneration, not just its reduced support.

The locally constant polygon count is on `S∞`, not necessarily on all of S.

Establish this as follows. Compute `Fitt₁` and its image on a split polygon and on an étale node chart `xy=a`. Use translation to transport a node and its local deformation ideal to all components, making their schematic images agree. The polygon trivialization over that image identifies the finite node cover. Descend these identifications and their base-change equalities; the local chart describes the complement exactly.

The theorem is `nonSmoothLocusAndBaseChange`.

**Checks.**

- The split m-gon over S has `S∞=S`, not `S_red`.
- A smooth elliptic family has empty degeneration scheme.
- Node count and the locally split description persist after any base change.

*Needs:* [§2.2](#s2-2); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); [StableReduction Layer 1](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 2.1.8, Lemma 2.1.10 and Theorem 2.1.12, p.6; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Remark 2.1.8 and Lemma 2.1.10, pp.7–8.)

<a id="s2-5"></a>

### 2.5 The translation structure criterion

Let `C/S` be semistable genus one with section e in `Cˢᵐ`. If a commutative flat locally finitely presented S-group G acts on C, acts trivially on the algebraic space `Pic⁰_{C/S}` and, on every geometric fibre, transitively on the irreducible components, then C has a unique generalized elliptic structure with identity e for which G acts by translations. An automorphism commuting with G is translation by its value at e PROVIDED it also acts trivially on `Pic⁰`. Equivalently, an ample finite locally free Cartier divisor `D⊂Cˢᵐ` with a group law and extending action gives this structure precisely when its action on `Pic⁰` is trivial; for such finite locally free D the triviality may be checked on geometric fibres, and the locus where it holds is open and closed in S.

Both the group-action condition and, for the automorphism conclusion, the automorphism’s `Pic⁰` condition are required.

The divisor version requires D to meet every component.

Establish this as follows. On geometric fibres, the transitive component action and `Pic⁰` condition reduce the action to translations on the standard polygon or smooth genus-one curve. Use the section e to rigidify the possible structure and descend the fibrewise translation laws and extending action. For the automorphism conclusion subtract the translation by `α(e)`. The remaining automorphism fixes e, acts trivially on `Pic⁰` and still commutes with G. Its restriction to the identity component is the identity; commutation with the component-transitive G-action then makes it the identity on every component. Over the base use the same fppf translation charts to obtain equality, including nilpotents.

The theorem is `deligneRapoportStructureCriterion`.

**Checks.**

- For a smooth elliptic curve and `G=1`, inversion commutes with G but is not translation in characteristic zero.
- An ample subgroup on the standard polygon recovers its standard group/action.
- On `C₃/ℂ`, `(u,i)↦(ζ₃^i u,i)` fixes e and `Pic⁰` but is nonidentity; it fails to commute with translation by `(1,1)`, so the centralizer hypothesis excludes it.

*Needs:* [§2.1](#s2-1); [ModularCurves Layer 1D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `ComplexComparisonPartII` C3.2d.2 and C3.2f.1–C3.2f.2 (relative Picard sheaf and neutral component); [StableReduction Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity).

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), II Théorème 3.2, pp.193–194; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.2.2 and Corollary 2.2.3, pp.7–8.)

<a id="s2-6"></a>

### 2.6 Contraction along a positive Cartier divisor

Let `D⊂Eˢᵐ` be finite locally free over S, a relative effective Cartier divisor of positive degree on every geometric fibre. Define `c_D:E→E_D` by the relative Proj of `⊕_{r≥0}f_*O_E(rD)`. It contracts exactly the components missed by D, commutes with arbitrary base change and is unique with the stated contraction property. It identifies the preimage of `E_Dˢᵐ` with `E_Dˢᵐ`. If D is a subgroup, `E_D` has a unique generalized elliptic structure making this identification a group isomorphism, and the image of D is ample. If E is smooth or D meets every component, `c_D` is an isomorphism.

The positivity condition excludes the empty divisor. D need not meet every component before contraction.

The map `c_D` need not carry all of `Eˢᵐ` to `E_Dˢᵐ`; it is not asserted to be a generalized-curve homomorphism.

**Arbitrary-base contraction comparison.** For a finitely presented generalized elliptic curve `E/S` and a finite locally free relative effective Cartier divisor `D⊂Eˢᵐ` of positive fibre degree, prove `generalizedContraction_noetherianApproximation`: locally on S descend the curve, divisor and generalized structure to a locally Noetherian model using ModularCurves Layer 0E. Construct the contraction there using StableReduction Layers 2–3. Prove that the positive Veronese section algebras commute with arbitrary base change, and that their relative Proj and contraction map are independent of the descended model and the positive Veronese chosen. The identifications satisfy identity and composition, so the local contractions glue over arbitrary S.

Use genus-one duality and positivity to obtain `H¹(E_s,O(rD_s))=0` for `r>0`, including when some components have degree zero. Cohomology and base change gives locally free positive-degree pieces on the Noetherian model; uniform generation and nodal computations give the relative Proj contraction. Transport these comparisons to arbitrary bases and compare any two descended models over a common refinement. For a subgroup, translations preserve the retained components and descend; the structure criterion gives the generalized group/action and uniqueness.

**Checks.**

- Over `Spec ℤ[x₁,x₂,…]`, the constant three-gon with `D={identity}` is pulled back from `ℤ` and contracts to the constant one-gon.
- For any ring R and `R→R[ε]/(ε²)`, the constant three-gon contraction with `D={identity}` retains that same one-gon, including its nilpotent base structure.
- On a smooth elliptic curve with `D={identity}`, the third and sixth Veronese section algebras have different graded pieces but both give the original curve with contraction map the identity.

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), IV §§1.1–1.6, pp.205–209, especially Proposition 1.2; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §3.2.1, pp.18–19.)

The public interface should expose:

- `contractGenusOne`: `E_D` with `c_D` and its relative Proj description.
- `contractGenusOne_retainedSmooth`: `c_D⁻¹(E_Dˢᵐ)≅E_Dˢᵐ`.
- `contractGenusOne_baseChange`: Arbitrary-base-change identification of contractions.
- `contractGenusOne_universal`: Uniqueness among curve contractions retaining exactly the D-components.
- `contractGenusOne_subgroup`: The unique generalized elliptic structure when D is a subgroup.

**Checks.**

- On a smooth elliptic curve a positive finite divisor contracts nothing.
- For a split three-gon and `D={identity}`, only the identity component survives and the target is a one-gon.
- If D meets every component, `c_D` is the identity up to the specified unique isomorphism.
- The empty divisor has degree zero and does not satisfy this construction’s hypotheses.
- Retain the distinction between generic projective-curve contraction and the special generalized-curve structure.
- A smooth point on a discarded component may map to a node.

*Needs:* [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); [§2.2](#s2-2); [§2.5](#s2-5); [StableReduction Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity); [StableReduction Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves); [ModularCurves Layer 0A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors).

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), IV §§1.1–1.6, pp.205–209; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.1, p.7 (end of the section); [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §3.2, 3.2.1 and Theorem 3.2.4, pp.19–21.)

<a id="s2-7"></a>

### 2.7 Finite subgroup quotients of generalized curves

For a finite locally free subgroup `K⊂Eˢᵐ`, construct the quotient `E/K` as a generalized elliptic curve with a finite surjective universally open homomorphism `E→E/K` whose smooth-locus restriction is the finite locally free group quotient by K. Its kernel is K and its formation commutes with arbitrary base change. If a geometric fibre of E is an m-gon, the quotient has `m/h` components, where h is the order of the image of K in its constant component group. On a split m-gon, quotient by `μ_d` in the identity component sends `u↦u^d` on every component and retains m components. The TOTAL curve map need not be flat at nodes.

K is contained in the smooth locus and is finite locally free, including nonétale K.

The target is S-flat; this does not say that the finite quotient morphism between complete curves is flat.

Establish this as follows. Work fppf locally with the split polygon and separate `K∩G_m` from its component image. Take diagonalizable invariants for the former and the free component quotient for the latter. Check the invariant rings at the nodes and show compatibility with base change. Descend the resulting proper curve and its smooth group/action. Recover the kernel and universal property on the smooth locus; equivariance and density give uniqueness on the complete curve.

The public interface should expose:

- `generalizedEllipticQuotient`: `E/K` with its quotient homomorphism.
- `generalizedEllipticQuotient_kernel`: The smooth group kernel is K.
- `generalizedEllipticQuotient_universal`: Factorization of homomorphisms killing K.
- `generalizedEllipticQuotient_baseChange`: Formation commutes with arbitrary base change.
- `generalizedEllipticQuotient_components`: The quotient component count is `m/h`.

**Checks.**

- Quotient by the identity subgroup is E.
- `C_m/μ_d` retains m components and maps u to `u^d`.
- Quotient `C₆` by the constant subgroup of order three in its component group has two components.
- For `d>1`, `u↦u^d` on a one-gon is not flat at the node; its nodal fibre length differs from the generic degree d.
- Separate target flatness from flatness of the finite quotient morphism.
- The construction imports the ordinary elliptic quotient rather than replanning it.

*Needs:* [§2.2](#s2-2); [§2.3](#s2-3); [ModularCurves Layer 0B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); [ModularCurves Layer 0C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors); [StableReduction Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Theorem 2.2.4, Corollary 2.2.7 and Definition 2.2.8, pp.10–14.)

<a id="s2-9"></a>

### 2.9 Algebraization of formal polygon families

Let A be Noetherian and complete for an ideal I of definition, and let `E_r/A/I^(r+1)` be a compatible system of generalized elliptic curves whose degenerate geometric fibres all have a fixed number m of components. There is a unique generalized elliptic curve `E/A` inducing this system, up to the uniquely compatible isomorphism. The construction and the equivalence on objects and isomorphisms use algebraization of proper curves and finite ample torsion data; they do not apply proper GAGA to the nonproper smooth group `Eˢᵐ`.

`m≥1` is fixed. The underlying proper formal curve and the compatible smooth-locus identities/actions are part of the system.

This target concerns compatible objects and isomorphisms; it does not assert an unrestricted algebraization theorem for every nonproper group morphism.

Establish this as follows. The m-torsion on each m-gon is finite of rank `m²` and gives an ample divisor. Algebraize the proper curve with this ample marking by Grothendieck’s algebraization theorem (AdicSpacesPartIII §F0.8/grothendieck-algebraization). Algebraize the finite torsion divisor as a closed subscheme and the group law and its action as morphisms with proper source (SchemeAndStackFoundations §4.10, `Formal.algebraize_hom` and `Formal.grothendieck_existence`). Apply the translation structure criterion to recover the generalized elliptic structure. Use the uniqueness part of proper formal algebraization and the rigidified action criterion to identify every `E_r` and all compatible isomorphisms.

The theorem is `formalPolygonAlgebraization`.

**Checks.**

- For `A=ℤ_p` and `I=(p)`, the constant pointed one-gons over `A/p^(r+1)` reconstruct the constant one-gon over `ℤ_p` with its standard multiplication action.
- The constant two-gons over `ℤ_p/p^(r+1)`, with rotation `(u,i)↦(u,i+1)`, reconstruct the constant two-gon and that rotation over `ℤ_p`.
- On the constant two-gon over `ℤ₂`, the automorphism `(u,i)↦((−1)^i u,i)` is the identity modulo 2 but is nonidentity modulo 4. Its compatible reductions algebraize to this nonidentity component scaling.

*Needs:* [§2.2](#s2-2); [§2.3](#s2-3); [§2.5](#s2-5); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `AdicSpacesPartIII §F0.8/grothendieck-algebraization`; `SchemeAndStackFoundations §4.10/Formal.grothendieck_existence`; `SchemeAndStackFoundations §4.10/Formal.algebraize_hom`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Corollary 2.2.4, pp.8–9; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 3.4.1, p.25; Theorem 3.4.2 and proof, pp.26–27.)

<a id="s2-11"></a>

### 2.11 Polygon-count stacks and decontractions

For `m≥1` define `Ell_m` over Z to classify generalized elliptic curves whose degenerate fibres are m-gons. This is a proper smooth Artin stack of relative dimension one with finite diagonal. Its boundary is a reduced effective Cartier divisor, with standard-polygon inertia `μ_m×Z/2`, and its largest Deligne–Mumford open removes the boundary fibres at primes dividing m. For `n,m≥1` contraction with respect to `Eˢᵐ[n]` defines `Ell_nm→Ell_n`, a proper flat finitely presented surjection with relative boundary inertia `μ_m`; it need not be representable. For `E/S` in `Ell_n`, its m-fold decontraction stack is the 2-fibre product `S×_Ell_n Ell_nm`, carrying the universal curve and contraction isomorphism. It commutes with arbitrary base change.

On an nm-gon the n-torsion meets n components, so the contraction has n-gon target.

The elliptic open is shared by all `Ell_m`. The largest DM open concerns the polygon stack, not the refined level stack.

Establish this as follows. Use an ample finite subgroup marking, the SchemeAndStackFoundations §4.14 Hilbert scheme of the tricanonically embedded curves and the SchemeAndStackFoundations §§1.18–1.20 algebraic-stack interface. Its frame cover is a `GL_r` torsor, not a projective-space bundle. The structure criterion cuts out the generalized-curve data. Use the nodal deformation parameter and finite polygon automorphism scheme to prove smoothness, boundary Cartier structure and the valuative properness statement. Construct the contraction tower from the divisor contraction. Compute its kernel `μ_m` on a split polygon; prove properness/flatness locally and descend. The universal 2-fibre product gives decontractions and all their compatibilities.

The public interface should expose:

- `polygonCountStack`: `Ell_m` and its universal generalized elliptic curve.
- `polygonCountStack_boundary`: The reduced Cartier boundary and standard-gon chart.
- `polygonCountStack_contraction`: `Ell_nm→Ell_n` with the displayed properties.
- `polygonDecontractionStack`: The 2-fibre product of a curve with the contraction tower.
- `polygonDecontractionStack_universal`: Objects are decontractions equipped with the specified contraction isomorphism.
- `polygonDecontractionStack_baseChange`: Exact 2-fibre-product base-change compatibility.

**Checks.**

- `Ell₁` is DM over Z, with one-gon inertia `Z/2`.
- `Ell_p` has nonétale `μ_p` boundary inertia in characteristic p and is not DM there.
- For `m=1` the decontraction is the identity 2-fibre product.
- `Ell₆→Ell₃` has boundary kernel `μ₂`, so it is not representable even over C.
- The generic curve-stack construction is imported; this subsection owns only the polygon-count specialization and tower.
- A proper flat stack morphism is not automatically representable or finite.

*Needs:* [§2.2](#s2-2); [§2.3](#s2-3); [§2.4](#s2-4); [§2.6](#s2-6); [§2.9](#s2-9); `SchemeAndStackFoundations Layer 1`; `SchemeAndStackFoundations Layer 4`; [StableReduction Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity); [StableReduction Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Theorem 3.1.6 and Remark 3.1.7, p.17; Theorem 3.2.4, p.21; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §3.1, pp.18–22.)

**Smooth-locus-preserving torsion decontraction.** For `E/S` generalized elliptic and `N≥1`, prove `generalizedTorsionDecontraction`: fppf locally on S there is E′ whose degenerate polygon counts are divisible by N and a contraction `E′→E` identifying `Eˢᵐ` with an open subgroup of `E′ˢᵐ`. Every finite locally free subgroup of `Eˢᵐ`, together with its section-divisor data, is thereby retained. Construct this from the proper flat surjective polygon-count tower; it uses no Drinfeld generator-rank or level-map theorem.

**Checks.**

- Starting from a one-gon and `N=p` gives a p-gon decontraction whose smooth group contains the original `G_m` as an open subgroup, including in characteristic p.
- At `N=1` the original curve already satisfies the divisibility requirement.
- `E′ˢᵐ[N]` has rank `N²`, while `Eˢᵐ[N]` need not; the embedding does not identify the two full torsion groups.

*Needs:* the polygon-count contraction tower of §2.11; [§2.6](#s2-6); [§2.9](#s2-9).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Corollary 3.2.6, p.22, and its use in Proposition 4.2.7, p.31.)

<a id="s2-10a"></a>

### 2.10a Torsion congruences and full-set transport

For `E/S` generalized elliptic and `N≥1` dividing every degenerate geometric polygon count, prove `generalizedTorsionTransport`: fppf locally on S there is a smooth elliptic family E′ with `Eˢᵐ[N]≅E′[N]` as finite locally free group schemes. Transport the ordinary Cartier-divisor full-set identities through this comparison: full-set, subgroup-divisor and cyclic-generator conditions agree in the corresponding smooth one-dimensional ambient groups and descend from the fppf cover. Include nilpotent bases and compatibility with every finite infinitesimal base change. The transport uses the ordinary full-set API and does not assume generalized generator ranks or contraction-compatible level maps.

Establish this as follows. On the elliptic locus take `E′=E`. Near a degenerate fibre work strictly henselian locally and use the polygon torsion and connected–étale sequence to split `Eˢᵐ[N]` fppf locally as `μ_N×ℤ/N`. Lift an ordinary elliptic curve with this split torsion and trivialize its extension fppf locally. Use the ordinary full-set comparison for closed subgroup divisors in smooth relative curves and descend the identities. The torsion isomorphism is an fppf comparison, not a claim that every polygon admits a chosen smooth deformation with the same levels.

**Checks.**

- Over a characteristic-p base with `N=p` dividing the polygon count, the comparison includes `μ_p×ℤ/p` and its nonreduced divisor data.
- If N does not divide the polygon count, `Eˢᵐ[N]` can have rank `N·gcd(N,m)<N²`, so this comparison does not apply.
- The comparison holds over nilpotent thickenings, rather than merely identifying torsion on geometric points.

*Needs:* [§2.2](#s2-2); [§2.3](#s2-3); [§2.7](#s2-7); [§2.9](#s2-9); MC3C, MC7E and MC8B (ordinary full sets, connected–étale torsion and cyclic generators).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 4.2.1 and its proof, p.29, and the transfer arguments of Propositions 4.2.5 and 4.2.7, pp.30–31.)

<a id="s2-8"></a>

### 2.8 Drinfeld structures on the smooth locus

A Drinfeld A-structure on `Eˢᵐ` is a homomorphism `α:A→Eˢᵐ(S)` for which `D_α=∑_{a∈A}[α(a)]` is a finite locally free subgroup and a relative effective Cartier divisor of rank #A. It is ample when `D_α` meets every geometric component. A cyclic subgroup of order N is a finite locally free subgroup locally admitting a Drinfeld Z/N-generator; its generator scheme is finite locally free of rank `φ(N)`. For `d|N` its standard order-d subgroup and cyclic quotients are generator-independent and compatible with base change. These extend the existing MC3C/8B carriers to `Eˢᵐ`; they are not new definitions of general Drinfeld full sets. Over `ℤ[1/d]`, an ample Drinfeld `ℤ/N`-generator with an invertible factor `d≥5` of N, and over `ℤ[1/N]` an ample full `(ℤ/N)²`-structure, are exactly AdicSpacesPartIII's `GeneralisedEllipticCurve.LevelStructure`; the definition here extends them to every base, including residue characteristics dividing N.

Repeated sections and nonétale subgroup divisors are allowed. “Basis” is not an assertion of injectivity on geometric points.

For a full `(Z/N)²` structure require `D_α=Eˢᵐ[N]`; the torsion has rank `N²` only when N divides the polygon count.

Establish this as follows. Apply the imported full-set/divisor definition on the smooth relative curve and use the polygon torsion calculation on degenerate fibres. Use `generalizedTorsionTransport` of §2.10a to transfer the generator-scheme and cyclicity results from the ordinary elliptic locus. For a cyclic subgroup of rank N, use `generalizedTorsionDecontraction` of §2.11 to embed the smooth group fppf locally in one with torsion of rank `N²`; prove ranks by fppf descent from the ordinary generator theorem. Check standard subgroup and quotient identities by generator changes; descend using their generator independence.

The public interface should expose:

- `GeneralizedDrinfeldStructure`: `α` together with the subgroup-divisor equality.
- `GeneralizedDrinfeldStructure.ample`: The divisor meets every geometric component.
- `GeneralizedCyclicSubgroup.generators`: The Drinfeld-generator scheme `G×`.
- `GeneralizedCyclicSubgroup.standardSubgroup`: The canonical subgroup of each divisor order.
- `GeneralizedCyclicSubgroup.generators_rank`: `G×` has finite locally free rank `φ(N)`.
- `GeneralizedDrinfeldStructure.smoothComparison`: On elliptic families it is exactly the imported level structure.
- `GeneralizedDrinfeldStructure.levelStructure`: On the range of `GeneralisedEllipticCurve.LevelStructure` the two notions agree.

**Checks.**

- The generator scheme of `μ_N` is cut out by `Φ_N` and has rank `φ(N)`.
- In characteristic p, repeated zero sections may be a valid full set for an infinitesimal p-subgroup.
- For an elliptic curve in characteristic different from two, `E[2]` is not cyclic of order four.
- In characteristic p, `μ_p×Z/p` may be cyclic in the Drinfeld sense; geometric-point injectivity is not the criterion.
- The generator locus is a scheme, including its nonreduced fibres.
- A cyclic subgroup’s standard subgroups are independent of a choice of generator.

*Needs:* [§2.11](#s2-11) (`generalizedTorsionDecontraction`); [§2.10a](#s2-10a); [§2.6](#s2-6); [§2.7](#s2-7); [§2.2](#s2-2); [§2.3](#s2-3); [ModularCurves Layer 3C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#3c-the-four-level-structures); [ModularCurves Layer 8B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#8b-generator-schemes-and-the-cyclicity-theorem); [ModularCurves Layer 8D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n); [ModularCurves Layer 0B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.3 and Theorem 2.4.5, pp.10–16, using the bad-characteristic argument of Česnavičius §4.2; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §4.2, pp.29–36.)

<a id="s2-10"></a>

### 2.10 Contraction-compatible level extension and ranks

Using the generalized Drinfeld structures and generator ranks of §2.8, prove the contraction-compatible level-map rank statements. In particular full Nm-structures reduce to full N-structures with finite locally free lifting rank `|GL₂(Z/Nm)|/|GL₂(Z/N)|`, full N-structures forget to ample `Γ₁(N)`-structures with rank `Nφ(N)`, and cyclic order-N subgroups have finite locally free generator schemes of rank `φ(N)`. When polygon counts differ, use the contraction/decontraction interface rather than an unproved smoothing of a prime-to-characteristic polygon.

`N,m≥1`. Reduction of levels on a family includes the necessary contraction; an uncontracted N-frame need not be ample.

Rank statements are statements about the relative level functors after the indicated contraction, not merely counts on geometric points.

Establish this as follows. Apply §2.10a’s torsion/full-set transport and §2.8’s generator-scheme theory. In the p-power cyclic lifting step, a generator Q at exponent e must first be lifted to Q′ with `p^(r−e)Q′=Q`; it is Q′ that carries the lifted Drinfeld `ℤ/pʳ`-structure. Prove representability, finite flatness and the lifting rank on the ordinary comparison cover, then descend. Use standard subgroup and quotient identities, then contraction, to pass among polygon counts. Česnavičius’s proof removes the prime-to-characteristic restriction left in the older deformation argument.

The theorem is `torsionCongruencesAndLevelExtension`.

**Checks.**

- The mixed-characteristic case with p dividing the polygon count is included.
- At `N=3`, forgetting one vector of a full frame has rank `3φ(3)=6`.
- At prime p, full lifting from level one has rank `|GL₂(F_p)|=(p²−1)(p²−p)`.

*Needs:* [§2.10a](#s2-10a); [§2.6](#s2-6); [§2.8](#s2-8); [§2.9](#s2-9); [ModularCurves Layer 3C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#3c-the-four-level-structures); [ModularCurves Layer 8B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#8b-generator-schemes-and-the-cyclicity-theorem); [ModularCurves Layer 7B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes); [ModularCurves Layer 0B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 4.2.1 and Propositions 4.2.5, 4.2.9, 4.2.11 and 4.2.12, pp.29–35; remark before Proposition 4.2.11, p.33; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.4.5, pp.15–16, with the bad-characteristic replacement in Česnavičius §4.2.)

### Examples

For `m=1`, the normalization is one `P¹` and the node has two distinct preimages; `x=t(t+1)`, `y=t²(t+1)` gives the plane equation.

The tangent cone at `(0,0)` is `y(y+x)`, so the two branches remain distinct in characteristic two.

`C₃` has three geometric irreducible components and three nodes.

### Dependencies

External contracts: AdicSpacesPartIII, AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, SchemeAndStackFoundations. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 3: Integral level stacks and the open analytic comparison

<a id="s3-1"></a>

### 3.1 Integral full, point and cyclic level structures

On a generalized elliptic curve define: full `Γ(N)` level as an ample Drinfeld `(Z/N)²`-structure with divisor `Eˢᵐ[N]`; `Γ₁(N)` level as an ample Drinfeld Z/N-generator P; and naive `Γ₀(N)` level as an ample cyclic subgroup `G⊂Eˢᵐ` of order N. Full level forces an N-gon at degeneration. The point and naive cyclic levels permit exactly polygon counts dividing N. For arbitrary `N,n≥1`, a mixed `Γ₁(N;n)` structure is a cyclic order-N subgroup G with generator P and a cyclic order-n subgroup H, with `[G_d+H_d]=Eˢᵐ[d]` for `d=gcd(N,n)`, and with `[G+H]` an ample Cartier subgroup divisor of rank Nn. The condition is on subgroup divisors, including nilpotents. Full fixed pairing is the determinant fibre described separately below.

The mixed condition is allowed for all N,n, using the Česnavičius definition; the older Conrad restricted admissible pairs are only a comparison subcase.

Ampleness is essential on generalized curves. No geometric-point order test replaces the Drinfeld divisor condition.

Establish this as follows. Use the generalized Drinfeld and cyclic-subgroup carriers. Apply the polygon torsion rank formula and ampleness to obtain the allowed component counts. Form standard d-subgroups, impose their full d-torsion span and define the sum divisor locally from generators; use generator independence to descend. On the elliptic open recover precisely the existing MC3C/8D full, point and cyclic levels.

The public interface should expose:

- `GeneralizedFullLevel`: An ample full Drinfeld frame with the N-torsion divisor equality.
- `GeneralizedPointLevel`: An ample Drinfeld generator of order N.
- `GeneralizedNaiveCyclicLevel`: An ample cyclic order-N subgroup.
- `GeneralizedMixedLevel`: P,G,H with the d-torsion span and ample sum divisor.
- `generalizedLevel_smoothComparison`: The elliptic open is the imported ordinary level functor.
- `generalizedFullLevel_polygonCount`: A degenerate full-level object has exactly N components.

**Checks.**

- At `N=1` the full compactification has one-gon degeneration and no rigidifying level.
- On `C₂` over C, `P=(1,1)` gives an ample point of order two.
- `μ_N` in the identity component of `C₂` is not ample, so it is not a naive `Γ₀(N)` boundary level.
- For `N=n=p²`, a full `p²`-torsion decomposition satisfies the mixed definition; it is not excluded by n being nonsquarefree.
- The three naive levels are kept separate from the refined `Γ₀` model.
- Every allowed component count follows from torsion rank and ampleness.

*Needs:* [§2.3](#s2-3); [§2.8](#s2-8); [§2.10](#s2-10); [ModularCurves Layer 3C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#3c-the-four-level-structures); [ModularCurves Layer 8D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §1.2, p.2; §2.4, pp.14–16; §3.2, pp.23–26; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §§4.3.1, 4.4.1 and 4.6.1, pp.37, 39 and 44.)

<a id="s3-2"></a>

### 3.2 Proper flat integral level stacks

The stacks `Xfull(N)`, `X₁(N)`, `X₁(N;n)` and `X₀(N)^naive` of the preceding levels are proper flat finitely presented Artin stacks over Z of relative dimension one, with finite diagonal, and are regular and Cohen–Macaulay. They are smooth after inverting their levels. `Xfull(N)` and `X₁(N)` are Deligne–Mumford over all of Z. The naive cyclic stack is DM over Z precisely when N is squarefree; for general N its largest DM open removes the boundary objects with nonétale relative polygon inertia. The mixed stack’s DM range is given by the separate small-level statement; it is not characterized by n being squarefree.

`N,n≥1`; no blanket fine-scheme assertion is part of this theorem.

“Regular” refers to regular smooth atlases; Cohen–Macaulay and relative dimension are stack properties.

The flat/proper conclusions include bad characteristics and nonreduced bases.

Establish this as follows. Construct the moduli via polygon-count stacks, the ordinary Drinfeld level functors and finite-presentation descent. Use finite-flat full-level covers and the contraction tower. On the ordinary open apply MC7B’s Katz–Mazur deformation/local-ring contracts. On the boundary use the smooth `Ell_m` chart and the full-set lifting theorem; faithful flat covers transfer regularity to the other level problems. Apply valuative extension and the generalized-curve contraction interface for properness; establish flatness and relative dimension on these same charts. Compute boundary inertia to identify the DM loci.

The theorem is `moduliStacksAreProperFlatArtin`.

**Checks.**

- Full and point stacks remain DM at bad primes, though they may have geometric automorphisms.
- The naive cyclic model at `N=p²` is Artin rather than DM at its p-gon boundary in characteristic p.
- No Layers 3–5 Tate chart is assumed in constructing these stacks.

*Needs:* [§2.10](#s2-10); [§2.11](#s2-11); [§3.1](#s3-1); [ModularCurves Layer 7B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `SchemeAndStackFoundations Layer 1`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Lemma 3.1.1 and Theorem 3.1.2, p.18; Theorem 3.2.7, p.26; Theorem 3.3.1, pp.26–30; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Theorems 4.3.5 (p.39), 4.4.4 (p.40) and 4.6.4 (p.46); Proposition 4.6.5 (p.47).)

<a id="s3-3"></a>

### 3.3 Coherent cyclic data on decontractions

For `N≥1` and each `m|N` put `g(m)=gcd(m,N/m)` and `d(m)=m/g(m)`. A refined `Γ₀(N)` object is a generalized elliptic curve `E/S`, a cyclic order-N subgroup G on its elliptic open U, opens `S_(m)` covering S whose pairwise intersections for different m are U, and the following data on each `S_(m)`: degenerate fibres are `d(m)`-gons, and on `D_m=S_(m)×_Ell_d(m) Ell_m` the universal m-gon decontraction carries an ample cyclic order-N subgroup `G_(m)` extending G. The subgroups are coherent: for any two decontractions over T, fpqc locally choose generators meeting matched components such that their multiples by `N/m` have the same image on `E_T` under the specified contraction identifications. The groupoid transition maps preserve these cyclic subgroups. Morphisms preserve E, the labelled opens, the generic subgroup and this decontraction descent datum.

The label m is retained even when two distinct m have the same `d(m)`.

The generators in the coherence condition are local witnesses, not part of the object. Their multiples land on the retained smooth components.

A decontraction is a stack object with a contraction isomorphism, not a chosen curve over S.

Establish this as follows. Define the decontraction stack by the preceding 2-fibre product and pull back its universal generalized curve. Use the cyclic transport lemma: matched component generators with the stated multiple determine uniquely the cyclic subgroup on another decontraction. Check the cocycle condition by uniqueness. Express coherence on the double groupoid presentation and descend the divisor subgroups. The standard subgroup of order `(N/m)d(m)` gives the common subgroup on the contracted curve.

The public interface should expose:

- `RefinedCyclicLevel`: The curve, elliptic subgroup, labelled opens and coherent decontraction data.
- `RefinedCyclicLevel.polygonLabel`: The m label with `d(m)`-gon degeneration.
- `RefinedCyclicLevel.decontractionSubgroup`: The ample subgroup on the universal m-decontraction.
- `RefinedCyclicLevel.coherence`: Matched generators have equal `N/m` multiples on the contracted curve.
- `RefinedCyclicLevel.transport`: Unique coherent cyclic transport among decontractions.
- `RefinedCyclicLevel.baseChange`: Pullback of the groupoid descent datum and its coherence.

**Checks.**

- If N is squarefree then `g(m)=1` and `d(m)=m` for every divisor m.
- For `N=4`, the labels `m=1` and `m=2` both have `d=1` but are distinct labelled boundary loci.
- On U all decontraction stacks identify with U and the datum is just the cyclic subgroup G.
- A one-gon and a generic order-four subgroup without the m label and coherent decontraction data do not determine a refined `Γ₀(4)` object.
- At `N=4`, `m=2` gives `g=2` and `d=1`; the boundary curve is a one-gon with data on its two-gon decontractions.
- The full double-overlap coherence equation, not merely a generic subgroup, is retained.

*Needs:* [§2.8](#s2-8); [§2.11](#s2-11); [§3.1](#s3-1); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `SchemeAndStackFoundations Layer 1`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §5.2, p.50; §5.3, p.51; Lemma 5.4, p.52; §5.5 and Lemmas 5.6–5.7, pp.53–54; §5.9, pp.56–57.)

<a id="s3-4"></a>

### 3.4 The normalized `Γ₀` moduli stack

Construct `X₀(N)` as the stack of refined cyclic levels. It is regular, proper flat and Deligne–Mumford over Z, of relative dimension one, with finite diagonal, and is the normalization of `X(1)=Ell₁` in `Y₀(N)` over `Z[1/N]`. Its forgetful map to `X(1)` is representable. On the m-labelled chart its map to `Ell_d(m)` is representable by schemes, quasi-finite separated finitely presented and flat, and is étale after inverting N. The naive-to-refined map contracts an m-gon to a `d(m)`-gon and equips the result with coherent subgroup data. Its relative inertia is `μ_g(m)`; it is proper flat but need not be representable. The chart square with `Ell_m→Ell_d(m)` is 2-cartesian. For squarefree N the naive and refined stacks agree; for nonsquarefree N they can differ even over C.

`X₀(N)` denotes a stack here; its actual coarse scheme and its base-change limits are the level-H construction in Layers 3 and 5 outputs.

Generic `[−1]` remains, so this `Γ₀` stack is never claimed to be a fine elliptic-curve scheme.

The normalization is taken in the generic ordinary moduli cover, not in a projective plane modular polynomial equation.

Establish this as follows. Contract each naive m-gon along `d(m)`-torsion and use coherent transport to define the map. Prove the labelled chart square is 2-cartesian. Use the polygon contraction tower to obtain the proper flat cover. On the contracted chart, coherence removes exactly the `μ_g(m)` automorphisms; the residual forgetful map is representable and its local charts give regularity and the DM property. Compare the ordinary open with `Y₀(N)`, apply properness and normality, and identify the normalization by the generic finite-cover universal property.

The public interface should expose:

- `refinedGammaZeroStack`: `X₀(N)` with its universal refined cyclic datum.
- `refinedGammaZeroStack_normalization`: Normalization of `X(1)` in the ordinary `Γ₀` generic cover.
- `naiveToRefinedGammaZero`: Contraction and coherent transport with kernel `μ_g(m)`.
- `refinedGammaZeroStack_chartSquare`: The labelled square with `Ell_m→Ell_d(m)` is 2-cartesian.
- `refinedGammaZeroStack_forget`: The representable forgetful map to `X(1)`.
- `refinedGammaZeroStack_squarefree`: Agreement with the naive stack when N is squarefree.

**Checks.**

- At `N=1` it is `Ell₁` and has generic inversion inertia.
- For prime p the naive and refined models agree.
- For `N=4`, the naive-to-refined map at an `m=2` cusp has kernel `μ₂` and is not an isomorphism over C.
- In characteristic p at a naive p-gon of level `p²`, the nonétale `μ_p` kernel is removed in the refined DM stack.
- At `N=4` the two-gon naive chart contracts to a one-gon and loses `μ₂` relative inertia, including over C.
- At `N=1` the refined stack is `X(1)`, not a fine scheme.

*Needs:* [§2.11](#s2-11); [§3.2](#s3-2); [§3.3](#s3-3); [ModularCurves Layer 8D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n); `SchemeAndStackFoundations Layer 1`; `AlgebraicModuliForArithmeticGeometry §5.4/ArithmeticModuli.DMNormalization.stack`; `AlgebraicModuliForArithmeticGeometry §5.4/ArithmeticModuli.DMNormalization.finite`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §5.10, p.58; §5.11 and Lemma 5.12, p.59; Theorem 5.13 and proof, pp.60–62.)

<a id="s3-5"></a>

### 3.5 Fine loci and bad-level inertia

The compact full-level stack over Z is a fine scheme for `N≥2` unless N is a prime power `p^s` or twice a prime power `2p^s`; `N=1` is an additional nonfine case. In the exceptional bad fibres there can be nontrivial automorphisms preserving a Drinfeld full set. A sufficient fine condition for compact `Γ₁(N)` over a base is that N have an invertible divisor `d≥5` on that base; the open complex fine range `N≥4` is not substituted at cusps. On an m-gon with an ample naive cyclic order-N subgroup, the relative scaling inertia is `μ_gcd(m,N/m)`, commuting with inversion. Thus naive `Γ₀(N)` is DM over Z exactly for squarefree N. For arbitrary mixed `Γ₁(N;n)`, deleting boundary fibres at primes with `v_p(n)≥v_p(N)+2` gives a DM open; if `v_p(n)≤v_p(N)+1` for every p, the forgetful map to `X(1)` is representable and the whole stack is DM. This includes `N=n=p²` and corrects the older “n squarefree” criterion.

Fine means that the moduli stack is represented by a scheme with its universal object, not just that its coarse scheme exists. Where `Xfull(N)`, `N≥3`, is fine over `ℤ[1/N]`, and where `X₁(N)` is fine over `ℤ[1/d]` for a factor `d≥5` of N, the representing scheme with its universal curve and level is AdicSpacesPartIII's `GeneralisedEllipticCurve.moduli`.

The full-level criterion is the corrected version of Česnavičius Proposition 4.3.6, adding the omitted `N=1` exception.

The mixed valuation criterion is a sufficient global DM/representability criterion, not an unproved converse for every deleted point.

Establish this as follows. Use rigidity of full sets on ordinary fibres and the explicit polygon action on boundary labels. At exceptional bad ordinary fibres, inspect inversion on infinitesimal torsion. For point level use an invertible order-d generator to eliminate automorphisms, retaining the compact `d≥5` hypothesis. For cyclic and mixed levels compute which `ζ^i` scalings preserve the divisor data. The cyclic kernel is `μ_gcd(m,N/m)`; the mixed calculation gives the valuation range of Česnavičius.

The theorem is `smallLevelAndDmBoundaries`.

**Checks.**

- `Xfull(12)` is fine over Z; `Xfull(11)` need not be fine in characteristic eleven.
- `Xfull(1)` has inversion inertia and is not a scheme.
- `Γ₁(4)` is fine on its complex elliptic open but its compact stack has an irregular cusp.
- For `N=n=p²` the mixed stack is DM although n is not squarefree.
- Over `ℤ[1/5]`, `X₁(5)` is the fine scheme `GeneralisedEllipticCurve.moduli` of cyclic level five; over `ℤ` it is not a scheme, since at a supersingular point of characteristic five the Drinfeld point `P=0` is fixed by `[−1]`.

*Needs:* [§2.3](#s2-3); [§3.1](#s3-1); [§3.4](#s3-4); [ModularCurves Layer 3D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures).

([Česnavičius, published modular description](https://msp.org/ant/2017/11-9/ant-v11-n9-p02-p.pdf), Proposition 4.3.6, pp.2052–2053; Proposition 4.6.5, pp.2063–2064; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §5.2, pp.50–51; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 3.2.7, p.26; Theorem 4.2.1(2), p.35.)

<a id="s3-6"></a>

### 3.6 Generalized Tate n-gons

For `n≥1` put `A=ℤ[[t]]` and `q=tⁿ`, and let Tateₙ(t)/A be AdicSpacesPartIII's n-gon Tate family `GeneralisedEllipticCurve.tateCurve n` over `ℤ[[Q]]` with `Q=t`. It is a generalized elliptic curve with split n-gon fibre at `t=0` (`tateCurve_specialFibre`), smooth after inverting t (`tateCurve_genericSmooth`), and with identity-component formal group Ĝₘ (`tateCurve_formalMultiplicative`). Its generic elliptic curve is the equation-level Tate curve `Tate₁(q)` of Tau Ceti (`TauCeti.tateCurve`). This subsection proves that the scheme-theoretic degeneracy ideal of Tateₙ(t) is (t), that the comparison of its generic fibre with `Tate₁(q)` is fixed at the identity, and that it is unique: a generalized n-gon extension of `Tate₁(q)` with this identity-formal comparison is uniquely isomorphic to Tateₙ(t). Conrad builds the family by gluing the n formal node charts `A{Xᵢ,Yᵢ}/(XᵢYᵢ−t)`, `i∈ℤ/n`, along their punctured branches, preserving the sections (1,t), and algebraizing with the ample rotation orbit of these sections.

No inversion of 2, 3 or n; a node has complete local equation `XY=t`.

The conventional Weierstrass coefficients and Laurent-series ellipticity already exist in Tau Ceti, and the proper family is the imported generalized curve; nothing here constructs either again.

Establish this as follows. Compute `Fitt₁` of the relative differentials on the node charts `XY=t` to obtain the degeneracy ideal (t). Compare the formal smooth locus with Ĝₘ and the rotation action. For uniqueness, both extensions are objects of `Ell_n`. Section 2.11 supplies its finite diagonal, so their generalized-curve Isom scheme is finite over `ℤ[[t]]`. The generic comparison is a section after inverting t. Since `ℤ[[t]]` is normal, its schematic closure in this finite scheme is the unique section over `ℤ[[t]]`: a finite subalgebra of its fraction field equals `ℤ[[t]]`. The identity-formal comparison fixes the generic isomorphism. Proper formal GAGA applies only when compatible maps on the whole proper thickenings have been supplied.

The public interface should expose:

- `tateCurve_degeneracy`: The scheme-theoretic degeneracy ideal of Tateₙ(t) is (t), not `(tⁿ)`.
- `tateCurve_identityComponent`: The identity of the special fibre lies on component 0, and the completion along zero is Ĝₘ with invariant differential `du/u`.
- `tateCurve_generic`: The generic fibre is the equation-level Tate curve `Tate₁(q)`, `q=tⁿ`, with the comparison fixed at the identity.
- `tateCurve_unique`: A generalized n-gon extension with this generic and identity-formal comparison is uniquely isomorphic to Tateₙ(t).

**Checks.**

- `Tate₁(t)` at `t=0` is the pointed nodal cubic.
- `Tate₂(t)` has two components and two nodes, although the graph has only two vertices.
- `j(Tateₙ(t))` has pole order n, while every node has thickness one over `ℤ[[t]]`.
- `n=1` specializes to the pointed nodal cubic; `n=2` has two rational components and two nodes.
- The generic invariant satisfies `j=q⁻¹+744+O(q)`, hence pole order n in t.

*Needs:* [§2.1](#s2-1); [§2.2](#s2-2); [§2.4](#s2-4); [§2.5](#s2-5); [§2.11](#s2-11); AdicSpacesPartIII R2.11 (`GeneralisedEllipticCurve.tateCurve`); Tau Ceti `TauCeti.tateCurve`; `AdicSpacesPartIII §F0.8/grothendieck-algebraization`; `SchemeAndStackFoundations §4.10/Formal.algebraize_hom`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.5, pp.16–18; Theorem 2.5.2, p.18; Corollary 3.2.5, p.25.)

<a id="s3-7"></a>

### 3.7 Power isogenies at the boundary

For `m,n≥1` the branch power maps give a pointed finite morphism `Tateₙ(t)→Tateₙ(tᵐ)` of generic degree m. Its restriction to the smooth loci is finite locally free of rank m, with kernel `μₘ` in the identity component and pullback `du/u↦m du/u`. The proper morphism is not flat at the nodes for `m>1`: over a field, the completed target-to-source map is `k[[t,X,Y]]/(XY−tᵐ) → k[[t,x,y]]/(xy−t)`, `X↦xᵐ`, `Y↦yᵐ`, and the fibre at the closed target node is `k[x,y]/(xy,xᵐ,yᵐ)` of length `2m−1`. The target is the base change `t↦tᵐ` of the n-gon family and need not have regular total space. On generic fibres the map is `u↦uᵐ` from `Tate₁(tⁿ)` to `Tate₁(tⁿᵐ)`.

Establish this as follows. Raise branch coordinates to the mth power, respecting the overlap and equations `xy=t` and `XY=tᵐ`. Each branch coordinate is integral over its mth power, so these charts give a finite map. Use SchemeAndStackFoundations §4.10 full faithfulness for proper algebraizations for the proper formal maps. Generic degree m follows from the elliptic isogeny; smooth-locus flatness follows from the `μₘ` torsor on Gₘ, component by component. At a target node set `t=X=Y=0`. The remaining monomials `1,x,…,x^(m−1),y,…,y^(m−1)` form a basis of the fibre, giving length `2m−1`. A finite flat map of generic rank m would have fibre length m, so the proper map is not flat for `m>1`. The smooth-locus power map gives the kernel and differential, including the zero differential in characteristic dividing m.

The public interface should expose:

- `tatePower`: The pointed finite map of generic degree m, with its source and target comparisons; no whole-curve flatness field.
- `tatePower_kernel`: The smooth-locus kernel is `μₘ`, not the constant group `ℤ/m` in bad characteristic.
- `tatePower_differential`: Pullback of `du/u` is m `du/u`.
- `tatePower_comp`: Composition of the mth and rth power maps is the mrth power map with the necessary base changes.
- `tatePower_smooth_flat`: The restriction to the smooth loci is finite locally free of rank m, a `μₘ` torsor on each component.
- `tatePower_node_fibre_length`: At a geometric target node the fibre has length `2m−1`; for `m>1` the proper map is not flat.

**Checks.**

- At `m=1` this set is {(0,0)} and the node fibre has length one.
- At `m=2` it is {(0,0),(1,0),(0,1)}, of length three rather than two.
- At `m=3` its five monomials are `1,x,x²,y,y²`; the mixed monomial xy is excluded.
- `m=1` gives the identity.
- `m=2` in characteristic 2 has rank-two kernel `μ₂` and zero differential.
- For `m=2` the target node `XY=t²` has thickness 2; it is not the original regular smoothing.
- For `m=2` the node fibre has basis 1,x,y and length 3, not 2.
- For `m=p` in characteristic p the generic isogeny is inseparable of degree p, the smooth-locus kernel has rank p and the differential vanishes; this does not imply flatness of the proper power map.
- For `m=2` the target-node fibre has length 3, whereas the generic degree is 2. Reject a finite-flat assertion for the whole proper morphism.

*Needs:* [§2.6](#s2-6); [§3.6](#s3-6); `AdicSpacesPartIII §F0.8/grothendieck-algebraization`; `SchemeAndStackFoundations §4.10/Formal.algebraize_hom`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Example 2.5.1, p.18; Theorem 4.4.3, pp.43–46.)

<a id="s3-8"></a>

### 3.8 Open level subgroups and the standard levels

An open level subgroup is an open subgroup H of `GL₂(Ẑ)`. Its level is the least `n≥1` with `Γ(n)=ker(GL₂(Ẑ)→GL₂(ℤ/n))` contained in H; for any n with `Γ(n)⊂H` write `H̄` for the image of H in `GL₂(ℤ/n)`, so that `H↦H̄` is a bijection between open subgroups containing `Γ(n)` and subgroups of `GL₂(ℤ/n)`, and `H̄` for a multiple m of n is the full preimage of `H̄` for n. Matrices act on ordered bases on the right, `(P,Q)·[[a,b],[c,d]]=(aP+cQ, bP+dQ)`, as in Tau Ceti ModularCurves Convention 5. The standard levels are the subgroups whose images are: `Γ(N)`, the trivial group; `Γ₁(N)={a≡1, c≡0 mod N}`, the stabiliser of the first basis vector P; `Γ₀(N)={c≡0 mod N}`, the stabiliser of the line through P; the level `Γ₁^μ(N)={c≡0, d≡1 mod N}`, whose structures `(P,Q)↦(⟨P⟩, Q mod ⟨P⟩)` are the embeddings `μ_N↪E[N]` given by `P′↦e_N(P′,Q)`; the mixed levels `Γ₁(N)∩Γ₀(M)` for `N|M`; for a prime `ℓ` the split Cartan `C_s(ℓ)` of diagonal matrices and `C_s⁺(ℓ)` of diagonal or antidiagonal matrices (the monomial subgroup); for an odd prime `ℓ` and a fixed nonsquare `ε∈𝔽_ℓ^×` the nonsplit Cartan `C_ns(ℓ)={[[a,εb],[b,a]] : (a,b)≠(0,0)}`, the image of `𝔽_{ℓ²}^×` acting on `𝔽_{ℓ²}=𝔽_ℓ⊕𝔽_ℓ√ε`, and its normaliser `C_ns⁺(ℓ)`; `C_ns(2)` is the cyclic subgroup of order 3 of `GL₂(𝔽₂)`. The invariants of H are its index `[GL₂(Ẑ):H]=[GL₂(ℤ/n):H̄]`, its projective index `[GL₂(Ẑ):±H]` where `±H` is generated by H and `−I`, its determinant image `det(H̄)⊂(ℤ/n)^×`, and whether `−I∈H`. Conjugation by `g∈GL₂(Ẑ)` sends H to `g⁻¹Hg` and preserves all four invariants.

`n≥1` with `Γ(n)⊂H`; the nonsplit Cartan needs `ℓ` odd and `ε` a nonsquare, or `ℓ=2`.

The right-action convention is fixed once; the left action on column vectors of Česnavičius and Zywina gives the same subgroups because g acts on the frame `φ:(ℤ/n)²→E[n]` by `φ↦φ∘g`.

Establish this as follows. Define each standard level by entry conditions in `GL₂(ℤ/n)`; closure under products and inverses follows from the `2×2` product and adjugate formulas. Define `C_s⁺(ℓ)` as the stabilizer of the unordered coordinate lines, equivalently the normalizer of the split Cartan algebra. For odd `ℓ` this is the normalizer of `C_s(ℓ)`; at `ℓ=2` it has order 2 and is strictly smaller than the normalizer `GL₂(𝔽₂)` of `C_s(2)={I}`. Define `C_ns⁺(ℓ)` as the normalizer of `C_ns(ℓ)`; at `ℓ=2` the order-3 Cartan has normalizer `GL₂(𝔽₂)`. Each Cartan has index 2 in its chosen plus subgroup. Compute orders from `|GL₂(𝔽_ℓ)|=(ℓ²−1)(ℓ²−ℓ)`: `|Γ₀(ℓ)‾|=ℓ(ℓ−1)²`, `|C_s(ℓ)|=(ℓ−1)²`, `|C_ns(ℓ)|=ℓ²−1`, and for general N the indices `[GL₂:Γ₀(N)]=ψ(N)=N∏_{p|N}(1+1/p)` and `[GL₂:Γ₁(N)]=φ(N)ψ(N)`. The projective index is the index when `−I∈H̄` and half the index otherwise; `−I∉Γ₁(N)‾` and `−I∉Γ(N)‾` for `N≥3`.

The public interface should expose:

- `levelGamma0`: The subgroup `Γ₀(N)‾` of `GL₂(ℤ/N)` of matrices with lower-left entry 0.
- `levelGamma1`: The subgroup `Γ₁(N)‾` of matrices with upper-left entry 1 and lower-left entry 0; it is the stabiliser of the first basis vector under the right action.
- `levelGamma1Mu`: The subgroup `Γ₁^μ(N)‾={c=0, d=1}`; its level structures are embeddings `μ_N↪E[N]`, the convention of Calegari–Geraghty.
- `splitCartan`: The diagonal subgroup `C_s(ℓ)`, and `splitCartanNormalizer` the monomial subgroup `C_s⁺(ℓ)`. It is the group normalizer for odd `ℓ` and the unordered-coordinate-line stabilizer at `ℓ=2`.
- `nonsplitCartan`: For a nonsquare `ε`, the subgroup `{[[a,εb],[b,a]]}`, and nonsplitCartanNormalizer its normaliser.
- `projectiveIndex`: The index in `GL₂(ℤ/n)` of the subgroup `±H̄` generated by `H̄` and `−I`; it is the coarse degree of `X_H` over the j-line.
- `projectiveIndex_eq_index`: projectiveIndex `H =` index H when `−I∈H̄`, and 2·projectiveIndex `H =` index H otherwise.
- `levelDet`: The image `det(H̄)⊂(ℤ/n)^×`; its fixed field in `ℚ(ζ_n)` is the field of definition of the components of `X_H`.
- `levelPullback`: For `n|m` the preimage of `H̄` under `GL₂(ℤ/m)→GL₂(ℤ/n)` has the same index and projective index. Its determinant image is the full inverse image of `det(H̄)` under `(ℤ/m)ˣ→(ℤ/n)ˣ`; these finite groups are at different moduli and are not equal.
- `levelGamma0_comap`: The preimage in `SL(2,ℤ)` of levelGamma0 N is Mathlib's CongruenceSubgroup.Gamma0 N, of levelGamma1 N is CongruenceSubgroup.Gamma1 N, and of the trivial group is CongruenceSubgroup.Gamma N.
- `levelConj`: Conjugation `H̄↦g⁻¹H̄g` preserves index, projective index and determinant image.

**Checks.**

- For a prime p, projectiveIndex (levelGamma0 p) `= p+1`.
- index (levelGamma1 5) `= 24` but projectiveIndex (levelGamma1 5) `= 12`, because `−I∉Γ₁(5)‾`; a definition of the coarse degree as the plain index fails here.
- projectiveIndex (splitCartanNormalizer 13) `= 91` and projectiveIndex (nonsplitCartanNormalizer 13 `ε`) `= 78` for a nonsquare `ε`.
- At `ℓ=2`, splitCartanNormalizer has order 2 and index 3, while the normalizer of splitCartan is `GL₂(𝔽₂)` of order 6.
- For `n=1` every subgroup is `GL₂(ℤ/1)`, with index, projective index 1 and trivial determinant group.
- Pulling level one back to modulus 5 gives all of `GL₂(𝔽₅)`, whose determinant image is `𝔽₅ˣ`, although the determinant group at modulus 1 is trivial.
- The preimage of levelGamma1 N in `SL(2,ℤ)` is CongruenceSubgroup.Gamma1 N, whose bottom row is `≡(0,1)`; the upper-left condition `a≡1` is forced there by the determinant.
- `[GL₂(Ẑ):±Γ₀(ℓ)]=ℓ+1`, `[GL₂(Ẑ):±Γ₁(5)]=12`, `[GL₂(Ẑ):±C_s⁺(13)]=91`, `[GL₂(Ẑ):±C_ns⁺(13)]=78`.
- det is surjective onto `(ℤ/n)^×` for `Γ₀(N)`, `Γ₁(N)`, `C_s(ℓ)`, `C_s⁺(ℓ)`, `C_ns(ℓ)` and `C_ns⁺(ℓ)`, and trivial for `Γ(N)`.

*Needs:* Mathlib `Matrix.GeneralLinearGroup`; Mathlib `Matrix.GeneralLinearGroup.det`; Mathlib `Subgroup.index`; Mathlib `Subgroup.normalizer`; Mathlib `CongruenceSubgroup.Gamma0`; Mathlib `CongruenceSubgroup.Gamma1`; Mathlib `CongruenceSubgroup.Gamma`; [ModularCurves Layer 9B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §4.1.2, p.28; §4.4, p.39; [On the possible images of the mod ℓ representations associated to elliptic curves over ℚ](https://arxiv.org/pdf/1508.07660), §3.2, p.15; §1, Notation, p.2 (Cartan subgroups); [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), Conventions, item 5; §9B.)

<a id="s3-9"></a>

### 3.9 Level-H structures away from the level

Let H be an open level subgroup, n with `Γ(n)⊂H`, S a `ℤ[1/n]`-scheme and `E/S` an elliptic curve. The scheme `Isom_S((ℤ/n)²_S, E[n])` of frames is a finite étale right `GL₂(ℤ/n)`-torsor over S, for the action `φ↦φ∘g`. A level-H structure on E is a section over S of the finite étale quotient `Isom_S((ℤ/n)²_S, E[n])/H̄`. Level-H structures on elliptic curves over `ℤ[1/n]`-schemes form a stack `Y_H[1/n]`, and the forgetful map `Y_H[1/n]→Ell_{ℤ[1/n]}` is representable, finite étale of degree `[GL₂(ℤ/n):H̄]`. For `n|m` reduction of frames modulo n identifies the stacks built from n and from m over `ℤ[1/m]`. An automorphism `α` of E fixes the structure `φH̄` exactly when `φ⁻¹∘α∘φ` lies in `H̄`; in particular `[−1]` fixes every level-H structure if and only `if −I∈H̄`. Over `ℤ[1/n]` this stack is the stack over Ell of the Katz–Mazur quotient problem `[Γ(n)]/H̄`, which upstream 9A identifies with the fppf sheaf quotient of the naive full level problem.

n is invertible on the base; H contains `Γ(n)`.

The quotient is the étale-sheaf quotient; an S-point need not lift to an S-frame.

Establish this as follows. `E[n]` is finite étale of rank `n²` and étale locally isomorphic to `(ℤ/n)²` over `ℤ[1/n]`-schemes (upstream 3N), so the frame scheme is a finite étale `GL₂(ℤ/n)`-torsor (upstream 5B). A finite étale torsor has a finite étale quotient by any subgroup, formed étale locally as a disjoint union of copies of the base, and its formation commutes with base change (upstream 0C, 0D). For `n|m` the reduction map `GL₂(ℤ/m)→GL₂(ℤ/n)` is surjective with kernel inside the preimage of `H̄`, which gives the change-of-level isomorphism. The automorphism criterion is the torsor identity `α∘φ=φ∘(φ⁻¹αφ)`; for `α=[−1]` one has `φ⁻¹αφ=−I`. Stackify over the elliptic moduli stack as in AlgebraicModuliForArithmeticGeometry §5.1 and compare with the Katz–Mazur quotient problem by upstream 9A.

Identify the coarse space of this elliptic level-H stack with the Katz–Mazur scheme `M([Γ(n)]/H̄)` over `ℤ[1/n]`, preserving its classifying map, j-map and inclusions of level subgroups. On a cover of the base where an auxiliary full level 3 or 4 is invertible, use the rigidifier quotient of ModularCurves 9D and the finite-quotient coarse theorem of SchemeAndStackFoundations §1.23; descend the identity-compatible comparisons. The opens where 2 or 3 is invertible cover `Spec ℤ`, so this adds no restriction on the residue characteristic. At trivial H this is the stack coarse interpretation of the j-line of ModularCurves 9E.

The public interface should expose:

- `LevelStructure`: Level-H structures on `E/S` over a `ℤ[1/n]`-scheme: sections of `Isom((ℤ/n)²,E[n])/H̄`.
- `LevelStructure.ofFrame`: The class `φH̄` of a frame `φ:(ℤ/n)²≅E[n]`.
- `LevelStructure.ofFrame_eq_iff`: `φH̄=ψH̄` if and only if `φ⁻¹∘ψ∈H̄`.
- `LevelStructure.baseChange`: Pullback along `S′→S`, compatible with composition.
- `LevelStructure.changeLevel`: For `n|m`, reduction of frames gives a natural bijection between the structures built from m and from n.
- `LevelStructure.aut_fix_iff`: An automorphism `α` of E fixes `φH̄` iff `φ⁻¹αφ∈H̄`; `[−1]` fixes all level-H structures iff `−I∈H̄`.
- `levelOpenStack_forget_finiteEtale`: `Y_H[1/n]→Ell_{ℤ[1/n]}` is representable finite étale of degree `[GL₂(ℤ/n):H̄]`.
- `LevelStructure.conj`: `φH̄↦(φ∘g)(g⁻¹H̄g)` identifies level-H and level-`g⁻¹Hg` structures.
- `LevelStructure.coarseKatzMazur`: The canonical coarse-space isomorphism with `M([Γ(n)]/H̄)` over `ℤ[1/n]`, compatible with classifying maps, j and change of level.
- `LevelStructure.toKatzMazur`: Over `ℤ[1/n]` the stack is that of the Katz–Mazur quotient problem `[Γ(n)]/H̄` of upstream 9A.

**Checks.**

- For `H̄=GL₂(ℤ/n)` every elliptic curve over a `ℤ[1/n]`-scheme has exactly one level-H structure.
- For `H=Γ₁(N)` the map `φH̄↦φ(e₁)` identifies level-H structures with points of exact order N, and for `H=Γ₀(N)` with cyclic subgroups of order N.
- For a prime `p≥3`, an elliptic curve over `ℚ` with a `ℚ`-rational subgroup of order p has a `ℚ`-rational `Γ₀(p)`-structure but no `ℚ`-rational frame of `E[p]`, since the Weil pairing of a rational frame would be a rational primitive p-th root of unity: the quotient is a sheaf quotient, not the set of orbits of S-frames.
- For `N≥3`, `[−1]` moves every `Γ₁(N)`-structure, and fixes every `Γ₀(N)`-structure.
- `H=GL₂(Ẑ)` gives one level structure on every curve; `H=Γ(n)` gives the frames themselves; `H=Γ₀(p)` over `ℤ[1/p]` gives étale-locally the `p+1` subgroups of order p.

*Needs:* [§2.11](#s2-11); [§3.8](#s3-8); [ModularCurves Layer 3N](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#3n-naive-level-structures); [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 0C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors); [ModularCurves Layer 0D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions); [ModularCurves Layer 9A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9a-katzmazur-quotient-problems); [ModularCurves Layer 9D](../ModularCurves/README.md#9d-coarse-moduli-schemes); `SchemeAndStackFoundations §1.23/finite_quotient_coarse`; `SchemeAndStackFoundations §1.18`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §4.1.2, p.28; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 6.3(a), p.63; [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9A, items 1–3 and the final paragraph.)

<a id="s3-10"></a>

### 3.10 Coarse base change from the fibres over `𝔽_p`

Let `𝒳` be a separated, flat Deligne–Mumford stack locally of finite type over `ℤ` with coarse space `f:𝒳→X`. If for every prime p the base change `f_{𝔽_p}:𝒳_{𝔽_p}→X_{𝔽_p}` is a coarse space of `𝒳_{𝔽_p}`, then for every scheme S the base change `f_S:𝒳_S→X_S` is a coarse space of `𝒳_S`. Equivalently, coarse formation commutes with all base change as soon as it commutes with base change to the prime fields of positive characteristic; it always commutes with flat base change.

`𝒳` separated, flat and locally of finite type over `ℤ`, Deligne–Mumford, so with finite inertia.

Establish this as follows. Coarse formation commutes with flat base change on X and can be checked fppf locally on `X_S` (SchemeAndStackFoundations §1.23, `keel_mori`). Étale locally on X, `𝒳=[Spec B/G]` with G finite and `X=Spec B^G` (§0.1); the coarse space of `𝒳_R` is `Spec (B⊗R)^G`, so one must show `B^G⊗R→(B⊗R)^G` is an isomorphism for every ring R. `ℤ`-flatness makes B and `B/B^G` torsion-free, so the map is injective for every `ℤ`-module R. Surjectivity: pass to finitely generated R by a filtered colimit, the case `R=ℤ` is trivial, and dévissage along `0→R′→R→R″→0` with the five lemma reduces to `R=ℤ/p`, which is the hypothesis.

**Checks.**

- Applied to `X(1)` this gives the compactified coarse j-line of [§3.11](#s3-11) over every S; applied to `𝒳_H` it reduces the base change of [§5.3](#s5-3) over `ℤ[1/n]` to the fibres `𝔽_p`, `p∤n`.

*Needs:* [§0.1](#s0-1); `SchemeAndStackFoundations §1.23/keel_mori`; `SchemeAndStackFoundations §1.23/finite_quotient_coarse`; `SchemeAndStackFoundations Layer 1`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 3.3.1 and proof, pp.23–24; [Coarse base change fails for some modular curves](https://arxiv.org/pdf/1608.01249), §1.1, p.1; [Compactifying the space of stable maps](https://arxiv.org/pdf/math/9908167), Lemma 2.2.3 and sketch of proof, pp.4–5 (arXiv v2).)

<a id="s3-11"></a>

### 3.11 The compactified coarse j-line

The j-invariant extends to a morphism `j:X(1)→ℙ¹_ℤ` sending the boundary to `∞` (on generalized elliptic curves it is the ratio of the sections `c₄³` and `Δ` of `ω^{⊗12}`, which have no common zero), and j is the coarse moduli space of `X(1)=Ell₁`. More generally, for every `m≥1` the composite `Ell_m→Ell₁→ℙ¹_ℤ` is the coarse space of `Ell_m`, the open `Ell⊂Ell_m` has coarse space `𝔸¹_ℤ`, and the formation of all these coarse spaces commutes with arbitrary base change `S→Spec ℤ`. On the elliptic locus this is the upstream coarse j-line over every ring (9E, coarseJLine). `X(1)` is irreducible with geometrically irreducible fibres over `ℤ`.

`m≥1`; S an arbitrary scheme.

Establish this as follows. On Ell use the upstream coarse j-line: `M([Γ(1)]/R)=Spec R[j]` for every ring R (Tau Ceti ModularCurves 9E, recovered as the stack coarse space by the coarse comparison of [§3.9](#s3-9) at trivial level). On the preimage C of `ℙ¹∖{0,1728}` every object has automorphism group the constant `{±1}` (Deligne's lemma, as in Česnavičius 2016 Lemma 2.4: the automorphism scheme is finite étale with geometric fibres `{±1}` by Tau Ceti `WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`; for the standard 1-gon it is `μ₁×ℤ/2`, [§2.3](#s2-3)), so `{±1}` is a rigidifiable subgroup of the inertia (AlgebraicModuliForArithmeticGeometry §5.1, ArithmeticModuli.NormalInertiaSubgroup) and `C⫽{±1}` has trivial stabilisers (AlgebraicModuliForArithmeticGeometry §5.1, `ArithmeticModuli.Rigidification.stabilizer_kernel`). The rigidification `C⫽{±1}` has trivial inertia, so it is an algebraic space and its own coarse space; rigidification preserves coarse spaces and commutes with arbitrary base change (AlgebraicModuliForArithmeticGeometry §5.1). At the cusp the Tate 1-gon over `ℤ[[q]]` (§3.6 with `n=1`) is a formal chart on which inversion acts trivially on q, and `j=1/q+744+⋯` identifies the completed coarse local ring with `ℤ[[1/j]]`; together with the elliptic locus this identifies the coarse space of `X(1)` over `ℤ` with `ℙ¹_ℤ` (Česnavičius takes this case from Deligne–Rapoport VI.1.1). Over each `𝔽_p` the coarse map of `X(1)_{𝔽_p}` to `ℙ¹_{𝔽_p}` is an isomorphism over a dense open and finite locally free because its source is normal, hence an isomorphism; [§3.10](#s3-10) then gives every S. For `Ell_m` the m-gons over C have automorphism scheme `μ_m×ℤ/2` (Layer 2), so `C_m⫽{±1}` is not its own coarse space; it is tame because the remaining stabilisers `μ_d` are linearly reductive (Česnavičius Lemma 2.1.6 and Deligne 1975 5.3(III)), so its coarse space is `ℤ`-flat of formation compatible with every base change (SchemeAndStackFoundations §1.23, `tame_local_structure`; Abramovich–Olsson–Vistoli Corollary 3.3). The induced map from the coarse space of `Ell_m` to `ℙ¹_ℤ` is then finite, flat by EGA `IV₂` 6.1.5 fibre by fibre, and an isomorphism over `𝔸¹`, hence an isomorphism; the coarse map is a homeomorphism, so irreducibility of `ℙ¹` gives that of `Ell_m` and its fibres.

**Checks.**

- Over `𝔽₂` the coarse space of `X(1)_{𝔽₂}` is `ℙ¹_{𝔽₂}` although the stabiliser at `j=0` has order 24, which is not invertible.
- `X(1)` is not `ℙ¹_ℤ`: every object has the automorphism `−1`, so there is no universal curve over `ℙ¹`.

*Needs:* [§2.3](#s2-3); [§2.11](#s2-11); [§3.6](#s3-6); [§3.10](#s3-10); [§3.9](#s3-9); `AlgebraicModuliForArithmeticGeometry §5.1/ArithmeticModuli.Rigidification.stack`; `AlgebraicModuliForArithmeticGeometry §5.1/ArithmeticModuli.Rigidification.coarse`; `AlgebraicModuliForArithmeticGeometry §5.1/ArithmeticModuli.Rigidification.base_change`; `SchemeAndStackFoundations §1.23/keel_mori`; `SchemeAndStackFoundations §1.20`; [ModularCurves Layer 9E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n); `AlgebraicModuliForArithmeticGeometry §5.1/ArithmeticModuli.NormalInertiaSubgroup`; `AlgebraicModuliForArithmeticGeometry §5.1/ArithmeticModuli.Rigidification.stabilizer_kernel`; `SchemeAndStackFoundations §1.23/tame_local_structure`; Tau Ceti `WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`; `SchemeAndStackFoundations Layer 1`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 3.3.2 and proof, pp.24–25; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), proof of Theorem 4.2.1, p.36; [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9E, items 1–6.)

<a id="s3-12"></a>

### 3.12 The Deligne–Rapoport level-H stack

Let `X(1)=Ell₁` be the proper smooth Deligne–Mumford stack over `ℤ` of generalized elliptic curves with irreducible geometric fibres (Layer 2). For an open level subgroup H and n with `Γ(n)⊂H`, define `𝒳_H` as the normalization of `X(1)` in the representable, quasi-compact and separated composite `Y_H[1/n]→Ell_{ℤ[1/n]}⊂X(1)`. It carries a representable finite morphism `𝒳_H→X(1)`, the open substack `Y_H:=𝒳_H×_{X(1)}Ell`, whose restriction to `ℤ[1/n]` is `Y_H[1/n]`, and the closed substack `𝒳_H^∞` over the boundary `X(1)^∞`. Up to unique isomorphism over `X(1)` it does not depend on n. For `H′⊂H` the map of level structures extends uniquely to a finite morphism `𝒳_{H′}→𝒳_H` over `X(1)`, compatibly with composition, and `g∈GL₂(Ẑ)` gives an isomorphism `𝒳_H≅𝒳_{g⁻¹Hg}` over `X(1)`. The universal property: for every representable integral `𝒯→X(1)` and every factorisation of `Y_H[1/n]→X(1)` through `𝒯` there is a unique morphism `𝒳_H→𝒯` over `X(1)` extending it.

H open, n with `Γ(n)⊂H`.

Normalization is relative normalization of a Deligne–Mumford stack in a quasi-compact separated representable morphism, formed on an étale atlas and descended.

Establish this as follows. Let `𝒜` be the integral closure of `𝒪_{X(1)}` in the pushforward of `𝒪` along `Y_H[1/n]→X(1)`. Its sections on an étale scheme chart `U→X(1)` are those of the relative normalization of U in `U×_{X(1)}Y_H[1/n]`, and relative normalization commutes with étale (indeed smooth) base change (Stacks 03GV; Mathlib normalizationPullback is an isomorphism for smooth base change), so `𝒜` is a quasi-coherent `𝒪_{X(1)}`-algebra (SchemeAndStackFoundations §1.22) and `𝒳_H` is its relative spectrum, the chart normalizations descending along the étale atlas (SchemeAndStackFoundations §§0.1 and 1.1). This is the relative form of the chart-and-descent method of AlgebraicModuliForArithmeticGeometry §5.4, ArithmeticModuli.DMNormalization.stack, which treats the absolute normalization. `𝒳_H→X(1)` is finite because `X(1)` is of finite type over the excellent ring `ℤ`, so relative normalization is finite (AlgebraicModuliForArithmeticGeometry §5.4, ArithmeticModuli.DMNormalization.finite; SchemeAndStackFoundations §0.20, `nagata_normalization_finite`; Stacks 03GR). Independence of n: for `n|m` the normalizations along `Y_H[1/n]` and along its open part `Y_H[1/m]` agree, because a function on `Y_H[1/m]` integral over `X(1)` is regular in codimension one on the normal stack `Y_H[1/n]` and hence regular (Česnavičius p.28, citing Deligne–Rapoport IV.3.6). Functoriality and the universal property are those of relative normalization (Stacks 035I, 035J; Mathlib normalizationDesc and `normalization.hom_ext` on charts). For `H=GL₂(Ẑ)` the stack is `X(1)` itself, by the finite-normal recognition criterion of ModularCurves Layer 10 applied on charts.

The public interface should expose:

- `levelStack`: The stack `𝒳_H`, for an open level subgroup H.
- `levelStack.toX1`: The representable finite morphism `𝒳_H→X(1)`.
- `levelStack.ellipticOpen`: The open substack `Y_H=𝒳_H×_{X(1)}Ell`, equal to `Y_H[1/n]` over `ℤ[1/n]`.
- `levelStack.boundary`: The closed substack `𝒳_H^∞` over the boundary of `X(1)`.
- `levelStack.indepLevel`: For `n|m` the stacks built from n and from m are canonically isomorphic over `X(1)`.
- `levelStack.map`: For `H′⊂H` the finite morphism `𝒳_{H′}→𝒳_H` over `X(1)`, with `map_id` and `map_comp`.
- `levelStack.conj`: The isomorphism `𝒳_H≅𝒳_{g⁻¹Hg}` over `X(1)` for `g∈GL₂(Ẑ)`, multiplicative in g.
- `levelStack.lift`: Every representable integral `𝒯→X(1)` through which `Y_H[1/n]` factors receives a unique morphism from `𝒳_H` over `X(1)` restricting to the given one.
- `levelStack.lift_unique`: Two morphisms `𝒳_H→𝒯` over `X(1)` agreeing on `Y_H[1/n]` are equal.

**Checks.**

- levelStack `GL₂(Ẑ)` is `X(1)`, with toX1 the identity.
- levelStack `(Γ₀ p)→X(1)` is finite locally free of rank `p+1`, and levelStack `(Γ N)→X(1)` of rank `|GL₂(ℤ/N)|`.
- For a prime p the naive `Γ₀(p²)` stack is not levelStack `Γ₀(p²)`: on the standard p-gon over `ℂ` the `μ_p` of automorphisms preserving `⟨(ζ_{p²},1)⟩` contract to the identity, so its map to `X(1)` is not representable.
- `levelStack (Γ N)` is Layers 3 and 4's full-level stack `Xfull(N)` over `ℤ` ([§5.1](#s5-1)).
- `𝒳_{GL₂(Ẑ)}=X(1)`.
- `𝒳_{Γ₀(p)}→X(1)` has rank `p+1` and `𝒳_{Γ(N)}→X(1)` has rank `|GL₂(ℤ/N)|` ([§5.8](#s5-8)).

*Needs:* the finite-normal recognition contract of ModularCurves Layer 10; [§2.11](#s2-11); [§3.9](#s3-9); `AlgebraicModuliForArithmeticGeometry §5.4/ArithmeticModuli.DMNormalization.stack`; `AlgebraicModuliForArithmeticGeometry §5.4/ArithmeticModuli.DMNormalization.finite`; `SchemeAndStackFoundations §0.20/nagata_normalization_finite`; `SchemeAndStackFoundations §1.19`; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`; Mathlib `AlgebraicGeometry.Scheme.Hom.normalizationPullback`; Mathlib `AlgebraicGeometry.Scheme.Hom.normalizationDesc`; `SchemeAndStackFoundations §1.22`; `SchemeAndStackFoundations §1.1`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §4.1.2, p.28; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §1.1–1.2, pp.2–3; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §1.1, p.1; [Stacks Project](https://stacks.math.columbia.edu), Tags 035I, 035J, 03GV, 03GR.)

<a id="s3-13"></a>

### 3.13 The marked torus family over the upper half-plane

Over H take the genus-one Siegel family of AbelianSchemesAndArithmeticModuli A5.8, `T=SiegelFamily 1=(C×H)/Z²`, with fibre `C/(Z+Zτ)` over `τ`, its identity and holomorphic structure; there `SL₂(Z)=Sp₂(Z)` acts by `τ↦(aτ+b)/(cτ+d)` with fibre map `z↦(cτ+d)⁻¹z` in A5.8's column convention. This subsection fixes on it the marking used for modular curves. Its sections `P=1/N` and `Q=τ/N` give an ordered N-torsion basis with Tau Ceti pairing `e_N(P,Q)=ζ_N⁻¹`, equivalently `e_N(Q,P)=ζ_N`. For `γ=[[a,b],[c,d]]∈SL₂(Z)`, the algebraic row action `(P,Q)γ=(aP+cQ,bP+dQ)` matches the analytic right action `τ·γ=(dτ+b)/(cτ+a)` and the fibre isomorphism `z↦z/(a+cτ)`. In usual left-action notation `ητ=(ατ+β)/(γτ+δ)`, its label matrix is `[[δ,β],[γ,α]]`.

`τ∈H` and `N≥1`; the right action is the usual left action of `Jγ⁻¹J` with `J=diag(1,−1)`.

The family, its structure sheaf, its holomorphic quotient charts and its base change are A5.8's; only the marking and the dictionary between the two actions are added here.

Establish this as follows. Translate A5.8's column-convention action at `g=1` into the displayed right action by conjugating with J and inverting. Joint ℘ functions away from the relative lattice, and their projective extensions, identify the family with varying Weierstrass models (§1.1). Check the displayed right action by applying `z↦z/(a+cτ)` to the two transformed sections; then verify composition of the row actions. The pairing values are §1.5.

The public interface should expose:

- `markedTorusFamily`: The genus-one Siegel family `SiegelFamily 1` over H with its identity, carrying the modular marking.
- `markedTorusFamily_level`: The frame `(1/N,τ/N)`.
- `markedTorusFamily_pullback`: A holomorphic map `S→H` pulls back T and its frame.
- `markedTorusFamily_changeMarking`: The row action `γ` has base map `τ·γ` and fibre multiplier `(a+cτ)⁻¹`.
- `markedTorusFamily_weilPairing`: `e_N(P,Q)=ζ_N⁻¹` and `e_N(Q,P)=ζ_N` for the Tau Ceti pairing and `τ∈H`.

**Checks.**

- For `γ=[[1,1],[0,1]]`, `τ·γ=τ+1` and the changed frame is `(P,P+Q)`.
- For `γ=[[0,−1],[1,0]]`, `τ·γ=−1/τ` and `(P,Q)γ=(Q,−P)`.
- At `N=1` both level sections are the identity; the family remains nontrivial.
- When `c≡0` modulo N, its row action on the retained `Γ₁` generator is `P↦aP=d⁻¹P`, not dP.
- Use the same row action as MC9B.
- The family, section and isomorphism diagrams commute after every holomorphic base change.

*Needs:* [§1.1](#s1-1); [§1.5](#s1-5); `AbelianSchemesAndArithmeticModuli` A5.8 (`SiegelFamily`); `AbelianSchemesAndArithmeticModuli §A5`; `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA).

([Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Example 2.5, Proposition 2.6, Remark 2.8 and Proposition 2.9, pp.3–4; [Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §7, p.15; §8, p.18.)

<a id="s3-14"></a>

### 3.14 Open modular uniformization with the specified level

The marked torus family induces an isomorphism from the supplied analytic quotient curve to the analytification of the imported algebraic open modular curve: `Γ(N) \ H → Y(N,ζ_N)^an` for a fixed pairing, through `τ↦(C/Λ_τ,(τ/N,1/N))` (the frame `(1/N,τ/N)` of the marked family has pairing `ζ_N⁻¹` and lands in `Y(N,ζ_N⁻¹)`), `Γ₁(N) \ H → Y₁(N)^an`, and `Γ₀(N) \ H → Y₀(N)^an`. Interpret the first as a fine curve for `N≥3` and the second for `N≥4`; at smaller levels and for `Γ₀` use the coarse quotient with its stabilizer charts. Strict full ordered level is the disjoint union of `φ(N)` pairing components over C, with one such quotient for each primitive pairing value. These isomorphisms identify the corresponding local families on rigidified charts.

Write `u₋(τ)=(E_τ,(1/N,τ/N))`, `u₊(τ)=(E_τ,(τ/N,1/N))`, and `K=[[0,1],[1,0]]`, so `u₊=u₋·K`. For the positive frame the algebraic row action of `γ=[[a,b],[c,d]]∈SL₂(ℤ)` uses §3.13's right-action dictionary at `KγK`: its base map is `F_γ(τ)=(aτ+c)/(bτ+d)` and its fibre map is `z↦z/(bτ+d)`. Thus `u₊(τ)·γ≅u₊(F_γ(τ))`, with both torsion sections preserved by that fibre map. The coordinate formula is Mathlib's left action of the transpose matrix.

Fix the standard point and cyclic comparisons as `v₁(τ)=(E_τ,1/N)` and `v₀(τ)=(E_τ,⟨1/N⟩)`. For `f₁` forgetting Q and `f₀` retaining `⟨P⟩`, the diagrams are `f₁∘u₋=v₁`, `f₀∘u₋=v₀`, but `f₁∘u₊=v₁∘S` and `f₀∘u₊=v₀∘S`, where `Sτ=−1/τ`; the latter equalities use `z↦z/τ`, sending `τ/N` to `1/N`. These are equalities of moduli maps, with the indicated isomorphisms of local families on fine charts. Level division uses the identity period map within either choice of full frame. Section 4.5 gives the action between all pairing components.

`N≥1` and the base is C. Full ordered level, a fixed pairing and a projective frame are three separate moduli problems.

The algebraic models and representability are MC5A/5B/9D/9E inputs; `Γ₀` uses cyclic subgroups and always has generic `[−1]` inertia.

The target statement is an isomorphism of complex analytic curves, including their structure sheaves, not only a bijection of complex points.

Establish this as follows. Classify elliptic curves and their torsion labels by Layer 1; changing a marking gives precisely the displayed congruence stabilizer. This supplies the point bijection. For a local analytic family with a marking, A5 gives holomorphic period coordinates. The Weierstrass presentation and analytified étale rigidifier show that the forward map and the local inverse are holomorphic on fine charts. For coarse cases choose an auxiliary prime-to-N full level `≥3`, perform the fine comparison there, and descend finite quotient charts using stabilizer-equivariance. Do not infer local isomorphism from point bijectivity.

The theorem is `openLevelUniformization`.

**Checks.**

- For `N=2` the coarse full-level curve is `A¹_C ∖ {0,1}`; its level stack retains `[−1]`.
- For `N≥3` the fixed-pairing curve is connected; the unrestricted full curve has `φ(N)` components.
- Every local inverse preserves the analytic structure sheaf.
- For `N=5`, `τ=2i` and `T=[[1,1],[0,1]]`, the positive-frame row action gives `(τ/5,(τ+1)/5)`, which rescales to `u₊(τ/(τ+1))`, with `τ/(τ+1)=(4+2i)/5`. It does not give `u₊(τ+1)`: on `E_(2i)` neither pointed automorphism `±1` identifies their first sections, since `1/5` and `(4i+1)/5` are outside `ℤ+2iℤ`.
- Forgetting Q in `u₊(2i)` gives `2i/N`; multiplication by `1/(2i)` identifies this with `1/N` on `E_(i/2)`, as required by the S diagram.

*Needs:* [§3.13](#s3-13); [ModularCurves Layer 3D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures); [ModularCurves Layer 5A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4); [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 9D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients); [ModularCurves Layer 9E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n); [ModularForms Layer 10A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve); `AbelianSchemesAndArithmeticModuli §A5`; `ComplexComparisonPartII` C4.4 (`familyMorphismInterface`); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA).

([Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §§8–9, pp.17–24; Theorem 17.21, p.42; [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Lemmas 8.5 and 8.7, pp.99–100; [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–25.)

<a id="s3-15"></a>

### 3.15 Compactified level maps and their degrees

Level reduction followed by contraction extends the ordinary maps `Xfull(Nm)→Xfull(N)`, `Xfull(N)→X₁(N)`, and `X₁(N)→X₀(N)^naive`. These maps are representable finite locally free, with ranks `|GL₂(Z/Nm)|/|GL₂(Z/N)|`, `Nφ(N)`, and `φ(N)`, respectively. The composite to the refined `X₀(N)` is obtained through the coherent naive-to-refined map. That comparison and the bare polygon tower are proper flat but may be nonrepresentable, so their degrees are not read as finite-cover ranks. All maps commute with arbitrary base change of the stack data and with the stated level row/diamond actions. After passing to coarse curves, account for generic stabilizers before inferring degrees: for `N≥5` in characteristic zero `X₁(N)→X₀(N)` has coarse degree `φ(N)/2`. Pairing-changing row actions are maps between the indicated cyclotomic fibres.

`N,m≥1`; the full-level ranks are for the all-pairings stacks. A fixed-pairing restriction has its determinant-compatible rank.

The finite locally free claims apply to the three specified level maps, not to every proper flat contraction of stacks.

Coarse formation is supplied by Layer 5 and need not commute with arbitrary integral base change.

Establish this as follows. Construct the reduction and use subgroup-divisor contraction to restore ampleness. Apply the generalized full-set lifting and generator-scheme results for the three finite-flat ranks. Use coherence to descend the cyclic datum to the refined model; compare the relative `μ_g(m)` inertia separately. Check the identities on the ordinary open, then on the universal polygon charts; properness and uniqueness of contractions extend them everywhere. For the asserted characteristic-zero coarse degree, the open analytic comparison computes the effective congruence index `φ(N)/2`; the finite generic coarse extension has that same degree.

The theorem is `contractionMapsBetweenLevels`.

**Checks.**

- For `N=3`, full-to-point rank is six.
- For `N=11`, point-to-cyclic stack rank is ten while its complex coarse degree is five.
- For `N=4,m_boundary=2` the naive-to-refined kernel is `μ₂` and the map is not a finite locally free representable cover.
- All-pairings full reduction and fixed-pairing reduction have distinct determinant bookkeeping.

*Needs:* [§2.6](#s2-6); [§2.10](#s2-10); [§3.1](#s3-1); [§3.4](#s3-4); [§3.14](#s3-14); [ModularCurves Layer 9B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems); [ModularForms Layer 10A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 2.4.5, pp.15–16; §§4.1–4.2, pp.31–37; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 4.2.11, pp.33–34; Theorem 5.13, pp.60–62.)

### Examples

For the level-three equation `y²+a₁xy+a₃y=x³`, `Δ=a₃³(a₁³−27a₃)`. In characteristic 3, `a₃` being a unit does not ensure smoothness: `a₁=0,a₃=1` gives `Δ=0`. The ordinary elliptic locus requires both factors to be units.

At `N=1` the full compactification has one-gon degeneration and no rigidifying level.

On `C₂` over C, `P=(1,1)` gives an ample point of order two.

If N is squarefree then `g(m)=1` and `d(m)=m` for every divisor m.

### Dependencies

Use Layer 0, Layer 1, Layer 2. External contracts: AbelianSchemesAndArithmeticModuli, AdicSpacesPartIII, AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, SchemeAndStackFoundations; Tau Ceti’s Tate curve. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 4: Formal cusps and fixed-pairing components

<a id="s4-1"></a>

### 4.1 Formal level structures at cusps

For a specified `Γ`-level problem, form its finite generic level cover on `Tate₁(q)` and take the integral closure of the q-adic base in each generic component. Classify the boundary data on split n-gons via their smooth locus `Gₘ×ℤ/n` and Drinfeld generators, keeping the stabilizer action on the smoothing parameter and Hodge line. The resulting formal stack charts, with their descent groupoids, describe the completion of the compactified stack. A complete local ring of its coarse curve is an invariant ring only under the applicable coarse-completion theorem; it is not the framed stack chart itself. On the prime `N≥5` diamond class over `ℤ[1/N]`, use Layer 10’s existing cusp charts and prove comparison with this generalized family.

Establish this as follows. Identify the generic level cover using the imported torsion/Drinfeld definitions and contraction maps. Normalize each generic component and extend the generalized curve with its identity-formal comparison. Compute stabilizers on the chosen chart before descending; compare the exact prime-level overlap to ModularCurves Layer 10 by uniqueness.

The public interface should expose:

- `formalLevelChart`: A normalized formal level chart with generic level data, generalized family and descent arrows.
- `formalLevelChart_generic`: Restriction `q≠0` identifies the chosen generic level cover.
- `formalLevelChart_inertia`: The full stabilizer acts on the parameter and on `du/u`; retain infinitesimal inertia.
- `formalLevelChart_completion`: The formal stack completion is obtained from these charts and their overlap groupoid.
- `formalLevelChart_primeComparison`: Agreement with the ModularCurves Layer 10 chart after inverting prime `N≥5`.

**Checks.**

- No level and the chosen 1-gon chart give parameter q and width 1.
- For prime `Γ₀(N)`, `j⁻¹` has orders 1 and N at its two cusps, as in Layer 10.
- In characteristic 2 the `Γ₁(4)` coarse completion cannot be obtained by asserting arbitrary base change of invariant rings.
- A cusp width is the valuation of q in a local smoothing parameter, not the number of components of the coarse j-fibre.
- The prime `Γ₀(N)` widths 1 and N and the characteristic-2/3 table are imported.

*Needs:* [§2.8](#s2-8); [§3.1](#s3-1); [§3.2](#s3-2); [§3.3](#s3-3); [§3.4](#s3-4); [§3.6](#s3-6); [§3.15](#s3-15); `AlgebraicModuliForArithmeticGeometry §8.3/completedAtlasPresentation_equivalence`; [ModularCurves Layer 10](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §2.5, pp.16–18; Theorems 4.3.6–4.3.7, pp.40–42; [Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.2, Proposition 1.2.2.1 and Theorem 1.2.3.1, pp.36–38.)

<a id="s4-2"></a>

### 4.2 Integral `Γ₁` cusp strata

For `d|N` let `B_d` be the d-gon boundary stratum of the `Γ₁(N)` stack. It is reduced, regular, proper, quasi-finite and flat of relative dimension zero over `ℤ`. If `d>2`, it is a disjoint union of `φ(d)/2` copies of `Spec ℤ[ζ_(N/d)]`, indexed by `b∈(ℤ/d)×/{±1}`. Its geometric generic degree is `φ(d)φ(N/d)/2`. A primitive root `ζ_(N/d)^r`, r a unit modulo `N/d`, labels a geometric embedding within that cyclotomic component, not an additional component indexed by a positive divisor of d. This corrects the author PDF’s component indexing in Theorem 4.3.4. If `d≤2`, the stratum is nowhere a scheme for `(N,d)=(1,1),(2,1),(2,2),(4,2)`. In the remaining partial schematic cases `N=pˢ` or 2pˢ the required inversion is `δ=p`; in other cases `δ=1`. The canonical degree-two cover by `Spec ℤ[ζ_(N/d)]` remains finite flat without that inversion; on the schematic locus over `ℤ[1/δ]` it is `Spec(ℤ[ζ_(N/d)]⁺[1/δ])`. The same covers extend to every infinitesimal boundary neighbourhood. Do not erase the residual inertia in a nowhere-schematic case.

Establish this as follows. In characteristic zero write a point as `(ζ_N^r,b)`, with b a unit modulo d and r a unit modulo `N/d`. The `μ_d` automorphisms change r by (N/d)b times an integer, leaving r modulo `N/d`; inversion sends (r,b) to `(−r,−b)`. For `d>2` it acts freely on b. Cyclotomic Galois action is transitive on r modulo `N/d`, so there is one cyclotomic component per b modulo sign. Normality and finite flatness extend this decomposition integrally. Use the twisted Tate charts for existence and the completed moduli property for the full infinitesimal claim. Descend the degree-two cover only on the stated schematic locus.

**Checks.**

- `N=d=5` has two cyclotomic components, each `Spec ℤ`, and two geometric 5-gon cusps; no extra divisor label.
- `N=d=4` has one 4-gon cusp, although the 2-gon boundary stratum is nowhere schematic.
- For `N=15,d=5` there are two copies of `Spec ℤ[ζ₃]`, hence four geometric cusps; conjugation moves r within a component.
- Independent b and positive-divisor r labels give eight components for `N=d=5`, contradicting the two isomorphism classes.
- `N=4,d=2` has a non-schematic boundary stratum; taking its real cyclotomic ring does not turn it into a fine moduli scheme.
- For `d>2` each cyclotomic chart is a scheme even at primes dividing N.

*Needs:* [§4.1](#s4-1).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 4.3.3, Theorems 4.3.4 and 4.3.7, pp.37–42.)

<a id="s4-3"></a>

### 4.3 Twisted Tate charts for `Γ₁`

For `d|N` and a unit r modulo `N/d`, the unmarked regularized Tate curve over `ℤ[ζ_(N/d)][[t]]`, `t=q^(1/d)`, has generic parameter `ζ_(N/d)^(−r)q` and boundary ideal (t); over `ℤ[ζ_N]` it is `Tate_d(ζ_N^(−r′)t)`, for any lift r′ modulo N. For a marked `Γ₁` chart choose b a unit modulo d and a unit lift b′ modulo N. The point denoted `q^(b/d)` descends from `Tate_d(ζ_N^(−r′(b′)⁻¹)t)` to the regularized family with generic parameter `ζ_(N/d)^(−r(b′)⁻¹)q`. For `d>2` this identifies the completion of the component indexed by b modulo sign. The unit r changes its cyclotomic embedding, not its component count; impose no purported unique positive-divisor lift of r. For `d≤2` retain the finite flat degree-two formal cover; when `N/d>2` it is étale only after inverting `δ`. For `d=2`, after inverting `δ` on the schematic locus, the invariant parameter is `(1+ζ_(N/d)⁻¹)t`, as in Theorem 4.3.7, rather than an unqualified parameter t on the real base.

Establish this as follows. Twist the generic Tate parameter by the root of unity fixed by the cusp label. Use Tateₙ uniqueness to descend the regularized generalized curve with its `Γ₁` point. Verify the involution on the `d≤2` cover and descend the parameter only with the stated étaleness and schematic hypotheses.

The public interface should expose:

- `twistedTateChart`: The chart with b modulo sign, a chosen unit r and lift b′, its `Γ₁` point, family and generic parameter; changes of lifts have specified descent comparisons.
- `twistedTateChart_degeneracy`: The boundary ideal is generated by t.
- `twistedTateChart_cyclotomic`: The unmarked twist is `Tate_d(ζ_N^(−r′)t)`; for the descended `Γ₁` point the exponent is `−r′(b′)⁻¹`.
- `twistedTateChart_formalModuli`: For `d>2` it represents the framed boundary deformation problem; for `d≤2` keep the covering groupoid.
- `twistedTateChart_realDescent`: The `d=2` descent uses `(1+ζ⁻¹)t` with the conjugation action of Theorem 4.3.7.

**Checks.**

- j has pole order d in t because its generic parameter is a unit times tᵈ.
- The special fibre is a d-gon and its degeneracy divisor is `t=0`.
- For `(N,d)=(4,2)`, the finite flat chart is a cover of a stack and not its coarse universal family.
- The chart is over the ring of integers, not just a cyclotomic field; the divisor `t=0` survives in characteristic dividing N.

*Needs:* [§3.6](#s3-6); [§4.2](#s4-2).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorems 4.3.6–4.3.7, pp.40–42.)

<a id="s4-4"></a>

### 4.4 Boundary carriers and Hodge evaluation

On each stated integral stack chart the boundary is an effective relative Cartier divisor cut out by its smoothing parameter, and `ω=e*Ω¹` of the smooth locus agrees with the pushforward of the relative dualizing line. It is trivialized on Tate charts by `du/u`, invariant under contraction. A weight-k section evaluates as a formal series times `(du/u)^k`, equivariantly for chart stabilizers; restriction of global sections is injective whenever the chosen union of formal boundary charts meets every irreducible component and the sheaf has the required torsion-free/density property. This is the formal comparison supporting the q-expansion principle; the downstream AlgebraicModularFormsAndSerreWeights R15.2 target [“The q-expansion principle”](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights#target-q-expansion-principle-and-its-vanishing-theorem) owns integral coefficient descent from one cusp on each geometric connected component, with its full-level and small-level hypotheses. This is an outbound scope boundary; the characteristic-zero and all-component arguments here use no input from that integral programme. Distinguish the Cartier boundary, its reduced boundary locus and the finite-flat scheme `j⁻¹(∞)`, whose ramification multiplicities are cusp widths. For general `Γ₀` integral coarse spaces use the Cartier and regular-cusp theorem below; finite flatness of a reduced coarse cusp locus over `ℤ` is not inferred.

Establish this as follows. Compare the generalized curve’s dualizing line to invariant differentials on its smooth locus and use contraction invariance. Evaluate on the formal charts and retain the stabilizer linearization. For injectivity: a section of a torsion-free coherent sheaf that vanishes in the formal completion along the boundary vanishes near every component meeting the boundary, by Krull’s intersection theorem in the Noetherian local rings, hence on a schematically dense open, hence everywhere. Read cusp fibre multiplicities from valuations of `j⁻¹`, keeping reduction and Cartier constructions separate.

**Checks.**

- On `Γ₀(5)/ℤ[1/5]` the j-cusp fibre is `[∞]+5[0]`, although the reduced boundary has two points; this is an imported Layer 10 check.
- In characteristic 2, the weight-k Hodge action of `[−1]` must be tracked as a group-scheme linearization, not removed by the equality of coarse maps.

*Needs:* [§3.7](#s3-7); [§4.3](#s4-3); `SchemeAndStackFoundations Layer 2`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–43; §4.5 Example 4.5.3, p.48; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Theorem 5.13, pp.60–62; Theorem 6.7, pp.64–65.)

<a id="s4-5"></a>

### 4.5 Level maps and diamond operators

The open comparisons commute with division of levels, forgetting Q, retaining the cyclic subgroup generated by P, and every row action by a constant matrix in `GL₂(Z/NZ)`, using the frame transports of §3.14. In particular the positive-frame forgetful maps have base map S, whereas the negative-frame maps have the identity base map. A row action with determinant d sends pairing `ζ` to `ζ^d`. On the `Γ₁` quotient the algebraic diamond action is `P↦aP`; for an upper triangular `SL₂` label matrix it is `a=d⁻¹` modulo N. The induced map for `Γ₀` agrees with the algebraic quotient isogeny `E→E/⟨P⟩` and the analytic lattice map in these transported coordinates. At `N=4` and above use the imported fine `Y₁` carrier without enlarging its base.

Explicitly, for `r∈(ℤ/N)ˣ` put `D_r=diag(r,1)` and `u_r=u₊·D_r`, with pairing `ζ_N^r`. For `g∈GL₂(ℤ/N)`, put `r′=r det(g)` and choose a lift `h∈SL₂(ℤ)` of `D_r g D_(r′)⁻¹`. The row-action diagram is `u_r(τ)·g≅u_(r′)(F_h(τ))`; the result on `Γ(N) \ H` is independent of the lift. The forgetful diagrams are `f₁∘u_r=⟨r⟩∘v₁∘S` and `f₀∘u_r=v₀∘S`, since r is a unit. Roots at divided levels satisfy `ζ_(Nm)^m=ζ_N`, and multiplication by m sends either full frame at level Nm to its matching frame at level N.

All levels here are invertible over C. An action whose determinant changes the pairing is not an endomorphism of a single fixed-pairing component.

Use §3.13's right action for `u₋` and its `KγK` transport for `u₊`. The standard `Γ₁` and `Γ₀` markings remain `1/N` and `⟨1/N⟩`.

Establish this as follows. Evaluate each map on the marked torus sections and apply the analytic pairing determinant formula. The row quotient identifications are imported from MC9B; the local family comparison makes the diagrams holomorphic, so their pointwise equality is an equality of morphisms. Identify isogeny quotients with the lattice quotient by Layer 1 and the imported algebraic quotient universal property.

The theorem is `levelMapAndDiamondComparison`.

**Checks.**

- A matrix with determinant 2 at `N=5` moves the `ζ₅` component to the `ζ₅²` component.
- For `γ` in `Γ₁(N)`, `a≡d≡1` and `c≡0`, so the retained P section is fixed.
- At `N=5` the positive-frame T action has period `τ/(τ+1)`, while the negative-frame T action has period `τ+1`; conjugation by K interchanges these dictionaries.
- At `r=2,N=5`, forgetting Q in `(2τ/5,1/5)` gives `⟨2⟩v₁(Sτ)`; its cyclic subgroup gives `v₀(Sτ)`.

*Needs:* [§1.3](#s1-3); [§3.14](#s3-14); [ModularCurves Layer 9B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients); [ModularCurves Layer 2E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing).

([Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §5, Proposition 5.16, p.13; §9, pp.20–24; [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Lemma 8.5 and subsequent quotient-isogeny description, p.99.)

<a id="s4-6"></a>

### 4.6 Small-level stabilizers and coarse quotients

Over C, a strict ordered full N-frame has no pointed automorphisms for `N≥3`; a point of exact order N has no pointed automorphisms for `N≥4` on the open curve. At `N=1` the elliptic stabilizers are generically `μ₂`, with `μ₄` and `μ₆` at the special j-values; at strict full `N=2` the labels leave only `μ₂`. `Γ₀` retains `[−1]` generically at every N and may have larger elliptic stabilizers. A scalar-equivalence class of a full frame retains `[−1]` when `N>2`. The analytic coarse local chart at a point is `U/Aut(E,level)`, using a finite local chart U; the global infinite-group projection `H → Γ \ H` is not a finite map.

The statements concern pointed automorphisms of the elliptic curve, not translations.

Fine assertions apply only to the stated open moduli; they do not imply the same compactification is fine at its cusps.

Establish this as follows. Use the imported rigidity theorem for strict full or `Γ₁` level and compute how `−1` acts on the torsion labels. At `j=1728` and `j=0` check the finite pointed automorphism groups against the labels. Use properly discontinuous local charts and finite stabilizer quotients from MF10A; correct the global finiteness assertion in the classical handout by restricting finite properness to a local stabilizer quotient.

The theorem is `stabilizersAndSmallLevels`.

**Checks.**

- For `N=2`, a quadratic twist of a generic Legendre curve over `C(t)` has the same `λ` and rational full two-torsion, but need not be isomorphic to it.
- A generic `Γ₀(5)` object still has the automorphism `−1`.
- `Y₁(4)` is fine over C although its compactification has an irregular cusp with inertia.

*Needs:* [§3.14](#s3-14); [ModularCurves Layer 3D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures); [ModularCurves Layer 5A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4); [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularForms Layer 10A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve); [ModularCurves Layer 9D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients).

([Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Proposition 16.4 and Theorem 17.1, p.37; §9, pp.20–24; [Conrad, classical curves](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), Proposition 3.1 and its local-chart proof, pp.3–4; [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Example 8.9, p.100, corrected.)

<a id="s4-7"></a>

### 4.7 Projective full level in the Bakker–Tsimerman setting

For a prime `p>3`, take strict full p-frames modulo simultaneous multiplication by `F_p^×`. Their determinant values modulo squares give two geometric components. Each coarse component is the compactification of the effective `Γ(p)` quotient. The projective-frame stack has generic `μ₂` inertia; rigidifying that central `μ₂` gives the smooth full-level curve for `p>3`. Its forgetful quotient by the effective deck group is the (2,3,p) orbifold on the rigidified bare-polygon moduli stack: the quotient map has elliptic branch orders 2 and 3 and boundary order p. On a strict full p-component the effective index is `(p³−p)/2`, the number of cusps is `(p²−1)/2` and the genus is `(p+2)(p−3)(p−5)/24`. These are applications of MF10A/10B, not new dimension-formula targets.

p is an odd prime greater than 3. Keep the full-frame, scalar quotient, `μ₂`-rigidification and coarse curve as separate objects.

A bare p-gon has group-scheme automorphisms `μ_p×Z/2`; its geometric automorphism count in characteristic zero is 2p. The p-fold effective cusp description uses the indicated quotient/rigidification.

Establish this as follows. The scalar action changes a determinant by a square, giving the two classes in `F_p^×/(F_p^×)²`. The stabilizer of a class always includes `−1`; rigidifying this central `μ₂` (AlgebraicModuliForArithmeticGeometry §5.1 rigidification) gives the rigidified full-level stack, whose coarse curve is unchanged. Use the open comparison and the imported cusp stabilizer and genus formulas; full `Γ(p)` is torsion free effectively for `p>3`. The Layer 2 polygon automorphism theorem supplies the boundary inertia check; no false fine universal-family statement is used.

**Checks.**

- For `p=5` a component has 12 cusps and genus 0; for `p=7` it has 24 cusps and genus 3.
- Strict full p-level has `p−1` pairing components; the scalar quotient has two.
- Retaining `−1` prevents treating the scalar quotient as a fine universal elliptic scheme.

*Needs:* [§2.3](#s2-3); [§3.14](#s3-14); [§4.6](#s4-6); [ModularForms Layer 10A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve); [ModularForms Layer 10B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology); `AlgebraicModuliForArithmeticGeometry §5.1/ArithmeticModuli.Rigidification.stack`.

([Bakker–Tsimerman, preprint](https://arxiv.org/pdf/1403.7168v2), §§2.1–2.2, pp.5–6.)

<a id="s4-8"></a>

### 4.8 Tate and analytic cusp parameters

At a cusp represented by `σ∞` let w be the least positive integer with `σT^wσ⁻¹∈±Γ`, and put `q_w=exp(2πi σ⁻¹τ/w)`. The coarse boundary completed local ring after splitting the cusp is `C[[q_w]]`. Put `τ_c=σ⁻¹τ` and write `σ⁻¹` in the usual left-action convention with bottom row `(c_c,d_c)`. The fibre coordinate is `z_c=z/(c_cτ+d_c)`. The algebraic Tate chart from Layers 3–5 restricts on a punctured convergent disc to `C/(Z+Zτ_c)`, with `u_c=exp(2πiz_c)` and `q=exp(2πiτ_c)=q_w^w`. Its level labels and invariant differential `du_c/u_c=2πi dz_c` agree. Transport to the original torus family using the fibre multiplier `1/(c_cτ+d_c)`. Stack or strict-level charts may use a cover of this ring and must be descended by their actual cusp inertia.

w is the effective `PSL₂` width. The native strict integer width h is computed using `Γ` rather than `±Γ`; at an irregular cusp `h=2w`.

On the analytic side the cusp datum `σ`, the width w and the q-coordinate `q_w` are FuchsianOrbifolds Layer 3’s; this theorem compares them with the algebraic Tate charts.

Use the independently constructed algebraic Tate charts and their convergence/differential contract, not an asserted equality between unrelated formal symbols.

Establish this as follows. Use the exponential map `C/Z→C^×` to identify the torus quotient with `C^×/q^Z`. Compare its convergent Weierstrass equations and differential with the algebraic Tate equation, including both the fibre multiplier from z to `z_c` and the rescaling `du_c/u_c=2πi dz_c`. Apply the cusp stabilizer quotient and its invariant local parameter; descending the completed chart gives `C[[q_w]]` and its completed algebraic comparison.

The theorem is `tateAndCuspParameterAgreement`.

**Checks.**

- For `σ=S⁻¹` and `τ=2i`, `τ_c=i/2`, `q=exp(−π)` and `z_c=z/(2i)`; the original `exp(2πiτ)=exp(−4π)` is a different parameter, and `dz_c=dz/(2i)` on the fibre.
- For `Γ(N)`, `N≥3`, `w=N` at infinity and `q=q_N^N`.
- For `Γ₀(N)` at infinity `w=1` and at 0 `w=N`.
- An irregular `Γ₁(4)` cusp has strict width twice its effective width; use the effective parameter for the coarse local ring.

*Needs:* [§1.4](#s1-4); [§3.6](#s3-6); [§3.14](#s3-14); [§4.1](#s4-1); [§4.4](#s4-4); [ModularForms Layer 10A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve); Mathlib `PeriodPair`; Tau Ceti `TauCeti.Subgroup.integerCuspWidth`; [FuchsianOrbifolds Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA).

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.1–4.4, pp.310–311; [Conrad, classical curves](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), §3, Proposition 3.1, pp.3–4; [Conrad, q-expansions](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.1–3; [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §4, p.48.)

<a id="s4-9"></a>

### 4.9 Connectedness under the chosen algebraic closure extension

For the actual finite-type smooth curve `Y(ρ)/Q` and the chosen algebraically closed extension `Q̄→C`, `Y(ρ)_Q̄` is connected if and only if `Y(ρ)_C` is connected. The same holds for the fixed-pairing curve over its algebraic closure. This is the first MC5C comparison contract for these carriers. It is the special case of the invariance of connected components under extension of a separably closed base field (Stacks, Lemma 33.7.6, tag 0363), not a new general base-change theory.

`N≥3` and the actual MC5B/5C finite-type schemes are used.

Both fields are algebraically closed; a comparison of rational-point sets would not imply this statement.

For every scheme X over a separably closed field k and every field extension `K/k`, the projection `X_K→X` induces a bijection on connected components (Stacks 0363). SchemeAndStackFoundations §0.7, `geometric_irreducible_components`, states the irreducible-component version (tag 038H), ModularCurves 0E (descent and spreading out) does not state it, and MC5C lists it among its external contracts.

Establish this as follows. For X of finite type over the algebraically closed field `Q̄` and any extension K, the projection `X_K→X` induces a bijection on connected components (Stacks 0363). Apply this to `X=Y(ρ)_Q̄` and `K=C`: the finite set of connected components is unchanged, and nonemptiness is preserved. Use the resulting equivalence as the first named MC5C comparison contract, separately from the analytic isomorphism and the C4 connectedness theorem.

The public interface should expose:

- `geometricConnectednessFieldExtension`: For the actual finite-type smooth curve `Y(ρ)/Q` and the chosen algebraically closed extension `Q̄→C`, `Y(ρ)_Q̄` is connected if and only if `Y(ρ)_C` is connected. The same holds for the fixed-pairing curve over its algebraic closure. This is the first MC5C comparison contract for these carriers, the special case of Stacks Lemma 33.7.6 (tag 0363), not a new general base-change theory.

**Checks.**

- The result has an explicit algebraically closed field-extension hypothesis.
- No compactification or compact uniformization statement is used.
- Separably closedness is essential: `Spec ℂ` is connected over `ℝ`, whereas its base change to `ℂ` has two connected components.

*Needs:* [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 5C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ); `SchemeAndStackFoundations §0.7/geometric_irreducible_components`.

([Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Theorem 17.21, p.42; [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1–§1.2, pp.17–25; [Stacks Project](https://stacks.math.columbia.edu), Lemma 33.7.6, tag 0363.)

<a id="s4-10"></a>

### 4.10 Geometric connectedness of a fixed-pairing curve

For `N≥3` and a primitive pairing value `ζ`, the nonempty smooth affine curve `Y(N,ζ)` over `Q(ζ)` is geometrically connected and geometrically irreducible. After an embedding `Q̄→C` its analytification is `Γ(N) \ H` and is connected. The algebraic connectedness assertion is invariant under the algebraically closed extension `Q̄→C`. The unrestricted full-level curve over C has exactly `φ(N)` geometrically irreducible components, indexed by primitive pairing values.

Use the fixed-pairing fibre of MC5B, not all ordered bases.

Algebraic/analytic connectedness is imported only for finite-type smooth affine C-curves from C4; no nonproper GAGA morphism theorem is asserted.

Algebraically closed extension invariance for this finite-type curve is [§4.9](#s4-9) (Stacks 0363); ModularCurves 0E does not supply it.

Establish this as follows. The upper half-plane is connected, so its continuous surjective quotient by `Γ(N)` is connected. Apply the C4 smooth-affine connectedness equivalence to the actual fine curve and the Layers 3 and 4 analytic isomorphism. Use faithful scalar-extension invariance of geometric connectedness to pass from C to `Q̄`. Apply ComplexComparisonPartII C4’s smooth-connected curve irreducibility theorem, whose locally Noetherian domain-stalk leaf is already in Tau Ceti.

The theorem is `fixedPairingGeometricConnectedness`.

**Checks.**

- The C4 input is a scheme–analytic connectedness equivalence for the smooth affine curve.
- At `N=3` the unrestricted full curve has two components, each connected.
- Connectedness without local domain stalks would not justify irreducibility.

*Needs:* [§3.14](#s3-14); [§4.9](#s4-9); [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 5C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `ComplexComparisonPartII` C4.5 (`affineCurveConnectedness`); Tau Ceti `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`.

([Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §9, pp.20–22, and Theorem 17.21, p.42; [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–25.)

<a id="s4-11"></a>

### 4.11 The cyclotomic fixed-pairing compactification

The Weil-pairing determinant on the ordinary full-level locus extends to a map `Xfull(N)→Spec Z[ζ_N]`, using the primitive cyclotomic algebra rather than the possibly nonreduced primitive-root subset of `μ_N`. Over this base the full-level stack is proper flat Cohen–Macaulay of relative dimension one and smooth near the boundary. Its characteristic-zero `ζ` fibre is the fixed-pairing curve of MC5B and its geometric fibres are connected. The proof uses generic connectedness from [§4.10](#s4-10) and proper Stein factorization. It does not claim that the bad-characteristic fibres are geometrically irreducible or smooth everywhere.

`N≥1`; `Z[ζ_N]` denotes `Z[T]/(Φ_N)`, with the specified structural root.

The all-pairings stack over Z and a geometric fixed-pairing component are distinct objects.

At primes dividing N the cyclotomic base can be ramified; roots are not labelled by distinct geometric points there.

Establish this as follows. Extend the primitive pairing map from the ordinary invertible-level locus by normality of `Xfull(N)` and the integral closure defining the cyclotomic algebra. Use the full-level boundary charts and the ordinary local-ring supplier to establish flatness over the cyclotomic base, Cohen–Macaulayness and boundary smoothness. Use the geometrically connected generic determinant fibre and proper Stein factorization to obtain geometric connectedness of all fibres.

The theorem is `fixedPairingIntegralComponents`.

**Checks.**

- For `N=5`, its generic Z-base change to C has four connected pairing components.
- Bad fibres may have several irreducible components despite being connected.
- The extension is an algebraic target and does not use compact analytic uniformization.

*Needs:* [§3.2](#s3-2); [§4.10](#s4-10); [ModularCurves Layer 2E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing); [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `SchemeAndStackFoundations Layer 4`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1(3), p.31; Theorem 4.2.1(1), p.35; Lemma 4.2.4, p.37; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §4.3, pp.37–39.)

<a id="s4-12"></a>

### 4.12 Agreement on the ordinary and tame loci

Restricting the integral stacks to the elliptic locus recovers the exact ordinary Katz–Mazur level functors supplied by MC3C/7B/8D and their existing representing schemes where their fine hypotheses hold. After inverting the relevant level, the full and point compactifications agree with the normalizations of `X(1)` in those ordinary covers; the refined `Γ₀` compactification is the corresponding normalization over all of Z. The resulting stack comparisons supply the level-H construction in Layers 3 and 5, whose coarse construction is compared with the existing prime `N≥5`, `Z[1/N]` diamond-quotient model at [§5.18](#s5-18).

Use the exact level functor, structural cyclotomic base, and fine/coarse distinction on each overlap.

The naive cyclic stack is not substituted for the refined normalization at nonsquarefree N.

This is an identification of carriers and morphisms; ordinary Katz–Mazur representability is supplied by ModularCurves.

Establish this as follows. Restrict the divisor/full-set conditions to a smooth proper elliptic family, where they are the imported definitions. Uniqueness of representing objects gives the ordinary identification. Use normality, properness and the shared dense ordinary cover to identify the compact stack normalizations. Keep the full cyclotomic base and the point/cyclic level carriers in these identifications. Export the stack agreement to the coarse construction; its comparison to MC Layer 10 is [§5.18](#s5-18), not a prerequisite of this construction.

The theorem is `agreementWithKatzMazurSchemes`.

**Checks.**

- The existing prime-level `Z[1/N]` diamond quotient is reused.
- The all-pairings ordinary full moduli and a fixed-pairing fibre are compared on their respective bases.
- At `N=4`, naive and refined boundary objects remain distinct.

*Needs:* [§3.2](#s3-2); [§3.4](#s3-4); [§4.11](#s4-11); [ModularCurves Layer 3C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#3c-the-four-level-structures); [ModularCurves Layer 7B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#7b-local-algebra-and-local-schemes); [ModularCurves Layer 8D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n); [ModularCurves Layer 9D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients); `AlgebraicModuliForArithmeticGeometry §5.4/ArithmeticModuli.DMNormalization.stack`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1, p.31; Theorem 4.2.1 and Remark 4.2.2, pp.35–36; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Theorems 4.3.5 (p.39) and 4.4.4 (p.40); §5.10, p.58.)

### Examples

No level and the chosen 1-gon chart give parameter q and width 1.

`N=d=5` has two cyclotomic components, each `Spec ℤ`, and two geometric 5-gon cusps; no extra divisor label.

`N=d=4` has one 4-gon cusp, although the 2-gon boundary stratum is nowhere schematic.

### Dependencies

Use Layer 1, Layer 2, Layer 3. External contracts: AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, SchemeAndStackFoundations, TauCetiRoadmap FuchsianOrbifolds. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 5: Integral coarse modular curves

<a id="s5-1"></a>

### 5.1 The standard levels: moduli stacks as normalizations

Over `ℤ`, compatibly with the maps to `X(1)` and with the elliptic opens: (i) Layers 3 and 4's stack `Xfull(N)` of generalized elliptic curves whose degenerate fibres are N-gons with a Drinfeld `(ℤ/N)²`-structure on `E^sm[N]` is `𝒳_{Γ(N)}`; (ii) Layers 3 and 4's stack `X₁(N)` of ample Drinfeld `ℤ/N`-structures, with the contraction to `X(1)`, is `𝒳_{Γ₁(N)}`; (iii) Layers 3 and 4's refined `Γ₀(N)` stack is `𝒳_{Γ₀(N)}`. In each case the moduli stack is regular, finite and flat over `X(1)` through the contraction, and its elliptic locus over `ℤ[1/N]` is `Y_H[1/N]`. Consequently `𝒳_{Γ(N)}`, `𝒳_{Γ₁(N)}` and `𝒳_{Γ₀(N)}` are regular. The naive `Γ₀(N)` stack agrees with `𝒳_{Γ₀(N)}` on the elliptic locus and, for squarefree N, everywhere; for N not squarefree the two stacks differ even over `ℂ`, although their coarse spaces agree ([§5.4](#s5-4)). `𝒳_{Γ(N)}` is a projective scheme over `ℤ` for `N≥2` unless `N=p^s` or `N=2p^s (s≥1)`; `𝒳_{Γ(1)}=X(1)` is not a scheme (level one retains generic inversion).

`N≥1`.

The Layers 3 and 4 stacks carry the regularity, finiteness over `X(1)` and Cartier boundary established in Layers 3 and 4.

Establish this as follows. Each of the Layers 3 and 4 stacks is regular, hence normal, and its contraction to `X(1)` is representable, finite and flat (§§3.15 and 3.2). Its elliptic locus over `ℤ[1/N]` has the moduli interpretation of `Y_H[1/N]` (§4.12; upstream 3D), and its boundary is a relative effective Cartier divisor, so the elliptic locus is dense and meets every component. The finite-normal recognition criterion of ModularCurves Layer 10 (applied on an étale atlas of `X(1)`) identifies it with the normalization `𝒳_H`. The naive comparison and the scheme property are §§3.4–3.5.

**Checks.**

- For `N=p²`, the naive and refined `Γ₀` stacks are different over `ℂ` while having the same coarse curve `X₀(p²)`.
- `𝒳_{Γ(3)}`, `𝒳_{Γ(4)}` and `𝒳_{Γ(6)}` are not schemes over `ℤ (N=p^s or 2p^s)`, while `𝒳_{Γ(12)}` and `𝒳_{Γ(15)}` are projective schemes (`N=n₁n₂` with coprime `n₁,n₂≥3`).

*Needs:* the finite-normal recognition contract of ModularCurves Layer 10; [§3.2](#s3-2); [§3.4](#s3-4); [§3.5](#s3-5); [§3.12](#s3-12); [§3.15](#s3-15); [§4.12](#s4-12); [ModularCurves Layer 3D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#3d-comparison-with-naive-level-structures).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Theorem 4.3.5 and Proposition 4.3.6, p.39; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Theorem 4.4.4, pp.40–41; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Theorem 5.13(a), p.60; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1, p.31; Remark 4.2.2, p.36.)

<a id="s5-2"></a>

### 5.2 Integral coarse modular curves

For an open `H≤GL₂(Ẑ)` containing `Γ(n)`, take the finite-inertia coarse space `X_H` of the corresponding compactified level stack `𝒳_H` ([§3.12](#s3-12); for the full, `Γ₁` and refined `Γ₀` levels it is Layers 3 and 4's moduli stack, by [§5.1](#s5-1)). It is a projective normal `ℤ`-scheme, finite locally free over `ℙ¹_j` and flat of relative dimension one. The construction is algebraic: normalize the j-line in the generic level algebra and compare the stack coarse space to this normalization. Full level has its determinant/cyclotomic constant algebra, fixed-pairing level is over the corresponding cyclotomic integer base, `Γ₁` is the marked-generator problem, and `Γ₀` uses the refined cyclic-subgroup stack. Keep disconnected full-level generic components in the normalization algebra. No analytic connectedness or Layer 8 is used.

Establish this as follows. Apply finite-inertia coarse existence to the actual level stack; descend the finite j-map through the categorical universal property. Compare on the dense generic level locus with integral closure in its full generic algebra. Normality, projectivity and Cohen–Macaulayness in dimension two yield the finite locally free j-map by Česnavičius §6.1, p.62, using miracle flatness (Stacks 00R4).

The public interface should expose:

- `integralCoarseCurve`: `X_H` with coarse map, j-map and dense elliptic open.
- `integralCoarseCurve_universal`: Any map of the level stack to an algebraic space factors uniquely through `X_H`.
- `integralCoarseCurve_normal`: `X_H` is normal and projective over `ℤ`.
- `integralCoarseCurve_j`: The j-map is finite locally free; the full-level generic algebra retains every determinant component.
- `integralCoarseCurve_levelMap`: Maps of the specified level stacks induce coarse maps by categorical universality; composing level maps composes the induced maps.

**Checks.**

- `X(1)=ℙ¹_ℤ` with its j coordinate.
- Over `ℂ` honest full level 5 has four determinant components; fixed pairing has one.
- The universal elliptic curve does not descend to `X(1)` merely because a coarse space exists.
- For `H=GL₂(Ẑ)` (level 1) the result is `ℙ¹_j` over `ℤ`.
- A fixed Weil pairing changes the base; forgetting it is not a geometrically connected full-level curve over `ℚ`.

*Needs:* [§3.2](#s3-2); [§3.4](#s3-4); [§3.12](#s3-12); [§4.1](#s4-1); [§5.1](#s5-1); `SchemeAndStackFoundations §1.23/keel_mori`; [§3.9](#s3-9); `AlgebraicModuliForArithmeticGeometry §7.5/arithmetic_normalization_genericallyEtale`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §6.1–6.3, pp.62–63.)

<a id="s5-3"></a>

### 5.3 Base change for coarse modular curves

The coarse formation `X_H` commutes with arbitrary base change over `ℤ[1/gcd(6,n)]` and `X_H` is smooth over `ℤ[1/n]`, where `Γ(n)⊂H`. Away from 6 one uses tame inertia; at 2 or 3 with that prime not dividing n use the separate normal-fibre/rigidification argument of Česnavičius Proposition 6.4. Elsewhere retain only the applicable flat or tame base-change theorem. `Γ₁(4)` in characteristic 2 is an explicit obstruction to unrestricted coarse base change. Normalization is not asserted to commute with arbitrary base change.

Establish this as follows. Apply tame coarse invariants after inverting 6. At a level-prime-free 2 or 3, use the finite normal fibre comparison and the rigidification argument in Proposition 6.4. Keep the characteristic-2 counterexample outside the statement.

**Checks.**

- `n=5` allows arbitrary base change over all `ℤ`, even though stack stabilizers need not be tame at 2 or 3.
- `n=4` only provides the advertised arbitrary range after inverting 2.

*Needs:* [§5.2](#s5-2); `AlgebraicModuliForArithmeticGeometry §5.1/ArithmeticModuli.Rigidification.base_change`; `SchemeAndStackFoundations §1.23/keel_mori`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 6.4, pp.63–64, and Remark 6.6, p.64.)

<a id="s5-4"></a>

### 5.4 Regularity at integral `Γ₀` cusps

For every `N≥1`, the integral `Γ₀(N)` coarse curve is regular at every cusp, including residue characteristics 2 and 3. More generally Česnavičius Theorem 6.7 gives regularity after removing the closed bad-prime points with `j=0` or 1728. The refined and naive `Γ₀` stacks have the same coarse curve for all N by Proposition 6.9; the refined stack remains necessary for stack regularity, finite-inertia descent and compactified level maps. This theorem gives a regular neighbourhood of the boundary, not smoothness of the whole fibre at a level-dividing prime.

Establish this as follows. Compute prime-power cusp covers by normalizing the Tate cyclic-subgroup cover. Factor prime-to-p level and normalize; exchange the two mixed cusp types using the dual cyclic isogeny. Use the all-level coarse comparison to identify the resulting regular rings with the refined coarse curve.

**Checks.**

- `X₀(4)` has regular cusps at 2; this does not make the `Γ₁(4)` coarse base-change assertion true.

*Needs:* [§4.1](#s4-1); [§5.2](#s5-2).

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), Proposition 1.2.2.1 and Theorem 1.2.3.1, pp.37–38; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Theorem 6.7, pp.64–65, and Proposition 6.9, p.65.)

<a id="s5-5"></a>

### 5.5 Prime-power `Γ₀` cusp rings

For every prime p and `n≥1`, the normalized Tate `Γ₀(pⁿ)` cover of `ℤ[[q]]` is the disjoint union of `ℤ[[q]]`, `ℤ[[s]]` with `q=s^(pⁿ)`, and, for `a+b=n` with `a,b>0`, the following rings: if `a≥b`, `ℤ[ζ_(pᵇ)][[q]]`; if `b>a`, `ℤ[ζ_(pᵃ)][[q]][z]/(z^(p^(b−a))−ζ_(pᵃ)q)`. These are q-adically complete finite rings, each regular. The generic mixed component comes from the cyclotomic condition `Φ_p(z^(p^(b−1))/q^(p^(a−1)))=0` before normalization. For `Γ₀(pⁿM)`, `p∤M`, factor the generic level cover, tensor with the prime-to-p cusp cover and normalize; the tensor product before normalization need not be normal. This is a composite/bad-level extension; prime-level rings after inverting p remain Layer 10’s.

Establish this as follows. Split the generic cyclic Tate subgroup cover by `a+b=n`. For `a≥b` divide the coordinate by the appropriate q power, giving a primitive pᵇ root; for `b>a` adjoin z with the displayed relation. Check regularity in these parameters and compare with the integral closure; normalize the prime-to-p tensor product.

**Checks.**

- For `n=1` the cover has exactly `ℤ[[q]]` and `ℤ[[s]]`, `q=s^p`, of degrees 1 and p.
- `n=2` gives two outer charts and `ℤ[ζ_p][[q]]`; their j-degrees sum to `1+p²+(p−1)=p²+p`.
- For `p=3,n=3,(a,b)=(2,1)`, the mixed chart is `ℤ[ζ₃][[q]]`, of degree 2; the reversed `(1,2)` chart has `z³=ζ₃q` and degree 6.
- `p=2,n=3,(a,b)=(1,2)` gives `z²=−q`, a regular formal cusp chart at 2 despite its ramification.

*Needs:* [§4.1](#s4-1); [§5.4](#s5-4).

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.2.2, Proposition 1.2.2.1, p.37; §1.2.3, p.38.)

<a id="s5-6"></a>

### 5.6 The cyclic modular polynomial

For `m≥2` define `Φ_m(U,V)` by the generic cyclic degree-m quotient of the universal j-elliptic curve: its roots in V are `j(E/C)` for cyclic subgroups C of order m. This gives the irreducible polynomial in `ℤ[U,V]`, monic of degree `ψ(m)=m∏_(p|m)(1+1/p)` in each variable, symmetric in U,V. Set `Φ₁(U,V)=V−U` with this orientation. The map (j,j′) from `Y₀(m)_ℚ` is finite birational onto the plane curve `Φ_m=0`, and `ℚ(X₀(m))=ℚ(j,j′)`; the smooth coarse curve is its normalization. The integral plane image is not asserted to be the normal integral modular curve, nor does this normalization commute with arbitrary reduction. Cyclic degree `ψ(m)` differs from the full-subgroup Hecke degree `σ₁(m)`.

For a characteristic-zero field K, elliptic curves E,E′ over K and `m≥1`, the equality `Φ_m(j(E),j(E′))=0` is equivalent to the existence of a cyclic degree-m isogeny `E_K̄→E′_K̄`, for a fixed algebraic closure K̄. Over K itself, a cyclic degree-m isogeny `E→E′` exists exactly when there is a K-defined cyclic subgroup scheme `C⊂E` of order m and a K-isomorphism `E/C≅E′` of elliptic curves. Equivalently, `C(K̄)` is Galois-stable and the quotient is K-isomorphic to the prescribed target. Equality of j-invariants alone gives an isomorphism only after passage to K̄.

Establish this as follows. On the generic j-line take the characteristic polynomial of the target j over the cyclic subgroup algebra. Use finite local freeness of the cyclic coarse algebra over `ℤ[j]` to make the characteristic polynomial integral; its generic distinct roots give the minimal polynomial. Dual isogeny supplies symmetry for `m≥2`. Generic distinct targets give birationality and the stated function-field equality; normalize the plane image, rather than identifying it as a smooth model.

For the geometric criterion, specialize the cyclic-subgroup polynomial over K̄: its roots are the invariants of the quotients `E_K̄/C`. A root equal to `j(E′)` gives an isomorphism of that quotient with `E′_K̄`. For the criterion over K, factor an isogeny through its kernel using ModularCurves Layer 2B; conversely compose the K-quotient map with the specified K-isomorphism.

The public interface should expose:

- `modularPolynomial`: The normalized integral polynomial with its distinguished orientation at `m=1`; a README target, represented as a polynomial in V with coefficients in `ℤ[U]`.
- `modularPolynomial_cyclic`: For a characteristic-zero field K, elliptic curves E,E′ over K and `m≥1`, `Φ_m(j(E),j(E′))=0` if and only if there is a degree-m isogeny `E_K̄→E′_K̄` with cyclic kernel. The isogeny is a morphism over K̄ between the base-changed curves.
- `modularPolynomial_degree`: For `m≥2` its degree in each variable is `ψ(m)`, with leading coefficient 1.
- `modularPolynomial_dual`: For `m≥2` dual cyclic isogenies interchange the variables and preserve `Φ_m`.
- `modularPolynomial_normalization`: `Y₀(m)_ℚ` is the normalization of the affine plane image, with function field `ℚ(j,j′)`.

**Checks.**

- `Φ₁(U,V)=V−U`; swapping variables changes its sign.
- At `m=1`, the criterion is `j(E)=j(E′)` if and only if `E_K̄≅E′_K̄` as elliptic curves.
- Over `ℚ`, the quotient of `E:y²=x³−x` by `⟨(0,0)⟩` is `E₀:y²=x³+4x`, with affine map `(x,y)↦(x−1/x,y(1+1/x²))` for `x≠0`. Over `ℚ(√2)`, the map `(x,y)↦(2x,2√2y)` identifies E₀ with `E′:y²=x³+16x`, so the composite is a cyclic degree-two geometric isogeny and `Φ₂(1728,1728)=0`.
- The same E and E′ have good reduction at 5, but `#E(𝔽₅)=8` and `#E′(𝔽₅)=4`, including infinity. Their affine solution counts over `x=0,1,2,3,4` are `(1,1,2,2,1)` and `(1,0,1,1,0)`. Different Frobenius traces rule out a `ℚ`-isogeny, despite the modular-polynomial equality.
- `deg_V Φ₄=6`, not 7.
- A special elliptic pair can admit several cyclic isogenies of degree m; its plane image point does not encode a unique subgroup or a universal family.
- `ψ(4)=6` whereas `σ₁(4)=7`; `E[2]` is the extra noncyclic subgroup of order 4.
- For a transcendental j, `Φ₂(j,V)` has degree 3.

*Needs:* [§2.8](#s2-8); [§5.2](#s5-2); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients); [ModularCurves Layer 2E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing).

([Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §3.1(ii),(v), pp.645–646; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §1, p.226; [Milne, Modular Functions and Modular Forms, v1.31](https://www.jmilne.org/math/CourseNotes/MF.pdf), Theorem 6.1, pp.88–90; §8, pp.97–100, especially the cyclic subgroup and quotient-isogeny descriptions preceding Theorem 8.6.)

<a id="s5-7"></a>

### 5.7 Projective scalar level quotients

For prime `p>3` over `ℤ[1/p]`, form the coarse quotient of honest full level p by scalar change of frame `a∈𝔽_p×`. It classifies a torsion framing modulo scalar up to isomorphism, as a coarse moduli space. The element `[−1]` remains an automorphism of the unrigidified projective-frame stack, so this quotient is not a fine moduli scheme carrying a descended universal curve. Over `ℂ` it has two components indexed by the square class of the determinant/Weil pairing; `PGL₂(𝔽_p)` exchanges these when the determinant is nonsquare, and `PSL₂` fixes each. On the p-gon compactification, distinguish full raw stabilizers from the effective rigidification by `[−1]`; the effective ramification orders over the j-line are 2,3,p. The p-gon automorphism and torsion carriers themselves are imported from Layer 2.

Establish this as follows. Take the scalar quotient of the honest framing stack, keeping its residual central automorphism. Compute the determinant action `a↦a²` and then the `PGL₂` action. Use the p-gon formal parameter and imported automorphism action; rigidify the ubiquitous `[−1]` before reading effective inertia orders.

The public interface should expose:

- `projectiveLevelCurve`: The coarse scalar quotient with its map from honest full level.
- `projectiveLevelCurve_pairingClass`: The Weil pairing is retained only modulo squares.
- `projectiveLevelCurve_pglAction`: The effective `PGL₂` action permutes the two components by determinant square class.
- `projectiveLevelCurve_rigidification`: Rigidification removes the central `[−1]` from inertia while preserving the coarse curve.
- `projectiveLevelCurve_cusp`: The completed p-gon cover has effective inertia p; before rigidification the stabilizer contains the inversion factor.

**Checks.**

- `p=5` gives two scalar-framed complex components, not four and not one.
- `[−1]` fixes a projective framing and prevents a fine universal family.
- After rigidification the three ramification orders are 2,3,p, matching the analytic (2,3,p) orbifold from [§3.14](#s3-14).
- For `p=5` honest full level has 4 complex components and the scalar quotient has 2; on one component the effective covering group is `PSL₂(𝔽₅)`.

*Needs:* [§2.1](#s2-1); [§4.1](#s4-1); [§5.2](#s5-2); `AlgebraicModuliForArithmeticGeometry §5.1/ArithmeticModuli.Rigidification.stack`; `AlgebraicModuliForArithmeticGeometry §5.1/ArithmeticModuli.Rigidification.coarse`.

([Bakker–Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.1–2.2, pp.713–715; §3, p.717.)

<a id="s5-8"></a>

### 5.8 Geometry of the level-H stacks

For every open level subgroup H and n with `Γ(n)⊂H`: (a) `𝒳_H→X(1)` is representable, finite, surjective and locally free of rank `[GL₂(Ẑ):H]`; (b) `𝒳_H` is a normal, Cohen–Macaulay, Deligne–Mumford stack, proper and flat over `ℤ`, with all fibres of pure dimension one; (c) `𝒳_H` is smooth over `ℤ[1/n]`, and over `ℤ[1/n]` its elliptic open `Y_H[1/n]` is the quotient stack `[Y(n)_{ℤ[1/n]}/H̄]` of the full-level elliptic stack by right translation of frames; the quotient stack `[X(n)_{ℤ[1/n]}/H̄]` of the whole compactified full-level stack is not `𝒳_H[1/n]` in general, because the rotations `μ_n` of the n-gon cusps act on `E^sm[n]=μ_n×ℤ/n` by unipotent matrices [[1,*],[0,1]] and contract to the identity of `X(1)`, so its map to `X(1)` is not representable (for `H=GL₂(Ẑ)` it is `Ell_n[1/n]`, not `X(1)[1/n]`); (d) for `H′⊂H` the morphism `𝒳_{H′}→𝒳_H` is finite and surjective of degree [H:H′], and it is flat at every point where `𝒳_H` is regular; (e) the open locus of `𝒳_H` whose geometric points have trivial automorphism group is a quasi-projective `ℤ`-scheme, and `𝒳_H` is a projective scheme when every geometric point has trivial automorphism group. Regularity of `𝒳_H` at points of residue characteristic dividing n is not asserted for general H.

H open; n with `Γ(n)⊂H`.

Statement (c) uses the `GL₂(ℤ/n)`-torsor `Y(n)[1/n]→Ell_{ℤ[1/n]}` and the full-level formal cusp charts ⊔Spec `ℤ[ζ_n][[q^{1/n}]]` of `𝒳_{Γ(n)}` over the Tate chart of `X(1)`.

Establish this as follows. (a) Finiteness is by construction; surjectivity because `X(1)` is irreducible ([§3.11](#s3-11)); `X(1)` is regular of dimension two and `𝒳_H` normal of dimension two, hence Cohen–Macaulay, so the finite map is flat (Stacks 00R4; EGA `IV₂` 6.1.5 as cited by Česnavičius); its rank is read on the elliptic locus over `ℤ[1/n]`. (b) Normality is inherited from `Y_H[1/n]` by relative normalization; properness and flatness over `ℤ` come from `X(1)` through (a). (c) On the elliptic open, `Y(n)[1/n]→Ell_{ℤ[1/n]}` is a `GL₂(ℤ/n)`-torsor ([§3.9](#s3-9)), so `Y_H[1/n]=[Y(n)[1/n]/H̄]` is finite étale over `Ell_{ℤ[1/n]}`, hence smooth over `ℤ[1/n]`. Along the cusps, `𝒳_H×_{X(1)}Spf ℤ[1/n][[q]]` is the normalization of `ℤ[1/n][[q]]` in the level-H structures on the Tate curve over `ℤ[1/n]((q))` (normalization commutes with this base change because `ℤ[[q]]` is excellent, Conrad Lemma 4.1.6), i.e. the `H̄`-invariants of the full-level chart, a finite product of copies of `ℤ[1/n,ζ_n][[q^{1/n}]]` (§4.1; Conrad (4.2.1)); the stabiliser of a factor acts on `ζ_n` through a free Galois action and on `q^{1/n}` by n-th roots of unity, so its invariants are power series rings over rings finite étale over `ℤ[1/n]`, and `𝒳_H` is smooth over `ℤ[1/n]` along the cusps (Česnavičius §4.1.2 cites Deligne–Rapoport IV.6.7). The whole quotient stack `[X(n)/H̄]` is not used: at the cusp `∞` of `X(p)` the p-gon with level structure `(ζ_p,(1,1))` is fixed, up to the unipotent element `[[1,k],[0,1]]∈Γ₀(p)‾`, by each rotation, which contracts to the identity of the 1-gon (compare Česnavičius §1.2, p.2). (d) Normalization functoriality gives the finite map; miracle flatness at regular points of the target; the degree is computed on `Y_{H′}[1/n]→Y_H[1/n]`. (e) A Deligne–Mumford stack with trivial geometric automorphism groups and quasi-compact separated diagonal is an algebraic space (Česnavičius Lemma 3.2.2(a)); it is quasi-finite and separated over `ℙ¹_ℤ` through the coarse j-map, hence a quasi-projective scheme (Lemma 4.1.3 and Remark 4.1.4).

**Checks.**

- rank `𝒳_{Γ₁(5)}→X(1)` is 24 while the coarse degree of `X₁(5)→ℙ¹` is 12.
- `𝒳_{Γ(N)}` is a projective scheme for `N≥2` not of the form `p^s` or `2p^s`, and is not a scheme for `N=p^s`, `2p^s` because supersingular points in characteristic p keep the automorphism `−1`, nor for `N=1` ([§5.1](#s5-1)).

*Needs:* the finite-normal recognition contract of ModularCurves Layer 10; [§2.11](#s2-11); [§3.2](#s3-2); [§3.9](#s3-9); [§3.11](#s3-11); [§3.12](#s3-12); [§4.1](#s4-1); [§5.1](#s5-1); `SchemeAndStackFoundations §1.21`; `SchemeAndStackFoundations §1.20`; Mathlib `AlgebraicGeometry.Flat`; Mathlib `AlgebraicGeometry.IsFinite`; `SchemeAndStackFoundations §1.19`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §4.1.2, p.28; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 4.1.3 and Remark 4.1.4, p.28; Lemma 3.2.2(a), p.20; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 4.3.2(a), p.37; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Remark 4.1.4, pp.28–29; [Stacks Project](https://stacks.math.columbia.edu), Tag 00R4; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), proof of Theorem 4.1.1, p.34; (4.2.1), p.37.)

<a id="s5-9"></a>

### 5.9 Local structure of coarse level curves

Let H be an open level subgroup, `π:𝒳_H→X_H` the coarse space, `x̄` a geometric point of `𝒳_H` and `Γ_x̄` its finite automorphism group. (a) There are an étale neighbourhood `U→X_H` of `π(x̄)` and a finite U-scheme V with a `Γ_x̄`-action such that `𝒳_H×_{X_H}U≅[V/Γ_x̄]` and `U=V/Γ_x̄`. (b) The strict henselization of `X_H` at `π(x̄)` is the ring of `Γ_x̄`-invariants of the strict henselization of `𝒳_H` at `x̄`, and the same holds after completion: `Ô^{sh}_{X_H,π(x̄)}=(Ô^{sh}_{𝒳_H,x̄})^{Γ_x̄}`. (c) `Γ_x̄` acts through its effective quotient `Γ_x̄^{eff}=Γ_x̄/(Γ_x̄∩{±1})` when `−I∈H̄`, and through `Γ_x̄` itself otherwise; this quotient acts faithfully. (d) If `x̄` lies over `j(x̄)≠∞` in residue characteristic prime to n, then `𝒳_H→X(1)` is étale at `x̄`, `Γ_x̄` is the subgroup of `Aut(E_x̄)` fixing the level structure, and the local degree of `X_H→ℙ¹_j` at `π(x̄)`, the degree of the extension of fraction fields of the strictly henselian local rings, is `[Aut(E_x̄)/{±1} : Γ_x̄^{eff}]`, where `Γ_x̄^{eff}` denotes the image of `Γ_x̄` in `Aut(E_x̄)/{±1}`; at a point of the generic fibre this is the ramification index, while at a closed point of residue characteristic p the local rings are two-dimensional and the local degree is the relevant invariant. For `H=Γ₀(N)` and any geometric point `x̄=(E,C)`, `Γ_x̄=Aut(E,C)` contains `{±1}`, and the strictly henselian local ring of `X₀(N)` is the invariant ring of that of the refined stack under `Aut(E,C)/{±1}`. (e) On the open of `X_H` over which every geometric stabiliser has invertible order, in particular over `ℤ[1/6]` (stabilisers have order dividing 24 because `𝒳_H→X(1)` is representable), a line bundle L on `𝒳_H` is the pullback of a line bundle on `X_H` if and only if every `Γ_x̄` acts trivially on the fibre `L(x̄)`, and then `L≅π*π_*L`; `ω^{⊗12}` on `X(1)` is the pullback of `𝒪_{ℙ¹}(1)` through the section `Δ`, while `ω` itself does not descend because `−1` acts on it by `−1`.

H open; `𝒳_H` as in [§3.12](#s3-12), a separated Deligne–Mumford stack of finite type over `ℤ` with finite inertia.

Statement (d) uses that `Y_H[1/n]→Ell_{ℤ[1/n]}` is finite étale; statement (b) for completions uses flatness of completion over the noetherian strictly henselian ring.

For `Γ₀(N)` the stack is the refined, Deligne–Mumford stack; the naive `Γ₀(N)` stack has non-étale automorphism groups at some cusps when N is not squarefree and is not used here.

Establish this as follows. (a) is §0.1 applied to `𝒳_H` (Česnavičius uses the same local structure, through Olsson’s version, in the proof of Proposition 6.4(b)), with V a component of an étale atlas over the strict henselization and `Γ_x̄` the stabiliser. (b) Strict henselization is ind-étale, hence flat, and taking invariants of a finite group commutes with flat base change; Conrad's proof of the Keel–Mori theorem gives exactly this invariant-subring description. Completion of a noetherian local ring is flat, so invariants also commute with completion. (c) The generic automorphism group of `𝒳_H` is `{±1}` `if −I∈H̄` and trivial otherwise ([§3.9](#s3-9)), and it acts trivially on functions; the remaining group acts faithfully on the fraction field of the strictly henselian local ring because a generic deformation has no further automorphisms. (d) Over `ℤ[1/n]` the strict henselization of `𝒳_H` at `x̄` is that of Ell at `E_x̄`, and the coarse local rings of `X_H` and `ℙ¹_j` are its invariants under `Γ_x̄` and `Aut(E_x̄)`; faithful action of the effective quotients gives an extension of fraction fields of degree equal to the index, and the separably closed residue fields make it totally ramified at points of the generic fibre. For `Γ₀(N)` apply (a)–(c) to the refined stack, which is Deligne–Mumford and has the same coarse space as the naive stack ([§5.4](#s5-4)). (e) is finite flat descent through a tame coarse space (AlgebraicModuliForArithmeticGeometry §5.3, `ArithmeticModuli.tame_finite_flat_descent`; the open where the stabiliser orders are invertible is tame by SchemeAndStackFoundations §1.23, IsTame) applied to the finite locally free algebra `𝒪⊕L` with `L·L=0`, whose descent is that of L; `Δ` is a nowhere-vanishing section of `ω^{⊗12}` on Ell with a simple zero along the boundary of `X(1)`, and `j=c₄³/Δ` ([§3.11](#s3-11)).

**Checks.**

- For `X₀(N)` at a point `(E,C)` with `j(E)=1728` in characteristic prime to 6N: if C is stable under the automorphism of order 4, `Γ^{eff}` has order 2 and `X₀(N)→ℙ¹` is unramified there; otherwise `Γ^{eff}` is trivial and the local degree is 2.
- For `X₁(N)` with `N≥5` and residue characteristic prime to N, every `Γ_x̄` is trivial and `X₁(N)` is étale locally the stack itself, a fine scheme.

*Needs:* [§0.1](#s0-1); [§3.4](#s3-4); [§3.9](#s3-9); [§3.11](#s3-11); [§3.12](#s3-12); [§4.4](#s4-4); [§5.4](#s5-4); `SchemeAndStackFoundations §1.23/keel_mori`; `SchemeAndStackFoundations §1.23/finite_quotient_coarse`; `SchemeAndStackFoundations §1.19`; `SchemeAndStackFoundations §1.20`; `AlgebraicModuliForArithmeticGeometry §5.3/ArithmeticModuli.tame_finite_flat_descent`; `SchemeAndStackFoundations Layer 1`; `SchemeAndStackFoundations §1.23/IsTame`.

([Compactifying the space of stable maps](https://arxiv.org/pdf/math/9908167), Lemma 2.2.3, p.4 (arXiv v2); [The Keel–Mori theorem via stacks](https://math.stanford.edu/~conrad/papers/coarsespace.pdf), Theorem 1.1, p.1; Theorem 3.1 and its proof, pp.5–6; Theorem 4.2, p.8; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III, §1, (1.3) and the following paragraph, p.255; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), proof of Proposition 6.4(b), p.64; proof of Theorem 6.7, pp.64–65.)

<a id="s5-10"></a>

### 5.10 Degree of the j-map and the cusp divisor

For every open level subgroup H the coarse j-map `X_H→ℙ¹_ℤ`, induced from `𝒳_H→X(1)` and [§3.11](#s3-11), is finite locally free of constant rank `[GL₂(Ẑ):±H]`, the projective index. The scheme `X_H` is projective and flat over `ℤ` with all fibres of pure dimension one; `Y_H:=X_H×_{ℙ¹}𝔸¹` is the coarse space of the elliptic open `Y_H` of `𝒳_H`. The cusp divisor `X_H^∞:=X_H×_{ℙ¹}{∞}` is an effective Cartier divisor on `X_H` which is finite locally free over `ℤ` of rank `[GL₂(Ẑ):±H]`; it is the scheme-theoretic fibre, in general not reduced, and its multiplicities are the cusp widths ([§5.11](#s5-11)). The stack `𝒳_H` has rank `[GL₂(Ẑ):H]` over `X(1)`; the two degrees agree exactly when `−I∈H`.

H open; `X_H` the coarse space of `𝒳_H` ([§5.2](#s5-2)).

Establish this as follows. Finite locally free: [§5.2](#s5-2) (Česnavičius §6.1: `X_H` is normal and finite over `X(1)=ℙ¹_ℤ`, so locally free by EGA `IV₂` 6.1.5). The rank is computed at a geometric point of `𝔸¹_ℚ` with `j≠0,1728`: its preimages are the classes of level-H structures on one curve E modulo `Aut(E)={±1}`, i.e. the set `{±1} \ GL₂(ℤ/n)/H̄`, of cardinality `[GL₂(ℤ/n):±H̄]`. The coarse space of the open substack `Y_H` is the preimage of `𝔸¹` because coarse formation commutes with flat (here open) base change on `X_H`. The pullback of the Cartier divisor `∞` along a flat morphism is Cartier, and finite locally free of the same rank over `∞≅Spec ℤ`.

**Checks.**

- `X₀(N)→ℙ¹` has degree `ψ(N)`; `X₁(N)→ℙ¹` has degree `φ(N)ψ(N)/2` for `N≥3`, so 12 for `N=5`; `X(N)→ℙ¹` has degree `|GL₂(ℤ/N)|/2` for `N≥3`; `X_{C_s⁺(13)}` and `X_{C_ns⁺(13)}` have degrees 91 and 78.
- For a prime p, `X₀(p)^∞=[∞]+p·[0]`, of rank `p+1` over `ℤ`, not reduced.

*Needs:* [§3.8](#s3-8); [§3.9](#s3-9); [§3.11](#s3-11); [§5.2](#s5-2); [§5.8](#s5-8); [ModularCurves Layer 0A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors); [ModularCurves Layer 10](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering); `SchemeAndStackFoundations §1.23/keel_mori`; Mathlib `AlgebraicGeometry.Scheme.Hom.finrank`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §6.1, p.62; [On the possible images of the mod ℓ representations associated to elliptic curves over ℚ](https://arxiv.org/pdf/1508.07660), §3.2, p.15; [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), Layer 10, item 2.)

<a id="s5-11"></a>

### 5.11 Cusps of `X_H` away from the level

Let H be an open level subgroup, n with `Γ(n)⊂H`, and `u=[[1,1],[0,1]]`. Over every algebraically closed field k with `char k∤n`, the points of `X_H^∞(k)` are in bijection with the double cosets `⟨±u⟩ \ GL₂(ℤ/n)/H̄`: the coset of g is the Tate curve over `k((q^{1/n}))` with the level structure `φ₀gH̄`, where `φ₀=(ζ,q^{1/n})` for a fixed primitive n-th root of unity `ζ`, the monodromy `q^{1/n}↦ζq^{1/n}` acting by left multiplication by u and inversion by `−I`. The width of the cusp of g, equal to its ramification index over `∞` and to its multiplicity in `X_H^∞`, is the least `w≥1` with `u^w∈±gH̄g⁻¹`, and after base change to a strictly henselian base the completed local ring of `X_H` at it is a power series ring in a parameter t with `t^w` equal to q times a unit. The reduced cusp scheme `(X_H^∞)_red` is finite étale over `ℤ[1/n]` of rank `#(⟨±u⟩ \ GL₂(ℤ/n)/H̄)`, the sum of the widths is `[GL₂(Ẑ):±H]`, and `Gal(ℚ̄/ℚ)` acts on the geometric cusps through `Gal(ℚ(ζ_n)/ℚ)≅(ℤ/n)^×`, the element d acting by left multiplication by [[d,0],[0,1]].

k algebraically closed of characteristic prime to n; the bad-characteristic cusps are Layers 3–5 and [§5.4](#s5-4).

Establish this as follows. For full level the fibre of `𝒳_{Γ(n)}→X(1)` over the Tate chart is a finite disjoint union of copies of `Spec ℤ[ζ_n][[q^{1/n}]]`, compatibly with the cyclotomic structure; its components over k are the frames of the Tate curve modulo monodromy (Conrad (4.2.1); §4.1). The coarse local ring at a cusp is the invariant ring of this formal chart under the stabiliser of the component in `⟨±u⟩×H̄` ([§5.9](#s5-9) (b)); `u^b` acts by `q^{1/n}↦ζ^b q^{1/n}` and `−I` acts trivially on q. The stabiliser of the coset of g is `⟨±u⟩∩gH̄g⁻¹`, whose image in the monodromy group is `⟨u^w⟩`, so the invariants of `k[[q^{1/n}]]` are `k[[q^{1/w}]]` and the ramification index over q is w. Over `ℤ[1/n]` the Galois group of `ℤ[1/n,ζ_n]` acts freely on the coefficients; the invariant ring of `ℤ[1/n,ζ_n][[x]]` under a group acting semilinearly in this way is `R[[y]]` with R finite étale over `ℤ[1/n]`, which gives the finite étale reduced cusp scheme. `σ_d` sends `φ₀=(ζ,q^{1/n})` to `(ζ^d,q^{1/n})=φ₀·[[d,0],[0,1]]`, hence acts on `φ₀gH̄` by left multiplication by [[d,0],[0,1]].

**Checks.**

- `X₀(p)`: two cusps, of widths 1 and p, both `ℚ`-rational.
- `X₁(p)` for `p≥5` prime: `(p−1)/2` cusps of width 1, conjugate over `ℚ(ζ_p)⁺`, and `(p−1)/2` cusps of width p, each `ℚ`-rational; the widths sum to `(p²−1)/2`.
- `X(N,ζ)` for `N≥3`: `|SL₂(ℤ/N)|/(2N)` cusps per component, each of width N (twelve cusps for `N=5`).
- `X₀(N)`: the cusps are the `⟨±u⟩`-orbits on `ℙ¹(ℤ/N)`, of number `Σ_{d|N} φ(gcd(d,N/d))`.

*Needs:* [§3.6](#s3-6); [§4.1](#s4-1); [§5.1](#s5-1); [§5.8](#s5-8); [§5.9](#s5-9); [§5.10](#s5-10); [ModularCurves Layer 2E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), (4.2.1) and proof of Lemma 4.2.4, p.37; proof of Theorem 4.1.1, p.34; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Definition 4.3.1 and Lemma 4.3.2, p.37; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III, §1, p.255; [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), Layer 10, item 2.)

<a id="s5-12"></a>

### 5.12 The cyclotomic structure of `X_H`

Let H be an open level subgroup, n with `Γ(n)⊂H`, `D_H=det(H̄)⊂(ℤ/n)^×`, and `O_H` the ring of integers of the subfield `ℚ(ζ_n)^{D_H}` fixed by `{σ_d : d∈D_H}`, `σ_d(ζ)=ζ^d`. The Weil pairing gives a morphism `det:Y_H[1/n]→Spec O_H[1/n]`, sending `(E,φH̄)` to the `D_H`-orbit of `e_n(φ(e₁),φ(e₂))`, well defined because `e_n((P,Q)g)=e_n(P,Q)^{det g}`; it extends uniquely to a morphism `X_H→Spec O_H`, proper and flat. For `H′⊂H` the level map `X_{H′}→X_H` lies over `Spec O_{H′}→Spec O_H`; for g normalising `H̄` the automorphism of `X_H` induced by g lies over `σ_{det g}`. For `H=Γ(N)` this is the morphism `X(N)→Spec ℤ[ζ_N]` extending the Weil pairing. Whether the fibres of `X_H→Spec O_H` are geometrically connected is not part of this construction (§4.10 and Layer 8).

H open; n with `Γ(n)⊂H`.

`X_H` normal ([§5.2](#s5-2)).

Establish this as follows. On `Y(n)[1/n]` the Weil pairing of the universal frame is a primitive n-th root of unity, a morphism to `μ_n^{prim}=Spec ℤ[1/n][x]/(Φ_n)` (upstream 5B), equivariant for the right action of `GL₂(ℤ/n)` on frames through `σ_{det}`. Pass to the quotient by `H̄`: `Y_H[1/n]=Y(n)[1/n]/H̄` maps to `Spec` of the `D_H`-invariants `ℤ[1/n,ζ_n]^{D_H}=O_H[1/n]`. Extension: `O_H` is finite over `ℤ`, and an element of `O_H` regular on the dense open `Y_H[1/n]` of the normal scheme `X_H` is integral over every local ring of `X_H`, hence regular; uniqueness by density and separatedness (Conrad's argument for Theorem 4.1.1(3)). Flatness: `X_H` is flat over `ℤ` and `Spec O_H` is a Dedekind scheme; properness from `X_H→Spec ℤ`.

The public interface should expose:

- `cyclotomicBase`: `O_H`, the ring of integers of `ℚ(ζ_n)^{det H̄}`.
- `toCyclotomicBase`: The morphism `X_H→Spec O_H` extending the Weil pairing.
- `toCyclotomicBase_ellipticOpen`: On `Y_H[1/n]` it sends `(E,φH̄)` to the det `H̄`-orbit of `e_n(φ e₁, φ e₂)`.
- `toCyclotomicBase_unique`: Any two morphisms `X_H→Spec O_H` agreeing on `Y_H[1/n]` are equal.
- `toCyclotomicBase_levelMap`: For `H′⊂H` the square with `Spec O_{H′}→Spec O_H` commutes.
- `toCyclotomicBase_normaliser`: For g normalising `H̄` the induced automorphism of `X_H` lies over `σ_{det g}` on `Spec O_H`.
- `toCyclotomicBase_flat`: toCyclotomicBase is proper and flat.

**Checks.**

- cyclotomicBase `(Γ₀ N) = ℤ`, and toCyclotomicBase is the structure morphism.
- cyclotomicBase `(Γ N) = ℤ[ζ_N]`, with toCyclotomicBase the extended Weil pairing of Conrad Theorem 4.1.1(3).
- For `N≥3`, `X(N)_ℚ` maps onto `Spec ℚ(ζ_N)`, so `X(N)_ℚ̄` has at least `φ(N)` connected components; `X(N)` over `ℚ` is not geometrically connected.
- For `H̄=SL₂(ℤ/n)`, cyclotomicBase `= ℤ[ζ_n]` although `H̄` is large.
- `H=Γ₀(N)`, `Γ₁(N)`, `C_s(ℓ)`, `C_ns⁺(ℓ)`: `D_H=(ℤ/n)^×` and `O_H=ℤ`.
- `H=Γ(N)`: `O_H=ℤ[ζ_N]`, recovering the fixed-pairing base.

*Needs:* [§3.8](#s3-8); [§3.9](#s3-9); [§5.2](#s5-2); [§5.10](#s5-10); [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 2E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing); Mathlib `IsPrimitiveRoot`; Mathlib `Polynomial.cyclotomic`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1(3), p.31, and its proof, p.34; [On the possible images of the mod ℓ representations associated to elliptic curves over ℚ](https://arxiv.org/pdf/1508.07660), §3.2, p.15; Proposition 3.1, p.14; [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §5B.)

<a id="s5-13"></a>

### 5.13 The fixed-pairing compactified curve

For `N≥1` and a ring R with a ring map `ζ:ℤ[ζ_N]→R`, let `𝒳(N,ζ)_R:=𝒳_{Γ(N)}×_{Spec ℤ[ζ_N]}Spec` R, using the extended Weil pairing `𝒳_{Γ(N)}→Spec ℤ[ζ_N]` (Conrad Theorem 4.1.1(3)), and let `X(N,ζ)_R` be its coarse space. For `R=ℤ[ζ_N]`, `X(N,ζ)=X(N)` with its cyclotomic structure. Its elliptic open over `ℤ[1/N,ζ_N]` is the coarse space of the stack of curves with full level structure of Weil pairing `ζ`, which for `N≥3` is upstream's fine scheme `Y(N,ζ)`. The formation of `X(N,ζ)_R` commutes with base change `R→R′` when R′ is flat over R, when `N≥3` and R is a `ℤ[1/N]`-algebra, when `N≥2` and N is not of the form `p^s` or `2p^s` (`s≥1`), because `𝒳_{Γ(N)}` is then a scheme, and when `N=1`, because [§3.11](#s3-11) identifies the coarse curve with `ℙ¹_R` compatibly with arbitrary base change. Over `ℤ[1/N,ζ_N]` it is a smooth proper curve, and `X(N)_{ℤ[1/N,ζ_N]}` is the disjoint union over `d∈(ℤ/N)^×` of the curves `X(N,ζ^d)_{ℤ[1/N,ζ_N]}`. Geometric connectedness of its fibres is theorem [§4.10](#s4-10) and is not used here.

`N≥1`; R a `ℤ[ζ_N]`-algebra.

The listed base-change cases are the only ones asserted.

Establish this as follows. Base change the full-level stack along `ζ` and take the Keel–Mori coarse space (SchemeAndStackFoundations §1.23, `keel_mori`). For `R=ℤ[ζ_N]` the base change is the identity, so the coarse space is `X(N)` with its cyclotomic structure ([§5.12](#s5-12)). Base change: flat base change of coarse spaces; for `N≥3` over `ℤ[1/N]` the stack is a fine scheme (Katz–Mazur rigidity, upstream 2F, 5B); for `N≥2` not of the form `p^s`, `2p^s` (`s≥1`) the stack is a projective scheme over `ℤ` ([§5.1](#s5-1)); for `N=1`, `ℤ[ζ₁]=ℤ` and the stack retains inversion, while its coarse j-line and projective completion are `𝔸¹_R` and `ℙ¹_R` for every R by [§3.11](#s3-11), compatibly with every `R→R′`. Over `ℤ[1/N]` the ring `ℤ[1/N,ζ_N]⊗_ℤℤ[ζ_N]` is the product of copies of `ℤ[1/N,ζ_N]` indexed by `σ_d`, which splits `X(N)` after base change into the fibres `X(N,ζ^d)`. Smoothness over `ℤ[1/N,ζ_N]` from [§5.8](#s5-8) (c) and [§5.3](#s5-3).

The public interface should expose:

- `fixedPairingCurve`: `X(N,ζ)_R` for a ring R with `ζ:ℤ[ζ_N]→R`.
- `fixedPairingCurve.toBase`: The proper structure morphism `X(N,ζ)_R→Spec` R.
- `fixedPairingCurve.ellipticOpen`: Over `ℤ[1/N,ζ_N]` and `N≥3` its elliptic open is upstream's `Y(N,ζ)`.
- `fixedPairingCurve.baseChange`: The comparison `X(N,ζ)_{R′}→X(N,ζ)_R×_R` R′, an isomorphism in the four listed cases.
- `fullLevel_split`: `X(N)×_ℤℤ[1/N,ζ_N] ≅ ⊔_{d∈(ℤ/N)^×} X(N,ζ^d)_{ℤ[1/N,ζ_N]}`.
- `fixedPairingCurve.galois`: The frame change by [[1,0],[0,d]] gives an isomorphism `X(N,ζ)_R≅X(N,ζ^d)_R` over R and over the j-line; for `R=ℤ[ζ_N]` it is an automorphism of `X(N)` lying over `σ_d`.

**Checks.**

- For `N=1` and `N=2`, `ℤ[ζ_N]=ℤ` and `X(N,ζ)=X(N)`; `X(1,ζ)=ℙ¹_ℤ` and `X(2)` has degree 6 over `ℙ¹`.
- At `N=1`, `𝒳(1,ζ)_ℚ` retains the nontrivial inversion automorphism and is not a scheme, although 1 is neither `p^s` nor `2p^s` for `s≥1`. Its coarse curve is `ℙ¹_ℚ`; over every ring R it is `ℙ¹_R`, including after the nonflat base change `ℤ→𝔽₂`.
- `X(5,ζ)` over `ℚ(ζ₅)` has degree 60 over the j-line and twelve cusps, each of width 5.
- `X(5)` over `ℚ` is not `X(5,ζ)`: it has degree 240 over `ℙ¹_ℚ` and maps onto `Spec ℚ(ζ₅)`.
- For `N≥3` over `ℤ[1/N,ζ_N]` the coarse map is an isomorphism from the stack, which is upstream's fine scheme `Y(N,ζ)` on the elliptic open.
- `N=5` over `ℚ(ζ₅)`: `X(5,ζ)` has degree 60 over `ℙ¹` and twelve cusps of width 5, whereas `X(5)_ℚ` has degree 240.

*Needs:* [§3.11](#s3-11); [§5.1](#s5-1); [§5.3](#s5-3); [§5.8](#s5-8); [§5.12](#s5-12); `SchemeAndStackFoundations §1.23/keel_mori`; [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 2F](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2f-endomorphism-degree-trace-and-rigidity).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.1.1(3), p.31; Lemma 4.2.4, p.37; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 3.3.2 and proof, pp.24–25; Proposition 4.3.6, p.39; [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §5B and Convention 5.)

<a id="s5-14"></a>

### 5.14 Compactified twisted curves `X(ρ)`

Let `N≥3` and let `V_ρ/ℚ` be a finite étale group scheme, étale locally isomorphic to `(ℤ/N)²`, with a perfect alternating Galois-equivariant pairing `V_ρ×V_ρ→μ_N`, equivalently `ρ:G_ℚ→GL₂(ℤ/N)` with determinant the mod-N cyclotomic character and the pairing. Upstream 5C constructs the smooth affine curve `Y(ρ)/ℚ` whose T-points are pairs `(E,ι)` with `ι:E[N]≅V_{ρ,T}` preserving pairings. Define `X(ρ)` as the normalization of `ℙ¹_{j,ℚ}` in the composite `Y(ρ)→𝔸¹_j⊂ℙ¹_j`. Then `X(ρ)` is a smooth proper curve over `ℚ`, `Y(ρ)` is the preimage of `𝔸¹`, and for every finite extension `L/ℚ` over which `V_ρ` acquires a symplectic frame of pairing value `ζ∈μ_N^{prim}(L)`, `X(ρ)_L≅X(N,ζ)_L` compatibly with j; changing the frame changes this isomorphism by the action of `SL₂(ℤ/N)`. The same construction applies after any base change of `V_ρ` to a field of characteristic zero. For `V_ρ=E₀[N]` with its Weil pairing, `(E₀,id)` is a `ℚ`-point of `Y(ρ)`.

`N≥3`; `V_ρ` over `ℚ` as in upstream 5C, with a perfect alternating pairing to `μ_N`.

Only pairing-preserving isomorphisms are parametrised; the unpaired `GL₂`-twist is a different moduli problem.

Establish this as follows. Over a finite extension L trivialising `V_ρ` symplectically, `Y(ρ)_L≅Y(N,ζ)_L` as moduli problems (upstream 5C, steps 3–5). Relative normalization commutes with the étale base change `Spec L→Spec ℚ` (Stacks 03GV; Mathlib normalizationPullback for smooth maps), so `X(ρ)_L` is the normalization of `ℙ¹_L` in `Y(N,ζ)_L`, which is `X(N,ζ)_L` by the recognition criterion applied to the normal proper curve of [§5.13](#s5-13). Properness and smoothness descend along `Spec L→Spec ℚ`. Frame changes act through `SL₂(ℤ/N)` because they preserve the pairing value.

The public interface should expose:

- `twistedCurve`: `X(ρ)`, the normalization of `ℙ¹_j` in `Y(ρ)`.
- `twistedCurve.ellipticOpen`: `Y(ρ)=X(ρ)×_{ℙ¹}𝔸¹`, upstream's twisted curve.
- `twistedCurve.frameIso`: A symplectic frame of V over S′ of value `ζ` gives `X(ρ)_{S′}≅X(N,ζ)_{S′}` over `ℙ¹`.
- `twistedCurve.frameIso_change`: Changing the frame by `γ∈SL₂(ℤ/N)` composes the isomorphism with the action of `γ` on `X(N,ζ)`.
- `twistedCurve.smooth`: `X(ρ)` is a smooth proper curve over `ℚ`.
- `twistedCurve.baseChange`: Formation of `X(ρ)` commutes with extension of the base field.

**Checks.**

- For `V_ρ=ℤ/N×μ_N` with the pairing `⟨(a,x),(b,y)⟩=y^a/x^b`, the frame `((1,1),(0,ζ_N))` over `ℚ(ζ_N)` has pairing value `ζ_N` and gives `X(ρ)_{ℚ(ζ_N)}≅X(N,ζ_N)_{ℚ(ζ_N)}`.
- For `V_ρ=E₀[N]` with the Weil pairing, `(E₀,id)` is a `ℚ`-point of `Y(ρ)` over `j(E₀)`.
- Replacing pairing-preserving isomorphisms by all isomorphisms `E[N]≅V` gives a curve with `φ(N)` geometric components over a splitting field, not a form of `X(N,ζ)`.
- For a curve `E₀/ℚ` and `N=5`, `X(E₀[5])` is a smooth proper curve over `ℚ` with the rational point `(E₀,id)`; its genus and rationality are generic-fibre statements of Layer 10.

*Needs:* the finite-normal recognition contract of ModularCurves Layer 10; [§3.11](#s3-11); [§5.13](#s5-13); [ModularCurves Layer 5C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); Mathlib `AlgebraicGeometry.Scheme.Hom.normalizationPullback`; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

([Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §5C; [Stacks Project](https://stacks.math.columbia.edu), Tag 03GV; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 6.4(a), p.63.)

<a id="s5-15"></a>

### 5.15 Level maps between coarse curves

For open level subgroups `H′⊂H` the finite morphism `𝒳_{H′}→𝒳_H` induces `f_{H′,H}:X_{H′}→X_H` over `ℙ¹_ℤ`, finite and surjective of degree `[±H:±H′]`, with `f_{H,H}=id` and `f_{H′,H}∘f_{H″,H′}=f_{H″,H}`. For `g∈GL₂(Ẑ)`, conjugation gives `c_g:X_H≅X_{g⁻¹Hg}`. The normaliser `N(H̄)` of `H̄` in `GL₂(ℤ/n)` acts on `X_H` on the right through `N(H̄)/±H̄`, by `(E,φH̄)↦(E,φgH̄)` on `Y_H[1/n]` extended by normalization; on `X₁(N)` the element [[d,0],[0,1]] acts as the diamond operator `P↦dP` and `−I` acts trivially. These maps are compatible with the cyclotomic structures, send the cusp of a double coset `⟨±u⟩g H̄′` to that of `⟨±u⟩g H̄`, and multiply widths by the local degree. Over `ℤ[1/n]` each `f_{H′,H}` is finite flat between smooth curves; over `ℤ` it is flat at every point of `X_{H′}` over which `X_H` is regular. A coarse map is not a substitute for a stack correspondence: Hecke correspondences are Layer 9, Layer 10's.

`H′⊂H` open; n with `Γ(n)⊂H′`.

Flatness assertions at bad primes require regularity of `X_H` at the image point.

Establish this as follows. The stack map is levelStack.map; the coarse universal property gives `f_{H′,H}` and the functor laws (SchemeAndStackFoundations §1.23). The degree is the ratio of the j-degrees from [§5.10](#s5-10). The normaliser acts on `Y_H[1/n]` by right translation of frames; the action extends to `X_H` by the universal property of normalization over `ℙ¹`, and `−I` acts trivially on the coarse space because `[−1]` is an isomorphism `(E,φH̄)≅(E,φ(−I)H̄)`. Compatibility with the cyclotomic structure follows from `e_n((P,Q)g)=e_n(P,Q)^{det g}`; the cusp statement from [§5.11](#s5-11). Flatness: finite morphisms from a Cohen–Macaulay scheme of pure dimension two to a regular one are flat (Stacks 00R4).

The public interface should expose:

- `levelMap`: `f_{H′,H}:X_{H′}→X_H` for `H′⊂H`.
- `levelMap_id`: levelMap H `H =` id.
- `levelMap_comp`: levelMap H′ H `∘` levelMap H″ H′ `=` levelMap H″ H.
- `levelMap_degree`: levelMap H′ H is finite surjective of degree `[±H:±H′]`.
- `levelMap_j`: `j∘levelMap` H′ `H = j`.
- `conjIso`: `c_g:X_H≅X_{g⁻¹Hg}`, with `c_{gh}=c_h∘c_g`.
- `normaliserAction`: The right action of `N(H̄)/±H̄` on `X_H` by automorphisms over `ℙ¹_ℤ`.
- `normaliserAction_cyclotomic`: The automorphism of g lies over `σ_{det g}` on `Spec O_H`.
- `levelMap_flat_of_regular`: levelMap H′ H is flat at points of `X_{H′}` lying over regular points of `X_H`, in particular everywhere over `ℤ[1/n]`.

**Checks.**

- For `N≥3` the degree of levelMap `(Γ₁ N) (Γ₀ N)` is `φ(N)/2`; for `N=13` it is 6.
- levelMap H H is the identity of `X_H`.
- `−I` acts trivially on `X₁(N)`, so the diamond group acting faithfully on `X₁(N)` is `(ℤ/N)^×/{±1}` and not `(ℤ/N)^× (N≥3)`.
- On `Y₁(N)[1/N]` the action of [[d,0],[0,1]] is `(E,P)↦(E,dP)`, upstream's diamond action.
- `f_{Γ₁(N),Γ₀(N)}` has degree `φ(N)/2` for `N≥3`.
- On `X₁(N)`, `⟨−1⟩` is the identity.

*Needs:* [§3.12](#s3-12); [§5.2](#s5-2); [§5.8](#s5-8); [§5.10](#s5-10); [§5.11](#s5-11); [§5.12](#s5-12); `SchemeAndStackFoundations §1.23`; Mathlib `Subgroup.normalizer`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §4.1.2, p.28; [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9B, last paragraph; Layer 10, item 3; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Lemma 4.2.3, p.36.)

<a id="s5-16"></a>

### 5.16 Coarse curves as quotients

Let `H′⊂H` be open level subgroups with H′ normal in H. Then H/H′ acts on `X_{H′}` over `X_H` through the normaliser action, and `X_H` is the categorical and geometric quotient `X_{H′}/(H/H′)`; in particular `X_H=X(n)/H̄` for `Γ(n)⊂H`. For a ring A the comparison `(X_{H′}⊗A)/(H/H′)→X_{H′}/(H/H′)⊗A` is an isomorphism if A is flat over `ℤ` or if the order of the image of H/H′ in `Aut(X_{H′})` is invertible in A; in general it is a universal homeomorphism. Neither side need be the coarse space of the base-changed stack `𝒳_H⊗A` when A is not flat ([§5.20](#s5-20)).

H′⊴H open; A an arbitrary ring for the comparison map.

Establish this as follows. The quotient `X_{H′}/(H/H′)` exists: `X_{H′}` is projective, so every finite orbit lies in an affine open (SchemeAndStackFoundations §1.17). Over `ℤ` both `X_{H′}/(H/H′)` and `X_H` are normal and finite over `ℙ¹_ℤ` and agree over the elliptic open over `ℤ[1/n]`, where `Y_H[1/n]=[Y_{H′}[1/n]/(H/H′)]` ([§3.9](#s3-9)) and coarse spaces of finite quotients are invariant quotients; so they coincide by the finite-normal recognition criterion of ModularCurves Layer 10 (Česnavičius Lemma 6.2, citing Deligne–Rapoport IV.3.10(iii)). The quotient stack `[𝒳_{H′}/(H/H′)]` is not used: it need not be `𝒳_H` at the cusps ([§5.8](#s5-8) (c)). Formation of rings of invariants commutes with flat base change, and with every base change when the group order is invertible; in general the comparison is integral, surjective and radicial.

**Checks.**

- At `ℓ=2`, the quotient of `X_s(2)=X(2)` by the order-2 monomial subgroup is `X_s⁺(2)`, of j-degree 3; quotienting by the literal normalizer `GL₂(𝔽₂)` instead gives `X(1)`.

- `X₀(N)=X₁(N)/((ℤ/N)^×/±1)` for `N≥3`.
- `X_{C_s⁺(ℓ)}=X_{C_s(ℓ)}/(ℤ/2)`.

*Needs:* the finite-normal recognition contract of ModularCurves Layer 10; [§3.9](#s3-9); [§5.2](#s5-2); [§5.8](#s5-8); [§5.15](#s5-15); `SchemeAndStackFoundations §1.17`; `SchemeAndStackFoundations §1.23/finite_quotient_coarse`; [ModularCurves Layer 0C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors); [ModularCurves Layer 9A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9a-katzmazur-quotient-problems).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 6.2, p.63; [Coarse base change fails for some modular curves](https://arxiv.org/pdf/1608.01249), §1.2, p.1; [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9A, Remark 7.1.4 statement.)

<a id="s5-17"></a>

### 5.17 The elliptic opens are the Katz–Mazur level problems

Let H be an open level subgroup and n with `Γ(n)⊂H`. (a) Over `ℤ`, the open substack `Y_H=𝒳_H×_{X(1)}Ell` is the stack over Ell of the Katz–Mazur quotient problem `[Γ(n)]/H̄` of Tau Ceti ModularCurves 9A–9B: its objects over S are elliptic curves over S with a `[Γ(n)]/H̄`-structure. (b) The coarse space `Y_H⊂X_H` of `Y_H` is the Katz–Mazur coarse moduli scheme `M([Γ(n)]/H̄)` of upstream 9D, compatibly with the classifying maps, with the j-maps to the coarse j-line `𝔸¹_ℤ` of 9E and with the maps induced by `H′⊂H`. (c) For the standard levels: `Y_{Γ(N)}` is upstream's integral `[Γ(N)]` of Layer 6, represented over `ℤ[1/N]` for `N≥3` by `Y_full(N)` of 5B, and its fibres over `μ_N^{prim}` are `Y(N,ζ)`; `Y_{Γ₁(N)}` is `[Γ₁(N)]` of Layer 6, represented over `ℤ[1/N]` for `N≥4` by `Y₁(N)` of 5A (integral rigidity depends on the level and residue characteristic as in §3.5; for `N=p` at a supersingular point of characteristic p, the Drinfeld generator `P=0` is fixed by `[−1]`, giving a nonrigid example); `Y_{Γ₀(N)}` is `[Γ₀(N)]` of Layer 8D, with coarse space upstream's `Y₀(N)` of 9E. (d) `X_H` is the normalization of `ℙ¹_ℤ` in `M([Γ(n)]/H̄)`, i.e. the Katz–Mazur compactified coarse moduli scheme. No new affine level carrier is introduced: the affine curves are upstream's.

H open; n with `Γ(n)⊂H`.

The identifications are of stacks over Ell and of their coarse spaces; no fine-moduli assertion is made outside the ranges stated.

Establish this as follows. For `H=Γ(n)`, the moduli interpretations of `Y(n)` and of upstream's `[Γ(n)]` agree by definition of Drinfeld full level structures, and `Y(n)=Y_{Γ(n)}` by [§5.1](#s5-1). For general `H̄`, both sides are the quotient of the `Γ(n)` case by `H̄`: over `ℤ[1/n]` by [§3.9](#s3-9) and upstream 9A (sheaf quotient of the naive problem), and over `ℤ` by the integral Katz–Mazur quotient property (Katz–Mazur 7.1.3, as used in Česnavičius Proposition 6.3(a)). (b): if `[Γ(n)]/H̄` is representable the coarse statement is the definition of M; in general use [§5.16](#s5-16) `(X_H=X(n)/H̄)` and upstream 9D's `M(𝒫)/H≅M(𝒫/H)`, together with the coarse comparison in [§3.9](#s3-9), extended using the same rigidifier quotients to the integral Katz–Mazur problem. (c) is the specialisation of (a)–(b) to the four standard levels, using upstream 5A, 5B, Layer 6, 8D and 9E. (d): `X_H` is normal and finite over `ℙ¹_ℤ` with `Y_H` dense and meeting every component, so it is the normalization by the finite-normal recognition criterion of ModularCurves Layer 10.

**Checks.**

- `H=Γ₀(N)`, `N≥3`: `Y₀(N)⊗ℤ[1/N]` is upstream's Borel quotient `Y_full(N)/B`, the coarse open of `X₀(N)`.
- At `N=10,p=2` the order-five part of a Drinfeld generator is nonzero; `X₁(10)` is fine over `ℤ[1/5]` by §3.5, so the point `P=0` cannot be a `Γ₁(10)` generator.
- `H=Γ₁(5)`: `Y₁(5)` over `ℤ[1/5]` is upstream's Tate-normal-form curve, a fine scheme, and `X₁(5)` is its normalization over `ℙ¹`.

*Needs:* [§3.5](#s3-5); the finite-normal recognition contract of ModularCurves Layer 10; [§3.9](#s3-9); [§3.12](#s3-12); [§5.1](#s5-1); [§5.16](#s5-16); [ModularCurves Layer 9A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9a-katzmazur-quotient-problems); [ModularCurves Layer 9B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems); [ModularCurves Layer 9D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients); [ModularCurves Layer 9E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n); [ModularCurves Layer 5A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4); [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#layer-6-the-three-elementary-integral-level-problems); [ModularCurves Layer 8D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n); [§3.9](#s3-9).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 6.3 and proof, p.63; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 6.2, p.63; [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §§5A, 5B, 6, 8D, 9A–9E.)

<a id="s5-18"></a>

### 5.18 Agreement with the prime-level diamond quotients

Let `N≥5` be prime, `Δ=(ℤ/N)^×/{±1}`, `H≤Δ`, and `G_H⊂GL₂(Ẑ)` the open subgroup whose image modulo N is `{[[a,b],[0,d]] : a mod ±1 ∈ H}`. Let `X_H^{MC}` be Tau Ceti ModularCurves Layer 10's compactified coarse curve over `ℤ[1/N]`, the normalization of `ℙ¹_{ℤ[1/N]}` in `Y₁(N)/H`. Then the restriction of `X_{G_H}` to `ℤ[1/N]` is isomorphic to `X_H^{MC}` by a unique isomorphism over `ℙ¹_{ℤ[1/N]}` restricting on `𝔸¹` to the identification of `Y_{G_H}` with `Y₁(N)/H`. The isomorphism matches the cusp divisors, the diamond action of `Δ/H`, the map `X₁(N)→X₀(N)` (the cases `H=1` and `H=Δ`) and the cyclotomic structure (both over `ℤ`). The proof checks the recognition hypotheses on `X_{G_H}[1/N]`: it is normal, finite over `ℙ¹_{ℤ[1/N]}`, contains `Y_{G_H}[1/N]` as a dense open, and each of its irreducible components meets it. No new compactification, cusp width or Shimura covering is built for this class; those stay Layer 10's.

`N≥5` prime; `H≤(ℤ/N)^×/{±1}`; base `ℤ[1/N]`.

`X_H^{MC}` is the Layer 10 carrier, built on Mathlib's relative normalization.

Establish this as follows. Upstream 9B (Katz–Mazur 7.4.2(3),(7)) and 9D `(M(𝒫)/H≅M(𝒫/H))` identify `Y_{G_H}[1/N]` with `Y₁(N)/H` over `𝔸¹_{ℤ[1/N]}`; by [§5.17](#s5-17) this is the coarse open of `X_{G_H}`. `X_{G_H}[1/N]` is normal and finite over `ℙ¹` ([§5.2](#s5-2), [§5.10](#s5-10)). Every irreducible component of `X_{G_H}[1/N]` is finite flat over `ℙ¹_{ℤ[1/N]}`, hence surjects onto it and meets the preimage of `𝔸¹`; so `Y_{G_H}[1/N]` is dense in every component. This is the component-by-component check. The finite-normal recognition criterion of ModularCurves Layer 10 gives the isomorphism; its uniqueness is `normalization.hom_ext` with the affine map to `ℙ¹`. Compatibilities: the diamond action and `X₁(N)→X₀(N)` agree on the dense open and extend uniquely; cusp divisors are both the fibre over `∞`.

**Checks.**

- `N=5`, `H=Δ`: `X₀(5)[1/5]` agrees with Layer 10's `X₀(5)`, with cusp divisor `[∞]+5[0]` in both.
- `N=11`, `H=1`: `X₁(11)[1/11]` agrees with Layer 10's `X₁(11)`; both have five cusps of width 1 and five of width 11.

*Needs:* the finite-normal recognition contract of ModularCurves Layer 10; [§5.2](#s5-2); [§5.10](#s5-10); [§5.15](#s5-15); [§5.17](#s5-17); [ModularCurves Layer 9B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9b-the-standard-quotient-problems); [ModularCurves Layer 9D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients); [ModularCurves Layer 10](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering); Mathlib `AlgebraicGeometry.Scheme.Hom.normalization.hom_ext`.

([Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), Layer 10, items 1–2; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 6.3(c), p.63.)

<a id="s5-19"></a>

### 5.19 Coarse normalization comparisons

On the elliptic locus `X_H` agrees with the affine coarse moduli scheme from ModularCurves 9D, by equality of the moduli problem and its categorical coarse property. It also agrees with the Katz–Mazur compactification as in Česnavičius Proposition 6.3. For prime `N≥5` and diamond H over `ℤ[1/N]`, identify the generalized-stack coarse compactification with Layer 10’s `X_H` by checking normality, finiteness over `ℙ¹_j`, an open immersion of `Y_H` with schematic density, and that every component meets `Y_H`. Then normalization uniqueness identifies the curves and their maps. The universal property of relative normalization alone does not recognize an arbitrary proposed compactification.

Establish this as follows. The elliptic-open identification with the Katz–Mazur coarse schemes is [§5.17](#s5-17), and the prime `N≥5` diamond-quotient agreement over `ℤ[1/N]` is [§5.18](#s5-18); this subsection collects them with the Katz–Mazur compactification comparison and proves nothing about them again. Compare affine coarse maps using their universal property. Both compactifications are finite normal extensions of the same dense level algebra; verify all components meet the elliptic open. Apply normalization uniqueness, then use separatedness and schematic density to identify maps.

**Checks.**

- For prime `N=5` the generalized `Γ₀` coarse construction agrees with the pre-existing compactification; no second set of cusp widths is built.

*Needs:* [§5.2](#s5-2); [§5.17](#s5-17); [§5.18](#s5-18); [ModularCurves Layer 9D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients); [ModularCurves Layer 10](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering).

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 6.2 and Proposition 6.3, p.63.)

<a id="s5-20"></a>

### 5.20 Failure of coarse base change at `Γ₁(4)` in characteristic 2

Let H be an open level subgroup for which there is an open substack `U⊂(Y_H)_{ℤ_{(2)}}` such that the geometric points of `U_ℚ` have trivial automorphism groups and some nonempty open `U′⊂U_{𝔽₂}` has inertia the constant group `{±1}`. Then the base change to `𝔽₂` of the coarse map `π:𝒳_H→X_H` is not the coarse map of `(𝒳_H)_{𝔽₂}`, and the failure persists on every `ℤ_{(2)}`-fibrewise dense open substack. This applies to `H=Γ₁(4)`: on the open of `Y₁(4)_{𝔽₂}` where the subgroup generated by the point of order 4 is of multiplicative type and `j≠0`, the inversion `[−1]` fixes the Drinfeld `ℤ/4`-structure, while over `ℚ` the problem is rigid. Hence Proposition 6.4(b)'s requirement that `gcd(6,n)` be invertible cannot be dropped in general.

The two conditions (i) generic rigidity over `ℚ` and (ii) constant inertia `{±1}` on a dense open of the `𝔽₂`-fibre.

Establish this as follows. Reduce to the regular part of U and pass to an auxiliary odd level `p∤n` where the stack becomes a scheme; the coarse space of `U_{𝔽₂}` is the quotient of a scheme by an action in which `{±1}` acts trivially, while the base change of the coarse space of U is computed from the rigid generic fibre, and the two differ (Česnavičius 2016, Theorem 2.1). For `Γ₁(4)`: over `ℤ[1/2]` the problem is rigid (Katz–Mazur 2.7.4); over the locus in characteristic 2 where the subgroup G of order 4 generated by `α` is of multiplicative type, the image of `α(1)` in `G/G₂` generates `G/G₂`, which is the Frobenius kernel of `E/G₂`, and the scheme of generators of `G/G₂` is the zero section, so `α(1)` lies in `G₂` and `2·α(1)=0`; hence `[−1]` preserves `α` (Theorem 3.2).

**Checks.**

- The same failure holds for `Γ₁(4)∩Γ₀(4n)` and for balanced `Γ₁(4)` (Česnavičius 2016, Theorems 4.2 and 5.2).

*Needs:* [§3.10](#s3-10); [§3.12](#s3-12); [§5.3](#s5-3); [§5.9](#s5-9); `SchemeAndStackFoundations §1.23/keel_mori`.

([Coarse base change fails for some modular curves](https://arxiv.org/pdf/1608.01249), Theorem 2.1 and Remark 2.2, p.3; Theorem 3.2, p.5; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Remark 6.6, p.64.)

<a id="s5-21"></a>

### 5.21 Proper rigidifying covers and coherent finiteness

Let `m=m₁m₂` with coprime `m₁,m₂≥3`. Then `𝒳_{Γ(m)}` is a projective `ℤ`-scheme and its contraction to `X(1)` is representable, finite and locally free of rank `|GL₂(ℤ/m)|`. For every open level subgroup H the fibre product `P_H:=𝒳_H×_{X(1)}𝒳_{Γ(m)}` is a projective `ℤ`-scheme with a finite locally free surjection `p:P_H→𝒳_H` of rank `|GL₂(ℤ/m)|`, equivariant for `GL₂(ℤ/m)` acting on the second factor. Consequently: (a) for every quasi-coherent sheaf F on `𝒳_H`, `H⁰(𝒳_H,F)` is the equaliser of the two pullback maps from `H⁰(P_H,p*F)` to the sections over `P_H×_{𝒳_H}P_H`, and, when F is locally free, it is `H⁰(P_H,p*F)^{GL₂(ℤ/m)}`, because p is finite locally free, a `GL₂(ℤ/m)`-torsor over the elliptic locus over `ℤ[1/m]`, and `𝒳_H` is normal; p is not a torsor over all of `𝒳_H[1/m]`, being ramified along the cusps; (b) for coherent F, `H⁰(𝒳_H,F)` is a finitely generated `ℤ`-module whose formation commutes with flat base change `ℤ→A`, and over `ℤ[1/m]` every `H^i(𝒳_H,F)` is finitely generated over `ℤ[1/m]`; (c) for every ring A, a section of F over `𝒳_H⊗A` is the same as a section of p*F over `P_H⊗A` whose two pullbacks agree (effective descent along the finite locally free p). No descent of F to the coarse space `X_H` is asserted: `ω^{⊗k}` for odd k and stabilisers acting nontrivially do not descend.

`m₁,m₂≥3` coprime; F quasi-coherent, coherent for finiteness.

The invariant description of sections is for locally free F; over `ℤ` the equaliser is used for quasi-coherent F. Higher coherent cohomology over `ℤ` is not asserted here.

Establish this as follows. `𝒳_{Γ(m)}` is a projective scheme because m is not of the form `p^s` or `2p^s` ([§5.1](#s5-1)), and its contraction to `X(1)` is representable finite locally free of rank `|GL₂(ℤ/m)|` (Česnavičius Proposition 4.3.4 with `n=1`). `P_H` is finite over the projective scheme `𝒳_{Γ(m)}` because `𝒳_H→X(1)` is representable and finite, so `P_H` is a projective scheme; p is the base change of `𝒳_{Γ(m)}→X(1)`. (a),(c): fpqc descent of quasi-coherent sheaves and their sections along the finite locally free surjection p (SchemeAndStackFoundations §§1.1 and 1.22). (b): `H⁰(𝒳_H,F)` is a submodule of the finitely generated `H⁰(P_H,p*F)` on a projective `ℤ`-scheme, and an equaliser of flat-base-change-compatible modules; for every i, `H^i(𝒳_H,F)` is the abutment of the descent spectral sequence of the finite locally free cover p, with `E₁` terms the coherent cohomology of the `(a+1)`-fold fibre products of `P_H` over `𝒳_H`, which are projective schemes finite over `P_H`; only finitely many terms contribute to each degree, so `H^i(𝒳_H,F)` is finitely generated (2.2 on the ringed site of 1.22). Invariants: `P_H` is flat over `𝒳_H` (base change of `𝒳_{Γ(m)}→X(1)`) and `GL₂(ℤ/m)` acts on it over `𝒳_H` through `𝒳_{Γ(m)}`; over the elliptic locus over `ℤ[1/m]` it is the `GL₂(ℤ/m)`-torsor of frames ([§3.9](#s3-9)), so `(p_*𝒪_{P_H})^{GL₂(ℤ/m)}` is a finite torsion-free `𝒪_{𝒳_H}`-algebra equal to `𝒪_{𝒳_H}` on a dense open, hence equal to `𝒪_{𝒳_H}` by normality, and `(p_*p*F)^{GL₂(ℤ/m)}=F` for F locally free. Along the cusps p is ramified (index m in the q-expansion charts of §4.1), so `X(1)[1/m]` is not `[X(m)[1/m]/GL₂(ℤ/m)]` (that quotient is `Ell_m[1/m]`).

**Checks.**

- For `H=Γ₀(N)`, weight-k modular forms of level `Γ₀(N)` over `ℤ` form a finitely generated `ℤ`-module, computed as the `GL₂(ℤ/m)`-invariants of `H⁰(P_H,p*ω^{⊗k})` on a projective `ℤ`-scheme.
- Over `ℤ` the sheaf `ω` on `X(1)` has `H⁰=0`, since `−1` acts on it by `−1` and `H⁰` is torsion-free; over `𝔽₂` the Hasse invariant is a nonzero section of `ω`, so `H⁰` does not commute with the non-flat base change `ℤ→𝔽₂`. `ω` is a line bundle on the stack that does not come from `ℙ¹_ℤ`.

*Needs:* [§3.9](#s3-9); [§3.12](#s3-12); [§4.1](#s4-1); [§5.1](#s5-1); [§5.8](#s5-8); `SchemeAndStackFoundations §1.1`; `SchemeAndStackFoundations §1.22`; `SchemeAndStackFoundations §2.2`; `SchemeAndStackFoundations Layer 1`.

([Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Proposition 4.3.4, p.38; Proposition 4.3.6, p.39; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.2.1(2) and Remark 4.2.2, pp.35–36.)

### Examples

`X(1)=ℙ¹_ℤ` with its j coordinate.

Over `ℂ` honest full level 5 has four determinant components; fixed pairing has one.

`Φ₁(U,V)=V−U`; swapping variables changes its sign.

### Dependencies

Use Layer 0, Layer 2, Layers 3 and 4. External contracts: AlgebraicModuliForArithmeticGeometry, SchemeAndStackFoundations. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 6: Compact complex uniformization and twists

<a id="s6-1"></a>

### 6.1 Compact analytic–algebraic modular comparison

Let X be the actual compact coarse modular curve supplied by the level-H construction in Layers 3 and 5 over a characteristic-zero component field, with open Y from Layers 3 and 4, and choose an embedding into C. The open comparison extends uniquely to an isomorphism `X_C^an ≅ Γ \ (H∪P¹(Q))`, using the analytic compactification of MF10A. It identifies the algebraic boundary with the analytic cusps and respects pairing components. For prime `N≥5` diamond quotients over `Z[1/N]`, use the existing MC Layer 10 model on precisely that overlap. Other full, composite or bad-level constructions are the integral coarse construction of Layer 5 inputs.

The compact algebraic curve is independently constructed, normal, projective and smooth on its characteristic-zero fibre.

Neither Layer 8 nor Layer 10 is a prerequisite. Completion alone does not prove the algebraic model exists.

Establish this as follows. Compare the open parts by Layers 3 and 4 and the characteristic-zero coarse quotient. Use the algebraic boundary charts from Layers 3–5 and the effective analytic cusp charts to show that the open map and inverse extend across every puncture. Properness rules out missing points. The extensions are inverses on a dense open and hence everywhere. Uniqueness extends precisely §4.5's transported diagrams: on the positive full frame determinant-one row actions use `F_γ`, general row actions use `F_h` between their specified components, and full-to-point or full-to-cyclic maps use S (with diamond r for the point on component r). The same maps act on `P¹(ℚ)` at the cusps.

The theorem is `compactModularUniformization`.

**Checks.**

- The map is an isomorphism of analytic spaces; it does not rebuild X via Chow.
- At `N=1` it gives `X(1)^an≅P¹(C)` with j as coordinate and the unique cusp at infinity.
- At `N=5` the positive-frame full-to-point map sends its cusp `∞` to the standard point-level cusp 0, because `S∞=0`; the identity-coordinate map would send it to the wrong cusp.

*Needs:* [§3.14](#s3-14); [§4.1](#s4-1); [§4.5](#s4-5); [§4.8](#s4-8); [§5.2](#s5-2); [§5.19](#s5-19); [ModularForms Layer 10A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve); [ModularCurves Layer 10](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering); `ComplexComparisonPartII` C4.5 (`affineCurveCompletionInterface`); `ComplexComparisonPartII` C4.4 (`properSourceMorphismAlgebraicity`); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA).

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.1–4.8, pp.310–313; [Conrad, classical curves](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), §3, Proposition 3.1 and proof, pp.3–4; [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Theorems 7.2 and 7.5 and the canonical X₀(N) model, pp.94–96; [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §2, pp.25–40.)

<a id="s6-2"></a>

### 6.2 Cusp ramification under level maps

For a finite map of modular curves induced by `Γ′⊂Γ`, and a chosen source cusp over a target cusp, the characteristic-zero ramification index is w′/w after conjugating the cusp representatives consistently. On completed split coarse local rings the map is `q_w↦q_w′^(w′/w)`, up to a root of unity for a changed representative. For `Γ₀(N)`, a cusp with reduced representative `a/c` and `c|N` has width `N/gcd(c²,N)`. These statements commute with the actual algebraic level maps and their splitting fields.

`Γ` and `Γ′` have finite index and use effective widths; identify the appropriate cusp rather than comparing widths of unrelated representatives.

The width ratio is an integer. The source field can enlarge the cusp residue field, so separate residue degree from ramification index.

On the analytic quotients the ramification index w′/w is FuchsianOrbifolds Layer 4, item 4; this theorem transports it to the algebraic level maps and computes the `Γ₀` widths.

Establish this as follows. Compute both parameters from the same conjugated translation variable and their stabilizer periods. Identify their quotient discs and compute the order of vanishing of the pulled-back parameter. Use [§4.8](#s4-8) parameter agreement and uniqueness of compact morphism extension to obtain the algebraic equality. For `Γ₀` compute the conjugated lower-left entry `c²w` modulo N.

The theorem is `cuspRamificationAndLevelMaps`.

**Checks.**

- `X₀(N)→X(1)` has ramification N at 0 and 1 at infinity.
- For full level M divisible by `N≥3`, the corresponding infinity ramification is `M/N`.
- A root of unity changes the chosen parameter, not its ramification order.

*Needs:* [§4.5](#s4-5); [§4.8](#s4-8); [§5.2](#s5-2); [ModularForms Layer 10A](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve); [FuchsianOrbifolds Layer 4](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces).

([Conrad, classical curves](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf), §3, Proposition 3.1, pp.3–4; [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–26; [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §4, p.48.)

<a id="s6-3"></a>

### 6.3 Cusp fields and pairing components

The compact comparison identifies the boundary labels supplied by the formal cusp charts of Layers 3–5 with the rational-cusp orbit set `Γ \ P¹(Q)`, including the determinant label of a full frame. A fixed full N-pairing component is defined over `Q(ζ_N)`, and its geometric cusps split over that field. The unrestricted full curve carries all primitive pairing values and is not a single geometrically connected curve over C. `Γ₀(N)` has its canonical Q-model with both 0 and infinity rational; each other cusp field is obtained from the Galois action on its cyclotomic Tate-level label, rather than inferred from its complex point alone.

Statements about splitting apply to generic fibres, not arbitrary bad-level base change of coarse moduli.

The cyclotomic Galois action is the action on actual Tate-level labels; the finite boundary algebra is imported from the algebraic supplier.

Establish this as follows. Read the algebraic boundary labels and residue fields in the independently built Tate charts. Compare the chosen labels with primitive rational directions and their congruence stabilizers under [§6.1](#s6-1). Transport the determinant and cyclotomic action along the comparison. For `Γ₀`, use the quotient-isogeny description to identify the two distinguished rational cusps.

The theorem is `cuspFieldsAndComponentLabels`.

**Checks.**

- For `X₀(11)`, the cusps 0 and infinity both have residue field Q.
- For full `N=5`, each fixed-pairing component and all its cusps split over `Q(ζ₅)`; there are four geometric pairing components of unrestricted full level.
- A complex uniformization alone makes no claim about an integral cusp residue field.

*Needs:* [§4.1](#s4-1); [§4.2](#s4-2); [§4.5](#s4-5); [§4.8](#s4-8); [§5.2](#s5-2); [§5.5](#s5-5); [ModularCurves Layer 2E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing); Mathlib `cosetToCuspOrbit`.

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.2–4.8, pp.310–313; [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §7, pp.94–96; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), I §1, p.226 (PDF p.2).)

<a id="s6-4"></a>

### 6.4 The analytic comparison for a symplectic twist

Let `N≥3` and let `V_ρ/Q` be the imported rank-two finite étale Z/N-module scheme with perfect alternating Galois-equivariant pairing to `μ_N`. Let `Y(ρ)` be the MC5C symplectic-frame quotient, parametrizing pairing-preserving isomorphisms `E[N]≅V_ρ`. A symplectic frame after extension to a splitting field identifies `Y(ρ)` there with the corresponding single fixed-pairing curve. After embedding that field in C, this gives an isomorphism `(Y(ρ)_C)^an≅Γ(N) \ H`. Changing the frame changes the identification by the corresponding `SL₂` action and preserves the actual descent cocycle.

The representation comes with its pairing. In a chosen basis its determinant is the cyclotomic character; an arbitrary `GL₂` representation without such a pairing does not define this symplectic twist.

MC5C owns the construction, freeness, smoothness and descent of `Y(ρ)`.

Establish this as follows. Trivialize the paired finite étale module over a finite Galois splitting field and evaluate the imported quotient construction in that frame. The pairing equality selects one determinant fibre, not a union. Compose its algebraic trivialization with Layers 3 and 4. Compute a frame change and the Galois cocycle on the moduli isomorphisms; the equality is an equality of morphisms on the imported curve.

The theorem is `twistedAnalyticComparison`.

**Checks.**

- A symplectic frame produces exactly one `Γ(N)` quotient.
- Changing it by determinant r moves the pairing fibre unless the pairing is simultaneously transported.
- No field-points bijection substitutes for the analytic isomorphism.

*Needs:* [§3.14](#s3-14); [§4.5](#s4-5); [ModularCurves Layer 5C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ); [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out).

([Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1–§1.2, pp.17–25; [Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §9, pp.20–24 and Theorem 17.21, p.42.)

<a id="s6-5"></a>

### 6.5 Geometric irreducibility of the twisted curve

For the paired representation and `Y(ρ)` of the preceding subsection, `Y(ρ)` is geometrically connected and geometrically irreducible over Q. Discharge ModularCurves 5C’s three external hypotheses separately: invariance of connectedness under `Q̄→C` for the actual curve; the twisted analytic isomorphism with `Γ(N) \ H`; and C4’s connectedness equivalence for the smooth affine C-curve. Smoothness and nonemptiness then permit ModularCurves 5C’s conditional irreducibility result to be applied unconditionally.

`N≥3`. A small-level coarse twist is not the fine scheme `Y(ρ)` treated by this theorem.

The same statement holds over a characteristic-zero field with the same paired finite étale data after choosing an algebraic closure and embedding the field of definition into C.

Establish this as follows. Use the splitting-field trivialization to identify the geometric twist with a fixed-pairing component. Apply its geometric connectedness, or the three contracts individually, with all smoothness and finite-type hypotheses checked. Invoke the imported MC5C smooth-connected irreducibility implication.

The theorem is `twistedGeometricIrreducibility`.

**Checks.**

- The statement names each of the three MC5C contracts and does not add an unexplained connectedness assumption.
- It holds for a nontrivial twist with no chosen rational symplectic frame.

*Needs:* [§4.9](#s4-9); [§4.10](#s4-10); [§6.4](#s6-4); [ModularCurves Layer 5C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `ComplexComparisonPartII` C4.5 (`affineCurveConnectedness`).

([Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1–§1.2, pp.17–25; [Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), Theorem 17.21, p.42.)

### Examples

Use the negative controls in the subsections to check the component labels, hypotheses and directions of maps before transporting the interfaces.

### Dependencies

Use Layers 3–5. External contracts: ComplexComparisonPartII, TauCetiRoadmap FuchsianOrbifolds. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 7: Hodge sections and the normalized Hecke pairing

<a id="s7-1"></a>

### 7.1 The Hodge line and the automorphy factor

On the elliptic level moduli stack let `ω=e*Ω¹_E/Y` be the imported invariant-differential line. Pulling it to H along the marked family trivializes it by `2πi` dz, the frame agreeing with `du/u` on the Tate curve. In usual left-action coordinates `τ′=(aτ+b)/(cτ+d)`, `z′=z/(cτ+d)`, the pullback of dz′ is `dz/(cτ+d)`. Thus a section `(2πi)^k f(τ)dz^k` is equivariant precisely when `f(τ′)=(cτ+d)^k f(τ)`. This identifies `ω^k` with the imported analytic automorphy bundle, extends in Tate frames to the compact level stack, and respects level pullback.

The line is on the moduli stack or on a fine locus with universal curve. For a coarse curve, descend only when its stabilizers act trivially on the relevant fibre; otherwise use the invariant section-space formulation of MF10C.

In particular generic `−1` acts as `−1` on `ω`. There is no unrestricted weight-one line bundle on the coarse `Γ₀` curve.

The algebraic individual-curve normalization `dx/(2y)↔dz` remains unchanged; multiplication by `2πi` belongs to this modular/Tate frame.

Establish this as follows. Pull back the relative algebraic differential line to the marked family and use Layer 1. Compute the multiplier of the fibre coordinate under a marking change; taking kth tensors gives the exact automorphy law. Use Tate parameter agreement for the boundary frame and finite stabilizer invariance for the coarse section-space description.

The theorem is `hodgeLineAutomorphy`.

**Checks.**

- The Tate frame is `du/u` and pulls back to `2πi` dz.
- For `γ=T` the multiplier is 1; for `γ=S` it is `τ⁻¹` on the fibre differential.
- Weight one fails to descend across generic `−1` inertia, while even powers can pass that obstruction.

*Needs:* [§1.4](#s1-4); [§3.13](#s3-13); [§4.8](#s4-8); [ModularCurves Layer 1C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes); [ModularForms Layer 10C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA).

([Conrad, q-expansions](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.1–3; [Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §7, p.15; §11, p.26.)

<a id="s7-1a"></a>
<a id="R12.5"></a>

### 7.1a Kodaira–Spencer normalization (R12.5)

**Normalized modular Kodaira–Spencer isomorphism.** For a fine characteristic-zero compactified level curve C with universal generalized elliptic family and reduced cusp divisor D, prove `kodairaSpencer_normalization`: `ω²≅Ω¹_C(log D)` sends `(du/u)²` to `dq/q` on Tate charts. On the elliptic open use the supplied Gauss–Manin connection on relative de Rham `H¹`, the Hodge filtration and the polarization contraction, with the sign chosen by this Tate formula. Construct its logarithmic extension across D using the Tate period calculation and prove it is an isomorphism. Restriction gives `ω²(−D)≅Ω¹_C` and realizes `f↦2πi f(τ)dτ`. The fine curve and characteristic-zero base are hypotheses; coarse descent elsewhere uses §7.2’s invariant section spaces.

**Checks.**

- At a width-one Tate cusp, `(du/u)²` maps to `dq/q`, with coefficient 1.
- At effective width w, `q=t^w` gives `dq/q=w dt/t`; a scalar rescaling would change the differential dictionary.
- A cusp form has zero constant term and gives a regular differential; a nonzero constant gives a logarithmic pole.

*Needs:* [§3.13](#s3-13); [§4.8](#s4-8); [§7.1](#s7-1); `ComplexComparisonPartII` C5.2 (`GaussManin`), C5.3 (`relativeHodgeBundles`) and C5.6 (regular-singular canonical extension); MC1C (the invariant-differential line).

([Faltings–Chai, Degeneration of Abelian Varieties](https://doi.org/10.1007/978-3-662-02632-8), III §9, pp.80–86, and IV Proposition 3.1(vi), p.107; [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.12, pp.25–26, for the weight-two differential normalization.)

<a id="s7-2"></a>

### 7.2 Weight-two cusp forms and regular differentials

For a congruence subgroup `Γ` with the actual smooth projective coarse curve `X/C` from the level-H construction in Layers 3 and 5, the map `f↦ω_f=2πi f(τ)dτ` is a C-linear isomorphism `S₂(Γ)≅H⁰(X,Ω¹_X/C)`. At a cusp of effective width w it is `ω_f=w` f `dq_w/q_w`; cuspidality is exactly regularity there. At elliptic points the invariant local expression descends regularly through the finite stabilizer chart. At irregular cusps use the effective parameter and the weight-two sign invariance. This comparison respects level pullback and trace on finite characteristic-zero curve maps.

All coefficient spaces and analytic section spaces are the existing MF10C carriers; the algebraic differentials use the independently constructed X.

No smooth fine universal elliptic curve on the coarse X is assumed.

The formula contains `2πi` and the width w; changing either changes the stated comparison.

Establish this as follows. On the fine cover use `kodairaSpencer_normalization` and the Hodge-line/automorphy comparison, then the imported weight-two canonical-form dictionary on the analytic quotient. At a cusp substitute `dq_w/q_w=(2πi/w)dτ`. The constant term must vanish exactly when the differential has no pole. At an elliptic chart compute invariants in t with quotient coordinate `t^e`. Apply proper coherent comparison (ComplexComparisonPartII C1.9) to identify holomorphic and algebraic regular differentials. Local pullback and finite trace computations give naturality.

The theorem is `weightTwoRegularDifferentials`.

The integral differential lattices and their model, base-change and Hecke comparisons are [§13.7](#integral-dualizing-forms), [§13.8](#integral-modular-serre-duality) and [§13.9](#integral-hecke-duality-compatibility).

**Checks.**

- For `Γ₀(N)` at infinity, `ω_f=f dq/q`; the q coefficient `a₁` is the leading dq coefficient.
- At a width-N cusp the factor is N.
- A weight-two form with nonzero cusp constant gives a logarithmic pole and is excluded from `H⁰Ω¹`.
- No arbitrary integral base change is claimed: DDT Theorem 1.33 needs its stated flatness or invertibility assumptions.

*Needs:* [§7.1a](#s7-1a), R12.5 (`kodairaSpencer_normalization`); [§5.2](#s5-2); [§5.3](#s5-3); [§6.1](#s6-1); [§7.1](#s7-1); [ModularForms Layer 10C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas); [ModularForms Layer 10B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology); `ComplexComparisonPartII` C5.7 (`curveResidueLocalization`); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA); `ComplexComparisonPartII` C2.2 (`projectiveGeometricDictionaries`).

([Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.12, pp.25–26; Theorem 1.33, pp.38–39; [Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.6–4.7, p.312.)

<a id="s7-3"></a>

### 7.3 Characteristic-zero pullback and trace actions

On the canonical `Γ₀(N)` coarse curve over Q, define the action on regular differentials of the good degree-n isogeny correspondence, `gcd(n,N)=1`, by pullback along the target map and finite trace along the source map. Its generic objects are all order-n finite subgroups `D⊂E`, with the transported cyclic N-subgroup; its degree is `σ₁(n)`. Separately the cyclic-kernel correspondence has degree `ψ(n)=n∏_{p|n}(1+1/p)`. For `p|N` define `U_p` from order-p subgroups disjoint from the marked cyclic N-subgroup; its source degree is p. Compactify the characteristic-zero correspondences by normalization of the appropriate open finite covers, using the supplied generic coarse models. The action on `ω^k` sections is `n⁻¹` times raw isogeny pullback and trace (`p⁻¹` for `U_p`); for regular differentials use the curve differential pullback and trace directly.

`N,n≥1`; the all-subgroup degree assertion is for `gcd(n,N)=1`. The `U_p` construction is stated separately.

The base has characteristic zero, so division by n is defined. Integral extensions and bad-characteristic divisibility are Layer 9, Layer 10 targets, not prerequisites.

For `Γ₀` no universal elliptic scheme is assumed: define the isogeny differential multiplier on a rigidified cover and descend its invariant action.

Establish this as follows. Use the imported elliptic subgroup/isogeny carriers and finite quotients to build the open correspondence; count sublattices via Hermite normal form. Distinguish all subgroups from cyclic ones. Normalize the independently given characteristic-zero compact curve in each finite generic algebra; extend generic curve morphisms by the AlgebraicCurves Layer 12C dictionary and use the coherent trace 2.19–2.21/trace on regular differentials (`ω=Ω¹` on a smooth curve); its agreement with the field trace on Kähler differentials, checked at the generic point, and its compatibility with extension of the base field are part of this target. Compute the differential action on each lattice branch. At `p|N` the disjointness condition removes the multiplication branch, yielding `U_p`. The finite trace extends regular differentials, including at ramification.

The public interface should expose:

- `charZeroHeckeCorrespondence`: The compact all-subgroup correspondence for `gcd(n,N)=1`, with its two maps.
- `charZeroCyclicCorrespondence`: The separate cyclic-kernel correspondence.
- `charZeroUCorrespondence`: For `p|N`, the degree-p disjoint-kernel correspondence.
- `charZeroHecke_onDifferentials`: Target pullback followed by source trace on `H⁰Ω¹`.
- `charZeroHecke_onHodgePower`: For weight k, divide the raw isogeny differential pullback/trace by n.
- `charZeroHecke_degree`: Good all-subgroup degree `σ₁(n)`; cyclic degree `ψ(n)`; `U_p` degree p.

**Checks.**

- If N is odd, the `n=4` all-subgroup degree is 7 and the cyclic degree is 6; the omitted kernel is `E[2]`.
- At `n=1` the correspondence is the diagonal and its differential action is the identity.
- For weight k and `p∤N`, raw isogeny trace equals p times the analytic `T_p`, including both the `p^k f(pτ)` branch and the p other branches.
- At `p|N`, `U_p` has degree p rather than `p+1`; no `σ₁(p)` claim is made for that operator.
- Use seven all-subgroup branches versus six cyclic branches at `n=4`.
- The correspondence acts on regular differentials by target pullback followed by source trace.

*Needs:* [§1.3](#s1-3); [§5.2](#s5-2); [§7.2](#s7-2); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients); [ModularCurves Layer 8D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n); [ModularCurves Layer 9D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients); [ModularForms Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra); `SchemeAndStackFoundations §2.19–2.21/trace`; [AlgebraicCurves Layer 12](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts).

([Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §5, Lemma 5.13, Remarks 5.14–5.15 and Proposition 5.16/Corollary 5.17, pp.72–74; [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–26 and §1.6, p.39; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, Theorem 4.4.3, pp.42–45; [Bakker–Tsimerman, preprint](https://arxiv.org/pdf/1403.7168v2), §2.5, pp.7–8.)

<a id="s7-4"></a>

### 7.4 The pullback–trace Hecke normalization

Under `f↦2πi f(τ)dτ`, the geometric `Γ₀(N)` differential action of the preceding node equals the anchor’s analytic `T_n` for `gcd(n,N)=1` and `U_p` for `p|N`. For even weight k, raw isogeny trace divided by n is `T_n f=n^(k−1)∑_{ad=n,0≤b<d}d^(−k)f((aτ+b)/d)`; in weight two each branch has coefficient `a/d`, exactly `d((aτ+b)/d)/dτ`. At a good prime `T_p f=p^(k−1)f(pτ)+p⁻¹∑_{b=0}^{p−1}f((τ+b)/p)`. The bad-prime action is `U_p f=p⁻¹∑_b f((τ+b)/p)`. They recover `a₁(T_n f)=a_n(f)` for the full composite operator, with the imported good-prime recurrence and bad-prime powers.

The general displayed weight-k formula is for trivial `Γ₀` character. Nebentypus and `Γ₁` transports use the anchor’s explicitly labelled slash/diamond conventions, not a silent change of this formula.

The good composite `T_n` uses all subgroups. The cyclic modular-polynomial correspondence of [§5.6](#s5-6) is not substituted at squareful n.

Establish this as follows. On the branch `ad=n`, `τ′=(aτ+b)/d`, the isogeny `z↦az` multiplies the Hodge frame by a, giving `a^k/n=a^(k−1)/d`. For weight two the curve differential pullback multiplies `dτ′` by `a/d`, giving precisely the normalized Hodge action. Sum branch traces, identify the anchor’s triangular slash sum, and use its q-expansion theorem. Treat the U branch set separately and combine prime powers by the imported Hecke relations.

The theorem is `heckeNormalizationComparison`.

**Checks.**

- For `k=2`, `T_p` has coefficients p and `1/p` in its two branch types.
- For good p, `T_{p²}=T_p²−p·Id` on trivial-character weight two, while the cyclic degree differs by the one noncyclic subgroup.
- This theorem supplies a characteristic-zero target for Layer 9, Layer 10 and does not presume its integral construction.

*Needs:* [§7.3](#s7-3); [ModularForms Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra); Tau Ceti `HeckeRing.GL2.qExpansion_coeff_one_heckeRingHomCharSpace_heckeTCompositeGamma0`.

([Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.2, pp.22–26 and §1.6, p.39; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–45; [Bakker–Tsimerman, preprint](https://arxiv.org/pdf/1403.7168v2), §2.5, pp.7–8.)

<a id="s7-5"></a>

### 7.5 The full Hecke first-coefficient pairing

Let `V_Q=H⁰(X₀(N)_Q,Ω¹)` and use the rational infinity Tate chart to extract `a_n` from `ω=f(q)dq/q`. Let `T_Q⊂End_Q(V_Q)` be the image of the full commutative Hecke algebra generated by every `T_n`, including the bad-prime U blocks. Define `β:T_Q×V_Q→Q` by `β(T,f)=a₁(Tf)`, and extend scalars to C through the differential comparison. It is a bilinear form on the full space; it is not restricted to a newspace or an eigenspace.

`N≥1`; `X₀(N)_Q` and its rational cusp chart are those of Layers 3–5.

Use the image algebra of actual operators, so a zero operator is zero in `T_Q`; no abstract Hecke-ring kernel is silently discarded.

At `N=1` the cusp-form space is zero and its image algebra is the zero algebra.

Establish this as follows. The algebraic pullback–trace operators are defined over Q, so their image preserves `V_Q`. The rational q-chart defines Q-linear coefficient functionals. Bilinearity follows from the operator action and coefficient extraction. Proper cohomology base change identifies `V_Q⊗C` with the analytic full `S₂` space. Use the normalized Hecke comparison to establish `β(T_n,f)=a_n(f)`; record the commuting action relation `β(ST,f)=β(S,Tf)`.

The public interface should expose:

- `analyticFullHeckeAlgebra`: The complex operator image on the native `cuspFormCharSpace 2 1`, the trivial-character realization of `S₂(Γ₀(N),ℂ)`, generated as a complex algebra by all positive-index `heckeTCompositeGamma0` actions. The identification with `S₂(Γ₀(N),ℂ)` is Tau Ceti's `cuspFormCharSpaceOneEquiv` in `TauCeti/NumberTheory/ModularForms/TrivialNebentypus.lean`.
- `firstCoefficientHeckePairing`: `β(T,f)=a₁(Tf)` over Q and its scalar extensions. The definition in [Suggested.lean](Suggested.lean) is its complex analytic realization on `analyticFullHeckeAlgebra`; the rational differential realization and its base-change comparison use the geometric carriers of this section.
- Q-linearity in both arguments, `β(T_n,f)=a_n(f)` for every `n≥1`, and `β(ST,f)=β(S,Tf)`.
- `firstCoefficientHeckePairing_baseChange`: Scalar extension to C agrees with the analytic q-coefficient pairing.

**Checks.**

- `β(Id,f)=a₁(f)`; it need not equal `a₂(f)`.
- At `N=1` both spaces are zero and the zero-dimensional pairing is perfect.
- For the normalized level-11 weight-two cusp form, `β(T₁,f)=1` and the full Hecke image has dimension one.
- If `p|N`, `β(U_p,f)=a_p(f)`; excluding bad-prime operators would fail to describe the full pairing in GZ V §1.
- The domain is the operator image `T_Q` and the whole `V_Q`.
- The comparison identifies the algebraic rational coefficient normalization at infinity with the analytic one.

*Needs:* [§4.4](#s4-4); [§5.2](#s5-2); [§7.4](#s7-4); [ModularForms Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA); `ComplexComparisonPartII` C2.1 (`gagaBaseChange`).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), V §1, p.306 (PDF p.82); [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.34, p.39.)

<a id="s7-6"></a>

### 7.6 Perfection of the full Hecke pairing

The pairing `β:T_Q×V_Q→Q` is perfect: `T_Q≅V_Q*` and `V_Q≅T_Q*`. In particular `dim_Q T_Q=dim_Q V_Q`. The same holds after scalar extension to C. The result uses q-expansion injectivity, commutativity and the span of all `T_n`, including bad-prime blocks; it requires no eigenbasis, semisimplicity or newform decomposition. The integral lattice perfectness of DDT is an imported stronger supplier when its hypotheses are met, not claimed by this rational theorem.

The spaces are finite dimensional and `T_Q` is the image of the full Hecke algebra on `V_Q`.

All operators `T_n` act with `a₁(T_n f)=a_n(f)`, and their Q-span is `T_Q` by the imported Hecke relations.

Establish this as follows. If `β(T_n,f)=0` for all n, every q coefficient of f vanishes, so `f=0`. If `β(T,f)=0` for every f, then `a_n(Tf)=a₁(T_nTf)=a₁(TT_nf)=0` by commutativity; hence `Tf=0` for every f, and `T=0` in the image algebra. Both radicals vanish; finite-dimensional linear algebra gives equal dimensions and perfection over C. The rational coefficient and operator definitions, or faithful scalar extension, give perfection over Q.

The theorem `perfectHeckePairing` in [Suggested.lean](Suggested.lean) uses the native complex cusp space and `LinearMap.IsPerfPair`, so both induced maps to dual spaces are bijective; the rational geometric realization retains the preceding scalar-extension comparison.

The integral Serre pairing between differentials and `H¹(O)` is [§13.8](#integral-modular-serre-duality); it is a different pairing from β.

**Checks.**

- Both radicals are checked; one-sided nondegeneracy does not prove the claim by itself.
- The proof includes every n and every bad-prime block.
- No Jacobian faithfulness theorem is used to prove this pairing.

*Needs:* [§7.5](#s7-5); [ModularForms Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), V §1, p.306 (PDF p.82); [Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 1.34 and proof, p.39.)

### Examples

If N is odd, the `n=4` all-subgroup degree is 7 and the cyclic degree is 6; the omitted kernel is `E[2]`.

At `n=1` the correspondence is the diagonal and its differential action is the identity.

At `N=1` both spaces are zero and the zero-dimensional pairing is perfect.

### Dependencies

Use Layer 1, Layers 3–5, Layer 6. External contracts: ComplexComparisonPartII, SchemeAndStackFoundations. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 8: Fields of definition and generic descent

<a id="s8-1"></a>

### 8.1 Canonical generic models and coefficient descent

For the independently constructed open and compact modular models, the open and compact uniformization in §§3.14 and 6.1 comparisons respect their characteristic-zero fields of definition. `Γ₀` and `Γ₁` have their canonical Q-models; fixed full N-pairing has a `Q(ζ_N)`-model; the paired twist `Y(ρ)` has the MC5C Q-model. Effective descent of curve maps and sections applies to these actual models. A section defined over C descends to a characteristic-zero coefficient field K containing the model’s field when its q-expansion at a K-rational split cusp has coefficients in K, with the supplied injective q-expansion map and its field-base-change equality checked.

The cusp is K-rational and its chosen Tate parameter/frame is defined over K; otherwise first enlarge K to split the cusp and use the resulting Galois descent datum.

Use finite-dimensional section spaces with flat field base change; no arbitrary nonflat integral q-expansion principle is asserted.

The compact input is the level-H construction in Layers 3 and 5, and this stage exports to Layer 10.

Establish this as follows. Keep the curve and line bundle from the algebraic suppliers, and compare their complex fibres rather than reconstructing them from the analytic quotient. Apply the imported effective descent framework to semilinear automorphisms and maps. For coefficients, choose a K-basis and use finitely many q coefficients giving an injective finite-dimensional coordinate map. Solve its linear coordinate system over K to show that a section with coefficients in K lies in the K-form; verify the cusp parameter and Hodge normalization.

The theorem is `canonicalGenericFibreDescent`.

**Checks.**

- A nonsplit cusp does not give coefficient descent to K without its parameter descent datum.
- The map retains the factor `(2πi)^k` from the modular Hodge frame.
- The full Hecke pairing of Layer 7 is already over Q and remains compatible under this export.

*Needs:* [§4.1](#s4-1); [§4.4](#s4-4); [§5.2](#s5-2); [§6.1](#s6-1); [§6.4](#s6-4); [§7.1](#s7-1); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); [ModularCurves Layer 5C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA); `ComplexComparisonPartII` C2.1 (`gagaBaseChange`).

([Conrad, q-expansions](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.3–6; [Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.5–4.8, pp.311–313.)

<a id="s8-2"></a>

### 8.2 The rational function field of `X₀(N)`

For any field K and `N≥1`, construct `qExpansionField K N` as the intermediate field of `K((q))/K` generated by the integral Laurent series j(q) and `j(q^d)` for positive `d∣N`, with coefficients mapped from ℤ to K. The series j is `E₄³/Δ`, with leading term `q⁻¹`; use formal series, without an analytic convergence assumption. Prove generation, functoriality in K and the level, and the identity `j(q^(pd))=j(q^d)^p` in characteristic p. For `N=p^a M`, `p∤M`, it follows that `qExpansionField K N=qExpansionField K M`.

When N is invertible in K, prove `gammaZeroRationalFunctionField`: q-expansion identifies the function field of the actual smooth projective `X₀(N)_K` with `qExpansionField K N=K(j(q),j(q^N))`. Here j is the source invariant and j′ is the invariant of `E/C` for the cyclic order-N subgroup C; the function-field degree over `K(j)` is `ψ(N)`. Over ℚ this recovers [§5.6](#s5-6)'s cyclic modular polynomial and normalization, and over ℂ it identifies `j′(τ)=j(Nτ)`. In characteristic dividing N, the Laurent-series definition still applies, but the whole coarse fibre can be reducible and has no single function field of this form.

The q-adic valuation restricts to a degree-one place `qExpansionCuspInfty`, corresponding to ∞ on the smooth model; `1/j=q+O(q²)` is a uniformizer. For an algebraic closure K̄, coefficientwise `σ∈Gal(K̄/K)` fixes q and gives a σ-semilinear automorphism of `qExpansionField K̄ N`. Construct `qExpansionGaloisAction`, including its actions on places, Tau Ceti divisors and degree-zero divisor classes `Cl⁰`, preservation of degree and principal divisors, and continuity of the discrete action on n-torsion. For n invertible in K, `qExpansionTorsionRepresentation` has finite `ℤ/n`-module carrier `Cl⁰[n]`; it has rank `2g` when N is also invertible. In characteristic p, geometric p-torsion need not have rank `2g`. The same semilinear place/divisor/class construction is a target for the function field of any smooth proper geometrically integral K-curve, using its geometrically integral constant extensions. Extend the pinned constant-linear automorphism API rather than defining a second divisor group.

For a prime ℓ and `N≥1`, construct `qExpansionDegeneracy`: the embeddings from level N to level `Nℓ` are inclusion and formal substitution `q↦q^ℓ`. Their geometric comparison in §9.1 identifies them with degeneracy pullbacks when `Nℓ` is invertible in K. On the invertible-N range construct `qExpansionFricke` by source/dual-cyclic-quotient symmetry: it sends `j(q^d)` to `j(q^(N/d))` for `d∣N`, in particular exchanges j and j′, and squares to one. Section 9.3 identifies it with the geometric involution of `X₀(N)`. This is an automorphism of the generated function field, not a substitution preserving its q-adic place: Fricke sends ∞ to 0. These field maps induce the place, divisor and class maps, with their degree and principal-divisor compatibilities. The Laurent-series and divisor-class interfaces follow the design used by the Imperial College London FLT project.

Establish this as follows. Use the integral Tate expansions and the cyclic subgroup problem to identify the q-adic branch. On the invertible-level smooth curve, generic cyclic quotients have distinct target invariants; the source/target map is birational onto its plane image. The intermediate quotient by the unique subgroup of order d gives each divisor-level generator. Combine this with the regular projective curve/function-field dictionary. Coefficient automorphisms transport valuation rings and their residue fields semilinearly, preserving residue degrees and function orders. Descend this action through principal divisors; finite presentation of divisors and rational functions over finite coefficient extensions proves continuity. Pull back the actual degeneracy and Fricke maps to characterize their field actions.

The public targets are `qExpansionField`, `qExpansionCuspInfty`, `qExpansionGaloisAction`, `qExpansionTorsionRepresentation`, `qExpansionDegeneracy`, `qExpansionFricke` and `gammaZeroRationalFunctionField`.

**Checks.**

- At `N=1` the extension degree is one.
- At `N=4` in characteristic different from 2 the function-field degree is six, not the all-subgroup Hecke degree seven.
- The two source/target invariant maps are defined over Q.
- In characteristic p at level p, `j(q^p)=j(q)^p`, so the generated field is `K(j)`; the two-component fibre of `X₀(p)` is not an integral curve with degree `p+1` function field.
- Coefficient conjugation fixes the rational cusp ∞ but can move a nonrational place, while preserving its degree and the class of a principal divisor.
- Inclusion sends j to j, while the second degeneracy embedding sends it to `j(q^ℓ)`; Fricke interchanges j and j′ and moves the q-adic cusp to 0.

*Needs:* [§4.5](#s4-5); [§5.6](#s5-6); [§8.1](#s8-1); [AlgebraicCurves Layer 12](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts); Tau Ceti `Divisor`, `Divisor.degree_smul` and `Divisor.principal_smul` (`FieldTheory/FunctionField/Divisor/Automorphism.lean`); `AbelianSchemesAndArithmeticModuli` A3.1–A3.5 (prime-to-characteristic Jacobian torsion).

([Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Theorem 6.1, pp.87–90; §7, pp.94–96; [Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), VI §6.16, p.290, and VII §§1–2, for good-level fibres and Tate expansions; Stichtenoth, *Algebraic Function Fields and Codes*, I §4 and III §5, for places and automorphisms.)

<a id="s8-3"></a>

### 8.3 Component fields and symplectic descent

For `N≥3`, the determinant map on the unrestricted full-level generic curve has fibres `Y(N,ζ)` which are geometrically connected, and the same pairing labels extend to its compact model. Over a splitting field these are exactly its `φ(N)` geometric components. Galois sends the `ζ` fibre to the `σ(ζ)` fibre, so the fixed fibre is defined over `Q(ζ)` and cannot be treated as a Q-subcurve without a compatible descent datum. The frame cocycle of the paired representation descends the selected fibre to `Y(ρ)/Q` and its canonical compact normalization. An unpaired `GL₂` twist of all determinant fibres is a different moduli problem.

The compact normalization of `Y(ρ)` is supplied by the generic algebraic compactification/descent interface; it is not constructed by analytic completion.

Use the pairing-compatible cocycle of MC5C. Determinant data are part of the descent, not extra component labels added afterwards.

Establish this as follows. Apply geometric connectedness on every primitive determinant fibre. The Galois-equivariant algebraic pairing computes the permutation of fibres. Identify the stabilizer of `ζ` in Galois and its cyclotomic fixed field. Use the imported symplectic-frame quotient descent and unique proper-curve normalization to obtain the twisted compact model and its level compatibilities.

The theorem is `componentFieldsAndTwistedDescent`.

**Checks.**

- At `N=5`, Galois permutes four geometric components through the cyclotomic character.
- A nontrivial paired twist is geometrically one fixed-pairing curve, not four components.

*Needs:* [§4.10](#s4-10); [§5.2](#s5-2); [§6.4](#s6-4); [§8.1](#s8-1); [ModularCurves Layer 5B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves Layer 5C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out).

([Conrad, analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf), §8, pp.17–19; §9, pp.20–22; Theorem 17.21, p.42; [Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.5–4.8, pp.311–313.)

<a id="s8-4"></a>

### 8.4 Complex conjugation and pairing inversion

Complex conjugation on the canonical algebraic models corresponds analytically to `τ↦−τ̄` after restoring the positive lattice orientation. On a strict full frame of pairing `ζ_N⁻¹`, `(P,Q)=(1/N,τ/N)`, the conjugate becomes `(P′,−Q′)` on `Λ_{−τ̄}`; its pairing is `e_N(P′,Q′)⁻¹=ζ_N`, the complex conjugate of `ζ_N⁻¹`. It sends the `ζ` component to the `ζ⁻¹` component, acts on cusp labels and residue fields through their actual cyclotomic descent data, and commutes with `Γ₀` source/target j maps. An arbitrary automorphism of C acts semilinearly on the algebraic model; it is not claimed to be a holomorphic map on H.

The analytic formula is for the continuous field automorphism of complex conjugation.

Choose the oriented basis explicitly; taking `(1,τ̄)` without changing orientation would give a lower-half-plane parameter.

Establish this as follows. Conjugate the lattice and its torsion coordinates, then replace the second period by its negative to return to H. The basis change has determinant `−1`, so use the Weil pairing determinant formula. Compare algebraic conjugation on the independently constructed models, their j functions and cusp charts; uniqueness extends the open comparison.

The theorem is `complexConjugationComparison`.

**Checks.**

- At `N=3` conjugation exchanges the two pairing components.
- For `Γ₀(N)` the rational cusps 0 and infinity remain rational.
- Complex conjugation is antiholomorphic; arbitrary `σ∈Aut(C)` receives no analytic continuity assertion.

*Needs:* [§1.5](#s1-5); [§6.3](#s6-3); [§8.3](#s8-3); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out).

([Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), §7, pp.95–96; [Bakker–Tsimerman, preprint](https://arxiv.org/pdf/1403.7168v2), §2.1, p.5.)

<a id="s8-5"></a>

### 8.5 Generic base change and level compatibility

All the generic-fibre curve, pairing, cusp, Hodge-line and regular-differential comparisons commute with characteristic-zero field extension, level division, the imported diamond actions and the characteristic-zero Hecke actions with their stated level conditions. The finite boundary algebra and its rational/cyclotomic labels base change as algebraic data. The resulting interface is supplied to Layer 10 and the CM-class-function consumers. It makes no assertion that formation of arbitrary integral coarse spaces commutes with every base change.

Field extensions are flat; retain the actual model’s field, cusp splitting field and pairing value.

A map changing determinant is a map between the indicated components. For `U_p` and good `T_n` retain the separate branch conditions.

Establish this as follows. Check the commutative diagrams on the marked torus and Tate charts for every permitted map. Use faithful field extension and the algebraic map/section descent interface to obtain equalities over the coefficient field. Apply uniqueness of extension on normal projective curves and proper coherent base change for differential section spaces.

The theorem is `genericBaseChangeAndLevelCompatibility`.

**Checks.**

- The dependency direction is the level-H construction in Layers 3 and 5, followed by compact comparison in Layer 6, field descent in Layer 8 and component compatibility in Layer 10.
- No integral coarse-base-change theorem is smuggled into the field-extension comparison.
- Every Hecke diagram uses the normalization proved in Layer 7.

*Needs:* [§4.5](#s4-5); [§5.2](#s5-2); [§5.3](#s5-3); [§6.2](#s6-2); [§7.4](#s7-4); [§8.1](#s8-1); [ModularCurves Layer 0E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out); `ComplexComparisonPartII` C−1.1–C−1.3 and C1.9 (analytification and proper coherent GAGA); `ComplexComparisonPartII` C2.1 (`gagaBaseChange`).

([Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), VII §§4.1–4.8, pp.310–313; [Conrad, q-expansions](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf), pp.3–6.)

### Examples

Use the negative controls in the subsections to check the component labels, hypotheses and directions of maps before transporting the interfaces.

### Dependencies

Use Layer 1, Layer 4, Layer 5, Layer 6, Layer 7. External contracts: ComplexComparisonPartII. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 9: Algebraic correspondences and quotient curves

<a id="s9-1"></a>

### 9.1 Compactified Hecke degeneracy maps

For `N≥1` and a prime p, the disjoint `Γ₁(N;p)` level stack parametrizes a `Γ₁(N)` structure and an order-p cyclic subgroup disjoint from its marked divisor in the required generalized-curve sense. Its two maps to `Γ₁(N)` forget the subgroup or quotient by it and contract the polygon to restore the ample marked divisor. Both stack maps are representable finite flat over `ℤ`, of degree `p+1` if `p∤N` and p if `p∣N`. Their universal isogeny induces `ξ:π₂*ω→π₁*ω`. For squarefree q use the analogous `Γ₁(N;q)` disjoint level problem and finite-flat legs. In characteristic zero these are the customary curve correspondences. Coarse finite flatness is asserted only after its own descent check; it does not follow just from stack finite flatness.

For the cyclic-level maps `X₀(Np)→X₀(N)` over a field K with `Np` invertible, prove that their function-field pullbacks are §8.2's `qExpansionDegeneracy`: inclusion and `q↦q^p`, respectively. The Tate quotient determines the formulas at ∞, and injective expansion determines the field maps.

Establish this as follows. Use the Layers 3 and 4 disjoint Drinfeld level stack, not an arbitrary subgroup pair on a degenerate polygon. Form the quotient generalized curve and contract; use the formal power isogeny at multiplicative cusps. Apply the cited finite-flat moduli theorem over `ℤ` and compute generic degree. On any coarse model verify the separate descent hypotheses.

The public interface should expose:

- `heckeLevelStack`: The disjoint compactified level stack with its universal quotient isogeny.
- `degeneracy1`: Forget the p-subgroup then contract the allowed polygon.
- `degeneracy2`: Quotient by the subgroup then contract, retaining the transported level point.
- `degeneracyHodgeMap`: The isogeny differential `ξ` extends over every cusp and equals the power-map differential on multiplicative charts.
- `degeneracyDegree_coprime` and `degeneracyDegree_dvd`: The numerical function returns `p+1` when `p∤N` and p when `p|N`; only prime p and positive N receive the geometric interpretation.

**Checks.**

- At `N=1,p=2` the numerical function returns 3, including the small nonfine level.
- `N=11,p=2`: degree 3, the three lines of `E[2]`.
- `N=10,p=5`: degree 5; the level-intersecting subgroup is excluded.
- On the multiplicative-kernel cusp, `ξ` sends `du/u` to p `du/u`, even when its residue is zero.
- The purely inseparable ordinary branch has one geometric preimage with rank p, so counting points gives the wrong trace.
- `N=11,p=2` gives degree 3; `N=10,p=5` gives degree 5.
- In characteristic p a leg can be inseparable on one component. Counting geometric points is not a degree computation.

*Needs:* [§3.1](#s3-1); [§3.2](#s3-2); [§3.5](#s3-5); [§3.7](#s3-7); [§3.15](#s3-15); [§4.1](#s4-1); [§5.2](#s5-2); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients); `AlgebraicModuliForArithmeticGeometry §5.3/ArithmeticModuli.FiniteCorrespondence`; `AlgebraicModuliForArithmeticGeometry §5.3/ArithmeticModuli.FiniteCorrespondence.coarse_finite`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3, pp.43–46; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), Lemma 4.7.1, p.49; [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.2, pp.71–72.)

<a id="s9-2"></a>

### 9.2 Diamond operators

For `a∈(ℤ/N)×`, `I_a` sends `(E,P)` to (E,aP) on the compactified `Γ₁(N)` problem, with the necessary contraction on generalized curves. It preserves the coarse curve over `ℤ` and the Hodge sheaf via the identity on E. The stack action is the whole unit group. On a coarse curve `I_−1` is the identity through the isomorphism `[−1]` of marked curves, but that same isomorphism acts as `−1` on `ω`; weight-k descent therefore requires the appropriate sign/character. `I_a I_b=I_ab`. On `Γ₀(N)` every diamond is trivial. Do not identify the Hodge action with a trivial coarse action when k is odd.

Establish this as follows. Change the Drinfeld marked point by a unit; the ample divisor and contraction are preserved. Use the inverse unit for inverse and the product for composition. Track the differential of `[−1]` when the underlying coarse map becomes identity.

The public interface should expose:

- `diamond`: Compactified automorphism `I_a` and its Hodge identification.
- `diamond_mul`: Composition follows multiplication of units.
- `diamond_inv`: `I_(a⁻¹)` is inverse.
- `diamond_minusOne`: `I_−1` is trivial on the coarse curve but has sign `−1` on the Hodge fibre.
- `diamond_baseChange`: Formation commutes with the legal base changes of the moduli problem.

**Checks.**

- `φ(11)/2=5` for the coarse unit quotient.
- Weight one with trivial character cannot descend by asserting `I_−1` acts trivially on `ω`.
- On `Γ₀(N)` the curve diamond maps are identity.
- `I_2 I_3=I_6` for `N=11`, including the boundary.
- `N=11` gives an effective unit quotient of order 5 on `X₁(11)`; `N=3` gives a genus-zero coarse curve, whose Jacobian action is trivial.

*Needs:* [§2.6](#s2-6); [§4.1](#s4-1); [§5.2](#s5-2).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.4, pp.42–43, Lemma 4.4.1; [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.65–66; §5.2, p.71.)

<a id="s9-3"></a>

### 9.3 Cyclotomic Fricke involution

For `N≥5` over `ℤ[1/N,ζ_N]`, with `ζ_N` primitive, construct `w_ζ` on `X₁(N)` by quotienting E by `⟨P⟩` and choosing the dual-kernel generator determined by `e_N(P,Q)=ζ_N`. Extend by the generalized quotient/contraction at cusps. On the coarse curve `w_ζ²=id` and `w_(ζ^a) w_ζ=I_a` (the point inversion in the double quotient is already trivial on the coarse curve). Thus `w_ζ=w_(ζ⁻¹)` on this curve, and it descends to the real cyclotomic base `ℤ[1/N,ζ_N+ζ_N⁻¹]`. Galois acts by g `w_ζ g⁻¹=w_(gζ)`. It is not generally defined over `ℚ`. The prime `Γ₀(N)` integral normalization extension over `ℤ[1/N]` is Layer 10’s existing construction.

For `N≥1` invertible in K, the cyclic-quotient involution on `X₀(N)_K` has function-field action `qExpansionFricke` of §8.2. Compare on j and j′, and on each divisor-level quotient, to obtain `j(q^d)↦j(q^(N/d))`. It is defined over K and carries ∞ to 0; no root choice from the pointed-level construction enters this cyclic-level action.

Establish this as follows. Use the Weil pairing and dual quotient isogeny to select the target marked point. Compare two successive quotient constructions, fixing the diamond convention by the displayed law. Extend on Tate charts, then use normality/full faithfulness for equality and descent.

The public interface should expose:

- `atkinLehner`: The cyclotomic pointed quotient map extended to `X₁(N)`.
- `atkinLehner_sq`: The coarse map is involutive.
- `atkinLehner_changeRoot`: `w_(ζ^a) w_ζ=I_a`.
- `atkinLehner_galois`: Conjugation changes `ζ` to `gζ`.
- `atkinLehner_realDescent`: Descent along `ζ↔ζ⁻¹` to the real cyclotomic base.

**Checks.**

- At `N=1`, `τ=2i` the action gives `i/2`, fixing both the sign and the reciprocal.
- At `N=2`, `τ=i` it gives `i/2`, and a second application gives i.
- At `N=0` there is no Fricke matrix, since `frickeGL` needs N invertible; the totalized formula `−1/(0·τ)=0` leaves `ℍ`.
- Two cyclic quotients recover the coarse marked curve.
- At `N=11` two root choices with ratio exponent a differ by the nontrivial diamond `I_a` when `a≠±1`.
- A full `Γ₁` Fricke map is not automatically `ℚ`-rational just because the `Γ₀` Fricke map is.
- For `N,z≠0`, `−1/(N(−1/(Nz)))=z`.
- Replacing `ζ` by `ζ^a` changes the map by a diamond; omitting the field of definition destroys the Galois conjugation law.

*Needs:* [§4.1](#s4-1); [§5.2](#s5-2); [§9.2](#s9-2); Tau Ceti `TauCeti.frickeGL`; Mathlib `UpperHalfPlane.glAction`; [ModularForms Layer 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients); [ModularCurves Layer 2E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing); [ModularCurves Layer 10](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.2, pp.70–73.)

<a id="s9-4"></a>

### 9.4 Exact-divisor Atkin–Lehner operators

For `d∣N` with `gcd(d,N/d)=1`, split a cyclic N-subgroup into its d and `N/d` factors and quotient by the d factor, replacing that factor by the dual kernel. This defines the `ℚ`-rational involution `w_d` on `X₀(N)`; compactification is by normalization and the Tate boundary comparison. They commute and `w_d w_e=w_(de/gcd(d,e)²)`, so the group has `2^ω(N)` elements. The full Fricke map is `d=N`. No such involution is asserted from a nonexact divisor. On forms these are the operators `W_Q` of ModularForms Layer 6, built on Tau Ceti's `TauCeti.atkinLehnerMatrix` for exact divisors (`TauCeti.Nat.IsExactDivisor`); this subsection constructs the involutions of the curve. Prime `N≥5` over `ℤ[1/N]` uses the ModularCurves Layer 10 map; at primes dividing N extending to a chosen regular or semistable model is a separate equivariant-model assertion.

Establish this as follows. Construct the coprime subgroup decomposition and its dual quotient on the elliptic open. Extend the map by normal compactification and invert it by the same construction. Compute the composition from prime-power factor decompositions. Import the prime-level integral overlap rather than redo it.

The public interface should expose:

- `atkinLehnerExact`: `w_d` with a proof d is an exact divisor.
- `atkinLehnerExact_mul`: The composition has exact divisor `de/gcd(d,e)²`.
- `atkinLehnerExact_one`: `w₁` is identity.
- `atkinLehnerExact_field`: The `Γ₀` construction is over `ℚ`, independently of a primitive root.
- `atkinLehnerExact_model`: On the specified `p²` semistable model it is the component/branch action of Layer 11.

**Checks.**

- `N=12`: exactly four exact-divisor operators.
- `d=2` at `N=12` cannot be supplied as an exact divisor.
- `d=1` gives identity.
- `w₃w₄=w₁₂` and `w₄²=id` for `N=12`.
- `N=12` has exact divisors 1,3,4,12; 2 is not exact. The product `w₃w₄` is `w₁₂`.
- `w₄w₄=w₁`, not `w₁₆`.

*Needs:* [§4.1](#s4-1); [§5.2](#s5-2); [§9.3](#s9-3); Tau Ceti `TauCeti.Nat.IsExactDivisor`; [ModularForms Layer 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients); [ModularCurves Layer 10](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §2, p.227; [Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem 6.5 and proof of Theorem 6.6, pp.928–929.)

<a id="s9-5"></a>

### 9.5 The split Cartan normalizer quotient

For a prime `ℓ`, over `ℚ` there is an algebraic isomorphism `X₀(ℓ²)/⟨w_(ℓ²)⟩≃X_s⁺(ℓ)`, where `X_s⁺` denotes the curve for the monomial subgroup `C_s⁺(ℓ)`, equivalently the moduli of an unordered pair of distinct `ℓ`-subgroups. This subgroup is the split Cartan normalizer for odd `ℓ`; at `ℓ=2` it is the order-2 line-pair stabilizer. Given a cyclic chain `E→E/C_ℓ→E/C_(ℓ²)`, the middle curve has two distinct order-`ℓ` subgroups, one from the dual first isogeny and the other from the second; reversing the chain exchanges the pair. The inverse construction and finite-normal compactification comparison establish the isomorphism. This is not the ordered split-Cartan curve. At `ℓ` itself it is a generic-fibre identification; the semistable quotient is constructed after the explicit extension in Layer 11.

Establish this as follows. Construct the unordered middle pair from a cyclic `ℓ²`-chain, using dual isogenies and the coprimality of the two middle directions. Reconstruct a chain from an unordered pair up to reversal; this identifies the elliptic open moduli functors over `ℚ`. Extend the finite birational map between normal compactifications; no analytic connectedness is required.

**Checks.**

- At `ℓ=2`, `X₀(4)/⟨w₄⟩≅X_s⁺(2)` has j-degree 3; the literal normalizer would give degree 1.
- Ordering the pair gives `X_s(ℓ)≅X₀(ℓ²)`, and reversing the chain induces its order-2 quotient.
- At `ℓ=13`, the ordered `X_s(13)` has `(j-degree, genus)=(182,8)`, whereas `X_s⁺(13)` has `(91,3)`.

*Needs:* [§5.2](#s5-2); [§9.4](#s9-4); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients).

([Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.2, proof of Theorem 6.6, p.929; §6.3, pp.929–930.)

<a id="s9-6"></a>

### 9.6 Cartan modular curves

Let `ℓ` be a prime and `H̄⊂GL₂(𝔽_ℓ)` a subgroup, with `H⊂GL₂(Ẑ)` its preimage. The coarse curve `X_H` is a normal projective curve over `ℤ`, smooth over `ℤ[1/ℓ]`, of degree `[GL₂(𝔽_ℓ):±H̄]` over `ℙ¹_ℤ`, with cyclotomic base `ℤ` when det `H̄=𝔽_ℓ^×`. For the split plus level use the monomial subgroup even at `ℓ=2`. For the Cartan levels write `X_s(ℓ)=X_{C_s(ℓ)}`, `X_s⁺(ℓ)=X_{C_s⁺(ℓ)}`, `X_ns(ℓ)=X_{C_ns(ℓ)}`, `X_ns⁺(ℓ)=X_{C_ns⁺(ℓ)}`, of degrees `ℓ(ℓ+1)`, `ℓ(ℓ+1)/2`, `ℓ(ℓ−1)` and `ℓ(ℓ−1)/2` for `ℓ` odd. Over `ℤ[1/ℓ]`, a level-`C_s⁺(ℓ)` structure on E is an unordered pair of distinct subgroups of order `ℓ` (equivalently a split Cartan subalgebra `𝔽_ℓ×𝔽_ℓ` of `End(E[ℓ])`), a level-`C_s(ℓ)` structure an ordered such pair, a level-`C_ns⁺(ℓ)` structure a subalgebra of `End(E[ℓ])` étale locally conjugate to `𝔽_{ℓ²}`, and a level-`C_ns(ℓ)` structure such a subalgebra with a chosen isomorphism to `𝔽_{ℓ²}`. The ordered split Cartan curve is identified with `X₀(ℓ²)` over `ℤ[1/ℓ]` by `(E,C₁,C₂)↦(E/C₁, [ℓ]⁻¹(C₂)/C₁)`, and `X_s⁺(ℓ)` with `X₀(ℓ²)/⟨w_{ℓ²}⟩`, over `ℚ` by [§9.5](#s9-5) and over `ℤ[1/ℓ]` because the ordered identification carries the exchange of `C₁` and `C₂` to `w_{ℓ²}`. Every other subgroup of `GL₂(𝔽_ℓ)`, for example the preimage of an exceptional `S₄⊂PGL₂(𝔽₁₃)`, gives its curve by the same construction. The notation `X_s(ℓ)` always denotes the ordered diagonal curve.

Citation dictionary: Zywina’s `X_s` is our ordered `X_s`; Balakrishnan–Dogra–Müller–Tuitman–Vonk’s `X_s` is our `X_s⁺`, and their `X_ns` is our `X_ns⁺`.

`ℓ` prime; `ℓ` odd for the nonsplit Cartan description with a nonsquare `ε`, `ℓ=2` using the order-3 subgroup.

The moduli descriptions hold over `ℤ[1/ℓ]`; over `ℤ` the curve is defined as `X_H`.

Establish this as follows. Apply [§3.12](#s3-12) and [§5.2](#s5-2) to the preimage H. Degrees from [§5.10](#s5-10) and the orders of the Cartan subgroups ([§3.8](#s3-8)); `−I` lies in each Cartan subgroup, so projective index equals index. Moduli: a frame orbit `φH̄` is determined by the subalgebra `φAφ⁻¹⊂End(E[ℓ])` with A the Cartan algebra, since frames with the same subalgebra differ by an element of the normalizer of the algebra A (at `ℓ=2`, normalizing its unit subgroup `A^×` would not suffice); for `C_s` this subalgebra is the pair of eigenlines. The ordered split Cartan identification: from complementary lines `C₁,C₂`, the quotient `E/C₁` carries the cyclic subgroup `[ℓ]⁻¹(C₂)/C₁` of order `ℓ²`; conversely a cyclic K of order `ℓ²` on E′ gives `E=E′/K[ℓ]` with `C₂=K/K[ℓ]` and `C₁` the kernel of the dual isogeny; both are inverse on the elliptic opens over `ℤ[1/ℓ]`, and they extend to the normal compactifications by the finite-normal recognition criterion of ModularCurves Layer 10.

The public interface should expose:

- `cartanCurve`: `X_H` for a subgroup `H̄⊂GL₂(𝔽_ℓ)`, and the four abbreviations `X_s`, `X_s⁺`, `X_ns`, `X_ns⁺`.
- `cartanCurve_degree`: The j-degree of `X_s`, `X_s⁺`, `X_ns`, `X_ns⁺` is `ℓ(ℓ+1)`, `ℓ(ℓ+1)/2`, `ℓ(ℓ−1)`, `ℓ(ℓ−1)/2` for `ℓ` odd.
- `cartanCurve_moduli`: Over `ℤ[1/ℓ]`, level-Cartan structures are the Cartan subalgebras of `End(E[ℓ])` of the given type, ordered for `C_s` and `C_ns`.
- `splitCartanCurve_iso_gammaZero`: `X_s(ℓ)≅X₀(ℓ²)` over `ℤ[1/ℓ]` by `(E,C₁,C₂)↦(E/C₁,[ℓ]⁻¹(C₂)/C₁)`; it is not an isomorphism over the j-line.
- `cartanCurve_cusps`: For odd `ℓ`, `X_s⁺(ℓ)` has a distinguished rational cusp and `(ℓ−1)/2` further cusps conjugate over `ℚ(ζ_ℓ)⁺`; `X_ns⁺(ℓ)` has `(ℓ−1)/2` cusps conjugate over that field. The nonsplit cusps are nonrational for `ℓ≥5` and rational at `ℓ=3`. At `ℓ=2`, `X_s⁺(2)` has two rational cusps and `X_ns⁺(2)=X(1)` has one rational cusp.
- `cartanCurve_quotient`: `X_s⁺(ℓ)=X_s(ℓ)/(ℤ/2)`, the involution swapping the two lines ([§5.16](#s5-16)).

**Checks.**

- `X_s⁺(13)` has degree 91 and `X_ns⁺(13)` degree 78 over `ℙ¹_j`.
- For `ℓ=2`, `C_s(2)` is trivial and `X_s(2)=X(2)`, of degree 6; `C_s⁺(2)` is monomial of order 2 and gives degree 3.
- `X_ns⁺(3)` has one cusp over `ℚ(ζ₃)⁺=ℚ`, so that cusp is rational.
- `X_ns⁺(2)=X(1)` has one rational cusp; the odd-prime cusp formula does not apply.
- For odd `ℓ≥5`, the ordered split Cartan curve `X_s(ℓ)` has degree `ℓ(ℓ+1)`, twice that of `X_s⁺(ℓ)` (182 against 91 for `ℓ=13`), and two rational cusps instead of one; it is not the normaliser curve.
- `X_ns⁺(13)` has six cusps, permuted transitively by `Gal(ℚ(ζ₁₃)⁺/ℚ)`.
- For odd `ℓ`, `X_s(ℓ)` has `ℓ+1` cusps, all of width `ℓ`: two `ℚ`-rational and `ℓ−1` conjugate over `ℚ(ζ_ℓ)`; `X_s⁺(ℓ)` has `(ℓ+1)/2` cusps, the distinguished `ℚ`-rational image of 0 and `∞` of `X₀(ℓ²)` and `(ℓ−1)/2` further cusps conjugate over `ℚ(ζ_ℓ)⁺`. At `ℓ=3` the further cusp is also rational.
- For odd `ℓ`, `X_ns⁺(ℓ)` has `(ℓ−1)/2` cusps, all conjugate over `ℚ(ζ_ℓ)⁺`, so no `ℚ`-rational cusp for `ℓ≥5`.
- For `ℓ=13`, `X_s⁺(13)`, `X_ns⁺(13)` and the exceptional `S₄` curve have degrees 91, 78 and 91 over the j-line.

*Needs:* the finite-normal recognition contract of ModularCurves Layer 10; [§3.8](#s3-8); [§3.12](#s3-12); [§5.2](#s5-2); [§5.3](#s5-3); [§5.10](#s5-10); [§5.11](#s5-11); [§5.12](#s5-12); [§9.5](#s9-5); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients).

([On the possible images of the mod ℓ representations associated to elliptic curves over ℚ](https://arxiv.org/pdf/1508.07660), §1, Notation, p.2 (Cartan groups); §3.2, p.15; §3.3, Lemma 3.6, p.16; [Česnavičius, modular description](https://arxiv.org/pdf/1511.07475v2), §6.1, p.62; Proposition 6.4(a), p.63; [Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1, p.887; §6, p.926; §6.3, pp.929–930.)

<a id="s9-7"></a>

### 9.7 Rational points of `X_H` and Galois images

Let H be an open level subgroup with `−I∈H̄`, n with `Γ(n)⊂H`, and K a field of characteristic not dividing n. If `E/K` is an elliptic curve whose mod-n image `ρ̄_{E,n}(G_K)⊂GL₂(ℤ/n)`, computed in some frame, is conjugate into `H̄`, then `j(E)` is the image of a K-point of `Y_H`. Conversely, if `x∈Y_H(K)` has `j(x)∉{0,1728}` (`j(x)≠0` when `char K∈{2,3}`), then every elliptic curve `E/K` with `j(E)=j(x)` has `ρ̄_{E,n}(G_K)` conjugate into `H̄`. Without `−I∈H̄` the converse holds for a suitable quadratic twist of E only; at `j=0` or 1728 a K-point need not come from a curve with image in `H̄`. For `H=C_s⁺(ℓ)` or `C_ns⁺(ℓ)` this gives the correspondence between non-cuspidal rational points of `X_s⁺(ℓ)`, `X_ns⁺(ℓ)` with `j∉{0,1728}` and elliptic curves over `ℚ` with image in the corresponding Cartan plus subgroup, with no twist; for split `ℓ=2` this is the monomial subgroup. In particular the fibres of `X_s⁺(13)` over `j=0` and `j=1728` contain `ℚ`-points, coming from `y²=x³+1` and `y²=x³−x`, whose mod-13 images lie in a split Cartan normaliser because 13 splits in `ℚ(√−3)` and in `ℚ(i)`.

`−I∈H̄` for the converse without twist; `char K∤n`; `j(x)∉{0,1728}`.

Establish this as follows. The coarse map is bijective on `K̄`-points (SchemeAndStackFoundations §1.23) and `Gal(K̄/K)`-equivariant, so `x∈Y_H(K)` is a Galois-stable isomorphism class of pairs `(E_{K̄},φH̄)`. Given `E/K` with `j(E)=j(x)∉{0,1728}`, `Aut(E_{K̄})={±1}` (Tau Ceti `WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`); stability means `σ(φ)H̄=±φH̄=φH̄` for every `σ`, using `−I∈H̄`, i.e. `φ⁻¹∘σ∘φ=ρ̄_{E,n}(σ)∈H̄` in the frame `φ`. Conversely, if `ρ̄(G_K)⊂gH̄g⁻¹` in a frame `φ`, the class `(φg)H̄` is Galois-stable, hence a K-point of the finite étale scheme `Isom/H̄` (Galois descent for finite étale schemes, upstream 0D), i.e. a K-point of the stack `Y_H` over `j(E)`, which maps to a K-point of `Y_H`. Without `−I∈H̄`, stability up to `±1` defines a quadratic character by which E must be twisted. For `j=0,1728` the larger automorphism group allows Galois-stable classes not realised by a K-rational structure on any curve with that j-invariant; CM points are therefore checked separately, here by the splitting of 13 in the CM fields.

**Checks.**

- E: `y²=x³−x` has CM by `ℤ[i]` and `13=(3+2i)(3−2i)`, so `ρ̄_{E,13}(G_ℚ)` lies in the normaliser of the split Cartan with eigenlines `E[3+2i]` and `E[3−2i]`, complex conjugation exchanging them: the `j=1728` fibre of `X_s⁺(13)` has a `ℚ`-point.
- An elliptic curve over `ℚ` with a rational 7-isogeny gives a `ℚ`-point of `X₀(7)` over its j-invariant.

*Needs:* [§3.9](#s3-9); [§5.9](#s5-9); [§5.17](#s5-17); [§9.6](#s9-6); `SchemeAndStackFoundations §1.23`; [ModularCurves Layer 0D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions); Tau Ceti `WeierstrassCurve.eq_one_or_eq_negVariableChange_of_smul_eq`.

([On the possible images of the mod ℓ representations associated to elliptic curves over ℚ](https://arxiv.org/pdf/1508.07660), Proposition 3.3, p.15; proof in §3.5, pp.17–19; [Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1, pp.887–888, Theorem 1.2.)

<a id="s9-8"></a>

### 9.8 Atkin–Lehner quotient curves `X₀⁺(N)`

For `N≥2` let `w_N` be the Fricke involution of `X₀(N)_ℚ` (§9.4 with `d=N`), extended to an involution of the normal `ℤ`-curve `X₀(N)` as in the proof. Define `X₀⁺(N):=X₀(N)/⟨w_N⟩`, the quotient of the projective normal `ℤ`-curve `X₀(N)` by the group of order two. It is a normal projective `ℤ`-curve, flat with fibres of pure dimension one, smooth over `ℤ[1/N]`, with a finite surjective quotient map `π_N:X₀(N)→X₀⁺(N)` of degree 2 whose formation commutes with flat base change and with base change to `ℤ[1/2]`-algebras. Over `ℤ[1/N]` its elliptic part is the coarse space of unordered pairs `{φ,φ^∨}` of mutually dual cyclic N-isogenies. The j-map of `X₀(N)` does not descend: the functions `j+j∘w_N` and `j·(j∘w_N)` do, and the map `X₀⁺(N)→ℙ¹` they define with the modular polynomial is not the j-line. For `N=ℓ²` it is `X_s⁺(ℓ)` ([§9.5](#s9-5)).

`N≥2`; `w_N` as in §9.4 on `X₀(N)_ℚ`, extended to `X₀(N)` over `ℤ` in the first proof step.

Base change beyond flat and `ℤ[1/2]`-algebras is not asserted.

Establish this as follows. Extension of `w_N` over `ℤ`: `Φ_N` is monic of degree `ψ(N)` in each variable and symmetric ([§5.6](#s5-6)), so the closure in `ℙ¹_ℤ×ℙ¹_ℤ` of the image of (j,j′) meets `j′=∞` only over `j=∞` and is finite over `ℙ¹_ℤ` by either projection. Hence the normalization of `ℙ¹_ℤ×ℙ¹_ℤ` in `Y₀(N)_ℚ` is finite and normal over `ℙ¹_ℤ` via j and via `j′=j∘w_N`, so it is `X₀(N)` for both projections (the finite-normal recognition criterion of ModularCurves Layer 10), and the involution of `ℙ¹×ℙ¹` exchanging the factors, which `w_N` covers on `Y₀(N)_ℚ`, extends `w_N` to `X₀(N)` by functoriality of relative normalization (Stacks 035J). `X₀(N)` is projective, so `⟨w_N⟩`-orbits lie in affine opens; the geometric quotient exists and `π_N` is finite surjective of degree 2 (SchemeAndStackFoundations §1.17). Normality and flatness pass to the invariant rings; smoothness over `ℤ[1/N]` of the quotient of a smooth relative curve by a finite group holds without invertibility of the order (upstream 9D, smoothness of finite quotients, applied on invariant affine opens). Invariants commute with flat base change and with base change on which 2 is invertible. Moduli over `ℤ[1/N]`: `w_N` sends `(E,C)` to (E/C,E[N]/C), i.e. `φ` to its dual up to the identification of `E/C`, so orbits are unordered dual pairs. Symmetric functions of j and `j∘w_N` are invariant; j itself is not, since `w_N` swaps j and j′ and `j≠j′` on the generic fibre.

The public interface should expose:

- `gammaZeroPlus`: `X₀⁺(N)=X₀(N)/⟨w_N⟩` with its quotient map.
- `gammaZeroPlus.quotientMap`: `π_N:X₀(N)→X₀⁺(N)`, finite surjective of degree 2 and `w_N`-invariant.
- `gammaZeroPlus.lift`: Every `w_N`-invariant morphism from `X₀(N)` to a scheme factors uniquely through `π_N`.
- `gammaZeroPlus.smooth`: `X₀⁺(N)` is smooth over `ℤ[1/N]`.
- `gammaZeroPlus.baseChange`: Formation commutes with flat base change and with base change to `ℤ[1/2]`-algebras.
- `gammaZeroPlus.symmetricJ`: `j+j∘w_N` and `j·(j∘w_N)` descend to `X₀⁺(N)`; j does not.

**Checks.**

- `gammaZeroPlus ℓ²` `≅ X_s⁺(ℓ)` over `ℚ` ([§9.5](#s9-5)).
- For a prime p, `w_p` exchanges the two cusps 0 and `∞` of `X₀(p)`, so `X₀⁺(p)` has exactly one cusp, and it is `ℚ`-rational.
- j does not factor through `π_N`: for `N=2` the values `j(E)` and `j(E/C)` differ for a generic pair.
- For `N=1` the Fricke map is the identity, so the quotient is `X₀(1)=ℙ¹_ℤ` and `π₁` has degree 1, not 2; this is why the construction is stated for `N≥2`.
- `X₀⁺(ℓ²)≅X_s⁺(ℓ)` over `ℚ`; for `ℓ=13` it has genus 3.
- The noncuspidal fixed points of `w_N` over `ℚ̄` are CM points: a fixed pair gives a cyclic degree-N endomorphism of E, whereas a non-CM curve has only integer multiplications, whose kernels are noncyclic when their degree exceeds one.
- On `X₀(4)`, `w₄(1/2)=−1/2=[[1,−1],[0,1]]·(1/2)`, with the translation matrix in `Γ₀(4)`. Thus the cusp `1/2` is fixed. Over `ℚ̄` the ramification points of the degree-two map `π_N` are all fixed points of `w_N`, each of index 2; fixed cusps must be included separately from elliptic CM points in its ramification divisor.

*Needs:* the finite-normal recognition contract of ModularCurves Layer 10; [§5.2](#s5-2); [§5.6](#s5-6); [§5.16](#s5-16); [§9.4](#s9-4); [§9.5](#s9-5); `SchemeAndStackFoundations §1.17`; [ModularCurves Layer 9D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients).

([Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6, p.926; proof of Theorem 6.6, p.929; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I, §§1–2, pp.226–227; Chapter II, §1, p.234 (cusp classes and analytic Fricke action); [Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), §9D, smoothness of finite quotients.)

<a id="s9-9"></a>

### 9.9 Full and cyclic isogeny correspondences

For `m≥1` prime to N on the smooth characteristic-zero `Γ₁(N)` curve, let `A_m` parametrize every subgroup scheme of order m, and let `C_m` parametrize only cyclic subgroups of order m, transporting the marked point by the quotient. Compactify each elliptic-open correspondence by its normal finite closure, retaining cycle multiplicity. The degrees of both legs are `σ₁(m)=Σ_(d∣m)d` for `A_m` and `ψ(m)=m∏_(p∣m)(1+1/p)` for `C_m`. On a split Tate cover the subgroups are indexed by a `d=m` and `0≤b<d`; the quotient parameter is `q′=ζ_d^b q^(a/d)`, and the isogeny is `u↦u^a`. The subgroup is cyclic exactly when `gcd(a,b,d)=1`. Every noncyclic subgroup has a unique scalar elementary-divisor factor r, and `A_m=Σ_(r²∣m)⟨r⟩ C_(m/r²)` as operators/cycles in this transported-level convention. The equality is on completed correspondences with their maps, not an assertion that raw cusp fibre products are normal.

Establish this as follows. Classify finite-index rank-two lattices by Hermite normal form; their elementary divisors give the cyclicity criterion and both counts. Read the corresponding Tate quotient on the split cover and keep the root of unity and differential multiplier a. Use the unique scalar subgroup `E[r]` factor to derive the diamond-weighted decomposition; normalize the compactified finite closures.

The public interface should expose:

- `allSubgroupCorrespondence`: `A_m`, its two finite generic legs and normalized compactification.
- `cyclicSubgroupCorrespondence`: `C_m` with the cyclic condition and its finite normalized closure.
- `allSubgroupCorrespondence_degree`: Its degree is `σ₁(m)`.
- `cyclicSubgroupCorrespondence_degree`: Its degree is `ψ(m)`.
- `correspondenceTateBranch`: The branch (a,d,b) has `q′=ζ_d^b q^(a/d)` and differential multiplier a.
- `allSubgroupCorrespondence_scalarDecomposition`: The decomposition has the diamond `⟨r⟩` attached to `E[r]`.

**Checks.**

- At `m=1` both exponent sets are {(1,1,0)}.
- At `m=4` their sizes are seven and six, and (2,2,0) belongs only to the full set.
- At `m=9` the full set has thirteen elements and the cyclic set twelve; the scalar branch is (3,3,0).
- `σ₁(4)=7` and `ψ(4)=6`; the pair `(a,d,b)=(2,2,0)` is the noncyclic one.
- `A₁=C₁` is the identity correspondence.
- For `m=6` all twelve branches satisfy the cyclic criterion.
- For `m=p` the multiplicative branch has `q′=q^p` and p other branches have `q′=ζ_p^b q^(1/p)`.
- At `N=11,m=4` the scalar `E[2]` term transports P to 2P; replacing it by an identity-level correspondence loses the diamond.
- `m=4` gives seven full subgroups and six cyclic ones. The omitted subgroup is `E[2]`, whose quotient transports P to 2P.
- `m=6` gives both degrees 12 because squarefree subgroups are cyclic.

*Needs:* [§3.7](#s3-7); [§4.1](#s4-1); [§9.1](#s9-1); [§9.2](#s9-2); [ModularCurves Layer 2B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients); `AlgebraicModuliForArithmeticGeometry §5.4/ArithmeticModuli.finite_schematic_closure`; `AlgebraicModuliForArithmeticGeometry §5.4/ArithmeticModuli.normalized_finite_correspondence`.

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §2, p.227; [Bakker–Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.5, pp.716–717; [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §3.1(ii),(v), pp.645–646.)

<a id="s9-10"></a>

### 9.10 Hecke composition relations

For m,n prime to N and `gcd(m,n)=1`, composition of full correspondences `A_m A_n=A_(mn)`; cyclic correspondences also satisfy `C_m C_n=C_(mn)`. The correspondence equality is a normalized cycle equality, not a raw fibre-product isomorphism at the boundary. For `p∤N` the repeated-prime relations in the transported-level convention are `A_p²=A_(p²)+p⟨p⟩`, `A_(p²)=C_(p²)+⟨p⟩`, and `C_p²=C_(p²)+(p+1)⟨p⟩`. At `p∣N` the disjoint `U_p` correspondences instead compose as `U_p U_(p^r)=U_(p^(r+1))`, on their specified level problem; no unit diamond `⟨p⟩` exists there. Abstract double-coset algebra is imported from ModularForms layers 2–3 and the pinned Tau Ceti Hecke ring; this theorem realizes it on these modular cycles.

Establish this as follows. For coprime indices split each subgroup into its unique primary factors; compare the transported marked point. For `p²` count chains above a cyclic subgroup (one) and above `E[p] (p+1)`; the latter transports P to pP. Use normal finite closures for cycle equality and the disjoint bad-prime subgroup condition for U.

**Checks.**

- At `p=2` the cyclic relation has coefficient 3, whereas the full relation has coefficient 2.
- At `N=11,m=2,n=3` both sides have degree 12.

*Needs:* [§9.1](#s9-1); [§9.2](#s9-2); [§9.9](#s9-9); Tau Ceti `HeckeRing.GL2.heckeT_mul_of_coprime`; [ModularForms Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra); [ModularForms Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter I §2, p.227; [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.2, pp.71–72.)

<a id="s9-11"></a>

### 9.11 Integral coherent Hecke trace

For `k≥1`, over `Γ₁(N)/ℤ` define `F=Tr_(π₁)∘ξ^k∘π₂^*` on `ω^k`. The local finite-flat theorem shows `F(ω^k)⊂pω^k`, hence `T_p=F/p` exists integrally over `ℤ` and is compatible with base change as a normalized integral operator. On a characteristic-p base its construction uses lifts modulo `p²` and the proved divisibility/independence of the lift; it is not division by zero in the residue field. On multiplicative ordinary/kernel and cusp charts `ξ` vanishes modulo p; on the étale-kernel ordinary chart the purely inseparable leg has trace zero modulo p. The local operators glue by the coherent-extension lemma. On q expansions, for `p∤N`, `a_n(T_pf)=a_(np)(f)+p^(k−1)a_(n/p)(⟨p⟩f)`, with `a_(n/p)=0` unless `p∣n`; for `p∣N` it is `a_(np)`. These formulas include `n=0`: at a good prime the constant term is `a₀(f)+p^(k−1)a₀(⟨p⟩f)`, and at `p∣N` it is `a₀(f)`. Positive-index formulas alone suffice only for cusp forms. Nothing here defines a normalized étale/Picard trace by dividing by p.

Establish this as follows. Construct the honest finite-flat trace and `ξ^k` on the integral stack. Prove p-divisibility on the two ordinary charts and Tate boundary charts; extend by the cited local CM/coherent lemma. Divide over `ℤ`, prove independence of lifts modulo `p²` and glue; use the Tate branches to verify the coefficient formula.

The public interface should expose:

- `coherentHecke`: The integral normalized `T_p` on `ω^k` for `k≥1`.
- `coherentHecke_rawTrace`: p `T_p=Tr_(π₁) ξ^k π₂^*` over the integral model.
- `coherentHecke_baseChange`: Base change of the proved normalized operator, including residue characteristic p.
- `coherentHecke_qExpansion`: The good and bad coefficient formulas with the displayed diamond.
- `coherentHecke_liftIndependence`: Modulo-`p²` lifts define the same characteristic-p operator.

**Checks.**

- Modulo p at `k=1` retain both `a_(np)` and `a_(n/p)(⟨p⟩f)`.
- Modulo p at `k=2` the p-multiple term vanishes.
- For `p∣N` only `a_(np)` occurs, without an undefined `⟨p⟩`.
- An operator on a characteristic-p ring cannot be defined by inverting p; it is the reduction of the normalized integral trace.
- For `k=1` in characteristic p the second q-term has coefficient 1; for `k≥2` it vanishes modulo p.
- For `E₄` at level one, `p=2` and residue characteristic 5, the constant coefficient of `T₂E₄` is `1+2³=9≡4` mod 5; omitting `n=0` wrongly gives zero.
- The construction needs `k≥1`: `ξ^0` does not give the multiplicative-kernel divisibility argument.

*Needs:* [§3.7](#s3-7); [§4.4](#s4-4); [§9.1](#s9-1); `SchemeAndStackFoundations Layer 2`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.5.1, Lemma 4.5.2 and Example 4.5.3, pp.46–48.)

<a id="s9-12"></a>

### 9.12 Finite-coefficient étale correspondence traces

For the actual finite maps `f:D→C` between smooth proper geometric generic-fibre modular curves and `ℓ` invertible in their base, for each `n≥1` use finite-coefficient curve duality to define the trace `f_*` on `H¹_et(−,ℤ/ℓⁿ)`, also with the Tate twist. It satisfies `f_*f^*=[deg f]`, composition, base change and compatibility with coefficient reduction. Thus `π₁*π₂^*` and its leg reversal give finite-coefficient Hecke endomorphisms, even when `ℓ` divides deg `π₁`; no averaging is imposed. In special characteristic `p≠ℓ` an inseparable finite map still has its degree-weighted Gysin trace, not the sum of its distinct geometric fibres. At a bad nodal fibre use the Layer 12 nearby-cycle/interface comparison; smooth-curve duality is not asserted on that singular carrier.

Establish this as follows. Import the finite-curve duality trace and prove the degree formula using the actual fundamental class. Prove composition and base change at finite coefficients, then compose the two correspondence legs. Section 13.5 passes to adic cohomology and identifies its trace with Picard norm after proving the Kummer comparison. For special nodal models use the supplied specialization exact sequence, retaining multiplicities.

**Checks.**

- Reducing a trace modulo `ℓⁿ` agrees with the trace constructed at that coefficient level; composition retains the full product of degrees.

- A degree-2 map with `ℓ=2` has `f_*f^*=[2]`, not identity.
- Absolute Frobenius in characteristic p has degree p and its duality trace retains that factor although it is a bijection on geometric points.

*Needs:* [§9.1](#s9-1); `EtaleCohomologyFoundations §0.8/ClassicalAlgebraic.finiteTrace`; `EtaleCohomologyFoundations §0.11/ClassicalAlgebraic.smoothTrace`; `EtaleCohomologyFoundations §0.11/ClassicalAlgebraic.curveDuality`; `ComplexComparisonPartII §§C6.3–C6.6`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, Theorem 5.1 and Lemmas 5.4,5.7, pp.65–69.)

<a id="s9-13"></a>

### 9.13 Hecke cycles on projective level curves

For prime level `p>3` and m prime to p, compactify the cyclic degree-m correspondence on the scalar-framed coarse `X(p)` with its transported framing. For a `d=m` use `C_(pd)` as a splitting polygon: the auxiliary map `φ_d:C_(pd)→C_p` has smooth formula `(x,c)↦(x^d,c mod p)`, degree `d²` and an isomorphism on p-torsion. For a transverse cyclic subgroup G of order d, its quotient `ψ_G:C_(pd)→C_p` has degree d, and `ξ_a:C_p→C_p` is power a on Gₘ and identity on `ℤ/p`. The boundary framing is `ξ_a[p] ψ_G[p] φ_d[p]⁻¹` f. Retain only choices whose composite kernel is cyclic (the Tate criterion `gcd(a,b,d)=1`); taking every divisor a,d and every transverse G without this condition gives the full-subgroup boundary union. The source of `φ_d` is `Gₘ×ℤ/(pd)`, and that of `ξ_a` is `Gₘ×ℤ/p`. Keep the `μ_p`-equivariance, smoothing parameter and raw/effective stabilizer distinction. For `μ=id×α` and `ν=id×β` on `X(p)×T_m`, the image cycle `ν_*μ^*C` has canonical degree `ψ(m)` times that of C, by projection formula and numerical equality of `α^*K` and `β^*K`; that the numerical degree of a pullback along a finite curve map is its degree times the original degree follows from the projection formula (SchemeAndStackFoundations Layer 5) applied to the graph and is proved here. For the full-subgroup convention the multiplier is `σ₁(m)`. This is numerical intersection equality, not a canonical line-bundle isomorphism.

Establish this as follows. Use the split (a,d,b) Tate branch; `φ_d` has degree `d²` and is only an auxiliary p-torsion identification. The actual `ξ_a ψ_G` map has degree `ad=m`. Its kernel is cyclic exactly under the stated filter. Transport the projective frame, retaining scalar-equivalence and stabilizers rather than introducing a nonexistent universal family. Apply the cycle projection formula; use numerical degree on the curve, then the two equal correspondence degrees.

**Checks.**

- `m=4` gives cyclic multiplier 6, full multiplier 7.
- For `m=1` the cycle and canonical degree are unchanged; `Γ₁` fine-level geometry is not inferred from this coarse projective statement.

*Needs:* [§2.6](#s2-6); [§3.7](#s3-7); [§5.7](#s5-7); [§9.9](#s9-9); `SchemeAndStackFoundations Layer 5`.

([Bakker–Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.5, pp.716–717; §6, p.736.)

### Examples

For `m=4` the HNF data are (1,4,b), `0≤b<4`; (2,2,b), `0≤b<2`; and (4,1,0): seven branches. The cyclic filter removes (2,2,0), leaving six. Thus `A_p²=A_(p²)+p⟨p⟩` while `C_p²=C_(p²)+(p+1)⟨p⟩` in the weight-two convention. For `N=12` the exact divisors are 1,3,4,12; neither 2 nor 6 defines an exact-divisor Atkin–Lehner involution. At `N=11,p=2` a degeneracy leg has degree 3; at `N=10,p=5` it has degree 5.

### Dependencies

Use Layer 2, Layers 3–5. External contracts: AlgebraicModuliForArithmeticGeometry, EtaleCohomologyFoundations, SchemeAndStackFoundations, TauCetiRoadmap ModularForms Layer 6 and Tau Ceti’s Fricke matrix. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 10: Compatibility of generic components and correspondences

<a id="s10-1"></a>

### 10.1 Generic components and cusp fields

After the algebraic construction, use Layers 6 and 8 to identify each generic-fibre component of `X_H` with the compactified analytic quotient for its determinant orbit. For honest full level n over `ℚ` the constant algebra is the cyclotomic determinant algebra; fixed pairing over `ℚ(ζ_n)` selects a component. A subgroup H descends these components by its determinant image. Identify the cusp residue fields and smoothing parameters from Layers 3–5’s cyclotomic charts with the rational boundary points and widths in the analytic quotient. On the scalar-framed prime-p quotient, determinant classes modulo squares give exactly two complex components. No analytic comparison is used to construct `X_H`.

Establish this as follows. Apply the earlier component and uniformization theorem to the independently constructed normal curves. Identify generic formal parameters and residue fields using the Tate charts, including conjugation in `d≤2` charts. Descend using the specified determinant action, rather than imposing geometric connectedness on full level.

**Checks.**

- Full level 5: four complex components before scalars, two after scalars, one after fixing an honest primitive pairing.

*Needs:* [§4.3](#s4-3); [§4.8](#s4-8); [§5.2](#s5-2); [§5.7](#s5-7); [§5.19](#s5-19); [§6.1](#s6-1); [§6.3](#s6-3); [§8.1](#s8-1); [§8.3](#s8-3); [§8.5](#s8-5).

([Bakker–Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §2.1, pp.713–714; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.3, Theorems 4.3.4 and 4.3.6–4.3.7, pp.38–42.)

<a id="s10-2"></a>

### 10.2 Classical and geometric Hecke actions

Over `ℂ` on a chosen honest component, identify the modular curves with the earlier compactified congruence quotients. Compare the characteristic-zero curve maps and their regular-differential action using §§7.2–7.4. The `H¹` Shimura comparison and its Hecke equivariance are constructed in §14.5. On holomorphic weight-k forms include the universal isogeny differential `ξ^k`; the unnormalized coherent trace is p times classical `T_p`. Full versus cyclic operators, transported diamonds, and the `Γ₁` cyclotomic Fricke map retain the Layer 9, Layer 10 conventions. The analytic map `w_N(z)=−1/(Nz)` is the component-fixed shadow of the chosen root, not proof of rational descent.

For full-level positive-frame coordinates, transport both Hecke legs and their fibre isogenies by §§4.5 and 6.1 before comparison with standard `Γ₁` or `Γ₀` coordinates. Pullback of dz carries the same fibre multiplier: `(bτ+d)⁻¹` for `F_γ` and `τ⁻¹` for S. This transports every weight-k differential factor, as well as the period map; an identity-coordinate forgetful map is not used.

Establish this as follows. Compare the maps on the elliptic analytic open with the fixed quotient lattice and point conventions. At cusps use the Tate quotient and differential, then use q-expansion determination from the earlier modular-form supplier. Apply the regular-differential pullback–trace calculation of §§7.2–7.4 and record upper/lower adjoint conventions separately.

**Checks.**

- The identity curve correspondence fixes every regular differential.
- At `p|N` the regular-differential operator is `U_p`, with no invertible diamond p.
- For `p∤N` weight two has `a_n(T_pf)=a_(np)+p a_(n/p)(⟨p⟩f)`; a pointwise average would give a different operator.

*Needs:* [§7.2](#s7-2); [§7.3](#s7-3); [§7.4](#s7-4); [§8.1](#s8-1); [§8.5](#s8-5); [§9.1](#s9-1); [§9.2](#s9-2); [§9.3](#s9-3); [§9.9](#s9-9); [§10.1](#s10-1); [ModularForms Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, Theorems 5.1–5.2, pp.65–67; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.5, pp.46–48.)

<a id="s10-3"></a>

### 10.3 Compactified map comparison

The compactified forgetful and quotient isogeny maps constructed algebraically agree under the generic-fibre comparison with their classical analytic degeneracy maps. On a `Γ₁(N;p)` chart, `π₁` forgets the p-subgroup and `π₂` quotients by it then contracts to the allowed level polygon. For `p∤N` choose `C=⟨1/p⟩` on `ℂ/(ℤ+ℤz)`, giving the quotient lattice coordinate pz and `(π₁,π₂)` coordinates (z,pz). Scaling the fibre by p sends `P=1/N` to `p/N`, so the `Γ₁` comparison retains the diamond `⟨p⟩` transport of the marked point. For `p|N` and `P=1/N` choose `C=⟨z/p⟩`, which is disjoint from `⟨P⟩`; use the `Γ₁(N)∩Γ₀(p)^t` presentation and `(π₁(z),π₂(z))=(z,z/p)`. At every cusp compare the induced homomorphism of completed rings and the pullback of `du/u`. A map to a coarse curve factors by categorical universality, but finite flat stack legs do not automatically become finite flat coarse legs; descent uses the actual stabilizer action or a schematic locus where it is trivial.

Establish this as follows. Identify both maps on the elliptic dense open through the moduli quotient. Use generalized Tate charts and contraction for the boundary maps, in the corresponding good- or bad-prime presentation. On the standard branches compare `q↦q^p` at `p∤N` and `q↦q^(1/p)` at `p|N` on the cover carrying the latter parameter; retain the induced differential multiplier and the effective cusp widths. Separate categorical existence of coarse maps from the finite-flat descent claim; use the finite-correspondence supplier and schematic locus when needed.

**Checks.**

- At `N=p=5`, `⟨1/5⟩=⟨P⟩` is forbidden by disjointness; `⟨z/5⟩` gives the allowed `z/5` branch.
- At `p∤N` the `⟨1/p⟩` branch multiplies `dτ` by p and transports `1/N` to `p/N`; the bad-prime `⟨τ/p⟩` branch multiplies `dτ` by `1/p` and retains `1/N` in characteristic zero.

- The two legs have different j coordinates. Extension is not obtained by pretending that `π₂` is a map over the same j-line.

*Needs:* [§9.1](#s9-1); [§10.1](#s10-1); `AlgebraicModuliForArithmeticGeometry §5.3/ArithmeticModuli.FiniteCorrespondence.coarse_finite`; `AlgebraicModuliForArithmeticGeometry §5.3/ArithmeticModuli.tame_finite_flat_descent`.

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3, pp.43–46; [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §§5.1–5.2, pp.65–66,71–72.)

<a id="s10-4"></a>

### 10.4 Hecke normalization and descent

On characteristic-zero fibres the geometric pull–trace correspondences agree with the earlier classical Hecke action, with the differential factor of the universal isogeny included. For weight k, the finite-flat coherent trace is `pT_p`, not `T_p`; integrality of its division by p is a separate local theorem. For Picard and étale cohomology the action is the integral push–pull of the correspondence without division by its degree. The full-subgroup `A_m` and cyclic `C_m` have their separate degrees and repeated-prime relations. These identifications descend to the field of definition with the diamond and cyclotomic Atkin–Lehner conventions fixed.

Establish this as follows. Compare the classical formula on the Tate cusp and use the imported analytic q-expansion determination. Use finite-flat trace, rather than a sum over distinct points, on ramified/inseparable charts. Descend the maps with their actual cyclotomic data and distinguish the two correspondence conventions.

**Checks.**

- For weight 2 at `p∤N`, the normalized coefficient formula is `a_n(T_pf)=a_(np)(f)+p a_(n/p)(⟨p⟩f)`; the unnormalized coherent trace has an extra factor p.

*Needs:* [§9.9](#s9-9); [§9.11](#s9-11); [§10.2](#s10-2); [§10.3](#s10-3).

([Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.5, Theorem 4.5.1 and Example 4.5.3, pp.46–48; [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.65–68; §5.2, pp.71–72.)

### Examples

At full level 5 there are four determinant components over `ℂ`. Scalar change of frame multiplies determinants by squares, giving two components; fixing a primitive pairing selects one honest component. A comparison that declares all three models connected fails this example. For a cusp with parameter `t=q^(1/d)`, check the actual homomorphism on t and the factor in `du/u`; equal generic degrees do not identify the two degeneracy legs.

For `m=4` the HNF data are (1,4,b), `0≤b<4`; (2,2,b), `0≤b<2`; and (4,1,0): seven branches. The cyclic filter removes (2,2,0), leaving six. Thus `A_p²=A_(p²)+p⟨p⟩` while `C_p²=C_(p²)+(p+1)⟨p⟩` in the weight-two convention. For `N=12` the exact divisors are 1,3,4,12; neither 2 nor 6 defines an exact-divisor Atkin–Lehner involution. At `N=11,p=2` a degeneracy leg has degree 3; at `N=10,p=5` it has degree 5.

### Dependencies

Use Layer 4, Layer 5, Layer 6, Layer 8, Layer 9. External contracts: AlgebraicModuliForArithmeticGeometry. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 11: Bad fibres and regular or semistable models

<a id="s11-1"></a>

### 11.1 Igusa components of modular fibres

Over a perfect field k of characteristic p, an Igusa pʳ structure on an ordinary elliptic curve E with prescribed prime-to-p level is a Drinfeld generator of `ker(Vʳ:E^(pʳ)→E)`. On the ordinary locus ker Vʳ is étale cyclic of rank pʳ, so its generator cover has degree `φ(pʳ)` before the effective residual automorphism quotient. Compactify by normalizing the corresponding level curve in this generator cover. Keep the auxiliary rigidifying level when discussing `±1` and other automorphisms; `Ig(p)/±1` and `Ig(p)/C₄` in Edixhoven/BDMTV denote effective quotient level problems, not two arbitrary additional quotients of an already coarse curve. `Γ₀` p-power mixed components, and the middle components after the `p²` extension, are identified with the relevant descended Igusa problems. Smoothness, ramification at supersingular points and small-p behavior are assertions proved by the local models, not part of a definition of an ordinary cover.

Establish this as follows. Define the ordinary generator cover using imported relative V and Drinfeld cyclicity. Normalize its compactification and descend along the actual auxiliary level and effective automorphism action. Use the `p²` local model below to compare the descended middle components.

The public interface should expose:

- `igusaCover`: The ordinary Verschiebung-generator cover with auxiliary prime-to-p level.
- `igusaCover_degree`: Its degree before stabilizer quotient is `φ(pʳ)`.
- `igusaCurve`: The normal compactification in the Igusa generic function field.
- `igusaCurve_effectiveQuotient`: The quotient preserves the specified moduli problem and its residual effective action.
- `igusaCurve_localModel`: The local generator ring identifies with the component chart from the universal cyclic deformation calculation.

**Checks.**

- For `p=5,r=1` a rigidified ordinary generator cover has degree 4, and the `M=1` sign-class cover has degree 2.
- `r=0` gives the trivial generator problem, not a `φ(1)=0` cover.
- The étale-generator description on ordinary curves is not an étale cover at a supersingular point.
- For `M=1` and `p>3`, the ordinary generator classes up to sign have generic degree `(p−1)/2`; an auxiliary rigidifier changes how this quotient is presented.

*Needs:* [§2.8](#s2-8); [§5.2](#s5-2); [ModularCurves Layer 7F](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#7f-serretate-theory-with-level-structure); [ModularCurves Layer 7E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#7e-p-divisible-groups).

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.1.3, pp.34–35; §2.1, pp.55–56; [Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.2, p.928; Theorems 6.5–6.6, pp.928–929.)

<a id="s11-2"></a>

### 11.2 `Γ₀` prime-power local models

**Cyclic-isogeny deformation and source/target coordinates.** For p prime, `n≥1`, k algebraically closed of characteristic p and a cyclic `pⁿ`-isogeny `E₀→E′₀` over k, with a prime-to-p auxiliary rigidifier killing automorphisms, construct `cyclicIsogenyDeformationRing`: the complete local `W(k)`-algebra representing deformations of the isogeny and its finite flat cyclic kernel. Give its maps from the one-parameter deformation rings of `E₀` and `E′₀` and the source/target parameters x,y. Prove the KM 13.4.7 comparison, including the ordinary mixed and supersingular special-fibre equations and the regular two-dimensional total ring; derive `f=f₀+p` u with u a unit in these coordinates. Do not infer this ring from a rigidity statement alone.

**Checks.**

- At `n=1` the supersingular special fibre is `(xᵖ−y)(x−yᵖ)=0`, with source and target parameters retained separately.
- At `n=2` the middle component has multiplicity `p−1`, so the three-component fibre is not reduced for `p>2`.
- Forgetting the rigidifier requires taking the actual stabilizer quotient; regularity of the deformation ring does not imply regularity of that coarse quotient.

*Needs:* MC7D–MC7F (formal elliptic deformations), MC7G (rigidity), MC8B–MC8C (cyclic generators), [§2.8](#s2-8) and [§11.1](#s11-1).

([Katz–Mazur, Arithmetic Moduli of Elliptic Curves](https://press.princeton.edu/books/paperback/9780691083520/arithmetic-moduli-of-elliptic-curves), Theorem 13.4.7; [Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §§1.1.3–1.1.5, pp.34–36, for the rigidified source/target comparison and the unit p-term.)

Let `p>3`, `n≥1` and `M≥1` with `p∤M`. The `Γ₀(pⁿM)` coarse special fibre has `n+1` components indexed (a,b), `a+b=n`, each abstractly `X₀(M)_𝔽p`, of multiplicity `φ(p^min(a,b))`. All meet at every supersingular `Γ₀(M)` point and nowhere else; this intersection is not claimed to be transverse for `n>1`. Under an étale auxiliary rigidifier the completed surface ring at a relevant noncuspidal point is `W[[x,y]]/(f₀+p u)`, u a unit, where `W=W(k̄)`. At a supersingular point `f₀=(x^(pⁿ)−y)(x−y^(pⁿ))∏_(a+b=n,a,b>0)(x^(p^(a−1))−y^(p^(b−1)))^(p−1)`; on the ordinary mixed (a,b) component `f₀=(x^(p^(a−1))−y^(p^(b−1)))^(p−1)`. These x,y are local moduli of source and target; the component-to-j maps may involve Frobenius. The all-N component/multiplicity statement extends to `p=2,3` as the Katz–Mazur/Edixhoven cyclic-deformation target, but its wild invariant-ring and resolution calculation is §11.4’s.

Establish this as follows. Use `cyclicIsogenyDeformationRing` and its source/target comparison; split by connected/étale type a,b. Use the source/target deformation coordinates to obtain the displayed `f₀` and unit p-term. Descend the auxiliary rigidifier with its stabilizer action. Read multiplicities from `f₀`, retaining possible inseparable component maps. At 2 or 3 keep the component target but do not apply the tame quotient criterion; the wild calculation is §11.4’s.

**Checks.**

- `n=1` gives two reduced components, local `f₀=(xᵖ−y)(x−yᵖ)`.
- `n=2` has multiplicities `1,p−1,1`; for `p=5` these are 1,4,1, so the coarse fibre is not reduced.
- At `p=2,3` the rigidified deformation comparison retains its component data, while the wild invariant-ring calculation uses §11.4.

*Needs:* `cyclicIsogenyDeformationRing`; [§2.8](#s2-8); [§5.2](#s5-2); [§11.1](#s11-1).

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.1.3–1.1.5, pp.34–36; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III §1, pp.254–255.)

<a id="s11-3"></a>

### 11.3 The corrected coarse singular locus

For `p>3`, `p∤M` and `n≥1`, a noncuspidal point of the integral `Γ₀(pⁿM)` coarse surface is singular exactly when its elliptic pair has automorphisms beyond `±1` and it is either supersingular or lies on a mixed (a,b) component with `a,b>0`. Cusps are regular. The extra automorphism condition concerns the pair `(E,C_M)`, not just the value `j=0` or 1728. Ordinary points with `a=0` or `b=0` are smooth over `ℤ_p`. This corrects the supersingular-only exception in Gross–Zagier III Proposition (1.4); no identical criterion is claimed at `p=2` or 3.

Establish this as follows. Outside this locus an auxiliary quotient is étale or acts by pseudo-reflections on the regular deformation ring. At the stated isolated extra-automorphism points compute the effective order-2 or order-3 action on the two local moduli; it is not generated by pseudo-reflections. Apply the tame invariant-ring criterion of §0.2 and the independent cusp regularity theorem.

**Checks.**

- At `p=5,M=1,n=2` the ordinary `j=1728` point on `(1,1)` is singular although it is not supersingular.

*Needs:* [§0.2](#s0-2); [§5.4](#s5-4); [§11.2](#s11-2).

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.1.3–1.1.5 and Theorem 1.1.4.1, pp.34–36; §§1.3.2–1.3.6, pp.39–46; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter III Proposition (1.4), p.255.)

<a id="s11-4"></a>

### 11.4 Regular resolutions of modular fibres

At level-dividing `p=2` or 3, the additional local task is to compute the actual stabilizer group-scheme action on the cyclic deformation ring, its normal invariant completion, multiplicities and minimal resolution, and the resulting branch and thickness maps. Infinitesimal inertia on the naive polygon problem must first be replaced by the refined `Γ₀` presentation or retained in a genuine groupoid. Tame order-2/3 eigencharacters do not give these wild rings. The `p>3` resolution description below has exactly its displayed range; the all-prime cusp calculation in §§5.4–5.5 remains available separately.

For `p>3` and `p∤M` construct the minimal regular resolution of the `Γ₀(pⁿM)` coarse surface at p from the preceding local rings. The resolution is the relatively minimal regular model of the tame stabilizer quotient; its equivariant blowup presentation has pseudo-reflection cotangent actions at fixed points, and the quotient contains no exceptional `−1` curve over the original surface. For `j=1728` the order-2 action on source/target parameters is `(x,y)↦(−x,−y)`; one blowup yields a regular quotient with one exceptional rational curve of self-intersection `−2`. For `j=0` supersingular and n even, the effective order-3 action has equal eigencharacters and one blowup gives one exceptional `−3` curve. For `j=0` supersingular and n odd, the eigencharacters are inverse; the minimal regular quotient has two exceptional `−2` curves, obtained from an equivariant presentation with two fixed-point exceptional divisors and one contractible `−1` divisor. Ordinary mixed points use the corresponding `a>b,a=b,a<b` variants. Export every component’s multiplicity and intersections by total-transform valuations and `F·C=0`, not just the reduced incidence graph. General blowups, intersection theory and minimal-model contractions are StableReduction’s.

The local blowup charts have `y=xv` or `x=yu` in the regular rigidified equation `f₀+p` u. Their total-transform valuations determine component multiplicities; the relations `F·C=0` determine the intersection matrix. At each residual fixed point the invariant chart is regular precisely under the pseudo-reflection criterion. The order-3 inverse-character presentation has the contractible `−1` curve specified above. These local models agree with the regular cusp and ordinary outer charts, and hence define the global regular model. The target is this model, its minimality and its divisor data.

The public interface should expose:

- `modularRegularResolution`: The proper birational regular model with its identified generic fibre.
- `modularRegularResolution_exceptional`: Its exceptional divisors have recorded genus, multiplicity, self-intersection and attachment maps.
- `modularRegularResolution_fibre`: The total special fibre equals the pullback of the coarse fibre with computed valuations.
- `modularRegularResolution_minimal`: No exceptional `−1` curve over the resolved surface remains.
- `modularRegularResolution_baseChange`: Flat unramified base change transports charts and the resolution; a ramified change requires normalization and a fresh regularity check.

**Checks.**

- A regular point with trivial effective stabilizer is unchanged.
- The effective `−1` action on both parameters contributes one `−2` exceptional component.
- For `n=2,p=5` the regular model still has a component of multiplicity 4; regularity does not imply reduced semistability.
- The resolution of the `p=5` ordinary mixed `j=1728` point contains `a −2` rational exceptional curve; ignoring ordinary singularities misses it.

*Needs:* [§0.2](#s0-2); [§11.2](#s11-2); [§11.3](#s11-3); [StableReduction Layer 4](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces).

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §§1.3.1–1.3.6 and §1.4, pp.38–48.)

<a id="s11-5"></a>

### 11.5 One-factor mixed-level models

For `p∤M` and `M≥5`, the compactified `Γ₁(M)∩Γ₀(p)` model over `ℤ[1/M]` has geometric fibre at p consisting of two copies of `X₁(M)_𝔽p` meeting at the supersingular `Γ₁(M)` points. On the fine rigidified locus the complete node equation is `uv=p` up to a unit, hence this is a regular semistable model. The components classify the Frobenius and Verschiebung choices and their maps to `X₁(M)` include the corresponding Frobenius/diamond transports. For `Γ₀(Mp)` remove the auxiliary rigidifier and use the tame or wild stabilizer quotient, resolving before using a semistable graph; a coarse extra-automorphism intersection can have higher thickness. For `M<5` retain the stack/rigidified statement and descend with the explicit stabilizer analysis, rather than asserting a fine scheme. The level-lowering cases include `p=2,3` with `p∤M`, and allow arbitrary powers of the coefficient prime in M.

Establish this as follows. Use the cyclic p-subgroup deformation on the fine prime-to-p curve to split the special fibre into Frobenius and Verschiebung components. At a supersingular point the two local branches give the smoothing `uv=p`; retain the lower-level marking in the component maps. Apply the coarse quotient/resolution separately when an effective stabilizer survives; small-level and wild descent belong to the wild calculation of §11.4.

**Checks.**

- At `p=2` with `M=5` the fine `Γ₁(M)` marking removes elliptic automorphisms; this is not the same claim as tame coarse `Γ₀(10)` descent.

*Needs:* [§5.2](#s5-2); [§9.1](#s9-1); [§11.2](#s11-2); [ModularCurves Layer 8C](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves#8c-the-axiomatic-isomorphism-theorem-and-the-rings-of-63).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp.44–46, Figure 3 and sequence (3.1); [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3, pp.43–46.)

<a id="s11-6"></a>

### 11.6 Prime-square semistable modular models

For `p>3`, `p∤M` and an étale auxiliary rigidifying prime-to-p level, over `W(k̄)[ϖ]` with `ϖ^((p²−1)/2)=p` construct the proper normal nodal model of `X₀(p²M)` supplied by Edixhoven §2.1. It has two outer vertical lower-level components and two middle descended Igusa p-components, and a horizontal component over each supersingular lower-level point. With effective automorphism order 1,2,3 the horizontal smooth completion has equation `y^((p+1)/e)=x(x−1)^(p−1)`, with e respectively 1,2,3; these are equations for the normal smooth projective completions, not claims that the affine plane equation is nonsingular. Attachments are at the designated points over `0,1,∞`. The quotient by auxiliary level and its effective stabilizers gives the stated coarse modular model. Stabilization or minimal regular resolution uses StableReduction under its genus hypotheses; this nodal model need not itself be stable.

Establish this as follows. Base change and normalize the rigidified cyclic `p²` model over the displayed extension. Compute the supersingular charts as in §2.2; normalize their plane equations and compare the overlap maps. Glue to the ordinary Igusa charts and take the specified effective stabilizer quotient; use §2.4 for nodalness. Use the existing stabilization theorem only where its genus/marking conditions apply.

The public interface should expose:

- `primeSquareModel`: The nodal model with its generic-fibre identification over `W[ϖ]`.
- `primeSquareModel_vertical`: Two outer and two middle components, four vertical components in total, on the auxiliary rigidified presentation.
- `primeSquareModel_horizontal`: The normalized horizontal curve and its attachment points for each effective automorphism type.
- `primeSquareModel_quotient`: Auxiliary-level descent retains the effective stabilizer quotient and nodal charts.
- `primeSquareModel_stabilize`: Its stable contraction agrees with the imported stabilization, when the genus/marking hypotheses hold.

**Checks.**

- `p=13` gives `ϖ⁸⁴=13`.
- At a supersingular `j=0` with effective order 3, the horizontal exponent is `(p+1)/3`, not `p+1`.
- The generic fibre remains `X₀(p²M)`, with the original two j-invariant maps.
- The auxiliary presentation has two outer and two middle vertical components, total four. A six-component vertical list is rejected.
- A rational component with fewer than three special points can be present in this semistable model; it is contracted in the stable model when stabilization applies.

*Needs:* [§11.1](#s11-1); [§11.4](#s11-4); [StableReduction Layer 7](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-7-semistable-reduction); [StableReduction Layer 8](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction).

([Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §2.1, pp.55–56; §§2.2–2.4, pp.56–65.)

<a id="s11-7"></a>

### 11.7 Split Cartan semistable fibres

Let `ℓ=12k+1` be prime and `W=W(𝔽̄_ℓ)`. Over `W[ϖ]`, `ϖ^(12k(6k+1))=ℓ`, `X₀(ℓ²)` has k horizontal curves `u²=v^(ℓ+1)+1`, and four vertical curves, two rational and two `Ig(ℓ)/±1`. Each horizontal meets each vertical once, with no other intersections. Fricke fixes each horizontal via `(u,v)↦(u,−v)`, exchanges the rational verticals and preserves the two Igusa verticals. Its tame quotient is a proper nodal model of `X_s⁺(ℓ)`: k horizontals `u²=v^(6k+1)+1` of genus 3k, one rational vertical and two `Ig(ℓ)/C₄` verticals of genus `(k−1)(3k−2)/2`. Its dual graph is `K_(k,3)`; hence `b₁=2k−2` and `g=6k²−3k`. The chosen equation `ϖ^((ℓ²−1)/2)=ℓ` implies `ϖ^(ℓ²−1)=ℓ²`. The squared equation alone also allows `ϖ^((ℓ²−1)/2)=−ℓ`; recover the chosen extension only with the specified root choice, not by treating the two polynomial equations as equivalent.

Establish this as follows. Specialize the prime-square model to `ℓ≡1` mod 12, where no supersingular `j=0,1728` correction occurs. Use Fricke action from the source, and tame invariant base change to identify the quotient special fibre. The horizontal quotient replaces `v²` by its coordinate; the Igusa quotient is the effective `C₄` level quotient. Compute genera by the double-cover branch count and the imported nodal genus formula.

The ramification exponent is the natural-number expression `(ℓ²−1)/2`, equal to `12k(6k+1)` for `ℓ=12k+1`. For `k≥1` and prime `ℓ=12k+1`, the component-and-graph genus sum `k·3k+2·((k−1)(3k−2)/2)+b₁(K_(k,3))` equals `6k²−3k`.

**Checks.**

- At `ℓ=13,k=1` the ramification exponent is 84 and the fibre genus is 3.
- At `ℓ=37,k=3` the exponent is 684 and the fibre genus is 45, including four graph cycles.
- At `ℓ=61,k=5` the exponent is 1860 and the genus is 135, including eight graph cycles. A component-only genus sum gives 127 and fails.
- At `k=0` no prime of the prescribed form occurs, so the totalized arithmetic expression has no semistable-model interpretation.
- `k=1` gives one genus-3 horizontal and three rational vertical leaves; `k=3 (ℓ=37)` gives total genus 45.

*Needs:* [§9.5](#s9-5); [§11.6](#s11-6); [StableReduction Layer 1](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs).

([Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.2, Theorems 6.5–6.6 and their proof, pp.928–929.)

<a id="s11-8"></a>

### 11.8 Good reduction of the level-13 curve

The split Cartan normalizer curve `X_s⁺(13)` has good reduction at every prime other than 13 and acquires good reduction over `Frac(W(𝔽̄₁₃)[ϖ])`, `ϖ⁸⁴=13`. At 13 the `k=1` semistable model above has a genus-3 horizontal `u²=v⁷+1` with three rational leaves; contracting those leaves gives a smooth proper model. Away from 13 use the first Baran plane quartic on BDMTV p.930: `(−Y−Z)X³+(2Y²+YZ)X²+(−Y³+Y²Z−2YZ²+Z³)X+2Y²Z²−3YZ³=0`. It is smooth over `ℤ[1/13]`, including at 2. The second quartic obtained by the determinant-2 substitution in the source is only smooth away from 2 and 13 and cannot prove the claim at 2.

Establish this as follows. For `ℓ=13` specialize the stated quotient graph; contract the three genus-zero leaves using the existing surface contraction theorem. Verify smoothness of the resulting genus-3 fibre and generic-fibre identification. For primes other than 13 apply the Jacobian criterion to the first homogeneous quartic, with all projective charts, including characteristic 2. Check the first quartic at 2 directly. On `Z=1` the three derivative equations force `t=Y+1≠0`, `X=t³+1`, `g=t⁷+t³+1=0` and `F=t¹⁰+1`. The Bézout identity `(t⁹+t⁸+t⁷+t³+t²+t+1)g+(t⁶+t⁵+t⁴+t²+t)(t¹⁰+1)=1` rules out a singular point over the algebraic closure. On `Z=0` the derivatives force `X=Y≠0` but `F_Z=X³≠0`.

**Checks.**

- The Jacobian has toric rank zero after the extension because the graph is a tree; a tree alone would not prove smoothness without contracting the leaves.
- The determinant-2 change of plane coordinates is not an integral isomorphism at 2.

*Needs:* [§11.7](#s11-7); [StableReduction Layer 4](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces).

([Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Corollary 6.7, p.929 and first Baran model in §6.3, p.930.)

### Examples

For `p=5` and `N=25`, the ordinary mixed `(1,1)` point with `j=1728` has the effective action `(x,y)↦(−x,−y)`. Its invariant ring is singular, even though the point is not supersingular. This detects the omitted ordinary locus. At `ℓ=13` the stated extension has ramification `(13²−1)/2=84`; the split-Cartan graph is `K_(1,3)`, with `b₁=0`. The genus-3 central component meets three rational leaves, which are contracted to obtain good reduction. For the first Baran quartic F at 2, work on `Z=1`. The equation `F+X∂_XF=Y(X+1)²` shows that a singular point has `Y=0` or `X=1`. If `Y=0`, `∂_XF=X²+1` forces `X=1` and `∂_YF=1` contradicts singularity. If `X=1`, `∂_YF=Y²+1` forces `Y=1` and `∂_XF=1` gives the same contradiction. On `Z=0`, the X and Y partials force `X=Y≠0`, while `∂_ZF=X³≠0`. This proves geometric smoothness at 2, rather than just absence of `F₂`-rational singular points. The second model’s coordinate change has determinant 2 and cannot prove this claim.

### Dependencies

Use Layer 0, Layer 2, Layer 5, Layer 9. External contracts: TauCetiRoadmap StableReduction and ModularCurves. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 12: Modular degeneration data

<a id="s12-1"></a>

### 12.1 Modular dual graphs and thicknesses

Attach to each specified semistable modular model its imported labelled dual multigraph, retaining the normalized component, each pair of branches, node thickness, residue-field action, marked cusp section and its Layers 3–5 parameter. For a fine one-factor `Γ₁(M)∩Γ₀(p)` model the graph has two vertices and one edge per supersingular marked elliptic curve, so for s geometric nodes `b₁=s−1`. For the normalizer model `X_s⁺(ℓ)`, `ℓ=12k+1` prime, the graph is `K_(k,3)`, with the component genera of §11.7; the ordered `X_s(ℓ)≃X₀(ℓ²)` model has `K_(k,4)`. A nonreduced coarse `pⁿ` fibre is instead exported as a weighted intersection configuration until a stated reduced nodal model is chosen; it is not a semistable dual graph. An n-gon has n edges, also for `n=1` (a loop) and `n=2` (two parallel edges).

For `X₀(p)` at a prime `p≥5`, construct `gammaZeroPrimeGraph` in NeronModelsAndSemistableAbelianVarieties §§4.2–4.7's carrier: two rational components, one edge for each geometric supersingular j-invariant, and thickness `h_E=|Aut(E)/{±1}|`. It is 1 away from j=0,1728, 2 at supersingular j=1728, and 3 at supersingular j=0. The two exceptional edges occur exactly when `p≡3 mod 4` and `p≡2 mod 3`, respectively. Resolution subdivides these edges into 2 or 3 unit edges. Prove `gammaZeroPrime_mass`: `Σ_E 1/h_E=(p−1)/12`, retaining the automorphism weights. This graph feeds the integral component computation of §17.5; the fine mixed-level graph has different marked edges and must not replace it.

Establish this as follows. Choose the exact proper model and base from Layer 11 and use the imported graph construction. Read branch incidences and thickness from its completed local charts; mark cusp sections via the cyclotomic chart maps. Compute the graph ranks without removing loops or parallel edges; export weighted coarse configurations separately.

The public interface should expose:

- `modularGraph`: The imported graph attached to the supplied modular model and base.
- `modularGraph_components`: The normalized component curves, genera and residue action.
- `modularGraph_nodes`: The two branch flags at each node and its positive thickness.
- `modularGraph_cusps`: The cusp sections with component labels and formal parameter maps.
- `modularGraph_modelComparison`: A regular semistable resolution subdivides an edge according to its thickness without changing the generic curve.

**Checks.**

- A 2-gon has two parallel edges and `b₁=1`, not a single edge and `b₁=0`.
- For `X_s⁺(13)` the graph is a three-leaf tree and `Σ g_v=3`. The ordered `X_s(13)` has `(j-degree, genus)=(182,8)`, against `(91,3)` for `X_s⁺(13)`; its four-leaf model cannot replace the quotient model.
- The multiplicity-4 middle component of `X₀(25)` cannot be silently entered as a reduced nodal component.
- Resolving a thickness-n edge by a chain increases both edge and vertex counts by `n−1`, so `H₁` rank is unchanged.
- At `ℓ=13` the quotient graph is `K_(1,3)`, `b₁=0`; at `ℓ=37` it is `K_(3,3)`, `b₁=4`.
- For `X₀(11)` at 11 there are two supersingular edges of thicknesses 2 and 3: their mass is `1/2+1/3=5/6` and the cycle pairing is `[5]`.
- For `X₀(13)` at 13 there is one thickness-one edge, mass 1 and no cycle. At p=2,3 the tame automorphism table above does not apply.

*Needs:* [§5.5](#s5-5); [§11.4](#s11-4); [§11.5](#s11-5); [§11.7](#s11-7); `NeronModelsAndSemistableAbelianVarieties` §§4.2–4.7 (`DualGraph.cycleLattice`, `DualGraph.edgeForm` and component cokernel); [StableReduction Layer 1](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, Figure 3 and sequence (3.1), pp.45–46; [Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem 6.6 and Figure 1, pp.928–929; [Edixhoven](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf), §1.4, pp.47–48; §2.1, pp.55–56.)

For the prime-level coarse graph and mass formula, use [Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), V equation (4.9.1), p.282, and VI §6.16, p.290.

<a id="s12-2"></a>

### 12.2 Character groups of modular bad fibres

For a proper regular semistable model `C/R` specified above, apply R11.4 to its nodal special fibre Y. The identity fibre of the Néron model of `Jac(C_K)` has torus T with character lattice `H₁(Γ,ℤ)`, and abelian quotient `∏_v Jac(Ỹ_v)`. The monodromy pairing is the thickness-weighted edge pairing on the cycle lattice. Reorienting an edge changes its coordinate sign, not the intrinsic lattice or pairing. For the fine two-component one-factor model, `H₁` is the degree-zero subgroup of the free lattice on its s supersingular marked points. The coarse `Γ₀` model requires the resolved thicknesses/automorphism weights; it is not obtained by ignoring the stabilizers.

Establish this as follows. Use the imported normalized Picard/Néron comparison for the exact semistable model. Identify the cycle lattice with the kernel of its signed incidence map, and apply the imported weighted edge pairing. In the two-vertex graph the incidence map is the degree sum on supersingular edges, giving the augmentation kernel. The common modular character/monodromy API is this specialization of R11.4; §17.4 uses it for its marked two-component fibre and adds only the supersingular coordinates and operator dictionary.

**Checks.**

- For `X_s⁺(13)` after `ϖ⁸⁴=13` the torus vanishes and the abelian quotient is the genus-3 horizontal Jacobian.
- For `K_(3,3)` the character lattice has rank 4, not rank equal to its 9 nodes.
- The ordered `X_s(13)` has genus 8 and a different horizontal/Igusa abelian quotient; the genus-3 Jacobian here belongs to `X_s⁺(13)`.

*Needs:* [§12.1](#s12-1); `NeronModelsAndSemistableAbelianVarieties §4.2`; `NeronModelsAndSemistableAbelianVarieties §4.1`; `NeronModelsAndSemistableAbelianVarieties §R11.4`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, sequence (3.1) and character description, pp.45–46; §3.10.2, pp.47–48; [Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorem 6.6, p.929.)

<a id="s12-3"></a>

### 12.3 Nearby cycles of modular nodal models

For a specified proper nodal semistable modular model over a henselian trait, `ℓ` distinct from the residue characteristic, import the LefschetzPencilsAndVanishingCycles §§7a.1–7a.2 normalization and specialization sequences. With `Γ` its geometric graph and Ỹ its normalization, they give `0→H¹(Γ,ℚ_ℓ)→H¹(Y,ℚ_ℓ)→H¹(Ỹ,ℚ_ℓ)→0` and `0→H¹(Y,ℚ_ℓ)→H¹(C_K̄,ℚ_ℓ)→H₁(Γ,ℚ_ℓ)(−1)→0`. Retain residue Galois action and the distinction `H¹` versus `H₁`. The monodromy graded pieces are graph cohomology, component `H¹`, and twisted graph homology; no canonical splitting is asserted. Finite trait extension of ramification e multiplies the twisted monodromy by e and an old edge of thickness n becomes e n unit edges in a regular resolution. This applies LefschetzPencilsAndVanishingCycles §§7a.1–7a.5 to the supplied modular nodal model.

Establish this as follows. Verify the exact model’s properness, smooth generic fibre and reduced nodal special fibre before using LPV. Apply the LefschetzPencilsAndVanishingCycles §§7a.1–7a.2 normalization and specialization statements with their branch coordinates and Galois actions. Use the LPV choice/base-change comparison for subdivision and ramification; do not apply this theorem to an unreduced coarse fibre.

**Checks.**

- For the level-13 good model `Γ` is a tree, so graph terms vanish and generic `H¹` is the horizontal `H¹`.
- A thickness-2 node after ramification 3 gives six unit edges; replacing it by only three would give the wrong pairing.

*Needs:* [§12.1](#s12-1); `LefschetzPencilsAndVanishingCycles §7a.1`; `LefschetzPencilsAndVanishingCycles §7a.2`; `LefschetzPencilsAndVanishingCycles §7a.3`; `LefschetzPencilsAndVanishingCycles §7a.5`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp.45–46; [Balakrishnan–Dogra–Müller–Tuitman–Vonk](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Theorems 6.5–6.6, pp.928–929.)

<a id="s12-4"></a>

### 12.4 Degeneracy maps on modular components

For the one-factor fine `Γ₁(M)∩Γ₀(p)` special fibre, identify the two components by the Frobenius and Verschiebung subgroups, retaining transported level points. With lower-level point `x=(E,P)`, the Frobenius component has `(π₁,π₂)=(id,F)`, where F sends `(E,P)` to `(E^(p),P^(p))`; on the Verschiebung component `π₂` is the identity and `π₁` is F followed by the inverse diamond transport needed to send the quotient marked point back to P. Thus the ordinary quotient sum is `(E^(p),P^(p))+p(E^(p⁻¹),pP^(p⁻¹))`, with the p multiplicity coming from the inseparable leg. Prime-to-level Hecke correspondences act on supersingular marked edges by quotient isogenies and their actual multiplicities; reversing the legs gives the polarization-dual action on the cycle lattice. After a coarse quotient or resolution use the induced branch and thickness maps, rather than transporting a map of sets alone.

Establish this as follows. Label the connected subgroup by ker F and the étale subgroup by ker V, with the correct marked-point quotient. Read the component maps and inseparable degree from the universal isogeny; the ordinary divisor formula fixes the inverse diamond transport. Extend from the ordinary dense locus through the integral component maps and nodal branch data; apply the imported Picard/graph functoriality. The oldspace and transposed character-group matrices belong to SerreWeightAndLevelOptimisation; their exact-sequence theory is not reconstructed here.

**Checks.**

- For `Γ₀` level the diamond is trivial and the special correspondence is Frobenius plus transpose Frobenius, with scheme multiplicities.
- Do not give the same matrix `[[T_q,q],[−1,0]]` to Jacobians and character groups: the latter uses `[[T_q,−1],[q,0]]` in SerreWeightAndLevelOptimisation’s conventions.

*Needs:* [§9.1](#s9-1); [§9.2](#s9-2); [§9.9](#s9-9); [§12.1](#s12-1); [§12.2](#s12-2).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.3, pp.77–79; §3.9, pp.45–46.)

### Examples

A connected two-vertex graph with s parallel edges has `H₁` of rank `s−1`. For `s=1` the torus rank is zero, while `s=2` gives rank one. A loop contributes one generator; replacing the multigraph by a simple graph loses it. Multiplying all node thicknesses by a ramification index e multiplies the monodromy pairing by e and can change the integral component-group cokernel even when rational ranks agree.

### Dependencies

Use Layer 5, Layer 9, Layer 11. External contracts: LefschetzPencilsAndVanishingCycles, NeronModelsAndSemistableAbelianVarieties. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 13: Jacobian functoriality and the integral Hecke action

<a id="s13-1"></a>

### 13.1 Modular Jacobians and norms

For positive genus, use the relative Jacobian, its dimension and canonical principal polarization supplied by JacobianChallengePartII §§1.2–1.4, together with its arbitrary-base-change comparisons. The names `modularJacobian`, `modularJacobian_dimension`, `modularJacobian_polarization`, `modularJacobian_thetaSpecialization` and `modularJacobian_baseChange` identify these supplied objects and maps on the modular smooth bases. The genus-zero branch, the modular interpretation, the restriction of SchemeAndStackFoundations §3.5's line-bundle norm to relative `Pic⁰`, and the norm/pullback transpose and divisor-class comparisons belong here. JacobianChallenge Layers D–E supply the field comparisons; AbelianSchemesAndArithmeticModuli A2.2 supplies dual abelian schemes.

For `N≥5` put `S=Spec ℤ[1/N]` and let `C=X₁(N)/S`, the smooth proper geometrically connected coarse curve. Set `J₁(N)=Pic⁰_(C/S)` using the supplied abelian scheme of relative dimension `g(C)` and its canonical principal polarization when `g(C)>0`; when `g(C)=0`, use the trivial abelian scheme with its unique principal polarization. For `X₀(N)` or another smooth proper geometrically connected coarse quotient use the same assignment on its legal smooth base; disconnected honest full level requires componentwise Picard and field descent. For a finite flat map `f:D→C` of such curves, define Picard pullback `f^*:J_C→J_D` and restrict the supplied line-bundle norm to `f_*:J_D→J_C`, with `f_*f^*=[deg f]`; the polarization dual of `f^*` is `f_*`. Norm counts the ramification/inseparable lengths, not just distinct geometric images. Under the polarization this agrees with the Albanese functor. A bad-level singular coarse fibre is not an abelian scheme: use its smooth generic Jacobian and the lower Néron model.

Establish the comparisons as follows. For a smooth proper geometrically connected curve over locally Noetherian S, take étale local sections and Noetherian affine charts. A section is a relative effective Cartier divisor of fibre degree one, so its line bundle is relatively ample by StableReduction Layer 2; the resulting projective charts satisfy JacobianChallengePartII's hypotheses. Its canonical Picard and polarization comparisons identify the supplied objects on overlaps, with all their base-change maps. This retains the smooth proper range without choosing a global section or projective embedding. In genus zero the relative neutral Picard sheaf is trivial and every comparison is the unique map between trivial abelian schemes. Restrict the supplied line-bundle norm using its degree, divisor and base-change laws. Compare norm and pullback through the relative Picard and Poincaré descriptions to prove their polarization transpose identity; over the normal arithmetic base it also agrees with the field identity by Hom injectivity. In the divisor-class realization use §13.2's norm and conorm to identify both modular Hecke leg orders. At a rational cusp c the pointed map is `x↦[x−c]`; changing c translates that map and preserves the supplied polarization.

**Relative theta and specialization.** For each smooth proper geometrically connected curve `C→S` of this subsection, with S locally Noetherian and genus g locally constant, `modularJacobian_thetaSpecialization` is the comparison with JacobianChallengePartII §§1.2–1.4's canonical principal polarization when `g>0`, and with the unique polarization of `J=0` when `g=0`. Under `J_T≅Pic⁰_(C_T/T)`, the supplied polarization satisfies `λ_(C_T)=(λ_C)_T` for every `T→S`, including nonreduced and non-Noetherian T. Its geometric fibres are JacobianChallenge Layer E's canonical field polarizations. On the modular models this identifies specialization over a good-reduction trait as well as field extension; no field map from the fraction field to the residue field is assumed.

(JacobianChallengePartII §§1.2–1.4, `RelativeJacobian.RelativeJacobian`, `RelativeJacobian.jacobianBaseChange` and `RelativeJacobian.PrincipalPolarization`; [Kleiman, The Picard scheme](https://arxiv.org/pdf/math/0504020v1), Remark 5.26, p.51, for relative curve autoduality; [Milne, Jacobian varieties](https://www.jmilne.org/math/xnotes/JVs.pdf), §6, Theorem 6.6, Lemma 6.9 and Summary 6.11, pp.21–24, for the field theta convention.)

**Checks.**

- For `C=X₁(N)` and `p∤N`, restriction to `Spec ℤ_(p)` gives the canonical polarization of `Jac(C_𝔽̄_p)` on the closed fibre. There is no unital map `ℚ→𝔽̄_p`: p is invertible in ℚ and zero in the target. This is specialization over the trait, not field extension.
- For a genus-one curve with a section, a field theta divisor is a translated origin. Its homomorphism is the degree-one polarization, independently of that translation.
- For `C=ℙ¹_S`, the genus-zero branch gives the unique isomorphism `0→0^∨`; no degree-`−1` theta divisor is required. In particular `X₁(5)` uses this branch.
- Changing a local degree-one bundle by an infinitesimal degree-zero class preserves the supplied polarization as a morphism over `Spec k[ε]/(ε²)`, not just on its reduced fibre.
- A genus-one torsor with no rational point still has the supplied principally polarized Jacobian; its modular comparison cannot require a global theta divisor or a cusp over the base.

The public interface should expose:

- `modularJacobian`: The modular instance of JacobianChallengePartII §1.2's relative neutral Picard abelian scheme in positive genus, and the trivial abelian scheme in genus zero.
- `modularJacobian_dimension`: The supplied dimension is the fibre genus in positive genus; the trivial branch has dimension zero.
- `modularJacobian_polarization`: JacobianChallengePartII §1.4's principal polarization `λ_C` in positive genus and the unique principal polarization in genus zero, with the fibre comparison `modularJacobian_thetaSpecialization`.
- `jacobianPull`: Contravariant pullback of degree-zero line bundles.
- `jacobianNorm`: The restriction of SchemeAndStackFoundations §3.5’s line-bundle norm to the relative neutral Picard scheme.
- `jacobianNorm_pull`: `f_*f^*=[deg f]`.
- `jacobianNorm_dual`: `f_*` is the polarization transpose of `f^*`.
- `modularJacobian_baseChange`: The modular instance of JacobianChallengePartII §§1.3–1.4's comparisons for every `T→S`: relative `Pic⁰` is `J_T` and its canonical polarization is `(λ_C)_T`; on genus-zero components use the unique comparisons of trivial abelian schemes.
- `modularJacobian_divisorClass`: For any smooth proper geometrically integral K-curve C and algebraic closure K̄, identify `Jac(C)(K̄)` additively with `Cl⁰(K̄(C)/K̄)`, naturally for field extension and semilinear `Gal(K̄/K)` action. For the modular curves of §8.2 this identifies geometric Jacobian points with the q-expansion field's degree-zero classes. Pullback and norm correspond to conorm and divisor norm of §13.2, hence the equivalence intertwines both Hecke leg orders; it restricts to the n-torsion representations. Over K itself, divisor classes represent all Jacobian points when C has a K-point, as `X₀(N)` does via ∞; a general curve requires the Picard descent obstruction.

**Checks.**

- `J₀(1)=0`; its endomorphism ring and all Hecke operators are zero.
- `N=11,p=2`: `π₁*π₁^*=[3]`.
- A totally ramified degree-2 map contributes multiplicity 2 to the norm identity.
- Norm of `g∘f` is `g_*f_*`, while pullback reverses order.
- For genus zero `J=0`, so multiplication by any degree is the unique zero endomorphism.
- For a degree-2 map, norm after pullback is [2], not an identity retraction.
- On `X₀(11)`, `[P−∞]` identifies the genus-one curve with its Jacobian and commutes with coefficient conjugation; on `ℙ¹` both degree-zero class group and Jacobian vanish.

*Needs:* `JacobianChallengePartII` §§1.2–1.4 (`RelativeJacobian.RelativeJacobian`, `RelativeJacobian.jacobianBaseChange`, `RelativeJacobian.PrincipalPolarization`); `SchemeAndStackFoundations §3.5/lineBundleNorm`; [§5.2](#s5-2); [§5.3](#s5-3); [JacobianChallenge Layer D](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme); [JacobianChallenge Layer E](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties); `AlgebraicModuliForArithmeticGeometry §7.6.1a/sectionPicardSplit`; [StableReduction Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity) (relative ampleness and polarized étale descent); `AbelianSchemesAndArithmeticModuli` A2.2–A2.5 (dual schemes and polarizations), A6.25 (`relativeHom`); `NeronModelsAndSemistableAbelianVarieties §R11.1`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, Lemma 5.4 and Definitions 5.5–5.6, pp.67–68; §5.2, pp.70–72.)

For the divisor-class identification, use [Milne, Jacobian varieties](https://www.jmilne.org/math/xnotes/JVs.pdf), §1, Theorem 1.1 and the description of the canonical divisor-class map in §2, pp.2–6; the modular Hecke compatibility uses the norm and conorm comparison of §13.2.

<a id="s13-2"></a>

### 13.2 Upper and lower Jacobian Hecke operators

**Function-field divisor norm and correspondences.** For a finite extension `F′/F` of one-variable function fields with finite constant extension `k′/k`, use Tau Ceti's `Divisor k F`, normalized places and `Divisor.conorm`. Construct the additive divisor norm `Norm:Divisor k′ F′→Divisor k F`, taking a place P′ to `f(P′|P)·P`, with P its restriction and f the residue-field degree. Prove this single-place formula, identity, additivity and transitivity in towers. Prove the degree formula `deg_k(Norm D′)=[k′:k] deg_k′ D′`, with the constant-degree factor retained. Prove the principal-divisor identity `Norm(div z)=div(N_(F′/F) z)`, and the norm–conorm identity `Norm(Con D)=[F′:F]D`. These statements include inseparable finite extensions; use the function-field fundamental identity, not separability as a replacement for its hypotheses.

Descend norm and conorm to degree-zero class groups and compare them with the geometric Picard maps of §13.1. For a finite correspondence `C←α D→β C′` of smooth proper geometrically integral curves over k, construct `functionFieldCorrespondence` on `Cl⁰` as `Norm_β∘Con_α`. Prove composition, semilinear equivariance for correspondences defined over the ground field, and compatibility with the two geometric Hecke conventions. Prove `functionFieldDivisorNorm_baseChange` for flat cartesian base change of the finite curve map. For a compositum this gives the field formula when the tensor product is a field, with the required linear-disjointness hypothesis; if it splits, retain every factor, and if nonreduced, retain its cycle lengths. A single chosen factor does not satisfy an unrestricted base-change formula.

**Checks.**

- A totally ramified degree-d place with residue degree one has norm P, while its conorm coefficient is d; norm after conorm is dP.
- For `𝔽_(q²)(t)/𝔽_q(t)`, a rational place upstairs has degree one over the upper constants but norm degree two over the lower constants.
- For `k(t)/k(t^p)` in characteristic p, norm after conorm is multiplication by p, including its inseparable degree.
- Base change of a separable quadratic extension along itself gives two factors. Omitting either one loses a term of the push–pull identity.

*Needs:* Tau Ceti `Divisor.conorm`, `Divisor.conorm_principal` and `Divisor.finrank_mul_degree_conorm` (`FieldTheory/FunctionField/Divisor/Conorm.lean`); `Place.relativeDegree` and the fundamental identity for places; [AlgebraicCurves Layers 6 and 12](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicCurves); `SchemeAndStackFoundations §3.5/lineBundleNorm`.

(Stichtenoth, *Algebraic Function Fields and Codes*, III §1, especially Definition 3.1.8, Proposition 3.1.9 and Corollary 3.1.14, for conorm and degree; [Stacks 02RT](https://stacks.math.columbia.edu/tag/02RT), principal-divisor pushforward; [Stacks 02RG](https://stacks.math.columbia.edu/tag/02RG), flat base change; [Stacks 02RH](https://stacks.math.columbia.edu/tag/02RH), finite locally free push–pull.)

On the generic fibre define upper `T_p^J=π₁*π₂^*` and lower `(T_p^J)_*=π₂*π₁^*`, with the same disjoint correspondence for `p∣N`. Define upper diamond by Picard pullback `I_a^*` and lower diamond by Albanese norm `I_a*`. Extend these endomorphisms uniquely over `J₁(N)/ℤ[1/N]` by normal-base Hom extension; for `p∤N` the integral degeneracy maps are those of §9.1, and their source is smooth over the smaller base `ℤ[1/Np]`. The smooth relative-Jacobian push–pull construction applies over that smaller base; normal-base Hom extension carries its endomorphisms to `ℤ[1/N]`, where the correspondence source has semistable reduction at p (§11.5). The endomorphisms commute and satisfy the full-subgroup Hecke algebra relations. Their polarization transposes exchange upper/lower. On the cotangent space the lower operator is classical `T_p`, whereas the upper operator is its Petersson adjoint. On a bad-level Néron model extend the generic endomorphism by the Néron mapping property, without declaring its identity fibre abelian.

Establish this as follows. Compose the actual Picard and norm maps, then apply polarization duality to reverse the legs. Pull back invariant differentials along JacobianChallenge Layer F’s Abel–Jacobi morphism. Prove its cotangent identification with `H⁰(X,Ω¹)` using Layer E’s tangent identification `T₀Pic⁰≅H¹(X,O)` and Layer B’s Serre duality. Naturality compares the cotangent action with the regular-differential pullback–trace calculation of §§7.2–7.4; faithfulness in characteristic zero then transports the classical relations. Extend over the normal good-level base using the imported relative Hom theorem; use Néron extension separately at bad-level DVRs.

The public interface should expose:

- `heckeUpper`: `π₁*π₂^*` on the generic Jacobian and its unique good-base extension.
- `heckeLower`: `π₂*π₁^*` with the transpose convention.
- `heckeJacobian_dual`: Canonical polarization exchanges the two leg orders.
- `heckeJacobian_cotangent`: Lower is classical and upper is its adjoint on weight-two cotangent forms.
- `heckeJacobian_extend`: Unique extension across the normal good-base dense open.
- `heckeJacobian_relations`: The full-subgroup Hecke/diamond and bad U relations hold in `End(J)`.

**Checks.**

- `N=11,p=2`: each same-leg norm–pull is [3], without a factor `1/3`.
- At `p∣N` do not define diamond p, and do not apply good-prime adjoint formulas using its inverse.
- Polarization transpose of `π₁*π₂^*` is `π₂*π₁^*`.
- On `J₀(1)=0` both operators are zero.
- For `p∣N` the geometric operator is `U_p`; there is no `⟨p⟩` unit to insert.
- For `Γ₀(N)` good p the diamond is trivial and upper/lower agree, but this equality is not imposed on general `Γ₁` level.

*Needs:* [§7.2](#s7-2); [§7.3](#s7-3); [§7.4](#s7-4); JacobianChallenge Layers B, E and F; [§9.1](#s9-1); [§9.2](#s9-2); [§9.10](#s9-10); [§9.12](#s9-12); [§10.2](#s10-2); [§13.1](#s13-1); `AbelianSchemesAndArithmeticModuli` A6.25 (`relativeHom`).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 Definitions 5.5–5.6, p.68; §5.2, pp.71–72.)

<a id="s13-3"></a>

### 13.3 The geometric integral Hecke algebra

Define `T_J` as the unital image of the abstract integral full-subgroup Hecke/diamond algebra in `End(J₁(N))`, using the upper convention and all good/bad operators; lower gives its polarization-transpose isomorphic image. It is a commutative finite free `ℤ`-algebra as a `ℤ`-module because `End(J)` is finite free and `T_J` is a submodule. Faithful action means injectivity of this image algebra into `End(J)`, integral Betti `H¹` and `End(T_ℓJ)`, not faithfulness of the entire abstract double-coset algebra before quotienting its kernel. Its rational rank is computed by the modular-form comparison below; on `Γ₀` it equals `dim_ℚ S₂(Γ₀(N),ℚ)`. If `g=0` the image is the zero ring, of rank 0. No Layer 14 eigenspace freeness or rank-two Galois theorem is used here.

For a finite set S containing the level primes, realize AutomorphicFormsOnReductiveGroups §§5.8 and 7.3's common `𝕋^S` by `T_q↦heckeUpper q` and `S_q↦⟨q⟩` for `q∉S`. Define `heckeAlgebraAnemic` as its image inside `T_J`, and prove its quotient presentation and faithful action. Use the same construction with the lower convention when comparing arithmetic Frobenius with the classical eigenvalues. The full algebra `heckeAlgebraUpper` retains all operators: the anemic presentation alone does not contain `U_q` for `q∣N`.

For a maximal ideal m of either specified finite integral image, with residue characteristic r, define `jacobianHeckeTorsion` by `J[m]={x∈J(K̄): t x=0 for all t∈m}`. For r invertible in K it is a finite-dimensional `κ(m)`-vector space with a commuting continuous Galois action when the modular curve and Hecke action are defined over K. Over ℚ prove `jacobianHeckeTorsion_nonzero` for every such m, by the faithful integral Tate realization, localization and finite-module duality. No dimension-two or multiplicity-one assertion is part of this interface. This is the geometric eigen-ideal support supplied to residual-modularity consumers.

On the universal anemic presentation define `modularEisensteinSystem` by `T_q↦1+q`, `S_q↦1`. On full `Γ₀(N)` operators its selected extension sends each `U_q`, `q∣N`, to 1. Define `modularEisensteinIdeal` in the faithful full image as the ideal generated by `T_q−(1+q)`, `U_q−1` and trivial-diamond relations. A ring character on the free presentation need not descend to the compact Jacobian image; the generated ideal can be the unit ideal. At prime level the rational cusp difference supports the reduction of this system through the geometric Hecke action (§17.5).

Establish this as follows. Take the image ring of the specified realization, inheriting the commutative relations. Use the imported finite-freeness of the abelian Hom group to deduce finite-freeness of its `ℤ`-submodule. Identify the faithful realized integral action and postpone any rank-two eigenspace claim to Layer 14.

The public interface should expose:

- `heckeAlgebraUpper`: The image subring of `End(J)` with its upper action.
- `heckeAlgebraUpper_finiteFree`: Its underlying `ℤ`-module is finite free, including the zero case.
- `heckeAlgebraLower_equiv`: Polarization transpose identifies upper and lower commutative image algebras.
- `heckeAlgebraUpper_faithful`: The image acts faithfully on J and the supplied integral realizations.
- `heckeAlgebraUpper_rank`: Its rational rank agrees with the appropriately descended weight-two form space.

**Checks.**

- `Γ₀(1)` gives the zero image ring of rank 0.
- The `Γ₀(11)` image ring has `ℤ`-rank 1.
- An abstract Hecke operator annihilating all level-N forms is zero in `T_J`.
- Duality reverses products, but on this commutative image it is a ring isomorphism between conventions.
- For genus zero `T_J=0`, not `ℤ`. For `Γ₀(11)`, `g=1` so `T_J` has rank 1.
- Replacing the image algebra by the abstract Hecke algebra loses finite rank and faithfulness.
- Bad `U_q` are not among the anemic generators, and equality with the full image requires a theorem. A characteristic-zero primitive eigensystem can occur repeatedly at a higher old level, so `J[m]` is not declared two-dimensional.
- At `Γ₀(11)`, `T₂=−2`; the Eisenstein relation `T₂−3` is `−5`, and the order-five cuspidal class supports the reduction of the system. At genus zero the image is the zero ring and has no maximal ideal or unital character into a nonzero field.

*Needs:* [§13.2](#s13-2); `AutomorphicFormsOnReductiveGroups` §§5.8 and 7.3 (common arithmetic eigensystems); `AbelianSchemesAndArithmeticModuli` A4.1 and A6.7 (Tate modules and the integral Hom injection); [ModularForms Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra); [ModularForms Layer 8](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.66–69; §5.2, pp.71–72; [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, p.306.)

For residual eigen-ideal support, use [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §§3.2–3.3, Proposition 3.2, pp.34–36. For the Eisenstein system and its action on the rational cusp difference, use [Mazur, Modular curves and the Eisenstein ideal](https://www.numdam.org/item/PMIHES_1977__47__33_0/), II §§9 and 11, Proposition 11.1, pp.94–98; the prime-level component realization is §17.5.

<a id="s13-4"></a>

### 13.4 Polarization and Hecke adjoints

The canonical polarization gives a perfect alternating Weil pairing `T_ℓJ×T_ℓJ→ℤ_ℓ(1)`. Upper and lower Hecke operators are mutually adjoint. For `p∤N` and upper diamond convention, `T_p^†=⟨p⟩⁻¹T_p` and `⟨a⟩^†=⟨a⟩⁻¹`. At bad p use leg reversal, or conjugation by the chosen cyclotomic Fricke map `w_ζ`; do not substitute an undefined diamond p. Fricke conjugation exchanges upper/lower for all Hecke operators, so the w-twisted bilinear pairing makes the image algebra self-adjoint; this twisted pairing is not claimed alternating. The Weil-to-cup comparison follows the Kummer identification in §13.5. With Galois action retain the Tate-twist multiplier and g `w_ζ g⁻¹=w_(gζ)`.

Establish this as follows. Use norm/pullback polarization transposes to compute the adjoint of each correspondence. Compare with Petersson and the Fricke conjugation law to obtain the stated diamond factors. Retain the Galois twist of the Weil pairing; §13.5 fixes roots and compares it to the cup form.

**Checks.**

- For `Γ₀` good p the diamond is trivial and `T_p` is self-adjoint.
- Negating the cup form changes the comparison sign but not the norm–pullback transpose; a convention-free equality would fail.

*Needs:* [§9.2](#s9-2); [§9.3](#s9-3); [§9.12](#s9-12); [§13.2](#s13-2); `AbelianSchemesAndArithmeticModuli` A3.7.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 Theorem 5.2 and Corollary 5.3, p.66; Lemma 5.7, pp.68–69; Theorem 5.8, p.69.)

<a id="s13-5"></a>

### 13.5 The modular Jacobian Tate module

For `ℓ` prime, over `ℚ` define `T_ℓJ=lim_r J[ℓ^r](ℚ̄)`, a finite free `ℤ_ℓ`-module of rank 2g with its continuous `G_ℚ` action and commuting rational Hecke/diamond action. Intrinsically Kummer identifies it with `H¹_et(C_ℚ̄,ℤ_ℓ(1))`; choosing a complex embedding and compatible roots removes the twist in the comparison with integral Betti `H¹⊗ℤ_ℓ`. After choosing roots `ζ_(ℓ^r)=exp(2πi/ℓ^r)`, the Weil form on `T_ℓPic⁰` corresponds to the negative of the integral cup form on `H¹`, as in Conrad’s sign convention. It is not identified with `H₁` without duality/polarization. The map `End(J)⊗ℤ_ℓ→End_(ℤ_ℓ)(T_ℓJ)` is injective with torsion-free cokernel in the supplied Hom theorem; equality with the Galois centralizer is not asserted. Good reduction over `ℤ[1/N]` makes this representation unramified outside `Nℓ` by the lower arithmetic good-reduction criterion. `w_ζ` is defined over its cyclotomic field and obeys semilinear Galois conjugation, rather than commuting with all `G_ℚ`. The module is rank 2g over `ℤ_ℓ`; rank 2 over a Hecke factor belongs to Layer 14.

Establish this as follows. Import the A4 inverse-limit carrier, its freeness and continuous action. Prove the Kummer comparison here: on the proper curve the Kummer sequence `0→μ_{ℓⁿ}→G_m→G_m→0` identifies `H¹_et(C_Q̄,μ_{ℓⁿ})` with `Pic(C_Q̄)[ℓⁿ]=J[ℓⁿ]`, since the global units are divisible and the Néron–Severi group is `ℤ`; pass to the limit and compare with the integral Betti lattice, tracking the twist and sign. Pass the compatible finite traces of §9.12 to the inverse limit using finite generation and the finite-coefficient Mittag–Leffler property. Prove that the trace agrees with Picard norm under Kummer, first at `ℓⁿ`-torsion and then on the limit; its degree, composition and base-change laws follow from the finite traces. Compare the Weil and cup pairings through Kummer with the chosen roots, retaining the negative sign of §13.4’s convention. Use the A6 Hom injection for faithfulness and the arithmetic good-reduction criterion for unramifiedness; handle Fricke through its field of definition.

The public interface should expose:

- `jacobianTateModule`: The inverse-limit `ℤ_ℓ` lattice with topology and continuous Galois action.
- `jacobianTateModule_rank`: Its `ℤ_ℓ`-rank is 2g.
- `jacobianTateModule_kummer`: `T_ℓ Pic⁰≃H¹_et(C,ℤ_ℓ(1))`, retaining the twist.
- `jacobianTateModule_trace`: The inverse limit of §9.12’s finite traces is the adic trace, agrees with Picard norm through Kummer and satisfies the unnormalized degree, composition and base-change laws.
- `jacobianTateModule_hecke`: The rational geometric Hecke image acts continuously and commutes with `G_ℚ`.
- `jacobianTateModule_faithful`: The imported Hom injection makes the integral image algebra faithful.
- `jacobianTateModule_unramified`: Unramifiedness away from `Nℓ` follows from the specified good abelian model.

**Checks.**

- Genus zero gives a rank-zero lattice.
- `Γ₀(11)` gives rank 2 over `ℤ_ℓ`, rather than rank 1.
- Removing `ℤ_ℓ(1)` without a roots-of-unity choice loses the cyclotomic Galois multiplier.
- g `w_ζ g⁻¹=w_(gζ)`, while rational Hecke endomorphisms commute with g.
- At genus zero the Tate module is zero. For `Γ₀(11)` it has `ℤ_ℓ`-rank 2, and the Hecke algebra has rank 1.
- At `ℓ=2` the degree-2 trace remains multiplication by 2 rather than an invertible normalization.
- Composition of finite maps gives the composite Picard norm and the composite adic trace; their degree factors multiply.
- Reducing the inverse-limit trace at `ℓⁿ` agrees with §9.12’s finite trace on `H¹_et(C,μ_(ℓⁿ))`.

*Needs:* [§9.12](#s9-12); [§13.1](#s13-1); [§13.2](#s13-2); [§13.3](#s13-3); [§13.4](#s13-4); `AbelianSchemesAndArithmeticModuli` A4.1; `AbelianSchemesAndArithmeticModuli` A6.7 (`homFreeFinite`); `NeronModelsAndSemistableAbelianVarieties` §5.0a (finite-étale specialization of abelian torsion) and §5.0b (good reduction and the Frobenius polynomial).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.67–69; §5.2, pp.72–73.)

<a id="s13-6"></a>

### 13.6 The rational coefficient pairing

For `Γ₀(N)` over `ℚ` identify cotangent forms with `S₂(Γ₀(N),ℚ)`, the rational q-expansion space, using the earlier descent supplier. With the lower Jacobian Hecke image T and `β(T,f)=a₁(Tf)`, the pairing `(T⊗ℚ)×S₂(Γ₀(N),ℚ)→ℚ` is perfect. The identities `a_m(f)=a₁(T_m f)`, determination by q expansion, commutativity, and faithful cotangent action prove its two nondegeneracy statements. Consequently `dim_ℚ(T⊗ℚ)=g(X₀(N))`. For `Γ₁` or character components, use the actual descended coefficient field and diamond action; this statement does not replace the field by `ℚ` without proof. Rational perfection alone does not imply an integral unimodular pairing on a chosen q-lattice.

Establish this as follows. If `β(T,f)=0` for all T, each Fourier coefficient of f is zero, so `f=0`. If `β(T,f)=0` for every f, then `β(T_m,Tf)=β(T_mT,f)=0` for all m,f; hence `Tf=0` for every f. Use cotangent faithfulness in characteristic zero to conclude `T=0`, then use finite dimension for perfection.

**Checks.**

- `Γ₀(1)`: both sides have dimension 0. `Γ₀(11)`: both have dimension 1.
- A determinant of an integral pairing need not be `±1` merely because its rationalization is perfect.

*Needs:* [§7.2](#s7-2); [§7.5](#s7-5); [§7.6](#s7-6); [§8.1](#s8-1); [§10.2](#s10-2); [§13.2](#s13-2); [§13.3](#s13-3).

([Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter V §1, p.306.)

<a id="s13-7"></a>
<a id="integral-dualizing-forms"></a>

### 13.7 Integral weight-two forms and dualizing differentials

**Integral dualizing forms (`integral-dualizing-forms`).** For the compactified coarse modular models of §5.2 and the regular models of §11.4, specialize SchemeAndStackFoundations §2.20's relative dualizing module. Write `ω_C/S` for this module and reserve `ω_E` for the elliptic Hodge line of §7.1. The base S is locally Noetherian and the model morphism `C→S` is proper, flat and finitely presented with Cohen–Macaulay fibres of pure dimension one; verify these hypotheses on the model in use. The sheaf `ω_C/S` is invertible when the fibres are Gorenstein. Identify integral weight-two differential lattices with `H⁰(C,ω_C/S)`, and logarithmic lattices with `H⁰(C,ω_C/S(D))` when the cusp boundary D is a relative effective Cartier divisor in the smooth locus. Give their restriction, level transport and q-expansion maps in the Tate charts of Layer 4. The comparison with sections of `ω_E²` uses Kodaira–Spencer on the fine charts and the actual stabilizer invariants; it retains the extension conditions at the coarse elliptic points and the level fibres.

These are lattices for the specified model, for every level in its stated range. On a normal arithmetic model, describe extension of a generic differential by its membership in the dualizing module at each codimension-one point, using reflexivity to extend across codimension two. Under specialization use the dualizing sheaf of the base-changed model, including nonreduced fibres. Use §4.4's detection hypotheses for injectivity of a collection of cusp expansions. A single cusp need not detect a differential on a reducible fibre. The integral coefficient lattice at infinity alone is not identified with the differential lattice for every composite level.

At prime level `P≥5`, put `M=X₀(P)` for the coarse model over ℤ and let `r:C→M` be its minimal regular resolution. Let `B(ℤ)` be the lattice of classical holomorphic weight-two `Γ₀(P)` forms whose expansion at ∞ has integral coefficients, and `B⁰(ℤ)` its cuspidal sublattice; set `B(R)=B(ℤ)⊗R` and `B⁰(R)=B⁰(ℤ)⊗R`. Prove that expansion `η=f(q)dq/q↦f(q)` identifies `H⁰(M_R,ω_M/R)` with `B⁰(R)` and `H⁰(M_R,ω_M/R(0+∞))` with `B(R)`, for R flat over ℤ or over `ℤ/m` for some `m≥1`. This includes the fibre at P. Both identifications commute with every ring map within this category. For R flat over ℤ or over a field, prove the canonical comparison `H⁰(C_R,ω_C/R)≅H⁰(M_R,ω_M/R)`. The resolution is base-changed as a model; it need not remain a regular resolution after ramified base change. Do not extend this comparison's coefficient range by confusing sheaf base change with base change of global sections.

Let `A(R)` and `A⁰(R)` instead be moduli-theoretic sections of `ω_E²`, holomorphic and cuspidal respectively, on the level stack. Prove `A⁰(R)=B⁰(R)` and `A(R)=B(R)` for R flat over `ℤ[1/P]`. For `R=ℤ/m` with `gcd(m,P)=1`, prove `A⁰(R)=B⁰(R)`; the noncuspidal equality also holds if `2∤m` or `P≢1 mod 4`, and `3∤m` or `P≢1 mod 3`. Over a field of characteristic 2 with `P≡1 mod 4`, or characteristic 3 with `P≡1 mod 3`, the differential description of A permits a simple pole at the wild elliptic point as well as the cusps, and `dim(A/B)=1`. There is no unrestricted A/B comparison at P. Integrality of B uses the expansion at ∞; it does not impose integrality of every moduli-theoretic expansion at the other cusp.

**Checks.**

- For `P=5,7,13`, genus zero gives `B⁰(R)=0`, including at P.
- At `P=5` in characteristic 2 and `P=7` in characteristic 3, `dim(A/B)=1`, while `A⁰=B⁰=0`.
- The form with expansion `E₂(q)−P E₂(q^P)` lies in `B(ℤ)` and has a denominator P at the other cusp as a moduli-theoretic weight-two form; it is not in `A(ℤ)`.
- In the fibre of `X₀(55)` at 5, a nonzero regular differential on the genus-one component not meeting ∞, extended by zero on the other component, has zero expansion at ∞. Its node residues vanish. The prime-level single-cusp injection does not extend to this fibre.

*Needs:* [§4.1](#s4-1), [§4.4](#s4-4) and [§4.8](#s4-8) (integral cusp charts and section detection); [§5.2](#s5-2)–[§5.4](#s5-4) (coarse models and base change); [§7.1](#s7-1)–[§7.2](#s7-2) (Hodge normalization and generic comparison); [§11.2](#s11-2)–[§11.4](#s11-4) (fibres and resolutions); SchemeAndStackFoundations §0.6 (reflexive extension), §2.20 (SF.2, relative dualizing module and curve comparison); StableReduction Layer 2 (curve duality). The general dualizing sheaf is imported.

([Mazur, Modular curves and the Eisenstein ideal](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), II Definition 3.1, Lemma and Proposition 3.3, Proposition 3.4, pp.67–69; §4, Lemmas 4.4–4.8 and convention 4.9, pp.73–77; §5, pp.78–87. For arbitrary-level regular models and their Tate expansion, [Mazur, Rational isogenies of prime degree](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf), §2, especially §2(e), pp.138–141. The two-component composite-level fibre is the `n=1` case of §11.2.)

<a id="s13-8"></a>
<a id="integral-modular-serre-duality"></a>

### 13.8 Integral Serre duality and residues

**Integral modular Serre duality (`integral-modular-serre-duality`).** For a proper flat finitely presented modular model `f:C→Spec R` with Cohen–Macaulay fibres of pure dimension one over a Noetherian ring R, specialize the supplied proper duality trace. For every finite locally free sheaf F whose `H⁰(C,F)` and `H¹(C,F)` are finite locally free and commute with base change, identify `H⁰(C,F^∨⊗ω_C/R)` with `Hom_R(H¹(C,F),R)`, by cup product followed by `H¹(C,ω_C/R)→R`. Prove naturality and compatibility with base change whenever the hypotheses persist. With `F=O_C` this is the perfect integral pairing `H⁰(C,ω_C/R) × H¹(C,O_C)→R`. No smoothness or invertibility of 6 is required; invertibility of the dualizing sheaf is asserted only for Gorenstein fibres.

For the prime-level coarse model M and its resolution C of §13.7, establish the local freeness and coherent base-change hypotheses and identify the pairings under their canonical comparison for R flat over ℤ or over a field. On M, transport the pairing to `B⁰(R) × H¹(M_R,O)→R` for every R flat over ℤ or over some `ℤ/m`, using Proposition 3.3's base-change isomorphisms. At a nodal geometric fibre, the normalization description consists of differentials with at most simple poles at the node branches and residues a and −a. At a node `uv=ϖ^h`, the relative generator is `du/u=−dv/v`; the thickness h is retained by the model.

For a relative effective Cartier cusp divisor D finite flat over R in the smooth locus, identify `ω_C/R(D)|D≅ω_D/R` by adjunction, and use `0→ω_C/R→ω_C/R(D)→ω_D/R→0` to define residues. The finite dualizing module `H⁰(D,ω_D/R)` is `Hom_R(H⁰(D,O_D),R)`; the connecting map is dual to restriction of global functions to D. If D is finite étale, trace identifies `ω_D/R` with `O_D`. When also `f_*O_C=O_R` universally and D meets every fibre, this gives the exact residue sequence `0→H⁰(ω)→H⁰(ω(D))→H⁰(O_D)→R→0`, with the last arrow the sum of residue-field traces. In particular prime level has `0→B⁰(R)→B(R)→R²→R→0`, the last map `(a,b)↦a+b`. Expansion and residue commute with the base changes in §13.7: at a smooth Tate cusp `η=f(t)dt/t` has residue `a₀(f)`. The actual differential coefficient, including any width factor, determines the residue; a ramified cusp divisor retains `ω_D/R` rather than replacing it by `O_D`.

**Checks.**

- In genus zero both `H⁰(ω)` and `H¹(O)` are zero. At prime levels `5,7,13`, `B(R)` has its one-dimensional residue lattice `(a,−a)`.
- On an irreducible nodal rational genus-one curve, `dt/t` on the normalization has opposite residues at 0 and ∞ and spans `H⁰(ω)`; independently chosen branch residues do not descend.
- In characteristic 2, the two node residues can be equal and nonzero: their sum is still zero. The duality pairing remains perfect.
- The characteristic-2/3 pole allowed in A at the wild elliptic point is excluded from `H⁰(ω(D))=B`; replacing B by A would give the wrong residue sequence.

*Needs:* [§13.7](#integral-dualizing-forms); SchemeAndStackFoundations §2.6 (coherent cohomology and base change), §2.20 (SF.2, proper duality and curve comparison); StableReduction Layer 2 (nodal duality and normalization); JacobianChallenge Layers B–C (curve cohomology and base change).

([Mazur, Modular curves and the Eisenstein ideal](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), II Definition 3.1, duality (3.2), Lemma and Proposition 3.3, Proposition 3.4, pp.67–69; Lemma 4.6 and convention 4.9, pp.76–77; §5, residue formulas (5.14)–(5.16), pp.86–87; [Stacks 0E6N](https://stacks.math.columbia.edu/tag/0E6N), relative curve duality, and [0E2Y](https://stacks.math.columbia.edu/tag/0E2Y), derived base change.)

<a id="s13-9"></a>
<a id="integral-hecke-duality-compatibility"></a>

### 13.9 Integral Hecke adjoints under Serre duality

**Integral Hecke duality compatibility (`integral-hecke-duality-compatibility`).** On the integral modular models satisfying §13.8, construct the pullback and proper duality trace maps associated with the geometric Hecke correspondences, and compare their generic fibres with §§7.3–7.4 and their Picard actions with §13.2. Carry the model, coefficient ring and coherent local-freeness hypotheses with each map. For a correspondence `C←α Z→β C′` whose differential pullbacks extend to the integral dualizing lattices, prove `⟨Tr_α β*η,x⟩_C = ⟨η,Tr_β α*x⟩_C′` for `η∈H⁰(C′,ω)` and `x∈H¹(C,O)`. The two traces on differentials and on `H¹(O)` are transposes of the corresponding pullbacks under §13.8. Prove composition, level transport and compatibility with the base changes of the lattices. At a finite locally free leg the trace on O agrees with algebra trace. Coarse legs need not be flat; use proper duality and the integral modular extension, not a trace obtained by dividing by their degree.

For normal arithmetic modular models, give the extension criterion: the generic differential pullback must carry the dualizing module into the dualizing module at every codimension-one point of the source. Under this hypothesis reflexivity extends it across codimension two. Verify this criterion for the prime-level operators below; for their resolutions use the comparison of §13.7. This extension is a modular assertion, not a property of every finite map of singular curves. A normalization map of a nodal curve, for example, does not pull all dualizing differentials back to regular differentials on its normalization. On the fine locus compare with the isogeny Hodge map, retaining the normalization of §9.10 and the division theorem where it applies.

At prime level `P≥5`, prove that every good `T_l` (`l≠P`), the integral Fricke involution w and the bad operator `U_P` preserve `B⁰(R)` for all R in §13.7's coefficient category, including R of characteristic P. Under integral Serre duality their adjoints on `H¹(O)` are the reversed correspondences. The good `T_l` correspondence is symmetric on `Γ₀(P)`; w is its own transpose; on the cuspidal lattice `U_P=−w`. For `n≥1` the q-expansion identities are `a_n(T_l f)=a_(ln)(f)+l a_(n/l)(f)` and `a_n(U_P f)=a_(Pn)(f)`, with `a_(n/l)=0` unless `l∣n`. Retain inverse diamonds on nontrivial diamond components and reversed legs for general levels, rather than declaring all Hecke operators self-adjoint. Preserve the cusp residues of logarithmic differentials by the corresponding pullback and residue-field trace formulas wherever those maps extend; an automorphism transports each cusp residue to its image cusp. The integral differential operators require no division by a coefficient prime.

**Checks.**

- A genus-zero cuspidal lattice and its `H¹(O)` dual have zero Hecke actions; this supplies no nonzero rank-one generator.
- At prime level, w exchanges 0 and ∞, so it exchanges their residues `(a,−a)` to `(−a,a)` without a degree factor.
- On the fibre at P the relation `U_P=−w` is integral, including reduction modulo P. No diamond `⟨P⟩` is used.
- The specialized maps land in the node residue-sum kernel; trace retains the scheme-theoretic multiplicities on inseparable branches. Counting geometric points loses the degree.
- At `P=5` in characteristic 2 or `P=7` in characteristic 3, the construction acts on B and its dual, retaining the elliptic-point correction to A from §13.7.

*Needs:* [§13.7](#integral-dualizing-forms)–[§13.8](#integral-modular-serre-duality); [§7.3](#s7-3)–[§7.4](#s7-4); [§9.1](#s9-1), [§9.4](#s9-4) and [§9.9](#s9-9)–[§9.10](#s9-10) (geometric correspondences, Fricke and coherent trace); [§10.2](#s10-2) (integral normalization); [§11.4](#s11-4); [§13.1](#s13-1)–[§13.2](#s13-2); SchemeAndStackFoundations §§2.19–2.21 (proper coherent trace and duality); StableReduction Layer 2.

([Mazur, Modular curves and the Eisenstein ideal](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), II §6, pp.87–90, especially the construction of dual maps on p.88 and adjointness on p.89; §9, pp.93–96, for the differential and `H¹(O)` realizations; §4, pp.69–77, for the coefficient lattices. The general leg conventions and integral Hecke extension are §§9.1, 9.10 and 13.2.)


### Examples

`X₁(5)` has genus zero and four cusps. Its compact Jacobian is zero and its image Hecke algebra has rank zero, while its full symbol module has nonzero boundary classes. This prevents identifying the entire symbol Hecke kernel with the compact Jacobian kernel. On a ramified finite map, pushforward after pullback multiplies by the total degree, not by the number of distinct points of a special fibre. The negative cup/Weil sign is checked with a chosen complex embedding and compatible roots of unity.

### Dependencies

Use Layer 5, Layer 7, Layer 8, Layer 9, Layer 10, Layer 11. External contracts: AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, JacobianChallengePartII, NeronModelsAndSemistableAbelianVarieties, SchemeAndStackFoundations and StableReduction. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 14: Cohomological realizations and parabolic lattices

<a id="s14-1"></a>

### 14.1 Geometric weight coefficient systems

For the universal elliptic curve `f:E→Y₁(N)`, `N≥5`, construct `L_B=R¹f_an,*ℤ` and `L_{ℓ,n}=R¹f_et,*ℤ/ℓⁿ`, with `ℓ` invertible on the base. Their geometric fibres are `H¹` of the elliptic fibre, locally free of rank two. For `r=k−2≥0` set `L_r=Sym^r` L, of rank `r+1`. The coefficient maps along an isogeny are induced by its pullback on relative `H¹`; integral lattices and duals are retained before any inversion of `ℓ`.

A universal elliptic curve from Layers 3 and 4; `k≥2`, `n≥1`, `ℓ` prime; finite étale statements require `ℓ` invertible.

For coarse levels lacking a fine universal family, use a supplied fine cover with its descent data; descent invariants are not exact if the deck-group order is not invertible.

Establish this as follows. Import the universal family and proper smooth base change to construct relative degree-one sheaves; on the analytic side transport fibre cohomology through local trivializations. Apply the existing symmetric-power functor to each transport map; its identity/composition laws give a local system. Use the elliptic cup product and isogeny pullback to fix the covariant/contravariant and Tate-twist conventions.

The public interface should expose:

- `relativeBettiH1`: The rank-two Betti local system of the supplied universal elliptic family.
- `relativeEtaleH1`: The finite `ℤ/ℓⁿ` relative degree-one étale local system.
- `weightCoefficients_fibre`: Its fibre at y is `Sym^{k−2} H¹(E_y,A)`, naturally in y and the coefficient ring A.
- `weightCoefficients_isogeny`: The coefficient morphism is `Sym^{k−2}` of the isogeny pullback; identity and composite isogenies give identity and composite maps.
- `weightCoefficients_compare`: Artin comparison identifies the finite Betti and étale systems and their isogeny maps.

**Checks.**

- At `k=2`, `Sym⁰` L is the constant rank-one system.
- At `k=3`, a fibre is `L_y` and has rank two.
- On every monodromy representation `ρ`, the action is exactly Representation.symmetricPower `ρ (k−2)`.
- At `k=3` a cusp loop with fibre matrix [[1,w],[0,1]], w nonzero, acts nontrivially over `ℤ`; the coefficient system is not constant.
- For `r=0` the coefficient system is constant; for `r=1` its fibre has rank two.
- No universal elliptic family is silently put on a coarse level-one curve.

*Needs:* [§3.2](#s3-2); [§3.5](#s3-5); [§4.12](#s4-12); `AbelianSchemesAndArithmeticModuli §A4`; Tau Ceti `TauCeti.LocalCoefficientSystem`; Tau Ceti `TauCeti.LocalCoefficientSystem.pullback`; Tau Ceti `Representation.symmetricPower`; `EtaleCohomologyFoundations §§F.1–F.4`; [AlgebraicTopology Stage 5](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent); Tau Ceti `SymmetricPower.finrank_eq`.

([Deligne, Séminaire Bourbaki 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §§3.9–3.11, pp. 154–156; §3.16, pp. 157–158.)

<a id="s14-2"></a>

### 14.2 Finite and adic parabolic cohomology

For `j:Y→X` the supplied compactification and the geometric `L_r` with `A=O`, `O/πⁿ` or `K=Frac(O)`, define `H¹_par(Y,L_r)=im(H¹_c(Y,L_r)→H¹(Y,L_r))`. Define finite étale analogues first and take compatible inverse limits for the O-adic realization, with O a finite extension of `ℤ_ℓ`. For constant weight-two coefficients, `H¹_par(Y,A)=im(H¹(X,A)→H¹(Y,A))`; for these smooth curves the latter map is injective. Twisted coefficients use `j_*L_r` and the local boundary sequence, not extension by zero identified with direct image.

`N≥5` or a supplied torsion-free fine cover; j and its finite cusp set `D=X ∖ Y` are fixed.

Adic notation denotes the inverse-limit lattice, not merely tensoring rational Deligne cohomology.

Establish this as follows. Import absolute and relative twisted cochains and compact supports from AlgebraicTopology, and finite étale cohomology from EtaleCohomologyFoundations §§F.1–F.4. Construct the map forgetting support; use its image submodule as the parabolic group. Use the boundary exact sequence to compare with compactification cohomology; establish finite coefficient transition maps before taking limits.

Use Mathlib's image submodule for the actual support map, with its canonical inclusion in ordinary cohomology. Membership means `x=u(y)` for a compact-support class y. A commuting square `b∘u=v∘a` induces a map of the images, respecting identities and composition. For proper `Y=X`, the support map is an isomorphism. Under the finite generation and transition hypotheses of [§14.4](#s14-4), the finite-level parabolic system recovers the specified O-lattice.

**Checks.**

- The image of the identity support map is the entire module.
- A zero support map has zero parabolic image.
- For `Y=G_m(C)`, constant `ℤ` coefficients, ordinary `H¹≅ℤ` but parabolic `H¹=0`.
- For the compact curve `X₀(11)`, parabolic constant `ℤ H¹` has rank two.
- On an open genus-zero curve, ordinary boundary classes need not be parabolic.
- The degree-one pro-étale `ℤ_ℓ` carrier in Mathlib is an untwisted comparison target, not the whole coefficient API.

*Needs:* [§14.1](#s14-1); [AlgebraicTopology Stage 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology); [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality); `EtaleCohomologyFoundations §§F.1–F.4`; Mathlib `LinearMap.range`; Mathlib `AlgebraicGeometry.Scheme.EllAdicCohomology`.

([Deligne, Séminaire Bourbaki 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Definition 3.9, pp. 154–155; (3.20), pp. 159–160.)

<a id="s14-3"></a>

### 14.3 Boundary and interior cohomology

For a smooth open complex or étale curve with finite puncture set D, the support-forgetting map fits into the cohomology sequence of `j_!L→Rj_*L→i_*i^*Rj_*L`. In degree one, `H¹_par` is `ker(H¹(Y,L)→⊕_{c∈D}H¹(I_c,L_c))`; the neighboring `H⁰` and `H²_c` terms are retained. For trivial A coefficients on a connected curve with s cusps, `0→H¹(X,A)→H¹(Y,A)→A^D→A→0` is exact, where the last map sums residues (and the étale terms carry the residue Tate twist).

`ℓ` is invertible for étale coefficients; the local comparison of a punctured disc at a cusp with its tame inertia is proved here as part of this theorem.

The displayed constant-coefficient residue sequence ending `A→0` assumes D is nonempty. If D is empty, retain `H²(X,A)` and use the identity support map; there is no final residue-surjection claim.

The étale statement is geometric, over an algebraically closed field of characteristic different from `ℓ`; the curve is connected. Over other bases the corresponding cohomology of the cusp scheme must be retained, rather than replaced by `A^D`.

Establish this as follows. Apply the localization triangle for `j_!` and `Rj_*`; compute each boundary stalk by local inertia cohomology. For constant coefficients the local invariant and residue groups are rank one; global orientation/trace identifies the final sum map. Pullbacks and traces of finite correspondences induce morphisms of this sequence.

**Checks.**

- `Y=X ∖ {one cusp}` has no additional ordinary degree-one rank; with two cusps it has one boundary generator.
- Do not replace `H¹_par` by all of `H¹` before a localization argument.

*Needs:* [§14.2](#s14-2); [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality); `EtaleCohomologyFoundations §§F.1–F.4`; `EtaleCohomologyFoundations §0.7/ClassicalAlgebraic.supportLocalization`.

([Deligne, Séminaire Bourbaki 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Definition 3.9 and (3.20), pp. 154–155, 159–160.)

<a id="s14-4"></a>

### 14.4 Integral comparison and change of level

For the supplied smooth finite-type modular curves over `Q̄`, a chosen embedding `Q̄↪C`, and finite locally constant `ℤ/ℓⁿ` coefficients from the universal family, Artin comparison gives `H^i_et(Y,L_{r,ℓ,n})≅H^i_B(Y_an,L_{r,B}/ℓⁿ)`, with compact-support analogues and their support maps. These identify finite parabolic images. After proving the required inverse-limit exactness and finite generation, they give the adic comparison; for `r=0` this also identifies the actual compact-curve lattice with Mathlib’s pro-étale EllAdicCohomology in degree one. Pullback, trace, cup product and level maps commute with comparison.

Through the finite-pair adapter of [§14.4a](#s14-4a), on a neat fine `GL₂/ℚ` level also identify these Betti complexes with the corresponding connected component of ArithmeticLocallySymmetricSpaces ALS.1. Compare the `R¹f_*` fibre with the dual of the elliptic homology lattice, carrying its row-frame action; match parallel transport with ALS.1.1’s action by the inverse of the lifted loop endpoint. The comparison identifies the support/boundary triangle, Hecke pullback and unnormalized trace, and finite-cover descent with ALS.3.5–ALS.3.9, ALS.4.1 and ALS.6.1–ALS.6.3. Descend to other torsion-free fine levels only through the proved cover comparison. The elliptic isogeny coefficient maps and modular cusp-inertia computation are those of §§14.1 and 14.3. Adjoint-ideal transport under this comparison is §14.11. The shared interface uses no higher-rank Eisenstein theorem or conditional Galois input.

The row-frame comparison uses §§3.14, 4.5 and 6.1's transported family maps: the swap K conjugates the integral homology matrices, the positive-frame period map is `F_γ`, and forgetting to the standard point or cyclic marking uses S and `z↦z/τ`. On relative `H¹` use the dual pullback maps, and on `L_r` their `Sym^r`, for every `r≥0`. Thus the level, support and Hecke diagrams retain their coefficient maps under the same coordinate transport.

Here the arithmetic O-adic support/ordinary/boundary triangle means `Rlim_n` of the finite `O/πⁿ` triangles, and its K-realization means tensoring that O-complex with K. It is compared with finite cellular O-cochains by §14.4a, without invoking an ALS complex formed directly from an arbitrary O-valued sheaf. Finite cohomology systems are Mittag–Leffler; reduction modulo `π` commutes in degree one only under the torsion hypotheses of [§14.10](#s14-10).

Establish this as follows. Import Artin’s comparison with locally constant and compactly supported coefficients from ComplexComparisonPartII §§C6.3–C6.6. Use naturality with `j_!→Rj_*` and finite correspondences; apply the coefficient comparison from [§14.1](#s14-1). Apply finite generation (EtaleCohomologyFoundations §F.3) and Mittag–Leffler exactness to the finite systems, and prove here the comparison of the degree-one limit with Mathlib’s pro-étale carrier.

**Checks.**

- Trace composed with pullback is degree times identity in each realization.
- Changing the complex embedding changes the comparison choice; Galois invariance is not asserted for that choice.
- At a cusp of strict width w, transport on `R¹f_*` is dual to that on the homology lattice; the chosen bases must reproduce §14.1’s unipotent cusp matrix and its `Sym^r` action.
- At `r=0` the boundary triangle gives §14.3’s residue-sum sequence, with the same support map in the arithmetic Betti complex.
- For a finite `Δ`-cover the trace of pullback is `|Δ|`; integral descent keeps derived invariants when `|Δ|` is not a unit.

*Needs:* [§14.4a](#s14-4a); ArithmeticLocallySymmetricSpaces §§ALS.1.1–ALS.1.8, ALS.3.5–ALS.3.9, ALS.4.1 and ALS.6.1–ALS.6.3 (the shared Betti/support and cover interfaces); [§14.1](#s14-1); [§14.2](#s14-2); ComplexComparisonPartII §§C6.3–C6.6 and EtaleCohomologyFoundations §§F.1–F.4; `EtaleCohomologyFoundations §§F.1–F.4`; [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality); Mathlib `AlgebraicGeometry.Scheme.ellAdicSheaf`.

([Deligne, Séminaire Bourbaki 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Definition 3.9 and discussion of W_ℓ, pp. 154–156; corollary following Theorem 4.1, printed as Corollaire 3.2, p. 161.)

<a id="s14-4a"></a>

### 14.4a The modular Borel–Serre pair and adic adapter

**Modular Borel–Serre comparison — `modularBorelSerreComparison`.** For a torsion-free congruence group `Γ` and a chosen neat fine `GL₂/ℚ` component `Y_an≃Γ \ ℍ`, construct a compact oriented surface B with interior `Y_an` and one boundary circle at each cusp, and a finite triangulation of `(B,∂B)`. Identify this pair with the corresponding Borel–Serre component, preserving cusp stabilizers and orientation. Finite level covers extend to covers of pairs; finite families of level and Hecke maps admit compatible cellular representatives after subdivision. This supplies the boundary-compatible triangulability input of ALS.2.4 on these components.

For a finite free O-local system L from §14.1, put `A_n=O/πⁿ` and `L_n=L/πⁿ`. Identify the finite-coefficient ALS ordinary/support/boundary triangle with

`C^•(B,∂B;L_n) → C^•(B;L_n) → C^•(∂B;L_n) → C^•(B,∂B;L_n)[1]`.

The local system extends to B with its cusp-loop monodromy; it is not extended over collapsed cusp discs. The finite sheaf/cochain comparisons of ComplexComparisonPartII C6.1 and ALS.F.3/ALS.1.4 give a commuting comparison of this triangle with `RΓ_c(Y_an,L_n)→RΓ(Y_an,L_n)→RΓ(∂B,L_n)`. Compare its first two terms with the finite étale support map by Artin comparison. All squares preserve coefficient transitions, finite-cover pullback/trace, cup/evaluation, and the oriented trace. Thus they identify parabolic images at each n.

Define the arithmetic O-adic complexes as `Rlim_n` of these finite complexes. On the finite CW pair, cellular terms are finite sums of stalks, and their reductions have surjective transitions. Completeness gives `Rlim_n C^•(B,∂B;L_n)≃C^•(B,∂B;L)`, with the analogous ordinary and boundary identifications. Rlim preserves the triangle and all the comparison squares. Finite coefficient cohomology is Mittag–Leffler, so the Milnor sequence identifies its cohomology with the ordinary inverse limit; applying exactness to the finite support images identifies the parabolic limit. K-complexes are scalar extensions of these finite free O-models. Evaluation/trace duality is transported at finite coefficients and on the finite O-models, retaining §14.11’s dual lattice and Tate twist; no interchange of a dual with an arbitrary inverse limit is presumed. This supplies the ordinary/support triangle and duality used in §§14.4 and 14.11 without `TopologicalCoefficientInput(O)` or `TopologicalCoefficientInput(K)`.

Establish this as follows. Truncate the disjoint cusp horodiscs of FuchsianOrbifolds Layer 3 in a finite fundamental polygon from Layer 2. Triangulate the finitely many truncated polygons with matching side subdivisions; cusp edges form the boundary subcomplex. The cusp coordinates identify a collar with the Borel–Serre horocycle end. Lift cells to finite covers and compare common subdivisions for correspondences. Use the finite-system sheaf/cochain dictionary with its actual stalk transport, then apply the supplied module derived-limit and finite cellular duality APIs.

**Checks.**

- For every n, the square with top row `RΓ_et,c(Y,L_n)→RΓ_et(Y,L_n)` and bottom row `C^•(B,∂B;L_n)→C^•(B;L_n)` commutes. Applying `Rlim_n` gives the same square for the O-adic complexes and their support map.
- A genus-g curve with `s>0` cusps gives a surface with s boundary circles, Euler characteristic `2−2g−s`, and its relative orientation class gives the curve trace.
- Take a fine modular cover with deck group `C_ℓ`, for example a congruence cover inside `Γ(5)` obtained by a unipotent `C_ℓ` subgroup modulo an odd `ℓ≠5`. Its lifted cells are free `C_ℓ`-orbits. For constant `A_1` coefficients, trace after pullback is `ℓ=0`. At a cusp with degree-`ℓ` circle cover, pullback on `H¹` is zero although upstairs `H¹` has invariant module `A_1`. Thus descent must compare `RΓ(C_ℓ,C^•)`, not ordinary invariants of cohomology. The same equivariant diagram survives `Rlim_n`.
- Collapsing a boundary circle with nontrivial cusp monodromy would lose the boundary complex and fails the support comparison.

*Needs:* FuchsianOrbifolds Layers 2–4; ArithmeticLocallySymmetricSpaces §§ALS.F.3, ALS.1.4, ALS.2.1–ALS.2.4 and ALS.5a.3–ALS.5a.5, restricted to finite coefficient systems; ComplexComparisonPartII §§C6.1, C6.3–C6.6; DerivedModuleAlgebra §§1.T.1 and 1.1; AlgebraicTopology Stages 2, 5 and 6; [§14.1](#s14-1).

*Source:* [Borel–Serre, Corners and arithmetic groups](https://www.e-periodica.ch/iiif/com-001:1973:48::32/manifest), §7.3, p.464, §9.3, pp.475–476 (the rank-one boundary), and §11.1, p.481; [Hatcher](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), §2.2 (relative cellular chains) and §3.H (local coefficients); [Stacks, tag 07KW](https://stacks.math.columbia.edu/tag/07KW) (derived limits and Mittag–Leffler exactness).

<a id="s14-5"></a>

### 14.5 The weight-two Shimura isomorphism is Hecke-equivariant

For `N ≥ 5`, define `Sh(f+ḡ)=[2πi f(τ)dτ+overline{2πi g(τ)dτ}]`. The Hodge decomposition gives `S₂(Γ₁(N), ℂ) ⊕ S̄₂(Γ₁(N), ℂ) ≅ H¹(X₁(N)^an, ℤ) ⊗ ℂ` by this Sh, and it identifies `⟨n⟩ ⊕ ⟨n⟩̄` with `⟨n⟩^*`, `T_p ⊕ T̄_p` with `T_p^* = (π₁^{(p)})_* ∘ (π₂^{(p)})^*` and `w_N ⊕ w̄_N` with `w^*_{e^{2πi/N}}`, where `π₁^{(p)}`, `π₂^{(p)}` : `X₁(N, p) → X₁(N)` are the degeneracy maps and `(π₁^{(p)})_*` is the trace.

`N ≥ 5`; at `N < 5` both sides vanish. The integral Betti carrier is `H¹` of the compact analytic curve. ModularForms Layer 8 supplies a homological symbol module with boundary and possible torsion; only the separately proved cuspidal/dual comparison identifies the relevant lattice.

Establish this as follows. Hodge decomposition of the compact Riemann surface `X₁(N)^an` with `H⁰(Ω¹) = S₂(Γ₁(N), ℂ)`. Compute `T_p^*` on `H¹` through the trace along `π₁^{(p)}` (stalkwise sum with ramification multiplicities) and pullback along `π₂^{(p)}`; compare with the double-coset action on cusp forms. Diamond operators and `w_ζ` are induced by automorphisms, so pullback commutes with the Hodge decomposition.

**Checks.**

- For the normalized nonzero `f∈S₂(Γ₀(11))`, pullback to `Γ₁(11)` gives a nonzero holomorphic class `Sh(f)` in `H¹(X₁(11),ℂ)`.
- Its antiholomorphic class `Sh(ḟ)` is nonzero and independent of `Sh(f)`; these span the two-dimensional `H¹` of the genus-one `X₁(11)`.
- The identity correspondence acts as the identity on both cusp-form summands and on `H¹`, and Sh intertwines these actions.

*Needs:* [§7.3](#s7-3); [§7.4](#s7-4); [§7.1](#s7-1); [§7.2](#s7-2); [§9.11](#s9-11); [§13.1](#s13-1); [§13.2](#s13-2); [§14.4](#s14-4); [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 64 (printed page; PDF page 68); [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 65 (printed page; PDF page 69).)

<a id="s14-6"></a>

### 14.6 Cup product and the Petersson product

With `H²(X₁(N)^an, ℤ) ≅ ℤ` by the complex orientation and `Sh(f+ḡ)=[2πi f(τ)dτ+overline{2πi g(τ)dτ}]`, the cup product and the non-normalized Petersson product `⟨f,g⟩=∫f` overline{g} dx dy satisfy `(Sh(f₁+ḡ₁),Sh(f₂+ḡ₂))=−8π²i(⟨f₁,g₂⟩−⟨f₂,g₁⟩)`.

The cup-product pairing is perfect; the Petersson integral converges by exponential decay at the cusps.

Establish this as follows. Use the Sh of §14.5 and integrate harmonic representatives in the complex orientation. Since `dτ∧dτ̄=−2i dx∧dy`, `ω_f∧overline{ω_g}=−8π²i` f overline{g} `dx∧dy`; reverse the order for the second mixed term. The holomorphic–holomorphic and antiholomorphic–antiholomorphic terms vanish.

**Checks.**

- For a nonzero `f∈S₂(Γ₀(11))`, `cup(Sh(f),Sh(ḟ))=−8π²i⟨f,f⟩` is nonzero and imaginary; its complex conjugate is its negative, equal to `cup(Sh(ḟ),Sh(f))`.
- Reversing the two cohomology classes changes the sign.
- Multiplying the pairing by this common nonzero scalar preserves all adjoint conclusions of §14.7.

*Needs:* [§7.2](#s7-2); [§14.5](#s14-5); [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 66 (printed page; PDF page 70).)

<a id="s14-7"></a>

### 14.7 Hecke operators are self-adjoint for the `w_ζ`-twisted pairing

With `[x, y] = (x, w^*_ζ y)` for `ζ = e^{2πi/N}`, every `T ∈ T₁(N)` is self-adjoint on `H¹(X₁(N)^an, ℤ)`; for (·,·) the adjoint of `T_p^*` (`p ∤ N`) is `⟨p⁻¹⟩^* T_p^*` and that of `⟨n⟩^*` is `⟨n⁻¹⟩^*`. The same holds for any primitive N-th root `ζ`.

`T₁(N) ⊂ End_ℤ H¹(X₁(N)^an, ℤ)` generated by the `T_p^*` and `⟨n⟩^*`; commutative and finite flat over `ℤ` (Tau Ceti ModularForms Layer 8 owns the integral Hecke algebra).

Establish this as follows. Transport the classical Petersson adjoints (`T_p` for `p | N` via `w_N`) through [§14.6](#s14-6). Contravariance applied to `w_{ζ^j}∘w_ζ=I_j` gives `w^*_ζ∘w^*_{ζ^j}=⟨j⟩^*`, equivalently `w^*_{ζ^j}∘w^*_ζ=⟨j⁻¹⟩^*`. This commuting diamond unit reduces general `ζ` to `e^{2πi/N}`.

**Checks.**

- At `j=1`, `w^*_ζ∘w^*_ζ` is the identity.
- At `N=13,j=3`, the reversed pullback product is `⟨9⟩^*`, while `w^*_ζ∘w^*_{ζ³}=⟨3⟩^*`; these inverse diamonds have order three and are distinct.
- For `p|N` the adjoint of `U_p` for the ordinary cup pairing is `w^*_ζ U_p w^*_ζ`, so `U_p` is self-adjoint for [·,·].

*Needs:* [§9.2](#s9-2); [§9.3](#s9-3); [§10.2](#s10-2); [§13.2](#s13-2); [§13.4](#s13-4); [§14.6](#s14-6).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 66 (printed page; PDF page 70).)

<a id="s14-8"></a>

### 14.8 Hecke operators with relative coefficients

For a good prime `q∤Nℓ` and the actual isogeny correspondence `Y₁(N,q)` with maps `q₁,q₂` and its universal isogeny, `T_q` on `H¹_par(Y,L_r)` is trace along `q₁` after pullback along `q₂` and the induced coefficient map. Its comparison with the classical weight `k=r+2` operator uses Deligne’s normalization, including the `q^{r+1}` term in the good-prime Hecke polynomial. Diamond and prime-to-level degeneracy maps preserve the parabolic image; functorial traces satisfy the projection formula and `trace∘pullback=degree`.

Both direction and scalar normalization are fixed by the universal isogeny, not by an arbitrary action on an unnamed cohomology module.

Establish this as follows. Import the geometric correspondence and finite-map traces; apply `Sym^r` of the isogeny map. Make the compact-support and ordinary squares commute, obtaining the map on their images. Apply comparison and the analytic normalization of ModularForms; distinguish `T_q` from a rescaled double-coset operator.

**Checks.**

- At `r=0` this recovers the weight-two Shimura convention.
- Changing the isogeny pullback to its dual without changing Tate twists must fail the pairing adjoint test.

*Needs:* [§9.1](#s9-1); [§9.2](#s9-2); [§9.10](#s9-10); [§9.12](#s9-12); [§13.5](#s13-5); [§14.2](#s14-2); [§14.4](#s14-4); [ModularForms Layer 8](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields); `EtaleCohomologyFoundations §§F.1–F.4`; `EtaleCohomologyFoundations §0.11/ClassicalAlgebraic.curveDuality`.

([Deligne, Séminaire Bourbaki 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Propositions 3.18–3.19 and (3.20), pp. 158–160.)

<a id="s14-9"></a>

### 14.9 Non-Eisenstein removal of the boundary

**Boundary Hecke support is Eisenstein without a semisimplicity hypothesis.** For weight-two constant coefficients at a torsion-free congruence level and an anemic Hecke maximal ideal m of residue characteristic `ℓ≥3`, call m non-Eisenstein if, over a finite extension of its residue field, its good-prime eigenvalues are not `ψ₁(q)+qψ₂(q)` with `ψ₁,ψ₂` finite congruence characters and diamond eigenvalues `ψ₁(q)ψ₂(q)`. Every simple constituent of the finite Hecke image on the cusp boundary cohomology and on `H⁰(Y,O/π)` has such an Eisenstein character. Consequently the entire boundary, including its extensions, vanishes after localization at m, at O and at every `O/πⁿ`. The support map `H¹_c→H¹` is then an isomorphism after localization, identifying its parabolic image with ordinary localized `H¹`. For `Sym^r` coefficients this theorem asserts nothing; §14.10 carries the higher-weight boundary vanishing as an explicit hypothesis.

Anemic operators exclude level and residue-characteristic primes; fine level removes stabilizer torsion.

In weight two this definition is an algebraic Hecke condition; the identification with residual Galois irreducibility is a consequence in AutomorphicGaloisRepresentations, not a prerequisite here.

Establish this as follows. Compute the two parts of the good-prime correspondence on the cusp invariants and residues using §§4.1 and 5.11 and Layers 9–10. Identify the commuting congruence multipliers `A_q,B_q`, with `T_q=A_q+qB_q` and `A_q B_q=D_q` for the diamond `D_q`, retaining the residue twist. Their actions factor through a finite abelian congruence quotient. After a finite residue-field extension splitting its prime-to-`ℓ` characters, take a composition series stable under these multipliers. On each simple constituent the `ℓ`-primary part acts trivially, and `A_q,B_q` give characters `ψ₁(q),ψ₂(q)`; hence the Hecke and diamond formulas hold there. The `ℓ`-primary action on the whole module may have unipotent extensions. Submodules and quotients, including the residue-sum kernel, retain only these simple constituents. Constants give `H⁰` the character `T_q=1+q`, `D_q=1`.

Use exact localization along the composition series to kill every residual boundary module at m, including nonsplit extensions; faithful scalar extension descends this vanishing. Apply IntegralHeckeAndGaloisDeterminants §§2.1–2.3 to the common finite Hecke image of the support/boundary complexes. Its local-factor projector commutes with reduction. Nakayama on the finite O-boundary modules then gives integral vanishing, and the coefficient reductions of the finite boundary-circle model give vanishing at every `O/πⁿ`. Apply the localized support triangle. The modular character computation is the target here; finite-image and localization algebra use the supplied interfaces and Mathlib `IsLocalizedModule.map_exact`.

**Checks.**

- An Eisenstein maximal ideal may retain cusp classes.
- At `Γ₁(11)` with coefficients `𝔽₅`, the five width-one cusps are indexed by `(ℤ/11)ˣ/{±1}`. The class of 3 has order five, so its diamond acts as a 5-cycle P. The permutation action sends `e_i` to `e_(i+1)` and satisfies `P⁵=I`, `P≠I` and `(P−I)⁵=0`. It cannot be diagonalized over any extension of `𝔽₅`, although `5∤11` and the level is fine.
- On that orbit `Pe₀=e₁`, and `∑_i(Pv)_i=∑_i v_i` for every cusp vector v.
- On that orbit, `v=(P−I)e₀=e₁−e₀` has residue sum zero, but `(P−I)v=e₂−2e₁+e₀≠0`. Thus even the residue-sum kernel has nontrivial unipotent action; its composition factors have P acting as 1, and exact localization away from its Eisenstein support kills the whole extension.
- For a connected Y, constants have `T_q=1+q` and trivial diamonds, so their localization vanishes at every non-Eisenstein m.
- The statement does not demand a Galois representation theorem to define non-Eisenstein localization.

*Needs:* [§4.1](#s4-1); [§5.11](#s5-11); [§9.2](#s9-2); [§9.9](#s9-9); [§10.2](#s10-2); [§14.3](#s14-3); [§14.4a](#s14-4a); [§14.8](#s14-8); IntegralHeckeAndGaloisDeterminants §§2.1–2.3 (finite Hecke images and local-factor summands); Mathlib `IsLocalizedModule.map_exact`.

([Taylor–Wiles](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Proof of Proposition 1 and preceding localization setup, author pp. 6–8; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), (4.2.1) and Definition 4.3.1–Theorem 4.3.4, pp.37–39, for the cusp labels used in the modular constituent calculation.)

<a id="s14-9a"></a>

### 14.9a A finite graph model for the open modular curve

**Finite surface spine.** For a torsion-free congruence subgroup `Γ⊂SL₂(ℤ)`, prove `modularOpenFiniteGraph`: the noncompact surface `Y=Γ \ ℍ` has a deformation retract onto a finite connected graph. Its fundamental group is free of rank `2g+s−1`, where g is the compactification genus and `s≥1` its cusp count. Use the FuchsianOrbifolds Layer 2 polygon presentation and Layers 3–4 cusp collars to truncate Y to a compact surface with nonempty boundary. Cut that surface along finitely many arcs to a polygon and collapse it to a spine, retaining the side identifications. Compose the cusp-collar and surface retractions. This constructs a finite two-term cellular complex for any finite free local system; the open surface is aspherical because its universal cover is `ℍ`.

**Checks.**

- `Γ(3)` has `g=0` and `s=4`; its graph has free fundamental group of rank 3.
- A genus-one surface with one puncture retracts onto a graph of rank 2.
- A compact closed surface of positive genus has nonzero `H²` and is excluded by `s≥1`; the graph argument cannot be applied to it.

*Needs:* FuchsianOrbifolds Layers 2–4; AlgebraicTopology Stages 1–2 (homotopies, finite cellular chains and the fundamental group).

([Hatcher, Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), Chapter 0, pp.1–5, for deformation retractions and the polygon cell model of an oriented surface; §1.A, Proposition 1A.2, pp.84–85, for the free fundamental group, and §1.B, Example 1B.2, p.88, for the nonclosed-surface graph retract. Removing cusp discs allows the polygon’s two-cell to collapse to the finite spine.)

<a id="s14-10"></a>

### 14.10 Finite generation and localized integral freeness

For a torsion-free congruence modular curve Y and a finite free O-local system L, `H¹(Y,L)` is O-finite. If `H⁰(Y,L/π)_m=0`, the localized group `H¹(Y,L)_m` is O-torsion-free, hence O-free; if in addition the boundary sequence localizes to zero, it equals `H¹_par(Y,L)_m`, and reduction gives `H¹_par(Y,L)_m/πⁿ≅H¹_par(Y,L/πⁿ)_m`. Constant weight-two coefficients satisfy these conditions by the boundary Hecke-support theorem of [§14.9](#s14-9), including when `ℓ` divides the cusp-action order. Higher-weight claims carry the displayed vanishing conditions as hypotheses.

O is a complete DVR finite over `ℤ_ℓ`. Apply IntegralHeckeAndGaloisDeterminants §§2.1–2.2 to the finite commutative Hecke image on the perfect cochain complex: anemic localization is its supplied finite-local-factor idempotent summand, compatible with coefficient change. Commuting operator/root localizations use §2.3 of that supplier.

Use a finite graph deformation retract of the noncompact torsion-free quotient; its two-term cochain complex has finite free terms.

Establish this as follows. Use `modularOpenFiniteGraph` of §14.9a and import twisted cellular cochains. The coefficient sequence `0→L→L→L/π→0` shows `π`-torsion in `H¹` is the image of `H⁰(L/π)`; the localized vanishing kills it. A finite torsion-free module over a DVR is free; graph cohomological dimension one removes `H²` obstructions to reduction. Use the boundary sequence at O and finite levels to identify ordinary and parabolic groups under the stated vanishings.

**Checks.**

- No freeness over the integral Hecke algebra is asserted.
- For `T=O×O` acting on `O²` by coordinate multiplication, the two local-factor projectors select the two coordinate lines and commute with reduction; ordinary localization over a noncomplete coefficient base is outside this contract.
- At level divisible by `ℓ`, or with coarse stabilizers, the displayed geometric and vanishing hypotheses must be checked afresh.

*Needs:* IntegralHeckeAndGaloisDeterminants §§2.1–2.3 (finite Hecke images and commuting idempotent/operator summands); [§14.9a](#s14-9a) (`modularOpenFiniteGraph`); [§14.3](#s14-3); [§14.9](#s14-9); [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality); [FuchsianOrbifolds Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups).

([Taylor–Wiles](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Proof of Proposition 1, author pp. 7–8; [Deligne, Séminaire Bourbaki 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), Definition 3.9 and (3.20), pp. 154–155, 159–160.)

<a id="s14-11"></a>

### 14.11 Parabolic Poincaré pairing

The elliptic cup product `L⊗L→A(−1)` induces a coefficient pairing on `V=Sym^r` L with values in `A(−r)`. It is perfect for `A=K=Frac(O)`; for `A=O` or `O/πⁿ` assume r! is a unit. Fix its induced identification `V≃V^∨(−r)`. Ordinary evaluation and the curve trace first pair `H¹_c(Y,V)` with `H¹(Y,V^∨(−r))` into `A(−r−1)`. Their common parabolic image inherits the natural cup pairing B, alternating for even r and symmetric for odd r; over K it is nondegenerate.

Use anemic correspondences away from `Nℓ`, including diamonds and inverse correspondences. On the paired perfect support/ordinary complexes, take their common finite commutative O-Hecke image T, retaining the coefficient dual identification. Reversing the legs and transposing the coefficient map defines an O-algebra involution `†` on T: `B(tx,y)=B(x,t†y)`. This is the specialization of inverse-double-coset duality, with the coefficient map transported through `V≃V^∨(−r)`; it is not defined by declaring every T self-adjoint. In weight two it gives `D_d†=D_d⁻¹` and `T_q†=D_q⁻¹T_q` for `q∤Nℓ`, as in §14.7. Define `m†={t∈T : t†∈m}` for a maximal ideal m. This ideal is Mathlib's `Ideal.comap` along the inverse adjoint ring equivalence; for an involution this is the displayed formula. Maximality and `(m†)†=m` follow from the ring equivalence.

Put `M_A=H¹_par(Y,V_A)`. For integral perfection require the hypotheses of §14.10 on **both** V at m and `V^∨(−r)` at `m†`: `H⁰` modulo `π` vanishes, and the boundary complexes vanish at O and at every `O/πⁿ`. In particular both support maps are isomorphisms after localization, both degree-one lattices are O-free, and both commute with reduction. Then the actual pairing

`M_O,m × M_O,m† → O(−r−1)`

is perfect, and its reduction is the perfect pairing `M_(O/πⁿ),m × M_(O/πⁿ),m† → (O/πⁿ)(−r−1)`. The second factor uses the displayed coefficient-dual identification and its transported Hecke action. A pairing of a summand with itself is asserted only when `m=m†`. This natural pairing is separate from the Fricke-transported pairing of §14.7.

At `r=0`, the boundary Hecke-support theorem of §14.9 supplies both sets of vanishings when m and `m†` are non-Eisenstein; no semisimplicity of the cusp action is required.

Establish this as follows. Symmetrize products of the rank-two elliptic pairing, with r! inverted for integral coefficients. Apply Betti Poincaré–Lefschetz duality on §14.4a’s finite pair and finite étale curve duality, and compare their traces. The O-adic pairing is the finite-model pairing transported through §14.4a’s derived-limit comparison; the K-pairing is its scalar extension. Duality on the paired complexes identifies the kernels of the correspondence actions under leg reversal, so `†` descends to their common image and is involutive by biduality. It identifies the support triangle with its dual triangle, including the connecting signs. Apply the finite-local-factor/idempotent interface of IntegralHeckeAndGaloisDeterminants §2.2: `B(e_m x,y)=B(x,e_(m†)y)`, so distinct unpaired summands are orthogonal. Under the two sets of vanishing hypotheses, derived duality restricts to a duality of free degree-one modules. Prove that the projectors, support maps, coefficient reductions and the comparisons of §14.4 commute with this duality; retain the Tate twist in étale realization. The cup sign is `(−1)^(r+1)`. At `ℓ≤r`, no integral perfection follows from the rational theorem without a separately compared divided-power lattice.

**Checks.**

- `r=0` gives an alternating global curve pairing; `r=1` gives a symmetric global pairing. On individual summands the sign compares the `m,m†` pairing with the reversed `m†,m` pairing.
- For `r=0` and a residual diamond character `χ` with `χ(d)²−1` a unit, B vanishes on the `χ×χ` block: invariance under `D_d` on both factors gives `(χ(d)²−1)B=0`. Its potentially perfect partner has character `χ⁻¹`.
- Over `𝔽₇`, `χ(d)=2` has order 3, `χ(d)⁻¹=4` and `χ(d)²−1=3` is a unit. The same-character restriction is zero; evaluation xy pairs the 2- and 4-character lines perfectly since `2·4=1`.
- If m is adjoint-stable the pairing is perfect on `M_m` with itself under the same two-sided hypotheses; adjoint stability is an additional condition.
- A rationally perfect pairing whose determinant is divisible by `ℓ` is not an integral acceptance case.

*Needs:* [§14.1](#s14-1); [§14.4](#s14-4); [§14.7](#s14-7); [§14.8](#s14-8); [§14.9](#s14-9); [§14.10](#s14-10); `EtaleCohomologyFoundations §0.11/ClassicalAlgebraic.curveDuality`; AlgebraicTopology Stage 6; ArithmeticLocallySymmetricSpaces §§ALS.5a.3–ALS.5a.5 (paired support duality and adjoint transport); IntegralHeckeAndGaloisDeterminants §2.2 (finite local factors and idempotent summands).

([Deligne, Séminaire Bourbaki 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), (3.20), pp.159–160, for the rational pairing and its sign; [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Conrad’s Appendix, Corollary 5.3, p.66, for the inverse-diamond adjoint; [ACC+23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Corollary 2.2.22, p.932, for duality and Hecke adjoints, specialized through ALS.5a.)

<a id="s14-12"></a>

### 14.12 Modular symbols and the geometric lattice

For the torsion-free congruence quotient `Y_an`, use a compact oriented surface B with boundary circles obtained by truncating its cusp ends; its interior is `Y_an` and `B≃Y_an`. Extend the local system `L_r` and its coefficient dual to B via this homotopy equivalence. Compare the imported homological Manin-symbol module with `H₁(B,∂B;L_r^∨)`, after fixing the standard-versus-relative-`H¹` representation convention. Its boundary lands in `H₀(∂B;L_r^∨)`, whose cusp terms are monodromy coinvariants. The cuspidal kernel modulo torsion gives the dual parabolic cohomological lattice rationally, and integrally only with the stated comparison, saturation and perfectness hypotheses. For `r=0` the constant-coefficient comparison recovers `H₁(X_an,D;A)`. Integration is a functional on symbols and Hecke acts on the dual by transpose.

The symbol lattice is the existing coinvariants of `Div⁰(P¹(Q))⊗Sym^r(ℤ²)`, not a second definition of that object.

Integral conclusions use the local coefficient dual and saturation; the whole symbol module contains boundary and may contain torsion.

For `r>0` cusp monodromy can be nontrivial, so `L_r` need not extend as a local system across the collapsed cusps of `X_an`. The pair `(X_an,D;L_r)` is not used in that case.

Establish this as follows. Use cusp collars to construct B and the coefficient extension; import relative chains and manifold duality from AlgebraicTopology Stages `2/6`. Fix the explicit equivariant identification of the standard symbol coefficient representation with the appropriate dual of the geometric relative `H¹` lattice, including determinant twists. Send each symbol to its geodesic relative chain, and compare Manin relations and cusp coinvariants. The precise integral presentation comparison is the integral Manin/geodesic comparison, which is part of this target. Use the boundary long exact sequence and duality on B to pass from the cuspidal homological kernel to the parabolic image. Retain torsion, saturation and the coefficient dual. Match integration and Hecke pull-push with the existing period functional. Deligne supplies the rational cohomological realization, not an integral Manin-presentation theorem.

**Checks.**

- The period map lands in the dual of symbols, as ModularForms Layer 8 requires.
- The boundary quotient is not erroneously retained as part of compact `H¹`.

*Needs:* [§14.11](#s14-11); [ModularForms Layer 8](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields); [AlgebraicTopology Stage 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology); [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality).

([Deligne, Séminaire Bourbaki 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §3.11, p. 156 and (3.20), pp. 159–160; [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Theorems 5.1–5.2, pp. 65–66; [Funke–Millson](https://arxiv.org/pdf/1108.5309), §2, p. 8; Lemma 3.8 and Remark 3.9, p. 12; Proposition 3.11, p. 13.)

<a id="s14-13"></a>

### 14.13 The actual Jacobian Tate realization

For `J=Pic⁰(X₁(N)/Q)`, the canonical comparison identifies `T_ℓJ` with `H¹_et(X₁(N)_Q̄,ℤ_ℓ(1))` and with the dual of untwisted `H¹`, using the principal polarization; equivalently `T_ℓJ` is integral first homology after Betti comparison. The comparison is functorial for Picard and Albanese actions, which are adjoint rather than identical. After tensoring `Q_ℓ` it intertwines the two Hecke conventions. The rank-two consequence is proved in [§14.14](#s14-14) using this comparison; it is not an input to the comparison itself.

This comparison precedes rank-two freeness. The initial Tate carrier and functoriality from Layer 13 must not depend on [§14.14](#s14-14).

Establish this as follows. Specialize the common Kummer/trace API `jacobianTateModule_kummer` and `jacobianTateModule_trace` of §13.5 to `X₁(N)`, including its comparison of cup and Weil pairings. Use polarization to relate Picard pullback to Albanese norm; apply the integral comparison on the Betti side.

**Checks.**

- A Tate twist or a dual cannot be omitted when comparing `T_ℓJ` with untwisted `H¹`.
- The comparison supplies the actual Jacobian module, not an abstract module declared free by definition.
- With Conrad’s Weil-pairing convention, the diagram comparing cup and Weil pairings anticommutes (§5.1, p. 69). Preserve that sign; it does not change the resulting adjoints.

*Needs:* [§13.4](#s13-4); [§13.5](#s13-5); [§14.4](#s14-4); `AbelianSchemesAndArithmeticModuli §A4`; [JacobianChallenge Layer F](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property); `EtaleCohomologyFoundations §0.11/ClassicalAlgebraic.curveDuality`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §5.1, (5.4) and Theorem 5.8, pp. 68–69; Corollary 5.9, pp. 69–70.)

<a id="s14-14"></a>

### 14.14 `H¹` is free of rank two over the Hecke algebra

`H¹(X₁(N)^an, ℚ)` is free of rank 2 over `ℚ ⊗ T₁(N)`, and `Hom_ℚ(ℚ ⊗ T₁(N), ℚ)` is free of rank 1 (`ℚ ⊗ T₁(N)` is Gorenstein). Consequently `V_ℓ(N) = ℚ_ℓ ⊗ T_ℓ(J₁(N))` is free of rank 2 over `ℚ_ℓ ⊗ T₁(N)` for either Hecke action.

Characteristic zero coefficients; integral freeness is not claimed (it can fail at Eisenstein maximal ideals).

Establish this as follows. Use the twisted perfect pairing to identify rational `H¹` with its Q-dual as Hecke modules. Over C, the coefficient pairing `(f,T)↦a₁(Tf)` identifies the dual of `S₂`, rather than `S₂` itself at this point of the proof, with `C⊗T`. The q-expansion principle and faithful Hecke action prove nondegeneracy on both sides. Apply Hodge decomposition to conclude that the dual of `H¹` over C is free of rank two; transfer through self-duality and faithfully flat descent over the semilocal rational Hecke algebra. Once `H¹` is free rank two and self-dual, its two Hecke-dual summands show `Hom_Q(Q⊗T,Q)` is projective of full support. Q-dimension comparison gives rank one, hence freeness over the semilocal ring. Transport to `V_ℓJ` via the initial Tate comparison, preserving the two adjoint Hecke conventions.

**Checks.**

- Integral freeness after localising at a non-Eisenstein maximal ideal in §14.10 is freeness over O. It asserts no integral rank-two freeness over T.
- For `X₁(11)`, the rational Hecke algebra has dimension one and `H¹` has dimension two over `ℚ`.
- This is rational rank-two freeness for the full Hecke algebra of Conrad §5.1, including old blocks; it asserts neither integral Gorensteinness nor integral rank-two freeness at every maximal ideal.

*Needs:* [§14.5](#s14-5); [§14.7](#s14-7); [§14.13](#s14-13); [ModularForms Layer 4](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor); [ModularForms Layer 5](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization); [ModularForms Layer 8](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 69 (printed page; PDF page 73); [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 70 (printed page; PDF page 74).)

<a id="s14-15"></a>

### 14.15 Integral Hecke realization comparison

With upper/lower transpose conventions fixed, identify the same integral image of the abstract Hecke algebra on J, Betti `H¹(C(ℂ),ℤ)`, and `T_ℓJ` for every `ℓ`. Equality of integral kernels uses the faithful Hom/Betti comparison and the supplied `End⊗ℤ_ℓ` injection; equality after tensoring with `ℚ` alone does not identify integral lattices. The additional modular-symbol comparison requires a weight-two cuspidal carrier: the kernel of the boundary map in ModularForms Layer 8’s integral symbol module, with its torsion removed, and its actual integral comparison with compact-curve `H₁` (or the correctly transposed dual `H¹`). The required input is this integral cuspidal comparison; the full symbol module with boundary/Eisenstein classes is not asserted to have the same Hecke kernel. The cotangent/classical-form comparison is the lower action, and the upper action is its adjoint. Normalized coherent weight-two `T_p` comes from the separate local p-divisibility theorem; Jacobian/étale push–pull has no inverse-degree normalization. These compare existing Hecke actions and their image quotients, not a new abstract algebra or a rank-two eigenspace theorem.

For the modular-symbol realization, supply the integral cuspidal-symbol comparison contract of §14.12, preserving diamonds and bad-prime operators; no comparison with the entire uncut symbol module is assumed.

Establish this as follows. Use complex comparison to identify integral Betti and Tate lattices after the required choices, compatibly with both correspondence legs. An endomorphism acting as zero on the lattice is zero by the imported Hom injection, so all integral image kernels coincide. Construct the weight-two cuspidal symbol boundary kernel and remove its torsion. Supply the integral Hecke-equivariant comparison with compact-curve `H₁`, or its correctly transposed dual `H¹`, with diamonds and bad-prime operators. This is the required integral comparison, not a consequence of Layer 8’s form-side quotient. Then equality of integral kernels follows from the comparison; boundary/Eisenstein symbols never enter this equality.

**Checks.**

- For degree `p+1` with `ℓ∣p+1` the same-leg norm–pull still acts as `[p+1]` in every realization.
- A rationally isomorphic but index-2 different Hecke lattice is not accepted as this integral comparison.
- At `Γ₁(5)`, the compact curve has genus zero but the full weight-two symbol module has nonzero boundary classes (four cusps). The unit acts nontrivially on these symbols and trivially on the zero Jacobian; their integral image kernels differ. Cut to the cuspidal carrier before comparing.

*Needs:* [§14.12](#s14-12); [§14.13](#s14-13); [§9.11](#s9-11); [§9.12](#s9-12); [§10.2](#s10-2); [§13.3](#s13-3); [§13.5](#s13-5); [§13.6](#s13-6); [ModularForms Layer 8](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 5 §5.1, pp.65–69; §5.2, pp.71–72; [Conrad, generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), §4.5, pp.46–48.)

### Examples

For constant coefficients on `G_m(ℂ)`, ordinary `H¹` is `ℤ` but the parabolic image is zero. For the compact genus-one `X₀(11)`, constant integral `H¹` has rank two. Weight 2 gives `Sym⁰` of rank one and weight 3 gives `Sym¹` of rank two with nontrivial elliptic monodromy. At `ℓ≤r` the denominators in symmetrization cannot be dismissed; the rational perfect pairing does not establish an integral unimodular one.

### Dependencies

Use Layers 3 and 4, Layer 7, Layer 9, Layer 10, Layer 13. External contracts: AbelianSchemesAndArithmeticModuli, EtaleCohomologyFoundations §§0.7–0.11 and F.1–F.4, and ComplexComparisonPartII §§C6.3–C6.6. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 15: Ihara theorems and change of level

<a id="s15-1"></a>

### 15.1 The two geometric degeneracy pullbacks

For `Γ=Γ₁(N)` and p prime with `p∤N`, put `Γ′=Γ₁(N)∩Γ₀(p)`; both maps `δ₁,δ_p:X_Γ′→X_Γ` come from the moduli correspondence. With the specified isogeny coefficient maps, define `d_p(x,y)=δ₁^*x+δ_p^*y` on the compact, ordinary, compact-support or parabolic cohomology groups where those maps are defined. On ordinary group characters the kernel equation is equally expressed by `D_p(ψ,φ)=ψ|_{Γ′}−φ∘(g↦AgA⁻¹)`, `A=diag(p,1)`, after negating the second summand. This sign change is recorded, not treated as a change of level.

Mixed `Γ₁(N)∩Γ₀(p)` is not `Γ₁(Np)`.

Coefficients O or `O/πⁿ`; constant coefficients for the integral compact Ihara result, `Sym^r` only with explicitly checked coefficient maps.

Establish this as follows. Import `δ₁,δ_p` from Layer 9, Layer 10 and their coefficient maps from Layer 14. Form the coprod of the actual two pullbacks; prove the support squares and common anemic Hecke equivariance. Identify conjugation by A with the second analytic level map; negation of one source copy relates sum and difference conventions.

Use Mathlib's `LinearMap.coprod` for the two geometric pullbacks `a,b:H→H′`: it sends `(x,y)` to `a(x)+b(y)`, and its restrictions to the two source inclusions are a and b. It intertwines the product Hecke action when both pullbacks intertwine the same anemic operators. Negating the second source converts the sum convention into the ordinary restriction-difference convention.

**Checks.**

- With `a=id` and `b=0` on O, `(3,5)` maps to 3.
- With `a=b=id` on O, `(1,−1)` is in the kernel; injection is a geometric theorem, not a generic property of coprods.
- Two zero maps give the zero map.
- Postcomposing by c gives the coprod of `c∘a` and `c∘b`.
- Away from Np the map commutes with `T_q` and diamonds.
- Do not substitute a map to `Γ₁(Np)` unless the extra covering and its torsion are explicitly handled.

*Needs:* [§9.1](#s9-1); [§9.12](#s9-12); [§13.5](#s13-5); [§14.8](#s14-8); Mathlib `LinearMap.coprod`.

([Congruence relations between modular forms](https://math.berkeley.edu/~ribet/Articles/icm.pdf), §3, pp. 507–508; §4, pp. 510–513; [Calegari–Dimitrov–Tang](https://arxiv.org/pdf/2109.09040), §4.6, Lemma 4.6.2, p. 33.)

<a id="s15-2"></a>

### 15.2 The principal-level `SL₂` amalgam

The arithmetic calculation uses the following action theorem: a group acting on a tree without inversions, with one edge as a fundamental domain, is the amalgam of its two vertex stabilizers over the edge stabilizer (Serre, Trees I §4.1, Theorem 6, p.48). The required modular input is to show that the indicated principal-level subgroup has this fundamental edge and exactly the specified finite-congruence vertex and edge stabilizers. The local `SL₂(ℚ_p)` amalgam alone does not identify those arithmetic stabilizers.

For `N≥3` and prime `p∤N`, let `Γ_N(R)=ker(SL₂(R)→SL₂(ℤ/N))` for `R=ℤ[1/p]`, and `Γ(N)=Γ_N(ℤ)`. The natural inclusions and conjugation by `A=diag(p,1)` identify `Γ_N(ℤ[1/p])` with `Γ(N)*_{Γ(N)∩Γ₀(p)}A⁻¹Γ(N)A`. The associated `SL₂(Q_p)` lattice tree has a fundamental edge with these vertex and edge stabilizers; the action preserves vertex type. The central quotient or signed `Γ(N)` variant must be changed consistently throughout the presentation.

p and N are coprime; A is invertible over `ℤ[1/p]` and conjugates preserve reduction level because p is a unit modulo N.

The tree vertices are homothety classes of rank-two `ℤ_p` lattices; adjacent representatives have quotient of order p.

Establish this as follows. Use ReductiveGroupsPartII §RG2.2.4’s `BTTree.Vertex`, `BTTree.Adj`, `BTTree.tree`, `BTTree.isTree` and its type-preserving `SL₂` action. Compute the arithmetic intersections of the two local vertex stabilizers and their edge stabilizer. Use strong approximation/density, together with surjectivity of reductions prime to p, to show the principal congruence arithmetic group has that edge as fundamental domain. Apply the tree presentation, retaining the two distinct embeddings of the edge subgroup.

**Checks.**

- At `N=3,p=2`, reduction of `Γ(3)` modulo 2 is `SL₂(𝔽₂)`; `Γ(3)∩Γ₀(2)` has index three, the number of neighbours of the standard vertex.
- At `p|N` the statement is not asserted.
- An unrestricted `PGL₂` action that exchanges vertex types does not have this same amalgam.

*Needs:* Mathlib `groupCohomology.H1`; `ReductiveGroupsPartII §RG2.2/sl2-tree`; `ReductiveGroupsPartII §RG2.2/ihara-amalgam`; `AdelicAlgebraicGroups §AA.4/strong-approximation-sufficiency`; Tau Ceti `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`.

([Serre, Trees](https://www.numdam.org/item/AST_1983__46__1_0.pdf), II §1.4, Theorem 3 and Corollary 2, p. 110; [Calegari–Dimitrov–Tang](https://arxiv.org/pdf/2109.09040), §4.4, pp. 27–28; proof of Lemma 4.6.2, pp. 33–34.)

<a id="s15-3"></a>

### 15.3 Congruence subgroup property of `SL₂(ℤ[1/p])`

The proof input includes the central congruence-kernel/Mennicke-symbol calculation and its Moore and class-field-theory comparison from Serre’s proof. They are part of this target, with the real-place specialization used here. Class field theory is the existing Tau Ceti ClassFieldTheory roadmap; a general profinite action theorem supplies neither the central-extension calculation nor the arithmetic congruence kernel.

For a prime p every finite-index subgroup H of `SL₂(ℤ[1/p])` contains `ker(SL₂(ℤ[1/p])→SL₂(ℤ/m))` for some positive m coprime to p. The same conclusion, intersected with `Γ_N(ℤ[1/p])`, holds for every finite-index subgroup of that principal-level group. This is the split real S-arithmetic specialization of Serre’s congruence kernel theorem, with `S={∞,p}`; it is not a statement about all finite-index subgroups of `SL₂(ℤ)`.

Serre’s condition `|S|≥2` and the real-place alternative both hold. The statement `sArithmetic_congruenceSubgroupProperty` in [Suggested.lean](Suggested.lean) uses Mathlib's localization at p and reduction modulo the ideal `(m)`, whose quotient is `ℤ/m` when m is coprime to p.

The proof uses the specific S-arithmetic congruence kernel theorem; its deeper central-extension input is the Mennicke-symbol and Moore comparison specified above, with the real-place specialization.

Establish this as follows. Apply Serre §2.6 Theorem 2 and Corollary 3 with Q and `S={∞,p}`. Translate the trivial congruence kernel into the stated finite-index containment. A finite-index subgroup of `Γ_N` is also finite index in `SL₂(ℤ[1/p])`; intersect the congruence kernel with `Γ_N`.

**Checks.**

- Finite characters of `Γ_N(ℤ[1/p])` factor through a finite congruence quotient.
- The conclusion is not derived from mere density of the group in `SL₂(Q_p)`.

*Needs:* [§15.2](#s15-2).

([Serre, congruence problem](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf), §2.6, Theorem 2 and Corollary 3, pp. 498–500; [Calegari–Dimitrov–Tang](https://arxiv.org/pdf/2109.09040), Proof of Lemma 4.6.2, p. 34.)

<a id="s15-4"></a>

### 15.4 Lyndon sequence for the modular amalgam

For the actual amalgam `G=G₁*_{H}G₂` of [§15.2](#s15-2) and a G-module M, there is a natural exact sequence `…→H^i(G,M)→H^i(G₁,M)⊕H^i(G₂,M)→H^i(H,M)→H^{i+1}(G,M)→…`, with the middle map the difference of restrictions along the two embeddings. At `i=0` it begins with invariants. The same sequence is equivariant for double-coset maps that preserve the diagram, using restriction and transfer with the displayed coefficient actions.

M is an actual representation of the amalgam; the two restricted modules on H are identified through that representation.

The degree of the first displayed group is i, not `i−1`.

Establish this as follows. Use the cellular chain sequence of the contractible tree: `0→ℤ[G/H]→ℤ[G/G₁]⊕ℤ[G/G₂]→ℤ→0`. Apply a group-cohomology resolution, Shapiro and the connecting morphisms, or equivalent classifying-space Mayer–Vietoris. Construct correspondence maps on this chain sequence to obtain the equivariance required for the normalized `U_p²` argument. Apply Mathlib groupCohomology.coindIso for Shapiro; the new work is its compatibility with the tree cochain sequence or finite diamond cover.

**Checks.**

- `H⁰(G,M)` is the kernel of the difference on vertex invariants.
- For trivial `M=F_q`, an agreeing pair of characters descends to a character of G.

*Needs:* [§15.2](#s15-2); Mathlib `groupCohomology.H1`; [AlgebraicTopology Stage 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology); [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality); Mathlib `groupCohomology.coindIso`; [AlgebraicTopology Stage 5](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent).

([Serre, Trees](https://www.numdam.org/item/AST_1983__46__1_0.pdf), II §2.8, Proposition 13 and example, pp. 168–170; [Calegari–Geraghty](https://arxiv.org/pdf/1207.4224), Lemma 9.6, p. 88 (author preprint).)

<a id="s15-5"></a>

### 15.5 Congruence classes in ordinary `H¹`

For `Γ(N)⊂SL₂(ℤ)`, `N≥3`, and a prime q, identify ordinary `H¹(Γ(N),F_q)` with `Hom(Γ(N),F_q)` for the trivial additive action. Define `H¹_cong` as the subspace of characters `ψ` for which `Γ(M)⊂ker ψ` for some positive M divisible by N. Equivalently it is the directed union of the pullbacks of characters of finite congruence quotients `Γ(N)/Γ(M)`. It is not defined as all ordinary cohomology or as the parabolic subspace.

All principal kernels are taken in `SL₂(ℤ)`, consistently with the chosen signed/central quotient convention.

Establish this as follows. Use the trivial-action `H¹`-to-character comparison. The common refinement `lcm(M₁,M₂)` proves closure under addition and scalar multiplication, giving a submodule. Use quotient descent to prove the finite-congruence-quotient characterization.

The public interface should expose:

- `congruenceClasses`: For the directed family `Γ(M)` inside `Γ(N)`, the submodule of additive characters killing one of these kernels.
- `mem_congruenceClasses`: Membership is equivalent to vanishing on some `Γ(M)`, `N|M`.
- `congruenceClasses_refine`: A character killing `Γ(M)` also kills `Γ(M′)` whenever `M|M′`.
- `congruenceClasses_quotient`: A character killing `Γ(M)` descends uniquely to `Γ(N)/Γ(M)`.
- `congruenceClasses_restrict`: Restriction to a deeper principal subgroup preserves congruence classes.
- `congruenceClasses_H1`: The classifying map is the actual trivial-action `H¹/character` isomorphism.
- `IsCongruenceCharacter` in [Suggested.lean](Suggested.lean): For a character `ψ:Γ(N)→F_q`, the predicate `∃M>0`, `N|M` and `ψ` vanishes on `Γ(M)`; the restriction uses the existing inclusion `Γ(M)⊂Γ(N)`.

**Checks.**

- For positive N the zero character satisfies this predicate with `M=N`.
- The zero character kills every deeper principal subgroup.
- Pulling back a character of `Γ(N)/Γ(M)` gives a member.
- If `ψ` kills `Γ(M₁)` and `φ` kills `Γ(M₂)`, `ψ+φ` kills `Γ(lcm(M₁,M₂))`.
- At `Γ(3)` with `F₅` coefficients the congruence subspace is zero, whereas ordinary `H¹` has dimension three. A nonzero ordinary character is therefore not a congruence class. Use the pro-3 level factor and the perfectness/abelianization of the other `SL₂(Z_p)` factors, as in CDT §4.5, to check the finite congruence quotients.
- The zero character is congruence; every character pulled from `Γ(N)/Γ(M)` is congruence.
- A character known only to have finite image is not thereby proved congruence.

*Needs:* Mathlib `groupCohomology.H1`; Mathlib `CongruenceSubgroup.Gamma`; Mathlib `groupCohomology.H1IsoOfIsTrivial`; Tau Ceti `CongruenceSubgroup.Gamma_le_Gamma_of_dvd`.

([Calegari–Dimitrov–Tang](https://arxiv.org/pdf/2109.09040), §4.5, definition of H¹_cong, pp. 29–30; Lemma 4.6.2, p. 33.)

<a id="s15-6"></a>

### 15.6 Principal-level Ihara modulo congruence classes

For `N≥3` and primes p,q with `p∤N`, the kernel of `D_p:H¹(Γ(N),F_q)²→H¹(Γ(N)∩Γ₀(p),F_q)`, `D_p(ψ,φ)(g)=ψ(g)−φ(AgA⁻¹)`, is contained in `H¹_cong(Γ(N),F_q)²`. There is no requirement `q≠p` in this ordinary character theorem, and no unconditional injectivity assertion. The statement `iharaPrincipal_congruenceKernel` in [Suggested.lean](Suggested.lean) specifies the second restriction by its `diag(p,1)` conjugation formula on rational matrices.

Trivial `F_q` coefficients; ordinary group cohomology, not compact cohomology or an arbitrary `Sym^r` system.

Establish this as follows. An element of the kernel is an agreeing pair of additive characters for the amalgam, so it extends to a character of `Γ_N(ℤ[1/p])`. Its image is finite. Apply [§15.3](#s15-3) to its kernel. Restrict the resulting congruence factorization back to each integral vertex subgroup; both original characters lie in `H¹_cong`.

**Checks.**

- Kernel zero follows only after independently killing the congruence subspaces in the chosen quotient/localization.
- The `q=p` case is covered by this character argument, not by `ℓ`-adic geometric smoothness.
- At `N=3,p=2,q=5`, `H¹_cong=0` by §15.5, so the restriction difference is injective on ordinary characters.

*Needs:* [§15.1](#s15-1); [§15.3](#s15-3); [§15.4](#s15-4); [§15.5](#s15-5).

([Calegari–Dimitrov–Tang](https://arxiv.org/pdf/2109.09040), Lemma 4.6.2 with proof, pp. 33–34.)

<a id="s15-7"></a>

### 15.7 Compact weight-two Ihara and saturation

For `N≥5` and prime `p∤N`, let X′ be the compact curve of `Γ₁(N)∩Γ₀(p)`. The map `δ₁^*+δ_p^*:H¹(X₁(N),F_ℓ)²→H¹(X′,F_ℓ)` is injective for every prime `ℓ`. Equivalently the sum of the two Jacobian pullbacks `J₁(N)²→Jac(X′)` has trivial kernel (Ribet Corollary 4.2). The corresponding integral `H¹` map has torsion-free cokernel; after O-extension it is saturated and remains injective modulo `πⁿ`. For `Γ₀(N)`, Ribet Theorem 4.3 gives kernel the anti-diagonal Shimura subgroup, not unconditional injectivity; localization away from its Eisenstein support removes that kernel.

The equivalent character statement `compactIhara_characters` in [Suggested.lean](Suggested.lean) uses ordinary characters of `Γ₁(N)` vanishing on every element of trace 2. These are precisely the characters killing the cusp stabilizers for `N≥5`. Agreement on `Γ₁(N)∩Γ₀(p)`, with the second restriction specified by `diag(p,1)` conjugation, forces both characters to be zero at every coefficient prime.

Weight two means constant coefficients. The compact curves are smooth in characteristic zero, so no `ℓ∤N` hypothesis is added to this Betti statement.

The `Γ₀` version needs a supplied Shimura subgroup and its Eisenstein Hecke action; small levels and stabilizers use their actual compact curves.

Establish this as follows. Ribet’s compact homology proof quotients ordinary abelianizations by the subgroups generated by parabolics; the amalgam and CSP show the two-map integral homology map is surjective. Dualize the compact free homology lattices to obtain integral cohomology injection with saturated image. Alternatively use the zero Jacobian kernel of Corollary 4.2 and the Tate comparison; reduce the saturated integral map at every `ℓ`. For `Γ₀` retain the anti-diagonal Shimura kernel of Theorem 4.3 and remove it only under the explicit support hypothesis.

**Checks.**

- This supplies the mixed-level, weight-two cohomological Ihara input of SerreWeightAndLevelOptimisation even when `ℓ|N`.
- It does not supply the exceptional-image or multiplicity-one steps of mod-two level lowering.
- For `N=11,p=2`, the source compact rank is `2·2=4`, and its image in the mixed level has saturated rank four.

*Needs:* [§13.1](#s13-1); [§13.5](#s13-5); [§14.13](#s14-13); [§15.1](#s15-1); [§15.2](#s15-2); [§15.3](#s15-3).

([Congruence relations between modular forms](https://math.berkeley.edu/~ribet/Articles/icm.pdf), Theorem 4.1, Corollary 4.2 and Theorem 4.3, pp. 510–513.)

<a id="s15-8"></a>

### 15.8 Taylor–Wiles degeneracy control

For constant coefficients `O/πⁿ`, odd residue characteristic `ℓ`, torsion-free modular level `Γ` with `p∤Nℓ`, assume that the localized base-level and `Γ₀(p)`-level coefficient complexes have actual trivial central/diamond action over `O/πⁿ` (in particular `D_p=1`). Let the residual eigensystem have cyclotomic determinant, with `p≡1` mod `ℓ` and residual old roots `α,β` satisfying `αβ=1` and `α≠β`. Then the two degeneracy images identify `H^i(Y,O/πⁿ)_m²` with the sum of the two selected old-root factors in `H^i(Y₀(p),O/πⁿ)`. Localization additionally at `U_p−α` identifies its factor with one copy of `H^i(Y,O/πⁿ)_m`. This is the trivial-integral-character restriction of CG Lemma 9.6, with unmodified trace. Residual cyclotomic determinant alone does not supply the integral-character hypothesis.

`α,β∉{1,−1}` follows from odd `ℓ` and `αβ=1`, `α≠β`.

The full anemic localized target is not asserted to have no additional `U_p=±1` factors; those are killed in the selected `U_p²−1` localization.

Establish this as follows. With the upper-right entry `T_p`, the general `trace∘pullback` matrix is `[[p+1,T_p],[D_p⁻¹T_p,p+1]]`, by §14.11. Its determinant is `(p+1)²−D_p⁻¹T_p²`; the old-root polynomial is `X²−T_pX+pD_p`. Under the actual trivial-action hypothesis these specialize to the symmetric matrix and `X²−T_pX+p`. The residual determinant is `4−(α+β)²=−(α−β)²≠0`, so the norm matrix is invertible over the localized finite coefficient algebra. Use the correctly graded Lyndon sequence: the normalized double-coset operator for `diag(p,p⁻¹)` acts as identity on the amalgam terms. Localize at `U_p²−1` to remove both adjacent amalgam terms and identify the two-copy old factors. Apply the idempotent for the distinct roots and descend across any elementary two-group component quotient, whose order is invertible.

**Checks.**

- The repeated-root case `α=β` is excluded.
- Let `O=ℤ₇[ζ₇]`, `π=ζ₇−1` and `n≥2`, with `D_p` acting by `ζ₇`, `p=29` and `T_p=6`. The general norm matrix has lower-left entry `6ζ₇⁻¹≠6` in `O/πⁿ`, and determinant `900−36ζ₇⁻¹`, rather than 864. Modulo `π` the roots are 2,4 and the determinant is `3∈𝔽₇`, a unit. This block satisfies the residual conditions but is excluded by the actual trivial-action hypothesis.
- In the finite ring `ℤ/49`, `d=8` has order 7, inverse 43 and residue 1 in `𝔽₇`. The general matrix [[30,6],[43·6,30]] has determinant 38, while the symmetric matrix has determinant 31; both reduce to 3. This tests the general matrix before reduction independently of the restricted geometric theorem.
- At `D_p=1` the general determinant recovers the symmetric determinant, and the old polynomial specializes to `X²−T_pX+p`.
- The proof cannot use exact invariants for a quotient whose order is divisible by `ℓ`.

*Needs:* [§14.10](#s14-10); [§14.11](#s14-11); [§15.1](#s15-1); [§15.4](#s15-4).

([Calegari–Geraghty](https://arxiv.org/pdf/1207.4224), Lemma 9.6 and Remarks 9.7–9.8, pp. 88–90.)

<a id="s15-9"></a>

### 15.9 Congruence invariance of ordinary characters

The intermediate cohomological input consists of continuous cohomology of the relevant `SL₂(ℤ_p)` groups, the Künneth and Hochschild–Serre restriction maps, Lazard’s uniform-group calculation, adjoint-cohomology vanishing, and an exact reproducible level-8/16 computation in coefficient characteristic 2. The finite-group `H¹` carrier and the existence of character spaces do not provide these restriction and invariant calculations.

For `N≥3`, prime q and `η∈H¹(Γ(N),F_q)`, let `SL₂(Z/N)` act by the conjugations of ambient `SL₂(Z)`. If `gη−η` belongs to `H¹_cong(Γ(N),F_q)` for every `g∈SL₂(Z/N)`, then `η` itself belongs to `H¹_cong`. Equivalently, the direct limit of ordinary `H¹` over principal levels, with restriction transition maps, has no `SL₂(Ẑ)`-invariants. This direct-limit character input is the specific prerequisite of [§15.10](#s15-10), not a result of the completed-cohomology roadmap.

The statement `congruenceClasses_invariant` in [Suggested.lean](Suggested.lean) uses all ambient `SL₂(ℤ)` conjugations. The action factors through the finite quotient because inner conjugation acts trivially on trivial-coefficient `H¹`.

The coefficient prime may be 2 or 3; the proof retains the exceptional small-prime calculations.

Establish this as follows. Pass to the restriction direct limit; its kernel from a finite level consists exactly of the congruence classes, and the hypothesis makes the image invariant. Follow CDT §§4.5.4–4.5.9: finite `SL₂` homology, continuous cohomology of `SL₂(Z_p)`, Künneth and Hochschild–Serre isolate coefficient primes 2,3,5 and show the relevant `H²` restriction vanishes at deeper levels. Use the genus-zero cusp representation at levels 3 and 5 with coefficients `F₃` and `F₅` respectively; at coefficient prime 2 use the level-8 to level-16 calculation. Lemma 4.5.11’s printed `F₃` at level 5 is replaced by `F₅`, as required in its application. Apply the two five-term sequences of (4.5.10) and the corrected finite-level invariant computations to kill the invariant limit class. The level-8/16 restriction and invariant calculation and the Lazard/adjoint-cohomology inputs must be proved in the precise continuous-cohomology setting specified above.

**Checks.**

- The condition must hold for every ambient finite-quotient conjugation, not just one level-changing element.
- An arbitrary noncongruence character cannot be declared congruence just because its codomain is finite.
- For a nonzero `Γ(3)→F₅` character, some ambient conjugation difference is noncongruence; the criterion therefore does not kill all ordinary characters.

*Needs:* [§15.5](#s15-5); Mathlib `groupCohomology.H1`.

([Calegari–Dimitrov–Tang](https://arxiv.org/pdf/2109.09040), Theorem 4.5.2 and Corollary 4.5.3, p. 29; Lemmas 4.5.4–4.5.11 and proof, pp. 30–32.)

<a id="s15-10"></a>

### 15.10 The enhanced principal-level kernel bound

With N,p,q as in [§15.6](#s15-6), the kernel of the same restriction difference into `H¹(Γ(N)∩Γ₁(p),F_q)` is also contained in `H¹_cong(Γ(N),F_q)²`. The congruence-invariance criterion of [§15.9](#s15-9) used here says that if every conjugation difference for a character of a principal subgroup is congruence, then the character itself is congruence, as in CDT Corollary 4.5.3 with the `SL₂(Z/N)`-action induced by ambient `SL₂(ℤ)` conjugations.

The statement in [Suggested.lean](Suggested.lean) is `iharaPrincipalGamma1_congruenceKernel`, with its second restriction specified by the same rational-matrix conjugation formula. This is still trivial-coefficient ordinary `H¹` and still a kernel bound, not automatic injectivity.

Establish this as follows. Restriction to `Γ(N)∩Γ₁(p)` implies that the disagreement on `Γ(N)∩Γ₀(p)` is a congruence class because the quotient of these two groups is congruence. Follow the ambient conjugations in CDT Lemma 4.6.3 and apply Corollary 4.5.3 to the two source characters. Use the principal-level kernel bound after the congruence error is removed.

**Checks.**

- The enhancement is not proved by treating restriction across a finite quotient as injective when q divides its order.
- The case `q=p` remains in the statement.
- For `N=3,p=11,q=5`, the intermediate diamond quotient has order ten, divisible by q; the kernel bound still holds, and §15.5 makes the source congruence subspace zero.

*Needs:* [§15.5](#s15-5); [§15.6](#s15-6); [§15.9](#s15-9).

([Calegari–Dimitrov–Tang](https://arxiv.org/pdf/2109.09040), Corollary 4.5.3, p. 29; Lemma 4.6.3, p. 34.)

### Examples

For `Γ(3)`, ordinary mod-5 `H¹` has dimension three whereas its congruence-class subspace is zero; the ordinary principal kernel statement still names that subspace at every coefficient prime. At level 5 over `F₃` the 12-cusp permutation module has an invariant constant vector in the augmentation kernel because `12=0` in `F₃`. This detects the printed `F₃` coefficient in CDT Lemma 4.5.11; the intended level-5 calculation is over `F₅`. The matrix `[[p+1,T_p],[T_p,p+1]]` has determinant `(p+1)²−T_p²`. Reversing its sign preserves invertibility, whereas shifting the Lyndon connecting degree does not preserve exactness.

### Dependencies

Use Layer 9, Layer 13, Layer 14. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 16: Weight-two modular abelian quotients

<a id="s16-1"></a>

### 16.1 The Hecke prime and coefficient field of a newform

For a normalized cuspidal newform f of weight exactly two and primitive level N, import its coefficient field `K_f` from ModularForms Layers `8/8G`. The geometric Hecke action gives the eigenvalue character `λ_f:T₁(N)→K_f`. Set `p_f=ker λ_f`; it is a minimal prime and `(T₁(N)/p_f)⊗Q≅K_f`. Coefficient fields, integrality of eigenvalues and the notion of newform are imports, not definitions of this layer.

f a normalised newform of weight 2 and level exactly N (Tau Ceti ModularForms Layer 4).

Establish this as follows. The eigenvalue map `T₁(N) → ℂ` has image the order `ℤ[a_n(f)] ⊂ K_f`; its kernel is prime. The integral Hecke algebra is finite and torsion-free over `ℤ`. Localizing at `ℤ ∖ {0}` makes it a finite-dimensional commutative `ℚ`-algebra, hence Artinian; every prime there is minimal. Since `λ_f` has characteristic-zero image, `p_f` is disjoint from `ℤ ∖ {0}`, and contraction of that minimal prime is minimal. This does not assume the full old-level Hecke algebra is reduced.

Use Mathlib's `RingHom.ker` for the geometric eigenvalue character. Membership means `λ_f(t)=0`, and the field target makes the kernel prime. The integral quotient is canonically its image eigenvalue order by `RingHom.quotientKerEquivRange`; after rationalization it is `K_f`. The integral image need not be the maximal order. Postcomposition with a field embedding preserves the kernel.

**Checks.**

- The kernel of `ℤ→ℚ` is zero.
- For the first projection `ℚ×ℚ→ℚ`, the kernel is `{0}×ℚ`.
- An injective field embedding on the target preserves the kernel.
- Weak multiplicity one gives `a_n(f) ∈ K_f` for all n.

*Needs:* [§13.3](#s13-3); [ModularForms Layer 4](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor); [ModularForms Layer 8](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields); [ModularForms Layer 8G](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality); Mathlib `RingHom.ker`; Mathlib `RingHom.quotientKerEquivRange`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77); [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77).)

<a id="s16-2"></a>

### 16.2 The modular abelian variety `A_f`

With the Albanese Hecke action on `J₁(N)`, let `B_f` be the connected abelian subvariety generated by all images `t(J₁(N))`, `t∈p_f`. Define `A_f=J₁(N)/B_f` over Q with its surjective quotient map `q_f`. It has good reduction outside N and an action of the order `T₁(N)/p_f`; the `K_f` action is in `End⁰(A_f)`. This is a quotient by an actual abelian subvariety, not a pointwise module quotient or an assumed Galois representation.

`N ≥ 5` (for `N < 5`, `S₂(Γ₁(N)) = 0`).

Conrad Definition 5.13 uses the Albanese action `( )_*` on `J₁(N)` of the `(E,P)` model. A Picard-action quotient must be separately constructed and transported by `w_ζ` over a field containing `ζ`. Neither the action nor the moduli model is silently changed on the same quotient.

Establish this as follows. Use the actual Albanese action to form the connected abelian subvariety generated by `t(J₁(N))`, `t∈p_f`; finite ideal generators suffice. Construct the quotient by the abelian subvariety `B_f` here: Poincaré complete reducibility (AbelianSchemesAndArithmeticModuli A6.5) gives a complement C with `B_f×C→J₁(N)` an isogeny, and the projection induces `J₁(N)→C/(B_f∩C)`, a quotient by a finite subgroup scheme (A3.3), with kernel `B_f` and the universal property of the quotient; its formation commutes with field extension. `A_f` has good reduction outside N by the Néron–Ogg–Shafarevich criterion (NeronModelsAndSemistableAbelianVarieties §5.1): `V_ℓ(A_f)` is a quotient of `V_ℓ(J₁(N))`, which is unramified at every `p∤Nℓ`. Finite-flat-kernel quotients alone do not give this positive-dimensional quotient.

The public interface should expose:

- `modularQuotient`: The actual abelian variety `J₁(N)/B_f`, using the Albanese action.
- `modularQuotient_map`: The surjective Q-homomorphism `q_f:J₁(N)→A_f` with connected kernel `B_f`.
- `modularQuotient_kills`: `q_f∘t=0` for every `t∈p_f`.
- `modularQuotient_lift`: A homomorphism `h:J₁(N)→B` killing all `p_f` images descends uniquely through `q_f`.
- `modularQuotient_baseChange`: Formation and the quotient map commute with field extension.
- `modularQuotient_hecke`: The quotient order acts faithfully in characteristic zero; the induced rational action is `K_f` in `End⁰(A_f)`.
- `abelianSubvarietyQuotient`: For an abelian subvariety B of an abelian variety A over a field of characteristic zero, the quotient `A→A/B` with kernel B and its universal property, constructed from a Poincaré complement.
- `modularQuotientForIdeal`: For any ideal I of the supplied acting modular Hecke algebra, form the connected subvariety generated by its Albanese images and take `abelianSubvarietyQuotient`. modularQuotient f is this modular specialization at `I=p_f`.
- `modularQuotient_lift_map`: The descended homomorphism composed with `q_f` equals the original h.
- `modularQuotient_hom_ext`: Two homomorphisms out of `A_f` agree when their compositions with the surjective `q_f` agree.

**Checks.**

- The modularQuotientForIdeal quotient attached to the zero ideal of an acting algebra is the supplied Jacobian itself.
- The modularQuotientForIdeal quotient for the unit ideal is the zero abelian variety; this tests the image-generated-kernel convention.
- For the rational weight-two newform of level 11 and trivial character, the `J₀(11)` quotient has dimension one.
- No Jacobian quotient is defined for a weight-12 level-one newform by this constructor.
- `A_f` is nonzero when f exists ([§16.4](#s16-4)).
- Do not assert a quotient of a modular-curve Jacobian for weight `> 2`.

*Needs:* [§13.1](#s13-1); [§13.2](#s13-2); [§13.3](#s13-3); [§16.1](#s16-1); `AbelianSchemesAndArithmeticModuli` A6.5 (`poincareReducibility`) and A3.3; `NeronModelsAndSemistableAbelianVarieties` §5.1; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77); [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77); [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 2, §2.3.1.2, p. 29 (printed; PDF page 33).)

<a id="s16-3"></a>

### 16.3 Tate module of the actual modular quotient

For the actual quotient `q_f:J₁(N)→A_f`, the induced map identifies `V_ℓ(A_f)` with `V_ℓ(J₁(N))/p_fV_ℓ(J₁(N))` as a module over `Q_ℓ⊗T₁(N)`, with the chosen Albanese convention. Exactness of rational Tate modules for the quotient is proved from the Poincaré-complement construction of §16.2, as in Conrad’s proof of Theorem 5.14; integral exactness is not inferred by tensoring this rational statement.

`ℓ` prime; base characteristic zero. `B_f` is the actual connected image-generated kernel from [§16.2](#s16-2).

Establish this as follows. Prove rational Tate exactness for `B_f→J₁(N)→A_f→0` from the isogeny `B_f×C→J₁(N)` of §16.2. Choose finitely many generators of `p_f`; the sum of their abelian images is `B_f` and gives a surjection `J^a→B_f`. Apply rational Tate exactness again to identify its image with `p_fV_ℓJ`.

**Checks.**

- Test: an isogeny `B → A` with kernel of order `ℓ` is surjective on `V_ℓ` but not on `T_ℓ`.

*Needs:* [§16.2](#s16-2); `AbelianSchemesAndArithmeticModuli §A4`; `AbelianSchemesAndArithmeticModuli §A6`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77); [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77).)

<a id="s16-4"></a>

### 16.4 Shimura's theorem: `dim A_f = [K_f : ℚ]`

`dim A_f = [K_f : ℚ]`, and `V_ℓ(A_f) = V_ℓ(J₁(N))/p_f V_ℓ(J₁(N))` is free of rank 2 over `ℚ_ℓ ⊗_ℚ K_f`. In particular `A_f ≠ 0` and `dim V_ℓ(A_f) = 2[K_f : ℚ]`.

The Frobenius characteristic polynomial on `V_ℓ(A_f)` is AutomorphicGaloisRepresentations’ statement, not a defining property of `A_f`.

Establish this as follows. `V_ℓ(J₁(N))` is free of rank 2 over `ℚ_ℓ ⊗ T₁(N)` ([§14.14](#s14-14)). [§16.3](#s16-3) applied to `p_f J₁(N) → J₁(N) → A_f → 0` identifies `V_ℓ(A_f)` with `V_ℓ(J₁(N))/p_f`. Hence `V_ℓ(A_f)` is free of rank 2 over `ℚ_ℓ ⊗ T₁(N)/p_f = ℚ_ℓ ⊗ K_f`, of `ℚ_ℓ`-dimension `2[K_f : ℚ] = 2` `dim A_f`.

**Checks.**

- Check on `N = 11` (dimension 1) and `N = 23` (dimension 2).

*Needs:* [§14.14](#s14-14); [§16.1](#s16-1); [§16.3](#s16-3); `AbelianSchemesAndArithmeticModuli §A4`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 73 (printed page; PDF page 77); [Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 2, §2.3.1, p. 28 (printed; PDF page 32).)

<a id="s16-5"></a>

### 16.5 Differentials on `A_f`

For the Albanese-action quotient `q_f:J₁(N)→A_f` defined here, cotangent pullback identifies `H⁰(A_f,Ω¹)⊗ℂ` with the span of `f^σ`, `σ:K_f↪ℂ`, inside `S₂(Γ₁(N),ℂ)=Cot₀(J₁(N)_ℂ)`. If `A_f^Pic` is instead constructed with the Picard action on the same model, its separately defined quotient map has cotangent image `w_ζ` of this span over a field containing `ζ`. The two quotient maps are not identified without this transport.

Conrad's warning: the Picard action on `Cot₀` is the Petersson adjoint of the classical action; `w_ζ` conjugates one action into the other.

Establish this as follows. `Cot₀(A_f) ↪ Cot₀(J₁(N))` is the subspace killed by `p_f` for the induced action on cotangent spaces. For the Albanese action this is the classical action; the `p_f`-eigenspace of `S₂(Γ₁(N), ℂ)` is `⊕_σ ℂ f^σ` (multiplicity one for newforms), of dimension `[K_f : ℚ] = dim A_f`.

**Checks.**

- Fix the Hecke-action convention before identifying differentials; the two choices differ by `w_ζ`.
- For a separately constructed Picard quotient retain the `w_ζ` transport; never change the action on the already defined Albanese quotient.

*Needs:* [§13.2](#s13-2); [§13.4](#s13-4); [§14.5](#s14-5); [§14.7](#s14-7); [§16.2](#s16-2); [§16.4](#s16-4); [ModularForms Layer 8G](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 68 (printed page; PDF page 72).)

<a id="s16-6"></a>

### 16.6 Trivial character: the quotient of `J₀(N)`

Let f be a normalized weight-two newform of primitive level `N≥5` with `χ_f=1`, and let `p_f⁰ ⊂ T₀(N)` be the kernel of the eigenvalue map on the Hecke algebra of `J₀(N)`. Form `A_f⁰ := J₀(N)/p_f⁰J₀(N)` with the connected image-generated kernel and Albanese action of [§16.2](#s16-2). Then `dim A_f⁰=[K_f : ℚ]`, and pullback along `π:X₁(N)→X₀(N)` descends to a `K_f`-equivariant isogeny `u:A_f⁰→A_f`.

Both `π^*:J₀(N)→J₁(N)` and its unnormalized norm `π_*:J₁(N)→J₀(N)` descend through the respective quotient maps `q_f⁰` and `q_f` to u and `v:A_f→A_f⁰`. Thus `u∘q_f⁰=q_f∘π^*` and `v∘q_f=q_f⁰∘π_*`. With `d=deg π>0` their composite satisfies `v∘u=[d]` on `A_f⁰`.

Establish this as follows. Apply the `J₁` dimension argument to `J₀(N)`, using the `Γ₀` version of [§14.14](#s14-14). Under the Albanese convention of §13.2, compare `π^*` and `π_*` with trace and inclusion on cotangent forms. The trivial-diamond subspace `S₂(Γ₀(N))⊂S₂(Γ₁(N))` is stable under every good and bad Hecke operator. Restriction gives `T₁(N)→T₀(N)`, with `p_f` the inverse image of `p_f⁰`; the two Jacobian maps intertwine these actions. They therefore send each image-generated kernel into the other, so §16.2's quotient universal property gives u and v. The identity `π_*π^*=[d]` from §13.1 descends, by surjectivity of `q_f⁰`, to `v∘u=[d]`. Consequently ker u is a closed subgroup scheme of `A_f⁰[d]`, which is finite because `d>0`. A homomorphism of equal-dimensional abelian varieties with finite scheme-theoretic kernel is finite and surjective: its proper image has the full dimension of the target, and translation identifies its fibres with its finite kernel. Apply this criterion to u, using `dim A_f⁰=dim A_f=[K_f : ℚ]`.

The public interface should expose:

- `modularQuotientGamma0_norm_pull`: For `χ_f=1` with the displayed weight and primitive-level hypotheses, the descended pullback and norm satisfy `v∘u=[deg π]`.

**Checks.**

- Consumers (EllipticCurveModularity) use the `J₀(N)` quotient; keep the isogeny explicit.
- Diamond eigenvalues must all equal one; a nontrivial-character form is not assigned a `J₀` quotient.
- At `N=11`, `d=5` and both quotients have dimension one; the descended composite is [5], without dividing either map by 5.
- On `E×E` for an elliptic curve E, `(x,y)↦(x,0)` is nonzero between equal-dimensional abelian varieties but has kernel `{0}×E` and is not an isogeny. The matrix `diag(1,0)` on `ℚ²` likewise has nonzero image and nonzero kernel.
- Positivity is necessary: on a positive-dimensional A, `u=v=0` satisfies `v∘u=[0]` and is not an isogeny.
- Equal dimensions are necessary: `u:E→E×E`, `x↦(x,0)`, and v the first projection satisfy `v∘u=[1]`, but u is not surjective.
- For `u=v=id` and `d=1` the criterion includes the identity isogeny, also on the zero-dimensional abelian variety.

*Needs:* [§9.1](#s9-1); [§9.2](#s9-2); [§13.1](#s13-1) (`jacobianNorm_pull`); [§13.2](#s13-2); [§14.14](#s14-14); [§16.1](#s16-1); [§16.2](#s16-2) (`modularQuotient_lift`, `modularQuotient_hom_ext`); [§16.4](#s16-4); AbelianSchemesAndArithmeticModuli A3.2 (`multiplicationAndDensity`); SchemeAndStackFoundations §0.7 (dimension of fibres); Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Chapter 2, §2.3.1.2, p. 29, and Appendix by B. Conrad, §5.1, Lemma 5.4, pp.67–68, Definition 5.13 and Theorem 5.14, p.73 (printed pages); [Milne, Abelian Varieties](https://www.jmilne.org/math/xnotes/AVs.pdf), §8, Proposition 8.1 and Theorem 8.2, pp.12–13.)

<a id="s16-7"></a>

### 16.7 Oldforms: `A_f` inside `J₁(M)` for N | M

Let f have primitive level N and weight two, and let `N|M`. For the anemic Hecke algebra at level M, the rational abelian factor attached to the Galois orbit of f is isogenous over Q to `A_f^{τ(M/N)}`, where `τ` counts positive divisors. The degeneracy images for `d|M/N` give that factor up to isogeny. This uses the complete fixed-character oldspace and cross-level multiplicity-one theorem imported from ModularForms Layers `4/5`; an eigenvector at raised level can be a linear combination of these images. The simple isogeny factor `A_f` is attached to the primitive eigensystem, whereas the full raised-level anemic quotient has the stated larger dimension.

The anemic operators exclude primes dividing M.

Character transport is the fixed character of f pulled to modulus M; do not count a different character’s oldspace.

Establish this as follows. Import the fixed-character oldspace basis `{V_d f:d|M/N}` and the completeness/unique primitive-pair statement. For each Galois conjugate the basis has `τ(M/N)` independent images; the leading q exponent proves independence, and imported completeness excludes other forms with that primitive eigensystem. Use weight-two Shimura comparison to identify the rational Hecke block, then Poincaré complete reducibility and the degeneracy homomorphisms to obtain the Q-isogeny.

**Checks.**

- `M=N` gives one copy; `M=Np` with `p∤N` gives two; `M=Np²` gives three, not four.
- No mod-`ℓ` saturation follows from this rational isogeny statement.

*Needs:* [§9.1](#s9-1); [§10.2](#s10-2); [§14.5](#s14-5); [§16.4](#s16-4); [ModularForms Layer 4](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor); [ModularForms Layer 5](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization); [ModularForms Layer 8G](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality); `AbelianSchemesAndArithmeticModuli §A6`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §3.6, p. 40; Corollary 5.9, pp. 69–70; Theorem 5.14, p. 73.)

<a id="s16-8"></a>

### 16.8 The Abel–Jacobi composite to `A_f` is nonconstant

For any supplied rational base point `c∈X₁(N)(Q)`, the composite `q_f∘AJ_c:X₁(N)→A_f` is nonconstant and sends c to zero. The same assertion holds for a supplied point of `X₀(N)` and its trivial-character quotient. The argument uses `A_f≠0` and the generation of the Jacobian by `AJ_c`; it does not require the rational-cusp construction of Layer 17.

`A_f ≠ 0`; the Abel–Jacobi map and its universal property are Tau Ceti JacobianChallenge Layer F.

Establish this as follows. Import `AJ_c` and its universal property for the supplied rational point. If the composite is constant, its value is zero because `AJ_c(c)=0`. Since the image of `AJ_c` generates J, the quotient homomorphism is zero, contradicting surjectivity onto `A_f≠0`.

**Checks.**

- No isogeny to a target curve is asserted here (that is EllipticCurveModularity’s).

*Needs:* [§16.2](#s16-2); [§16.4](#s16-4); [JacobianChallenge Layer F](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 74 (printed page; PDF page 78).)

### Examples

A rational-eigenvalue newform gives `[K_f:ℚ]=1` and a dimension-one `A_f`. For a coefficient field of degree d, `V_ℓA_f` has `ℚ_ℓ`-dimension 2d, not d. At raised level M the anemic factor has `τ(M/N)` degeneracy copies: all divisors of `M/N` appear. The kernel of a character `ℚ×ℚ→ℚ` selecting the first factor is the second factor; conjugating through an injective field homomorphism leaves the kernel unchanged.

### Dependencies

Use Layer 9, Layer 10, Layer 13, Layer 14. External contracts: AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties. The subsection prerequisites identify the precise objects and maps consumed.

## Layer 17: Bad-prime and Taylor–Wiles interfaces

<a id="s17-1"></a>

### 17.1 Reduction of the supplied modular Hecke action

Apply Layer 13’s existing Néron extension of the actual modular Hecke endomorphisms. At `p∤N`, reduce them on the good abelian fibre `J_p`; at semistable primes use the induced torus, character and component-group maps of R11.6. At `p∤N` the integral degeneracy maps of §9.1 exist, with the semistable correspondence source of §11.5; reduction of their Jacobian endomorphisms uses the good abelian target.

`Pic⁰_{X₁(N)/ℤ[1/N]}` is an abelian scheme, hence the Néron model of its generic fibre.

Establish this as follows. Import the endomorphisms and their already-owned generic Néron extension. Take the appropriate special fibre; apply the generic functoriality on tori, characters and components. Match the reduced operator to the integral correspondence of §9.1 using the component maps of §12.4. Its singular source has a semiabelian neutral Picard fibre, so the construction through two smooth proper relative curves and their abelian Jacobians does not apply over the whole base. Keep the separate coarse-descent hypotheses of §9.1.

Construct `GoodReductionSpecialisation` for the good modular Jacobian at a prime ℓ not dividing N, after choosing a prime of ℚ̄ over ℓ using ArithmeticGaloisRepresentations §§2.1–2.2. Its underlying map is the canonical reduction homomorphism `sp:J(ℚ̄)→J_𝔽̄ℓ(𝔽̄ℓ)`, characterized by extension of points to the proper abelian model over the chosen valuation ring. It is surjective, commutes with all rational Hecke operators, is invariant under the chosen inertia group, and intertwines arithmetic Frobenius lifts with the ℓ-power Frobenius F on the special fibre. For each `n≥1` prime to ℓ, its restriction to geometric n-torsion is an isomorphism, in particular injective. These are laws of this canonical map, not choices of maps with certificates of good reduction. Prove `goodReductionSpecialisation_exists` for `J₀(N)` and for the good `J₁(N)` models of §13.1; §17.2 supplies their modular Frobenius relation.

**Checks.**

- At `p∤N` the integral degeneracy maps of §9.1 exist and their source has the semistable fibre of §11.5. The endomorphisms of the good Jacobian extend over `ℤ[1/N]`, although the correspondence source is not smooth at p.
- At `N=5,p=2`, the fine mixed model has two special-fibre components (§11.5), and both degeneracy maps have the component restrictions of §12.4. Their existence does not imply that the source is smooth at 2.
- Reduction of the extended endomorphism agrees with the special-fibre correspondence action.
- For `J₀(11)` at 2, geometric 5-torsion specializes isomorphically. At 11 this good-reduction statement does not apply.
- Prime-to-ℓ is essential: on a positive-dimensional abelian variety with supersingular good reduction, generic ℓ-torsion can specialize to zero.

*Needs:* [§9.1](#s9-1); [§11.5](#s11-5); [§12.4](#s12-4); [§13.1](#s13-1); [§13.2](#s13-2); `NeronModelsAndSemistableAbelianVarieties` §R11.6 and §§5.0a–5.0b; `ArithmeticGaloisRepresentations` §§2.1–2.2 (decomposition, inertia and arithmetic Frobenius at a chosen geometric prime).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 72 (printed page; PDF page 76).)

For geometric-point reduction, use [Néron Models](https://doi.org/10.1007/978-3-642-51438-8), §§2.2–2.3 (smooth lifting over henselian traits) and §7.3, Lemma 2 and Proposition 3, pp.179–180 (étale prime-to-residue-characteristic torsion); properness extends every algebraic point to the valuation ring.

<a id="s17-2"></a>

### 17.2 The Eichler–Shimura relation

For `p∤N` and `J_p=Pic⁰(X₁(N)_Fp)`, let F be the p-power Frobenius endomorphism and V its Verschiebung, so `FV=VF=[p]`. In `End_Fp(J_p)`, the Albanese Hecke operator satisfies `(T_p)_*=F+⟨p⟩_*V`. Over `F̄_p`, for a chosen primitive Nth root `ζ`, `w_ζ⁻¹Fw_ζ=⟨p⟩_*⁻¹F`. This is the weight-two special-fibre relation exported to AutomorphicGaloisRepresentations; identification of a selected eigencomponent’s Galois characteristic polynomial is the consumer’s theorem.

p prime, `p∤N`; the supplied proper curve and its Jacobian have good reduction.

V is the actual Verschiebung, identified with the polarization dual of F; `w_ζ` is only required over the field containing `ζ`.

Complete §17.1's `GoodReductionSpecialisation` by proving `goodReductionSpecialisation_frobenius`: on the special-fibre point group, `F²−(T_p)_*F+p⟨p⟩_*=0`. For `J₀(N)` this is `F²−T_pF+p=0`. Together with the canonical reduction map and its laws, this is the good-reduction interface; on prime-to-p torsion the same relation holds for any arithmetic Frobenius lift. The diamond term is retained at `Γ₁` level, and no Frobenius lift is selected without its decomposition-group hypothesis.

Establish this as follows. On the ordinary dense locus, the good-prime isogeny correspondence consists of the Frobenius graph and its transpose with the diamond twist; import this special-fibre correspondence statement from the correspondence calculation in §§9.1 and 11.5. Equality of correspondence actions on degree-zero divisors yields equality of Jacobian endomorphisms by Albanese functoriality; extend by density. For `w_ζ` use Frobenius on level roots of unity and the dual isogeny relation, exactly as in Conrad’s proof.

**Checks.**

- On `J₀(11)` at `p=2`, the diamond is trivial and `F+V=T₂=[−2]`, with `FV=VF=[2]`. The model `y²+y=x³−x²−10x−20` has five `𝔽₂`-points, so its Frobenius trace is `−2`.
- On `J₀(11)` at `p=3`, `F+V=T₃=[−1]`, with `FV=VF=[3]`; the same model has five `𝔽₃`-points, so its trace is `−1`.
- For `X₀(1)`, `J₀(1)=0` and both sides of the relation are the zero endomorphism for every prime p.

*Needs:* [§3.2](#s3-2); [§3.5](#s3-5); [§4.12](#s4-12); [§9.1](#s9-1); [§9.2](#s9-2); [§9.12](#s9-12); [§13.5](#s13-5); [§13.2](#s13-2); [§13.4](#s13-4); [§17.1](#s17-1); `AbelianSchemesAndArithmeticModuli §A4`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Theorem 5.16 and proof, pp. 74–79; [Anni–Siksek, Modular elliptic curves over real abelian fields and the generalized Fermat equation](https://msp.org/ant/2016/10-6/ant-v10-n6-p.pdf), equation (14), p.1163, for the X₀(11) model.)

<a id="s17-3"></a>

### 17.3 Cusp-normalised Abel–Jacobi maps

Use the supplied rational cusp `∞` of `X₀(N)`, and a specified rational cusp c of the chosen `X₁(N)` point-of-exact-order moduli model (Conrad uses 0), to specialize the imported AJ construction: `AJ_c(x)=[x−c]`. It is over Q, sends c to zero and is a closed immersion when the genus is positive. For a degeneracy morphism `α:X′→X` and rational cusp c′, `α_*AJ_{c′}(x)=AJ_c(α(x))+[α(c′)−c]`. Hecke compatibility is on degree-zero divisors; without a base-point correction this is not an equality of point maps.

Rationality is proved for the chosen cusp and moduli model; the cusp named `∞` on `X₁(N)` is not assumed rational in every model.

Establish this as follows. Import cusp fields and the precise moduli model from [§6.3](#s6-3); select the rational cusp there. Instantiate JacobianChallenge Layer F’s actual morphism and immersion theorem. Compute pushforward of `[x−c′]` to obtain the base-point correction; compute the Hecke action on degree-zero divisors.

The public interface should expose:

- `abelJacobiInfty`: The imported AJ for `X₀(N)`, based at its supplied rational cusp `∞`.
- `abelJacobiInfty_cusp`: `AJ_∞(∞)=0`.
- `abelJacobiInfty_injective`: `AJ_∞` is a closed immersion for genus at least one; no immersion conclusion for genus zero.
- `abelJacobi_changeBase`: `AJ_b(x)=AJ_c(x)−AJ_c(b)`.
- `abelJacobi_degeneracy`: `α_*AJ_{c′}(x)=AJ_c(αx)+[αc′−c]`.
- `abelJacobi_hecke`: On degree-zero divisors D, the induced endomorphism sends [D] to `[T(D)]` using the chosen Picard/Albanese convention.

**Checks.**

- For the genus-one curve `X₀(11)`, `AJ_∞` is an isomorphism with its Jacobian.
- For `X₀(1)`, the Jacobian and AJ image are zero; the curve map is not injective.
- For any supplied rational cusp b, `AJ_b(b)=0` and `AJ_b(x)=AJ_∞(x)−AJ_∞(b)`.
- If `[αc′−c]≠0`, the uncorrected identity `α_*AJ_{c′}=AJ_c∘α` fails already at c′.
- No modular parametrisation of an elliptic curve is asserted here.

*Needs:* [§3.1](#s3-1); [§4.12](#s4-12); [§6.3](#s6-3); [§8.1](#s8-1); [§9.1](#s9-1); [§9.2](#s9-2); [§9.3](#s9-3); [§13.1](#s13-1); [JacobianChallenge Layer F](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by B. Conrad, p. 74 (printed page; PDF page 78).)

<a id="s17-4"></a>

### 17.4 The modular supersingular character lattice

For the mixed level `Γ₁(M)∩Γ₀(p)`, `M≥5` and `p∤M`, use Layer 11’s split geometric semistable fibre: its two smooth components are the two copies of `X₁(M)_F̄p` and they meet at the finite supersingular level-point set S. Orient every edge from the first component to the second. The toric character group is canonically `Z[S]⁰=ker(Σ:Z[S]→Z)`, compatibly with good-prime Hecke correspondences, diamonds and geometric Frobenius (including the action on orientations). Thickness is retained in the monodromy pairing rather than in this unweighted boundary map.

The two-component description is a supplied theorem for the mixed `Γ₀(p)` model, not a claim about `X₁(Mp)`.

If a regular model introduces subdivisions, compare graph homology by contraction; the stable thickness data must be preserved.

Establish this as follows. Import the actual fibre normalization, nodes and their correspondences from Layer 11. Its dual graph has two vertices and edges S; the boundary of each edge is `v₂−v₁`, so the cycle lattice is ker `Σ`. Specialize §12.2’s common character/monodromy API to this two-component graph, and transport the actual operators through the incidence-chain description.

Use the kernel of total sum on the free abelian module on the supplied supersingular set S, with differences `[s]−[t]` as generators and zero difference at equal endpoints. For the supplied two-component fibre, identify this lattice with actual integral graph homology and the torus character group. A geometric graph correspondence induces its character map through incidence chains, without division by edge multiplicity. Equality is detected by every supersingular coefficient.

**Checks.**

- With one supersingular edge the kernel is zero.
- With two edges the kernel is generated by `(1,−1)` and is free of rank one.
- For distinct s,t, `[s]−[t]` is a nonzero degree-zero element.
- The one-loop lattice with edge thickness h has character rank one for every h, although its component cokernel has order h.
- If `|S|=s≥1`, rank `X*=s−1`.
- Character group means integral graph homology, not its dual or the component group.

*Needs:* [§11.5](#s11-5); [§12.1](#s12-1); [§17.1](#s17-1); `NeronModelsAndSemistableAbelianVarieties §R11.4`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp. 44–46; §3.10.2, p. 48.)

<a id="s17-5"></a>

### 17.5 Modular monodromy and component sequence

For the actual semistable modular Jacobian at p and its supplied regular or weighted stable dual graph, transport R11.4’s integral monodromy map `μ:X*(J^∨)→Hom(X*(J),Z)`. The sequence `0→X*(J^∨)→Hom(X*(J),Z)→Φ_J(F̄p)→0` is exact. Under the principal polarization and graph identification, `μ` is the edge pairing `Σ_e h_e a_e b_e`, with positive thickness `h_e`; a regular semistable model uses `h_e=1`. It is perfect over Q but need not be unimodular over Z. The `ℓ`-primary component group is its tensor cokernel, including `ℓ` dividing the determinant.

Use the actual model; the component sequence is geometric over `F̄p` with descent action retained.

Establish this as follows. Import the dual character lattice and monodromy sequence from R11.4. Identify it with the graph intersection pairing via Layer 11’s supplied node thicknesses. Use Néron functoriality to compare endomorphisms and their adjoints; derive the Hecke action on `Φ` from the cokernel.

For the prime-level graph of §12.1, prove `gammaZeroPrime_componentGroup`: `Φ_(J₀(p))(𝔽̄_p)` is cyclic of order `num((p−1)/12)`, for `p≥5`. The discriminant is the number of spanning trees of the regular subdivided graph, equivalently `(∏_E h_E)(Σ_E 1/h_E)`. Prove this identity by the incidence minors or a cycle basis, and use the mass formula; the unique possible thickness-2 and thickness-3 edges are coprime, so the Smith form has only one nontrivial invariant factor. Transport the actual Hecke correspondences to prove `gammaZeroPrime_componentEisenstein`: `T_q=1+q` for `q≠p`, `U_p=1` and `w_p=−1` on Φ. The cusp divisor `(0)−(∞)` specializes to a generator, so the geometric component group has trivial residue Galois action. These conclusions concern prime level, not every semistable modular component group.

**Checks.**

- For two vertices joined by two edges of thickness one, the generator `(1,−1)` has monodromy value 2 and component cokernel `Z/2`.
- No `ℓ`-primary information is recovered by inverting `ℓ` first.
- At p=11 the thicknesses 2 and 3 give order 5, not the unweighted two-edge answer 2; the cuspidal generator has `T₂=3` modulo 5.
- At p=13 the component group is trivial; at p=17 its order is 4. Keeping only rationalized monodromy would miss both orders 5 and 4.

*Needs:* [§11.5](#s11-5); [§12.1](#s12-1); [§17.4](#s17-4); `NeronModelsAndSemistableAbelianVarieties §R11.4`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp. 44–46; §3.10.2, p. 48.)

For the prime-level cyclicity and cusp generator, use [Mazur, Modular curves and the Eisenstein ideal](https://www.numdam.org/item/PMIHES_1977__47__33_0/), Appendix, Theorem A.1, p.173, Proposition 1.4 and §2, pp.179–183. Its II §11, Proposition 11.1, p.98, gives the cusp's Eisenstein action; specialize it to the component generator. The graph calculation uses [Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf), VI §6.16, p.290, and NeronModelsAndSemistableAbelianVarieties §§4.4–4.7's graph discriminant formula.

<a id="s17-6"></a>

### 17.6 Integral modular character maps and lattice errors

Every degeneracy homomorphism of the semistable modular Jacobians induces the contravariant character map and compatible monodromy/component diagram of R11.6. Identify these maps on the normalization graphs of Layers 11–12 and compute their integral kernels, cokernels and saturation. Retain every finite lattice error of an old/new isogeny. The character sequence of a supplied exact sequence of tori is the generic R11.6 contract, used here with its geometric hypotheses.

The sequence involving the quaternionic Jacobian `J′_pq(K)` in Ribet–Stein §3.10.2, equation (3.2), is outside this modular interface. It requires a separately owned construction of the quaternionic curve, its Cerednik–Drinfeld model and its integral model-to-graph comparison.

Establish this as follows. Apply R11.6 character functoriality to the actual modular degeneracy maps, compute their incidence-chain maps on the supplied graphs, and compare monodromy and component cokernels. Compute integral kernels and cokernels before rationalizing; use generic character exactness only when the corresponding torus sequence has been proved exact.

**Checks.**

- A finite isogeny kernel can give a nonzero finite character cokernel; multiplication by m on `G_m` gives cokernel `ℤ/m`.
- The character maps reverse the direction of torus maps.
- A rational old/new isogeny does not identify the integral character lattices or remove their finite errors.

*Needs:* [§11.5](#s11-5); [§12.1](#s12-1); [§12.4](#s12-4); [§17.4](#s17-4); [§17.5](#s17-5); `NeronModelsAndSemistableAbelianVarieties §R11.6`.

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §§3.9–3.10.2, pp.44–48, for the modular character maps and the separate quaternionic hypothesis in (3.2).)

<a id="s17-7"></a>

### 17.7 The semistable modular Tate filtration

For an actual semistable modular Jacobian J over `Q_p` and `ℓ≠p`, import the saturated filtration `T_ℓ(J)_t⊂T_ℓ(J)_f⊂T_ℓ(J)`, with `T_t≅Hom(X*(J),Z_ℓ(1))`, `T_f=T_ℓ(J)^{I_p}`, and `T_f/T_t` the Tate module of the abelian part of the special fibre. The ranks are `t,t+2a,2(t+a)`, respectively. Identify the inertia/monodromy map with the modular monodromy pairing and the induced Hecke maps. This is the actual integral input for SerreWeightAndLevelOptimisation’s ramification arguments; the p-adic semistable representation case belongs to p-adic comparison owners.

`ℓ≠p` and actual semistable reduction; no claim `T_f=T^{I_p}` at `ℓ=p`.

Establish this as follows. Apply R11.3 and the actual toric character computation. Use [§17.5](#s17-5) and its imported R11.4 graph comparison to match the monodromy operator and Weil pairing. Transport the supplied degeneracy and Hecke maps through the filtration. Use the R11.3 Tate filtration and R11.4 graph comparison for this modular application. Its nearby-cycle interpretation belongs to WeightsInEtaleCohomology and is not needed here.

Prove `modularJacobian_semistableTorsion`: for a semistable modular Jacobian J at r and a prime `ℓ≠r`, its actual `J[ℓ](ℚ̄_r)` and rational Hecke action give the `SemistableTorsionDatum` assigned to NeronModelsAndSemistableAbelianVarieties §4. Retain `toric ⊆ identity-component ⊆ finite-part ⊆ J[ℓ]`, the residue Galois actions and the finite monodromy error. The specialization sequence is `0→𝒥⁰_𝔽̄r[ℓ]→J[ℓ]^{I_r}→Φ_J[ℓ]→0`; inside its left term the toric subgroup is `Hom(X*,μ_ℓ)` and the quotient is the abelian reduction's ℓ-torsion. Thus the specialization kernel is the toric subgroup only in the totally toric case. On the toric part at a one-factor modular prime r, Frobenius is `rU_r` in the conventions of §12.4 and Ribet–Stein Lemma 3.17; record the induced component action separately. At every good prime away from the level and ℓ, the datum satisfies §17.2's Frobenius relation with its diamond. Its maps are those from the Néron model and the existing graph carrier, not additional certificate data.

**Checks.**

- The toric torsion is `Hom(X*,μ_ℓ)`, with the cyclotomic twist.
- Inertia invariants of residual torsion need not be the reduction of integral invariants; the finite monodromy cokernel matters.
- A good positive-genus fibre has toric rank zero but a nonzero identity-component ℓ-torsion kernel; a toric-only kernel would be false.
- For `J₀(11)` at 11 and `ℓ=5`, the toric term has order 5 and `Φ[5]` has order 5; both are retained in the inertia-invariant 5-torsion. For `ℓ=3`, `Φ[3]=0` and only the toric term remains.

*Needs:* [§12.4](#s12-4); [§17.2](#s17-2); [§17.5](#s17-5); `NeronModelsAndSemistableAbelianVarieties` §R11.3, §§3.5–3.7 and §4 (shared semistable torsion and graph contracts).

([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §3.9, pp. 45–46; §3.10.3, pp. 48–49.)

<a id="s17-8"></a>

### 17.8 The finite Taylor–Wiles modular cover

Fix odd residue characteristic `ℓ` and a finite set Q of primes `q∤Nℓ` with `q≡1` mod `ℓ`. Let `H_q` be the prime-to-`ℓ` subgroup of `(Z/q)×` and `Δ_q=(Z/q)×/H_q`, `Δ_Q=∏Δ_q`. At q, `Γ̄_Q` has `Γ₀(q)` level and `Γ_Q` is the inverse image of `H_q` under the diamond quotient. Retain the fixed base level at N, and intersect both groups with the same auxiliary `Γ₁(R)`, with `R≥5` a prime coprime to `Nℓ∏Q`, to remove stabilizers. Then `Γ_Q⊲Γ̄_Q` with quotient `Δ_Q`, and `Y_Q→Ȳ_Q` is an actual finite étale analytic cover with that deck group. Complex conjugation `ξ=diag(−1,1)` normalizes both groups and acts trivially on `Δ_Q`. For the actual `H¹(Y_Q,O)`, define `M_Q^-` as the kernel of `ξ+1`, and then take the specified anemic and selected `U_q`-root localization.

O complete DVR finite over `Z_ℓ`; all auxiliary cover data and level maps are fixed.

The open cover is unramified; its compactification can ramify at cusps and is not assumed étale there.

Selected residual roots are distinct, and the cyclotomic-determinant specialization uses `q≡1` and `α_qβ_q=1`.

Establish this as follows. Build the subgroup from the actual congruence conditions and identify its finite diamond quotient using the Chinese remainder map. Import the torsion-free analytic quotients and their cover action; verify `ξ` conjugation on the congruence subgroup and quotient. Use the actual group/Betti `H¹` module with deck action, form its minus eigenspace and complete/localize the commuting Hecke action.

The public interface should expose:

- `taylorWilesLevel`: The congruence subgroup `Γ_Q` and its cover of the specified `Γ̄_Q` quotient.
- `taylorWilesLevel_quotient`: `Γ̄_Q/Γ_Q≅Δ_Q`, with the actual diamond action.
- `taylorWilesLevel_conjugation`: `ξ` fixes `Δ_Q` and commutes with its action on `H¹`.

The minus submodule consists of classes with `ξx=−x`. Since 2 is a unit, `(1−ξ)/2` is an idempotent projector with exactly this range. Coefficient change and deck/Hecke-equivariant maps commute with this projector under the proved base-change hypotheses. Equality of minus classes is detected in the actual cover cohomology.

**Checks.**

- If `ξ=id` and 2 is invertible, the minus module is zero.
- If `ξ=−id`, the minus module is the whole module.
- For `ξ²=id` and the unit `u=2`, the projector is idempotent; at `ξ=−id` it is the identity.
- For `ξ(x,y)=(y,x)` on `O²`, the minus submodule is `{(a,−a):a∈O}`.
- For Q empty the diamond quotient is trivial and the selected cover is the base cover.
- In characteristic two the kernel of `ξ+1` need not be a complementary direct summand; the projector statement requires 2 invertible.
- `Q=empty` gives `Δ_Q=1` and the fixed auxiliary base-level module.
- The choice of root is part of the Hecke localization, not a new definition of an abstract free module.

*Needs:* ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3 through the GL₂ comparison of §14.4; IntegralHeckeAndGaloisDeterminants §§2.1–2.3 (finite Hecke images and commuting idempotent/operator summands); [§9.1](#s9-1); [§9.2](#s9-2); [§14.2](#s14-2); [§14.8](#s14-8); [FuchsianOrbifolds Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups); [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality); [AlgebraicTopology Stage 5](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent).

([Taylor–Wiles](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Definition of Δ_Q, Γ_Q, Γ̄_Q and auxiliary R, author pp. 4–7; Proposition 1, pp. 7–8.)

<a id="s17-9"></a>

### 17.9 Finite-level Taylor–Wiles freeness

For the actual cover and O of [§17.8](#s17-8), `H¹(Y_Q,O)^−` is finite free over `O[Δ_Q]`, with rank equal to `rank_O H¹(Ȳ_Q,O)^−`. Each commuting completed anemic/selected-root Hecke localization is an `O[Δ_Q]`-direct summand and is therefore also finite free. At the non-Eisenstein ideals of Layer 14, boundary removal identifies this with the compact cuspidal module. Reduction modulo `πⁿ` yields a finite free `(O/πⁿ)[Δ_Q]`-module of the same rank. The plus eigenspace and Hecke-rank-one multiplicity claims are not conclusions of Proposition 1.

Odd `ℓ`; `Δ_Q` is an abelian `ℓ`-group; the congruence group `Γ̄_Q` is torsion-free and free of finite rank.

The finite-level identification with cohomology modulo `πⁿ` uses [§14.10](#s14-10) or the minus-cochain computation, not merely a claim that rational invariants commute with integral reduction.

Establish this as follows. Apply Shapiro: `H¹(Γ_Q,O)=H¹(Γ̄_Q,O[Δ_Q])`. By `modularOpenFiniteGraph` of §14.9a, `Γ̄_Q` is free of finite rank, so its cocycle module is finite free over `O[Δ_Q]`. `ξ` acts trivially on `Δ_Q`, so all coboundaries are in the plus eigenspace; minus `H¹` equals minus cocycles, a projective summand. `O[Δ_Q]` is local for a finite `ℓ`-group over the complete DVR, so that finite projective module is free. Over `Frac(O)`, finite cover descent identifies `Δ_Q` invariants with base cohomology, giving the stated rank; prove coefficient reduction by the same finite free minus complex. Completed commuting Hecke localization is the idempotent summand supplied by IntegralHeckeAndGaloisDeterminants §§2.2–2.3; its projector commutes with `ξ` and `Δ_Q`. Use boundary removal only for the stated non-Eisenstein modules. Apply Mathlib groupCohomology.coindIso for Shapiro; the new work is its compatibility with the tree cochain sequence or finite diamond cover.

**Checks.**

- This is freeness over `O[Δ_Q]`, not over the localized Hecke algebra.
- For `Δ_Q` of order `ℓ`, the O-rank is `ℓ` times the `O[Δ_Q]`-rank.
- Nothing is asserted about weight-one coherent cohomology by this weight-two argument.

*Needs:* ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3 through the GL₂ comparison of §14.4; IntegralHeckeAndGaloisDeterminants §§2.1–2.3 (finite Hecke images and commuting idempotent/operator summands); [§14.9a](#s14-9a) (`modularOpenFiniteGraph`); the existing diamond group-ring contract in the supplier section; [§14.9](#s14-9); [§14.10](#s14-10); [§17.8](#s17-8); [AlgebraicTopology Stage 6](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality); Mathlib `groupCohomology.coindIso`; [AlgebraicTopology Stage 5](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent).

([Taylor–Wiles](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Proposition 1 and proof, author pp. 7–8.)

<a id="s17-10"></a>

### 17.10 Augmentation and selected-root specialization

Let `I_Q` be the augmentation ideal of `O[Δ_Q]`. For the minus modules of the actual covers, `M_Q^-/I_QM_Q^-` identifies with `H¹(Ȳ_Q,O)^−`, via Shapiro’s induced-coefficient complex and its augmentation. Assume at each step the actual trivial integral central/diamond action and the cyclotomic-determinant Taylor–Wiles root hypotheses of [§15.8](#s15-8). Successive root selection at `q∈Q` then identifies the localized base-side module with the fixed-level localized module. All maps commute with anemic Hecke operators and reduction modulo `πⁿ`. A finite free `O[Δ_Q]` module M satisfies `rank_O(M/I_QM)=rank_{O[Δ_Q]}M`; this numerical fact is used only after the actual geometric specialization map has been proved.

The same auxiliary R-level is retained at both ends. Removing R requires a separate checked level-control argument and its source hypotheses.

Distinct residual roots, `q∤Nℓ` and odd `ℓ`; the integral central/diamond hypothesis of §15.8 is required at every finite coefficient level. It concerns the base-side action and does not trivialize the auxiliary deck action of `Δ_Q`. No repeated-root specialization.

Establish this as follows. On the Shapiro free-group complex, augmentation is coefficient change `O[Δ_Q]→O`. The degree-zero coboundaries are plus, so minus projection and its `H¹` commute with this change. Use finite group-ring freeness and the exact minus complex to prove augmentation and coefficient compatibility. Apply the finite-level degeneracy root-control theorem successively; retain the actual root idempotents. Export the geometric module and specialization data to generic patching owners, which own inverse systems and the ring theorem.

**Checks.**

- A rank equality without the specialization morphism is insufficient.
- This does not remove an auxiliary R-level on its own.
- With Q empty, `Δ_Q=1` and `I_Q=0`; augmentation and root specialization are identities on the fixed auxiliary-level module.

*Needs:* ArithmeticLocallySymmetricSpaces §§ALS.6.1–ALS.6.3 through the GL₂ comparison of §14.4; IntegralHeckeAndGaloisDeterminants §§2.1–2.3 (finite Hecke images and commuting idempotent/operator summands); [§15.8](#s15-8); [§17.9](#s17-9); [AlgebraicTopology Stage 5](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent).

([Taylor–Wiles](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf), Proof of Proposition 1, author pp. 7–8; [Calegari–Geraghty](https://arxiv.org/pdf/1207.4224), Lemma 9.6, pp. 88–90.)

### Examples

For a supersingular set with one element the degree-zero character lattice is zero; for two elements it is `ℤ` generated by `[s]−[t]`. Positive thicknesses change its monodromy index. For the swap involution on `O²` the minus vectors are `(a,−a)`; for `ξ=−id` the minus module is all of M, and for `ξ=id` it is zero when 2 is invertible. In characteristic 2 plus and minus cease to split. With Q empty the cover and augmentation are identity maps. For Q nonempty, rank agreement is checked only after the geometric augmentation and selected-root maps have been proved.

### Dependencies

Use Layers 3 and 4, Layer 6, Layer 8, Layer 9, Layer 11, Layer 12, Layer 13, Layer 14, Layer 15. External contracts: AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties. The subsection prerequisites identify the precise objects and maps consumed.

## References

Locators use the versions specified here. Author-copy pagination is distinguished from printed journal pagination.

- [Brian Conrad, Arithmetic moduli of generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf). Author copy dated July 18, 2006, 49 pages; result numbers and printed pages refer to this copy. Published JIMJ 6 (2007), 209–278.
- [Pierre Deligne and Michael Rapoport, Les schémas de modules de courbes elliptiques](https://publications.ias.edu/sites/default/files/Number22.pdf). Modular Functions of One Variable II, LNM 349 (1973), pp.143–316; public IAS scan, PDF page plus 142 is the printed page.
- [Kęstutis Česnavičius, A modular description of X₀(n)](https://arxiv.org/pdf/1511.07475v2). arXiv:1511.07475v2, October 5, 2017, 67 pages; locators use its own page numbers.
- [Kęstutis Česnavičius, A modular description of X₀(n), version of record](https://msp.org/ant/2017/11-9/ant-v11-n9-p02-p.pdf). Algebra & Number Theory 11 (2017), 2001–2089; MSP PDF with two cover pages, printed page `=` PDF page `+1998`.
- [Brian Conrad, Modular curves and analytic families](https://math.stanford.edu/~conrad/248BPage/handouts/modularcurves.pdf). Stanford Math 248B course handout, modularcurves.pdf, 47 pages; undated 47-page handout.
- [Brian Conrad, Classical analytic modular curves](https://math.stanford.edu/~conrad/248BPage/handouts/classical.pdf). Stanford Math 248B classical.pdf handout, 13 pages.
- [Brian Conrad, The q-expansion principle](https://math.stanford.edu/~conrad/248BPage/handouts/qexp.pdf). Stanford Math 248B qexp.pdf handout, 6 pages.
- [Henri Darmon, Fred Diamond and Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). Author-hosted exposition dated September 9, 2007, 166 pages; internal page numbers.
- [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf). Version 1.31, March 22, 2017, 134 pages.
- [Benjamin Bakker and Jacob Tsimerman, Errata to p-torsion monodromy representations of elliptic curves over geometric function fields](https://benjamin-bakker.github.io/P.torsion.erratum.pdf). Author-hosted erratum; undated erratum.
- [Benedict H. Gross and Don B. Zagier, Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf). Published Invent. Math. 84 (1986), 225–320, MPIM author-hosted scan; printed page `=` PDF page `+224`.
- [The Stacks Project authors, The Stacks Project](https://stacks.math.columbia.edu). Cited by stable tag.
- [Benjamin Bakker and Jacob Tsimerman, p-torsion monodromy representations of elliptic curves over geometric function fields (preprint)](https://arxiv.org/pdf/1403.7168v2). arXiv:1403.7168v2, 31 pages; preprint page numbers.
- [Bas Edixhoven, Minimal resolution and stable reduction of X₀(N)](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf). Published Ann. Inst. Fourier 40 (1990), 31–67, Numdam scan; first PDF page is a repository cover, so use printed page numbers.
- [Kenneth A. Ribet and William A. Stein (appendices by Brian Conrad and Kevin Buzzard), Lectures on Serre's conjectures (with an appendix by Brian Conrad, The Shimura construction in weight 2, and by Kevin Buzzard)](https://wstein.org/papers/serre/ribet-stein.pdf). Author revision dated 23 November 2010, not identified with the pagination of the 2001 published chapter. Printed page `=` PDF page minus 4.
- [Benjamin Bakker and Jacob Tsimerman, p-torsion monodromy representations of elliptic curves over geometric function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf). Published Ann. Math. 184 (2016), 709–744; journal PDF, printed pages.
- [Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk, Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf). Published Ann. Math. 189 (2019), 885–944; journal PDF, printed pages.
- [David Masser and Umberto Zannier, Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf). Published Ann. Math. 191 (2020), 635–674; journal PDF, printed pages.
- [Kęstutis Česnavičius, Coarse base change fails for some modular curves](https://arxiv.org/pdf/1608.01249). arXiv:1608.01249v2 (24 October 2016), printed pp.1–7; published Algebraic Geometry 4 (2017), no. 4, 444–451.
- [Brian Conrad, The Keel–Mori theorem via stacks](https://math.stanford.edu/~conrad/papers/coarsespace.pdf). Author notes dated 27 November 2005, 12 pp.
- [Dan Abramovich and Angelo Vistoli, Compactifying the space of stable maps](https://arxiv.org/pdf/math/9908167). arXiv:math/9908167v2 (12 March 2000); published J. Amer. Math. Soc. 15 (2002), 27–75.
- [David Zywina, On the possible images of the mod ℓ representations associated to elliptic curves over ℚ](https://arxiv.org/pdf/1508.07660). arXiv:1508.07660, PDF page numbers.
- [Tau Ceti contributors, Roadmap: modular curves, following Katz–Mazur (Tau Ceti roadmap ModularCurves)](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves). TauCetiRoadmap at commit 70a1ff2, TauCetiRoadmap/ModularCurves/README.md and Suggested.lean.
- [Pierre Deligne, Formes modulaires et représentations ℓ-adiques](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf). Séminaire Bourbaki, exposé 355 (1968–1969), pp. 139–172; Numdam scan
- [Kenneth A. Ribet, Congruence relations between modular forms](https://math.berkeley.edu/~ribet/Articles/icm.pdf). Proceedings ICM Warsaw 1983, published 1984, pp. 503–514; author scan
- [Frank Calegari, Vesselin Dimitrov and Yunqing Tang, The unbounded denominators conjecture](https://arxiv.org/pdf/2109.09040). arXiv:2109.09040 author preprint dated 18 September 2024; published JAMS 38 (2025), 627–702. Locators above use author-preprint pages unless journal pages are explicitly specified.
- [Frank Calegari and David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224). arXiv:1207.4224 author preprint; locators above use preprint pages
- [Jean-Pierre Serre, Arbres, amalgames, SL₂](https://www.numdam.org/item/AST_1983__46__1_0.pdf). Astérisque 46, third edition 1983 (original 1977), Numdam scan
- [Jean-Pierre Serre, Le problème des groupes de congruence pour SL₂](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf). Annals of Mathematics 92 (1970), pp. 489–527; author-hosted scan
- [Richard Taylor and Andrew Wiles, Ring-theoretic properties of certain Hecke algebras](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf). Author manuscript dated 7 October 1994, pp. 1–22; Proposition 1 on pp. 7–8 (published Annals 141 (1995), pp. 553–572 has different pagination)
- [Jens Funke and John Millson, Spectacle cycles with coefficients and modular forms of half-integral weight](https://arxiv.org/pdf/1108.5309). arXiv:1108.5309v1 identifier (26 August 2011); the author PDF carries the date 27 August 2021.
- [Nicholas I. Shepherd-Barron and Richard Taylor, Mod 2 and mod 5 icosahedral representations](https://math.stanford.edu/~rltaylor/klein.pdf). Author copy, Lemma 1.1 on p.3; published JAMS 10 (1997), 283–298.
- [Ana Caraiani and James Newton, On the modularity of elliptic curves over imaginary quadratic fields](https://www.ma.imperial.ac.uk/~acaraian/papers/Modularity-IQF.pdf). Author copy, Proposition 7.1.3 on p.94.

## Downstream consumers

ShimuraVarieties uses Layers 1–10 for its `GL₂` comparison, and ShimuraCompactifications uses Layers 2–10 for dimension-one degeneration. GrossZagierAndArithmeticHeights uses the integral curves, local models and correspondences of Layers 2–13 and 17. KatoEulerSystems, HeegnerPointEulerSystems, EllipticRegulators and ModularSymbolsPadicLFunctions use the cusp, Hecke and cohomological interfaces of Layers 3–17. AutomorphicGaloisRepresentations and GL2AutomorphicRepresentationsAndTransfer use Layers 13–17; SerreWeightAndLevelOptimisation and AutomorphyLiftingBeyondTaylorWiles use Layers 11–17. AnabelianGeometryAndNonabelianChabauty NC.5 uses the level-13 split-Cartan model in Layer 11. CompletedCohomologyPartII, PadicFamilies, PadicHodgeTheory, PeriodsAndSpecialValues and WeightsInEtaleCohomology use the curve and coefficient carriers of Layers 3–6 and 14.

The level-lowering and integral-intersection uses have the following scope. The coefficient characteristic is distinct from the geometric residue characteristic wherever an étale Tate module is used.

| Case | Modular geometry | Use and restrictions |
| --- | --- | --- |
| Good `p∤N`, ordinary and supersingular `Γ₁` level | §§11.1, 11.5 and 12.4 | Igusa/Frobenius inputs for Serre weights; use a prime-to-p auxiliary rigidifier at small level. |
| `Γ₁(M)∩Γ₀(p)`, `p∤M`, with arbitrary coefficient-prime powers in M | §§11.5 and 12.1–12.4 | Mazur principle and trivial-character `Γ₀(Mp)` level lowering with `p≠ℓ` and odd `ℓ`. At `p=2,3` the fine model and wild coarse descent are distinct. |
| `Γ₀(pⁿM)`, `n≥1`, `p∤M` | §§5.5 and 11.2–11.4 | The all-level Gross–Zagier intersection model. The regular coarse resolution and its exceptional-divisor data are specified for `p>3`; the wild interior calculation at 2,3 is the additional input in §11.4. |
| Two added primes p,q, `pq∤M` | §§11.5, 12.2 and 12.4 | Character-group and Jacobian oldspace matrices. SerreWeightAndLevelOptimisation owns the level-lowering exact sequence, using the modular maps and finite lattice errors of §17.6. Ribet–Stein (3.2) additionally requires a separately owned quaternionic/Cerednik–Drinfeld construction. |
| Coefficient characteristic 2, M odd or 2∥M, p odd and `p∤M` | §§11.5 and 12.1–12.4 | Buzzard’s mod-2 level control, including geometric `p=3` and its wild coarse quotient calculation. The minus-projector and odd-`ℓ` Taylor–Wiles statements do not extend to this case. |
| `Γ₀(p²M)`, `p>3`; split Cartan `ℓ=12k+1` | §§11.6–11.8 | The specified ramified nodal extension and level-13 Chabauty model. These calculations give no stable-model formula for `pⁿ` with `n>2`. |

EffectiveDiophantineMethods ED.6, EllipticCurveModularityWild3Adic W3.6 and EllipticCurveModularityImaginaryQuadratic IQ.4 also need explicit generic calculations on the Cartan, twisted and Atkin–Lehner carriers of §§5.14 and 9.5–9.8. Their additional mathematical inputs are the rationality of the determinant-compatible level-five twist, the genera of `X₀(4)`, `X₀(9)`, `X₀(25)`, `X₀(49)` and the fixed-point count of `w₄₉`, and normalized genus-zero Borel/Cartan coordinates. The level-five rationality input is Shepherd-Barron–Taylor, Lemma 1.1, author p.3: it requires the `SL₂` lift and trivialization of the twisting cocycle, in addition to geometric genus zero. The normalized coordinate input is Caraiani–Newton, Proposition 7.1.3, p.94 of the author copy linked below. The component fields, determinant actions and cusp fields are §§6.3 and 10.1. These generic calculations require their own genus, rational-point and coordinate arguments; construction of the carrier alone does not supply them.
