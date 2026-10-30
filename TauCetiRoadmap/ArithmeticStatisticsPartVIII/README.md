# Roadmap: arithmetic statistics, Part VIII: function-field distributions and geometric statistics

**Summary.** Prove the geometric statistics and function-field comparisons through local densities, polarized counting, monodromy, Hurwitz components and uniform trace bounds. Keep fixed-`q` degree limits, fixed-degree large-`q` limits and whole-component `liminf/limsup` statements distinct.

## Scope and ownership

This part owns Layer 5 §§5.12–5.22 of the arithmetic-statistics roadmap, the geometric and function-field statistics. Section numbers keep the six-layer numbering shared by the eight parts (Layer 0 families and heights, Layer 1 orbit dictionaries, Layer 2 counts, Layer 3 field and finite-group tools, Layer 4 Selmer means, Layer 5 probability models and geometric comparisons); a lower layer named in a proof is reached through the link to the part that states it. The targets fall into five groups.

- §5.12: first and second moments of the local densities of random primitive hypersurfaces, with the Taylor and Hensel lifting lemmas they need (Browning–Le Boudec–Sawin, §5).

- §§5.13–5.14: concentration of the isogeny types of principally polarized abelian varieties over a prime field, conditional on Lipnowski–Tsimerman's Conjecture 5.2 and its analogue with the real-Weil surface, and its two consequences: an atom at zero in the averaged eigenangle spacing law, and the failure of the enhanced Cohen–Lenstra model for this family.

- §§5.15–5.19: the Ellenberg–Venkatesh–Westerland theorem. Class-group surjection moments of imaginary quadratic function fields become point counts of generalized-dihedral Hurwitz schemes. A uniform trace estimate, the symplectic monodromy of the odd-degree hyperelliptic family (Achter–Pries, Vasiu) and the uniqueness of the Frobenius-stable symplectic orbit then give the large-`q` Cohen–Lenstra theorem for the upper and lower degree densities.

- §§5.20–5.21: Wood's nonabelian moments in the eventual-degree large-`q` mode, the `liminf` bound for bad types and the whole fixed-degree component profile, which decides when an ordinary limit exists.

- §5.22: the Liu–Wood–Zureick-Brown moments of unramified semidirect extensions of `𝔽_q(t)`, and the Cohen–Lenstra–Martinet corollary.

The following boundaries fix the carriers.

- InverseGaloisAndArithmeticFundamentalGroups owns Hurwitz moduli, their fixed-degree cohomology and point counts, component invariants, reduced Schur multipliers, coprime complements and the marked-extension dictionary. Existence and conjugacy of coprime complements are its §IG.4.5 *Coprime profinite complements*; §5.22 adds only the count `[H : H^Γ]` of sections. Its §IG.5.5 *Fixed-degree uniform Hurwitz point estimate* is the per-component bound used in §§5.20–5.21. The trace estimate of §5.16 differs from it in being uniform in the dimension under an explicit Betti-number hypothesis. Its supplied interfaces and the additional constructions owned here are listed under Exact supplier contracts.

- AbelianSchemesAndArithmeticModuli §§A2, A3.2–A3.7, A6.18–A6.19 own torsion subschemes, Weil pairings, polarizations, Rosati orbits of principal polarizations and finiteness of polarized automorphism groups. JacobianChallengePartII §§1.2–1.4 supply the relative Jacobian and its canonical principal polarization for the positive-genus hyperelliptic family, with arbitrary-base-change comparisons; genus zero uses the trivial principally polarized abelian scheme. GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3, 2.8, 3.3 own lattice indices, hermitian lattices and masses. EtaleDualityAndPerverseSheaves §§0.5–0.6 own Poincaré duality. DeligneWeightsAndPurity item 7.12 and §§1.4–1.6 supply Deligne's weight bounds and the point-count formulas for curves and abelian varieties over finite fields. Tau Ceti supplies the Hasse bound `WeierstrassCurve.hasse_bound`.

- Mathlib supplies distribution functions and the equality of probability measures with equal distribution functions; the Kolmogorov distance built on them here is new. Mathlib's `Matrix.symplecticGroup` is the multiplier-one case of the similitude cosets of §5.18. Tau Ceti proves in `TauCeti.GLSymplecticFin.eq_top_of_adjacent_of_long` that a subgroup of its symplectic matrix group over a field containing both orientations of the adjacent short-root elements and the positive and negative long-root subgroups at one coordinate is the whole group. Section 5.17 derives transvection generation from this supplied theorem.

- Earlier parts supply the remaining inputs: Part I the local-density, polarized-count, function-field and Wood-normalization targets; Part IV Cohen–Lenstra measures and the moment tools; Part V the nonabelian quadratic moment interface and embedded types; Part VII the enhanced Cohen–Lenstra finite-level law. The analytic prerequisites enter through the earlier parts.

## Conventions

A finite-field cardinality `q` is a prime power greater than one; the moment theorems further assume `q` coprime to the group order, or odd, as stated. A letter `p` or `ℓ` declared prime is a natural prime; `λ` denotes a coefficient prime different from the characteristic. Empty products have value one, the trivial group and zero-dimensional spaces are retained, and a natural cardinal is used only after finiteness is proved. An average over an empty finite slice is zero, but every limiting statement concerns inhabited slices.

On torsion points and Tate modules, Frobenius means arithmetic Frobenius, which multiplies the Weil pairing by `q`. The trace formula uses geometric Frobenius on compactly supported cohomology. The two are never interchanged. Symplectic matrices follow Mathlib: `Matrix.J l R = fromBlocks 0 (-1) 1 0` and `Matrix.symplecticGroup l R = {h | h * J * hᵀ = J}`; the similitude coset of multiplier `m` is `{h | h J hᵀ = m J}`.

Three limit modes are kept distinct. EVW's upper and lower densities take odd `n → ∞` at fixed `q`, then `q → ∞`. Wood's eventual-degree mode fixes a large `n` and lets `q → ∞`. Liu–Wood–Zureick-Brown take `lim_b` of `limsup_q` and `liminf_q` of averages over degrees at most `b`. No two are interchanged without a stated uniform estimate. Convergence of distributions does not give convergence of unbounded moments. Every conjecture is a proposition, never an axiom. The Haar measure on `M_g(ℤ_ℓ)` has total mass one.

## Exact supplier contracts

### From Mathlib

The pinned Mathlib supplies the following:

- polynomial evaluation and partial derivatives: `MvPolynomial.eval_map`, `MvPolynomial.induction_on`, `MvPolynomial.pderiv`, `MvPolynomial.pderiv_mul`, `Ideal.Quotient.eq_zero_iff_mem`, `Nat.findGreatest`;

- counting: `Nat.choose`, `Finset.Nat.antidiagonalTuple`, `PowerSeries`;

- probability: `MeasureTheory.ProbabilityMeasure`, `MeasureTheory.diracProba`, `MeasureTheory.Measure.dirac`, `ProbabilityTheory.cdf`, `cdf_le_one`, `cdf_eq_real` and the equality criterion `MeasureTheory.Measure.eq_of_cdf`;

- angles and roots: `Multiset.sort`, `Multiset.count`, `Polynomial.roots`, `Complex.arg`, `toIcoMod`;

- order and limits: `le_ciSup`, `Real.log_nonneg`, `Filter.Tendsto`, `Filter.atTop`, `Filter.limsup` and its dual `liminf`, `tendsto_nhds_unique`, `Filter.tendsto_pure`, `Finite.instDiscreteTopology`;

- matrices and `p`-adics: `Matrix.J`, `Matrix.symplecticGroup`, `SymplecticGroup.mem_iff`, `Matrix.GeneralLinearGroup`, `PadicInt`, `ZMod`, `Module.End.maxGenEigenspace`;

- groups: `SemidirectProduct` with `inl`, `inr` and `rightHom`, `MulEquiv.inv`, `Subgroup.center`, the Schur–Zassenhaus existence theorem `Subgroup.exists_right_complement'_of_coprime`, `CommGroup.primaryComponent`;

- class groups: `ClassGroup` and `integralClosure`.

### From Tau Ceti

`TauCeti.AlgebraicGeometry.EllipticCurve.HasseBound` supplies `WeierstrassCurve.hasse_bound` and `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card` for an elliptic Weierstrass curve over any finite field, with the point at infinity included. Applied at `q = p²` this gives `#E(F_{p²}) ≤ (p + 1)²` (Silverman, AEC V.1.1).

`TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Symplectic.TorusGeneration` supplies `TauCeti.GLSymplecticFin.eq_top_of_adjacent_of_long`: over a field, a subgroup containing both adjacent difference-root orientations and the positive and negative long-root subgroups at one coordinate is the whole symplectic group. Section 5.17 uses this generation theorem to obtain transvection generation; it does not specify another root-generation theorem.

### From InverseGaloisAndArithmeticFundamentalGroups

*Uses*:

- Layer IG.0. §IG.0.T4 is the constant-sheaf Grothendieck–Lefschetz formula `#X(k_r) = Σ_i (−1)^i Tr(Frob_{q^r} | H^i_c(X_k̄, ℚ_ℓ))` for separated `X` of finite type. §IG.0.3 identifies finite étale covers of a connected normal base with finite continuous `π₁`-sets; hence the connected components of a finite étale cover are the `π₁`-orbits on a geometric fibre.

- Layer IG.1. §IG.1.2 gives tame quotients. The geometric/arithmetic fundamental-group sequence over `𝔽_q` shows that a geometric component is defined over `𝔽_q` exactly when Frobenius preserves its orbit.

- Layer IG.3. §IG.3.4 gives the reduced Schur multiplier `M(G, c) = M(G)/Q_c` (Wood's `H₂(G, c)`) and the reduced Schur covers. Its item *Coprime semidirect products and admissible inertia* covers `H ⋊ Γ` with `c` the elements of order equal to the order of their image; for `A ⋊ ℤ/2` with `A` odd it gives (iii) and the conjugation and power stability in (ii) of the generalized dihedral datum. §IG.3.5 gives the action of units; §IG.3.6 gives lifting invariants, the stable classification of braid orbits and the Tate-twisted arithmetic lifting invariants.

- Layer IG.4. §IG.4.5 gives *Coprime profinite complements* and the unramified admissible `Γ`-groups `Gal(K^#/K)` (Liu–Wood–Zureick-Brown, Definition 2.1). §IG.4.6 gives *Marked extensions and their infinity types* (Wood, Proposition 4.4, with the swap and coordinate-projection hypotheses stated there, and `Disc M = Disc K^{|G′|/2}` for tame quadratic function fields) and *The marked extension count over `𝔽_q(t)`*, which defines `N(H, Γ, D, 𝔽_q(t))`.

- Layer IG.5.
  - §IG.5.3 *Arithmetic Hurwitz stacks and schemes*: finite étale over the configuration space; for `Z(G) = 1` the `k`-points are `G`-covers defined over `k`. The same section's *Component bound from finite étale degree* gives `D_n`.
  - §IG.5.4: admissible covers and the compact-type locus.
  - §IG.5.5: tame cohomological specialization (EVW, Proposition 7.7); the fixed-degree comparison and rational Betti dimensions (LWZB, Lemma 10.3); *Finite Hurwitz cohomology and the trace formula*; the *Fixed-degree uniform Hurwitz point estimate* `|#C(𝔽_q) − q^n| ≤ K_n q^{n−1/2}` (Wood, Theorem 4.7); and *Hurwitz points and marked extensions* (LWZB, Lemma 10.2; Wood, Theorem 4.5(2), for the ordinary marking at unramified `∞`).
  - §IG.5.6: component lifting invariants, the *General rational-class fixed-fiber formula* (`|A[q − 1]|` or zero per stable multiplicity vector, for the unramified-`∞` marking) and *Semidirect components versus quotient components* (LWZB, Theorem 10.4).
  - §IG.5.7: *The labelled hyperelliptic quotient family* `[PConf_n(A¹)/Ã_n]`, with `Ã_n` the lifted affine coordinate group, written `B_n` below, and the *Finite-cover criteria for full monodromy image*. These criteria cover a dense open substack of a connected normal stack, a representable smooth surjection with geometrically connected fibres, and the passage from the compact-type locus to the smooth locus.

*Additional interfaces built here on IG.5.3–IG.5.6:*

- (IG-a) EVW's Hurwitz scheme `Hn^c_{G,n}` of tame `G`-covers of `P¹` branched at `n` points of `A¹` and possibly at `∞` (EVW §§7.1, 7.3). For `G` centre-free and `k` of characteristic prime to `|G|`, construct the bijection of `k`-points with covers defined over `k`, allowing ramification at `∞`. This extends the ordinary unramified-`∞` marking of §IG.5.3.

- (IG-b) Wood's marked scheme `CHur^{c,g}_{F,m}` for tangential infinity types `g ∈ c ∪ {1}` (Wood, Theorem 4.5(2)), and Theorem 4.5(3). In the stable range `m_i ≥ N₀` identify its Frobenius-fixed geometric components with the `q⁻¹`-fixed component invariants. For the surviving parity vectors of Wood's Proposition 4.1 and Remark 4.2 prove their number is `|H₂(F, c)[q − 1]|`, and zero otherwise. The fixed-fibre formulas of §IG.5.6 cover only the unramified-`∞` marking.

*Uniform Betti hypothesis (HS).* For a nonsplitting pair `(G, c)`, with `G` centre-free and `c` a rational class generating `G`, assume a constant `C(G, c) ≥ 1` such that `dim H^i(Hn^c_{G,n} ⊗ 𝔽̄_q, ℚ_λ) ≤ C(G, c)^{i+1}` for all `i` and `n` and all coefficient primes `λ > max(|G|, q, n)`, with characteristic prime to `|G|`. Section 5.19 is conditional on this hypothesis, separately from IG.5.5's fixed-degree comparison. Source: EVW Proposition 7.8, p.769, using Theorem 6.1 and Corollary 6.2.

For IG-a construct the finite étale morphism `evwHurwitzScheme G c n → Conf_n` over `ℤ[1/|G|]`, its base-change isomorphisms and its centre-free rational-point classification, retaining the inertia at `∞`. For IG-b construct `woodMarkedHurwitzScheme F c g m`, its branch-degree and infinity-marking maps, the component-invariant bijection in the stable range and its Frobenius equivariance. The rational-component API includes the surviving-parity count and zero for incompatible parities; it retains the tangential marking when `g ≠ 1`. Sources: EVW §§7.1, 7.3; Wood Theorem 4.5(2)–(3), pp.20–21.

**Checks.** For IG-a the trivial group at `n = 0` gives the trivial cover; generalized-dihedral covers with odd `n` ramify at `∞`; for `A = C₃` the sign quotient has four geometric points when the torsion fibre is `𝔽₃²`. For IG-b the imaginary degree is `2n − 1` with nontrivial infinity inertia; the real degree is `2n` with `g = 1`; an incompatible parity vector gives zero rational components, whereas a surviving stable vector gives `|H₂(F,c)[q − 1]|`.

### From AbelianSchemesAndArithmeticModuli

*Uses*:

- §A2: polarizations and duality.

- §A3.2: `A[n]` is finite locally free of rank `n^{2g}`, étale where `n` is invertible, and compatible with base change.

- §A3.5: the Cartier-dual pairing `e_n`.

- §A3.7: the pairing `e_{λ,n}` of a polarization is strongly alternating, and perfect when `λ` is principal.

- §A6.5: Poincaré complete reducibility.

- §A6.18: finiteness of `Aut(A, λ)`.

- §A6.19: principal polarizations correspond to the Rosati-symmetric totally positive units, and their isomorphism classes are the orbits of `s ↦ u^†su`.

### From JacobianChallengePartII

*Uses:* §§1.2–1.4 supply the relative Jacobian of a smooth projective relative curve with geometrically connected fibres of constant genus `g > 0` over a noetherian base, its canonical principal polarization and their comparisons under every base change.

For odd `n = 2g + 1`, let `S = Conf_n ⊗ ℤ[1/2]` and let `C/S` be the smooth projective completion of the family `y² = f(x)`, with its section at `∞`. The base `S` is noetherian and the fibres are geometrically connected of genus `g`. Define `hyperellipticJacobian n` for `g > 0` as the instance of JacobianChallengePartII §§1.2–1.4 for `C/S`, with its canonical principal polarization; for `g = 0` use the trivial abelian scheme `S → S` with its unique principal polarization. This roadmap owns the hyperelliptic-model comparisons: identify the field fibres with the pointed curves' Jacobians and their polarizations, identify the relative dimension with `g`, and retain the supplied comparisons for every `T → S`, including nonreduced and non-noetherian `T`. Apply AbelianSchemesAndArithmeticModuli §§A3.2, A3.5, A3.7 to obtain the perfect alternating Weil pairing on each invertible torsion sheaf. Counting and local-condition statements for this parameter family belong here. Sources: EVW proof of Theorem 8.8, pp.779–780; Achter–Pries §3.1 and Lemma 3.1.

**Checks.** In characteristic different from two, at `n = 1` the Jacobian is the zero-dimensional trivial abelian scheme with its unique principal polarization; at `n = 3` it is the elliptic curve with its point at `∞`; at invertible `ℓ` the `ℓ^m`-torsion has rank `ℓ^{2mg}`, while this étale assertion does not extend to `ℓ` equal to the characteristic. For `T = Spec(k[ε]/ε²) → S`, the base-change comparison respects the group law and principal polarization over all of `T`. In characteristic two, `f = x³ + x + 1` is squarefree but `y² = f` is singular at `(1,1)` and has rational normalization, so it is excluded.

### From GeometryOfNumbersAndQuadraticArithmetic

*Uses*: Layer 0, primitive vectors, saturation and covolumes (§§0.2–0.3); Layer 2, quaternionic hermitian lattices (§2.8); Layer 3, masses of genera (§3.3).

*Additional targets here:* the following four inputs extend the supplied lattice and mass theory.

- (GN-a) Browning–Le Boudec–Sawin, Definition 3.7 and Lemma 3.9. `G(c₁, …, c_k)` is the nonnegative `gcd` of the maximal minors, with `G = 0` for an all-zero list. For linearly independent primitive `c, d ∈ ℤ^N` and `Q ≥ 1`, the lattice `{y : ⟨c, y⟩ ≡ ⟨d, y⟩ ≡ 0 mod Q}` has index `Q²/gcd(G(c, d), Q)` in `ℤ^N`.

- (GN-b) Lipnowski–Tsimerman, Definition 5.1: the model ring `R_{L,n} = ∏ M_{n_i}(O_{L_i})` with the conjugate-transpose involution, and its quaternionic analogue `M_m(O_D)`.

- (GN-c) The corrected Lipnowski–Tsimerman bound (55), `log n_{L,n} ≤ (1/2) Σ_i [K_i:ℚ] n_i² log n_i + C_p g²`.

- (GN-d) The quaternionic bound `log n_D(m) ≤ 2m² log m + O_p(m²)`, from Gan–Hanke–Yu, [[52]](#ref-52), §9, (9.1)–(9.2) and Proposition 9.3, pp.121–122 of the author PDF.

The API for GN-a is `minorContent`, its nonnegativity, invariance under unimodular row operations, equality with the saturation index for independent columns, and the displayed two-congruence index formula. For GN-b specify `modelRing L n` and `quaternionicModelRing D m` with their conjugate-transpose involutions; require the product projections, involution laws and the positive-symmetric-unit conjugation action. For GN-c and GN-d define the corresponding orbit cardinalities `modelPositiveUnitCount` and `quaternionicPositiveUnitCount`, prove finiteness and invariance under isomorphism of rings with involution, and prove the displayed logarithmic bounds with constants depending only on `p`. Here `L_i` form an indexed finite family of CM fields generated by `p`-Weil numbers, allowing repetitions as abstract fields; the indices label distinct simple isogeny factors. Write `K_i` for their maximal totally real subfields and `g = Σ_i [K_i:ℚ]n_i`. The algebra `D` is the quaternion algebra over `ℚ(√p)` ramified exactly at its two infinite places, as in §5.13.

For GN-c prove `modelPositiveUnitCount_product`: for a finite product of rings with componentwise involution and positivity, the positive-unit orbit count is the product of the individual counts. Units act componentwise even when two rings are isomorphic. Apply the single-block estimate to each indexed block and sum its logarithm; `Σ_i ([K_i:ℚ]n_i)² ≤ g²` absorbs the errors. Nonisogenous simple factors with isomorphic endomorphism fields have no cross-homomorphisms and remain separate blocks.

For GN-d identify positive symmetric units modulo `GL_m(O_D)` with free unimodular positive quaternion-hermitian `O_D`-lattices. Prove that all such lattices lie in the single genus of the standard lattice: positivity fixes the infinite forms, and at every finite place `D` splits and a self-dual lattice is the standard symplectic lattice under Morita equivalence. For the rational-space comparison, diagonalize the positive hermitian form. Each diagonal coefficient is totally positive and hence a reduced norm from `D`: apply GlobalQuadraticForms Layer 5, Hasse–Minkowski, to the reduced-norm form with the negative of that coefficient adjoined. It is isotropic at every completion, and the norm form of the division algebra is anisotropic over the number field, so the last coordinate of a global isotropic vector is nonzero. Rescaling each diagonal basis vector then identifies the rational form with the standard one. Their local stabilizers are hyperspecial, so Proposition 9.3 gives the mass of this genus as
`Mass_D(m) = 2^{−2m} ∏_{r=1}^m |ζ_{ℚ(√p)}(1−2r)|` for `m ≥ 1`.
The genus includes projective lattices, so its mass is not the free-class count. A lattice's finite automorphism group embeds in `GL_{8m}(ℤ)`; the integral finite-subgroup bound of Lipnowski–Tsimerman §5.4.4, (52), p.31 gives order at most `exp(O(m log(m+1)))`. Consequently `n_D(m) ≤ exp(O(m log(m+1))) Mass_D(m)`. The functional equation of the quadratic Dedekind zeta function and Stirling's estimate give `log Mass_D(m) = 2m² log m + O_p(m²)`: the factorial contribution is `2Σ_{r≤m} log((2r−1)!)`. This proves the required upper bound without applying the CM-hermitian formula (55). This uses GlobalQuadraticForms Layer 5 for the norm argument, GeometryOfNumbersAndQuadraticArithmetic §2.8 for quaternionic lattices and Morita stabilizers, and GeometryOfNumbersAndQuadraticArithmetic §3.3, *Completed zeta factors for the mass normalization*, for the continued Dedekind zeta values and their functional-equation comparison at negative odd integers.

**Checks.**

- For GN-a the columns `(1,0), (0,1)` have content 1 and index `Q²`; the columns `(1,0), (1,p)` have content `p` and index `p` at `Q = p`; dependent equal columns have content 0, and the independent-column saturation formula cannot be applied.

- For `modelRing`, in `ℤ[i]` one has `i* = −i`; `[[0,1+i],[2,0]]* = [[0,2],[1−i,0]]`; in `ℤ[i] × ℤ[i]`, `(i,1+i)* = (−i,1−i)`.

- For `quaternionicModelRing`, with Hamilton generators in `ℍ_ℚ ⊗_ℚ ℚ(√2)`, `i* = −i`, `(ij)* = j*i* = −ij`, and `[[0,i],[j,0]]* = [[0,−j],[−i,0]]`.

- For `modelPositiveUnitCount`, the empty product has count one; a single imaginary-quadratic rank-one block has count one; the `ℤ[i]` rank-eight count is at least two, since `I₈` has a norm-one vector and the `E₈` Gram matrix has only even hermitian norms (write a Gaussian vector as `a+ib`). The product of the rank-eight block and a rank-one block still has count at least two.

- For `quaternionicPositiveUnitCount`, rank zero has count one, and rank one has count one over both `ℚ(√2)` and `ℚ(√5)`: their totally positive units are squares of central units, so every positive symmetric unit is conjugate to 1.

- For GN-d the empty genus has mass one; `Mass_D(1) = |ζ_{ℚ(√p)}(−1)|/4`; and `Mass_D(2)/Mass_D(1) = |ζ_{ℚ(√p)}(−3)|/4`. The dimension is `2m`, giving `2m² log m = (1/2)(2m)² log(2m) + O(m²)`.

### From EtaleDualityAndPerverseSheaves

*Uses*: Layer 0, §0.5, Poincaré duality for smooth varieties with torsion coefficients, and §0.6, its `ℓ`-adic and rational form. The pairing `H^i_c × H^{2d−i}(F^∨(d)) → E` is perfect and Frobenius-compatible, and the top-degree trace is an isomorphism for geometrically connected `X`. Two consequences are used here. For a smooth `X` of pure dimension `n, dim H^j_c = dim H^{2n−j}`. For a geometrically connected smooth `C` of dimension `n, H^{2n}_c(C, ℚ_λ) ≅ ℚ_λ(−n)`.

### From DeligneWeightsAndPurity

*Uses*:

- Item 7.12 (Weil II 3.3.4): every eigenvalue of geometric Frobenius on `H^j_c(X_{𝔽̄_q}, ℚ_λ)` has absolute value at most `q^{j/2}`.

- §§1.4–1.5: the Frobenius roots of an abelian variety over `𝔽_q` are Weil `q`-numbers of weight one, and `#A(F_{q^m}) = P_{π^m}(1)`.

- §1.6: the point count of a curve.

Hence the characteristic polynomial of an isogeny factor divides that of `A`, and `#B₀(𝔽_p) = (p − 1)²`.

### From earlier arithmetic-statistics parts

From ArithmeticStatisticsPartI require [ArithmeticStatisticsPartI: local density of a form modulo q][part-1], [ArithmeticStatisticsPartI: coefficient vector form][part-2], [ArithmeticStatisticsPartI: primitive hypersurface family][part-3], [ArithmeticStatisticsPartI: finite local hypersurface set][part-4], [ArithmeticStatisticsPartI: arithmetic family][part-5], [ArithmeticStatisticsPartI: principally polarized count][part-6], [ArithmeticStatisticsPartI: polarization fiber count][part-7], [ArithmeticStatisticsPartI: support abelian counts][part-8], [ArithmeticStatisticsPartI: odd degree quadratic function field family][part-9], [ArithmeticStatisticsPartI: support function fields][part-10], [ArithmeticStatisticsPartI: size of the odd degree quadratic family][part-11], [ArithmeticStatisticsPartI: imaginary exact slice parametrization][part-12], [ArithmeticStatisticsPartI: wood average normalizations][part-13], [ArithmeticStatisticsPartI: wood infinity and type adapter][part-14], [ArithmeticStatisticsPartI: real exact slice parametrization][part-15]. Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartIV require [ArithmeticStatisticsPartIV: cohen lenstra measure][part-16], [ArithmeticStatisticsPartIV: surjection count][part-17], [ArithmeticStatisticsPartIV: isomorphism classes of finite abelian p groups][part-18], [ArithmeticStatisticsPartIV: surjection moment][part-19], [ArithmeticStatisticsPartIV: finite moment control of masses][part-20]. Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartV require [ArithmeticStatisticsPartV: nonabelian quadratic moment interface][part-21], [ArithmeticStatisticsPartV: support embedded types][part-22]. Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

From ArithmeticStatisticsPartVII require [ArithmeticStatisticsPartVII: zero cokernel probability at two][part-23], [ArithmeticStatisticsPartVII: zero cokernel probability lower bound at odd primes][part-24], [ArithmeticStatisticsPartVII: enhanced cohen lenstra finite level law][part-25], [ArithmeticStatisticsPartVII: enhanced cohen lenstra conjecture][part-26]. Their hypotheses, weights, cutoffs and normalizations are retained at the point of use below.

## How to read the build

The groups are read in order. §5.12 is self-contained apart from the Part I density carriers and item GN-a. §§5.13–5.14 rest on the Lipnowski–Tsimerman hypotheses and items GN-b to GN-d. §§5.15–5.19 form one chain: the class-group dictionary (§5.15), the trace estimate (§5.16), monodromy (§5.17), the orbit count (§5.18) and the large-`q` theorem (§5.19). §§5.20–5.21 apply the Wood normalizations of Part I to the components of item IG-b. §5.22 uses only group theory and the Hurwitz counts of IG Layer IG.5. Each target states its hypotheses, source locator and Checks. `Suggested.lean` states the local-density moment bounds, the integral symplectic lifting criterion and the unique similitude-stable orbit theorem. Its module docstring identifies the objects needed to state the other arithmetic headlines; the definitions and basic theory specified below are part of the roadmap.

## Layer 5: Function-field distributions and geometric statistics

The finite and locally compact random-intersection models supply exact probability laws. Arithmetic conjectures identify a specified empirical family with such a law and separately assert its unbounded moments. Function-field theorems instead use the class-field/Hurwitz dictionary, arithmetic component action, trace estimates and their specified order of limits. The full component profile includes the unstable boundary, so a stable-range lower bound does not imply an ordinary limit.

### 5.12 Hypersurface local-density moments

<a id="polynomial-congruence-under-perturbation"></a>

**Polynomial congruence under perturbation.** Let `R` be a commutative ring, `σ` a set of variables, `f ∈ R[X_i : i ∈ σ]` and `x, h ∈ R^σ`. Then `f(x + h) − f(x)` lies in the ideal `(h_i : i ∈ σ)`. In particular, for `R = ℤ` and `h ≡ 0 mod p^c` coordinatewise, `f(x + h) ≡ f(x) mod p^c`; applied to the partial derivatives, `∇f(x + h) ≡ ∇f(x) mod p^c`.

*Proof.* Let `I = (h_i : i ∈ σ)` and `π: R → R/I` the quotient map. Evaluation commutes with ring homomorphisms (Mathlib `MvPolynomial.eval_map`): `π(f(x + h)) = (π f)(π(x + h)) = (π f)(π(x)) = π(f(x))`, since `π(h_i) = 0`. Hence `π(f(x + h) − f(x)) = 0`, i.e. `f(x + h) − f(x) ∈ I` (Mathlib `Ideal.Quotient.eq_zero_iff_mem`).

*Needs:* `MvPolynomial.eval_map` (Mathlib), `Ideal.Quotient.eq_zero_iff_mem` (Mathlib).

([[47]](#ref-47), arXiv v4, proof of Lemma 3.3, p.13.)

**Checks.**

- `f = X_0², x = 1, h = 3` over `ℤ: 16 − 1 = 15 ∈ (3)`.

- For a constant polynomial the difference is 0.

<a id="first-order-taylor-congruence"></a>

**First order taylor congruence.** Let `R` be a commutative ring, `σ` a finite set of variables, `f ∈ R[X_i : i ∈ σ]` and `x, h ∈ R^σ`. Then `f(x + h) − f(x) − Σ_i h_i ∂f/∂X_i(x)` lies in the ideal generated by the products `h_i h_j (i, j ∈ σ)`. In particular, over `ℤ`, if `b ≡ x mod p^c` then `f(b) ≡ f(x) + ⟨∇f(x), b − x⟩ mod p^{2c}`.

*Proof.* Induct on `f` (Mathlib `MvPolynomial.induction_on`): constants have zero derivative and zero difference; the statement is additive in `f`. For `f·X_k`, write `f(x+h) = f(x) + Σ_i h_i ∂_i f(x) + ρ` with `ρ` in the ideal `J = (h_i h_j)`; by the Leibniz rule (Mathlib `MvPolynomial.pderiv_mul`) `∂_i(f X_k)(x) = ∂_i f(x) x_k + δ_{ik} f(x)`. Then `(f X_k)(x+h) − (f X_k)(x) − Σ_i h_i ∂_i(f X_k)(x) = (Σ_i h_i ∂_i f(x)) h_k + ρ(x_k + h_k) ∈ J`.

*Needs:* `MvPolynomial.induction_on` (Mathlib), `MvPolynomial.pderiv` (Mathlib), `MvPolynomial.pderiv_mul` (Mathlib).

([[46]](#ref-46), arXiv v1, proof of Lemma 5.7, p.57; [[47]](#ref-47), arXiv v4, proof of Lemma 3.3, p.13.)

**Checks.**

- `f = X_0²` over `ℤ: (x+h)² − x² − 2xh = h²`.

- For `f` of degree `≤ 1` the remainder is 0.

<a id="local-density-first-moment"></a>

**Local density first moment.** Let `d ≥ 1, n ≥ 0, p` prime, `r ≥ 1` and `N = N_{d,n}`. Then `(1/#R_N(p^r)) Σ_{a ∈ R_N(p^r)} σ(a; p^r) = (1 − p^{−(n+1)})(1 − p^{−(N−1)})/(1 − p^{−N})`. In particular, for `d ≥ 2` and `n ≥ 1` (so `N ≥ n + 2`) the average lies in `[1 − 2p^{−(n+1)}, 1]`, which is the source's `1 + O(p^{−n−1})` (stated there for `d ≥ 2, n ≥ 3`).

`Suggested.lean` states this as `HypersurfaceDensity.local_density_first_moment`. The definitions `HypersurfaceDensity.primitiveVectors`, `HypersurfaceDensity.coefficientForm` and `HypersurfaceDensity.localDensity` use vectors over `ZMod`, the degree-`d` monomials from `Finset.Nat.antidiagonalTuple` and their actual homogeneous `MvPolynomial`. The monomial-set cardinality is `N_{d,n}`; primitivity means that the coordinate ideal is the unit ideal.

*Proof.* Swap the sums: `Σ_a σ(a; p^r) = p^{−rn} Σ_{b ∈ R_{n+1}(p^r)} #{a ∈ R_N(p^r) : ⟨a, ν_{d,n}(b)⟩ ≡ 0 mod p^r}` (coefficient-vector-form, `eval_form`). For primitive `b, ν_{d,n}(b)` is primitive (it contains `b_i^d` for a unit `b_i`), so `a ↦ ⟨a, ν(b)⟩` maps `(ℤ/p^r)^N` onto `ℤ/p^r` with kernel of size `p^{r(N−1)}`; the kernel elements with `a ≡ 0 mod p` are `p·a′` with `⟨a′, ν(b)⟩ ≡ 0 mod p^{r−1}, p^{(r−1)(N−1)}` of them. So the inner count is `p^{r(N−1)}(1 − p^{−(N−1)})`, independent of `b`. Insert `#R_m(p^r) = p^{rm}(1 − p^{−m})` (BLS (5.10), from the [ArithmeticStatisticsPartI §0.13][part-4] carriers of Part I) for `m = n + 1` and `m = N` and simplify. For the range: `(1 − p^{−(N−1)})/(1 − p^{−N}) ≤ 1` and `(1 − x)(1 − y) ≥ 1 − x − y` with `y = p^{−(N−1)} ≤ p^{−(n+1)}`.

*Needs:* [ArithmeticStatisticsPartI §0.10][part-1], [ArithmeticStatisticsPartI §0.10][part-2], [ArithmeticStatisticsPartI §0.13][part-3], [ArithmeticStatisticsPartI §0.13][part-4].

([[46]](#ref-46), arXiv v1, Lemma 5.4, pp.53–54; [[46]](#ref-46), arXiv v1, proof of Lemma 5.4, p.53.)

**Checks.**

- `n = 1, d = 1 (N = 2), r = 1`: the formula gives `1 − 1/p`, matching the direct count (every primitive linear form in two variables has exactly `p − 1` primitive zeros modulo `p`).

- The average does not depend on `r`.

- `n = 0`: the formula gives 0 (a primitive one-variable form a `X₀^d` has no primitive zero).

- The restriction `r≥1` is essential: modulo `p^0=1` there is one vector in every dimension and its coordinate ideal is the whole zero ring, whereas `p^{rm}(1−p^{−m})` is not 1.

<a id="two-point-incidence-count"></a>

**Two point incidence count.** Let `d ≥ 1, n ≥ 1, p` prime, `r ≥ 1, N = N_{d,n}` (so `N ≥ 2`) and `b₁, b₂ ∈ R_{n+1}(p^r)`. Let `v ∈ {0, …, r}` be the capped `p`-adic valuation of the minors of `(ν_{d,n}(b₁), ν_{d,n}(b₂))`, i.e. `p^v = gcd(G(ν(b₁), ν(b₂)), p^r)` for integral lifts. Then `#L(b₁, b₂; p^r) := #{a ∈ R_N(p^r) : f_a(b₁) ≡ f_a(b₂) ≡ 0 mod p^r} = p^{r(N−2)+v} − p^{(r−1)(N−2)+min(v, r−1)}`. This one formula covers both of the source's cases (`b₁, b₂` proportional modulo `p^r` is `v = r`), and gives `p^{r(N−2)+v}(1 − p^{−(N−2)}) ≤ #L ≤ p^{r(N−2)+v}`, which is (5.13).

*Proof.* Choose primitive integral lifts `c₁,c₂` (surjectivity of primitive vectors modulo `p^r` from unimodular completion). If they are dependent, complete `c₂` to an integral unimodular basis and choose another basis vector `v`; replacing `c₂` by `c₂+p^r v` preserves its residue and primitivity (basis coordinates `(1,p^r,0,…)`) and makes it independent of `c₁`. Their Veronese vectors are primitive and independent, since `d≥1` and the Veronese map is injective on projective points. By item GN-a (Browning–Le Boudec–Sawin, Lemma 3.9) the lattice `Λ^{(p^r)}_{ν(c₁)} ∩ Λ^{(p^r)}_{ν(c₂)}` has index `p^{2r}/gcd(G(ν(c₁), ν(c₂)), p^r)` in `ℤ^N`. It contains `p^r ℤ^N`, so the number of residues `a mod p^r` with `⟨a, ν(b₁)⟩ ≡ ⟨a, ν(b₂)⟩ ≡ 0` is `p^{rN}/index = p^{r(N−2)+v}`. The residues with `a ≡ 0 mod p` are `a = p a′` with `a′ mod p^{r−1}` satisfying the same two congruences modulo `p^{r−1}`; the same count at level `r − 1` gives `p^{(r−1)(N−2)+min(v, r−1)}` (for `r = 1` this is the single residue 0). Subtract; the bounds follow from `min(v, r − 1) ≤ v`.

*Needs:* [ArithmeticStatisticsPartI §0.10][part-2], item GN-a, [ArithmeticStatisticsPartI §0.13][part-3], [ArithmeticStatisticsPartI §0.13][part-4].

([[46]](#ref-46), arXiv v1, proof of Lemma 5.5, p.54; [[46]](#ref-46), arXiv v1, Lemma 3.9, p.11.)

**Checks.**

- `r = 1, b₁` and `b₂` independent modulo `p: #L = p^{N−2} − 1`.

- `b₂ = g b₁` with `g` a unit modulo `p^r: v = r` and `#L = p^{r(N−1)} − p^{(r−1)(N−1)}`, the one-point count of Lemma 5.4.

<a id="veronese-minor-valuation"></a>

**Veronese minor valuation.** Let `d ≥ 1, p` prime, `r ≥ 1` and `b₁, b₂ ∈ R_{n+1}(p^r)`. Then the capped `p`-adic valuations (at most `r`) of the minors of `(ν_{d,n}(b₁), ν_{d,n}(b₂))` and of `(b₁, b₂)` are equal. Use the nonnegative `gcd` of item GN-a, extended by 0 for an all-zero list of minors (so `gcd(0, p^r) = p^r`). Equivalently, for primitive integral lifts, `gcd(G(ν_{d,n}(c₁), ν_{d,n}(c₂)), p^r) = gcd(G(c₁, c₂), p^r)`; running over all `p` and `r` this is Lemma 3.11 of the source, `G(ν_{d,n}(x), ν_{d,n}(y)) = G(x, y)` for linearly independent primitive `x, y ∈ ℤ^{n+1}`.

*Proof.* Criterion: for `u` primitive modulo `p^r` with `u₀` a unit and any `w`, all minors of `(u, w)` vanish modulo `p^e (e ≤ r)` iff `w ≡ λu mod p^e` for some `λ (λ = w₀/u₀)`: the minors `u_0w_j − u_jw₀` give `w_j ≡ (w₀/u₀)u_j`, and the other minors are combinations of these after multiplying by the unit `u₀: u₀(u_iw_j − u_jw_i) = u_i(u_0w_j − u_jw₀) − u_j(u_0w_i − u_iw₀)`. If `b₂ ≡ λ b₁ mod p^e` then `ν(b₂) ≡ λ^d ν(b₁) mod p^e`, since every monomial has degree `d`. Conversely let `ν(b₂) ≡ μ ν(b₁) mod p^e` with `e ≥ 1` and (after renumbering) `b_{1,0}` a unit. The coordinates `X₀^d` and `X₀^{d−1}X_j` give `b_{2,0}^d ≡ μ b_{1,0}^d` and `b_{2,0}^{d−1}b_{2,j} ≡ μ b_{1,0}^{d−1}b_{1,j}`. If `p | b_{2,0}` then `p | μ` and `ν(b₂) ≡ 0 mod p`, contradicting the primitivity of `ν(b₂)`; so `b_{2,0}` is a unit and `b_{2,j} ≡ (b_{2,0}/b_{1,0}) b_{1,j} mod p^e`. By the criterion applied to `(ν(b₁), ν(b₂))` (`ν(b₁)` is primitive) and to `(b₁, b₂)`, both valuations are the largest `e ≤ r` for which `b₂` is proportional to `b₁` modulo `p^e`.

*Needs:* [ArithmeticStatisticsPartI §0.10][part-2], [ArithmeticStatisticsPartI §0.13][part-3], [ArithmeticStatisticsPartI §0.13][part-4], item GN-a.

([[46]](#ref-46), arXiv v1, Lemma 3.11, p.12.)

**Checks.**

- `d = 1: ν` is the identity and the statement is trivial.

- `x = (1, 0), y = (1, p)` in `ℤ², d = 2: ν(x) = (1, 0, 0), ν(y) = (1, p, p²)` and both gcds equal `p`.

- Dependent primitive vectors, e.g. `x = y = (1, 0)`, have all minors zero before and after Veronese. Their capped `gcd` is `p^r`, not 0; the positive-`gcd` definition for independent columns alone cannot state this finite-residue case.

<a id="primitive-pair-minor-gcd-sum"></a>

**Primitive pair minor gcd sum.** For `n ≥ 2, p` prime and `r ≥ 1: Σ_{b₁, b₂ ∈ R_{n+1}(p^r)} gcd(G(b₁, b₂), p^r) ≤ p^{2r(n+1)}((1 − p^{−(n+1)})² + 2p^{1−n})`. With the trivial lower bound `#R_{n+1}(p^r)²` this is (5.14): the sum is `p^{2r(n+1)}(1 + O(p^{1−n}))`, uniformly in `r`.

*Proof.* For fixed `b₁` and `1 ≤ j ≤ r`, the `b₂` with `p^j | G(b₁, b₂)` are those with `b₂ ≡ λb₁ mod p^j` for some `λ ∈ (ℤ/p^j)^×` (criterion in veronese-minor-valuation); there are at most `p^j · p^{(r−j)(n+1)} = p^{r(n+1)−jn}` of them. Write `gcd(G, p^r) = 1 + Σ_{1 ≤ j ≤ r, p^j | G}(p^j − p^{j−1}) ≤ 1 + Σ_{1 ≤ j ≤ r, p^j | G} p^j` and sum over pairs: the total is at most `#R_{n+1}(p^r)² + #R_{n+1}(p^r)·p^{r(n+1)} Σ_{j≥1} p^{−j(n−1)}`. For `n ≥ 2, p^{1−n} ≤ 1/2` so `Σ_{j≥1} p^{−j(n−1)} ≤ 2p^{1−n}`; insert `#R_{n+1}(p^r) = p^{r(n+1)}(1 − p^{−(n+1)}) ≤ p^{r(n+1)}` (BLS (5.10)).

*Needs:* [veronese minor valuation](#veronese-minor-valuation), [ArithmeticStatisticsPartI §0.13][part-3], [ArithmeticStatisticsPartI §0.13][part-4].

([[46]](#ref-46), arXiv v1, proof of Lemma 5.5, pp.54–55.)

**Checks.**

- `r = 1`: the pairs with `p | G` are the proportional pairs, `(p^{n+1} − 1)(p − 1)` of them, and the bound holds with room.

- The bound is uniform in `r`.

<a id="local-density-second-moment"></a>

**Local density second moment.** For `d ≥ 1, n ≥ 2, p` prime, `r ≥ 1` and `N = N_{d,n}: Σ_{a ∈ R_N(p^r)} σ(a; p^r)² ≤ p^{rN}((1 − p^{−(n+1)})² + 2p^{1−n})`. Dividing by `#R_N(p^r) = p^{rN}(1 − p^{−N})` gives the upper half of (5.15): the mean of `σ²` is at most `1 + O(p^{1−n})`.

`Suggested.lean` states this as `HypersurfaceDensity.local_density_second_moment`.

*Proof.* Expand `(5.12): Σ_a σ(a; p^r)² = p^{−2rn} Σ_{b₁, b₂ ∈ R_{n+1}(p^r)} #L(b₁, b₂; p^r)`. By two-point-incidence-count, `#L(b₁, b₂; p^r) ≤ p^{r(N−2)} gcd(G(ν(b₁), ν(b₂)), p^r)`. By veronese-minor-valuation, `gcd(G(ν(b₁), ν(b₂)), p^r) = gcd(G(b₁, b₂), p^r)`. Apply primitive-pair-minor-gcd-sum; the exponent is `−2rn + r(N−2) + 2r(n+1) = rN`.

*Needs:* [ArithmeticStatisticsPartI §0.10][part-1], [two point incidence count](#two-point-incidence-count), [veronese minor valuation](#veronese-minor-valuation), [primitive pair minor gcd sum](#primitive-pair-minor-gcd-sum).

([[46]](#ref-46), arXiv v1, proof of Lemma 5.5, (5.12) and (5.15), pp.54–55.)

**Checks.**

- For `d = 1` (linear forms, `N = n + 1`) `σ(a; p^r) = 1 − p^{−n}` for every primitive `a`, and the bound holds.

- The bound is uniform in `r`.

<a id="local-density-variance"></a>

**Local density variance.** For `d ≥ 1, n ≥ 2, p` prime and `r ≥ 1: (1/#R_N(p^r)) Σ_{a ∈ R_N(p^r)} (σ(a; p^r) − 1)² ≤ 4p^{1−n}`, where `N = N_{d,n}`. This is the source's bound `≪ p^{−(n−1)}` (stated for `d ≥ 2, n ≥ 3`) with an explicit constant, uniform in `r`.

`Suggested.lean` states this as `HypersurfaceDensity.local_density_variance`.

*Proof.* Expand: mean`((σ − 1)²) =` mean`(σ²) − 2` mean`(σ) + 1`. Insert mean`(σ) = (1 − x)(1 − y)/(1 − z)` (local-density-first-moment) and mean`(σ²) ≤ ((1 − x)² + 2w)/(1 − z)` (local-density-second-moment), where `x = p^{−(n+1)}, y = p^{−(N−1)}, z = p^{−N}, w = p^{1−n}`. The numerator is `x² + 2w + 2y − 2xy − z ≤ 2w + 2p^{−n} + p^{−2n−2} ≤ 3.1·w`, using `N ≥ n + 1`; the denominator `1 − z ≥ 7/8` since `N ≥ 3`. Hence the mean is at most `(3.1·8/7) w < 4w`.

*Needs:* [local density first moment](#local-density-first-moment), [local density second moment](#local-density-second-moment), [ArithmeticStatisticsPartI §0.13][part-3], [ArithmeticStatisticsPartI §0.13][part-4].

([[46]](#ref-46), arXiv v1, Lemma 5.5, p.54; [[46]](#ref-46), arXiv v1, end of proof of Lemma 5.5, p.55.)

**Checks.**

- `d = 1` (linear forms): `σ(a; p^r) = 1 − p^{−n}` for every primitive `a`, so the variance is `p^{−2n} ≤ 4p^{1−n}`.

- Browning–Le Boudec–Sawin use this bound for every prime `p ∣ W` in the proof of their Proposition 5.2 (arXiv `v1`, pp.57–59); the constant 4 is uniform in `r`, which that use requires.

<a id="gradient-valuation-strata"></a>

**Gradient valuation strata.** Let `p` be prime and `r ≥ 1`. For a vector `v ∈ (ℤ/p^rℤ)^I`, its capped valuation `v_p(v)` is the largest `e ∈ {0, …, r}` with `v ≡ 0 mod p^e`. For a form `f` let `∇f = (∂f/∂X_i)_{i=0..n}`. For `0 ≤ e ≤ r` and `N = N_{d,n}`, the gradient stratum is `R^{(e)}_N(p^r) = {a ∈ R_N(p^r) : ∃ x ∈ R_{n+1}(p^r) with f_a(x) ≡ 0 mod p^r and v_p(∇f_a(x)) = e}`. The strata for `e = 0, …, r` cover `F^loc(p^r) = {a ∈ R_N(p^r) : f_a has a primitive zero modulo p^r} (5.18)`; they are defined existentially and overlap in general, so their cardinalities do not add up to `#F^loc(p^r)`.

The required API is:

- `FormDensity.vecValuation`: The capped valuation `v_p(v) ∈ {0, …, r}` of `v ∈ (ℤ/p^r)^I`.

- `FormDensity.vecValuation_le`: `v_p(v) ≤ r`.

- `FormDensity.vecValuation_eq_iff`: For `e < r: v_p(v) = e` iff `p^e` divides every coordinate and `p^{e+1}` does not divide some coordinate.

- `FormDensity.grad`: `∇f(x) = (∂f/∂X_i(x))_i`.

- `FormDensity.gradientStratum`: `R^{(e)}_N(p^r)` as a finite set of coefficient vectors.

- `FormDensity.gradientStratum_subset`: `R^{(e)}_N(p^r) ⊆ R_N(p^r)`.

- `FormDensity.mem_biUnion_gradientStratum_iff`: (5.18): the union over `e = 0, …, r` is `F^loc(p^r)`.

- `FormDensity.gradientStratum_eq_empty_of_lt`: `R^{(e)} = ∅` for `e > r`.

- `FormDensity.gradientStratum_smul_unit`: Membership is invariant under scaling a by a unit.

*Proof.* Define `v_p(v) = max{e ≤ r : p^e divides every coordinate}`, via Mathlib Nat.findGreatest on the residues' representatives. Define `∇f_a` through the partial derivatives (Mathlib MvPolynomial.pderiv) and `R^{(e)}` by the existential condition. (5.18): a zero `x` of `f_a` has some valuation `e ∈ {0, …, r}` of `∇f_a(x)`, and conversely `a ∈ R^{(e)}` has the zero `x`.

*Needs:* [ArithmeticStatisticsPartI §0.10][part-2], [ArithmeticStatisticsPartI §0.10][part-1], [ArithmeticStatisticsPartI §0.13][part-3], [ArithmeticStatisticsPartI §0.13][part-4], `Nat.findGreatest` (Mathlib), `MvPolynomial.pderiv` (Mathlib).

([[46]](#ref-46), arXiv v1, §5.2, (5.17), p.55; [[46]](#ref-46), arXiv v1, §5.2, (5.17)–(5.18), p.55.)

**Checks.**

- For `d = 1` and `r ≥ 1, R^{(1)}_N(p^r) = ∅`.

- For `d = 1, n ≥ 1, r ≥ 1: R^{(0)}_N(p^r) = R_N(p^r)`.

- `X_0X₁` in three variables lies in both `R^{(0)}(9)` and `R^{(2)}(9)`: the strata are not a partition.

- Direct capped valuations at `p = 3, r = 2` are `v₃(1,0) = 0`, `v₃(3,0) = 1` and `v₃(0,0) = 2`.

<a id="high-gradient-stratum-count"></a>

**High gradient stratum count.** For `d ≥ 1, n ≥ 1, p` prime and `1 ≤ e ≤ r: #R^{(e)}_{N}(p^r) ≤ 2p^{rN−e}`, where `N = N_{d,n}`. (Stated in the source for `d ≥ 2, n ≥ 3`, with the cardinality sign omitted.)

*Proof.* If `a ∈ R^{(e)}` with witness `x`, then `x mod p^e` lies in `D_a(p^e) = {x ∈ R_{n+1}(p^e) : f_a(x) ≡ 0, ∇f_a(x) ≡ 0 mod p^e}`, since `e ≥ 1`. `D_a(p^e)` is stable under `x ↦ gx` for `g ∈ (ℤ/p^e)^× (f_a(gx) = g^d f_a(x), ∇f_a(gx) = g^{d−1}∇f_a(x))`, and the `p^{e−1}(p − 1)` multiples of a primitive `x` are distinct; so `1_{D_a(p^e) ≠ ∅} ≤ #D_a(p^e)/(p^{e−1}(p − 1)) ≤ 2#D_a(p^e)/p^e`. Swap the sums: `#R^{(e)} ≤ (2/p^e) Σ_{x ∈ R_{n+1}(p^e)} #{a mod p^r : f_a(x) ≡ 0 and ∇f_a(x) ≡ 0 mod p^e}`. Fix `x` and renumber so that `x₀` is a unit. Split off the coordinates `c^{(i)}` of `a` at the monomials `X₀^{d−1}X_i` (`i = 0..n`): `f_a(x) = x₀^{d−1}Σ_i c^{(i)}x_i + g_a(x)` and `∂_i f_a(x) = c^{(i)}x₀^{d−1} + ∂_i g_a(x)` for `i ≥ 1`, where `g_a` does not involve `c`. The `n + 1` conditions `f_a(x) ≡ 0` and `∂_i f_a(x) ≡ 0 (1 ≤ i ≤ n) mod p^e` fix `c mod p^e` (drop the `∂_0` condition for an upper bound), so at most `p^{r(N−n−1)}·p^{(r−e)(n+1)}` vectors `a` qualify. With `#R_{n+1}(p^e) ≤ p^{e(n+1)}: #R^{(e)} ≤ 2p^{−e}·p^{e(n+1)}·p^{r(N−n−1)+(r−e)(n+1)} = 2p^{rN−e}`.

*Needs:* [ArithmeticStatisticsPartI §0.10][part-2], [gradient valuation strata](#gradient-valuation-strata), [ArithmeticStatisticsPartI §0.13][part-3], [ArithmeticStatisticsPartI §0.13][part-4].

([[46]](#ref-46), arXiv v1, Lemma 5.6, p.55; [[46]](#ref-46), arXiv v1, proof of Lemma 5.6, p.56.)

**Checks.**

- `d = 1`: the strata `e ≥ 1` are empty, consistent with the bound.

- In the proof of Browning–Le Boudec–Sawin's Proposition 5.2 (arXiv `v1`, p.59) the bound gives `Σ_{e ≥ 2} p^{κ(e+1)n}#R^{(e)} ≪ p^{rN−2+3κn}` for `κ < 1/n`.

<a id="fixed-gradient-valuation-hensel-lifting"></a>

**Fixed gradient valuation hensel lifting.** Let `p` be prime, `s ≥ 1, F ∈ ℤ[t₁, …, t_s], A ∈ ℤ, a ∈ ℤ^s` and integers `m, ℓ, δ ≥ 0` with `m ≥ 2δ + 1` and `δ ≤ m − ℓ`. Put `R_δ(p^m, A; p^ℓ) = {t ∈ (ℤ/p^mℤ)^s : F(t) ≡ A mod p^m, v_p(∇F(t)) = δ, t ≡ a mod p^ℓ}`. Then for every `k ∈ ℤ, #R_δ(p^m, A; p^ℓ)/p^{m(s−1)} = #R_δ(p^{m+1}, A + kp^m; p^ℓ)/p^{(m+1)(s−1)}`. In the form used by Browning–Le Boudec–Sawin (`s = n + 1, A = k = 0, δ = e, ℓ = e + 1, a = x` with `v_p(∇F(x)) = e`): for every `s′ ≥ 2e + 2, #{b mod p^{s′} : b ≡ x mod p^{e+1}, F(b) ≡ 0 mod p^{s′}}/p^{s′n}` equals the same quantity at level `s′ − 1`.

*Proof.* For `t ∈ R_δ(p^m, A; p^ℓ)` and `t′ ∈ ℤ^s: F(t + p^{m−δ}t′) ≡ F(t) + p^{m−δ}⟨t′, ∇F(t)⟩ ≡ A mod p^m` by first-order-taylor-congruence (`2(m − δ) ≥ m` and `p^δ | ∇F(t)`); `∇F(t + p^{m−δ}t′) ≡ ∇F(t) mod p^{m−δ}` by polynomial-congruence-under-perturbation, and `m − δ ≥ δ + 1`, so the valuation `δ` is kept; `t + p^{m−δ}t′ ≡ a mod p^ℓ` since `ℓ ≤ m − δ`. So `R_δ(p^m, A; p^ℓ)` is a union of cosets modulo `p^{m−δ}`. For `t mod p^{m+1}` reducing into `R_δ(p^m, A; p^ℓ)`, the vectors `t + p^{m−δ}t′ (t′ mod p)` run through `p^s` cosets modulo `p^{m+1−δ}`, and `t + p^{m−δ}t′ ∈ R_δ(p^{m+1}, A + kp^m; p^ℓ)` iff `p^{−m}(F(t) − A) + p^{−δ}⟨t′, ∇F(t)⟩ ≡ k mod p`, which has exactly `p^{s−1}` solutions `t′ mod p` because `p^{−δ}∇F(t)` is nonzero modulo `p`. Counting cosets: `#R_δ(p^{m+1}, A + kp^m; p^ℓ) = p^{s−1}·#R_δ(p^m, A; p^ℓ)`. For the BLS form: every `b ≡ x mod p^{e+1}` has `v_p(∇F(b)) = e` (perturbation congruence), so the displayed set is `R_e(p^{s′}, 0; p^{e+1})`; apply the lemma with `m = s′ − 1 ≥ 2e + 1`.

*Needs:* [first order taylor congruence](#first-order-taylor-congruence), [polynomial congruence under perturbation](#polynomial-congruence-under-perturbation), [gradient valuation strata](#gradient-valuation-strata), `MvPolynomial.pderiv` (Mathlib).

([[47]](#ref-47), arXiv v4, Lemma 3.3, p.13; [[46]](#ref-46), arXiv v1, proof of Lemma 5.7, p.57.)

**Checks.**

- `δ = 0`: each nonsingular solution modulo `p^m` has exactly `p^{s−1}` lifts modulo `p^{m+1}` (classical Hensel).

- The hypothesis `m ≥ 2δ + 1` cannot be dropped: `s = 1, F = t², p` odd, `δ = 1, m = 2, ℓ = 0, A = k = 0` gives `p − 1` solutions at level 2 and none at level 3.

<a id="local-density-lower-bound-on-gradient-stratum"></a>

**Local density lower bound on gradient stratum.** For `d ≥ 1, n ≥ 0, p` prime, `r ≥ 1, 0 ≤ e ≤ r` and `a ∈ R^{(e)}_N(p^r): σ(a; p^r) ≥ p^{−(e+1)n}`. (Source: `d ≥ 2, n ≥ 3`.)

*Proof.* Choose a witness `x ∈ R_{n+1}(p^r)` with `f_a(x) ≡ 0 mod p^r` and `v_p(∇f_a(x)) = e`. If `e = r, x` alone gives `σ ≥ p^{−rn} ≥ p^{−(r+1)n}`. For `e < r: σ(a; p^r) ≥ #C_{a,x}(p^{e+1}; p^r)/p^{rn}`, where `C_{a,x}(p^c; p^s) = {b ∈ R_{n+1}(p^s) : b ≡ x mod p^c, f_a(b) ≡ 0 mod p^s}` (such `b` are automatically primitive). Case `r ≤ 2e + 1`: for `b ≡ x mod p^{e+1}, f_a(b) ≡ f_a(x) + ⟨∇f_a(x), b − x⟩ ≡ 0 mod p^r` (first-order-taylor-congruence with `p^e | ∇f_a(x)` and `p^{e+1} | b − x`); so `C = {b ≡ x mod p^{e+1}}, #C = p^{(r−e−1)(n+1)}` and `σ ≥ p^{r−e−1}·p^{−(e+1)n}`. Case `r ≥ 2e + 2`: by fixed-gradient-valuation-hensel-lifting applied `r − 2e − 1` times, `#C(p^r)/p^{rn} = #C(p^{2e+1})/p^{(2e+1)n}`, and by the previous case `#C(p^{2e+1}) = p^{e(n+1)}`; so `σ ≥ p^{e−(e+1)n} ≥ p^{−(e+1)n}`.

*Needs:* [ArithmeticStatisticsPartI §0.10][part-1], [gradient valuation strata](#gradient-valuation-strata), [first order taylor congruence](#first-order-taylor-congruence), [polynomial congruence under perturbation](#polynomial-congruence-under-perturbation), [fixed gradient valuation hensel lifting](#fixed-gradient-valuation-hensel-lifting).

([[46]](#ref-46), arXiv v1, Lemma 5.7, p.56; [[46]](#ref-46), arXiv v1, proof of Lemma 5.7, p.57.)

**Checks.**

- `e = 0` (a nonsingular zero): `σ(a; p^r) ≥ p^{−n}` for every `r`.

- In the proof of Browning–Le Boudec–Sawin's Proposition 5.2 (arXiv `v1`, p.59) this gives `σ(a; p^r)^{−κ} ≤ p^{κ(e+1)n}` on `R^{(e)}`.

### 5.13 Concentration of polarized isogeny types

<a id="convex-concentration-inequality"></a>

**Convex concentration inequality.** Let `g ∈ ℝ, 1/2 < ε < 1` and `x₁, …, x_k ∈ ℝ` with `0 ≤ x_i ≤ εg` and `Σ_i x_i = g`. Then `Σ_i x_i² ≤ (ε² + (1 − ε)²)g² = (1 − 2ε(1 − ε))g²`.

*Proof.* If `g ≤ 0` the hypotheses force every `x_i = 0` and `g = 0`. Let `g > 0` and let `x₁` be a largest coordinate. If `x₁ < g/2: Σ x_i² ≤ x₁ Σ x_i < g²/2 ≤ (ε² + (1 − ε)²)g²`, since `ε² + (1 − ε)² ≥ 1/2`. If `x₁ ≥ g/2: Σ_{i≥2} x_i² ≤ (Σ_{i≥2} x_i)² = (g − x₁)²`, so `Σ x_i² ≤ x_1² + (g − x₁)²`, which is increasing in `x₁` on `[g/2, εg]` and equals `(ε² + (1 − ε)²)g²` at `x₁ = εg`. (The source argues by convexity: the maximum over the polytope `{x ∈ [0, εg]^k : Σx = g}` is at a vertex, and the vertices are the `k(k − 1)` permutations of `(εg, (1 − ε)g, 0, …, 0)`.)

*Needs:* `Real.rpow` (Mathlib), `Finset.sum` (Mathlib).

([[45]](#ref-45), arXiv v1, Lemma 5.9, p.32.)

**Checks.**

- `k = 2, x = (εg, (1 − ε)g)`: equality.

- `ε = 0.99: Σ x_i² ≤ 0.9802 g²`, the constant used in Proposition 5.10.

- At `g = 0` every coordinate is zero and equality holds, including for an empty family.

<a id="weighted-square-concentration"></a>

**Weighted square concentration.** For every `C ≥ 0` there is `g₀` such that for all `g ≥ g₀` and every finite family of pairs of positive integers `(k_j, n_j)` with `Σ_j k_j n_j = g` in which no `j` has both `k_j = 1` and `n_j ≥ 0.99g: (1/2)Σ_j k_j n_j² log n_j + Cg² < 0.495 g² log g`.

*Proof.* Put `x_j = k_j n_j`. Case A, every `x_j < 0.99g`: since `k_j ≥ 1` and `n_j ≤ g, k_j n_j² log n_j ≤ x_j² log g`, and convex-concentration-inequality with `ε = 0.99` gives `Σ_j x_j² ≤ 0.9802g²`; so the left side is at most `0.4901 g² log g + Cg²`. Case B, some `x_{j0} ≥ 0.99g`: then `k_{j0} ≥ 2` (a block with `k = 1` has `x = n < 0.99g`), so `n_{j0} ≤ g/2` and `k_{j0}n_{j0}² log n_{j0} = x_{j0}n_{j0} log n_{j0} ≤ (g²/2) log g`; the other blocks have `Σ_{j≠j0} x_j ≤ 0.01g` and `n_j ≤ 0.01g`, so `Σ_{j≠j0} k_j n_j² log n_j ≤ Σ_{j≠j0} x_j n_j log g ≤ 10^{−4} g² log g`. The left side is at most `0.25005 g² log g + Cg²`. In both cases the left side is below `0.495 g² log g` once `0.0049 log g > C`, i.e. for `g ≥ g₀ = ⌈exp(C/0.0049)⌉ + 1` (`log n_j ≥ 0` by Mathlib `Real.log_nonneg`).

*Needs:* [convex concentration inequality](#convex-concentration-inequality), `Real.log_nonneg` (Mathlib).

([[45]](#ref-45), arXiv v1, proof of Proposition 5.10, p.32.)

**Checks.**

- A single block `(k, n) = (1, g)` is excluded by hypothesis, and indeed `(1/2)g² log g` exceeds the bound: the threshold separates it.

- Blocks `(2, g/2): (1/2)·2·(g/2)² log(g/2) ≈ 0.25 g² log g < 0.495 g² log g`.

- Three equal multiplicity-one blocks have square sum `g²/3`; the weighted logarithmic term is at most `(g²/6) log g`, strictly below the threshold for large `g`.

<a id="model-ring-orbit-count-concentration"></a>

**Model ring orbit count concentration.** Fix a prime `p`. There is `g₀ = g₀(p)` such that for every `g ≥ g₀` and every model ring `R_{L,n} = ∏_i M_{n_i}(O_{L_i})` with conjugate-transpose involution, where the `L_i` are an indexed finite family of CM fields generated by `p`-Weil numbers, allowing repeated abstract fields, with totally real subfields `K_i` and `Σ_i [K_i:ℚ]n_i = g`, the following holds: if the number `n_{L,n}` of `R_{L,n}^×`-orbits on the positive symmetric units of `R_{L,n}` (action `a ↦ γ* a γ`) satisfies `log n_{L,n} ≥ 0.495 g² log g`, then some `i₀` has `[K_{i₀}:ℚ] = 1` and `n_{i₀} ≥ 0.99g`.

*Proof.* Item GN-c and `modelPositiveUnitCount_product` (Lipnowski–Tsimerman (55), corrected by the factor `1/2`): sum the single-block logarithms to obtain `log n_{L,n} ≤ (1/2)Σ_i [K_i:ℚ]n_i² log n_i + C_p g²` with `C_p` depending only on `p`. Apply weighted-square-concentration to the blocks `(k_i, n_i) = ([K_i:ℚ], n_i)` with `C = C_p`: if no `i` has `[K_i:ℚ] = 1` and `n_i ≥ 0.99g`, then `log n_{L,n} < 0.495 g² log g` for `g ≥ g₀`.

*Needs:* [weighted square concentration](#weighted-square-concentration), items GN-b and GN-c.

([[45]](#ref-45), arXiv v1, Proposition 5.10, p.32; [[45]](#ref-45), arXiv v1, §5.4.5, (55), p.31.)

**Checks.**

- A single block `L = ℚ(√−d)` of class number one with `n = g: log n_{L,n} = (1/2)g² log g + O_p(g²)` exceeds the threshold and the conclusion holds with `i₀` that block.

- The printed threshold `0.99 g² log g` is never reached once the coefficient `1/2` is restored, so the printed statement is vacuous for large `g`.

- Over `𝔽₅`, `E:y²=x³−x` and its nonsquare twist `E′:y²=x³+x` have traces `−2` and `2`, so they are nonisogenous but both have endomorphism field `ℚ(i)`. For `E^a × E′^b` the ring is `M_a(ℤ[i]) × M_b(ℤ[i])`, not `M_{a+b}(ℤ[i])`.

<a id="quantitative-unpolarized-abelian-count"></a>

**Quantitative unpolarized abelian count.** For each prime `p` there is `C_p ≥ 0` such that the number `B(p,g)` of `𝔽_p`-isomorphism classes of `g`-dimensional abelian varieties satisfies `log B(p,g) ≤ C_p g²` for every `g ≥ 1`. The count uses Part I's unpolarized isomorphism classes.

*Proof.* Combine the isogeny-class bound and the integral local and adelic class-set estimates of Lipnowski–Tsimerman §§2–3. Their Theorem 0.1 gives `B(p,g) = o_ε(p^{(17/2+ε)g²})`; fix `ε > 0` and enlarge `C_p` to include the finitely many smaller positive dimensions. Finiteness alone is not a quantitative estimate.

*Needs:* [ArithmeticStatisticsPartI: finite-field abelian counting inputs][part-8].

([[45]](#ref-45), arXiv v1, Theorem 0.1, p.1, and §§2–3, pp.5–13.)

**Checks.**

- At dimension zero the unpolarized count is one, and its logarithm is zero.

- The two elliptic curves with traces `−2` and `2` over `𝔽₅` above give `B(5,1) ≥ 2`.

- The distinct principal polarizations on `E⁸` represented by `I₈` and the `E₈` Gram matrix contribute a single underlying unpolarized class to `B(5,8)`.

<a id="most-ppavs-have-a-large-elliptic-or-real-weil-factor"></a>

**Most ppavs have a large elliptic or real weil factor.** Let `p` be a prime such that `p` satisfies the corrected conclusion of Lipnowski–Tsimerman Lemma 5.11: there are an elliptic curve `E₀/𝔽_p` and `C₀` with `log n_{E₀^g} ≥ (1/2)g² log g − C₀ g²` for all `g ≥ 1` (true when `p` splits in one of the nine imaginary quadratic fields of class number one, a set of primes of density `≥ 1 − 2^{−9}`). Assume (H1) Lipnowski–Tsimerman Conjecture 5.2: there is `C_p` such that for every `g`-dimensional abelian variety `A/𝔽_p` admitting a principal polarization and isogenous to `A₁^{n₁} × ⋯ × A_k^{n_k}` with `A_i` pairwise non-isogenous simple and `End⁰(A_i) ≅ L_i` a CM field, `|log n_A − log n_{L,n}| ≤ C_p g²`, where `n_A` is the number of isomorphism classes of principal polarizations on `A` (`Aut(A)`-orbits) and `n_{L,n}` is the orbit count of the model ring `R_{L,n} = ∏ M_{n_i}(O_{L_i})`; (H2) the same inequality for `A` isogenous to `A₁^{n₁} × ⋯ × A_k^{n_k} × B₀^m` with `m ≥ 1`, where `B₀` is the simple abelian surface over `𝔽_p` with Frobenius polynomial `(x² − p)²` and `End⁰(B₀) = D`, the quaternion algebra over `ℚ(√p)` ramified exactly at its two infinite places, with model count `n_{L,n}·n_D(m), n_D(m)` the number of `GL_m(O_D)`-orbits on the positive definite quaternion-hermitian matrices in `GL_m(O_D)` (`O_D` a maximal order, ∗ the conjugate transpose with the canonical involution of `D`). Call a `g`-dimensional principally polarized abelian variety `(A, λ)` over `𝔽_p` bad if `A` has no isogeny factor `E^h` with `E/𝔽_p` an elliptic curve and `h ≥ 0.99g`, and no isogeny factor `B₀^m` with `2m ≥ 0.99g`. Then the proportion of bad classes among the `A(p, g)` isomorphism classes of `g`-dimensional ppavs over `𝔽_p` (uniform measure) is at most `exp(−0.005 g² log g + O_p(g²))`; in particular it tends to 0 as `g → ∞`.

*Proof.* The [quantitative unpolarized abelian count](#quantitative-unpolarized-abelian-count) gives `log B(p, g) ≤ C′_p g²`. Part I's finite-field inputs give the Honda–Tate classification over a prime field; AbelianSchemesAndArithmeticModuli §A6.5 gives the isogeny decomposition. Every simple abelian variety over `𝔽_p` has `End⁰` a CM field of degree `2·dim`, except the isogeny class of `B₀`; so every `A` falls under `H1` or `H2` and `g = Σ_i [K_i:ℚ]n_i + 2m`. The indices label pairwise nonisogenous simple factors, allowing isomorphic CM fields in different blocks. A block with `[K_i:ℚ] = 1` is a power of an elliptic curve. By GN-c, its product-count identity and GN-d, `log n_model ≤ (1/2)Σ_i [K_i:ℚ]n_i² log n_i + 2m² log m + O_p(g²) ≤ (1/2)Σ` over blocks `k n² log n + O_p(g²)`, counting `B₀^m` as a block `(k, n) = (1, 2m)`. For bad `A` no block has `k = 1` and `n ≥ 0.99g`, so `H1/H2` and weighted-square-concentration (with `C = C_p +` the `O_p` constant) give `log n_A < 0.495 g² log g` for `g ≥ g₀`. ([ArithmeticStatisticsPartI §0.16][part-7]: `A(p, g) = Σ_A n_A` over isomorphism classes of abelian varieties.) The number of bad ppav classes is at most `B(p, g)·exp(0.495 g² log g)`, while `A(p, g) ≥ n_{E₀^g} ≥ exp((1/2)g² log g − C₀ g²)`; the ratio is at most `exp(−0.005 g² log g + O_p(g²))`.

*Needs:* [weighted square concentration](#weighted-square-concentration), [quantitative unpolarized abelian count](#quantitative-unpolarized-abelian-count), [ArithmeticStatisticsPartI §0.1][part-5], [ArithmeticStatisticsPartI §0.16][part-6], [ArithmeticStatisticsPartI §0.16][part-7], items GN-b to GN-d, AbelianSchemesAndArithmeticModuli §§A2, A6.5, A6.18–A6.19, [ArithmeticStatisticsPartI: finite-field abelian counting inputs][part-8].

([[45]](#ref-45), arXiv v1, Theorem 0.2, p.2; [[45]](#ref-45), arXiv v1, Conjecture 5.2, pp.24–25; [[45]](#ref-45), arXiv v1, proof of Corollary 5.13, pp.33–34.)

**Checks.**

- `g = 1`: every principally polarized abelian variety is an elliptic curve `E = E^1` with `1 ≥ 0.99`, so no class is bad.

- The alternative `B₀^m` cannot be dropped using these upper bounds: GN-d permits `log` model count up to `2m² log m + O_p(m²)`, the same leading term per dimension as `E^g`.

- For `E^a × E′^b` with the trace `−2` and `2` curves above, the two `ℚ(i)` model blocks contribute separate logarithms; there is no contribution from cross-homomorphisms.

### 5.14 Spacing measures and Frobenius model obstructions

<a id="kolmogorov-distance"></a>

**Kolmogorov distance.** For Borel probability measures `μ, ν` on `ℝ` with distribution functions `F_μ(x) = μ((−∞, x])` and `F_ν`, the Kolmogorov distance is `d_K(μ, ν) = sup_{x ∈ ℝ} |F_μ(x) − F_ν(x)|`. It takes values in `[0, 1]`, is symmetric, satisfies the triangle inequality, vanishes exactly when `μ = ν`, and dominates `|μ((−∞, x]) − ν((−∞, x])|` for every `x`.

Construct this distance on Mathlib's probability measures on `ℝ` using their CDFs. Prove nonnegativity, symmetry, the bound by one, the pointwise CDF-discrepancy bound, the triangle inequality and the equality criterion above.

*Proof.* Define `d_K` as the supremum over `x` of `|cdf μ x − cdf ν x|` (Mathlib ProbabilityTheory.cdf); the family is bounded by 1 (Mathlib `ProbabilityTheory.cdf_le_one`), so the supremum is a real number and dominates each term (Mathlib `le_ciSup`). For probability measures `cdf μ x = μ((−∞, x])` (Mathlib `ProbabilityTheory.cdf_eq_real`); equal distribution functions give equal measures (Mathlib `MeasureTheory.Measure.eq_of_cdf`).

*Needs:* `ProbabilityTheory.cdf` (Mathlib), `ProbabilityTheory.cdf_eq_real` (Mathlib), `ProbabilityTheory.cdf_le_one` (Mathlib), `MeasureTheory.Measure.eq_of_cdf` (Mathlib), `le_ciSup` (Mathlib).

([[45]](#ref-45), arXiv v1, Corollary 5.14, p.34.)

**Checks.**

- `d_K(μ, μ) = 0`.

- `d_K(δ₀, δ₁) = 1`.

- `d_K((δ₀ + δ₁)/2, δ₀) = 1/2`: the distance is not the indicator of inequality.

<a id="normalized-eigenangle-spacing-measure"></a>

**Normalized eigenangle spacing measure.** Let `θ : Multiset ℝ` have cardinality `N ≥ 1`, with every entry in `[0,2π)`. Sort it as `θ₁ ≤ ⋯ ≤ θ_N`. Define the cyclic gaps `Δ_i = θ_{i+1}−θ_i` for `i<N` and `Δ_N = θ₁+2π−θ_N`, retaining zero gaps and the wrap-around gap. Set `spacingMeasure θ = (1/N)Σ_i δ_{NΔ_i/(2π)}`, a Borel probability measure on `ℝ` supported on `[0,∞)`. For a positive-dimensional abelian variety (`g ≥ 1`) take the multiset of arguments in `[0,2π)` of all `2g` complex Frobenius roots, counted with multiplicity. The abelian-variety carrier is [ArithmeticStatisticsPartI §0.16][part-6]; the Frobenius polynomials are supplied by DeligneWeightsAndPurity §1.4.

Construct the sorted cyclic-gap list, the empirical spacing probability measure and the eigenangle multiset of a complex polynomial, mapping each root by `z ↦ toIcoMod (2π>0) 0 (Complex.arg z)`. Prove that the gap list has length `θ.card`, that angles in one half-open period give nonnegative gaps, and that a nonempty list has total gap `2π`. Prove total probability mass one and support in `[0,∞)`. A complex polynomial of degree `2g` has `2g` eigenangles, all in `[0,2π)`, with multiplicities retained. Prove the repeated-angle zero-mass inequality stated below.

*Needs:* `Multiset.sort` (Mathlib), `MeasureTheory.Measure.dirac` (Mathlib), `Polynomial.roots` (Mathlib), `Complex.arg` (Mathlib), `toIcoMod` (Mathlib).

([[45]](#ref-45), arXiv v1, Corollary 5.14 and its proof, p.34.)

**Checks.**

- `μ({1,1,1,1}) = (3/4)δ₀ + (1/4)δ₄`: four equal angles give the gaps 0, 0, 0 and the wrap-around gap `2π`, rescaled to 4.

- `μ({0, π}) = δ₁`: the wrap-around gap is counted.

- `μ({0,0,π,π}){0} = 1/2` while `μ({0,π}){0} = 0`: repeated eigenvalues are not deduplicated.

- The eigenangles of `x² + 5` are `π/2` and `3π/2`.

- `eigenangles ((X − 1)^3) = {0,0,0}`: repeated roots retain their multiplicities.

- `eigenangles (X + 1) = {π}`: the negative real root has angle `π`.

- `cyclicGaps ∅ = []`.

- `cyclicGaps {0} = [2π]`: a singleton retains the full wrap-around gap.

- `cyclicGaps {0,π/2,π} = [π/2,π/2,π]`: the list follows sorted-angle order.

<a id="zero-gap-mass-from-repeated-angles"></a>

**Zero gap mass from repeated angles.** Let `θ` be a multiset of `N ≥ 1` angles in `[0, 2π)` containing two distinct values `s ≠ t` each with multiplicity at least `h`. Then the normalized spacing measure satisfies `μ(θ)({0}) ≥ 2(h − 1)/N`, with subtraction taken in `ℝ`.

*Proof.* In the sorted list the `≥ h` copies of `s` are consecutive and give `≥ h − 1` zero gaps; likewise for `t`; these gap positions are distinct. The wrap-around gap `θ₁ + 2π − θ_N` is positive for angles in `[0, 2π)`, so it is not counted among them. Each zero gap contributes mass `1/N` at 0.

*Needs:* [normalized eigenangle spacing measure](#normalized-eigenangle-spacing-measure), `Multiset.count` (Mathlib).

([[45]](#ref-45), arXiv v1, proof of Corollary 5.14, p.34.)

**Checks.**

- `N = 2g = 2h` with two distinct values: the mass at 0 is exactly `1 − 1/g`, not 1.

- `h ≤ 1`: the bound is `≤ 0` and trivial.

- For `{0,0,π,π}` and `h = 2`, equality gives mass `1/2`.

<a id="kolmogorov-distance-lower-bound-from-an-atom"></a>

**Kolmogorov distance lower bound from an atom.** For Borel probability measures `μ, ν` on `ℝ` and `x ∈ ℝ: μ((−∞, x]) − ν((−∞, x]) ≤ d_K(μ, ν)`. In particular, if `μ` is supported on `[0, ∞)` and `ν((−∞, 0]) = 0` (for instance `ν` atomless and supported on `[0, ∞)`), then `d_K(μ, ν) ≥ μ({0})`.

*Proof.* `cdf μ x = μ((−∞, x])` for probability measures (Mathlib `ProbabilityTheory.cdf_eq_real`), and `|cdf μ x − cdf ν x| ≤ d_K(μ, ν)` (kolmogorov-distance API). For `μ` supported on `[0, ∞), μ((−∞, 0]) = μ({0})`.

*Needs:* [kolmogorov distance](#kolmogorov-distance), `ProbabilityTheory.cdf_eq_real` (Mathlib).

([[45]](#ref-45), arXiv v1, proof of Corollary 5.14, p.34.)

**Checks.**

- `μ = δ₀, ν =` uniform on `[0, 1]: d_K = 1 = μ({0})`.

- `μ = ν`: both sides are 0.

<a id="spacing-measure-discrepancy-for-ppavs"></a>

**Spacing measure discrepancy for ppavs.** Under the hypotheses of most-ppavs-have-a-large-elliptic-or-real-weil-factor (`p` as in the corrected Lemma `5.11, H1` and `H2`), for every `g ≥ 1` let `μ_g` be the average over the `g`-dimensional ppav classes over `𝔽_p` of the normalized eigenangle spacing measures of their Frobenius polynomials. Then `μ_g({0}) ≥ 0.99 − o(1)`, and for every probability measure `ν` on `ℝ` with `ν((−∞, 0]) = 0` — in particular the GUE spacing law, which is absolutely continuous on `[0, ∞)` — `liminf_{g→∞} d_K(μ_g, ν) ≥ 0.99`.

*Proof.* By most-ppavs-have-a-large-elliptic-or-real-weil-factor, a proportion `1 − o(1)` of ppav classes have a factor `E^h (h ≥ 0.99g)` or `B₀^m (2m ≥ 0.99g)`. (DeligneWeightsAndPurity §§1.4–1.5) For `E^h` the Frobenius polynomial of `A` is divisible by `(x² − a_E x + p)^h`, whose two roots are distinct (`a_E² ≠ 4p` since `4p` is not a square); for `B₀^m` it is divisible by `(x² − p)^{2m}`, roots `±√p` of multiplicity `h = 2m`. So two distinct eigenangles have multiplicity `≥ h ≥ 0.99g`. zero-gap-mass-from-repeated-angles gives mass `≥ 2(h − 1)/(2g) ≥ 0.99 − 1/g` at 0 for each such class; averaging, `μ_g({0}) ≥ (1 − o(1))(0.99 − 1/g)`. `μ_g` is supported on `[0, ∞)` (normalized-eigenangle-spacing-measure API), so kolmogorov-distance-lower-bound-from-an-atom gives `d_K(μ_g, ν) ≥ μ_g({0}) − ν((−∞, 0]) = μ_g({0})`.

*Needs:* [most ppavs have a large elliptic or real weil factor](#most-ppavs-have-a-large-elliptic-or-real-weil-factor), [zero gap mass from repeated angles](#zero-gap-mass-from-repeated-angles), [normalized eigenangle spacing measure](#normalized-eigenangle-spacing-measure), [kolmogorov distance lower bound from an atom](#kolmogorov-distance-lower-bound-from-an-atom), [ArithmeticStatisticsPartI §0.16][part-6], [ArithmeticStatisticsPartI §0.16][part-7], [ArithmeticStatisticsPartI: finite-field abelian counting inputs][part-8].

([[45]](#ref-45), arXiv v1, Corollary 5.14, p.34.)

**Checks.**

- For `ν = δ₁` (the spacing law of equally spaced angles) the conclusion also holds.

- The bound is on `liminf` in `g`; no statement is made for fixed `g`.

- Dimension zero has no normalized spacing probability measure: its angle multiset is empty.

<a id="enhanced-cohen-lenstra-fails-for-ppavs"></a>

**Enhanced cohen lenstra fails for ppavs.** Let `p` be an odd prime satisfying the corrected conclusion of Lemma 5.11 and assume `H1` and `H2` (as in most-ppavs-have-a-large-elliptic-or-real-weil-factor). Let `S` be the set of primes `ℓ ≠ p` with `ℓ < (p + 1)²`, and assume that for each `ℓ ∈ S` the limit `CL_{(1,2),ℓ}(0, 0) = lim_{g→∞} Haar_g{F ∈ M_g(ℤ_ℓ) : coker(1 − F) = 0 and coker(1 − F²) = 0}` exists. Then, for `(A, λ)` uniform among the `g`-dimensional ppav classes over `𝔽_p`, `Prob(A(𝔽_p)[S^∞] = 0 and A(𝔽_{p²})[S^∞] = 0) → 0` as `g → ∞`, whereas `CL_{(1,2),S}(0, 0) = ∏_{ℓ∈S} CL_{(1,2),ℓ}(0, 0) > 0`. Hence the joint law of `(A(𝔽_p)[S^∞], A(𝔽_{p²})[S^∞])` does not converge to `CL_{(1,2),S}`: the enhanced Cohen–Lenstra model does not describe this family.

*Proof.* By most-ppavs-have-a-large-elliptic-or-real-weil-factor, with probability `1 − o(1) A` has an isogeny factor `E` (`h ≥ 1` suffices) or `B₀`. For odd `p, E(𝔽_p)` and `E(𝔽_{p²})` are not both `p`-groups (Lipnowski–Tsimerman, Lemma 5.19, whose printed argument does not prove it): if `#E(𝔽_p) = p + 1 − t = p^i` and `p + 1 + t = p^j`, then `p^i + p^j = 2(p + 1)`, which is impossible modulo `p` when `i, j ≥ 1`, while `i = 0` or `j = 0` forces `|t| = p > 2√p` unless `p = 3`, where `p + 1 ± 3` is 1 and 7. Hence some prime `ℓ ≠ p` divides `#E(𝔽_p)` or `#E(𝔽_{p²})`; by the Hasse bound (Tau Ceti `WeierstrassCurve.hasse_bound`) `ℓ ≤ #E(𝔽_{p²}) ≤ (p + 1)²`, and `(p + 1)²` is not prime, so `ℓ ∈ S`. `#B₀(𝔽_p) = (p − 1)²` is even, and `2 ∈ S`. (DeligneWeightsAndPurity §1.5: `#A(𝔽_{p^r}) = P_{π^r}(1)`, and the characteristic polynomial of an isogeny factor divides that of `A`.) `#E(𝔽_{p^r})` or `#B₀(𝔽_{p^r})` divides `#A(𝔽_{p^r})`, so `A(𝔽_p)[S^∞]` or `A(𝔽_{p²})[S^∞]` is nonzero (Cauchy's theorem). Positivity: the event depends on `F mod ℓ` only; the finite-`g` probabilities are `≥ ∏_{j≥1}(1 − 2^{−j})` for `ℓ = 2` and `≥ 2∏_{j≥1}(1 − 3^{−j}) − 1 > 0` for odd `ℓ` (Example 5.17: [ArithmeticStatisticsPartVII §5.3][part-23], [ArithmeticStatisticsPartVII §5.3][part-24], on the finite-level laws of [ArithmeticStatisticsPartVII §5.3][part-25]), so the assumed limits are positive and so is their finite product.

*Needs:* [most ppavs have a large elliptic or real weil factor](#most-ppavs-have-a-large-elliptic-or-real-weil-factor), [ArithmeticStatisticsPartVII §5.3][part-25], [ArithmeticStatisticsPartVII §5.3][part-23], [ArithmeticStatisticsPartVII §5.3][part-24], [ArithmeticStatisticsPartVII §5.3][part-26], [ArithmeticStatisticsPartIV §3.3][part-16], [ArithmeticStatisticsPartI §0.16][part-6], [ArithmeticStatisticsPartI §0.16][part-7], [ArithmeticStatisticsPartI: finite-field abelian counting inputs][part-8].

([[45]](#ref-45), arXiv v1, Corollary 5.20, p.37; [[45]](#ref-45), arXiv v1, proof of Corollary 5.20, p.37.)

**Checks.**

- `p = 2` is excluded: `y² + xy = x³ + x² + 1` over `𝔽₂` has `#E(𝔽₂) = 2` and `#E(𝔽₄) = 8`, both 2-groups, so Lemma 5.19 fails there; and `#B₀(𝔽₂) = #B₀(𝔽₄) = 1`.

- For `p = 3, S = {2, 5, 7, 11, 13}`.

### 5.15 Class-group moments as Hurwitz counts

<a id="generalized-dihedral-cover-datum"></a>

**Generalized dihedral cover datum.** Let `A` be a finite abelian group of odd order. Put `G_A := A ⋊ ℤ/2`, where the generator `τ` of `ℤ/2` acts on `A` by inversion, and let `c_A ⊂ G_A` be the set of elements with nontrivial image in `ℤ/2`, i.e. `c_A = {aτ : a ∈ A}`. Use InverseGaloisAndArithmeticFundamentalGroups §IG.3.4 for (ii) `c_A` being a single conjugacy class stable under invertible powers, and (iii) generation of `G_A`. Prove `(i) c_A` is exactly the set of involutions of `G_A`; (iv) if `A ≠ 0` the centre of `G_A` is trivial; `(v) (G_A, c_A)` is nonsplitting: for every subgroup `H ≤ G_A, c_A ∩ H` is empty or a single `H`-conjugacy class. For `A` of order a power of an odd prime `ℓ` and `q` prime to `2ℓ`, the Hurwitz scheme `X_n := Hn^{c_A}_{G_A,n} ⊗ 𝔽_q` of tame `G_A`-covers of `A¹` branched at `n` points with all finite inertia in `c_A` is the scheme of EVW §8.6.

Odd order is used in (i), (ii), (iv) and (v). For `A = 0` the group `G_A = ℤ/2` is abelian, so (iv) needs `A ≠ 0`; this case is the trivial moment.

Conjugacy, invertible-power stability and generation of `c_A` are supplied by InverseGaloisAndArithmeticFundamentalGroups §IG.3.4, *Coprime semidirect products and admissible inertia*, specialized to inversion `(2A = A)`. The additional API is:

- `inversionAction`: The homomorphism `ℤ/2 → Aut(A)` sending the generator to `a ↦ −a`.

- `generalizedDihedral`: `G_A := A ⋊ ℤ/2` with the inversion action.

- `outsideInvolutions`: `c_A := {x ∈ G_A : image of x in ℤ/2 is nontrivial}`.

- `mem_outsideInvolutions_iff`: For `|A|` odd: `x ∈ c_A ⇔ orderOf x = 2`.

- `center_generalizedDihedral`: For `|A|` odd and `A ≠ 0` the centre of `G_A` is trivial.

- `outsideInvolutions_nonsplitting`: For `|A|` odd and `H ≤ G_A, c_A ∩ H` is empty or a single `H`-conjugacy class.

*Proof.* Construct the inversion action `ℤ/2 → Aut(A)` and the semidirect product (Mathlib SemidirectProduct); `c_A` is the preimage of the nontrivial element under rightHom. `(i) (aτ)² = a·τaτ^{−1} = a − a = 0`, while an element `a ≠ 0` of `A` has odd order; so involutions are exactly `c_A`. For (ii)–(iii), apply the supplied coprime-inertia assertions to inversion, which is admissible since `2A = A`. (iv) a central element commutes with `τ`, forcing `2a = 0` hence `a = 0` on the `A`-part, and `aτ` is not central when `A ≠ 0`. (v) For `H ≤ G_A` meeting `c_A, H = (H ∩ A) ⋊ ⟨a₀τ⟩` and `c_A ∩ H = {(h + a₀)τ : h ∈ H ∩ A} =` one `(H ∩ A)`-orbit by (ii) applied to the odd group `H ∩ A`. This is the instance of EVW Lemma 3.2 used in §8.6; only this generalized-dihedral case is needed here.

*Needs:* `SemidirectProduct` (Mathlib), `SemidirectProduct.inl` (Mathlib), `SemidirectProduct.inr` (Mathlib), `SemidirectProduct.rightHom` (Mathlib), `MulEquiv.inv` (Mathlib), `Subgroup.center` (Mathlib), InverseGaloisAndArithmeticFundamentalGroups §IG.3.4.

([[37]](#ref-37), §8.6, p.774 (Annals 183).)

**Checks.**

- For `A = 0` the centre of `G_A` is the whole group (`G_A` is not centre-free).

- For `A = ℤ/5` every element of `c_A` has order 2.

- `A = ℤ/3: G_A ≅ S₃` and `c_A` is the class of transpositions.

- `A = ℤ/2` (even order): `c_A = {τ, aτ}` consists of two central involutions of the Klein group, so (ii) and (iv) fail.

<a id="class-group-surjection-pair"></a>

**Class group surjection pair.** Let `q` be odd, `n` odd, `L ∈ S_n` with ring `O_L` (integral closure of `𝔽_q[t]` in `L`), and `A` a finite abelian group. A pair `(L, α)` consists of `L` and a surjective homomorphism `α : Cl(O_L) → A`. Two pairs `(L, α), (L', α')` are isomorphic if there is a `K`-isomorphism `φ : L → L'` with `α' ∘ φ_* = α`. The nontrivial automorphism `σ` of `L/K` acts on `Cl(O_L)` by `−1`, so `(L, α) ≅ (L, β)` iff `β = ±α`. The moment `m_A(L) := |Sur(Cl(O_L), A)|` counts pairs with fixed `L` before identification.

The required API is:

- `quadraticRingOfIntegers`: `O_L` as the integral closure of `𝔽_q[t]` in `L_f`.

- `quadraticClassGroup`: `Cl(O_L),` a finite abelian group.

- `ClassGroupSurjectionPair`: Surjective homomorphisms `Cl(O_L) → A`, as a subtype.

- `ClassGroupSurjectionPair.neg`: The involution `α ↦ −α`, induced by `σ`.

- `ClassGroupSurjectionPair.neg_ne_self`: For `A ≠ 0` of odd order, `−α ≠ α`.

- `classGroupMoment`: `m_A(L) = |Sur(Cl(O_L), A)|` (zero if `y² − f` is reducible, which does not occur for odd `n`).

- `classGroupMoment_trivial`: `m₀(L) = 1`.

*Proof.* Define the class group of `O_L` (Mathlib ClassGroup of the integral closure), the set of surjections and the involution `α ↦ −α`. `σ` acts by `−1` on `Cl(O_L)`: for a fractional ideal `I, I·σ(I)` is the extension of the norm ideal from `𝔽_q[t],` a principal ideal domain, hence principal. For `|A|` odd and `A ≠ 0, −α ≠ α` for every surjection `α` (else `2α = 0`, forcing `α = 0`), so the sign action on `Sur(Cl(O_L), A)` is free.

*Needs:* [ArithmeticStatisticsPartI §0.11][part-9], [ArithmeticStatisticsPartIV §3.3][part-17], `ClassGroup` (Mathlib), `integralClosure` (Mathlib).

([[37]](#ref-37), Proposition 8.7, p.775 (Annals 183).)

**Checks.**

- For `A = ℤ/3` the zero homomorphism `Cl(O_L) → A` is not a pair.

- `neg (neg α) = α`.

- `A = 0: m_A(L) = 1` for every `L` (the unique map is surjective).

- For `A ≠ 0` of odd order, `m_A(L)` is even.

- For `L = 𝔽₃(t)(√(t³+t²+2))`, the smooth genus-one model has three rational points, so `Cl(O_L) ≅ C₃`. Thus `ClassGroupSurjectionPair` has two elements for `A = C₃` and none for `A = C₉`; the corresponding moments are 2 and 0.

- For `L = 𝔽₇(t)(√(t³+2))`, the smooth genus-one model has nine rational points and every affine point is killed by 3, so `Cl(O_L) ≅ C₃²`. There are eight surjection pairs to `A = C₃`, hence `m_A(L) = 8`. In both examples the unique rational point at infinity identifies the ideal class group with the elliptic-curve group.

<a id="involution-quotient-of-the-unramified-pro-l-group"></a>

**Involution quotient of the unramified pro l group.** Let `q` be odd, `ℓ` an odd prime not dividing `q, n` odd and `L ∈ S_n` with nontrivial automorphism `σ` over `K = 𝔽_q(t)`. Let `J_L` be the Galois group of the maximal abelian everywhere unramified pro-`ℓ` extension of `L`, and `J'_L := J_L/(1 + σ)J_L` its largest quotient on which `σ` acts by `−1`. Class field theory gives an exact sequence `0 → Cl(O_L)_ℓ → J_L → Ẑ_ℓ → 0` on which `σ` acts trivially on `Ẑ_ℓ` and by `−1` on `Cl(O_L)_ℓ`, and the snake lemma yields a canonical isomorphism `J'_L ≅ Cl(O_L)_ℓ`. Here `Cl(O_L)_ℓ` is the `ℓ`-primary part, and `Cl(O_L) ≅ Pic⁰(C_L)(𝔽_q)` because `C_L` has a unique point over `∞`.

*Proof.* Import from the function-field class field theory owner ([ArithmeticStatisticsPartI: function-field class-field and Picard comparison][part-10]): the unramified abelian pro-`ℓ` quotient sits in `0 → Pic⁰(C_L)(𝔽_q)_ℓ → J_L → Ẑ_ℓ → 0` with the degree map to `Gal(𝔽̄_q/𝔽_q)_ℓ`. Identify `Pic⁰(C_L)(𝔽_q)` with `Cl(O_L)` via `I ↦ D_I − deg(D_I)·∞` (unique rational point `∞` over `∞` of `P¹`). `σ` acts by `−1` on `Cl(O_L)` ([class group surjection pair](#class-group-surjection-pair)) and trivially on the constant-field quotient. Apply the snake lemma to multiplication by `1 + σ` on the sequence; since `ℓ` is odd, `(1 + σ)` is invertible on `Ẑ_ℓ` (acts by 2) and zero on `Cl(O_L)_ℓ`, giving `J_L/(1+σ)J_L ≅ Cl(O_L)_ℓ/(1+σ)Cl(O_L)_ℓ = Cl(O_L)_ℓ`.

*Needs:* [class group surjection pair](#class-group-surjection-pair), [ArithmeticStatisticsPartI: function-field class-field and Picard comparison][part-10], `CommGroup.primaryComponent` (Mathlib).

([[37]](#ref-37), Proof of Proposition 8.7, p.775 (Annals 183); [[37]](#ref-37), Proof of Proposition 8.7, p.776 (Annals 183).)

**Checks.**

- Surjections onto an `ℓ`-group `A` factor through the `ℓ`-primary part, so `Sur(Cl(O_L), A) = Sur(J'_L, A)`.

- For `ℓ = 2` the quotient `J_L/(1 + σ)J_L` is not the 2-part of the class group (2 is not invertible).

<a id="hurwitz-points-classify-class-group-surjections"></a>

**Hurwitz points classify class group surjections.** Let `q` be odd, `ℓ` an odd prime with `ℓ ∤ q, A` a nontrivial finite abelian `ℓ`-group, `(G_A, c_A)` the generalized dihedral datum and `X_n = Hn^{c_A}_{G_A,n} ⊗ 𝔽_q, n` odd. There is a bijection between `X_n(𝔽_q)` and the set of isomorphism classes of pairs `(L, α)` with `L ∈ S_n` and `α : Cl(O_L) → A` surjective. Given `(L, α)`, compose `α` with `J'_L ≅ Cl(O_L)_ℓ`, extend to `Gal(F_L/K) = J'_L ⋊ ⟨τ⟩ → G_A` (unique up to `A`-conjugacy), and take the fixed field `F_α:` a tame `G_A`-cover of `P¹` over `𝔽_q`, geometrically connected, branched exactly where `L/K` is (the `n` roots of `f` and `∞`, since `F_α/L` is unramified), a point of `Hn^{c_A}_{G_A,n}: n` branch points in `A¹` with inertia generated by elements of `c_A`, plus ramification at `∞`; conversely a tame `G_A`-cover with inertia in `c_A` branched at `n` points of `A¹` has `X/A → P¹` ramified at `∞` (odd number of finite branch points) and `X → X/A` étale, giving `(L, α)` by class field theory.

Since `G_A` is centre-free (part (iv) of the generalized dihedral datum), an `𝔽_q`-point of the Hurwitz scheme is a cover defined over `𝔽_q`, not only a Galois-stable geometric isomorphism class.

*Proof.* Import the Hurwitz scheme `Hn^c_{G,n}`, finite étale over `Conf_n` over `ℤ[1/|G|]`, and, for centre-free `G` and any field `k` of characteristic prime to `|G|`, the bijection between `Hn^c_{G,n}(k)` and isomorphism classes of tame `G`-covers of `P¹_k` branched at `n` points of `A¹` with finite inertia in `c` (item IG-a of the supplier contracts, extending InverseGaloisAndArithmeticFundamentalGroups §IG.5.3; EVW §§7.1, 7.3). Forward map: by [involution quotient of the unramified pro l group](#involution-quotient-of-the-unramified-pro-l-group) and the splitting (8.7.1) of `1 → J'_L → Gal(F_L/K) → ℤ/2 → 1` (`ℓ` odd), `α` gives `g_α : Gal(F_L/K) → G_A`, well defined up to `A`-conjugacy since all involutions of `G_A` are `A`-conjugate ([generalized dihedral cover datum](#generalized-dihedral-cover-datum) (ii)). Ramification: `F_α/L` is unramified, so the branch points are those of `L/K`; each inertia group maps onto an order-2 subgroup generated by an element of `c_A; 𝔽_q` is algebraically closed in `F_α`. Indeed the constant-field quotient of `G_A` is cyclic, hence factors through `G_A^ab=C₂`. The quadratic subfield `L` is geometric because it ramifies at infinity, so this quotient is trivial. Inverse: for a tame `G_A`-cover `X → P¹` with inertia in `c_A` branched at `n` points of `A¹, X → X/A` is étale over `A¹` (local computation: inertia meets `A` trivially); `X/A → P¹` has an odd number of finite branch points, hence is ramified at `∞`, where the inertia is cyclic of order 2 mapping onto `ℤ/2`, so `X → X/A` is étale everywhere; class field theory ([ArithmeticStatisticsPartI: function-field class-field and Picard comparison][part-10]) turns the étale `A`-cover into `α`. Check the two constructions are mutually inverse on isomorphism classes, using that `(L, α) ≅ (L, β)` iff `β = ±α` ([class group surjection pair](#class-group-surjection-pair)).

*Needs:* [generalized dihedral cover datum](#generalized-dihedral-cover-datum), [class group surjection pair](#class-group-surjection-pair), [involution quotient of the unramified pro l group](#involution-quotient-of-the-unramified-pro-l-group), InverseGaloisAndArithmeticFundamentalGroups Layer IG.5, [ArithmeticStatisticsPartI: function-field class-field and Picard comparison][part-10].

([[37]](#ref-37), Proposition 8.7, p.774–775 (Annals 183); [[37]](#ref-37), Proof of Proposition 8.7, p.776 (Annals 183).)

**Checks.**

- `A = ℤ/3`: the points of `X_n(𝔽_q)` are `S₃`-covers whose quadratic resolvent is in `S_n`.

- The bijection is with isomorphism classes of pairs, i.e. with pairs modulo `α ~ −α`; the marked count is twice the point count ([factor two point count identity](#factor-two-point-count-identity)).

<a id="factor-two-point-count-identity"></a>

**Factor two point count identity.** In the setting of [hurwitz points classify class group surjections](#hurwitz-points-classify-class-group-surjections) (`q` odd, `ℓ` odd, `ℓ ∤ q, A` a nontrivial finite abelian `ℓ`-group, `n` odd): `Σ_{L ∈ S_n} m_A(L) = 2|X_n(𝔽_q)|`. For `A = 0` the average of `m_A` over `S_n` is exactly 1.

*Proof.* `Σ_{L ∈ S_n} m_A(L)` counts pairs `(L, α)` with `α` surjective, `L` running over `S_n` (each field once). Isomorphism classes of pairs with fixed `L` are the orbits of `α ↦ −α`; for `A ≠ 0` of odd order this action is free ([class group surjection pair](#class-group-surjection-pair)), so every class has exactly 2 elements. Distinct `L ∈ S_n` are non-isomorphic over `K`, so the classes over different `L` are distinct; apply the bijection of [hurwitz points classify class group surjections](#hurwitz-points-classify-class-group-surjections).

*Needs:* [hurwitz points classify class group surjections](#hurwitz-points-classify-class-group-surjections), [class group surjection pair](#class-group-surjection-pair), [ArithmeticStatisticsPartI §0.11][part-11].

([[37]](#ref-37), Proof of Theorem 8.8, p.778 (Annals 183).)

**Checks.**

- `A = 0` is excluded from the factor `2: m₀ ≡ 1` and the sign action is trivial.

- Dividing by `|S_n| = 2(q^n − q^{n−1}) (n ≥ 3)` turns the identity into average `m_A = |X_n(𝔽_q)|/(q^n − q^{n−1})`.

<a id="empirical-l-primary-class-group-law"></a>

**Empirical l primary class group law.** Let `q` be odd, `ℓ` prime and `n` odd. The empirical law `ν_n = ν_{q,ℓ,n}` is the probability measure on the set of isomorphism classes of finite abelian `ℓ`-groups with `ν_n(A) := #{L ∈ S_n : Cl(O_L)_ℓ ≅ A}/|S_n|`, where `Cl(O_L)_ℓ` is the `ℓ`-primary part of the (finite) class group. Its `A`-moment `Σ_B ν_n(B)|Sur(B, A)|` equals the average of `m_A(L) = |Sur(Cl(O_L), A)|` over `S_n`, because surjections onto an `ℓ`-group factor through the `ℓ`-primary part.

Isomorphism classes of finite abelian `ℓ`-groups are those of [ArithmeticStatisticsPartIV §3.3][part-18].

The required API is:

- `classGroupPrimaryIso`: The proposition `Cl(O_{L_f})_ℓ ≅ A` (`ℓ`-primary component of the class group, additive form, isomorphic to the standard representative of `A`).

- `empiricalClassGroupLaw`: `ν_n(A) = #{f ∈ P_n : Cl(O_{L_f})_ℓ ≅ A}/|P_n|`.

- `empiricalClassGroupLaw_nonneg`: `0 ≤ ν_n(A) ≤ 1`.

- `hasSum_empiricalClassGroupLaw`: `Σ_A ν_n(A) = 1` (`q` odd, `n` odd).

- `empiricalClassGroupLaw_eq_average`: The `A`-moment of `ν_n` ([ArithmeticStatisticsPartIV §3.4][part-19]) is the average of `m_A` over `P_n`, equivalently over `S_n`.

*Proof.* Class groups `Cl(O_L)` are finite (function-field class number finiteness, via `Pic⁰(C_L)(𝔽_q)` finite); their `ℓ`-primary parts are finite abelian `ℓ`-groups, each isomorphic to exactly one class. Define `ν_n(A)` as the proportion; computing it over polynomials `P_n` instead of `S_n` gives the same value since every class of `S_n` has `(q − 1)/2` representatives. Total mass one: the events `Cl(O_L)_ℓ ≅ A` partition `S_n`. Moment identity: `Sur(Cl(O_L), A) = Sur(Cl(O_L)_ℓ, A)` for `A` an `ℓ`-group (restriction to the primary part is a bijection, the prime-to-`ℓ` part mapping to 0).

*Needs:* [ArithmeticStatisticsPartI §0.11][part-9], [class group surjection pair](#class-group-surjection-pair), [ArithmeticStatisticsPartIV §3.3][part-18], [ArithmeticStatisticsPartIV §3.4][part-19], `CommGroup.primaryComponent` (Mathlib), `ClassGroup` (Mathlib).

([[37]](#ref-37), Deduction of Theorem 1.2 after Theorem 8.8, p.777 (Annals 183); [[37]](#ref-37), Theorem 8.8 context, p.777 (Annals 183).)

**Checks.**

- For every `A, ν_n(A) ≤ 1`.

- classGroupPrimaryIso asks for the `ℓ`-primary part: a field with class group `ℤ/2 × ℤ/3` counts toward `A = ℤ/3` when `ℓ = 3`, although its class group is not a 3-group.

- `ν₁` is the Dirac mass at the trivial group (genus `0: Cl(O_L) = 0`).

- Using the whole class group `Cl(O_L) ≅ A` instead of the `ℓ`-part does not define a probability measure on `ℓ`-groups (EVW p.777 prints `Cl(O_L) ≃ A`).

<a id="lower-and-upper-degree-densities"></a>

**Lower and upper degree densities.** For a real sequence `u : ℕ → ℝ`, its upper (lower) odd-degree density is `limsup (liminf)` of `u(n)` as `n → ∞` through odd `n`. For `q` odd, `ℓ` prime and `A` a finite abelian `ℓ`-group, `δ^+(q, A)` and `δ^−(q, A)` are the upper and lower odd-degree densities of `n ↦ ν_{q,ℓ,n}(A)`. For fixed `q` they need not coincide; the degree limit `n → ∞` is taken before `q → ∞`.

Construct the upper and lower odd-degree densities and their class-group specializations `δ^±(q,A)`. Compare lower and upper densities for bounded sequences, and prove that convergence along odd degrees makes both equal to the limit. The class-group proportions are bounded because `0 ≤ ν_n(A) ≤ 1`.

*Proof.* Define `δ^±` via Mathlib Filter.limsup (and its order dual `liminf`) of `u(2m + 1)` along `m → ∞`. For bounded `u, δ^− ≤ δ^+`, with equality iff `u` converges along odd `n`, in which case both equal the limit.

*Needs:* [empirical l primary class group law](#empirical-l-primary-class-group-law), `Filter.limsup` (Mathlib), `Filter.atTop` (Mathlib).

([[37]](#ref-37), Theorem 1.2, p.730 (Annals 183); [[37]](#ref-37), After Theorem 8.8, p.777 (Annals 183).)

**Checks.**

- For `u ≡ c`, upperOddDensity `u = c` and lowerOddDensity `u = c`.

- For `u(n) = (−1)^{(n−1)/2}` (on odd `n`), upperOddDensity `u = 1` and lowerOddDensity `u = −1`, so the densities differ.

- Changing `u` on even `n` does not change upperOddDensity `u`.

### 5.16 Top-degree traces and the uniform trace estimate

<a id="top-cohomology-counts-rational-components"></a>

**Top cohomology counts rational components.** Let `X` be a smooth separated scheme of finite type and pure dimension `n` over `𝔽_q`, and `λ` a prime not dividing `q`. Then `H^{2n}_c(X_{𝔽̄_q}, ℚ_λ) ≅ ℚ_λ(−n)^{π₀(X_{𝔽̄_q})}`, the permutation representation on geometric connected components twisted by `ℚ_λ(−n)`; hence `Tr(Frob_q | H^{2n}_c(X_{𝔽̄_q}, ℚ_λ)) = q^n · #{geometric components fixed by Frobenius}`. In particular the trace is `q^n` exactly when one geometric component is defined over `𝔽_q`.

*Proof.* Decompose `X_{𝔽̄_q}` into its connected components, which are smooth irreducible of dimension `n` and permuted by Frobenius. For each geometrically connected smooth component `C`, Poincaré duality (EtaleDualityAndPerverseSheaves §§0.5–0.6) gives `H^{2n}_c(C, ℚ_λ) ≅ H⁰(C, ℚ_λ)^∨(−n) = ℚ_λ(−n)`. Frobenius permutes the summands; only fixed components contribute to the trace, each contributing `q^n` (geometric Frobenius acts on `ℚ_λ(−n)` by `q^n`).

*Needs:* EtaleDualityAndPerverseSheaves §§0.5–0.6, InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4.

([[37]](#ref-37), Proof of Theorem 8.8, p.778–779 (Annals 183); [[51]](#ref-51), Proof of Theorem 1.4, p.40 (arXiv v2).)

**Checks.**

- `X = A^n`: trace `q^n`.

- `X =` two conjugate copies of `A^n` over `F_{q²}` viewed over `𝔽_q` (non-split): no fixed component, trace 0.

<a id="uniform-trace-error-estimate"></a>

**Uniform trace error estimate.** Let `X` be a smooth separated finite-type `𝔽_q`-scheme of pure dimension `n, λ ∤ q` a prime, and `C ≥ 1` a real number with `dim H^i(X_{𝔽̄_q}, ℚ_λ) ≤ C^{i+1}` for all `i ≥ 1`. If exactly one geometric connected component of `X` is fixed by Frobenius and `√q > C`, then `|q^{−n}|X(𝔽_q)| − 1| ≤ Σ_{i ≥ 1} C^{i+1} q^{−i/2} = C²/(√q − C)`. The numerical core: for reals `t_j (0 ≤ j < 2n)` with `|t_j| ≤ q^{j/2} C^{2n−j+1}, |q^{−n} Σ_{j<2n} (−1)^j t_j| ≤ C²/(√q − C)`.

The numerical inequality holds for every real `q > 1`; the geometric application specializes `q` to a prime power.

*Proof.* Grothendieck–Lefschetz: `|X(𝔽_q)| = Σ_j (−1)^j Tr(Frob | H^j_c(X_{𝔽̄_q}, ℚ_λ))` (InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4). The `j = 2n` term is `q^n` ([top cohomology counts rational components](#top-cohomology-counts-rational-components)). Deligne's weight bound (DeligneWeightsAndPurity, item 7.12): every Frobenius eigenvalue on `H^j_c` has absolute value `≤ q^{j/2}`; with Poincaré duality `dim H^j_c = dim H^{2n−j}` (EtaleDualityAndPerverseSheaves §0.6)`, |Tr(Frob | H^j_c)| ≤ q^{j/2} C^{2n−j+1}`. Sum the finite range `j < 2n` first, then bound by the geometric series `Σ_{i≥1} (C/√q)^i · C = C²/(√q − C)` (put `i = 2n − j`).

*Needs:* [top cohomology counts rational components](#top-cohomology-counts-rational-components), InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4, EtaleDualityAndPerverseSheaves §§0.5–0.6, DeligneWeightsAndPurity item 7.12.

([[37]](#ref-37), Proof of Theorem 8.8, p.778 (Annals 183).)

**Checks.**

- `C = 1, q = 16`: the bound is `1/3`.

- Only finitely many `j` occur; the infinite series is used only as an upper bound after the finite sum.

- At `q=1,C=1` the strict hypothesis `√q>C` fails, so the zero denominator is excluded.

- At `n=1,q=9,C=1, t₀=1` and `t₁=3` satisfy the trace bounds and give normalized alternating error `2/9`, bounded by `1/2`.

- At `n=0` the finite trace sum is empty, giving error zero and a positive bound whenever `√q>C≥1`.

### 5.17 Hyperelliptic monodromy

<a id="hyperelliptic-torsion-local-system"></a>

**Hyperelliptic torsion local system.** Let `k` be a field with `2ℓ` invertible (`ℓ` an odd prime), `n = 2g + 1` odd, and over `Conf_n ⊗ k` (monic squarefree degree-`n` polynomials `f`) let `C_f` be the smooth projective curve birational to `y² = f(x)`, of genus `g`, with its unique point at `∞`. For each `m ≥ 1` the `ℓ^m`-torsion `V_m := Jac(C_f)[ℓ^m]` forms a locally constant étale sheaf of free `ℤ/ℓ^m`-modules of rank `2g` on `Conf_n ⊗ k`, the Tate module `T = lim V_m` is a lisse `ℤ_ℓ`-sheaf of rank `2g`, and the Weil pairing (from the canonical principal polarization) is a perfect alternating pairing `V_m × V_m → μ_{ℓ^m}`. Consequently geometric monodromy lies in `Sp(V_m)` and, over `k = 𝔽_q,` a Frobenius element acts in `GSp_q(V_m)` (similitude multiplier `q`).

*Proof.* The family `hyperellipticJacobian n` over `Conf_n ⊗ k` is the base change of the principally polarized relative Jacobian supplied by JacobianChallengePartII §§1.2–1.4 when `g > 0`; for `g = 0` it is the trivial principally polarized abelian scheme. Its fibre at `f` is `Jac(C_f)` and its relative dimension is `g`, by the hyperelliptic-model comparisons in the supplier contract. `[ℓ^m]` is finite étale of degree `ℓ^{2mg}` when `ℓ` is invertible, so `V_m` is a locally constant sheaf, free over `ℤ/ℓ^m` of rank `2g` (AbelianSchemesAndArithmeticModuli §A3.2). The canonical principal polarization induces the Weil pairing `V_m × V_m → μ_{ℓ^m}`, perfect and alternating (AbelianSchemesAndArithmeticModuli §§A3.5, A3.7); monodromy preserves it up to the cyclotomic character, which is trivial on the geometric fundamental group and equals `q` on Frobenius over `𝔽_q`.

*Needs:* [ArithmeticStatisticsPartI §0.11][part-9], JacobianChallengePartII §§1.2–1.4, the `hyperellipticJacobian n` comparisons in the [supplier contract](#from-jacobianchallengepartii), and AbelianSchemesAndArithmeticModuli §§A3.2, A3.5, A3.7.

([[37]](#ref-37), Proof of Theorem 8.8, p.779 (Annals 183); [[37]](#ref-37), Proof of Theorem 8.8, p.780 (Annals 183).)

**Checks.**

- `n = 1: g = 0` and `V_m = 0`.

- `n = 3: V_m` has rank 2 (elliptic curves `y² = f(x)` with the point at `∞`).

- The Frobenius multiplier is `q`, not 1: over `𝔽_q` the monodromy image is in `GSp`, not `Sp`.

<a id="geometric-jacobian-cover-comparison"></a>

**Geometric Jacobian cover comparison.** Let `C/K` be a smooth proper geometrically connected curve with a `K`-rational base point, `ℓ` a prime invertible in `K`, and `m ≥ 1`. Abel–Jacobi and the multiplication cover of the Jacobian induce a canonical isomorphism `π₁(C_K̄)^{ab}/ℓ^m ≅ Jac(C)[ℓ^m](K̄)`, equivariant for `Gal(K̄/K)`. For a finite constant abelian group `A` killed by `ℓ^m`, connected étale `A`-covers over `K̄`, retaining the identification of the deck group with `A`, correspond to `Sur(Jac(C)[ℓ^m](K̄), A)`. Covers are taken up to `A`-equivariant isomorphism. Prove functoriality for pointed curve maps and Galois equivariance. For a pointed hyperelliptic curve in characteristic different from two, the hyperelliptic involution induces `−1` on this quotient; forgetting its lift in the generalized-dihedral cover gives the sign quotient used below.

*Proof.* The pointed Abel–Jacobi map identifies the abelian geometric fundamental groups of the curve and its Jacobian. The deck transformations of `[ℓ^m]` identify the latter's quotient modulo `ℓ^m` with its torsion points. Both maps are defined over `K`, so the identification is Galois equivariant. The finite-cover equivalence turns connected constant-`A` covers into surjective homomorphisms; conjugation has no effect because `A` is abelian.

*Needs:* TauCetiRoadmap.JacobianChallenge Layers D and F (pointed Jacobians and Abel–Jacobi), AbelianSchemesAndArithmeticModuli §A3.2, InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 (finite covers and fundamental groups).

([[37]](#ref-37), proof of Theorem 8.8, p.779, and its reference [37], Katz–Lang, *Finiteness theorems in geometric classfield theory*, (2.4).)

**Checks.**

- For `C = P¹` both the abelian geometric fundamental-group quotient and the Jacobian torsion are zero; a nontrivial `A` has no connected étale cover.

- For an elliptic curve and `A = ℤ/ℓ`, the torsion is `𝔽_ℓ²`, giving `ℓ²−1` surjections, with deck-group identifications retained.

- At `ℓ = 3` in genus one, the hyperelliptic sign acts freely on the eight nonzero maps to `𝔽₃`, leaving four unmarked sign classes.

<a id="geometric-generic-fibre-of-the-unmarked-hurwitz-cover"></a>

**Geometric generic fibre of the unmarked hurwitz cover.** Let `ℓ` be odd, `A` a nontrivial finite abelian `ℓ`-group, `m ≥ 1` with `ℓ^m A = 0`, and `n = 2g + 1` odd. Over the function field `K` of `Conf_n ⊗ 𝔽_q` (or any field of characteristic prime to `2ℓ`), the geometric generic fibre Σ of the finite étale cover `X_n = Hn^{c_A}_{G_A,n} → Conf_n` is identified, `Gal(K̄/K)`-equivariantly, with `Sur(V_m, A)/{±1}`, where `V_m` is the group of `K̄`-points of `Jac(C)[ℓ^m]`, with its monodromy action. The marked set `Sur(V_m, A)` has twice as many elements, and since `−I ∈ Sp(V_m)`, the `Sp(V_m)`-orbit sets of `Sur(V_m, A)` and of `Sur(V_m, A)/{±1}` correspond bijectively.

*Proof.* Apply the [geometric Jacobian cover comparison](#geometric-jacobian-cover-comparison) to the pointed hyperelliptic curve. The generalized-dihedral dictionary then forgets the lift of the hyperelliptic involution, taking the sign quotient. The constructions commute with `Gal(K̄/K)`. Since `−I ∈ Sp(V_m)` acts as the sign, each `Sp`-orbit on `Sur(V_m, A)` is a union of sign classes; orbit sets correspond.

*Needs:* [geometric Jacobian cover comparison](#geometric-jacobian-cover-comparison), [hurwitz points classify class group surjections](#hurwitz-points-classify-class-group-surjections), [hyperelliptic torsion local system](#hyperelliptic-torsion-local-system), [class group surjection pair](#class-group-surjection-pair), InverseGaloisAndArithmeticFundamentalGroups Layer IG.5.

([[37]](#ref-37), Proof of Theorem 8.8, p.779 (Annals 183).)

**Checks.**

- `V = 𝔽_3², A = 𝔽₃: 8` surjections, 4 sign classes.

- EVW (p.779) identify `Σ` with `Sur(V, A)` itself. Since `−I ∈ Sp(V_m)`, the `Sp`-orbit sets of `Sur(V_m, A)` and of `Sur(V_m, A)/{±1}` correspond, so the component count of §5.18 is unaffected.

- In genus zero and for nontrivial `A`, the surjection set and the geometric fibre are empty.

<a id="hyperelliptic-boundary-degeneration"></a>

**Hyperelliptic boundary degeneration.** Let `k` be algebraically closed with `2ℓ` invertible, `g ≥ 3`. Throughout, `H̃_h` denotes the smooth locus of the labelled hyperelliptic moduli stack and `H̃_h^ct` its compact-type locus. There are clutching maps `κ_L : H̃_{g−1}^ct × H̃_1^ct → H̃_g^ct`, `κ_R : H̃_1^ct × H̃_{g−1}^ct → H̃_g^ct` and `κ : H̃_1^ct × H̃_{g−2}^ct × H̃_1^ct → H̃_g^ct`. The triple clutching factors through both maps by compact-type clutching in the intermediate factor. Its image is the boundary stratum `Δ_{1,1}`, in the closure of `H̃_g`. Along a binary clutching map the `ℓ`-torsion splits: `κ^*Pic⁰(C_γ)[ℓ] ≅ Pic⁰(C_{γ1})[ℓ] × Pic⁰(C_{γ2})[ℓ]` as symplectic local systems. Compute product monodromy first on the dense loci where the factors are smooth; the finite-cover dense-open criterion then identifies it with the compact-type monodromy. The clutching images lie on the boundary.

*Proof.* Achter–Pries Lemma 2.5: the class vector of `H̃_g` splits into `γ1 = γ3 = (1,1,1,1)` and `γ2` of length `2g − 2`, giving the `Δ_{1,1}` degeneration. Achter–Pries Lemma `3.1(a)`: for a stable curve `C = C1 ∪ C2` meeting in one section, restriction gives `Pic⁰(C) ≅ Pic⁰(C1) × Pic⁰(C2)` on stalks, hence an isomorphism of `ℓ`-torsion sheaves. The dual graph is a tree, so the nodal curve is of compact type and `Pic⁰` is an abelian scheme; the displayed product is not a statement about a smooth glued curve. Achter–Pries Lemma `3.1(b)`: the Galois cover trivialising the product local system has group `H1 × H2`, so the monodromy of the image of `κ` is the product.

*Needs:* [hyperelliptic torsion local system](#hyperelliptic-torsion-local-system), InverseGaloisAndArithmeticFundamentalGroups §§IG.5.4, IG.5.7 (admissible covers, compact type and finite-cover dense-open criteria).

([[48]](#ref-48), diagram (2.3), p.6, Lemma 2.5, p.7, and Lemma 3.1, p.11 (Achter–Pries author PDF).)

**Checks.**

- `g = 3`: the middle factor has genus 1 and `Δ_1 = Δ_2`, so monodromy groups must be computed exactly (AP Remark 2.6).

- For `g ≤ 2` there is no such degeneration; the base cases use full curve moduli.

- At `g = 3` the triple clutching of three elliptic curves has a nodal genus-two intermediate factor, which lies in `H̃_2^ct` and outside `H̃_2`.

<a id="overlapping-symplectic-subgroups-generate"></a>

**Overlapping symplectic subgroups generate.** Let `F` be a finite field of odd characteristic and `V = V1 ⊕ V2 ⊕ V3` a nondegenerate symplectic `F`-space with the `V_i` pairwise orthogonal and all nonzero. If a subgroup `H ≤ Sp(V)` contains `Sp(V1 ⊕ V2) × Sp(V3)` and `Sp(V1) × Sp(V2 ⊕ V3)`, then `H = Sp(V)`.

*Proof.* Prove that `Sp(V)` is generated by `t_{v,a}(x) = x + a⟨x, v⟩v`: the subgroup they generate contains the positive and negative long-root subgroups and, by products of transvections, both adjacent short-root orientations; apply Tau Ceti's `TauCeti.GLSymplecticFin.eq_top_of_adjacent_of_long` after a symplectic basis change. Transvections along vectors of `V1 ⊕ V2` or of `V2 ⊕ V3` lie in `H` by hypothesis (they are the transvections of those nondegenerate summands, extended by the identity). For `v = v1 + v2 + v3` with `v1 + v2 ≠ 0: Sp(V1 ⊕ V2)` acts transitively on nonzero vectors of `V1 ⊕ V2` and `V2 ≠ 0`, so some `h ∈ Sp(V1 ⊕ V2) ⊂ H` sends `v1 + v2` into `V2`; then `h(v) ∈ V2 ⊕ V3, t_{h(v),a} ∈ H` and `t_{v,a} = h^{−1} t_{h(v),a} h ∈ H`. If `v1 + v2 = 0` then `v ∈ V3`. Hence `H` contains all transvections and `H = Sp(V)`. This elementary argument replaces Achter–Pries's appeal to the maximality of `Sp(V1 ⊕ V2) × Sp(V3)` in `Sp(V)` (Kleidman–Liebeck), which needs `V1 ⊕ V2` and `V3` of different dimensions.

*Needs:* `Matrix.symplecticGroup` (Mathlib).

([[48]](#ref-48), Lemma 3.2(b)(i), p.12 (Achter–Pries author PDF).)

**Checks.**

- `dim V1 = dim V3 = 2, dim V2 = 2g − 4` is the case used for `g ≥ 3`.

- The hypothesis `V2 ≠ 0` is used: for `V = V1 ⊕ V3`, the subgroup `Sp(V1) × Sp(V3)` contains both block subgroups and is proper.

<a id="mod-l-hyperelliptic-monodromy-is-symplectic"></a>

**Mod l hyperelliptic monodromy is symplectic.** Let `ℓ` be an odd prime and `k` an algebraically closed field in which `2ℓ` is invertible. For every `g ≥ 1` the `mod-ℓ` monodromy groups of the labelled hyperelliptic moduli space `H̃_g ⊗ k` and of the hyperelliptic moduli space `H_g ⊗ k` (tautological curves, `ℓ`-torsion of `Pic⁰`) are both `Sp_{2g}(𝔽_ℓ)`.

*Proof.* `H_g ⊗ k` is open dense in its closure, which is dominated by `H̃_g ⊗ k`, so it suffices to treat `H̃_g` (restriction to a dense open does not change the image: InverseGaloisAndArithmeticFundamentalGroups §IG.5.7, *Finite-cover criteria for full monodromy image*). Base cases `g = 1, 2`: every curve of genus `g` is hyperelliptic, so `M_ℓ(H_g) = M_ℓ(M_g) = Sp_{2g}(𝔽_ℓ)` (Deligne–Mumford 5.15–5.16; prove these genus-one and genus-two base cases as part of this target); pass to `H̃_g` by Achter–Pries Lemma 3.3, since the Galois group `Sym(2g + 2)` of `H̃_g → H_g` and `Sp_{2g}(𝔽_ℓ)` have no common nontrivial quotient (`PSp_{2g}(𝔽_ℓ)` simple except `PSp₂(𝔽₃) ≅ A₄`). In the exceptional base case `(g,ℓ)=(1,3), SL₂(𝔽₃)` has abelianization `C₃` and its nontrivial proper quotients have a `C₃` quotient, whereas `S₄` has no `C₃` quotient; this excludes a common nontrivial quotient as well. Induction for `g ≥ 3`: by [hyperelliptic boundary degeneration](#hyperelliptic-boundary-degeneration) the image contains `Sp(V1) × Sp(V2 ⊕ V3)` and `Sp(V1 ⊕ V2) × Sp(V3)` with `dim V1 = dim V3 = 2` (induction hypothesis for genera 1 and `g − 1`). Conclude by [overlapping symplectic subgroups generate](#overlapping-symplectic-subgroups-generate).

*Needs:* [hyperelliptic boundary degeneration](#hyperelliptic-boundary-degeneration), [overlapping symplectic subgroups generate](#overlapping-symplectic-subgroups-generate), [hyperelliptic torsion local system](#hyperelliptic-torsion-local-system), InverseGaloisAndArithmeticFundamentalGroups Layer IG.0.

([[48]](#ref-48), Theorem 3.4, p.13 (Achter–Pries author PDF); [[48]](#ref-48), Proof of Theorem 3.4, p.13 (Achter–Pries author PDF).)

**Checks.**

- `g = 1: Sp₂ = SL₂(𝔽_ℓ)`.

- At `ℓ=2` the labelled family has trivial action on its labelled Weierstrass-point 2-torsion. The unlabelled image is the permutation image of `S_{2g+2}`; it is the full symplectic group for `g=1,2`, but is proper for `g≥3`. Thus the odd-prime theorem cannot be extended unchanged.

<a id="integral-lift-of-full-mod-l-symplectic-image"></a>

**Integral lift of full mod l symplectic image.** Let `ℓ` be an odd prime, `g ≥ 1` and `H ≤ Sp_{2g}(ℤ_ℓ)` a closed subgroup whose reduction `mod ℓ` is all of `Sp_{2g}(𝔽_ℓ)`. If `g ≥ 2` or `ℓ ≥ 5`, then `H = Sp_{2g}(ℤ_ℓ)`. For `(g, ℓ) = (1, 3)` the conclusion needs the extra condition that `H mod 9` meets the kernel of `SL₂(ℤ/9) → SL₂(𝔽₃)` nontrivially; without it the implication fails: the order-24 subgroup of `SL₂(ℤ/9)` generated by `[[0, 1], [8, 0]]` and `[[1, 7], [6, 7]]` maps isomorphically onto `SL₂(𝔽₃)`, and its inverse image in `SL₂(ℤ₃)` is a proper closed subgroup (of index 27) with full `mod-3` image.

The signature `Similitude.integral_lift` uses Mathlib’s symplectic matrix group, its subtype topology, `PadicInt.toZMod` and `PadicInt.toZModPow 2`; the exceptional kernel hypothesis is required exactly when `g = 1, ℓ = 3`.

*Proof.* `Sp_{2g}` is simply connected, so Vasiu's Main Theorem 1.3 applies with `c(G) = 1`: case `(a) ℓ ≥ 5`; case `(b) ℓ = 3`, where the extra condition concerns only normal `SL₂/PGL₂` factors, i.e. only `g = 1`. The mechanism (Vasiu §§3.7.1, 4.1.2, 4.5, 4.7; Serre's lifting argument)`: H mod ℓ²` surjects onto `Sp_{2g}(𝔽_ℓ)`; the extension `0 → sp_{2g}(𝔽_ℓ) → Sp_{2g}(ℤ/ℓ²) → Sp_{2g}(𝔽_ℓ) → 1` does not split and the adjoint module is irreducible, so `H mod ℓ²` contains the whole congruence kernel; then powering lifts congruence kernels level by level and `H = Sp_{2g}(ℤ_ℓ)` by closedness. Prove the congruence-kernel and nonsplitting assertions before applying this integral lift. The (1, 3) witness: check by finite computation that the two matrices generate a group of order 24 mapping bijectively to `SL₂(𝔽₃)` (whose order is 24), so its preimage in `SL₂(ℤ₃)` misses the nontrivial level-2 congruence kernel.

*Needs:* `Matrix.symplecticGroup` (Mathlib), `PadicInt` (Mathlib), `ZMod` (Mathlib).

([[49]](#ref-49), Main Theorem 1.3, p.2 (arXiv math/0209237v2); [[49]](#ref-49), Main Theorem 1.3(b), p.2 (arXiv math/0209237v2).)

**Checks.**

- The (1, 3) subgroup of index 27 is a closed proper subgroup with full `mod-3` image.

- Achter–Pries Corollary 3.5 invokes 'a standard group theory argument' at all `(g, ℓ)`, which is insufficient at (1, 3).

- For `g = 2, ℓ = 3`, no exceptional rank-two condition is imposed; full reduction and closedness suffice.

<a id="integral-hyperelliptic-monodromy"></a>

**Integral hyperelliptic monodromy.** Let `ℓ` be an odd prime and `k` algebraically closed with `2ℓ` invertible. For `g ≥ 2`, or `g = 1` and `ℓ ≥ 5`, the `ℓ`-adic monodromy groups of `H̃_g ⊗ k` and of `H_g ⊗ k` are `Sp_{2g}(ℤ_ℓ)`. The case `(g, ℓ) = (1, 3)` is not covered by this argument.

*Proof.* The `ℓ`-adic image is a closed subgroup of `Sp_{2g}(ℤ_ℓ)` (compact image of a profinite group; the Weil pairing gives the upper bound: [hyperelliptic torsion local system](#hyperelliptic-torsion-local-system)). Its reduction `mod ℓ` is `Sp_{2g}(𝔽_ℓ)` by [mod l hyperelliptic monodromy is symplectic](#mod-l-hyperelliptic-monodromy-is-symplectic). Apply [integral lift of full mod l symplectic image](#integral-lift-of-full-mod-l-symplectic-image) in the stated range.

*Needs:* [mod l hyperelliptic monodromy is symplectic](#mod-l-hyperelliptic-monodromy-is-symplectic), [integral lift of full mod l symplectic image](#integral-lift-of-full-mod-l-symplectic-image), [hyperelliptic torsion local system](#hyperelliptic-torsion-local-system).

([[48]](#ref-48), Corollary 3.5 and proof, p.14 (Achter–Pries author PDF).)

**Checks.**

- `g = 1, ℓ = 3` is exactly the excluded case.

- The eventual-`n` statement needed by EVW uses only large `g`.

<a id="monodromy-of-the-odd-degree-polynomial-family"></a>

**Monodromy of the odd degree polynomial family.** Let `ℓ` be odd, `k` algebraically closed with `2ℓ` invertible and `n = 2g + 1 ≥ 5` (or `n = 3` with `ℓ ≥ 5`). The geometric `ℓ`-adic monodromy of the Jacobian of `y² = ∏_{i=1}^n (x − a_i)` over `Conf_n(A¹_k)` is `Sp_{2g}(ℤ_ℓ)`.

*Proof.* The family over the ordered configuration space `PConf_n` is a torsor under the smooth connected group `B_n` of affine changes `(a, b, d)` with `d² = a^n`, and `[PConf_n/B_n] ≅ H̃_g^{sm}` keeps the hyperelliptic involution (InverseGaloisAndArithmeticFundamentalGroups §IG.5.7, *The labelled hyperelliptic quotient family* and *The lifted affine coordinate group*, where `B_n` is written `Ã_n`). A representable smooth surjection with geometrically connected fibres induces a surjection on étale `π₁` (§IG.5.7, *Finite-cover criteria for full monodromy image*); restriction from the compact-type locus to the smooth locus does not change the image (the same item). Hence the image over `PConf_n` equals that over `H̃_g`, which is `Sp_{2g}(ℤ_ℓ)` by [integral hyperelliptic monodromy](#integral-hyperelliptic-monodromy); `PConf_n → Conf_n` is finite étale Galois with group `S_n`, and the image over `Conf_n` contains the image over `PConf_n` and is contained in `Sp_{2g}(ℤ_ℓ)`.

*Needs:* [integral hyperelliptic monodromy](#integral-hyperelliptic-monodromy), [hyperelliptic torsion local system](#hyperelliptic-torsion-local-system), InverseGaloisAndArithmeticFundamentalGroups Layer IG.0, InverseGaloisAndArithmeticFundamentalGroups Layer IG.1.

([[37]](#ref-37), Proof of Theorem 8.8, p.780 (Annals 183).)

**Checks.**

- `n = 3, ℓ = 3` is excluded (genus 1).

- The statement is geometric: over `𝔽_q` the arithmetic image lies in `GSp` with multiplier `q`.

<a id="finite-level-monodromy-of-the-polynomial-family"></a>

**Finite level monodromy of the polynomial family.** In the range of [monodromy of the odd degree polynomial family](#monodromy-of-the-odd-degree-polynomial-family), for every `m ≥ 1` the geometric monodromy image on `V_m = Jac[ℓ^m]` is `Sp_{2g}(ℤ/ℓ^m)`, and the arithmetic image over `𝔽_q` contains elements of `GSp_q(V_m)` lying over Frobenius. Any element of `GSp_q(V_m)` lifts to `GSp_q(T)` (`T` the Tate module), by smoothness of `GSp`.

*Proof.* `V_m = T/ℓ^m T` equivariantly; reduction `Sp_{2g}(ℤ_ℓ) → Sp_{2g}(ℤ/ℓ^m)` is surjective (`Sp_{2g}` is smooth over `ℤ_ℓ`, Hensel lifting). Frobenius acts with multiplier `q` ([hyperelliptic torsion local system](#hyperelliptic-torsion-local-system))`; GSp_q(T) → GSp_q(V_m)` is surjective by smoothness of `GSp` and of the multiplier fibre.

*Needs:* [monodromy of the odd degree polynomial family](#monodromy-of-the-odd-degree-polynomial-family), [hyperelliptic torsion local system](#hyperelliptic-torsion-local-system).

([[37]](#ref-37), Proof of Theorem 8.8, p.780 (Annals 183).)

**Checks.**

- `m = 1` recovers Achter–Pries' `mod-ℓ` statement.

- This does not identify the unmarked Hurwitz fibre with the marked set (see [geometric generic fibre of the unmarked hurwitz cover](#geometric-generic-fibre-of-the-unmarked-hurwitz-cover)).

### 5.18 Similitude orbits and rational components

<a id="symplectic-similitude-group"></a>

**Symplectic similitude matrix subsets.** ArithmeticGaloisRepresentations §7.3 supplies `SimilitudeGroup.groupScheme`, `SimilitudeGroup.multiplier`, `SimilitudeGroup.GSp` and `SimilitudeGroup.mem_iff`, including both transpose conventions over commutative rings. For the standard symplectic module `R^{2g}`, build the matrix subsets `{h | h J hᵀ = m J}` for every scalar `m`, including nonunits, and their union over unit multipliers. For `g ≥ 1` identify this union with the matrix projection of the supplied `GSp`; a unit-multiplier subset is the matrix image of a multiplier fibre, hence a coset of `Sp`. Use the supplied membership criterion to reconcile its matrix `−Matrix.J` with `Matrix.J`. At `g = 0` retain the matrix subsets and their union: every multiplier gives the same singleton subset, so there is no unique matrix multiplier.

Construct each scalar-multiplier matrix subset and the union over unit multipliers. Prove uniqueness of the multiplier in positive rank, the defining membership criterion, equality of the multiplier-one subset with Mathlib's symplectic group, multiplication of multipliers and preservation under every ring homomorphism `R → R′`.

*Proof.* Matrix multiplication proves the scalar product law, including for nonunits. For `g≥1` a standard entry of `J` is 1, so `mJ=m′J` implies `m=m′`; invertibility of an empty matrix alone would not prove uniqueness. For a unit multiplier, taking determinants shows `h` is invertible. Apply the supplied `SimilitudeGroup.mem_iff`: replacing `J` by `−J` leaves the equation unchanged, and `J⁻¹=−J` gives the equivalent transpose convention. This identifies the union with the supplied group's matrix projection. The multiplier-one subset recovers Mathlib symplecticGroup.

*Needs:* ArithmeticGaloisRepresentations §7.3 (`SimilitudeGroup.groupScheme`, `SimilitudeGroup.multiplier`, `SimilitudeGroup.GSp`, `SimilitudeGroup.mem_iff`), `Matrix.symplecticGroup` (Mathlib), `SymplecticGroup.mem_iff` (Mathlib), `Matrix.J` (Mathlib).

([[37]](#ref-37), Proof of Theorem 8.8, p.779–780 (Annals 183).)

**Checks.**

- Over `ℤ_ℓ`, the block matrix `diag(I, q·I)` lies in `GSp_q` for every unit `q`.

- `−1` lies in `GSp₁ = Sp`.

- Over `ℤ_ℓ` with `g = 1, diag(1, ℓ)` satisfies `h J hᵀ = ℓ J` but is not in similitudeGroup, since `ℓ` is not a unit.

- At `g = 0` the empty matrix lies in every scalar subset; the multiplier-uniqueness theorem therefore requires positive rank.

<a id="monodromy-orbits-and-rational-components"></a>

**Monodromy orbits and rational components.** In the range of [monodromy of the odd degree polynomial family](#monodromy-of-the-odd-degree-polynomial-family) (`A` a nontrivial finite abelian `ℓ`-group, `ℓ` odd, `q` odd with `ℓ ∤ q, ℓ^m A = 0`): the geometric connected components of `X_n ⊗ 𝔽̄_q` correspond bijectively to `Sp(V_m)`-orbits on `Sur(V_m, A)`, and an orbit `O` gives a component defined over `𝔽_q` iff the stabilizer in `GSp(V_m)` of some (equivalently every) `x ∈ O` meets `GSp_q(V_m)`. Via `T → V_m` these are the `Sp(T)`-orbits on `Sur(T, A)` whose stabilizer meets `GSp_q(T)`.

*Proof.* Connected components of a finite étale cover of a geometrically connected base are orbits of the geometric fundamental group on the geometric generic fibre; a component is defined over `𝔽_q` iff Frobenius preserves the orbit (InverseGaloisAndArithmeticFundamentalGroups §IG.0.3, finite étale covers as finite `π₁`-sets, with the arithmetic/geometric sequence of Layer IG.1). The fibre is `Sur(V_m, A)/{±1}` ([geometric generic fibre of the unmarked hurwitz cover](#geometric-generic-fibre-of-the-unmarked-hurwitz-cover)); since `−I ∈ Sp`, the orbit sets agree with those on `Sur(V_m, A)`. The geometric image is `Sp(V_m)` ([finite level monodromy of the polynomial family](#finite-level-monodromy-of-the-polynomial-family)) and a Frobenius element lies in `GSp_q(V_m)`; Frobenius fixes the orbit of `x` iff some element of `Sp·F = GSp_q ∩` (image) fixes `x`, i.e. the stabilizer of `x` meets `GSp_q`. Lift to `T` using surjectivity `GSp_q(T) → GSp_q(V_m)` and `Sur(V_m, A) = Sur(T, A)`.

*Needs:* [geometric generic fibre of the unmarked hurwitz cover](#geometric-generic-fibre-of-the-unmarked-hurwitz-cover), [finite level monodromy of the polynomial family](#finite-level-monodromy-of-the-polynomial-family), [symplectic similitude matrix subsets](#symplectic-similitude-group), InverseGaloisAndArithmeticFundamentalGroups Layer IG.0, InverseGaloisAndArithmeticFundamentalGroups Layer IG.1.

([[37]](#ref-37), Proof of Theorem 8.8, p.780 (Annals 183).)

**Checks.**

- `A = 0` lies outside the statement: `Sur(V_m, 0)` is the single zero map, so it would give one orbit and one component.

- The equivalence 'some `x`' `⇔` 'every `x`' holds because stabilizers along an orbit are `Sp`-conjugate and `Sp` is normal in `GSp`.

<a id="primary-decomposition-for-a-multiplier-q-similitude"></a>

**Primary decomposition for a multiplier q similitude.** Let `ℓ` be odd, `V` free of rank `2g` over `ℤ_ℓ` with a perfect alternating pairing, `q ∈ ℤ_ℓ^×` with `q − 1 ∈ ℤ_ℓ^×`, and `h ∈ GSp_q(V)`. Let `V₁` (resp. `V_q`) be the set of `v ∈ V` with `(h − 1)^N v → 0` (resp. `(h − q)^N v → 0`) `ℓ`-adically, and `W := ⋂_N (h − 1)^N (h − q)^N V`. Then `V = V₁ ⊕ V_q ⊕ W` as `ℤ_ℓ`-modules, each summand is `h`-stable, `h − 1` is invertible on `V_q ⊕ W` and `h − q` is invertible on `V₁ ⊕ W`.

*Proof.* Factor the characteristic polynomial of `h mod ℓ` into its `(x − 1)`-primary part, `(x − q)`-primary part and a coprime remainder (`1 ≠ q` in `𝔽_ℓ`); lift the coprime factorisation by Hensel's lemma to `ℤ_ℓ[x]`. The corresponding idempotents in `ℤ_ℓ[h]` give an `h`-stable decomposition `V = V₁ ⊕ V_q ⊕ W` with the stated invertibility (a polynomial coprime `mod ℓ` to the char. poly. of `h` on a summand acts invertibly on it). Identify the idempotent summands with the limit descriptions (EVW's definitions): on `V₁, h − 1` is topologically nilpotent; on the complement it is invertible.

*Needs:* [symplectic similitude matrix subsets](#symplectic-similitude-group), `PadicInt` (Mathlib), `Module.End.maxGenEigenspace` (Mathlib).

([[37]](#ref-37), Proof of Lemma 8.9, p.781 (Annals 183).)

**Checks.**

- In a symplectic basis `(e₁, …, e_g, f₁, …, f_g)` with `ω(e_i, f_j) = δ_ij`, the map `h` fixing every `e_i` and sending `f_j` to `q f_j` has multiplier `q`, and `V₁ =` span`(e_i), V_q =` span`(f_j), W = 0`.

- If `q ≡ 1 mod ℓ` the decomposition `V₁ ⊕ V_q` fails (the primary parts coincide `mod ℓ`); this is why `q − 1` must be a unit.

<a id="symplectic-normal-forms-over-z-l"></a>

**Symplectic normal forms over z l.** Let `M` be a finite free `ℤ_ℓ`-module with a perfect alternating pairing. (i) `M` has a symplectic basis; any basis `x₁, …, x_g` of a Lagrangian direct summand extends to one; hence `Sp(M)` acts transitively on Lagrangian direct summands. (ii) Each factor in an orthogonal direct-sum decomposition of `M` inherits a perfect pairing. (iii) `M = M_+ ⊕ M_−` with `M_±` Lagrangian. (iv) If `M = P ⊕ Q` with `P, Q` isotropic, both are Lagrangian (of rank half of `M`). (v) Every automorphism of a Lagrangian `M_+` extends, by inverse transpose on a complementary Lagrangian `M_−`, to an element of `Sp(M)`.

*Proof.* (i) Given a basis `x_i` of a Lagrangian summand, choose `y_j` with `ω(x_i, y_j) = δ_ij` by perfectness, then correct `y_j` by combinations of the `x_i` to make `⟨y_i, y_j⟩ = 0` (EVW's argument); transitivity follows by mapping one symplectic basis to another. (ii) Choose bases of the two orthogonal direct summands. The Gram matrix is block diagonal, and its determinant is a unit by perfectness. Each block determinant is therefore a unit in `ℤ_ℓ`, proving perfectness of both restricted pairings; absence of a radical alone would not suffice over `ℤ_ℓ`. (iii) Take the spans of the two halves of a symplectic basis. (iv) Reduce `mod ℓ` and use the field statement (isotropic subspaces have dimension at most half). (v) With respect to a symplectic basis adapted to `M_+ ⊕ M_−`, the block matrix `diag(a, (aᵀ)^{−1})` is symplectic.

*Needs:* [symplectic similitude matrix subsets](#symplectic-similitude-group), `PadicInt` (Mathlib), `Matrix.symplecticGroup` (Mathlib).

([[37]](#ref-37), Proof of Lemma 8.9, p.780–781 (Annals 183); [[37]](#ref-37), Proof of Lemma 8.9, p.782 (Annals 183).)

**Checks.**

- `M = ℤ_ℓ²`: every primitive vector spans a Lagrangian.

- Over `ℤ_ℓ` the summand condition matters: `ℓℤ_ℓ·e₁` is isotropic but not a direct summand.

<a id="orthogonality-and-a-killed-lagrangian"></a>

**Orthogonality and a killed lagrangian.** In [primary decomposition for a multiplier q similitude](#primary-decomposition-for-a-multiplier-q-similitude): `V₁` and `V_q` are isotropic, `V₁ ⊕ V_q` is orthogonal to `W`, and `W` is nondegenerate; `W = W_+ ⊕ W_−` with `W_±` isotropic, and then `W_+ ⊕ V₁` and `W_− ⊕ V_q` are complementary maximal isotropic (Lagrangian) direct summands of `V`. If `f : V → A` satisfies `f ∘ h = f`, then the Lagrangian `W_− ⊕ V_q` lies in the image of `h − 1`, hence in `ker f`.

*Proof.* For `x ∈ V₁` and `y ∈ V₁ ⊕ W` write `y = (h − q)^N z_N`; using `ω(hx, hy) = q ω(x, y), ω(x, y) ∈ ω((h − 1)^N x, V)` for all `N`, hence 0 (EVW's iteration). Symmetrically for `V_q`. More explicitly the adjoint of `h−q` is `−q h⁻¹(h−1)`. Its `N`-th power puts the pairing in the ideal generated by the coordinates of `(h−1)^N x`; the integral factors `q^N h⁻N` preserve divisibility. Those coordinates tend to zero `ℓ`-adically, forcing the pairing to vanish. `W` is nondegenerate as an orthogonal summand of a perfect pairing (EVW fact (ii)); decompose `W` into two isotropic summands (EVW fact (iii), a symplectic basis: [symplectic normal forms over z l](#symplectic-normal-forms-over-z-l)). `(V₁ ⊕ W_+) ⊕ (V_q ⊕ W_−) = V` with both summands isotropic, so both are maximal isotropic (fact (iv)). `h − 1` is invertible on `V_q ⊕ W`, so `V_q ⊕ W_− ⊆ im(h − 1); f ∘ (h − 1) = 0` gives `V_q ⊕ W_− ⊆ ker f`.

*Needs:* [primary decomposition for a multiplier q similitude](#primary-decomposition-for-a-multiplier-q-similitude), [symplectic normal forms over z l](#symplectic-normal-forms-over-z-l).

([[37]](#ref-37), Proof of Lemma 8.9, p.782 (Annals 183).)

**Checks.**

- Let `h` be `q` on `V_+` and 1 on `V_−`, and let `f` factor through projection to `V_−`. Then `V_+=V_q` is the killed Lagrangian.

- Without `q − 1` invertible the conclusion fails for `h = I`.

<a id="linear-group-transitive-on-lattice-surjections"></a>

**Linear group transitive on lattice surjections.** Let `A` be a finite abelian `ℓ`-group generated by at most `g` elements. Then `GL_g(ℤ_ℓ)` acts transitively (by precomposition) on the set of surjective homomorphisms `ℤ_ℓ^g → A`.

Express the action using linear maps to the canonical finite `ℤ_ℓ`-module of the finite abelian `ℓ`-group and linear automorphisms of the source.

*Proof.* Fix `x₁, …, x_k ∈ A` whose classes form a basis of `A/ℓA`; by Nakayama they generate `A`. Let `f : ℤ_ℓ^g → A` be surjective and choose `y₁, …, y_k` with `f(y_i) = x_i`. Their classes in `𝔽_ℓ^g` map to a basis of `A/ℓA`, so they are independent; extend them to a basis of `𝔽_ℓ^g` and lift it to a basis `y₁, …, y_g` of `ℤ_ℓ^g` (Nakayama). For `j > k` write `f(y_j) = Σ_i c_{ji} x_i` and replace `y_j` by `y_j − Σ_i c_{ji} y_i`. The result is still a basis, with `f(y_i) = x_i` for `i ≤ k` and `f(y_j) = 0` for `j > k`. A second surjection `f′` gives a basis `y′` of the same shape, and the automorphism `φ` with `φ(y′_i) = y_i` satisfies `f ∘ φ = f′`.

*Needs:* `PadicInt` (Mathlib), `Matrix.GeneralLinearGroup` (Mathlib).

([[37]](#ref-37), End of proof of Lemma 8.9, p.782 (Annals 183).)

**Checks.**

- `A = 0`: the unique map; transitivity is trivial.

- `g < dim A/ℓA`: there are no surjections.

- In rank one, two surjections to `ℤ/ℓ²` differ by multiplication by a unit of `ℤ_ℓ`.

<a id="unique-similitude-stable-symplectic-orbit"></a>

**Unique similitude stable symplectic orbit.** Let `ℓ` be odd, `V` a free `ℤ_ℓ`-module of rank `2g` with a perfect alternating pairing, `A` a finite abelian `ℓ`-group and `q ∈ ℤ_ℓ^×` with `q − 1 ∈ ℤ_ℓ^×`. Let `O` be the set of surjections `f : V → A` such that `f ∘ h = f` for some `h ∈ GSp_q(V)`. If `g ≥ dim_{𝔽_ℓ}(A/ℓA)`, then `O` is nonempty and `Sp(V)` acts transitively on `O`.

`Suggested.lean` states `Similitude.unique_similitude_stable_orbit` for an arbitrary finite free `ℤ_ℓ`-module `V` of rank `2g`, with a bilinear form that is alternating and perfect in Mathlib’s sense. The set `Similitude.similitudeFixedSurjections` is `O`; the conclusion gives its nonemptiness and transitivity under the form’s linear isometries. The generator hypothesis is a surjection `ℤ_ℓ^g → A`, equivalent to the displayed bound by Nakayama; all finite abelian `ℓ`-groups occur as finite `ℤ_ℓ`-modules.

*Proof.* Nonempty: write `V = V_+ ⊕ V_−` with Lagrangians ([symplectic normal forms over z l](#symplectic-normal-forms-over-z-l) (iii))`; h := q` on `V_+` and 1 on `V_−` lies in `GSp_q`; any surjection factoring through the projection to `V_−` (exists as rank `V_− = g ≥ dim A/ℓA`) is fixed by `h`. Given `f ∈ O` with `h, ker f` contains a Lagrangian direct summand ([orthogonality and a killed lagrangian](#orthogonality-and-a-killed-lagrangian)). By transitivity on Lagrangians (normal forms (i)) move it to `V_+`, so `f` factors through `V → V_−`. Automorphisms of `V_−` extend to `Sp(V)` (normal forms (v)), reducing to `GL_g(ℤ_ℓ)`-transitivity on surjections `ℤ_ℓ^g → A` ([linear group transitive on lattice surjections](#linear-group-transitive-on-lattice-surjections)).

*Needs:* [primary decomposition for a multiplier q similitude](#primary-decomposition-for-a-multiplier-q-similitude), [orthogonality and a killed lagrangian](#orthogonality-and-a-killed-lagrangian), [symplectic normal forms over z l](#symplectic-normal-forms-over-z-l), [linear group transitive on lattice surjections](#linear-group-transitive-on-lattice-surjections), [symplectic similitude matrix subsets](#symplectic-similitude-group).

([[37]](#ref-37), Lemma 8.9, p.780 (Annals 183).)

**Checks.**

- `A = 0: O = {0}`.

- Without `q−1` invertible the conclusion can fail even in the stated rank range: take `q=1, g=2, V=ℤ_ℓ⁴` with coordinates `(x₁,x₂,y₁,y₂)`, and `A=𝔽_ℓ²`. The surjections `f₀=(x₁,x₂)` and `f₁=(x₁,y₁)` are both fixed by `I`. Their dual images modulo `ℓ` have respectively zero and nondegenerate restricted alternating pairings, so they cannot be `Sp`-conjugate. Here `g=dim(A/ℓA)=2`.

- For `g = 0, A = 0`, the unique zero map belongs to `O` and its orbit is a singleton.

<a id="one-rational-geometric-component"></a>

**One rational geometric component.** Let `ℓ` be odd, `A` a nontrivial finite abelian `ℓ`-group and `q` an odd prime power with `ℓ ∤ q(q − 1)`. For every odd `n` larger than a bound depending only on `A` (`n ≥ 5` and `g = (n − 1)/2 ≥ dim_{𝔽_ℓ}(A/ℓA)`), exactly one geometric connected component of `X_n = Hn^{c_A}_{G_A,n} ⊗ 𝔽̄_q` is fixed by Frobenius.

*Proof.* By [monodromy orbits and rational components](#monodromy-orbits-and-rational-components), Frobenius-fixed components correspond to `Sp(T)`-orbits of surjections `T → A` whose stabilizer meets `GSp_q(T)`. Since `ℓ ∤ q(q − 1), q` and `q − 1` are units of `ℤ_ℓ`; [unique similitude stable symplectic orbit](#unique-similitude-stable-symplectic-orbit) gives exactly one such orbit (nonempty and transitive).

*Needs:* [monodromy orbits and rational components](#monodromy-orbits-and-rational-components), [unique similitude stable symplectic orbit](#unique-similitude-stable-symplectic-orbit).

([[37]](#ref-37), Proof of Theorem 8.8, p.780 (Annals 183).)

**Checks.**

- `q ≡ 1 mod ℓ`: excluded; several orbits may be rational, giving a different limit.

- The bound on `n` depends only on `A`, not on `q`.

### 5.19 Uniform moments and the large-q Cohen–Lenstra theorem

<a id="uniform-function-field-surjection-moment-estimate"></a>

**Uniform function field surjection moment estimate.** Let `ℓ` be an odd prime and `A` a finite abelian `ℓ`-group. There is a constant `B(A)` such that for every odd prime power `q` with `ℓ ∤ q(q − 1)` and `√q > B(A)`, and every odd `n > B(A), | (Σ_{L ∈ S_n} m_A(L))/|S_n| − 1 | ≤ B(A)/√q`, where `m_A(L) = |Sur(Cl(O_L), A)|`. For `A = 0` the left side is 0. Assume the uniform Betti hypothesis (HS) of the supplier contracts.

*Proof.* Let `A ≠ 0` and let `X_n` be the Hurwitz scheme of the generalized-dihedral datum `(G_A, c_A)` over `𝔽_q` (item IG-a). By the [factor two point count identity](#factor-two-point-count-identity) and `|S_n| = 2(q^n − q^{n−1})`, the average equals `(q/(q − 1))·y` with `y = q^{−n}|X_n(𝔽_q)|`, so |average `− 1| ≤ (q/(q − 1))|y − 1| + 1/(q − 1)`. The datum is nonsplitting and centre-free, and `c_A` is a rational class generating `G_A` ([generalized dihedral cover datum](#generalized-dihedral-cover-datum)). Input (HS), with a coefficient prime `λ > max(|G_A|, q, n)`, therefore gives `dim H^i(X_n ⊗ 𝔽̄_q, ℚ_λ) ≤ C^{i+1}` for all `i` and `n`, with `C = C(G_A, c_A) ≥ 1`. `X_n` is smooth of pure dimension `n`, being finite étale over `Conf_n`. For odd `n ≥ 2 dim_{𝔽_ℓ}(A/ℓA) + 1` with `n ≥ 5`, exactly one geometric component is fixed by Frobenius ([one rational geometric component](#one-rational-geometric-component)). So [uniform trace error estimate](#uniform-trace-error-estimate) gives `|y − 1| ≤ C²/(√q − C) ≤ 2C²/√q` once `√q ≥ 2C`. For `q ≥ 4` we have `q/(q − 1) ≤ 4/3` and `1/(q − 1) ≤ 1/√q`, hence |average `− 1| ≤ (3C² + 1)/√q`. Take `B(A) = max(3C² + 1, 2 dim_{𝔽_ℓ}(A/ℓA) + 1, 5)`. Then `√q > B(A)` forces `q ≥ 4` and `√q ≥ 2C`, and `n > B(A)` puts `n` in the range above.

*Needs:* [factor two point count identity](#factor-two-point-count-identity), [ArithmeticStatisticsPartI §0.11][part-11], [uniform trace error estimate](#uniform-trace-error-estimate), [one rational geometric component](#one-rational-geometric-component), [generalized dihedral cover datum](#generalized-dihedral-cover-datum), [empirical l primary class group law](#empirical-l-primary-class-group-law), InverseGaloisAndArithmeticFundamentalGroups Layer IG.5.

([[37]](#ref-37), Theorem 8.8, p.777 (Annals 183); [[37]](#ref-37), Proposition 7.8, p.769 (Annals 183).)

**Checks.**

- `A = ℤ/3, q = 7` (`ℓ = 3` divides `q − 1 = 6`): excluded; the method gives a different (Malle-type) answer there.

- Averages over `⊔_{m ≤ n} S_m` follow from the same bound.

<a id="large-q-cohen-lenstra-theorem"></a>

**Large q cohen lenstra theorem.** Let `ℓ` be an odd prime and `A` a finite abelian `ℓ`-group. As `q → ∞` through odd prime powers with `ℓ ∤ q(q − 1)`, both the upper density `δ^+(q, A)` and the lower density `δ^−(q, A)` — taken over odd `n → ∞` of the proportion of `L ∈ S_n` (imaginary quadratic extensions of `𝔽_q(t)`, ramified at `∞`) with `Cl(O_L)_ℓ ≅ A` — converge to the Cohen–Lenstra mass `μ(A) = ∏_{i≥1}(1 − ℓ^{−i})/|Aut A|`. Precisely: for every `ε > 0` there is `Q` such that `|δ^±(q, A) − μ(A)| ≤ ε` for all such `q > Q`. Through the moment estimate it uses, this theorem is conditional on input (HS).

*Proof.* Fix `A₀` and `ε > 0`. Apply finite moment control ([ArithmeticStatisticsPartIV §3.5][part-20], EVW Proposition 8.3) with the finite set `{A₀}`: it yields `δ > 0` and a finite set `L'` of finite abelian `ℓ`-groups such that any probability measure `ν` with `|⟨Sur(−, A)⟩_ν − 1| ≤ δ` for all `A ∈ L'` satisfies `|ν(A₀) − μ(A₀)| ≤ ε`. The measures `ν_n` ([empirical l primary class group law](#empirical-l-primary-class-group-law)) are probability measures whose `A`-moments are the averages of `m_A` over `S_n`. By [uniform function field surjection moment estimate](#uniform-function-field-surjection-moment-estimate), choose `Q > max_{A ∈ L'} max(1, B(A), B(A)²)` with `B(A)/√Q < δ` for all `A ∈ L'`; then for `q > Q` allowed and odd `n > Q, |ν_n(A₀) − μ(A₀)| ≤ ε`. Hence every limit point of `ν_n(A₀)` along odd `n` lies in `[μ(A₀) − ε, μ(A₀) + ε]`, i.e. `δ^±(q, A₀)` are within `ε` of `μ(A₀)` ([lower and upper degree densities](#lower-and-upper-degree-densities)). The quantifiers are in this order: finitely many moments first, then uniform thresholds in `q` and `n`.

*Needs:* [uniform function field surjection moment estimate](#uniform-function-field-surjection-moment-estimate), [empirical l primary class group law](#empirical-l-primary-class-group-law), [lower and upper degree densities](#lower-and-upper-degree-densities), [ArithmeticStatisticsPartIV §3.5][part-20], [ArithmeticStatisticsPartIV §3.3][part-16].

([[37]](#ref-37), Theorem 1.2, p.730 (Annals 183); [[37]](#ref-37), Deduction after Theorem 8.8, p.777 (Annals 183).)

**Checks.**

- `ℓ = 3, A = 0: δ^±(q, 0) → ∏_{i≥1}(1 − 3^{−i}) ≈ 0.560`, the limiting proportion of class numbers prime to 3.

- The theorem gives bounds at every sufficiently large allowed fixed `q`; equality of the upper and lower degree densities, or an exact Cohen–Lenstra law at that `q`, is not proved by this argument.

- `q ≡ 1 mod ℓ` is excluded; there the method gives a different limiting distribution.

<a id="positive-proportions-of-l-divisible-and-indivisible-class-numbers"></a>

**Positive proportions of l divisible and indivisible class numbers.** Let `ℓ` be an odd prime. There is `Q₀(ℓ)` such that for every odd prime power `q > Q₀(ℓ)` with `ℓ ∤ q(q − 1)`, the lower odd-degree density of the proportion of `L ∈ S_n` with `ℓ ∤ |Cl(O_L)|` is positive, and the lower odd-degree density of the proportion with `ℓ | |Cl(O_L)|` is positive. Quantitatively both lower densities tend to `c_ℓ = ∏_{i≥1}(1 − ℓ^{−i}) > 0` and `1 − c_ℓ > 0` respectively as `q → ∞`. Like the large-`q` theorem, this is conditional on input (HS).

*Proof.* `ℓ ∤ |Cl(O_L)|` iff `Cl(O_L)_ℓ` is trivial, so the first proportion is `ν_n(0)`; the second is `1 − ν_n(0)`. By [large q cohen lenstra theorem](#large-q-cohen-lenstra-theorem) with `A = 0, δ^−(q, 0) → μ(0) = c_ℓ` and `δ^+(q, 0) → c_ℓ`; the lower density of `1 − ν_n(0)` is `1 − δ^+(q, 0)`. `c_ℓ ∈ (0, 1)` for `ℓ` odd (the infinite product converges and each factor lies in (0, 1)); choose `Q₀` with `|δ^±(q, 0) − c_ℓ| < min(c_ℓ, 1 − c_ℓ)/2`.

*Needs:* [large q cohen lenstra theorem](#large-q-cohen-lenstra-theorem), [ArithmeticStatisticsPartIV §3.3][part-16].

([[37]](#ref-37), §1.2 after Theorem 1.2, p.730 (Annals 183).)

**Checks.**

- `ℓ = 3: c₃ ≈ 0.560`, so asymptotically about 56% of class numbers are prime to 3 and 44% are divisible by 3.

- Positive lower proportions hold at each sufficiently large allowed fixed `q`. No exact fixed-`q` Cohen–Lenstra law or assertion for every `q` is claimed.

### 5.20 Good nonabelian function-field moments

<a id="eventual-degree-large-q-limit"></a>

**Eventual degree large q limit.** For `m ≥ 1` let `A_m` be the filter on `N` of prime powers `q` coprime to `m`, tending to infinity. For a function `E(q, n)` of a prime power `q` and a degree `n`, and a target `c(n)`, say `E` has eventual-degree large-`q` limit `c` if there is `n₀` such that for every fixed `n ≥ n₀, E(q, n) → c(n)` as `q → ∞` along `A_m`. Wood (2019) uses this mode. EVW’s final distribution theorem instead takes upper/lower degree densities first and then `q→∞`; these are distinct convergence modes; it is not the fixed-`q`, large-degree limit of the direct function-field analogue of the number-field conjectures, and the two limits may not be interchanged without a new uniform estimate.

Construct the allowed-prime-power filter and the eventual-degree limit predicate. Prove that the filter is proper for `m ≠ 0` and bottom for `m = 0`, that two limiting targets agree in all sufficiently large degrees when `m ≠ 0`, and that divisibility `m ∣ m′` refines the allowed filter and preserves the limit. Numerical `m ≤ m′` alone is insufficient.

*Proof.* Define `A_m := atTop ⊓ principal{q : q a prime power, gcd(q, m) = 1}`; it is a proper filter (infinitely many primes are coprime to `m`). Define the predicate `∃ n₀, ∀ n ≥ n₀`, Tendsto `(q ↦ E(q, n)) A_m` (nhds `c(n)`). Limits are unique along the proper filter `A_m`, so `c(n)` is determined for `n ≥ n₀`.

*Needs:* `Filter.Tendsto` (Mathlib), `Filter.atTop` (Mathlib), `tendsto_nhds_unique` (Mathlib).

([[50]](#ref-50), §1 after Theorem 1.2, p.3 (arXiv v2; Duke 168, p.380).)

**Checks.**

- `E(q, n) = c(n)` has eventual-degree large-`q` limit `c`.

- For `E(q, n) = n/(n + q)` the eventual-degree large-`q` limit is 0, although for every fixed `q ≥ 1, E(q, n) → 1` as `n → ∞`.

- The set of prime powers coprime to `m` belongs to `A_m`, and `A_m ≤` atTop (every cofinite set of integers belongs to `A_m`).

- `{q | Odd q} ∈ allowedPrimePowers 2`: coprimality to 2 forces oddness.

- `{q | Odd q} ∉ allowedPrimePowers 3`: the unbounded powers `2^k`, `k ≥ 1`, are allowed and even.

- `{q | IsSquare q} ∉ allowedPrimePowers 1`: arbitrarily large primes are allowed and are not squares.

- `A₀=⊥` because no prime power is coprime to zero. Consequently every function converges to every target along `A₀`; uniqueness and `liminf` consequences must require `m≠0`.

<a id="imaginary-per-component-unit-moment"></a>

**Imaginary per component unit moment.** Let `G` be a finite group, `G′ ≤ G ≀ S₂` admissible, good and centre-free, `c` the set of order-2 elements of `G′` outside `ker(G′ → S₂)`. For each prime power `q` coprime to `|G′|` choose a Frobenius-fixed component invariant `f_q` with `f_q(u_q) = (x, 2n − 1), x ↦ (1, 1, σ)` in `G′`. Then for `n` sufficiently large, the number of pairs `(K, ρ)` with `K ∈ IQ_{=q^{2n}}` and `ρ ∈ Sur(G_K^{un,∞}, G)` of type `G′` and component invariant `f_q`, divided by `#IQ_{=q^{2n}}`, tends to 1 as `q → ∞` with `(q, |G′|) = 1`. The invariant `f_q` may vary with `q; n` is fixed before `q → ∞`; it is a rigid average (no `|Aut_{G′}(G)|` factor).

Here `G′` is good when `c` is a single `G′`-conjugacy class, and `q` is odd because `|G′|` is even.

*Proof.* Proposition 4.4 (InverseGaloisAndArithmeticFundamentalGroups §IG.4.6, *Marked extensions and their infinity types*, with Part I's [ArithmeticStatisticsPartI §0.19][part-14]): pairs `(K, ρ)` of the given type correspond to marked `(G′, c)`-extensions of `𝔽_q(t)` of imaginary infinity type, with `Disc M = Disc K^{|G′|/2}`, so discriminant norm `q^{2n} ⇔ Σ n_i = 2n − 1`. Theorem 4.5(2)–(3) (item IG-b): these marked extensions are the `𝔽_q`-points of `CHur^{c,(1,1,σ)}_{G′,2n−1}`, and for `n ≥ N₀` the points with component invariant `f_q` are those of one Frobenius-fixed geometric component `C`. Theorem 4.7 (§IG.5.5, *Fixed-degree uniform Hurwitz point estimate*)`: |#C(𝔽_q) − q^{2n−1}| ≤ K_{2n−1} q^{2n−3/2}` uniformly in `q`. `#IQ_{=q^{2n}} = q^{2n−1} − q^{2n−2}` ([ArithmeticStatisticsPartI §0.20][part-12]); the ratio is `1 + O_n(q^{−1/2})`.

*Needs:* [ArithmeticStatisticsPartI §0.20][part-12], [eventual degree large q limit](#eventual-degree-large-q-limit), InverseGaloisAndArithmeticFundamentalGroups Layer IG.4, InverseGaloisAndArithmeticFundamentalGroups Layer IG.5, [ArithmeticStatisticsPartI §0.21][part-13], [ArithmeticStatisticsPartI §0.19][part-14].

([[50]](#ref-50), Theorem 4.8, p.22 (arXiv v2; Duke 168, p.406); [[50]](#ref-50), Proof of Theorem 4.8, p.24 (arXiv v2; Duke 168, p.408).)

**Checks.**

- `G = C₃, G′ = C₃ ⋊ C₂` (the dihedral case): recovers the unit 3-moment of the imaginary Cohen–Lenstra heuristic in this mode.

- The limit is in the mode of [eventual degree large q limit](#eventual-degree-large-q-limit).

<a id="real-per-component-unit-moment"></a>

**Real per component unit moment.** With `G, G′, c` as in [imaginary per component unit moment](#imaginary-per-component-unit-moment), for each `q` coprime to `|G′|` let `f_q` be a Frobenius-fixed component invariant with `f_q(u_q) = (x, 2n), x ↦ 1` in `G′`. For `n` sufficiently large, the number of pairs `(ρ, y)` — `ρ ∈ Sur(G_K^{un,∞}, G), y` a twist for `ρ, (ρ, y)` of type `G′` with component invariant `f_q` — summed over `K ∈ RQ_{=q^{2n}}` and divided by `#RQ_{=q^{2n}}`, tends to 1 as `q → ∞` with `(q, |G′|) = 1`.

*Proof.* Theorem 4.5(2)–(3) (item IG-b) and Theorem 4.7 (§IG.5.5) for `CHur^{c,1}_{G′,2n}`: one Frobenius-fixed component with `q^{2n} + O_n(q^{2n−1/2})` points. `#RQ_{=q^{2n}} = q^{2n} − q^{2n−1}` ([ArithmeticStatisticsPartI §0.20][part-15]).

*Needs:* [ArithmeticStatisticsPartI §0.20][part-15], [eventual degree large q limit](#eventual-degree-large-q-limit), InverseGaloisAndArithmeticFundamentalGroups Layer IG.4, InverseGaloisAndArithmeticFundamentalGroups Layer IG.5, [ArithmeticStatisticsPartI §0.21][part-13], [ArithmeticStatisticsPartI §0.19][part-14].

([[50]](#ref-50), Proof of Theorem 4.8, real case, p.25 (arXiv v2; Duke 168, p.409).)

**Checks.**

- This is the rigid pair count; dividing by `|c|·|Aut_{G′}(G)|` (the conversion of the [ArithmeticStatisticsPartV §3.27][part-21]) gives `E^+`.

- The discriminant counts only finite ramification in the real exact slice.

<a id="imaginary-normalized-nonabelian-moment"></a>

**Imaginary normalized nonabelian moment.** Let `G` be finite and `G′ ≤ G ≀ S₂` admissible, good and centre-free, `c` its outside involutions. For `n` sufficiently large, `E⁻_{𝔽_q(t), q^{2n}}(G, G′)/|H₂(G′, c)[q − 1]| → 1/|Aut_{G′}(G)|` as `q → ∞` with `(q, |G′|) = 1`, where `E⁻` is the average number of unramified `G`-extensions `L/K` split at `∞` with `Gal(L̃/𝔽_q(t))` of type `G′`, over `K ∈ IQ_{=q^{2n}}`, and `H₂(G′, c)` is the reduced Schur multiplier. The torsion count `|H₂(G′, c)[q − 1]|` varies with `q` and is divided out inside the limit.

*Proof.* The Frobenius-fixed component invariants of the imaginary slice number exactly `|H₂(G′, c)[q − 1]|` (Wood Theorem 4.5(3) with Proposition 4.1: item IG-b, built on the reduced multipliers and lifting invariants of §§IG.3.4–IG.3.6). Sum [imaginary per component unit moment](#imaginary-per-component-unit-moment) over them: along `q` with `|H₂(G′, c)[q − 1]| = d` fixed, `Ẽ⁻ → d`; since `d` takes finitely many values the normalised ratio `Ẽ⁻/|H₂(G′, c)[q − 1]| → 1` along all allowed `q`. Use the component-uniform constant `K_{2n−1}` of Theorem 4.7, so summing over invariants that vary with `q` preserves a uniform `O_n(q⁻¹ᐟ²)` estimate. Convert rigid to unrigid: `E⁻ = Ẽ⁻/|Aut_{G′}(G)|` ([ArithmeticStatisticsPartV §3.27][part-21]).

*Needs:* [imaginary per component unit moment](#imaginary-per-component-unit-moment), [eventual degree large q limit](#eventual-degree-large-q-limit), [ArithmeticStatisticsPartV §3.27][part-21], InverseGaloisAndArithmeticFundamentalGroups Layer IG.5, [ArithmeticStatisticsPartV: embedded types and signature representations][part-22].

([[50]](#ref-50), Theorem 1.2, p.2 (arXiv v2; Duke 168, p.379); [[50]](#ref-50), Proof of Theorem 1.2, p.23 (arXiv v2; Duke 168, p.407); [[50]](#ref-50), §8.2, table p.34 (arXiv v2).)

**Checks.**

- For nontrivial odd abelian `G`, the generalised dihedral `G′` is good, but its reduced multiplier need not be trivial. Wood §8.2 lists `G=C₃²` with `H₂(G′,c)=C₃`: the normaliser is 3 for `q≡1 mod 3` and 1 for `q≡2 mod 3`. The raw Cohen–Lenstra unit surjection moment follows when `gcd(q−1,|G|)=1`; the displayed normalised theorem includes the roots-of-unity correction.

- Not the fixed-`q` large-discriminant statement ([eventual degree large q limit](#eventual-degree-large-q-limit)).

<a id="real-normalized-nonabelian-moment"></a>

**Real normalized nonabelian moment.** With `G, G′, c` as in [imaginary normalized nonabelian moment](#imaginary-normalized-nonabelian-moment) (`G′` good), for `n` sufficiently large, `E⁺_{𝔽_q(t), q^{2n}}(G, G′)/|H₂(G′, c)[q − 1]| → 1/(|c|·|Aut_{G′}(G)|)` as `q → ∞` with `(q, |G′|) = 1`.

*Proof.* Sum [real per component unit moment](#real-per-component-unit-moment) over the `|H₂(G′, c)[q − 1]|` Frobenius-fixed invariants of the real slice (Proposition 4.1 and item IG-b). Convert rigid to unrigid with the good real multiplicity `A(G, G′) = |c|·|Aut_{G′}(G)|` (Wood Lemma 2.1; [ArithmeticStatisticsPartV §3.27][part-21]).

*Needs:* [real per component unit moment](#real-per-component-unit-moment), [eventual degree large q limit](#eventual-degree-large-q-limit), [ArithmeticStatisticsPartV §3.27][part-21], InverseGaloisAndArithmeticFundamentalGroups Layer IG.5, [ArithmeticStatisticsPartV: embedded types and signature representations][part-22].

([[50]](#ref-50), Theorem 1.2, p.2 (arXiv v2; Duke 168, p.379).)

**Checks.**

- For nontrivial odd abelian `G, |c|=|G|` and the normalised value is `1/(|G|·|Aut G|)`. The raw real Cohen–Lenstra moment requires trivial `(q−1)`-torsion in the reduced multiplier, for example `gcd(q−1,|G|)=1`.

- For bad `G′` the multiplicity `A(G, G′)` is not `|c||Aut_{G′}(G)|`.

### 5.21 Bad types and whole component profiles

<a id="stable-parity-multidegree-count"></a>

**Stable parity multidegree count.** Let `N ≥ 1, N₀ ≥ 0, d ≥ 0` and `ε ∈ {0, 1}^N`. Let `a_i` be the least integer `≥ N₀` with `a_i ≡ ε_i (mod 2)`. The number of `m ∈ ℤ_{≥0}^N` with `m_i ≥ N₀, m_i ≡ ε_i (mod 2)` and `Σ m_i = d` is the binomial coefficient `C(L + N − 1, N − 1)` if `L := (d − Σ a_i)/2` is a nonnegative integer, and 0 otherwise.

Define `leastWithParity N₀ e : ℕ` as `N₀` when `N₀ mod 2 = e mod 2` and `N₀ + 1` otherwise; prove its lower bound, parity and minimality, and invariance under replacing `e` by `e mod 2`. Its Checks are `leastWithParity 2 0 = 2`, `leastWithParity 2 1 = 3` and `leastWithParity 0 3 = 1`.

Construct the finite set of parity-constrained multidegrees using `Finset.Nat.antidiagonalTuple` and prove the displayed stars-and-bars formula.

*Proof.* The map `m_i = a_i + 2z_i` is a bijection between such `m` and `z ∈ ℤ_{≥0}^N` with `Σ z_i = L`. Weak compositions of `L` into `N` parts number `C(L + N − 1, N − 1)` (Mathlib Nat.choose and the stars-and-bars count); when `d − Σ a_i` is odd or negative the set is empty.

*Needs:* `Nat.choose` (Mathlib).

([[50]](#ref-50), Proof of Theorem 4.8, bad case, p.24 (arXiv v2; Duke 168, p.409).)

**Checks.**

- `N = 1`: the count is 1 if `d ≥ N₀` and `d ≡ ε₁ (mod 2)`, else 0.

- `N = 2, N₀ = 0, ε = (0, 0), d = 4: L = 2`, count `C(3, 1) = 3 ({(0,4), (2,2), (4,0)})`.

- If `d` and `Σ ε_i` have different parity, the count is zero regardless of the threshold.

<a id="many-large-parity-vectors"></a>

**Many large parity vectors.** For `N ≥ 2, N₀ ≥ 0` and `ε ∈ {0,1}^N` there is `v > 0` (depending only on `N, N₀`) such that for all sufficiently large `d` with `d ≡ Σ ε_i (mod 2)`, the number of `m ∈ ℤ^N` with `m_i ≥ N₀, m_i ≡ ε_i (mod 2)` and `Σ m_i = d` is at least `v·d^{N−1}`.

The positive real lower-bound constant and degree threshold must be uniform over all parity vectors.

*Proof.* By [stable parity multidegree count](#stable-parity-multidegree-count) the number is `C(L + N − 1, N − 1)` with `L = (d − Σ a_i)/2 ≥ d/2 − N(N₀ + 1)`. `C(L + N − 1, N − 1) ≥ L^{N−1}/(N − 1)!`, which is `≥ v d^{N−1}` for `d` large.

*Needs:* [stable parity multidegree count](#stable-parity-multidegree-count), `Nat.choose` (Mathlib).

([[50]](#ref-50), Proof of Theorem 4.8, bad case, p.24 (arXiv v2; Duke 168, p.409).)

**Checks.**

- `N = 2`: the count grows linearly in `d`.

- The constant does not depend on `q`.

- Incompatible total parity gives zero vectors for arbitrarily large degrees, so the parity restriction is essential.

<a id="bad-type-lower-bound"></a>

**Bad type lower bound.** Let `G′ ≤ G ≀ S₂` be admissible and centre-free but not good, with `N_{G′} ≥ 2` classes of outside involutions. There is `w > 0` depending only on `G, G′` such that for `n` sufficiently large, `liminf_{q→∞, (q,|G′|)=1} Ẽ^±_{𝔽_q(t), q^{2n}}(G, G′)/|H₂(G′, c)[q − 1]| ≥ w·n^{N_{G′}−1}`. The printed statement asserts a limit; only this `liminf` bound is proved.

*Proof.* Keep only multidegrees `m` with `Σ m_i = 2n − 1` (imaginary; `2n` real), every `m_i ≥ N₀` and the parities of Wood Proposition 4.1 (`m₁` odd, others even, imaginary; all even, real): at least `v n^{N−1}` of them ([many large parity vectors](#many-large-parity-vectors)). For each such `m` the Frobenius-fixed components number exactly `|H₂(G′, c)[q − 1]|` (Theorem 4.5(3) and Proposition 4.1: item IG-b), each with `q^{Σ m_i} + O_n(q^{Σ m_i − 1/2})` points (Theorem 4.7, §IG.5.5). All other components contribute nonnegatively; divide by `#IQ_{=q^{2n}}` (or #RQ) and `|H₂(G′, c)[q − 1]|`, then take `liminf` in `q`.

*Needs:* [many large parity vectors](#many-large-parity-vectors), [ArithmeticStatisticsPartI §0.20][part-12], [ArithmeticStatisticsPartI §0.20][part-15], [eventual degree large q limit](#eventual-degree-large-q-limit), InverseGaloisAndArithmeticFundamentalGroups Layer IG.4, InverseGaloisAndArithmeticFundamentalGroups Layer IG.5, [ArithmeticStatisticsPartI §0.21][part-13], [ArithmeticStatisticsPartI §0.19][part-14], [ArithmeticStatisticsPartV: embedded types and signature representations][part-22].

([[50]](#ref-50), Proof of Theorem 4.8, bad case, p.24–25 (arXiv v2; Duke 168, p.409).)

**Checks.**

- `N_{G′} = 1` (good) is excluded; there the limit exists ([imaginary normalized nonabelian moment](#imaginary-normalized-nonabelian-moment)).

- No upper bound and no existence of the limit is claimed ([printed bad type ordinary limit assertion](#printed-bad-type-ordinary-limit-assertion)).

<a id="real-rigidification-bound"></a>

**Real rigidification bound.** Let `G` be finite and `F ≤ G ≀ S₂` an admissible embedded type, with outside involutions `c(F)`. For a real quadratic base `K` and an unramified `G`-extension `L/K` split at infinity of unrigid type `F` (some identification and twist induce `F`, with diagonal-`Aut(G)` changes of identification allowed), count the pairs `(ρ,y)` consisting of an identification `ρ : Gal(L/K) ≅ G` and an outside involution of the normal closure which induce exactly `F`. This nonempty fibre has size at most `M(G,F) := |Aut(G)|·|c(F)|`, independent of `K` and `L`. Consequently the real rigid and unrigid averages on the same finite slice satisfy `Ẽ⁺(G,F) ≤ M(G,F) E⁺(G,F)`. Require the corresponding finite-total identity as a sum of fibre sizes before taking averages. For good `F`, retain the exact fibre size `|c(F)|·|Aut_F(G)|` supplied by Part V.

*Proof.* There are `|Aut(G)|` identifications of `Gal(L/K)` with `G`. The outside involutions of the normal closure number `|c(F)|`, since one realization identifies that group, with its quadratic quotient, with `F`. Selecting only pairs inducing the fixed embedded `F` can only decrease their product. A realization exists by the definition of the unrigid type. Admissibility gives `|c(F)| ≥ 1`, hence `M(G,F) > 0`. This argument does not require a constant exact fibre size for bad types.

*Needs:* [ArithmeticStatisticsPartV §3.27][part-21], [ArithmeticStatisticsPartV: embedded types and signature representations][part-22], [ArithmeticStatisticsPartI §0.21][part-13].

([[50]](#ref-50), §2.1.2 and Lemma 2.1, p.7 (arXiv v2; Duke 168, pp.385–386).)

**Checks.**

- For `G = 1, F = C₂`, there is one identification and one twist; the fibre and `M` both equal one.

- For `G = C₃, F = S₃`, there are two identifications and three outside involutions; the exact good fibre and `M` both equal six.

- For `G = C₂` with inverse-graph type `F = C₂²`, there is one identification and two outside involutions; both give the same embedded diagonal type, so the fibre and `M` both equal two, although the type is bad.

<a id="bad-type-normalization-transfer"></a>

**Bad type normalization transfer.** In [bad type lower bound](#bad-type-lower-bound), the same `liminf` lower bound (with a smaller positive constant) holds for the unrigid averages `E^±_{𝔽_q(t), q^{2n}}(G, G′)/|H₂(G′, c)[q − 1]|`: use `E⁻ = Ẽ⁻/|Aut_{G′}(G)|` and `E⁺ ≥ Ẽ⁺/M(G,G′)` from the real rigidification bound. No exact bad-type real multiplicity is needed.

*Proof.* Part V supplies the positive imaginary multiplicity `|Aut_{G′}(G)|`. The [real rigidification bound](#real-rigidification-bound) supplies `0 < M(G,G′)` and the pointwise real inequality. Divide by these constants and the positive reduced-multiplier normalizer, and apply the `liminf` bound.

*Needs:* [bad type lower bound](#bad-type-lower-bound), [real rigidification bound](#real-rigidification-bound), [ArithmeticStatisticsPartV §3.27][part-21].

([[50]](#ref-50), Theorem 1.2, p.2 (arXiv v2; Duke 168, p.379).)

**Checks.**

- For bad `G′` the good-only formula `A = |c||Aut_{G′}(G)|` is not used.

- This does not prove existence of a limit.

- The bad inverse-graph type of `C₂` has real rigidification bound two, but lies outside the centre-free hypothesis of the Hurwitz lower-bound theorem.

<a id="printed-bad-type-ordinary-limit-assertion"></a>

**Printed bad type ordinary limit assertion.** Formulate the following conjectural proposition. For `G′` admissible, centre-free and bad, with `N = N_{G′}`, the proposition `PBL(G, G′)`: there are `w > 0` and `n₀` such that for every `n ≥ n₀` the limit `L_n := lim_{q→∞, (q,|G′|)=1} Ẽ^±_{𝔽_q(t), q^{2n}}(G, G′)/|H₂(G′, c)[q − 1]|` exists and `L_n ≥ w·n^{N−1}`. This is a separately defined conjectural proposition. The unconditional conclusion here is the `liminf` estimate; the ordinary-limit existence clause is equivalent to eventual constancy in `q` of the whole component profile, including its boundary contribution.

The limit in `q` is taken along the allowed prime powers, in the mode of [eventual degree large q limit](#eventual-degree-large-q-limit).

The required API is:

- `PrintedBadTypeLimitAssertion`: The proposition `∃ w > 0, ∃ n₀, ∀ n ≥ n₀, ∃ L, E(·, n)/M → L` along `A_m` and `w n^{N−1} ≤ L`.

- `PrintedBadTypeLimitAssertion.liminf_bound`: PBL implies the eventual `liminf` bound `liminf_q E(q, n)/M(q) ≥ w n^{N−1}`.

- `PrintedBadTypeLimitAssertion.of_eventually_const`: If, for all large `n, E(q, n)/M(q)` is eventually constant in `q` with value `≥ w n^{N−1}`, then PBL holds.

*Proof.* Define PBL for an arbitrary function `E(q, n)` with normaliser `M(q) ≥ 1` and exponent `N`: `∃ w > 0, ∃ n₀, ∀ n ≥ n₀, ∃ L, (E(·, n)/M → L along A_{|G′|}) ∧ w n^{N−1} ≤ L`; specialise `E = Ẽ^±, M(q) = |H₂(G′, c)[q − 1]|`. PBL implies the `liminf` bound; the converse fails for oscillating functions.

*Needs:* [eventual degree large q limit](#eventual-degree-large-q-limit), [ArithmeticStatisticsPartI §0.21][part-13], [ArithmeticStatisticsPartI §0.19][part-14].

([[50]](#ref-50), Theorem 4.8, bad case, p.23 (arXiv v2; Duke 168, p.406); [[50]](#ref-50), Proof of Theorem 4.8, p.24 (arXiv v2; Duke 168, p.409).)

**Checks.**

- For `E(q, n) = n^{N−1}` and `M ≡ 1`, PBL holds with `w = 1`.

- For `E ≡ 0` and `N = 1`, PBL fails `(w > 0)`.

- For `E(q, n) = n^{N−1}·c(q)` with `c(q) = 3` if `q ≡ 1 (mod 4)` and `c(q) = 1` otherwise, and `M ≡ 1`, the `liminf` bound holds with `w = 1` but PBL fails (both residues occur for infinitely many allowed prime powers, so there is no limit in `q`).

- The `liminf` lower bound does not entail existence of an ordinary limit.

- A stable-range component formula alone does not control the complete profile: include all boundary components in the eventual-constancy test.

<a id="whole-fixed-degree-component-profile"></a>

**Whole fixed degree component profile.** Fix a centre-free admissible `F = G′` with outside involution classes `c₁, …, c_N,` a sign ± and `n ≥ 2`; put `d = 2n − 1` and `g = (1, 1, σ)` in the imaginary case, `d = 2n` and `g = 1` in the real case. For `q` coprime to `|F|` let `C_n^±(q)` be the total number of Frobenius-fixed geometric components of `⊔_m CHur^{c,g}_{F,m}` over all multidegrees `m ∈ ℤ_{≥0}^N` with `Σ m_i = d`, and `M(q) := |H₂(F, c)[q − 1]| ≥ 1`. The profile is `P_n^±(q) := C_n^±(q)/M(q) ∈ ℚ_{≥0}`. It includes every multidegree, not only the stable range `m_i ≥ N₀`. In the component-count interface the geometric counts are carried as data: a function `m ↦ C_m(q)` and the normaliser `M`.

The required API is:

- `FixedDegreeComponentData`: Data (`N, d`, counts `C_m(q)` for `m` of total degree `d`, normaliser `M(q) ≥ 1`) abstracting the Hurwitz component counts.

- `FixedDegreeComponentData.profile`: `P(q) := (Σ_{Σ m_i = d} C_m(q))/M(q) ∈ Q`.

- `FixedDegreeComponentData.profile_nonneg`: `P(q) ≥ 0`.

- `FixedDegreeComponentData.profile_mem_finite`: If `Σ_m C_m(q) ≤ B` and `M(q) ≤ K` for all `q`, then `P` takes values in the finite set `{a/b : 0 ≤ a ≤ B, 1 ≤ b ≤ K}`.

*Proof.* The set of multidegrees of total degree `d` is finite (the antidiagonal tuples). Geometric components are open and closed (the schemes are smooth and finite étale over `Conf_d`: §IG.5.3), and Frobenius permutes them; `C_m(q)` counts the fixed ones. `P_n^±(q) := (Σ_m C_m(q))/M(q)`.

*Needs:* InverseGaloisAndArithmeticFundamentalGroups Layer IG.5, `Nat.choose` (Mathlib).

([[50]](#ref-50), Theorem 4.5(3), p.21 (arXiv v2; Duke 168, p.404).)

**Checks.**

- If every count `C_m(q)` is 0 then the profile is 0.

- For `N = 1, d = 3, C_{(3)}(q) = 2` and `M(q) = 1`, the profile is 2.

- For `N = 2, d = 2, N₀ = 1` and counts `C_{(2,0)} = 1, C_{(1,1)} = 0, C_{(0,2)} = 0, M = 1`, the profile is 1 although the stable-range sum (all `m_i ≥ 1`) is 0.

- `N = 1:` a single multidegree `(d)`.

<a id="boundary-component-remainder"></a>

**Boundary component remainder.** In [whole fixed degree component profile](#whole-fixed-degree-component-profile) fix the stable threshold `N₀` of Wood Theorem 4.5(3). Split the multidegrees of total degree `d` into the stable ones (every `m_i ≥ N₀`) and the boundary ones (some `m_i < N₀`), and `C_n(q) = C_{stable,n}(q) + C_{boundary,n}(q)` accordingly. The boundary remainder is `R_{boundary,n}(q) := C_{boundary,n}(q)/M(q) ≥ 0`. No formula for it is assumed: the stable lifting-invariant classification does not describe braid components in the boundary.

The required API is:

- `stableMultidegrees`: The multidegrees `m` with `Σ m_i = d` and every `m_i ≥ N₀`.

- `FixedDegreeComponentData.stableCount`: `C_stable(q) = Σ` over stable multidegrees.

- `FixedDegreeComponentData.boundaryRemainder`: `R_boundary(q) = (Σ over non-stable multidegrees)/M(q)`.

- `FixedDegreeComponentData.profile_eq_stable_add_boundary`: `P(q) = C_stable(q)/M(q) + R_boundary(q)`.

- `FixedDegreeComponentData.boundaryRemainder_nonneg`: `R_boundary(q) ≥ 0`.

*Proof.* The stable and boundary sets partition the finite set of multidegrees of total degree `d`. Sum the counts over each part; divide by `M(q)`.

*Needs:* [whole fixed degree component profile](#whole-fixed-degree-component-profile).

([[50]](#ref-50), Proof of Theorem 4.8, bad case, p.24 (arXiv v2; Duke 168, p.409).)

**Checks.**

- With `N₀ = 0` the boundary remainder is 0 for every `q`.

- For `N = 2, d = 2, N₀ = 1`, take `C_(2,0) = 2, C_(1,1) = 5, C_(0,2) = 0` and `M = 2`. Then `stableCount = 5`, `boundaryRemainder = 1` and `profile = 7/2`.

- With the same counts and `M = 1`, `boundaryRemainder = 2`: the normaliser divides the boundary count as well as the stable count.

- For `N = 2, d = 2, N₀ = 1`, take `C_(2,0) = C_(0,2) = 0, C_(1,1) = 5` and `M = 2`. Then `boundaryRemainder = 0` and `profile = 5/2`.

- For `N = 2, d = 4, N₀ = 1` the stable multidegrees are `(1,3), (2,2), (3,1)`: three of them.

- `(0, 4)` is a multidegree of total degree 4 but not a stable one for `N₀ = 1`.

- The remainder is nonnegative, which is all the bad-type argument uses.

<a id="complete-stable-range-component-sum"></a>

**Complete stable range component sum.** Let `F = G′, c = ⊔_{i ≤ N} c_i` its outside involution classes, `A = H₂(F, c), g ∈ c ∪ {1}, q` odd coprime to `|F|` and `N₀` a stable threshold. Choose representatives `c_i` and lifts `ĉ_i` in the reduced Schur cover, and a lift `ĝ` of `g`, taking `ĝ = 1` when `g = 1`. For `ε ∈ {0,1}^N` put `b(g, ε) := ĝ² ∏_i ĉ_i^(−2ε_i) ∈ A`; the squared lifts are central because `g` and the `c_i` have order dividing two. A parity vector survives exactly when `Σ_i ε_i[c_i] = [g]` in `F^ab` and `b(g, ε)^((q − 1)/2) ∈ A^(q − 1)`, where `A^(q − 1) = {a^(q − 1) : a ∈ A}`. These conditions define `S ⊆ {0,1}^N`, with the infinity conventions of Part I's [ArithmeticStatisticsPartI §0.19][part-14]. Define `Σ_stable(d) := Σ_{ε ∈ S} #{m : m_i ≥ N₀, m_i ≡ ε_i (mod 2), Σ m_i = d}`. Then `C_{stable,d}^g(q)/|A[q − 1]| = Σ_stable(d)`: each surviving parity class of stable multidegrees contributes exactly `|A[q − 1]|` Frobenius-fixed components per multidegree, the others none. The boundary remainder is not included.

The required API is:

- `parityMultidegreeCount`: `#{m ∈ N^N : m_i ≥ N₀, m_i ≡ ε_i mod 2, Σ m_i = d}`.

- `stableRangeComponentSum`: `Σ_stable(d) = Σ_{ε ∈ S} parityMultidegreeCount N N₀ d ε`.

- `stableRangeComponentSum_empty`: `Σ_stable = 0` for `S = ∅`.

- `stableRangeComponentSum_union`: Additivity over disjoint unions of parity sets.

- `parityMultidegreeCount_eq`: The stars-and-bars formula of [stable parity multidegree count](#stable-parity-multidegree-count).

*Proof.* Define the parity-class count ([stable parity multidegree count](#stable-parity-multidegree-count)) and sum it over `S`. For each stable `m`, the Frobenius-fixed components are the `q^{−1}`-fixed lifting invariants over `(g, m)` (Theorem 4.5(3): item IG-b); their number is `|A[q − 1]|` if the parity vector of `m` survives and 0 otherwise (item IG-b; for the unramified-`∞` marking this is the *General rational-class fixed-fiber formula* of §IG.5.6). Explicitly, write the lift over `g` as `ĝh`, `h ∈ A`. Wood's equation (6) makes fixedness equivalent to `h^(1 − q) = (ĝ² ∏_i ĉ_i^(−2m_i))^((q − 1)/2)`. A solution exists precisely when the right side is a `(q − 1)`-th power in `A`, and each nonempty solution set is a torsor under `A[q − 1]`. Replacing `m_i` by `ε_i + 2k_i` changes that right side by `∏_i (ĉ_i²)^(−k_i(q − 1))`, a `(q − 1)`-th power. Changing any lift similarly multiplies it by a `(q − 1)`-th power; conjugating a class representative leaves its squared lift unchanged by centrality. Thus survival is independent of these choices and depends only on `m mod 2`, so the stable count is `|A[q − 1]|` times `Σ_stable(d)`.

*Needs:* [stable parity multidegree count](#stable-parity-multidegree-count), [boundary component remainder](#boundary-component-remainder), InverseGaloisAndArithmeticFundamentalGroups Layer IG.5, [ArithmeticStatisticsPartV: embedded types and signature representations][part-22].

([[50]](#ref-50), Proposition 4.1, equation (6) and Remark 4.2, pp.18–19 (arXiv v2; Duke 168, pp.400–401).)

**Checks.**

- For the central condition alone, `A = C₂, b = 1` survives for every odd `q`.

- For `A = C₂` and nontrivial `b`, the central condition holds exactly when `q ≡ 1 (mod 4)`.

- For `A = C₄` and `b` a generator, the central condition holds exactly when `q ≡ 1 (mod 8)`. These three controls test the power equation in `A`; the abelianisation condition is a separate requirement.

- `stableRangeComponentSum N N₀ d ∅ = 0`.

- For `N = 1, N₀ = 0, d = 4` and `S = {0}`: the sum is 1.

- For `N = 1, N₀ = 0, d = 4` and `S = {1}`: the sum is 0 (an odd part cannot have even total).

<a id="moment-minus-component-profile-vanishes"></a>

**Moment minus component profile vanishes.** In [whole fixed degree component profile](#whole-fixed-degree-component-profile), let `B_n` bound the total number of geometric components (uniformly in `q`) and `K_d` be the uniform component error of Wood Theorem 4.7. Then `|Ẽ_n^±(q)/M(q) − P_n^±(q)| ≤ B_n(K_d q^{−1/2} + q^{−1})/(1 − q^{−1})`; in particular the difference is `O_n(q^{−1/2})`. One may take `B_n = D_d`, the degree of the finite étale map `CHur_{F,d} → Conf_d`.

*Proof.* A rational point lies on a Frobenius-fixed component; non-fixed open and closed components contribute no `𝔽_q`-points. Each fixed component `C` has `|#C(𝔽_q) − q^d| ≤ K_d q^{d−1/2}` (Theorem 4.7, §IG.5.5); the rigid moment numerator is `Σ_C #C(𝔽_q)` (Proposition 4.4, §IG.4.6). The denominator is `q^d(1 − q^{−1})` ([ArithmeticStatisticsPartI §0.20][part-12], [ArithmeticStatisticsPartI §0.20][part-15]); divide by it and by `M(q) ≥ 1`, using `C_n(q) ≤ B_n`. `B_n = D_d` is `q`-independent because the degree of `CHur_{F,d} → Conf_d` is constant over the connected base (§IG.5.3, *Component bound from finite étale degree*).

*Needs:* [whole fixed degree component profile](#whole-fixed-degree-component-profile), [ArithmeticStatisticsPartI §0.20][part-12], [ArithmeticStatisticsPartI §0.20][part-15], InverseGaloisAndArithmeticFundamentalGroups Layer IG.4, InverseGaloisAndArithmeticFundamentalGroups Layer IG.5.

([[50]](#ref-50), Theorem 4.7, p.21 (arXiv v2; Duke 168, p.404–405).)

**Checks.**

- If no component is fixed, the moment is `O_n(q^{−1/2})`.

- The bound is uniform in `q` at fixed `n` only.

<a id="ordinary-limit-iff-eventual-profile-constancy"></a>

**Ordinary limit iff eventual profile constancy.** Under [moment minus component profile vanishes](#moment-minus-component-profile-vanishes) (with `M(q) ≤ K` uniformly, as `M(q)` divides `|H₂(F, c)|`), the limit of `Ẽ_n^±(q)/M(q)` as `q → ∞` along allowed prime powers exists iff `P_n^±(q)` is eventually equal to a single rational value, and then that value is the limit. This is a criterion, not a proof that every bad type satisfies it.

Formulate the criterion for a finite-range rational profile and an error tending to zero along the allowed-prime-power filter, with nonzero modulus. Identify each possible real limit with its eventual rational profile value.

*Proof.* The profile takes values in the finite set `{a/b : 0 ≤ a ≤ B_n, 1 ≤ b ≤ K}` (API `profile_mem_finite`). By [moment minus component profile vanishes](#moment-minus-component-profile-vanishes) the moment converges iff the profile converges, to the same limit. A convergent function with values in a finite subset of `R` is eventually constant: a finite subset of a `T1` space is discrete (Mathlib Finite.instDiscreteTopology) and convergence to a point of a discrete subtype is eventual equality (Mathlib `Filter.tendsto_pure`).

*Needs:* [moment minus component profile vanishes](#moment-minus-component-profile-vanishes), [whole fixed degree component profile](#whole-fixed-degree-component-profile), `Finite.instDiscreteTopology` (Mathlib), `Filter.tendsto_pure` (Mathlib).

([[50]](#ref-50), Proof of Theorem 1.2, p.23 (arXiv v2; Duke 168, p.407).)

**Checks.**

- Constant profile: the limit exists.

- Profile alternating between two values: no limit, even though the `liminf` bound may hold.

- With `m = 0` the filter is bottom and every real number is a limit, including irrational values; the proper-filter hypothesis cannot be omitted.

<a id="liminf-limsup-from-recurrent-profile-values"></a>

**Liminf limsup from recurrent profile values.** Under [moment minus component profile vanishes](#moment-minus-component-profile-vanishes), let `R_n^±` be the set of profile values attained for arbitrarily large allowed `q`. It is a nonempty finite set, and `liminf_q Ẽ_n^±(q)/M(q) = min R_n^±, limsup_q Ẽ_n^±(q)/M(q) = max R_n^±`. In particular the bad-type bound of [bad type lower bound](#bad-type-lower-bound) bounds every recurrent value from below.

Characterize recurrence by frequent equality along the proper allowed-prime-power filter and prove the minimum and maximum formulas for the nonempty finite recurrent set.

*Proof.* Finitely many profile values occur (API `profile_mem_finite`); discard those taken only for boundedly many `q`; the remaining set is nonempty. Along an unbounded sequence of `q` with profile value `r`, the moment tends to `r` (error `O(q^{−1/2})`); conversely every limit point of the moment is a limit point of the profile, hence in `R_n^±`.

*Needs:* [moment minus component profile vanishes](#moment-minus-component-profile-vanishes), [whole fixed degree component profile](#whole-fixed-degree-component-profile), [bad type lower bound](#bad-type-lower-bound), `Filter.limsup` (Mathlib).

The finite-profile assertion follows from the elementary argument above. The arithmetic lower bound it uses is proved in [[50]](#ref-50), proof of Theorem 4.8, bad case, p.24 (arXiv `v2`; Duke 168, p.409); that proof does not establish eventual constancy of the profile.

**Checks.**

- If `R_n^±` is a singleton, the limit exists ([ordinary limit iff eventual profile constancy](#ordinary-limit-iff-eventual-profile-constancy)).

- The printed assertion needs `|R_n^±| = 1`.

- Values attained only for bounded allowed `q` are not recurrent and cannot change either limiting extreme.

<a id="weight-polynomial-formula-for-the-stable-orthant"></a>

**Weight polynomial formula for the stable orthant.** In [complete stable range component sum](#complete-stable-range-component-sum), let `δ ≡ N₀ (mod 2), 1 = (1, …, 1)`, and `W(X) := Σ_{ε ∈ S} X^{wt(ε + δ·1)}` (the weight enumerator of the surviving parities shifted by `N₀`). Then, as formal power series, `Σ_{d ≥ 0} Σ_stable(d) X^d = X^{N·N₀} W(X)/(1 − X²)^N`, equivalently `(1 − X²)^N · Σ_d Σ_stable(d) X^d = X^{N N₀} W(X)`.

State the equivalent product identity in `PowerSeries ℤ` for a finite set of surviving parity vectors. The shifted weight counts the coordinates whose parity differs from `N₀ mod 2`.

*Proof.* For a fixed `ε` the least allowed coordinate is `N₀ + ((ε_i − N₀) mod 2)`, and the other allowed values add `2z_i, z_i ≥ 0`: the generating series of the parity class is `X^{N N₀ + wt(ε + δ·1)}/(1 − X²)^N`. Sum over `ε ∈ S`; the coefficient identity is [stable parity multidegree count](#stable-parity-multidegree-count) (stars and bars). No analytic convergence is used.

*Needs:* [complete stable range component sum](#complete-stable-range-component-sum), [stable parity multidegree count](#stable-parity-multidegree-count), `PowerSeries` (Mathlib).

([[50]](#ref-50), Proposition 4.1, p.18 (arXiv v2; Duke 168, p.400).)

**Checks.**

- `N = 1, N₀ = 0, S = {0}: Σ_d Σ_stable(d) X^d = 1/(1 − X²)`.

- `N = 1, N₀ = 1, S = {0}` gives `X²/(1 − X²)`: the first even degree is two.

- `N = 1, N₀ = 1, S = {1}` gives `X/(1 − X²)`: the first odd degree is one.

- `S = ∅` gives the zero series.

### 5.22 Semidirect products and function-field moments

<a id="surjections-onto-a-semidirect-product"></a>

**Surjections onto a semidirect product.** Let `Γ` be a finite group, `H` a finite `Γ`-group and `G` a profinite group. There is a bijection between `Sur(G, H ⋊ Γ)` (continuous surjections) and tuples `(ρ, N, s, φ)` with `ρ ∈ Sur(G, Γ), N ⊆ ker ρ` a closed normal subgroup of `G, s : Γ → G/N` a homomorphic section of the induced map `ρ : G/N → Γ`, and `φ : ker ρ/N → H a Γ`-isomorphism, where `Γ` acts on `ker ρ/N` through `s` and conjugation. The bijection sends `ψ` to (projection of `ψ` to `Γ, ker ψ, ψ^{−1}` restricted to `Γ, ψ|_{ker ρ/N}`).

`Γ` and `H` carry the discrete topology.

*Proof.* Forward map as stated; `ψ^{−1}(Γ)` makes sense on `G/N ≅ H ⋊ Γ`. Inverse: from `1 → ker ρ/N → G/N → Γ → 1` and the section `s` get `G/N ≅ ker ρ/N ⋊ Γ`; extend `φ` to `ker ρ/N ⋊ Γ ≅ H ⋊ Γ` (Mathlib SemidirectProduct and its universal properties) and compose with `G → G/N`. Since `N` is closed and `G/N` is compact and finite, it is discrete. Thus the resulting algebraic isomorphisms and section are continuous, as required. The two constructions are mutually inverse (direct check).

*Needs:* `SemidirectProduct` (Mathlib), `SemidirectProduct.rightHom` (Mathlib), `SemidirectProduct.inr` (Mathlib).

([[51]](#ref-51), Lemma 9.1, p.37 (arXiv v2).)

**Checks.**

- `H = 1`: surjections `G → Γ` correspond to (`ρ, ker ρ`, the unique section, the unique map).

- `Γ = 1: Sur(G, H) ↔ (N, φ)` with `φ : G/N ≅ H`.

<a id="complements-of-a-coprime-abelian-normal-subgroup-are-conjugate"></a>

**Sections of a coprime abelian semidirect product.** Let `Γ` be a finite group and `H` a finite abelian `Γ`-group with `gcd(|H|, |Γ|) = 1`. Using the supplied `H`-conjugacy of complements, prove that `H ⋊ Γ → Γ` has exactly `[H : H^Γ]` sections. Existence and `H`-conjugacy of complements of a coprime normal subgroup are InverseGaloisAndArithmeticFundamentalGroups §IG.4.5, *Coprime profinite complements*; the count is what is added here.

Count homomorphisms `s : Γ → H ⋊ Γ` whose composite with `SemidirectProduct.rightHom` is the identity, expressing `[H : H^Γ]` as `|H|/|H^Γ|` using natural finite cardinalities.

*Proof.* A section `s` corresponds to the complement `s(Γ)`, and a complement `K` to the section `(π|_K)⁻¹`, so sections and complements of `H` correspond bijectively. `H` acts transitively on complements by conjugation (§IG.4.5; for abelian `H` this is the vanishing of `H¹(Γ, H)`, which is killed by both `|Γ|` and `|H|`). For `h ∈ H` and `γ ∈ Γ, hγh⁻¹ = (h·γ(h)⁻¹)γ` lies in the standard complement `Γ` iff `γ(h) = h`. So the stabiliser of `Γ` is `H^Γ`, and the orbit has `[H : H^Γ]` elements.

*Needs:* InverseGaloisAndArithmeticFundamentalGroups Layer IG.4 (§IG.4.5), `Subgroup.exists_right_complement'_of_coprime` (Mathlib), `SemidirectProduct` (Mathlib).

([[51]](#ref-51), Proof of Lemma 9.3, p.39 (arXiv v2).)

**Checks.**

- `H = 1`: one section.

- `Γ = ℤ/2` acting by `−1` on `H = ℤ/3: [H : H^Γ] = 3` sections, the three involutions' subgroups of `S₃`.

- `Γ = ℤ/2` acting trivially on `H = ℤ/3: H^Γ = H` and the standard section is the only one, so the count depends on the action and not only on `|H|`.

<a id="counting-unramified-h-extensions-via-semidirect-extensions"></a>

**Counting unramified h extensions via semidirect extensions.** Let `Γ` be finite, `Q = ℚ` or `𝔽_q(t)`, and `H` a finite `Γ`-group with `gcd(|H|, |Γ|) = 1` such that (SZ) all sections of `H ⋊ Γ → Γ` are `H`-conjugate (true when `H` is abelian: [complements of a coprime abelian normal subgroup are conjugate](#complements-of-a-coprime-abelian-normal-subgroup-are-conjugate)). Let `N(H, Γ, D, Q)` be the number of surjections `Gal(Q̄/Q) → H ⋊ Γ` whose `H ⋊ Γ`-extension `K` has rDisc `K = D`, whose `H`-extension `K/K^H` is unramified everywhere and split completely above `∞`, and whose `Γ`-extension `K^H/Q` is split completely at `∞`. Then `Σ_ρ |Sur_Γ(Gal(K_ρ^{un,∞}/K_ρ)^{(|Γ|′)}, H)| = [H : H^Γ]^{−1} N(H, Γ, D, Q)`, where `ρ` runs over surjections `Gal(Q̄/Q) → Γ` split completely at `∞` with rDisc `= D` (`Γ`-extensions with their identification, not isomorphism classes) and the `Γ`-action is that of the chosen section on the maximal pro-`|Γ|′` quotient. Summing instead over isomorphism classes `E_Γ(D, Q)`, the right side acquires the factor `|Z(Γ)|/|Γ|`.

*Proof.* Apply [surjections onto a semidirect product](#surjections-onto-a-semidirect-product) with `G = Gal(Q̄/Q)`. For each `ρ`, the maximal pro-`|Γ|′` quotient `ker ρ/M` carries a distinguished section `s_ρ` (LWZB Definition 2.1); tuples with `s = s_ρ` correspond to `Γ`-surjections `ker ρ/M → H`; the local conditions and rDisc `= D` match on both sides. By (SZ), all sections of `G/N → Γ` are `ker ρ/N`-conjugate with stabiliser `(ker ρ/N)^Γ`, so there are `[H : H^Γ]` sections, each with the same number of `φ`'s.

*Needs:* [surjections onto a semidirect product](#surjections-onto-a-semidirect-product), [complements of a coprime abelian normal subgroup are conjugate](#complements-of-a-coprime-abelian-normal-subgroup-are-conjugate), InverseGaloisAndArithmeticFundamentalGroups Layer IG.4.

([[51]](#ref-51), Lemma 9.3, p.38 (arXiv v2); [[51]](#ref-51), Introduction, p.3 (arXiv v2).)

**Checks.**

- `H = 1`: each isomorphism class of `S₃`-extensions with its `Γ`-action gives exactly `|Inn(S₃)| = 6` surjections, so `N(1,S₃,D,Q) = 6·#E_{S₃}(D,Q)`. There is at least one totally real example at `D = 229`: the splitting field of `x³ − 4x + 1`, an irreducible cubic with positive nonsquare discriminant 229. No uniqueness of that field is needed.

- The moment ratios of Theorem 1.4 are unchanged by the normalisation.

<a id="liu-wood-zureick-brown-function-field-moments"></a>

**Liu wood zureick brown function field moments.** Let `Γ` be finite and `H` a finite admissible `Γ`-group satisfying (SZ). For prime powers `q` with `gcd(q, |Γ||H|) = 1` and `gcd(q − 1, |H|) = 1` put `R_b(q) := Σ_{n ≤ b} Σ_{K ∈ E_Γ(q^n, 𝔽_q(t))} |Sur_Γ(Gal(K^#/K), H)| / Σ_{n ≤ b} |E_Γ(q^n, 𝔽_q(t))|`, where `E_Γ(D, 𝔽_q(t))` is the set of `Γ`-extensions of `𝔽_q(t)` split completely at `∞` with radical discriminant norm `D` and `K^#` is the maximal unramified extension of `K` split completely above `∞` with all finite subextensions of degree prime to `q(q − 1)|Γ|`. Then `lim_{b→∞} limsup_{q→∞} R_b(q) = lim_{b→∞} liminf_{q→∞} R_b(q) = [H : H^Γ]^{−1}`. For every sufficiently large `b`, every limit point of `R_b(q)` in `q` lies within `O_G(1/b)` of `[H : H^Γ]^{−1}`; the existence of `lim_{q→∞} R_b(q)` is not proved.

*Proof.* Write `a_Γ=|Z(Γ)|/|Γ|`. The numerator over isomorphism classes is `a_Γ[H:H^Γ]⁻¹ Σ_{n≤b}N(H,Γ,q^n,𝔽_q(t))`, while the denominator is `a_Γ Σ_{n≤b}N(1,Γ,q^n,𝔽_q(t))`. Thus `a_Γ` cancels in the ratio. The `Γ`-surjections to `H` factor through `Gal(K^#/K)`, since `|H|` is prime to `q(q−1)|Γ|`. `N(H, Γ, q^n, 𝔽_q(t)) = #Hur^n_{G,c}(𝔽_q)` with `G = H ⋊ Γ` and `c` the nonidentity elements of the order of their image in `Γ`; after cancellation, the denominator is `Σ_n #Hur^n_{Γ,Γ∖1}(𝔽_q)` (LWZB Lemma 10.2: §IG.5.5, *Hurwitz points and marked extensions*). If `Γ=1`, admissibility forces `H=1` and the ratio is identically 1, using the unique trivial extension of radical discriminant 1. Otherwise fix an allowed residue a of `q` modulo `|G|²` and replace `b` by `b_a`, the largest integer `≤b` whose residue lies in `E_a` modulo `M_a` from Theorem 10.4. The omitted slices have no rational points. Since `E_a` is nonempty, `0≤b−b_a<M_a`; for sufficiently large `b` this gives `b_a≍b`, uniformly over the finitely many a. Apply all following top-degree and error estimates at `b_a`, not at an empty degree-`b` slice. Grothendieck–Lefschetz (§IG.0.T4), Deligne's bound (DeligneWeightsAndPurity item 7.12) and the Betti comparison (LWZB Lemma 10.3: §IG.5.5) give `|#Hur^b(𝔽_q) − π(q, b) q^b| ≤ B(b) Σ_{j<2b} q^{j/2}`, with the top-degree trace counting Frobenius-fixed components ([top cohomology counts rational components](#top-cohomology-counts-rational-components)); lower `n` contribute `O_b(q^{b−1/2})`. LWZB Theorem 10.4 (§IG.5.6, *Semidirect components versus quotient components*)`: π_{G,c}(q, b) = π_Γ(q, b) + O_G(b^{d_Γ(q)−2})` and `π_Γ(q, b) ≥ C_G b^{d_Γ(q)−1}` on the residues where it is nonzero; so `R_b(q) = [H : H^Γ]^{−1}(1 + O_G(b^{−1}) + O_b(q^{−1/2}))` along each residue class of `q mod |G|²`, hence every limit point in `q` lies in `[H : H^Γ]^{−1}(1 + O_G(1/b))`.

*Needs:* [counting unramified h extensions via semidirect extensions](#counting-unramified-h-extensions-via-semidirect-extensions), [top cohomology counts rational components](#top-cohomology-counts-rational-components), InverseGaloisAndArithmeticFundamentalGroups Layers IG.0 and IG.5, DeligneWeightsAndPurity item 7.12.

([[51]](#ref-51), Theorem 1.4, p.3 (arXiv v2); [[51]](#ref-51), Proof of Theorem 1.4, p.41 (arXiv v2).)

**Checks.**

- `Γ = ℤ/2, H = ℤ/3` with inversion: `[H : H^Γ]^{−1} = 1/3`, the real-quadratic Cohen–Lenstra 3-moment, in the `q → ∞` mode.

- Even `|H|` is excluded by the hypotheses (`q` or `q − 1` is even).

<a id="cohen-lenstra-martinet-moments-over-function-fields"></a>

**Cohen lenstra martinet moments over function fields.** Let `Γ` be finite and `H` a finite abelian `Γ`-group with `gcd(|H|, |Γ|) = 1` and `H^Γ = 1`. Then with `q` running over prime powers with `gcd(q, |Γ||H|) = 1` and `gcd(q − 1, |H|) = 1, lim_{b→∞} limsup_q` and `lim_{b→∞} liminf_q` of `Σ_{n ≤ b} Σ_{K ∈ E_Γ(q^n, 𝔽_q(t))} |Sur_Γ(Cl(O_K), H)| / Σ_{n ≤ b} |E_Γ(q^n, 𝔽_q(t))|` both equal `|H|^{−1}`.

*Proof.* An abelian `Γ`-group is admissible iff `gcd(|H|, |Γ|) = 1` and `H^Γ = 1` (LWZB §7.1); (SZ) holds by [complements of a coprime abelian normal subgroup are conjugate](#complements-of-a-coprime-abelian-normal-subgroup-are-conjugate). By class field theory for function fields ([ArithmeticStatisticsPartI: function-field class-field and Picard comparison][part-10])`, Gal(K^#/K)^{ab}` is the prime-to-`q(q − 1)|Γ|` part of `Cl(O_K)`, so `Γ`-surjections onto the abelian `H` coincide. Apply [liu wood zureick brown function field moments](#liu-wood-zureick-brown-function-field-moments): `[H : H^Γ]^{−1} = |H|^{−1}`.

*Needs:* [liu wood zureick brown function field moments](#liu-wood-zureick-brown-function-field-moments), [complements of a coprime abelian normal subgroup are conjugate](#complements-of-a-coprime-abelian-normal-subgroup-are-conjugate), [ArithmeticStatisticsPartI: function-field class-field and Picard comparison][part-10].

([[51]](#ref-51), Corollary 1.5, p.4 (arXiv v2); [[51]](#ref-51), §1, p.4 (arXiv v2).)

**Checks.**

- `Γ = ℤ/2` acting by `−1` on `H = ℤ/ℓ^k` (`ℓ` odd): the real-quadratic Cohen–Lenstra moment `|H|^{−1}`.

- Fields are ordered by radical discriminant, not discriminant.

### Supporting geometric and cohomological comparisons

<a id="support-cohomology"></a>

Input (HS) of the supplier contracts is EVW's uniform Betti estimate for the centre-free generalized-dihedral Hurwitz schemes: for all `i` and `n` the Betti numbers are at most `C^(i+1)`, with `C` depending only on the group. That exactly one geometric component is Frobenius-fixed in the stated odd-degree, odd-`q`, `ℓ∤q(q-1)` range is proved in §5.18. Build the labelled stable hyperelliptic boundary and its compact-type clutching maps; the maps land on the boundary, not in the smooth open stratum. The nodal Picard/normalization exact sequence splits the torsion local system into the required overlapping symplectic summands. Prove the base cases and transvection generation, then lift integral monodromy. The lift from full `mod-ℓ` image requires `g≥2` or `ℓ≥5`; for `g=1,ℓ=3` it additionally requires a nontrivial `mod-nine` kernel. Source: EVW §§7–8, especially Lemma 8.9, pp. 780–782, with Achter–Pries's monodromy base cases and the integral lifting criterion stated at its target.

Use compact-support duality and weights to sum the lower cohomological traces. For `√q>C≥1` the geometric-series remainder is `C²/(√q-C)`. The top trace counts Frobenius-fixed geometric components, not the total number of components. This gives uniform moments before the upper/lower degree-density argument. Fixed-degree Wood moments instead sum all stable *and boundary* multidegrees, divide by the varying reduced-multiplier torsion `M(q)`, and compare with a finite-valued rational component profile to error `O_n(q^-1/2)`. An ordinary limit exists exactly when that whole profile is eventually constant; a lower bound on stable orthants alone proves a `liminf`. Sources: EVW Theorem 8.8 and proof, pp. 778–782; Wood Theorems 4.5, 4.7–4.8, pp. 20–25 in arXiv:1702.04644v2.

The joint enhanced Cohen–Lenstra model is conditional on existence of the finite-level joint-cokernel limits; a positive `liminf` is sufficient for its zero-cokernel obstruction, but does not establish existence. The polarized-abundance theorem assumes both uniform Rosati-model counting hypotheses, including the real-Weil surface factor. Under those assumptions its repeated-angle atom forces `liminf d_K≥.99` against any spacing law without an atom at zero; a particular GUE distribution is unnecessary for that implication. Source: Lipnowski–Tsimerman, §5, especially Definition 5.16, Lemma 5.11 and the concentration/spacing arguments.

### Examples

For the Wood profile, if recurring allowed `q` produce two distinct rational component ratios, the `O_n(q^-1/2)` error tends to zero while the ratios remain separated. Thus the arithmetic normalized moments have different `liminf` and `limsup`. Stable-range stars-and-bars counting cannot erase that boundary dependence.

`Suggested.lean` states the three local-density moment estimates, the integral symplectic lifting criterion and the unique similitude-stable orbit theorem. The numerical Checks beside the targets give concrete values and limiting distinctions. Hurwitz counts, Jacobian monodromy and arithmetic distribution theorems use the geometric carriers specified above.

### Dependencies

Parts I, IV, V and VII, linked at each use. InverseGaloisAndArithmeticFundamentalGroups Layers IG.0, IG.1 and IG.3–IG.5, with items IG-a and IG-b. AbelianSchemesAndArithmeticModuli §§A2, A3 and A6. JacobianChallengePartII §§1.2–1.4 supply the positive-genus relative Jacobian and principal polarization with arbitrary-base-change comparisons; this roadmap identifies their hyperelliptic instance and the trivial genus-zero case. GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3, 2.8, 3.3, extended here by GN-a to GN-d. EtaleDualityAndPerverseSheaves §§0.5–0.6. DeligneWeightsAndPurity item 7.12 and §§1.4–1.6. ArithmeticGaloisRepresentations §7.3 supplies the similitude group and multiplier; §5.18 builds its matrix-subset and orbit API. GlobalQuadraticForms Layer 5 and the completed-zeta comparison of GeometryOfNumbersAndQuadraticArithmetic §3.3 enter GN-d. Tau Ceti `WeierstrassCurve.hasse_bound`. The uniform Betti hypothesis (HS). Conditional arithmetic laws and unproved limit-existence predicates are used only as hypotheses.

## Downstream consumers

This is the last of the eight arithmetic-statistics parts. Section 5.18 supplies the matrix-subset and orbit interface used by the function-field component comparison. The integral similitude group and multiplier consumed by LocalGaloisDeformationRings are supplied by ArithmeticGaloisRepresentations §7.3. ModularityAndLanglandsExtensions and CrystallineLocalGlobalCompatibilityCM are downstream applications of the arithmetic-statistics comparisons.

## References

<a id="ref-37"></a>

[37] Jordan S. Ellenberg, Akshay Venkatesh, Craig Westerland. [Homological stability for Hurwitz spaces and the Cohen-Lenstra conjecture over function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf). Annals of Mathematics 183 (2016), no. 3, 729–786 (published PDF); compared with arXiv 0912.0325v4 (1 Dec 2015).

<a id="ref-45"></a>

[45] Michael Lipnowski, Jacob Tsimerman. [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1). Duke Math. J. 167 (2018), 3403–3453.

<a id="ref-46"></a>

[46] Tim Browning, Pierre Le Boudec, Will Sawin. [The Hasse principle for random Fano hypersurfaces](https://arxiv.org/pdf/2006.02356v1). arXiv:2006.02356v1 (3 June 2020, 66 pp.); published Annals of Mathematics 197 (2023), 1115–1203.

<a id="ref-47"></a>

[47] T. D. Browning, L. Matthiesen. [Norm forms for arbitrary number fields as products of linear polynomials](https://arxiv.org/pdf/1307.7641v4). arXiv:1307.7641v4 (7 September 2016); published Ann. Sci. Éc. Norm. Supér. (4) 50 (2017), no. 6.

<a id="ref-48"></a>

[48] Jeffrey D. Achter, Rachel Pries. [The integral monodromy of hyperelliptic and trielliptic curves](https://www.math.colostate.edu/~pries/Preprints/00DecPreprints/07finaltrielliptic.pdf). Mathematische Annalen 338 (2007), 187–206; author-hosted final PDF (20 pages).

<a id="ref-49"></a>

[49] Adrian Vasiu. [Surjectivity criteria for p-adic representations, Part I](https://arxiv.org/pdf/math/0209237v2). Manuscripta Mathematica 112 (2003), 325–355; arXiv math/0209237v2 (8 April 2004).

<a id="ref-50"></a>

[50] Melanie Matchett Wood (appendix with Philip Matchett Wood). [Nonabelian Cohen–Lenstra moments](https://arxiv.org/pdf/1702.04644v2). arXiv 1702.04644v2 (13 July 2018).

<a id="ref-51"></a>

[51] Yuan Liu, Melanie Matchett Wood, David Zureick-Brown. [A predicted distribution for Galois groups of maximal unramified extensions](https://arxiv.org/pdf/1907.05002v2). arXiv 1907.05002v2 (21 July 2022); published Inventiones mathematicae 237 (2024), 49–116.

<a id="ref-52"></a>

[52] Wee Teck Gan, Jonathan P. Hanke, Jiu-Kang Yu. [On an exact mass formula of Shimura](https://web.math.princeton.edu/~jonhanke/Web-02/Mass-Formula-of-Shimura/shimura-mass.pdf). Duke Mathematical Journal 107 (2001), no. 1, 103–133; author PDF paginated 101–131, §9, (9.1)–(9.2) and Proposition 9.3, pp.121–122 of the author PDF.

[part-1]: ../ArithmeticStatisticsPartI/README.md#local-density-of-a-form-modulo-q
[part-2]: ../ArithmeticStatisticsPartI/README.md#coefficient-vector-form
[part-3]: ../ArithmeticStatisticsPartI/README.md#primitive-hypersurface-family
[part-4]: ../ArithmeticStatisticsPartI/README.md#finite-local-hypersurface-set
[part-5]: ../ArithmeticStatisticsPartI/README.md#arithmetic-family
[part-6]: ../ArithmeticStatisticsPartI/README.md#principally-polarized-count
[part-7]: ../ArithmeticStatisticsPartI/README.md#polarization-fiber-count
[part-8]: ../ArithmeticStatisticsPartI/README.md#support-abelian-counts
[part-9]: ../ArithmeticStatisticsPartI/README.md#odd-degree-quadratic-function-field-family
[part-10]: ../ArithmeticStatisticsPartI/README.md#support-function-fields
[part-11]: ../ArithmeticStatisticsPartI/README.md#size-of-the-odd-degree-quadratic-family
[part-12]: ../ArithmeticStatisticsPartI/README.md#imaginary-exact-slice-parametrization
[part-13]: ../ArithmeticStatisticsPartI/README.md#wood-average-normalizations
[part-14]: ../ArithmeticStatisticsPartI/README.md#wood-infinity-and-type-adapter
[part-15]: ../ArithmeticStatisticsPartI/README.md#real-exact-slice-parametrization
[part-16]: ../ArithmeticStatisticsPartIV/README.md#cohen-lenstra-measure
[part-17]: ../ArithmeticStatisticsPartIV/README.md#surjection-count
[part-18]: ../ArithmeticStatisticsPartIV/README.md#isomorphism-classes-of-finite-abelian-p-groups
[part-19]: ../ArithmeticStatisticsPartIV/README.md#surjection-moment
[part-20]: ../ArithmeticStatisticsPartIV/README.md#finite-moment-control-of-masses
[part-21]: ../ArithmeticStatisticsPartV/README.md#nonabelian-quadratic-moment-interface
[part-22]: ../ArithmeticStatisticsPartV/README.md#support-embedded-types
[part-23]: ../ArithmeticStatisticsPartVII/README.md#zero-cokernel-probability-at-two
[part-24]: ../ArithmeticStatisticsPartVII/README.md#zero-cokernel-probability-lower-bound-at-odd-primes
[part-25]: ../ArithmeticStatisticsPartVII/README.md#enhanced-cohen-lenstra-finite-level-law
[part-26]: ../ArithmeticStatisticsPartVII/README.md#enhanced-cohen-lenstra-conjecture
