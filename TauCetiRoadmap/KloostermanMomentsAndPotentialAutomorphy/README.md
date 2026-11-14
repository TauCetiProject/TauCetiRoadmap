# Roadmap: symmetric power moments of Kloosterman sums and their potential automorphy

**Summary.** Assemble the symmetric power moments of rank-two Kloosterman sums over all finite
fields into generating series `Z_k(p; T)`, realize them cohomologically, and prove the theorems of
Fresán, Sabbah and Yu: `Z_k(p; T)` is an integer polynomial of known degree whose reciprocal roots
have weights `0`, `k` and `k + 1`; the middle de Rham cohomology of `Sym^k Kl₂` is the realization
of a motive `M_k` over `ℚ` of weight `k + 1` whose Hodge numbers are all `0` or `1` and are computed
explicitly; the inverse Euler factor of `M_k` at `p` is the middle factor `M_k(p; T)` of `Z_k(p; T)`,
its part of weight `k + 1`, except at the odd primes with `p² ≤ k` for odd `k` and at the odd primes
`p ≤ k/2` and at `2` for even `k`; at those odd primes it is `M_k(p; T)` times explicit linear factors
of weight `k + 1`, respectively `k`, from inertia invariants outside the middle part (Layer 8), and at
`2` for even `k` it is shown to exist (Layer 11); the `ℓ`-adic realizations of `M_k` form a
regular, polarized, weakly compatible system, hence are potentially automorphic by Patrikis–Taylor;
and the completed moment `L`-functions continue meromorphically with the functional equations
`Λ_k(s) = Λ_k(k + 2 − s)` for odd `k` (FSY Theorem 1.2, p. 3) and
`Λ_k(s) = ε_k Λ_k(k + 2 − s)` for even `k`, with an Euler factor, conductor exponent and sign at `2`
that are shown to exist (FSY Theorem 1.3, p. 4). The route goes through the characteristic-zero
Kloosterman connections of every rank `r ≥ 2`, their exponential mixed Hodge theory, explicit bases
and compactifications, the moment hypersurfaces `K_{r,k}` and their integral models, the local
Galois structure at every odd prime by Picard–Lefschetz theory, and the gamma and epsilon factors.
The finite sums, the `ℓ`-adic Kloosterman sheaf and its Deligne bound, the rigid Kloosterman
`F`-isocrystal and the general Hodge-module machinery are imported from the roadmaps that own them.

## Scope and ownership

This roadmap owns:

- the symmetric-power trace `h_k(t, d)`, the rank-two symmetric power moments `m₂ᵏ(q)` and their
  generating series `Z_k(p; T)` (Layer 0);
- the weight-zero normalization of the Kloosterman sheaves of every rank `r ≥ 2`, the facts about
  them not stated by their constructor (one unipotent Jordan block at `0`, geometric
  irreducibility, the rank-two symplectic pairing), their geometric and arithmetic monodromy groups
  in every characteristic, the cohomology of `Sym^k Kl₂` over `𝔽̄_p`, the integrality and
  character independence of the moments, and the local monodromy of `Kl₂` at `∞` in every
  characteristic with the Swan conductors and inertia invariants of its symmetric powers (Layer 1);
- the algebraic Kloosterman connections `Kl_r` of every rank over fields of characteristic zero,
  their cyclic covers, symmetric powers, local structure, differential Galois groups and the Bessel
  sign dictionary (Layer 2);
- the tensor potentials `f_{r,k}`, the signed symmetric projector, the Thom–Sebastiani
  identification, middle de Rham cohomology of `Sym^k Kl_r` and the inverse Fourier Kloosterman
  objects (Layer 3);
- classicality of the moment cohomology, the moment hypersurfaces `K_{r,k}`, the hypersurface
  realization of middle cohomology, the Nori motive `M_{r,k}` and the finite-field hypersurface
  comparison (Layer 4);
- the explicit rank-two frame, formal structure, intermediate extensions, inverse Fourier local
  structure, cohomology dimensions, de Rham bases and the weight of the constant quotient
  (Layer 5);
- the signed-permutation fan, the nondegenerate compactification of `t·g`, Newton weights, the
  Hodge filtration on the explicit bases and the two Hodge-number tables (Layer 6);
- the integral boundary geometry, the bad-prime quadratic singularities, the resolution of the even
  moment hypersurfaces and the Galois realizations `V_{k,ℓ}` of `M_k` (Layer 7);
- the middle moment polynomials, the degree formulas, the local Galois structure of `V_{k,ℓ}` at
  odd and even primes, the Euler factors and the conductors (Layer 8);
- the identification of the geometric and filtered hypotheses of the `p`-adic comparison of
  PadicDifferentialEquationsAndRigidCohomology §RD.7.21 and §RD.7.22 for the moment motives, and the
  regular polarized compatible systems (Layer 9);
- the determinant characters, gamma factors, epsilon factors and completed `L`-functions of the
  moment motives (Layer 10);
- the application of potential automorphy, the transport of local factors through
  semisimplification, the odd root number and the two functional equations (Layer 11).

What is stated elsewhere is consumed by section:

- CongruenceSpectralGap §4.2a owns the raw product-fibre hyper-Kloosterman sum `hyperKloosterman`
  over every finite field and coefficient ring at a unit parameter, its scaling and
  field-isomorphism laws and its comparison with the eliminated-variable sum
  `Σ_{x ∈ (Fˣ)^n} ψ(Σᵢ xᵢ + a/Πᵢ xᵢ)` for `a ∈ Fˣ`. Layer 0 uses its rank-two case at unit
  parameters. The moments sum over `a ∈ Fˣ` only, where the presentations agree.
- CharacterSumsOverFiniteFields §0.1 owns the canonical additive character
  `stdAddChar F = ZMod.stdAddChar ∘ Tr_{F/𝔽_p}` of a finite field and its nontriviality, §0.6 its
  compatibility with the trace of a finite extension, §5.1 the (twisted) Kloosterman sum
  `kloostermanSum χ ψ a b = Σ_{x ∈ Rˣ} χ(x)ψ(ax + b/x)` on a finite commutative ring with its symmetry,
  scaling and conjugation laws (so the untwisted sum is real) and its identification with the
  rank-two `hyperKloosterman` at unit parameters, §5.4 the rank-two Kloosterman `L`-polynomial and
  the lifting relation to extensions, and §5.6 the values at degenerate parameters and at the
  trivial additive character. The rank-two sum of Layer 0 is its untwisted case
  `kloostermanSum 1 ψ 1 a`, and the character of `𝔽_{p^m}` is its `stdAddChar (GaloisField p m)`;
  `Suggested.lean` restates these two, as `kloostermanSum` and `traceChar`, only so that the headline
  theorems are statable at the pins without importing another roadmap.
- Tau Ceti's `SymmetricPower.map`, `SymmetricPower.finrank_eq` and
  `Module.Basis.trace_map_symmetricPower_of_apply` supply the functoriality, the rank and the trace
  on an eigenbasis of the symmetric powers of a module; §0.1 adds the rank-two trace identity in
  terms of trace and determinant, and §2.4 the connection on a symmetric power.
- CongruenceSpectralGap §4.2b owns the Artin–Schreier sheaf `L_ψ`, the curve Euler–Poincaré
  (Grothendieck–Ogg–Shafarevich) formula, the Swan-constancy criterion, and the Kloosterman sheaf
  `Kl_r = R^{r−1}mult_!(L_ψ^{⊠r})` on `𝔾_m` with its concentration, lissity, rank `r`, tameness at
  `0`, Swan conductor one at `∞`, purity of weight `r − 1`, signed trace `(−1)^{r−1}` times the raw
  sum and the Deligne bound. Layer 1 adds only what that section does not state.
- McKaySkewGroup §§0.1–0.2 owns the concrete finite subgroups of `SL₂(ℂ)` and their classification
  up to conjugacy, with the finite rotation groups; §1.6 uses it to identify the image of inertia
  at `∞` and its normalizer.
- PadicDifferentialEquationsAndRigidCohomology §§RD.6.94–RD.6.98 owns the Kloosterman
  `F`-isocrystal `Kl_{n+1}` for odd `p ∤ n + 1`, its connection, purity and local monodromy, its
  localized Fourier description and the rigid realization of `H¹_{rig,?}(𝔾_m, Sym^k Kl_{n+1})` and
  of the hypersurface formula; §RD.7.20 owns Mieda's `p`-adic Picard–Lefschetz map for ordinary
  quadratic degenerations of unit thickness; §RD.7.21 states the `p`-adic realization of the moment
  motives (FSY Proposition 5.23) with the geometric identifications and comparison isomorphisms as
  hypotheses; §RD.7.21a owns the odd-prime factorization `Z_k = (1 − T)R_k M_k` in rigid
  cohomology; §RD.7.22 states Newton above Hodge and `v_p(c_n) ≥ n(n − 1)` with filtered input
  hypotheses. Layer 9 discharges those hypotheses; it does not restate the conclusions.
- ComplexComparisonPartII §C5.1 owns the sheaf of ordinary algebraic differential operators, and
  FormalConnectionsOpers F2.2 its symbols and filtered PBW structure.
  SpringerResolutionAndCharacteristicCycles §§8.1–8.4 own coherent `D`-modules over that sheaf and
  their good filtrations, and §§9.1–9.7 own transfer modules, direct and inverse images with their
  shifts, duality, Kashiwara's equivalence, holonomic modules and their finite length, intermediate
  extension and regular holonomic modules.
- PadicDifferentialEquationsAndRigidCohomology §RD.6.52a owns formal differential modules over
  characteristic-zero fields of Laurent series, their slopes, ramified exponential normal form and
  irregularity, and §RD.6.53 the Euler–Poincaré (index) formula for connections on curves.
- MixedHodgeModulesAndIrregularHodgeTheory owns exponential twists `E^f`, Fourier–Laplace
  transformation, additive convolution, the localized Fourier functor and Fourier duality
  (§§2.1–2.5), pure and mixed Hodge modules, their operations, weights, nearby and vanishing cycles
  and the curve costalk formula (§§4.3, 4.6, 5.1–5.4), exponential mixed Hodge structures, the
  projector `Π`, the exponential weight filtration, the de Rham fibre and the Fourier description
  of `Π` (§§6.1–6.6), the irregular Hodge filtration and its strict bifiltered realization (§§7.1,
  7.5–7.6), the classical subcategory and the agreement of filtrations (§§6.7, 7.7), exponential
  pair cohomology with its de Rham fibre, Künneth, duality, middle-degree weights and divisor
  sequences (§§8.1–8.5), the classicality of `t·g` and the zero-locus comparison (§§8.7–8.8),
  the Fourier cohomology of a mixed Hodge module on the line, Fourier costalks, pure-input Hodge
  numbers, the constant correction of `Π`, regular stationary phase and the weights at infinity
  (§§9.1–9.6), and the logarithmic and Newton descriptions of
  the irregular filtration with the constant boundary correction of a Laurent Gauss–Manin system
  (§§10.1–10.8).
- ComplexComparisonPartII §§C5.6–C5.7 owns regular singular connections, the canonical logarithmic
  extension and the logarithmic de Rham comparison on curves.
- DiophantineApproximationAndTranscendence §5.4 owns Picard–Vessiot fields over `C(z)`, their
  differential Galois groups acting faithfully on the solution space, the fixed-field
  correspondence with the identity component, and the analytic realization of monodromy over `ℂ`;
  §2.5 computes the groups of the Kloosterman connections on that carrier.
- EtaleCohomologyFoundations (finite and rational étale coefficients, compact supports, base change,
  topological invariance, duality, smooth purity, projective bundles and blow-ups),
  InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 (the rational Grothendieck–Lefschetz trace
  formula), EtaleDualityAndPerverseSheaves §3.3 (rational perverse coefficients, with §2.7's perverse
  Artin vanishing and the decomposition theorem of §§5.6 and 5.10) and
  DeligneWeightsAndPurity §§0.16, 0.18, 7.12, 7.15, 8.14, 8.19, 8.24 (eigenvalues under a perfect
  pairing; decomposition by weights; weights of `H_c`, `H` and the middle image; purity for smooth
  proper varieties; geometric monodromy and semisimplicity; the weight spectral sequence of a
  normal crossings compactification of a smooth proper variety) are consumed as stated. The
  boundary localization on the possibly singular fibres of the moment compactifications, where
  §8.24 does not apply, is a target here (§7.1).
- SchemeAndStackFoundations §2.11 (the Artin–Schreier sequence), §4.11 (modifications and strict
  transforms) and §4.17 (strict normal crossings divisors), and ShimuraCompactifications
  §§0.16–0.18 (toric schemes of finite fans over every commutative ring, properness by the support
  criterion and the integral toric boundary) supply the scheme geometry of the integral models;
  AnalyticToricGeometryPartII §§0.3 and 0.5 (character sections and toric line bundles over every
  commutative ring) and its projective-embedding contract below supply their projectivity.
- LefschetzPencilsAndVanishingCycles §§2.4–2.8 (ordinary quadratic points, their vanishing cycles and
  the Picard–Lefschetz formula), the Fresán–Sabbah–Yu discriminant computation in the Examples of
  Layer LPV.2, and §6.6 (vanishing cycles of an isolated singularity of a regular total space,
  including the nonordinary quadratic singularities in residue characteristic two) supply the local
  Galois structure at bad primes.
- MotivesAndAlgebraicCycles Layer 5 owns the rational Nori category, its tensor structure, pair
  motives and its Betti, de Rham and étale realizations.
- ArithmeticGaloisRepresentations owns semisimplification (§1.7), local factors, purity of
  Weil–Deligne representations and purity from a pure graded (§§2.5–2.6), local constants (§2.7),
  conductors (§3.3), recognition by Frobenius polynomials (§5.3) and polarized representations
  (§7.4).
- PotentialModularityAndCompatibleSystems §§1.5–1.6 and §1.15 own polarized weakly compatible
  systems, regularity, purity and the Hodge recipe for archimedean factors; ModularityAndLanglandsExtensions
  §2.42 owns simultaneous potential automorphy of pure regular polarized systems (Patrikis–Taylor),
  §2.43 the irreducibility of the Galois representations of extremely regular polarized cuspidal
  representations, and §2.49 their strict purity, meromorphic continuation and functional
  equations. AutomorphicGaloisRepresentationsPartII Layer AG2.6 owns local–global compatibility
  at the coefficient prime for regular algebraic polarized cuspidal representations of totally
  real fields, and Layer AG2.5 its counterpart away from the coefficient prime.
- CohomologyComparisons §2.13 (the filtered de Rham comparison), §§3.4–3.5 (the crystalline
  comparison over a discretely valued base) and §§4.3–4.4 (the semistable comparison), and
  PadicHodgeTheory §3.2 (filtered spaces and the Hodge–Tate sign dictionary) supply the period
  comparisons fed into §RD.7.21. NoncommutativeAndEquivariantIwasawa §F.6 (potential semistability
  of de Rham representations), FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2–R07.3.3 (weak
  admissibility of `D_st` of a semistable representation and its Newton–Hodge polygon form) and
  PadicHodgeTheory §5.3 (`D_pst` and its Weil–Deligne representation) supply the coefficient-prime
  slope argument of §11.2.

The companion roadmap KloostermanSheavesAndBesselIsocrystals consumes Layers 1 and 2 in every rank,
including the weight-zero normalization, the monodromy table and the Bessel sign dictionary; it
keeps the reductive-group Bessel constructions and the `F`-isocrystal companion theorem.

## Conventions

- `r = n + 1 ≥ 2` is the rank of a Kloosterman object and `k` the symmetric-power exponent. All
  rank-`r` monodromy statements assume `r ≥ 2`; the rank-two arithmetic targets assume `k ≥ 1`
  except where the zeroth moment is discussed explicitly.
- The raw Kloosterman sum has no prefactor. The trace of the rank-`r` sheaf is `(−1)^{r−1}` times
  the raw sum. In rank two the Frobenius eigenvalues satisfy `α + β = −Kl₂(a; q)` and `αβ = q`, and
  symmetric power moments use `h_k(α + β, αβ) = Σᵢ αⁱβ^{k−i}`, never `(α + β)^k`.
- Frobenius is geometric throughout. `ℚ_ℓ(1)` has geometric Frobenius `q⁻¹`, so the Tate twist
  `(−1)` multiplies Frobenius eigenvalues by `q` and raises weights by two. The weight-zero
  normalization of rank `r` fixes one square root `c` of `p` and uses `c^m` over `𝔽_{p^m}`.
- Hodge–Tate weights follow Fresán–Sabbah–Yu: the cyclotomic character has Hodge–Tate weight `−1`
  and weights are the jumps of the de Rham filtration. PadicHodgeTheory §3.2 uses `HT(χ_cyc) = +1`,
  so a multiset of weights here is the negative of the supplier's; `D_dR`, its filtration and the
  representation are unchanged.
- Exponential connections are `E^f = (O, d + df)` as left `D`-modules, as in
  MixedHodgeModulesAndIrregularHodgeTheory §2.1. The cyclic module equation of a connection and
  the scalar equation of a horizontal solution have different signs; §2.6 records both.
- Middle cohomology is always the image of compact-support cohomology in ordinary cohomology,
  with its two comparison maps. For rank `r` the middle motive has weight `(r − 1)k + 1` and a pairing
  into `ℚ(−(r − 1)k − 1)`; the hypersurface realization lives in degree `(r − 1)k − 1` before the Tate
  twist `(−1)`.
- Mixed Hodge structures are Tau Ceti's `TauCeti.Hodge.MixedHodgeStructure` with a rational model,
  restricted to finite-dimensional graded-polarizable objects; no second Hodge carrier is built.
- `d_k = ⌊(k − 1)/2⌋ − δ_{4∣k}` is the dimension of the rank-two middle motive for `k ≥ 1`; it is never
  evaluated at `k = 0` through truncated subtraction.
- `sf(n)` is the square-free part of `n` (the product of the primes with odd valuation in `n`), and
  `oddRad(n)` the product of the distinct odd primes dividing `n`.
- `Θ⁺_p` and `Θ⁻_p` are the sets of odd integers `a ≥ 1` with `ap ≤ k` and `v_p(a)` odd, respectively
  even; `|Θ⁺_p| + |Θ⁻_p| = ⌊k/(2p) + 1/2⌋`, and `Θ⁺_2 = ∅`.
- The `L`-function normalization is arithmetic: the Euler factor at `p` is evaluated at `T = p^{−s}`,
  and the functional equations relate `s` and `k + 2 − s`. The gamma factor used in the completed
  functions is `G_d(s) = π^{−ds/2} Π_{j=1}^d Γ((s − j)/2)`; the product of the standard factors
  `Γ_ℝ(s − j)` equals `π^{d(d+1)/4} G_d(s)`.

## Exact supplier contracts

### From Mathlib

- `AddChar` (additive characters; the trivial character is the constant one),
  `AddChar.sum_eq_ite` (orthogonality over a finite group into a domain) and
  `AddChar.compAddMonoidHom`.
- `ZMod.stdAddChar` (the character `x ↦ exp(2πi x/N)` of `ZMod N`), `GaloisField` with
  `GaloisField.card` (`𝔽_{p^m}` has `p^m` elements for `m ≠ 0`), `GaloisField.finrank` (it has
  degree `m` over `ZMod p` for `m ≠ 0`), `FiniteField.nonempty_algHom_of_finrank_dvd` (a finite
  extension embeds into a finite field over a common base when its degree divides the other's),
  `Algebra.trace`, `Algebra.trace_trace` (for a scalar tower `R → S → T` with `S` finite free over
  `R` and `T` finite free over `S`, the trace from `T` to `R` is the trace from `S` to `R` after the
  trace from `T` to `S`), `Algebra.trace_algebraMap` (for `S` free over `R` with the strong rank
  condition, the trace of the image of `x ∈ R` is `finrank R S • x`), `Module.finrank_mul_finrank`
  (degrees multiply in a tower), `AddChar.map_nsmul_eq_pow` (`ψ(n•x) = ψ(x)ⁿ`),
  and `FiniteField.algebraMap_trace_eq_sum_pow` (the relative trace of finite fields as a sum of
  Frobenius conjugates).
- `SymmetricPower` (the symmetric tensor power of a module over a commutative semiring, as the
  quotient of the tensor power by the permutation relations): the underlying module of a symmetric
  power of a connection, not its connection.
- `PowerSeries`, `PowerSeries.exp`, `PowerSeries.subst` (substitution of a series with zero constant
  coefficient), the inverse of a power series with nonzero constant coefficient over a field,
  `Polynomial.roots` and the coercion of polynomials to power series.
- `LSeries`, `LSeries.term` (the term `f n·n^{−s}` for `n ≥ 1`, defined to be `0` at `n = 0`),
  `LSeriesSummable` (summability of `LSeries.term f s`), `summable_norm_iff` (in a
  finite-dimensional real normed space a family is summable exactly when its norms are),
  `Complex.natCast_mul_natCast_cpow`, `MeromorphicNFOn` (meromorphic functions in normal form, whose
  values are determined by the germs), `Complex.Gamma`, `legendreSym` and `padicValNat`.
- `EulerProduct.eulerProduct_tprod`: for `f : ℕ → R` into a complete normed commutative ring with
  `f 0 = 0`, `f 1 = 1`, `f` multiplicative on coprime arguments and `‖f‖` summable,
  `Π_p Σ_e f(p^e) = Σ_n f(n)`.
- `MvPolynomial.hsymm` (complete homogeneous symmetric polynomials), which `h_k` expresses through
  the elementary symmetric functions in two variables.
- `Polynomial.Chebyshev.U` (Chebyshev polynomials of the second kind).

### From Tau Ceti

- `TauCeti.Hodge.MixedHodgeStructure` (integral, rational and complex models with a finite rational
  weight filtration, a finite complex Hodge filtration and pure graded pieces), its strictness
  theorems `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F` and
  `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`, and the Tate structures
  `TauCeti.Hodge.tate`. These carry every Hodge structure of Layers 4 and 6. Finite dimension and
  graded polarizability are added conditions.
- `SymmetricPower.map` (`TauCeti/LinearAlgebra/SymmetricPower/Basic.lean`: the linear map induced by
  `f : M → N` on the `n`-th symmetric powers, sending `m₁⋯m_n` to `f(m₁)⋯f(m_n)`),
  `SymmetricPower.finrank_eq` (`TauCeti/LinearAlgebra/SymmetricPower/Basis.lean`: over a ring with the
  strong rank condition, the `n`-th symmetric power of a finite free module of rank `r` is free of
  rank `multichoose r n = binomial(r − 1 + n, n)`) and `Module.Basis.trace_map_symmetricPower_of_apply`
  (same file: if `f` is diagonal in a finite basis with eigenvalues `aᵢ`, the trace of
  `SymmetricPower.map f` on the `n`-th symmetric power is the sum over unordered `n`-tuples of basis
  indices of the products of the `aᵢ`). Assumed of them: nothing beyond these statements; the
  general rank-two trace identity and the connections are targets here.

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

- §0.1: `stdAddChar F`, the composite of `ZMod.stdAddChar` with `Algebra.trace (ZMod p) F` for a
  finite field `F` of characteristic `p`, and its nontriviality. For `F = GaloisField p m` it is
  `traceChar p m` (the two `ZMod p`-algebra structures on `F` agree, a ring map out of `ZMod p` being
  unique).
- §0.6: for a finite extension `E/F`, `(stdAddChar F).liftTrace = stdAddChar E`, that is
  `ψ_E = ψ_F ∘ Tr_{E/F}`.
- §5.1: `kloostermanSum χ ψ a b = Σ_{x ∈ Rˣ} χ(x)ψ(ax + b x⁻¹)`; with `χ = 1` the sum is real
  (conjugation law), unit scaling gives `K(1; ua, u⁻¹b) = K(1; a, b)`, and on a field
  `kloostermanSum 1 ψ a b = hyperKloosterman F 2 ψ (ab)` for `a, b ∈ Fˣ`. At `a = 1` this is
  `kloostermanSum F ψ b` of §0.2 for every `b ∈ F`.
- §5.4: for `a, b ∈ Fˣ` and `χ = 1`, `1 + K(1; a, b)T + qT² = (1 − ω₁T)(1 − ω₂T)` and, for an extension
  `E/F` of degree `n`, `K_E(1; a, b) = −(ω₁ⁿ + ω₂ⁿ)` with `ψ_E = ψ ∘ Tr_{E/F}`. It is the elementary
  counterpart of the trace and determinant of Frobenius on `Kl₂` in §1.2.
- §5.6: for the trivial additive character, `K(1; a, b) = #Rˣ`.

### From TauCetiRoadmap.CongruenceSpectralGap

- §4.2a: `hyperKloosterman F k ψ r` for `r ∈ Fˣ` and its eliminated-variable comparison; at `k = 2`
  and a unit `r` this is the rank-two sum `Kl₂(r; ψ)` of §0.2. At `r = 0` the sum of §0.2 is
  `Σ_{x ∈ Fˣ} ψ(x)` and is not a value of `hyperKloosterman`.
- §4.2b: `L_ψ` with trace `ψ ∘ Tr` under geometric Frobenius; the curve Euler–Poincaré formula
  `χ_c(U, L) = rank(L)χ_c(U) − Σ deg(x)·Sw_x(L)`; the Kloosterman sheaf `Kl_r` with the properties
  listed in Scope and ownership, for every characteristic, every `r ≥ 1` and every nontrivial `ψ`.
  Assumed: the sheaf is the actual compact direct image along multiplication, and its trace sign is
  `(−1)^{r−1}`.

### From TauCetiRoadmap.McKaySkewGroup

- §0.1: the concrete cyclic, binary dihedral, binary tetrahedral (order `24`), binary octahedral
  (order `48`, containing the binary tetrahedral model with index two) and binary icosahedral
  (order `120`) subgroups of `SU(2) ⊂ SL₂(ℂ)`, with their defining representations.
- §0.2: every finite subgroup of `SL₂(ℂ)` is cyclic, binary dihedral, binary tetrahedral
  (`≅ SL(2, 𝔽₃)`), binary octahedral or binary icosahedral (`≅ SL(2, 𝔽₅)`)
  (`finite_subgroup_SL2_classification`), and is conjugate to the corresponding model
  (`finite_subgroup_SL2_conjugate_of_mulEquiv`); a finite subgroup of `SO(3)` is cyclic, dihedral,
  tetrahedral `A₄`, octahedral `S₄` or icosahedral `A₅`; every finite subgroup of `SL₂(ℂ)` is
  conjugate into `SU(2)`; a finite subgroup of `SU(2)` containing `−I` is the full preimage of its
  image under `SU(2) → SO(3)`; a finite subgroup of `SU(2)` of odd order is cyclic and lies in a
  maximal torus. Assumed: §1.6 applies these statements over `ℚ̄_ℓ` through a field embedding into `ℂ` of
  the finitely generated field generated by the matrix entries; this roadmap computes the
  ramification filtration, the Frobenius normalizer and the symmetric-power invariants of the
  Kloosterman image.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

- §RD.6.52a: over a field of characteristic zero, the finite-ramification formal normal form of a
  differential module over the Laurent series field, slopes, ramified descent and Malgrange's
  irregularity, zero exactly for regular singular modules.
- §RD.6.53: let `C` be a smooth proper geometrically connected curve of genus `g` over a field `F` of
  characteristic zero, `Z` a nonempty finite set of closed points, `U = C ∖ Z` (affine) and `E` a
  connection of rank `r` on `U`, meromorphic along `Z`. Then `H²_dR(U, E) = 0` and
  `dim H⁰_dR(U, E) − dim H¹_dR(U, E) = r·χ(U) − Σ_{z ∈ Z} [κ(z) : F]·Irr_z(E)`, where
  `χ(U) = 2 − 2g − Σ_{z ∈ Z} [κ(z) : F]` and `Irr_z` is the irregularity of the formal connection at
  `z` (§RD.6.52a). On `𝔾_m = ℙ¹ ∖ {0, ∞}`, where both boundary points are rational and `χ = 0`, for
  `E` regular at `0` this is the index formula `dim H¹_dR(𝔾_m, E) − dim H⁰_dR(𝔾_m, E) = irr_∞(E)`.
- §§RD.6.94–RD.6.98 as listed in Scope and ownership, used at odd `p` in rank two (`p ∤ 2`).
- §RD.7.20 (Mieda), §RD.7.21 and §RD.7.21a, §RD.7.22: the `p`-adic realization of `M_k`, the
  odd-prime boundary factorization and Newton above Hodge, each with its stated hypotheses. Layer 9
  supplies the geometric identifications and filtered data those sections assume.
- What PadicDifferentialEquationsAndRigidCohomology must provide (gap:higher-thickness-picard-lefschetz):
  the conclusions of §RD.7.20 (strict semistability after a resolution over `O_L`,
  `L = ℚ_p(√−p)`, and an injective Frobenius-compatible rigid-to-de Rham map compatible with the
  restriction to the boundary strata) for a proper flat `ℤ_p`-scheme whose special fibre is smooth
  outside finitely many ordinary quadratic points with local equations `Q − u·(√−p)^{2e}` over
  `O_L`, `u` a unit and `e ≥ 1` arbitrary.

### From TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles

- §§8.1–8.4: coherent `D`-modules over the sheaf of ordinary differential operators of
  ComplexComparisonPartII §C5.1, with the symbols and filtered PBW structure of
  FormalConnectionsOpers F2.2, and their good filtrations, with local existence and comparison.
- §§9.1–9.7: transfer modules, direct and inverse images with the normalization
  `f† = Lf*[dim Y − dim Y′]`, duality `𝔻` and `f_! = 𝔻f_+𝔻` (§9.1), Kashiwara's equivalence (§9.2),
  holonomic modules and their finite length (§§9.4–9.5), intermediate extension
  `j_!* E = im(H⁰j_!E → H⁰j_+E)` with its no-boundary-subquotient characterization (§9.6) and regular
  holonomic modules (§9.7), over every field of characteristic zero.

### From TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory

- §§2.1–2.5: `E^f`, the identities `E^f ⊗ E^g = E^{f+g}`, `𝔻E^f = E^{−f}`, `h⁺E^f = E^{f∘h}`; the
  Fourier–Laplace transform with kernel `E^{tτ}` and its inverse; additive convolution; the localized
  Fourier functor `j₀⁺ ∘ FT ∘ j_{0,+}`; Fourier duality.
- §§4.3, 4.6 and 5.1–5.4: pure and mixed Hodge modules, their operations, weight bounds, Hodge
  nearby and vanishing cycles, and the curve costalk formula.
- §§6.1–6.7, 7.1 and 7.5–7.7: exponential mixed Hodge structures, `Π` with its unit and
  constant kernel and cokernel, the exponential weight filtration, the de Rham fibre, the irregular
  Hodge filtration and its strict bifiltered realization, and the agreement of the irregular and
  classical filtrations on classical objects (FSY Proposition A.13). From §6.6 this roadmap uses the
  Fourier description `FT ΠN ≅ (FT N)(∗0) = j_{0,+}j₀⁺FT N` for regular holonomic `N`. Equivalently,
  `Π ∘ FT⁻¹ ≅ FT⁻¹ ∘ j_{0,+}j₀⁺` on modules whose inverse Fourier transform is regular holonomic. The
  regularity is a condition on `N`, not on the transform `FT N`, which is irregular at `∞` in every
  use here.
- §§8.1–8.5 and 8.7–8.8: ordinary, compact and middle exponential cohomology of a pair with its de
  Rham fibre, Künneth and duality, the middle-degree weight statement, divisor sequences, the
  classicality of `t·g` on `𝔸¹ × V` and its `*0`/`!0` variants (FSY Theorem A.24), and the zero-locus
  comparison `H_c^a(𝔸¹ × V, tg) ≅ H_c^{a−2}(K)(−1)`, `H^a(𝔸¹ × V, tg) ≅ H_K^a(V)` (FSY Example A.27).
- §§9.1–9.6: the mixed Hodge structures `H^j(𝔸¹_t, FT M^H)` and `H^j_c(𝔸¹_t, FT M^H)` of a mixed
  Hodge module on `𝔸¹_τ` with their long exact sequences (FSY Notation A.29), the Fourier costalk
  and pure-input Hodge-number formulas, the constant correction of `Π`, regular stationary phase at
  eigenvalue one and the monodromy weights at infinity (FSY Theorem A.30, Corollary A.31). Layer 3
  uses only the weight bound `≥ w + 1` of the constant quotient (§9.4); its exact weight in rank two
  comes from §9.6 applied in §5.7, with every primitive part kept, to the single block at `∞` of
  §5.4.
- §§10.1–10.8: the logarithmic filtration on good and nondegenerate compactifications, filtered
  invariance under the explicit blow-ups, model independence and `E₁` degeneration, the Newton
  filtration of a Newton-nondegenerate Laurent polynomial with its agreement with the irregular
  filtration, and the constant cone of `h_! → h_*` for a convenient nondegenerate Laurent
  polynomial `h` (§10.8).
- What MixedHodgeModulesAndIrregularHodgeTheory must provide (gap:irregular-stationary-phase):
  for a holonomic module `M` on `𝔸¹` whose formal structure at `∞` is a sum of
  `E^{c_i t} ⊗ R_i` with distinct `c_i ∈ ℂ` and `R_i` regular, together with parts of slope
  different from one, the inverse Fourier transform is smooth on `𝔸¹ ∖ {c_i}` and its vanishing cycles
  at each `c_i` are isomorphic, with their monodromy, to the formal regular module `R_i`, with the
  sign convention of the kernel `E^{tτ}`. This extends the regular-input stationary phase of §9.5.

### From TauCetiRoadmap.ComplexComparisonPartII

- §C5.1: the sheaf of ordinary algebraic differential operators with its order filtration, on
  which `θ = z∂_z` and the cyclic presentations of Layer 2 live.
- §C5.6: regular singular connections and the canonical logarithmic extension; §C5.7: the
  logarithmic and compact-support logarithmic de Rham complexes on curves and their comparison maps.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

- §5.4 (Picard–Vessiot fields and analytic solutions): for `k = C(z)` with `C` algebraically closed of
  characteristic zero and every finite system `Y′ = AY` over `k`, a Picard–Vessiot field `K`, unique
  up to differential `k`-isomorphism, with constants `C`; its differential automorphism group `G`, a
  linear algebraic group acting faithfully on the solution space; the closed-subgroup/fixed-field
  correspondence with `K^G = k` and `K^{G⁰}` the relative algebraic closure of `k` in `K`, finite
  Galois over `k` with group `G/G⁰`; and, for `C = ℂ`, the realization of `K` in meromorphic germs at
  an ordinary point, analytic continuation along loops acting through elements of `G`. Assumed: the
  construction applies to the generic fibre of `Kl_r` over `ℂ(z)` and to that of `K̃l_r` over `ℂ(t)`,
  written as first-order systems through the cyclic presentation of §2.1.

### From TauCetiRoadmap.EtaleCohomologyFoundations, InverseGaloisAndArithmeticFundamentalGroups, EtaleDualityAndPerverseSheaves and DeligneWeightsAndPurity

- EtaleCohomologyFoundations §§F.2.4–F.2.7 (compact supports, Künneth), §F.0.4 (topological
  invariance under universal homeomorphisms), §F.4.5 (rational realization), §F.5 (exceptional
  inverse image and duality), §F.6 (smooth purity and Gysin maps), §F.7 (projective bundles and
  blow-ups), §F.10.1–F.10.2b (Frobenius comparisons).
- InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3: the rational constructible
  Grothendieck–Lefschetz trace formula over every finite field.
- EtaleDualityAndPerverseSheaves §3.3: perverse coefficient extension to rational coefficients;
  §2.3 and §2.8: intermediate extension; §2.7: perverse Artin vanishing, so that `H^i_c(X, P) = 0`
  for `i < 0`, `X` affine and `P` perverse; §§5.6 and 5.10: the decomposition theorem for proper
  morphisms over finite fields and over `ℂ`.
- DeligneWeightsAndPurity §0.16: eigenvalues of Frobenius modules under a Frobenius-equivariant
  perfect pairing; §0.18: a Frobenius module whose eigenvalues are Weil numbers decomposes
  functorially by weights, so `gr^W` is exact; §§8.14 and 8.19: geometric monodromy groups and the
  geometric semisimplicity of pure lisse sheaves; §7.12: for `X₀/𝔽_q` smooth and `ℱ₀` lisse and pure of
  weight `w`, `H^i_c` has weights `≤ w + i`, `H^i` weights `≥ w + i`, and the image of `H^i_c → H^i` is
  pure of weight `w + i`; §7.15: for `X₀` smooth and proper, `H^i` is pure of weight `i`; §8.24: for
  `X₀` smooth and proper with a normal crossings divisor, the weight spectral sequence of the
  complement, pure on `E₁` and degenerate at `E₂`. Assumed: §8.24 is applied only to smooth proper
  compactifications, that is at primes where the moment compactification has good reduction; on
  the singular special fibres the boundary localization of §7.1 is used instead.

### From TauCetiRoadmap.SchemeAndStackFoundations and ShimuraCompactifications

- SchemeAndStackFoundations §2.11 (the Artin–Schreier sequence), §4.11 (blow-ups, modifications
  and strict transforms), §4.13 (regular schemes), §4.17 (strict normal crossings divisors).
- ShimuraCompactifications §0.16 (toric schemes of finite fans over every commutative ring, with
  base change), §0.17 (properness by the support criterion over every base), §0.18 (the integral
  toric boundary of a regular chart is flat with reduced geometric fibres).

### From TauCetiRoadmap.AnalyticToricGeometryPartII

- §0.3 (the character module `S_A(D) = ⊕_{u ∈ W_Σ(D)} Aχ^u` of an invariant divisor over every
  commutative ring `A`, identified with global sections) and §0.5 (the line bundle `O(D)` on `X_{Σ,A}`
  of an integral invariant divisor on a regular fan, for every commutative ring `A`).
- What AnalyticToricGeometryPartII must provide (gap:toric-polytope-projective-embedding): for a
  full-dimensional lattice polytope `P ⊂ M_ℝ` whose normal fan `Σ_P` is regular, the invariant divisor
  `D_P = Σ_ρ −min_{u ∈ P}⟨u, v_ρ⟩·D_ρ` and every commutative ring `A`, the sections `χ^u`,
  `u ∈ P ∩ M`, of `O(D_P)` on `X_{Σ_P,A}` generate it and define a closed immersion
  `X_{Σ_P,A} → ℙ^{|P ∩ M| − 1}_A`, compatible with base change in `A`; in particular `X_{Σ_P,A}` is
  projective over `A`.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

- §§2.4–2.8: ordinary quadratic points, their normal form, nearby and vanishing cycles, the
  discriminant character from the even Clifford centre, and the Picard–Lefschetz formula for a
  proper family; the Examples of Layer LPV.2: the Fresán–Sabbah–Yu orthogonal vanishing line with
  quadratic character of `ℚ_p(√((−1)^{(1+ap)/2}·2ap))`.
- §6.6: for `X` regular, flat of relative dimension `n` over a henselian trait and smooth outside one
  closed point, `RΦ(ℚ_ℓ)` is concentrated in degree `n` and specialization is injective in degree
  `n` when `X` is proper.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

- Layer 5: the rational Nori category, pair motives, tensor structure, Tate localization, and the
  Betti, de Rham and étale realizations (§§5.3–5.9); §2.7, the étale realization.
- What MotivesAndAlgebraicCycles must provide (gap:nori-weight-filtration): a functorial,
  finite, exhaustive increasing weight filtration on the Nori motives `H^i_c(X)` of varieties over
  `ℚ`, strictly compatible with morphisms, Tate twists and images of rational idempotents, whose
  Betti, de Rham and `ℓ`-adic realizations are the weight filtrations of the corresponding mixed
  Hodge structures and Galois representations (Huber–Müller-Stach, as cited in FSY (3.1), p. 18).
- What MotivesAndAlgebraicCycles must provide (gap:orthogonal-motive-root-number): T. Saito's
  theorem that the global root number of an orthogonal motive over `ℚ` of even weight equals `+1`,
  stated for the motives of even weight that arise from the even-degree cohomology of smooth
  projective varieties over `ℚ` through finite-group projectors and kernels of boundary restriction
  maps and carry a nondegenerate symmetric realization-compatible pairing, with the global additive
  character and measures of §10.3 (Saito-orthogonal, as invoked in FSY §5.3.3, p. 58).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

- §1.7 (semisimplification and Jordan–Hölder), §2.5 (local factors and Frobenius semisimplification),
  §2.6 (monodromy filtration, purity of Weil–Deligne representations, and purity from a pure graded:
  a `G_K`-stable filtration with pure graded Weil–Deligne representation gives a pure representation
  with the same local `L`-factor), §2.7 (local constants and their invariance under the same
  filtration), §3.3 (`a(r, N) = Sw(r) + dim V − dim (ker N)^{r(I)}`), §5.3 (recognition by Frobenius
  polynomials on a set of density one), §7.4 (polarized representations and their sign).
- What ArithmeticGaloisRepresentations must provide (gap:semisimplification-similitude-form): for a
  field `E` of characteristic zero, an `E`-algebra `A` with an `E`-linear anti-involution `*`, and a
  finite-dimensional `A`-module with a nondegenerate `*`-compatible bilinear form that is symmetric or
  alternating, the semisimplification carries a nondegenerate `*`-compatible form of the same type;
  applied to `E[G_ℚ]` with `g* = χ_cyc(g)^{−k−1}g⁻¹` (Serre-orthogonal, Theorem 4.2.1 and
  Lemma 4.2.4, pp. 9–10).

### From TauCetiRoadmap.CohomologyComparisons and PadicHodgeTheory

- CohomologyComparisons §2.13 (the filtered de Rham comparison over `K` for smooth proper
  varieties), §§3.4–3.5 (the crystalline comparison over a discretely valued base and the
  crystalline representation export), §§4.3–4.4 (the semistable comparison with `φ`, `N` and the
  filtration, and its agreement with the de Rham comparison).
- PadicHodgeTheory §3.2: the filtered linear algebra and the Hodge–Tate sign dictionary; §5.3:
  `D_pst` and Fontaine's Weil–Deligne representation, exact on potentially semistable
  representations and compatible with restriction to finite extensions.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa and FiniteFlatGroupsAndIntegralPadicHodgeTheory

- NoncommutativeAndEquivariantIwasawa §F.6, stage 3: `deRham_iff_potentiallySemistable`, for every
  finite-dimensional continuous representation of `G_K`, `K/ℚ_p` finite, every prime `p` including
  `p = 2` and arbitrary Hodge–Tate weights. PadicHodgeTheory §5.3 consumes the same theorem.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.3: `dSt_isWeaklyAdmissible`, for `K/ℚ_p` finite
  and every semistable representation `V` of `G_K`, the filtered `(φ, N)`-module `D_st(V)` is weakly
  admissible; §R07.3.2: `isWeaklyAdmissible_iff_polygon`, a filtered `(φ, N)`-module is weakly
  admissible exactly when the Newton polygon of every subobject lies on or above its Hodge polygon,
  with the same endpoints for the whole module. Assumed: the Hodge polygon is formed from the jumps of
  the de Rham filtration, as in this roadmap's convention.

### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems and ModularityAndLanglandsExtensions

- PotentialModularityAndCompatibleSystems §1.1 (weakly compatible families), §1.5 (polarized
  families), §1.6 (regularity, purity, strictness), §1.15 (`L`-functions and the Hodge recipe for
  archimedean factors, including the real sign on a middle Hodge line).
- ModularityAndLanglandsExtensions §2.42: for pure regular totally odd polarized weakly compatible
  systems over a totally real field, one finite totally real Galois extension makes every polarized
  constituent cuspidal automorphic; §2.43: for an extremely regular polarizable cuspidal
  representation the attached `ℓ`-adic representations are irreducible for a set of `ℓ` of density
  one, which discharges the premise `ExtremelyRegularIrreducibility n` of
  AutomorphicGaloisRepresentationsPartII Layer AG2.6 for every `n ≥ 2`; §2.49: such systems are
  strictly pure and their completed `L`-functions continue meromorphically with
  `Λ(R, s) = ε(R, s)Λ(R^∨, 1 − s)`.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

- Layer AG2.6, totally real polarized coefficient-prime descent: for a regular algebraic essentially
  self-dual cuspidal representation `π` of `GL_n` over a totally real field `F′`, `n ≥ 2` under the
  premise `ExtremelyRegularIrreducibility n`, and every place `v` of `F′` above the coefficient prime
  `ℓ`, the attached `ℓ`-adic representation is de Rham at `v` and
  `WD(r_{π,ℓ}|G_{F′_v})^{F-ss} ≅ rec(π_v|det|^{(1−n)/2})`, with monodromy; rank one by local class
  field theory.
- Layer AG2.5, full away-prime compatibility: the same identification at places `v` not above `ℓ`.

## How to read the build

Layer 0 defines the symmetric-power traces, moments and series, on top of Mathlib, Tau Ceti's
symmetric powers and the character sums of CharacterSumsOverFiniteFields. Layer 1 realizes them in
`ℓ`-adic cohomology on top of CongruenceSpectralGap §4.2b and computes the local monodromy of `Kl₂`
at `∞`, which fixes the degrees and boundary factors of Layer 8. Layers 2 and 3 build the characteristic-zero
Kloosterman connections in every rank and their exponential cohomology on the `D`-module and Hodge
module suppliers; Layer 4 proves classicality, introduces the moment hypersurfaces and the Nori motive,
and compares with the finite-field side. Layers 5 and 6 specialize to rank two and compute dimensions,
explicit bases, compactifications and Hodge numbers. Layer 7 builds the integral models and the Galois
realizations; Layer 8 computes their local structure, Euler factors and conductors. Layer 9 feeds the
geometric data into the `p`-adic comparison and proves that the realizations form regular polarized
compatible systems. Layer 10 computes determinants, gamma and epsilon factors and defines the
completed `L`-functions from the Euler factors that Layer 8 makes explicit; Layer 11 applies potential
automorphy, transports local factors through semisimplification, including the factor and the
Frobenius slopes at `2`, and proves the functional equations, completing the even ones at `2`. Every
subsection uses only earlier subsections. Layer 1 and Layers 2–3 are independent of each other until
§4.5 compares them.

## Layer 0: finite sums and symmetric-power moments

This layer defines the symmetric-power traces, the rank-two moments over every finite field of
characteristic `p` and their generating series, with the trace sign and the zeroth moment pinned
down. It uses Mathlib, the canonical character and the Kloosterman sum of
CharacterSumsOverFiniteFields §§0.1, 0.6 and 5.1, and the rank-two case of CongruenceSpectralGap
§4.2a.

### 0.1 Symmetric-power traces

Define `symmetricTrace t d k`, written `h_k(t, d)`, over any commutative ring by `h₀ = 1`, `h₁ = t`
and `h_{k+2} = t·h_{k+1} − d·h_k` (FSY §1.1, p. 2). The API proves the following facts.

- For elements `α, β` of a commutative ring, `h_k(α + β, αβ) = Σ_{i=0}^k αⁱβ^{k−i}`, by induction on
  the recurrence; no root of a polynomial and no division is needed. The right side is Mathlib's
  complete homogeneous symmetric polynomial `MvPolynomial.hsymm` in two variables evaluated at
  `(α, β)`; `h_k` is its expression through the elementary symmetric functions, which is what a trace
  and a determinant provide.
- A ring homomorphism commutes with every `h_k`.
- For an endomorphism `φ` of a free module of rank two over a commutative ring, the trace of the
  induced endomorphism `SymmetricPower.map φ` of the `k`-th symmetric power is `h_k(tr φ, det φ)`.
  This is a polynomial identity in the four entries of `φ`, so it suffices to prove it for the
  generic matrix over `ℤ[a, b, c, d]`, after extension to an algebraic closure of its fraction
  field, where the generic matrix has distinct eigenvalues `α, β`; there Tau Ceti's
  `Module.Basis.trace_map_symmetricPower_of_apply` gives `Σᵢ αⁱβ^{k−i}`, which is `h_k(α + β, αβ)` by
  the first bullet. Compatibility of `SymmetricPower.map` and of the trace with base change is part
  of this target.
- `h_k(2x, 1)` is the Chebyshev polynomial of the second kind `U_k` (Mathlib
  `Polynomial.Chebyshev.U`) evaluated at `x`.

**Checks.**

- `h₀(0, 0) = 1`: the constant term is not forced by the arguments.
- `h₂(3, 2) = 3·3 − 2 = 7`, the sum `4 + 2 + 1` over the roots `2, 1`, whereas `3² = 9`; a definition
  by ordinary powers of the trace fails.
- `h_k(2a, a²) = (k + 1)aᵏ`, for instance `h₃(2, 1) = 4`: coincident roots cause no division by
  `α − β`.
- `h₂ = t² − d` and `h₃ = t³ − 2dt`; with `t = −1, d = 2` these give `−1` and `3`, the values used in
  §0.2.

*Needs:* Mathlib commutative rings, `SymmetricPower`, `MvPolynomial.hsymm`, `Polynomial.Chebyshev.U`;
Tau Ceti `SymmetricPower.map`, `Module.Basis.trace_map_symmetricPower_of_apply`.

### 0.2 Kloosterman sums and moments

The rank-two Kloosterman sum is CharacterSumsOverFiniteFields §5.1's untwisted
`kloostermanSum 1 ψ 1 a = Σ_{x ∈ Fˣ} ψ(x + a/x)` for a finite field `F`, an additive character
`ψ : F → ℂ` (Mathlib `AddChar`) and `a ∈ F` (FSY (1.1), p. 2), and the character of `𝔽_{p^m}` is its
§0.1 `stdAddChar (GaloisField p m)`, `x ↦ exp(2πi·Tr_{𝔽_{p^m}/𝔽_p}(x)/p)`. `Suggested.lean` states
the headline theorems with the restatements `kloostermanSum F ψ a`, a finite sum over the units, and
`traceChar p m`, Mathlib's `ZMod.stdAddChar` composed with `Algebra.trace`; they are not second
constructions, and the identifications with the supplier's notions are part of this target. For
`a ∈ Fˣ` the sum is also CongruenceSpectralGap §4.2a's `hyperKloosterman F 2 ψ a` (the comparison of
CharacterSumsOverFiniteFields §5.1); at `a = 0` it is `Σ_{x ∈ Fˣ} ψ(x)`, a value outside that
comparison, which the moments never use. Define the `k`-th moment
`moment p k m = Σ_{a ∈ 𝔽_{p^m}ˣ} h_k(−Kl₂(a), p^m)` with `Kl₂(a) = kloostermanSum` for `traceChar p m`
(FSY §1.1, pp. 2–3). The sign makes `−Kl₂(a)` the sum `α_a + β_a` of the Frobenius eigenvalues
(§1.4), whose product is `p^m`. The API proves the following facts.

- `kloostermanSum F ψ a = kloostermanSum 1 ψ 1 a` of CharacterSumsOverFiniteFields §5.1 for every
  `a ∈ F`, and `traceChar p m = stdAddChar (GaloisField p m)` of its §0.1; hence `traceChar p m` is
  nontrivial (its §0.1), `Kl₂(a; ψ)` is real for every `ψ` (its §5.1 conjugation law), and for the
  trivial character `Kl₂(a) = q − 1` for every `a` (its §5.6), a value excluded from every purity
  statement.
- Tower law. Let `m, m′ ≥ 1` with `m ∣ m′`, let `ι : 𝔽_{p^m} → 𝔽_{p^{m′}}` be an `𝔽_p`-algebra
  embedding (one exists by Mathlib `FiniteField.nonempty_algHom_of_finrank_dvd` and
  `GaloisField.finrank`), and let `Tr_ι : 𝔽_{p^{m′}} → 𝔽_{p^m}` be the trace of `𝔽_{p^{m′}}` regarded
  as an `𝔽_{p^m}`-algebra through `ι`. Then `traceChar p m′ = traceChar p m ∘ Tr_ι`: this is
  CharacterSumsOverFiniteFields §0.6 for that algebra structure, the tower
  `𝔽_p → 𝔽_{p^m} → 𝔽_{p^{m′}}` being a scalar tower because `ι` is `𝔽_p`-linear (Mathlib
  `Algebra.trace_trace`).
- Restriction along `ι` is a power: `traceChar p m′ (ι x) = (traceChar p m x)^{m′/m}` for every
  `x ∈ 𝔽_{p^m}`, because `Tr_ι(ι x) = (m′/m)·x` (Mathlib `Algebra.trace_algebraMap`, the relative
  degree being `m′/m` by `Module.finrank_mul_finrank` and `GaloisField.finrank`) and
  `AddChar.map_nsmul_eq_pow`. So the restricted character does not depend on `ι`, and it is trivial
  exactly when `p ∣ m′/m`. On elements, with `𝔽_{p^m}` identified with `ι(𝔽_{p^m})`,
  `Tr_ι(y) = Σ_{0 ≤ i < m′/m} y^{p^{mi}}` (Mathlib `FiniteField.algebraMap_trace_eq_sum_pow`).
- Replacing `ψ` by `ψ(c·)` for `c ∈ Fˣ` replaces `Kl₂(a)` by `Kl₂(c²a)`, by the unit scaling law of
  CharacterSumsOverFiniteFields §5.1; so the moment, a sum over all `a ∈ Fˣ`, is unchanged.
- A field isomorphism carrying `ψ` to `ψ′` preserves the moments, by the field-isomorphism law of
  CongruenceSpectralGap §4.2a at unit parameters.
- The zeroth moment is `q − 1`, and the first moment is `−1` for every nontrivial `ψ`: summing
  `ψ(a/x)` over `a ∈ Fˣ` gives `−1`, and then `Σ_x ψ(x) = −1`.
- The second moment is `−1` for every nontrivial `ψ`. Expanding the square,
  `Σ_{a ∈ Fˣ} Kl₂(a)² = Σ_{x, y ∈ Fˣ} ψ(x + y)·Σ_{a ∈ Fˣ} ψ(a(x⁻¹ + y⁻¹))`, and the inner sum is `q − 1`
  when `y = −x` and `−1` otherwise, so the total is `q(q − 1) − (Σ_x ψ(x))² = q(q − 1) − 1`; since
  `h₂(t, q) = t² − q`, the second moment is `q(q − 1) − 1 − q(q − 1) = −1`.

**Checks.**

- Over `𝔽₂` with `ψ(1) = −1`, `Kl₂(1) = ψ(1 + 1) = ψ(0) = 1`, so `−Kl₂(1) = −1`, `d = 2`, and the
  moments for `k = 1, 2, 3` are `h₁ = −1`, `h₂ = 1 − 2 = −1` and `h₃ = −1 + 4 = 3`.
- Over `𝔽₃` with `ψ(1) = e^{2πi/3}`, `Kl₂(1) = ψ(2) + ψ(1) = −1` and `Kl₂(2) = ψ(0) + ψ(0) = 2`; the first
  moment is `1 + (−2) = −1`, agreeing with the general value.
- The zeroth moment over `𝔽₃` is `2`; a definition summing over all `a ∈ 𝔽₃`, including `a = 0`,
  would give `3`.
- With the trivial character over `𝔽₅`, `Kl₂(a) = 4` for every unit and the first moment is
  `−16`, not `−1`; the first-moment value needs `ψ ≠ 1`.
- The zero parameter is outside the product-fibre comparison: over `𝔽₂` with `ψ(1) = −1`,
  `Kl₂(0) = ψ(1) = −1`, whereas the fibre `{x₁x₂ = 0}` in `(𝔽₂ˣ)²` is empty and its sum is `0`; at
  `a = 1` both presentations give `ψ(0) = 1`.
- Tower law over `𝔽₄/𝔽₂` (`m = 1`, `m′ = 2`): `Tr_ι(ι 1) = 1 + 1² = 0`, so
  `traceChar 2 2 (ι 1) = traceChar 2 1 (0) = 1` and the character of `𝔽₄` restricts to the trivial
  character of `𝔽₂`, while `traceChar 2 1 (1) = −1`; the power law reads `1 = (−1)²`. A tower law
  stated as plain restriction, `traceChar p m′ ∘ ι = traceChar p m`, fails here.
- Over `𝔽₉/𝔽₃` at `1`, with `ζ₃ = e^{2πi/3}`: `Tr_ι(ι 1) = 1 + 1³ = 2`, so
  `traceChar 3 2 (ι 1) = traceChar 3 1 (2) = ζ₃² = (traceChar 3 1 (1))²`; as `3 ∤ 2` the restriction
  is nontrivial, but it is the square of the smaller character, not that character (`ζ₃² ≠ ζ₃`).
- Degree one with a nonidentity embedding: for `m′ = m` and `ι` the Frobenius `x ↦ x^p`, `Tr_ι` is
  `ι⁻¹`, not the identity, and both laws say `traceChar p m (x^p) = traceChar p m x`. In
  `𝔽₄ = 𝔽₂(ω)` with `ω² = ω + 1`, `Tr(ω) = ω + ω² = 1` and `Tr(ω²) = ω² + ω⁴ = ω² + ω = 1`, so both
  values are `−1`.
- The exponent needs `m′ ≥ 1`: `GaloisField p 0` is the splitting field of the zero polynomial
  `X^{p⁰} − X`, hence `𝔽_p` of degree `1`. For `m = 1`, `m′ = 0` one has `1 ∣ 0` and an embedding
  `ι` exists, but the relative degree is `1`, not `0/1 = 0`, and
  `traceChar p 0 (ι 1) = e^{2πi/p} ≠ 1 = (traceChar p 1 (1))⁰`. The composition law
  `traceChar p m′ = traceChar p m ∘ Tr_ι` holds here too.

*Needs:* Mathlib `AddChar`, `AddChar.map_nsmul_eq_pow`, `ZMod.stdAddChar`, `GaloisField`,
`GaloisField.finrank`, `FiniteField.nonempty_algHom_of_finrank_dvd`, `Algebra.trace`,
`Algebra.trace_trace`, `Algebra.trace_algebraMap`, `Module.finrank_mul_finrank`,
`FiniteField.algebraMap_trace_eq_sum_pow`; §0.1; CharacterSumsOverFiniteFields §§0.1, 0.6, 5.1
and 5.6 (the canonical character, its trace compatibility, the Kloosterman sum and its
conjugation, scaling and degenerate values); CongruenceSpectralGap §4.2a (field-isomorphism law and
the identification with `hyperKloosterman` at unit parameters).

### 0.3 The moment generating series

Define `momentSeries p k = exp(Σ_{m ≥ 1} m₂ᵏ(p^m) T^m/m)` in `ℂ⟦T⟧`, written `Z_k(p; T)`, by
substituting the series with zero constant coefficient into Mathlib's `PowerSeries.exp`
(FSY §1.1, pp. 2–3). No analytic convergence is used. The API proves the following facts.

- The constant coefficient is `1`, and `T·Z′ = Z·Σ_{m ≥ 1} m₂ᵏ(p^m) T^m`; equivalently
  `n·c_n = Σ_{j=1}^n m₂ᵏ(p^j) c_{n−j}` for the coefficients `c_n`.
- `[T]Z = m₂ᵏ(p)` and `[T²]Z = (m₂ᵏ(p)² + m₂ᵏ(p²))/2`.
- For `k = 0`, `Z₀(p; T) = (1 − T)/(1 − pT)`, since `m₂⁰(p^m) = p^m − 1`; this series is not a
  polynomial, so polynomiality (§8.2) is a statement about `k ≥ 1` only.
- For `k = 1`, `Z₁(p; T) = 1 − T` for every `p`, by the first-moment value of §0.2.
- For `k = 2`, `Z₂(p; T) = 1 − T` for every `p`, by the second-moment value of §0.2.

**Checks.**

- For `p = 2` and `k = 3` the moments over `𝔽₂, 𝔽₄, 𝔽₈` give
  `Z₃(2; T) = (1 − T)(1 + 4T) = 1 + 3T − 4T²`; the coefficient of `T` is `3`, matching §0.2, and the coefficient of `T²` forces
  `m₂³(4) = 2·(−4) − 9 = −17`.
- For `k = 0` the coefficient of `T²` is `p² − p ≠ 0`, and every higher coefficient is nonzero.
- For `p = 3` and `k = 4`, the moments give `Z₄(3; T) = 1 − 10T + 9T² = (1 − T)(1 − 9T)`, whereas for
  `p = 2` they give `Z₄(2; T) = 1 − T`; the two primes have different trivial factors (§8.2).
- For `p = 2` and `k = 12`, `Z₁₂(2; T) = 1 − T − 4096T² + 4096T³ = (1 − T)(1 − 64T)(1 + 64T)`; a
  definition with `(α + β)^k` in place of `h_k` gives a series that is not a polynomial.

*Needs:* Mathlib `PowerSeries`, `PowerSeries.exp`, `PowerSeries.subst`; §0.2.

### Examples

- Over `𝔽₅` with `k = 3`: the moments give `Z₃(5; T) = (1 − T)(1 + 25T)`, matching
  `(1 − T)(1 − (5/3)·5²T)` with the Legendre symbol `(5/3) = −1`.
- Over `𝔽₃` with `k = 5`: `Z₅(3; T) = 1 + 26T − 27T² = (1 − T)(1 + 27T)`.

### Dependencies

Mathlib and Tau Ceti (symmetric powers of modules). Other roadmaps: CharacterSumsOverFiniteFields
(§§0.1, 0.6, 5.1, 5.6) and CongruenceSpectralGap (§4.2a, at unit parameters).

## Layer 1: Kloosterman sheaves and their moments

This layer works with rational `ℓ`-adic coefficients over finite fields of characteristic `p ≠ ℓ`,
with a coefficient field containing the values of `ψ`. The Kloosterman sheaf `Kl_r` of every rank is
CongruenceSpectralGap §4.2b's; this layer normalizes it, completes its local description,
determines its monodromy, and computes the cohomology of `Sym^k Kl₂`.

### 1.1 The projection presentation and the normalized Kloosterman sheaves

Prove that for `r ≥ 2`, with `f(x, z) = Σ_{i<r} xᵢ + z/Πᵢ xᵢ` on `𝔾_m^{r−1} × 𝔾_m` and `π` the
projection to `z`, the shifted compact direct image `Rπ_! f^*L_ψ[r − 1]` is canonically isomorphic to
CongruenceSpectralGap §4.2b's `Kl_r`, through the isomorphism
`(x, z) ↦ (x₁, …, x_{r−1}, z/Πᵢ xᵢ)` which carries `π` to multiplication, and that the forget-supports
map `Rπ_! → Rπ_*` is an isomorphism here (FSY §1.2, p. 5; §3.2.1, pp. 23–24; XZ §1.1.2, p. 3).

Choose `c ∈ ℚ̄_ℓ` with `c² = p` once, and let `χ_c` be the unramified character of `Gal(𝔽̄_p/𝔽_p)`
with value `c^{−(r−1)}` at geometric Frobenius. Define the normalized sheaf `Kl_r⁰ = Kl_r ⊗ χ_c`.
Over `𝔽_{p^m}` its trace at `a` is `(−1)^{r−1} c^{−m(r−1)} Kl_r(a; p^m)`, where `Kl_r` denotes the
raw sum, and it is pure of weight zero (XZ §1.1.2, (1.1.2.1)–(1.1.2.3), p. 3). For odd `r` it is the
integral Tate twist `Kl_r((r − 1)/2)`; for even `r` it depends on `c`. The API proves the following
facts.

- The normalized trace over `𝔽_{p^m}` uses `c^m`, the restriction of `χ_c`; no square root is chosen
  separately over an extension.
- Replacing `c` by `−c` tensors `Kl_r⁰` with the unramified character `(−1)^{r−1}` at Frobenius.
- Base change to `𝔽_{p^m}` commutes with the normalization.
- `Kl_r⁰` is pure of weight zero, by the purity of weight `r − 1` of CongruenceSpectralGap §4.2b.

**Checks.**

- In rank two over `𝔽₂` at `a = 1`, the trace of `Kl₂` is `−1` and that of `Kl₂⁰` is `−1/c`; dropping
  the sign would give `+1/c`.
- In rank three, `Kl₃⁰ = Kl₃(1)`: geometric Frobenius on `ℚ_ℓ(1)` is `p⁻¹`, and `c^{−2} = p⁻¹`.
- For even `r` the degree-one trace changes sign under `c ↦ −c`; for odd `r` it is unchanged.
- At `r = 1` the projection presentation degenerates to `L_ψ` on `𝔾_m`; this rank is outside every
  statement of §1.3.

*Needs:* CongruenceSpectralGap §4.2b (`L_ψ`, `Kl_r`, purity); EtaleCohomologyFoundations §§F.2.4–F.2.7.

### 1.2 Local structure and the rank-two pairing

**Theorem.** Let `r ≥ 2`, `p` prime, `ℓ ≠ p` and `ψ` nontrivial. Then `Kl_r` is geometrically
irreducible; its local monodromy at `0` is unipotent with a single Jordan block of size `r`; and its
determinant is geometrically constant. For `r = 2` there is a perfect alternating
`Gal(𝔽̄_p/𝔽_p)`-equivariant pairing `Kl₂ × Kl₂ → ℚ_ℓ(−1)`, so `det Kl₂ = ℚ_ℓ(−1)` and the Frobenius
eigenvalues at `a ∈ 𝔽_qˣ` satisfy `α_aβ_a = q` and `|ι(α_a)| = |ι(β_a)| = q^{1/2}` for every embedding
`ι` (FSY §1.2, pp. 4–5, and §3.2.1, p. 24; XZ §1.1.2 (i)–(iv), p. 3). The rank, tameness at `0`,
Swan conductor one at `∞` and purity are CongruenceSpectralGap §4.2b's.

*Proof sketch.* At `∞` the local monodromy is totally wild of rank `r` with Swan conductor one, so
its only break is `1/r`; a break with denominator `r` on a representation of rank `r` forces the
inertia representation to be irreducible, hence `Kl_r` is geometrically irreducible. At `0` inertia
acts unipotently (the tame zero-boundary assertion of CongruenceSpectralGap §4.2b, with the
specialization argument given there). The local invariants at `0` inject into `H¹_c(𝔾_m, Kl_r)`
because `H⁰ = 0` and the invariants at `∞` vanish; by the curve Euler–Poincaré formula
`dim H¹_c = Sw_∞ = 1`, so there is exactly one Jordan block. The pairing comes from
`𝔻L_ψ = [−1]^*L_ψ` and Poincaré duality on the fibres of the projection presentation of §1.1.

**Checks.**

- A rank-two fibre at `a` has trace `−Kl₂(a)` and determinant `q`; over `𝔽₂` at `a = 1` the
  characteristic polynomial is `1 + T + 2T²`, with roots of absolute value `2^{−1/2}`. It is the
  Kloosterman `L`-polynomial `1 + K(1; 1, 1)T + qT²` of CharacterSumsOverFiniteFields §5.4; a
  determinant `−q`, as in `1 + KT − qT²`, would give real roots of absolute values other than
  `2^{−1/2}`.
- For the trivial character the corresponding direct image is not irreducible: its trace is
  `(−1)^{r−1}(q − 1)^{r−1}` and its weights are mixed, so the statement needs `ψ ≠ 1`.
- A sheaf with the same rank and lissity, `L_ψ(1/t) ⊕ ℚ_ℓ`, is wild at `0`; the single unipotent block
  excludes it.

*Needs:* §1.1; CongruenceSpectralGap §4.2b (`Kl_r`, curve Euler–Poincaré); EtaleCohomologyFoundations
§F.5 (duality); DeligneWeightsAndPurity §8.14 (geometric monodromy); CharacterSumsOverFiniteFields
§5.4 (the elementary `L`-polynomial, for the Checks).

### 1.3 Monodromy groups

**Theorem.** For `r ≥ 2`, the geometric and arithmetic monodromy groups of `Kl_r⁰`, as algebraic
groups over `ℚ̄_ℓ` in the `r`-dimensional representation, coincide and are: `Sp_r` if `r` is even;
`SL_r` if `p` and `r` are odd; `SO_r` if `p = 2`, `r` is odd and `r ≠ 7`; and `G₂` in its
seven-dimensional representation if `p = 2` and `r = 7` (Katz, as recorded in XZ §1.1.2,
(1.1.2.3), p. 3; FSY §3.2.1, p. 24).

*Proof sketch.* The geometric monodromy is Katz's theorem; the arithmetic group lies between the
geometric group and its normalizer in `GL_r`, and the weight-zero normalization makes the
determinant, respectively the pairing multiplier, trivial, so the two groups agree.

**Checks.**

- `r = 7`, `p = 2` gives `G₂`, not `SO₇`.
- For `p = 2` and odd `r ≥ 3`, `Sym²` of the standard orthogonal representation contains the
  invariant quadratic form; one cannot discard the invariants of `Sym^k` in these cases, and §1.4
  keeps the full trace formula there.
- For `r = 2` the group is `Sp₂ = SL₂`, so every `Sym^k` with `k ≥ 1` is geometrically irreducible
  without invariants.

*Needs:* §§1.1–1.2; DeligneWeightsAndPurity §§8.14, 8.19 (geometric monodromy and semisimplicity).

### 1.4 Cohomology of the moments

**Theorem.** Let `k ≥ 1` and `ℓ ≠ p`. Then `H^i_c(𝔾_{m,𝔽̄_p}, Sym^k Kl₂)` and
`H^i(𝔾_{m,𝔽̄_p}, Sym^k Kl₂)` vanish for `i ≠ 1`, and with geometric Frobenius `F_p`,
`Z_k(p; T) = det(1 − F_p T | H¹_c(𝔾_{m,𝔽̄_p}, Sym^k Kl₂))` (FSY (1.5), p. 5). The middle space
`H¹_mid = im(H¹_c → H¹)` is pure of weight `k + 1`, and the cup product with the pairing of §1.2 makes
it self-dual with values in `ℚ_ℓ(−k − 1)`. In rank `r ≥ 2` the same concentration in degree one holds
for `Sym^k Kl_r` when `p` is odd or `r` is even; in the remaining cases the alternating trace formula
over all degrees is kept (FSY §1.2, pp. 4–5; §3.2.1, pp. 23–25).

*Proof sketch.* `H⁰` vanishes because `Sym^k Kl₂` is geometrically irreducible and nontrivial
(§1.3), and `H²_c` by duality. The trace of `F_p^m` at `a` on `Sym^k Kl₂` is `h_k(−Kl₂(a; p^m), p^m)`
by §§0.1 and 1.2; the rational trace formula of InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3
then gives `m₂ᵏ(p^m) = −tr(F_p^m | H¹_c)`, the sign coming from the odd degree, and since
`log det(1 − F_pT | H¹_c) = −Σ_m tr(F_p^m | H¹_c)T^m/m` this is
`Σ_m m₂ᵏ(p^m)T^m/m = log det(1 − F_pT | H¹_c)`; exponentiating gives the displayed `Z_k`. Purity of the image is
DeligneWeightsAndPurity §7.12 (iii), since `Sym^k Kl₂` is lisse and pure of weight `k`.

**Checks.**

- At `k = 0`, `H²_c = ℚ_ℓ(−1)` survives and the determinant formula becomes `(1 − T)/(1 − pT)`, the
  series of §0.3.
- Sign of the logarithm at `k = 1`: every moment is `−1`, so `Σ_m m₂¹(p^m)T^m/m = −T − T²/2 − ⋯ =
  log(1 − T)`, and `H¹_c` is a line with Frobenius `1`, so `det(1 − F_pT | H¹_c) = 1 − T = Z₁`; with
  `−log` in place of `log` one would get `(1 − T)⁻¹`, whose `T`-coefficient `+1` contradicts the first
  moment `−1`.
- The pairing pairs a reciprocal root `α` with `p^{k+1}/α`; at `k = 3`, `p = 2` the root `−4` is its
  own partner, `16/(−4) = −4`, whereas `p^{(k+1)/2}/α = −1` would not be a root.
- The Euler characteristic `−dim H¹_c` equals `−Sw_∞(Sym^k Kl₂)` by the curve Euler–Poincaré formula,
  since `Sym^k Kl₂` is tame at `0`.

*Needs:* §§0.3, 1.2–1.3; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3;
DeligneWeightsAndPurity §7.12; CongruenceSpectralGap §4.2b (curve Euler–Poincaré);
EtaleDualityAndPerverseSheaves §3.3; EtaleCohomologyFoundations §F.5.

### 1.5 Integrality and character independence

**Theorem.** For every prime `p`, `k ≥ 1` and `m ≥ 1`, `m₂ᵏ(p^m)` is a rational integer independent
of the choice of the nontrivial additive character of `𝔽_p`, and `Z_k(p; T)` is a polynomial with
integer coefficients and constant term `1` (FSY §1.1, pp. 2–3, and (1.5), p. 5). The degree is
computed in §8.2, where the combined statement is `momentSeries_eq_intPolynomial`.

*Proof sketch.* Any other nontrivial character of `𝔽_p` is `ψ(c·)` with `c ∈ 𝔽_pˣ`, which leaves the
moments unchanged by §0.2; the Galois group of `ℚ(ζ_p)/ℚ` permutes these characters, so the moments
are rational, and they are algebraic integers. By §1.4, `Z_k` is the reciprocal characteristic
polynomial of an endomorphism of a finite-dimensional space; its coefficients are algebraic
integers fixed by `Gal(ℚ̄/ℚ)`, since the moments are rational, hence integers.

**Checks.**

- `Z₁ = Z₂ = 1 − T` for every `p`.
- `Z₃(p; T) = (1 − T)(1 − (p/3)p²T)` with `(3/3) = 0`; at `p = 2` this is `(1 − T)(1 + 4T)`,
  agreeing with the first moment `3`.
- `Z₄(p; T) = 1 − T` for `p = 2` and `(1 − T)(1 − p²T)` for odd `p`.

*Needs:* §§0.2–0.3, 1.4; Mathlib `AddChar.sum_eq_ite`.

### 1.6 Local monodromy of `Kl₂` at `∞`

Let `p` be a prime, `ℓ ≠ p`, `ψ` a nontrivial additive character of `𝔽_p`, `D_∞ ⊃ I_∞ ⊃ P_∞` the
decomposition, inertia and wild inertia groups at `∞ ∈ ℙ¹_{𝔽_p}`, and `ρ` the representation of `D_∞`
on `Kl₂` near `∞`. Breaks, lower ramification groups and Swan conductors are those of
ArithmeticGaloisRepresentations §3.1.

**Theorem.** The group `ρ(I_∞)` is a finite subgroup of `SL₂(ℚ̄_ℓ)` that acts irreducibly and
contains `−1`. For odd `p`, `ρ(P_∞)` is cyclic of order `p` and lies in a maximal torus `T`, and
`ρ(I_∞) = ρ(P_∞) ⋊ ⟨w⟩` for an element `w` of the normalizer of `T` outside `T`, so that `w² = −1`
(Yun-moments §2.3.4, p. 12). For `p = 2`, `ρ(I_∞)` is the binary tetrahedral group `2.A₄ ≅ SL₂(𝔽₃)`
of order `24`, `ρ(P_∞)` is the quaternion group `Q₈`, the lower ramification filtration of the image
is `D₀ = 2.A₄ ⊃ D₁ = Q₈ ⊃ D₂ = D₃ = {±1} ⊃ D₄ = 1`, and a lift of geometric Frobenius maps to `c·φ₁`
with `c² = 2` and `φ₁` in the binary octahedral group `2.S₄` but not in `2.A₄` (Yun-moments
§§4.3.1–4.3.2, pp. 36–37). Consequently, for every `k ≥ 1`:

- `(Sym^k Kl₂)^{I_∞} = 0` for odd `k`, since `−1` acts by `−1`;
- `Sw_∞(Sym^k Kl₂)` is `(k + 1)/2 − ⌊(k + p)/(2p)⌋` for odd `k` and odd `p`, `k/2 − ⌊k/(2p)⌋` for even
  `k` and odd `p`, `(k + 1)/2` for odd `k` and `p = 2`, and `⌊(k + 2)/4⌋` for even `k` and `p = 2`;
- for even `k`, `(Sym^k Kl₂)^{I_∞}` has dimension `⌊k/(2p)⌋ + δ_{4∣k}` for odd `p`, and for `p = 2`
  dimension `⌊k/12⌋ + 1` if `k ≡ 0, 6, 8 (mod 12)` and `⌊k/12⌋` if `k ≡ 2, 4, 10 (mod 12)`;
- geometric Frobenius acts semisimply on `(Sym^k Kl₂)^{I_∞}` with eigenvalues of absolute value
  `p^{k/2}` under every embedding `ι`; for `p = 2` the eigenvalues are `2^{k/2}` with multiplicity `a_k`
  and `−2^{k/2}` with multiplicity `b_k`, where `a_k = ⌊k/24⌋ + 1` for
  `k ≡ 0, 8, 12, 16, 18, 20 (mod 24)` and `⌊k/24⌋` otherwise, and `b_k = ⌊k/24⌋ + 1` for
  `k ≡ 6, 12, 14, 18, 20, 22 (mod 24)` and `⌊k/24⌋` otherwise (Yun-moments Lemmas 4.3.3–4.3.4,
  pp. 37–39);
- `(Sym^k Kl₂)^{I₀}` is a line on which geometric Frobenius acts by `1`.

*Proof sketch.* By §1.2, `det ρ` is unramified with Frobenius `p`, so `ρ(I_∞) ⊂ SL₂`. Swan conductor
one in rank two with no tame part (CongruenceSpectralGap §4.2b) forces both breaks to equal `1/2`;
an `I_∞`-stable line would have an integral break, so `ρ|I_∞` is irreducible, its monodromy logarithm
vanishes and `ρ(I_∞)` is finite. Finite subgroups of `SL₂(ℚ̄_ℓ)` are classified by McKaySkewGroup
§0.2, transported from `ℂ`: the entries of the finitely many matrices in play generate a finitely
generated subfield of `ℚ̄_ℓ`, a finite extension of a rational function field over `ℚ` in finitely
many variables, which embeds into `ℂ` because `ℂ` is algebraically closed of infinite transcendence
degree over `ℚ`; isomorphism types, subgroups, normalizers and the defining representation are
preserved. Since `I_∞/P_∞` is procyclic of order prime to `p`, `ρ(P_∞)` is the normal Sylow
`p`-subgroup of `ρ(I_∞)` and the quotient is cyclic. For odd `p`, `ρ(P_∞)` has odd order, so it is
cyclic and lies in a maximal torus (McKaySkewGroup §0.2), and the tame quotient acts on it through
a Coxeter element of the Weyl group of `SL₂`. For `p = 2`, `ρ(P_∞)` is a nontrivial `2`-group, since
`Kl₂` is wild at `∞`, so it contains `−1`, the only element of order two in `SL₂`. Hence `ρ(I_∞)` is
the full preimage of `Ḡ = ρ(I_∞)/{±1}`, which is cyclic, dihedral, `A₄`, `S₄` or `A₅` (McKaySkewGroup
§0.2, through a conjugate in `SU(2)` and its image in `SO(3)`) and has a normal Sylow `2`-subgroup
with odd cyclic quotient. `S₄` and `A₅` have no normal Sylow `2`-subgroup; a cyclic `Ḡ` would make
`ρ(I_∞)` abelian and `ρ|I_∞` reducible; a dihedral `Ḡ` with normal Sylow `2`-subgroup is a
`2`-group, and it would make `Sw_∞(Sym² Kl₂) ≥ 2`, against
`Sw_∞(Sym² Kl₂) = dim H¹_c(𝔾_m, Sym² Kl₂) = deg Z₂ = 1` (§1.4 and `Z₂ = 1 − T` of §0.3). So
`Ḡ = A₄`, `ρ(I_∞)` is the binary tetrahedral group, conjugate to the model of McKaySkewGroup §0.1,
and `ρ(P_∞) = Q₈` is the preimage of the Klein four-group; `Sw_∞(Kl₂) = 1` then fixes the lower
filtration. The normalizer of `2.A₄` in `SL₂` is finite (its centralizer is `{±1}` by
irreducibility) and contains the binary octahedral group `2.S₄` of McKaySkewGroup §0.1, in which
`2.A₄` has index two; by §0.2 there it equals `2.S₄`, since cyclic and binary dihedral groups have
an abelian subgroup of index at most two, which `2.S₄` lacks, and the binary icosahedral group has
order `120`, not divisible by `48`. `φ₁` normalizes `2.A₄`, and its conjugation action inverts the
image of a tame generator in `2.S₄/Q₈ ≅ S₃`, so `φ₁ ∉ 2.A₄`. The Swan conductors of `Sym^k` follow
from the breaks (odd `p`: the weights `i` of `T` on `Sym^k` with `p ∤ i` have break `1/2` and the
others are `ρ(P_∞)`-invariant) and from the lower filtration (`p = 2`). For even `k` the invariants are counted
on the weights `i ∈ 2pℤ`, which `w` pairs `i ↔ −i`, plus the weight-zero line, on which `w` acts by
`(−1)^{k/2}` (odd `p`), and by averaging characters over `2.A₄` and over the coset `φ₁·2.A₄` (`p = 2`).
The normalizer of the finite irreducible group `ρ(I_∞)` in `SL₂` is finite, so a Frobenius lift is
`c·φ₁` with `c² = p` and `φ₁` of finite order, whence semisimplicity and the absolute values. At `0`,
`Sym^k` of one unipotent block of rank two (§1.2) has a one-dimensional invariant space, the `k`-th
power of the invariant line of `Kl₂`; that line is `H¹_c(𝔾_m, Kl₂)`, because the invariants at `∞`
vanish, and `Z₁ = 1 − T` (§0.3, with §1.4) gives its Frobenius `1`.

**Checks.**

- `p = 2`, `k = 1`: the lower filtration gives
  `Sw_∞(Kl₂) = Σ_{j ≥ 1}(2 − dim Kl₂^{D_j})/[D₀ : D_j] = 2/3 + 2/12 + 2/12 = 1`, matching
  CongruenceSpectralGap §4.2b; a longer filtration with `D₂ = D₃ = D₄ = {±1}` would give
  `2/3 + 3·(2/12) = 7/6 ≠ 1`.
- `p = 2`, `k = 12`: the invariants have dimension `⌊12/12⌋ + 1 = 2` and `a₁₂ = b₁₂ = 1`, so the
  eigenvalues are `64` and `−64`, and `Sw_∞ = ⌊14/4⌋ = 3`; the moments give
  `Z₁₂(2; T) = 1 − T − 4096T² + 4096T³ = (1 − T)(1 − 64T)(1 + 64T)`, of degree `3`. Reading the invariant
  lines as twisted by `ℚ_ℓ(6)` would give eigenvalues `±2^{−6}`, which do not occur.
- `p = 3`, `k = 6`: the weights of `T` are `−6, −4, …, 6`, of which `−6, 0, 6` are divisible by `3`, so
  `Sw_∞ = (7 − 3)/2 = 2 = deg Z₆(3; T)`; `w` swaps the weights `±6` and acts by `(−1)³ = −1` on weight
  `0`, so the invariants form one line, and `Z₆(3; T) = (1 − T)(1 + 27T)` shows its eigenvalue `−27`, of
  absolute value `3³`.
- `k = 3`: the invariants at `∞` vanish at every `p`; at `p = 2`, `Z₃(2; T) = (1 − T)(1 + 4T)` has no
  reciprocal root of absolute value `2^{3/2}`.

*Needs:* §§0.3, 1.2, 1.4–1.5; CongruenceSpectralGap §4.2b (Swan conductor one, tameness at `0`, curve
Euler–Poincaré); ArithmeticGaloisRepresentations §3.1 (breaks and Swan conductors of representations
with finite wild image); McKaySkewGroup §0.1 (the binary tetrahedral and octahedral models) and
§0.2 (classification and conjugacy of finite subgroups of `SL₂(ℂ)` and of `SO₃`).

### Examples

- `Z₅(2; T) = 1 − 5T + 68T² − 64T³ = (1 − T)(1 − 4T + 64T²)`; the quadratic factor has
  discriminant `16 − 256 < 0` and reciprocal roots of absolute value `8 = 2^{(5+1)/2}`.
- `Z₇(3; T) = (1 − T)(1 − 90T + 6561T²)`, with reciprocal roots of absolute value `81 = 3^4`.

### Dependencies

Layer 0. Other roadmaps: CongruenceSpectralGap, EtaleCohomologyFoundations,
InverseGaloisAndArithmeticFundamentalGroups, EtaleDualityAndPerverseSheaves, DeligneWeightsAndPurity,
ArithmeticGaloisRepresentations, McKaySkewGroup, CharacterSumsOverFiniteFields.

## Layer 2: Kloosterman connections in every rank

Throughout this layer `K` is a field of characteristic zero, `θ = z∂_z` on `𝔾_m = Spec K[z, z⁻¹]`,
and `D`-modules are left modules over the operator sheaf of ComplexComparisonPartII §C5.1, with
SpringerResolutionAndCharacteristicCycles §9.1's direct-image normalization. The objects are the de Rham counterparts of the sheaves of Layer 1.

### 2.1 Kloosterman connections

For `r = n + 1 ≥ 2` let `f_r(x, z) = Σ_{i=1}^n xᵢ + z/Πᵢ xᵢ` on `𝔾_m^n × 𝔾_m` and `π` the projection to
`z`. Define the Kloosterman connection `Kl_r = H⁰π_+E^{f_r}`, the relative exponential direct image
of MixedHodgeModulesAndIrregularHodgeTheory §2.1, normalized so that it is a connection in degree
zero, and prove that the other cohomology modules of `π_+E^{f_r}` vanish and that `Kl_r` is
isomorphic to the cyclic module `D_{𝔾_m}/D_{𝔾_m}(θ^r − z)`; it is defined over `ℚ` (FSY §2.1,
Proposition 2.4 and Lemma 2.5, pp. 10–12). The API proves the following facts.

- The underlying `O_{𝔾_m}`-module of `Kl_r` is free of rank `r`, with basis the classes of
  `1, θ, …, θ^{r−1}` in the cyclic presentation.
- Extension of the characteristic-zero field commutes with the construction and with the cyclic
  isomorphism.
- Replacing `f_r` by `−f_r` replaces `Kl_r` by its pullback along `z ↦ (−1)^r z`.
- The construction is the exponential direct image itself; the operator presentation is a theorem
  about it, computed by the Koszul reduction of the relative twisted de Rham complex.

**Checks.**

- For `r = 2` the classes `1, θ` form a basis and `θ² = z` on the generator.
- For `r = 2` the formal slopes at `∞` are `1/2, 1/2`, so no regular singular connection is
  isomorphic to `Kl₂`.
- With `E^f = (O, d + df)` the cyclic equation is `θ^r − z`; using `d − df` would give
  `θ^r − (−1)^r z`, which differs for odd `r`.

*Needs:* ComplexComparisonPartII §C5.1 (differential operators); SpringerResolutionAndCharacteristicCycles
§§9.1 and 9.4 (transfer and duality, holonomic modules); MixedHodgeModulesAndIrregularHodgeTheory
§2.1 (exponential twist).

### 2.2 The cyclic cover

For `r ≥ 2` let `[r] : 𝔾_{m,t} → 𝔾_{m,z}` be `z = t^r` and define `K̃l_r = [r]⁺Kl_r`. Under
`xᵢ = t·yᵢ` the pulled-back potential is `t·g_r(y)` with `g_r(y) = Σᵢ yᵢ + 1/Πᵢ yᵢ`; the deck group
`μ_r` acts by `(t, y) ↦ (ζt, ζ⁻¹y)`, and `Kl_r` is recovered from `K̃l_r` by finite étale descent
(FSY §2.1, pp. 10–12; §3.1, pp. 21–22). The `μ_r`-action is defined over `ℚ` as an action of the
group scheme. The API proves the following facts.

- `K̃l_r` has rank `r`, not `r²`.
- The potential `t·g_r(y)` is invariant under `(t, y) ↦ (ζt, ζ⁻¹y)`.
- The `μ_r`-equivariant structure descends `K̃l_r` to `Kl_r`, compatibly with the cyclic presentation:
  on `z = t^r`, `θ_z = (1/r)·t∂_t`.

**Checks.**

- For `r = 2`, `x + z/x` becomes `t(y + y⁻¹)` under `z = t²`, `x = ty`, and is invariant under
  `(t, y) ↦ (−t, −y)`.
- For `r = 3`, scaling `y` by `ζ` instead of `ζ⁻¹` multiplies `t·g₃` by `ζ²` on the term `t·y₁` and
  breaks invariance.
- `dz/z = r·dt/t`; omitting the factor `r` changes the de Rham bases of §5.6 by a constant.

*Needs:* §2.1; SpringerResolutionAndCharacteristicCycles §9.1 (inverse images).

### 2.3 Local structure of the Kloosterman connections

**Theorem.** For `r ≥ 2`, `Kl_r` is regular singular at `0` with unipotent residue consisting of one
Jordan block, and at `∞` it is irregular of pure slope `1/r` with irregularity one. Its dual is
`ι_r⁺Kl_r` with `ι_r(z) = (−1)^r z`. The cyclic pullback `K̃l_r` is the localized Fourier transform
of the regular holonomic Gauss–Manin module `H⁰g_{r,+}O_{𝔾_m^{n}}`, and
`Kl_{r+1} ≅ j₀⁺ FT(j_{0,+} inv⁺ Kl_r)` up to the normalizations of
MixedHodgeModulesAndIrregularHodgeTheory §§2.2 and 2.4, with `inv(z) = 1/z` (FSY Proposition 2.4 and
Lemma 2.5, pp. 10–12).

*Proof sketch.* The cyclic operator `θ^r − z` has the logarithmic lattice `⊕ K[z]θⁱ` at `0` with
nilpotent residue of one block. After the cover `z = t^r` the formal structure at `∞` splits into
exponential factors `E^{r ζ t}`, `ζ ∈ μ_r`, so the slopes before the cover are `1/r`. Duality and the
recursion follow from the Fourier description with kernel `E^{tτ}`.

**Checks.**

- The irregularity of `Kl_r` at `∞` is `r·(1/r) = 1`, matching the Swan conductor one of the
  `ℓ`-adic sheaf.
- For odd `r` the dual requires `z ↦ −z`; for even `r` the connection is self-dual.
- The index formula of PadicDifferentialEquationsAndRigidCohomology §RD.6.53 gives
  `dim H¹_dR(𝔾_m, Kl_r) − dim H⁰_dR(𝔾_m, Kl_r) = 1`.
- The index formula weights each boundary point by its residue degree. Over `ℚ`, on
  `U = ℙ¹ ∖ {x² + 1 = 0}`, the rank-one connection `E^{1/(x²+1)}` has `χ(U) = 2 − 0 − 2 = 0` and
  irregularity one at the degree-two point, so `dim H⁰_dR − dim H¹_dR = 0 − 2·1 = −2`. This is the
  value after base change to `ℚ(i)`, where there are two rational poles `±i` of irregularity one.
  Without the residue degree the formula would give `−1`. On `𝔾_m` both boundary points are rational,
  so the Kloosterman index above is unaffected.

*Needs:* §§2.1–2.2; PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a–RD.6.53 (formal
decomposition, index); MixedHodgeModulesAndIrregularHodgeTheory §§2.2, 2.4–2.5 (Fourier transform,
localized Fourier, Fourier duality).

### 2.4 Symmetric powers of the Kloosterman connections

Define, for a connection `(E, ∇)` on a smooth variety over `K`, the connection `Sym^k(E, ∇)` on the
symmetric power of the underlying vector bundle (Mathlib `SymmetricPower` on local sections), with
`∇(e₁⋯e_k) = Σⱼ e₁⋯∇eⱼ⋯e_k`. Apply it to `Kl_r` and `K̃l_r` for `k ≥ 1` (FSY §2.1, Proposition 2.7,
p. 12; §2.2, pp. 13–14). The API proves the following facts.

- The Leibniz formula descends from the tensor power to the symmetric quotient, so `Sym^k(E, ∇)` is
  a connection; it is integrable when `∇` is.
- The rank is `binomial(r − 1 + k, k)`, by Tau Ceti `SymmetricPower.finrank_eq` on the fibres of the
  locally free module.
- `Sym^k` commutes with pullback, with extension of the field and with the `μ_r`-action on `K̃l_r`.
- `Sym^k` commutes with duality up to the canonical identification `Sym^k(E^∨) ≅ (Sym^k E)^∨` in
  characteristic zero.

**Checks.**

- For `r = 2`, `k = 2` the rank is `3`, not `4`.
- For `k = 1` the construction returns `(E, ∇)`.
- For `k = 0` it is the trivial connection `(O, d)`, which is excluded from the irreducibility and
  cohomology statements of positive `k`.

*Needs:* §§2.1–2.2; Mathlib `SymmetricPower`; Tau Ceti `SymmetricPower.map`,
`SymmetricPower.finrank_eq`.

### 2.5 Differential Galois groups

**Theorem.** Over `ℂ`, the differential Galois groups of `Kl_r` and of `K̃l_r`, that is the
Picard–Vessiot groups of their generic fibres over `ℂ(z)` and `ℂ(t)` in their `r`-dimensional solution
representations (DiophantineApproximationAndTranscendence §5.4), are `SL_r` for odd `r` and `Sp_r` for
even `r`. Consequently, for every `k ≥ 1`, `Sym^k Kl_r` and `Sym^k K̃l_r` are irreducible of rank
`binomial(r − 1 + k, k)` (Katz, as recorded in FSY Proposition 2.7, p. 12).

*Proof sketch.* Let `K/ℂ(z)` be the Picard–Vessiot field of `Kl_r` and `G` its group. Analytic
continuation around `0` acts through an element of `G` (DiophantineApproximationAndTranscendence
§5.4), the unipotent single block of §2.3. The exponential torus of the formal decomposition at `∞`
(§2.3, PadicDifferentialEquationsAndRigidCohomology §RD.6.52a) acts by differential automorphisms of
the explicit formal solution field, whose constants are `ℂ` and which contains a Picard–Vessiot field
of `Kl_r` over `ℂ(z)`; by uniqueness of that field, restriction places the torus in `G`. Katz's
classification of the group generated by these elements identifies `G`; it is connected. For
`K̃l_r`, the compositum `K·ℂ(t)` is a Picard–Vessiot field over `ℂ(t)` whose group is the subgroup of
`G` fixing `K ∩ ℂ(t)`; that field is algebraic over `ℂ(z)`, hence contained in `K^{G⁰} = K^G = ℂ(z)`, so
the group is `G` again. A sub-connection of `Sym^k` gives a `G`-stable subspace of `Sym^k` of the
solution space, through the fixed-field correspondence `K^G = ℂ(z)`, and `Sym^k` of the standard
representation of `SL_r` or `Sp_r` is irreducible. These restriction and sub-object steps are part of
this target.

**Checks.**

- For `r = 2` every `Sym^k Kl₂`, `k ≥ 1`, is irreducible.
- The characteristic-zero statement has no orthogonal or `G₂` branch; the `p = 2` branches of §1.3
  do not transfer.
- For `r = 3`, `Sym²` of the standard representation of `SL₃` is irreducible of dimension `6`,
  whereas for `SO₃` it would split off an invariant line.
- For `r = 2` the fundamental group of `ℂˣ` is generated by the loop around `0`, whose monodromy is one
  unipotent block; the Zariski closure of the monodromy group is the one-dimensional additive group,
  whereas `G = SL₂` has dimension `3`. Taking the closure of the analytic monodromy in place of the
  Picard–Vessiot group would lose the irregular part at `∞`, as it does for `y′ = y`, whose group is
  `𝔾_m` while its monodromy is trivial.

*Needs:* §§2.3–2.4; DiophantineApproximationAndTranscendence §5.4 (Picard–Vessiot fields, the
fixed-field correspondence, analytic monodromy in `G`); PadicDifferentialEquationsAndRigidCohomology
§RD.6.52a (formal decomposition at `∞`).

### 2.6 The Bessel connection dictionary

**Comparison.** For `λ ∈ Kˣ`, the rank-`r` Bessel connection `d + M(x)dx/x`, with ones on the
superdiagonal of `M` and lower-left entry `λ^r x`, is identified with the pullback of `Kl_r` along
`z = λ^r x` after choosing the cyclic vector as the last basis vector. The cyclic generator satisfies
`θ^r − λ^r x`. Horizontal coefficient vectors solve the dual system, and their first coefficient
satisfies `θ^r f − (−1)^r λ^r x f = 0`. Replacing `E^{λs} = (O, d + λds)` by `E^{−λs}` pulls the
Kloosterman object back along `x ↦ (−1)^r x` (XZ §1.1.1, (1.1.1.1)–(1.1.1.6), pp. 2–3; §4.1.13,
p. 42).

*Proof sketch.* Write the cyclic basis `θⁱe` and rescale to the Bessel matrix. The horizontal
coefficient recurrence is `θfᵢ = −f_{i+1}`, and the last equation introduces `(−1)^r`.

**Checks.**

- For odd `r` the cyclic module equation and the scalar equation of horizontal first coefficients
  have opposite signs; for even `r` they agree.
- `λ = 0` gives a connection regular at `∞`, outside the irregularity-one statement of §2.3.
- For `r = 2`, `λ = 1`: the generator satisfies `θ²e = x e`, and a horizontal first coefficient
  satisfies `θ²f = x f` as well, since `(−1)² = 1`.

*Needs:* §2.3.

### Examples

- `Kl₂ = D/D(θ² − z)`: at `∞` with `z = t²` the formal factors are `E^{±2t}` twisted by the regular
  rank-one factor of monodromy `−1`.
- `Sym² Kl₂` has rank `3`, is irreducible, and has the Leibniz action of §5.1.

### Dependencies

Layer 0 for the notation. Other roadmaps: ComplexComparisonPartII, SpringerResolutionAndCharacteristicCycles,
PadicDifferentialEquationsAndRigidCohomology, MixedHodgeModulesAndIrregularHodgeTheory,
DiophantineApproximationAndTranscendence. Libraries: Mathlib, Tau Ceti (symmetric powers of modules).

## Layer 3: exponential cohomology and middle extensions

This layer identifies the de Rham cohomology of `Sym^k Kl_r` with an isotypic piece of exponential
cohomology of a torus, defines middle cohomology and constructs the inverse Fourier objects.

### 3.1 Tensor potentials

For `r = n + 1 ≥ 2` and `k ≥ 1` define `f_{r,k}(x, z) = Σ_{j=1}^k (Σ_{i=1}^n x_{ij} + z/Πᵢ x_{ij})`
on `𝔾_m^{nk+1}` and `g_{r,k}(y) = Σ_j (Σᵢ y_{ij} + 1/Πᵢ y_{ij})` on `𝔾_m^{nk}`. After `z = t^r` and
`x_{ij} = t·y_{ij}` the potential becomes `t·g_{r,k}(y)`; `S_k` permutes the blocks and `μ_r` acts by
`(t, y) ↦ (ζt, ζ⁻¹y)` (FSY §2.2, (2.8)–(2.9), pp. 13–14; §3.1, (3.9), p. 21). The API proves the
following facts.

- `f_{r,k}` is the sum of `k` copies of `f_r` sharing the coordinate `z`; for `k = 1` it is `f_r`.
- `t·g_{r,k}` is invariant under `S_k × μ_r`.
- The substitution is an isomorphism of tori over the cover `z = t^r`.

**Checks.**

- For `r = 2`, `k = 2`: `t·g = t(y₁ + y₁⁻¹ + y₂ + y₂⁻¹)`.
- For `r = 3`, `k = 2` the `y`-torus has dimension `4` and the exponential torus dimension `5`; a
  construction using `nk` for `n` would give the wrong dimension.
- The action `y ↦ ζ⁻¹y` is needed for `r = 3`; `y ↦ ζy` does not preserve `t·g`.

*Needs:* §2.2.

### 3.2 The signed symmetric projectors

For `n = r − 1` let `χ_n` be the character `σ ↦ sgn(σ)^n` of `S_k`, and also the character
`(σ, ζ) ↦ sgn(σ)^n` of `S_k × μ_r`, trivial on `μ_r`. Two projectors are used, according to the group
that acts (FSY §2.2, before Proposition 2.13, p. 14; §3.1, pp. 21–22):

- for a rational linear action of `S_k`, `e^S_χ = (k!)⁻¹ Σ_{σ ∈ S_k} sgn(σ)^n σ`, with image
  `V^{S_k,χ_n}`;
- for a rational linear action of `S_k × μ_r`, `e_χ = (k!·r)⁻¹ Σ_{σ,ζ} sgn(σ)^n (σ, ζ) = e^S_χ·e_μ`,
  where `e_μ = r⁻¹ Σ_ζ ζ` projects onto the `μ_r`-invariants, with image `V^{S_k×μ_r,χ_n}`.

The sign accounts for permuting blocks of differential forms of degree `n`. On the cover
presentation `t·g_{r,k}` the projector `e^S_χ` computes the cohomology of `Sym^k K̃l_r`, and `e_χ`
that of the descended `Sym^k Kl_r`; on the presentation `f_{r,k}`, which carries no `μ_r`-action, only
`e^S_χ` is used (§3.5). The same projectors are used on de Rham, Betti, `ℓ`-adic and motivic
cohomology. The API proves the following facts.

- `e^S_χ`, `e_μ` and `e_χ` are commuting idempotents; `v` lies in the image of `e^S_χ` if and only if
  `σv = sgn(σ)^n v` for every `σ`, and in the image of `e_χ` if and only if moreover `ζv = v` for
  every `ζ`.
- For an action of the finite étale group scheme `μ_r` over a field `K` of characteristic zero,
  `e_μ` is the average over `μ_r(K̄)`; it commutes with `Gal(K̄/K)` and is therefore defined over `K`.
  Over a field of characteristic `p` with `r = p^a m`, `p ∤ m`, the group `μ_r` acts on étale
  cohomology through `μ_m`, and `e_μ` is the average over `μ_m(K̄)` (§4.5).
- Every equivariant linear map commutes with these projectors and induces maps on their images.
- Exact rational realization functors carry their images to their images.

**Checks.**

- For `r = 2`, `k = 2` a transposition acts by `−1` on the selected pieces; for `r = 3`, `k = 2` by
  `+1`.
- `r = 2`, `k = 2`, `ℓ = 2`: `e_χ = (2!·2)⁻¹ Σ sgn(σ)(σ, ζ)` has denominator `4`, a unit in `ℚ₂` but not
  in `ℤ₂`, so the projector exists on `ℚ₂`-cohomology and not on `ℤ₂`-lattices; only rational
  coefficients are used.
- Cover versus descent at `r = 2`, `k = 3`: the four classes `tʲṽ₀³dt/t`, `0 ≤ j ≤ 3`, of
  `H¹_dR(𝔾_m, Sym³ K̃l₂)` (§5.6) have deck eigenvalues `(−1)^j = +1, −1, +1, −1`, so `e_μ` has rank
  `2 = dim H¹_dR(𝔾_m, Sym³ Kl₂)`; on middle cohomology the dimensions are `3` before and `1` after
  `e_μ` (§5.5). Using `e_χ` for the cover, or `e^S_χ` for the descended object, gives the wrong
  dimension.
- For `r = 2`, `e_χ` selects the vectors on which `S_k` acts by the sign and `μ₂` trivially;
  replacing the sign by the trivial character of `S_k` selects a different object (§4.4).

*Needs:* §3.1.

### 3.3 The tensor Thom–Sebastiani identification

**Theorem.** For `r = n + 1 ≥ 2` and `k ≥ 1`, the relative exponential direct image of `E^{f_{r,k}}`
to `𝔾_{m,z}` is canonically `Kl_r^{⊗k}`, and that of `E^{t·g_{r,k}}` to `𝔾_{m,t}` is `K̃l_r^{⊗k}`. The
identification is `S_k`-equivariant with the Koszul sign of §3.2, commutes with the cyclic pullback,
and identifies `H¹_dR(𝔾_m, Kl_r^{⊗k})` with `H^{nk+1}_dR(𝔾_m^{nk+1}, E^{f_{r,k}})`, and similarly with
compact supports (FSY Proposition 2.10 and Corollary 2.11, pp. 13–14).

*Proof sketch.* Apply relative Künneth to the `k` factors over the common base, use
`E^f ⊗ E^g = E^{f+g}`, and then the Leray identification with the relative degree `nk` and the
one-dimensional base.

**Checks.**

- For `k = 1` the identification is the definition of `Kl_r`.
- The cohomological degree is `nk + 1`, not `nk`.
- For `r = 2`, `k = 2` the transposition acts on `H³_dR(𝔾_m³, E^{f_{2,2}})` with the sign
  `(−1)^{1·1} = −1` relative to the factor swap of `Kl₂^{⊗2}`.

*Needs:* §§2.1, 3.1–3.2; MixedHodgeModulesAndIrregularHodgeTheory §2.1 (exponential twists) and §8.3
(Künneth); SpringerResolutionAndCharacteristicCycles §9.1 (direct images).

### 3.4 Middle Kloosterman cohomology

For `E = Sym^k Kl_r` or `Sym^k K̃l_r`, `r ≥ 2`, `k ≥ 1`, define
`H¹_{dR,mid}(𝔾_m, E) = im(H¹_{dR,c}(𝔾_m, E) → H¹_dR(𝔾_m, E))` with its two comparison maps, and
identify it with `H¹_dR(ℙ¹, j_!*E)` for `j : 𝔾_m → ℙ¹`, where `j_!*` is
SpringerResolutionAndCharacteristicCycles §9.6's intermediate extension (FSY Corollary 2.15,
pp. 15–16). The API proves the following facts.

- The canonical surjection from `H¹_c` and injection into `H¹` factor the forget-supports map.
- The identification with `H¹(ℙ¹, j_!*E)` is compatible with both maps.
- The duality between compact and ordinary cohomology descends to a perfect pairing on the middle
  space.

**Checks.**

- For `r = 2`, `k = 1` the middle space is zero while `H¹` has dimension one.
- For `r = 2`, `k = 3` the middle dimension is one and the full dimension two.
- For `r = 2`, `k = 4` the middle space is zero although `H¹` has dimension two; middle cohomology is
  an image and differs from both `H¹_c` and `H¹`.

*Needs:* §2.4; SpringerResolutionAndCharacteristicCycles §§9.1 and 9.6 (duality, intermediate
extension).

### 3.5 The exponential de Rham realization

**Theorem.** For `r = n + 1 ≥ 2` and `k ≥ 1`, ordinary, compact and middle de Rham cohomology of
`Sym^k Kl_r` and of `Sym^k K̃l_r` vanish outside degree one. In degree one, for `? ∈ {∅, c, mid}`,

    H¹_{dR,?}(𝔾_m, Sym^k Kl_r) ≅ H^{nk+1}_{dR,?}(𝔾_m^{nk+1}, f_{r,k})^{S_k,χ_n}
                              ≅ H^{nk+1}_{dR,?}(𝔾_m^{nk+1}, t·g_{r,k})^{S_k×μ_r,χ_n},
    H¹_{dR,?}(𝔾_m, Sym^k K̃l_r) ≅ H^{nk+1}_{dR,?}(𝔾_m^{nk+1}, t·g_{r,k})^{S_k,χ_n},

with the projectors `e^S_χ` and `e_χ` of §3.2; the descended and the cover forms differ by the
`μ_r`-invariants `e_μ`. The middle spaces carry perfect pairings to `K` of parity `(−1)^{nk+1}`, which
with Hodge structures take values in `ℚ(−nk − 1)`; the pairing on the descended middle space is
induced from the one on the cover by taking `μ_r`-invariants (FSY Proposition 2.13 and
Corollary 2.15, pp. 15–16; the projectors are defined on p. 14).

*Proof sketch.* Irreducibility (§2.5) kills `H⁰`, and duality kills `H²_c`. Apply §3.3 and the
`S_k`-projector `e^S_χ` of §3.2, using that the actions of `S_k` on the two sides of §3.3 differ by
`χ_n`; for the descended object on the cover presentation apply in addition `e_μ`, by the finite
étale descent of §2.2. Then compare supports and descend the graded-symmetric Poincaré pairing of
MixedHodgeModulesAndIrregularHodgeTheory §8.3.

**Checks.**

- For `r = 2` the middle pairing is symmetric for odd `k` and alternating for even `k`.
- A pairing of the opposite parity fails at `k = 6`, where `d₆ = 2` and the space carries a
  symplectic form, and at `k = 7`, where `d₇ = 3` is odd and admits no nondegenerate alternating form.
- For `r = 3`, `k = 2` the parity is `(−1)^{5} = −1`.
- `r = 2`, `k = 3`: the cover form has full dimension `4` and middle dimension `3`, the descended form
  `2` and `1` (§5.5); identifying the cover with the `S₃ × μ₂`-part would give `2` and `1` for the
  cover as well.

*Needs:* §§2.2, 2.5, 3.2–3.4; MixedHodgeModulesAndIrregularHodgeTheory §§8.1–8.3 (pair cohomology,
its de Rham fibre, Künneth and duality).

### 3.6 Inverse Fourier Kloosterman objects

Let `r = n + 1 ≥ 2` and `k ≥ 1`. On the dual line `𝔸¹_τ` let `M = FT⁻¹(j_{0,!*}Sym^k K̃l_r)`, the
inverse Fourier transform of the intermediate extension at `0`, and let `Π` be the exponential
projector of MixedHodgeModulesAndIrregularHodgeTheory §6.2 with unit `η : N → ΠN`. Prove that `M` is regular
holonomic, that `ΠM ≅ FT⁻¹(j_{0,+}Sym^k K̃l_r)` and that `η` gives an exact sequence
`0 → M → ΠM → M′ → 0` of regular holonomic modules with `M′` constant (FSY (2.17)–(2.20),
pp. 16–17). Let
`G_{r,k} = im(H⁰g_{r,k,!}O → H⁰g_{r,k,+}O)` be the middle Gauss–Manin module of
`g_{r,k} : 𝔾_m^{nk} → 𝔸¹_τ` of §3.1, with its `S_k`-action. The identification
`Sym^k K̃l_r ≅ (j₀⁺FT H⁰g_{r,k,+}O)^{S_k,χ_n}` gives a morphism `G_{r,k}^{S_k,χ_n} → ΠM` whose kernel
and cokernel are constant; prove that `M` is its image, equivalently the quotient of
`G_{r,k}^{S_k,χ_n}` by its maximal constant submodule, which is a direct summand. Prove that `M`
underlies an irreducible pure Hodge module `M^H` of weight `nk` with `M^H = W_{nk}ΠM^H`. Prove also
that `M′` underlies a constant mixed Hodge module `M′^H` on `𝔸¹` with weights `≥ nk + 1` (FSY
(2.22)–(2.23), Proposition 2.21 and Lemma 2.24, pp. 16–18). Its exact weight in rank two needs the
monodromy at infinity of §5.4 and is the theorem of §5.7. The API proves the following facts.

- `M` is regular holonomic. The Gauss–Manin module `N = H⁰g_{r,k,+}O` and its projection `ΠN`
  underlie the mixed Hodge modules `H⁰g_{r,k,*}pℚ^H_{𝔾_m^{nk}}` and `Π(H⁰g_{r,k,*}pℚ^H_{𝔾_m^{nk}})`
  (MixedHodgeModulesAndIrregularHodgeTheory §§4.6, 5.1, 6.2), so both are regular holonomic, also at
  `∞`. §6.6 applied to `N`, followed by the `χ_n`-isotypic projection, gives
  `FT⁻¹(j_{0,+}Sym^k K̃l_r) ≅ (ΠN)^{S_k,χ_n}`. Since `FT⁻¹` is exact, `M` is a submodule of this
  regular holonomic module. Regular holonomic modules are closed under subquotients
  (SpringerResolutionAndCharacteristicCycles §9.7).
- `ΠM ≅ FT⁻¹(j_{0,+}Sym^k K̃l_r)`. MixedHodgeModulesAndIrregularHodgeTheory §6.6 applied to the
  regular holonomic input `M` gives `FT ΠM ≅ (FT M)(∗0) = (j_{0,!*}Sym^k K̃l_r)(∗0) = j_{0,+}Sym^k K̃l_r`.
  Then apply `FT⁻¹`. The transform `j_{0,!*}Sym^k K̃l_r` is irregular at `∞` and is not an input of
  §6.6.
- The inclusion `M → ΠM` is the unit of `Π`, and its cokernel is constant.
- The kernel and cokernel of `H⁰g_{r,k,!}O → H⁰g_{r,k,+}O` are constant, since `g_{r,k}` is a
  convenient Newton-nondegenerate Laurent polynomial (MixedHodgeModulesAndIrregularHodgeTheory
  §10.8).
- `M^H` forgets to `M` and is pure of weight `nk`. Its exponential de Rham fibre
  `ω(M) = H¹_dR(𝔸¹_τ, M ⊗ E^τ)` is identified by `ω(η)` with `ω(ΠM)` and is the fibre at `t = 1` of
  `FT M = j_{0,!*}Sym^k K̃l_r`, of dimension `binomial(r − 1 + k, k)`. With `W_jω(ΠM) = ω(W_jM^H)`
  it is pure of exponential weight `nk`: a pure input gives its own weight, with no shift
  (MixedHodgeModulesAndIrregularHodgeTheory §§6.4–6.5; FSY Remark A.6 and (A.8)–(A.9), p. 64).
- The Fourier cohomology `H¹(𝔸¹_t, FT M^H)` of MixedHodgeModulesAndIrregularHodgeTheory §9.1 is a
  different object from this fibre. `M` is irreducible and not punctual, so it has no section
  supported at `τ = 0`, and §9.3 there gives
  `H¹(𝔸¹_t, FT M^H) ≅ coker(N : ψ_{τ,1}M^H → ψ_{τ,1}M^H(−1))`. The weight filtration of
  `ψ_{τ,1}M^H` is the monodromy filtration of `N` centred at `nk − 1` (§5.3
  there). Let `P_i ⊂ gr^W_{nk−1+i}ψ_{τ,1}M^H`, `i ≥ 0`, be its primitive parts. Then
  `gr^W_{nk+1+i}H¹(𝔸¹_t, FT M^H) ≅ P_i(−1)`. So the weights are `≥ nk + 1`, and the space is pure of
  weight `nk + 1` exactly when `N = 0` on `ψ_{τ,1}M^H`, for instance when `M` is smooth at `τ = 0`
  (FSY Corollary A.31(1)–(2), p. 72; proof of Theorem 3.2, p. 20).
- Fourier cohomology applied to `0 → M^H → ΠM^H → M′^H → 0` gives an exact sequence of mixed Hodge
  structures `0 → H¹(𝔸¹_t, FT M^H) → H¹(𝔸¹_t, FT ΠM^H) → H¹(𝔸¹_t, FT M′^H) → 0`. The outer zeros hold
  because `H⁰` of the Fourier cohomology of a constant module vanishes, and so does ordinary Fourier
  cohomology in degree two (§9.1 there). By §9.4 there the quotient has weights `≥ nk + 2`. The
  middle term is `H^{nk+1}(𝔾_m^{nk+1}, t·g_{r,k})^{S_k,χ_n}`, the structure realizing
  `H¹(𝔾_m, Sym^k K̃l_r)` in §3.5; its de Rham fibre is `H¹_dR(𝔸¹_t, j_{0,+}Sym^k K̃l_r)`. Indeed, as pair
  cohomology (§8.1 there) the fibre `t = 0` contributes `RΓ(𝔸¹_τ, ΠM^H) = 0`, constant objects in `τ`
  contribute nothing over `t ≠ 0`, and `(t·g_{r,k})_* = (tτ)_* ∘ (id × g_{r,k})_*` (FSY proof of
  Theorem 3.2, p. 20, and of Proposition 4.20, p. 32).

**Checks.**

- `r = 2`, `k = 1`: `g = y + y⁻¹` is finite of degree two, so `G_{2,1} = g_*O` has rank `2` and
  contains the constant summand `O_{𝔸¹}` given by the trace; `M` has rank `1`, `ΠM` rank `2` and `M′`
  rank `1`. Identifying `ΠM` with `M`, or `M` with the whole Gauss–Manin image, fails by one rank.
- `r = 2`, `k = 1`: `M` has rank `1` and is regular. Its transform `FT M = j_{0,!*}K̃l₂` has the
  formal factors `E^{±2t}` at `∞` (§2.3), so slopes `1, 1` and irregularity `2`. So §6.6 applies with
  input `M`, not with input `j_{0,!*}K̃l₂`, and gives `ΠM` of rank `2`.
- Negative control for a weight shift, `r = 2`, `k = 2`. The exponential fibre `ω(M)` is the fibre of
  `Sym² K̃l₂` at `t = 1`, of dimension `3` and exponential weight `2 = nk`. `M` has rank `2` and is
  singular at `0` (§5.4), with local monodromy one Jordan block of size two. So `P₀ = 0` and `P₁` is
  one-dimensional, and `H¹(𝔸¹_t, FT M^H) = P₁(−1) = ℚ(−2)` has dimension `1`, type `(2, 2)` and weight
  `4 = nk + 2`. Together with the class `(3, 3)` of `H¹(𝔸¹_t, FT M′^H)`, whose weight is the
  rank-two quotient weight of §5.7, this gives the two classes of §6.4. Neither the fibre nor the
  Fourier cohomology has weight `nk + 1 = 3`.
- `r = 2`, `k = 3`. `M` is smooth at `0` (§5.4), so `H¹(𝔸¹_t, FT M^H) = ψ_τM^H(−1)` has dimension
  `rank M = 3` and is pure of weight `4 = nk + 1`. These are the middle classes `(1, 3), (2, 2), (3, 1)`
  of §6.4. The fibre `ω(M)` has dimension `4` and exponential weight `3`.
- `k = 0` is excluded. There `j_{0,!*}O_{𝔾_m} = O_{𝔸¹}` and `M = FT⁻¹O = δ_0` is punctual, so §9.3 of
  MixedHodgeModulesAndIrregularHodgeTheory does not apply, and indeed
  `H⁰_dR(𝔸¹_t, FT δ_0) = H⁰_dR(𝔸¹_t, O) = ℂ ≠ 0`.
- `M′^H` is not an exponential mixed Hodge structure. At `r = 2`, `k = 1` it is a nonzero constant
  object `a^*V[1]` with `V` of rank one, by the trace summand of the first Check, so
  `RΓ(𝔸¹, M′^H) = V[1] ≠ 0` and `ΠM′^H = 0` (MixedHodgeModulesAndIrregularHodgeTheory §§6.1–6.2).
  The bound `≥ nk + 1 = 2` is all this section gives for its weight; the value `3`, with `V = ℚ(−1)`
  and the top class `(2, 2)` of §6.4, comes from §5.7.

*Needs:* §§3.1, 3.2, 3.5; MixedHodgeModulesAndIrregularHodgeTheory §§2.2, 6.1, 6.2, 6.6 (Fourier
transform, exponential structures, projector, Fourier localization), §§6.4–6.5 (exponential weight
filtration, de Rham fibre), §§4.3, 4.6, 5.1–5.3 (pure and mixed Hodge modules, direct images, weights,
nearby cycles), §8.1 (pair cohomology), §§9.1–9.4 (Fourier cohomology, costalk, pure-input
formula, constant correction) and §10.8 (constant boundary of a Laurent Gauss–Manin system);
SpringerResolutionAndCharacteristicCycles §§9.6–9.7 (intermediate extension, regular holonomic
modules).

### Examples

- `r = 2`, `k = 3`: `H¹_dR(𝔾_m, Sym³ Kl₂)` has dimension two and its middle part dimension one; the
  middle pairing is symmetric of weight `4`.
- `r = 2`, `k = 2`: the middle space is zero and the pairing is the zero pairing on the zero space.

### Dependencies

Layer 2. Other roadmaps: SpringerResolutionAndCharacteristicCycles,
MixedHodgeModulesAndIrregularHodgeTheory.

## Layer 4: classical Hodge structures and moment motives

This layer proves that the exponential cohomology of Layer 3 is classical, describes it by the
moment hypersurfaces, defines the Nori motive and compares it with the finite-field cohomology of
Layer 1.

### 4.1 Classicality of moment cohomology

**Theorem.** For `r = n + 1 ≥ 2` and `k ≥ 1`, the exponential mixed Hodge structures realizing `H¹`,
`H¹_c` and `H¹_mid` of `Sym^k Kl_r` and of `Sym^k K̃l_r` are classical rational mixed Hodge
structures, carried by `TauCeti.Hodge.MixedHodgeStructure`. Their irregular Hodge filtrations are the
ordinary Hodge filtrations. Their weights are `≥ nk + 1`, `≤ nk + 1` and pure `nk + 1` respectively;
the maps on `gr^W_{nk+1}` identify both extreme graded pieces with the middle cohomology, and
`H¹_mid = W_{nk+1}H¹`. The perfect pairing of §3.5 takes values in `ℚ(−nk − 1)` with parity
`(−1)^{nk+1}` (FSY Theorem 3.2, pp. 19–21; Theorem A.24, pp. 68–70).

*Proof sketch.* The potential on the cover is `t·g_{r,k}` on `𝔸¹ × 𝔾_m^{nk}` after adding the constant
`𝔸¹`-factor, so MixedHodgeModulesAndIrregularHodgeTheory §8.7 (the classical `t·g` criterion)
applies; its §7.7 identifies the filtrations. Transfer to `Sym^k K̃l_r` through `e^S_χ` and to
`Sym^k Kl_r` through `e_χ` (§§3.2, 3.5), which is the finite cyclic descent of §2.2. The weight bounds
are those of MixedHodgeModulesAndIrregularHodgeTheory §8.4 in the central degree `nk + 1`. For
`H¹_mid = W_{nk+1}H¹` on the cover, that is for `Sym^k K̃l_r`, use the Fourier-cohomology facts of
§3.6. They put `W_{nk+1}H¹` inside `H¹(𝔸¹_t, FT M^H)`, where it has dimension `dim P₀`, and the pure
middle space `H¹(ℙ¹_t, j_{!*}Sym^k K̃l_r)` (§3.4) lies there too. The codimension of the middle space
in `H¹(𝔸¹_t, FT M^H)`, whose dimension is `Σ_{i≥0} dim P_i`, is the dimension of the cokernel of the
monodromy logarithm on the unipotent nearby cycles of the regular formal part of `FT M` at `∞`, since
the irregular part contributes nothing. Stationary phase at the origin
(gap:irregular-stationary-phase) matches this with the cokernel of `N` on `φ_{τ,1}M`, which has
dimension `Σ_{i≥1} dim P_i` because `M` is an intermediate extension at `0`. So the middle space has
dimension `dim P₀` and equals `W_{nk+1}H¹`, and the criterion of
MixedHodgeModulesAndIrregularHodgeTheory §8.4 gives the isomorphism on `gr^W_{nk+1}`; taking
`μ_r`-invariants gives the statement for `Sym^k Kl_r` (FSY proof of Theorem 3.2, pp. 20–21).

**Checks.**

- For `r = 2`, `k = 2` the full `H¹` is a line of Hodge type `(3, 3)`, of weight `6`; for `r = 2`,
  `k = 5` its types are `(2, 4)`, `(4, 2)` and `(6, 6)`, of weights `6, 6, 12` (§6.6). A version
  asserting that the full `H¹` is pure of weight `nk + 1 = k + 1` fails in both cases; only the bound
  `≥ k + 1` holds.
- Pairing parity for `r = 2`: `(−1)^{k+1}` is `−1` at `k = 6` and `+1` at `k = 7`, so the middle
  pairing is alternating on the two-dimensional `H¹_mid` of `k = 6` and symmetric on the
  three-dimensional one of `k = 7`, as for `V_{6,ℓ}` and `V_{7,ℓ}` in §7.4; with the opposite parity
  the form at `k = 6` would be symmetric on a pure Hodge structure of odd weight `7`, which a
  polarization never is.
- For `r = 2`, `k = 3` the full `H¹` has dimension two with weights `4` and `8` (§6.6), so `H¹` is not
  pure and `W₄H¹` is the one-dimensional middle part.

*Needs:* §§2.2–2.3, 3.2, 3.4–3.6; MixedHodgeModulesAndIrregularHodgeTheory §§6.7, 7.7, 8.1–8.4,
8.7 and 9.1–9.4, and §9.5 with its irregular stationary phase (gap:irregular-stationary-phase);
PadicDifferentialEquationsAndRigidCohomology §RD.6.52a (formal decomposition at `∞`);
SpringerResolutionAndCharacteristicCycles §9.6 (intermediate extension); Tau Ceti
`TauCeti.Hodge.MixedHodgeStructure` and its strictness theorems.

### 4.2 The moment hypersurfaces

For `r = n + 1 ≥ 2` and `k ≥ 1` with `nk ≥ 2`, define `K_{r,k} ⊂ 𝔾_m^{nk}` as the closed subscheme
`g_{r,k} = 0` over `ℤ`, with the block-permutation action of `S_k` and the action
`y_{ij} ↦ ζ⁻¹y_{ij}` of the group scheme `μ_r` (FSY §3, (3.1), p. 18; Theorem 3.8 and (3.9),
pp. 21–23). The zero locus is defined by one Laurent equation, independently of a choice of roots of
unity. The API proves the following facts.

- A point of the torus lies on `K_{r,k}` exactly when `g_{r,k}` vanishes there.
- `S_k × μ_r` acts on `K_{r,k}`: `μ_r` scales `g_{r,k}` by `ζ⁻¹`, preserving its zero locus, although
  `g_{r,k}` is not invariant as a function; the projector `e_χ` of §3.2 therefore acts on the
  cohomology of `K_{r,k}`.
- Formation of `K_{r,k}` and its action commutes with every base change.

**Checks.**

- For `r = 2`, `k = 2` the numerator of `y₁ + y₁⁻¹ + y₂ + y₂⁻¹` factors as `(y₁ + y₂)(1 + y₁y₂)`, so
  `K_{2,2}` is reducible and singular; smoothness is not part of the definition.
- For `r = 2`, `k = 3` no point with all coordinates `±1` lies on `K_{2,3}` over `ℚ`, since a sum of
  three terms `±2` is nonzero; over `𝔽₃` the point `(1, 1, 1)` lies on it (`2 + 2 + 2 = 6 = 0`).
- For `r = 3` the scaling by `ζ⁻¹` multiplies `g_{3,k}` by `ζ⁻¹`, and the zero locus is preserved.

*Needs:* §§3.1–3.2; SchemeAndStackFoundations Layer 0 (closed subschemes, base change).

### 4.3 Hypersurface realization of middle cohomology

**Theorem.** For `r = n + 1 ≥ 2`, `k ≥ 1` and `nk ≥ 2` there are natural isomorphisms of rational
mixed Hodge structures, compatible with the middle pairing, between
`H¹_mid(𝔾_m, Sym^k Kl_r)`, `(gr^W_{nk−1}H_c^{nk−1}(K_{r,k}))^{S_k×μ_r,χ_n}(−1)` and
`(gr^W_{nk+1}H^{nk+1}_{K_{r,k}}(𝔾_m^{nk}))^{S_k×μ_r,χ_n}`, the isotypic parts being the images of the
projector `e_χ` of §3.2; if `K_{r,k}` is smooth the last term equals
`(gr^W_{nk−1}H^{nk−1}(K_{r,k}))^{S_k×μ_r,χ_n}(−1)` (FSY Theorem 3.8, pp. 21–23; Example A.27,
pp. 70–71).

*Proof sketch.* MixedHodgeModulesAndIrregularHodgeTheory §8.8's zero-locus comparison gives
`H_c^a(𝔸¹ × 𝔾_m^{nk}, tg) ≅ H_c^{a−2}(K_{r,k})(−1)` and `H^a ≅ H^a_{K_{r,k}}(𝔾_m^{nk})`, equivariantly
for `S_k × μ_r` since `μ_r` acts trivially on `H²_c(𝔸¹)`. Remove the `t = 0` contribution by the
divisor sequences of its §8.5, compare lowest weights, and apply `e_χ` with §§3.5 and 4.1.

**Checks.**

- The twist `(−1)` raises the weight `nk − 1` to `nk + 1`.
- The singular-support form needs no smoothness of `K_{r,k}`: at `r = 2`, `k = 2` (so `nk = 2`) the
  hypersurface is singular, the local-cohomology form applies and the smooth form does not.
- For `r = 2`, `k = 3` (so `nk − 1 = 2`): `(gr^W₂H²_c(K_{2,3}))^{S₃×μ₂,χ₁}(−1)` is one-dimensional,
  of weight `2 + 2 = 4` and Hodge type `(2, 2)`, matching `d₃ = 1` and §6.6. The degree is `nk − 1`,
  not `1`: a weight-one piece twisted by `(−1)` would have weight `3`. The `μ₂`-invariance is part of
  the projector; the `S₃`-sign part of the cover middle cohomology has dimension `3` (§3.5).

*Needs:* §§4.1–4.2, 3.2, 3.5; MixedHodgeModulesAndIrregularHodgeTheory §8.8 (zero locus) and
§8.5 (divisor sequences of pairs).

### 4.4 The Kloosterman moment motive

Define, in the rational Nori category over `ℚ` of MotivesAndAlgebraicCycles Layer 5, for
`r = n + 1 ≥ 2`, `k ≥ 1` and `nk ≥ 2`, `M_{r,k} = (gr^W_{nk−1}H^{nk−1}_c(K_{r,k}))^{S_k×μ_r,χ_n}(−1)`,
the image of the projector `e_χ` of §3.2, using the functorial Nori weight filtration of the supplier
contract; write `M_k = M_{2,k}` and set `M₁ = 0`
(FSY (3.1), p. 18; §3.1, pp. 21–23). The API proves the following facts.

- The filtered de Rham realization of `M_{r,k}` is `H¹_{dR,mid}(𝔾_m, Sym^k Kl_r)` with its rational
  structure and Hodge filtration, by §4.3.
- The `ℓ`-adic realization is the same projector applied to `gr^W H_c^{nk−1}` of the geometric
  hypersurface, with the twist `(−1)`.
- The motive carries a realization-compatible perfect pairing of parity `(−1)^{nk+1}` with values in
  `ℚ(−nk − 1)`.

**Checks.**

- `M₃` has weight `4`, not `2`.
- `M₁`, `M₂` and `M₄` have zero Betti, de Rham and `ℓ`-adic realizations.
- For `r = 2` the character is the sign of `S_k` and trivial on `μ₂`, while for `r = 3` it is trivial
  on `S_k × μ₃`; using the sign character for `r = 3` selects the anti-invariant part, which is not
  the realization of `Sym^k Kl₃` (§3.2).

*Needs:* §4.3; MotivesAndAlgebraicCycles Layer 5 (Nori category, pair motives, realizations) and its
weight filtration (gap:nori-weight-filtration).

### 4.5 The finite-field hypersurface comparison

**Theorem.** For `r = n + 1 ≥ 2`, `k ≥ 1`, `nk ≥ 2`, a prime `p` and `ℓ ≠ p`, the middle étale
cohomology of `Sym^k Kl_r` over `𝔽̄_p` is naturally isomorphic, compatibly with geometric Frobenius,
to `(gr^W_{nk−1}H^{nk−1}_c(K_{r,k,𝔽̄_p}, ℚ_ℓ(ζ_p)))^{S_k×μ_r,χ_n}(−1)`. If `p ∣ r`, write `r = p^a m` with
`p ∤ m`; the cyclic map factors through the degree-`m` étale cover and a purely inseparable universal
homeomorphism, and `μ_r` acts on étale cohomology through `μ_m`. The statement concerns middle
cohomology and asserts no concentration of the full cohomology in the odd-rank cases at `p = 2`
(FSY Theorem 3.12, pp. 23–25).

*Proof sketch.* Repeat the localization argument of §4.3 with the Artin–Schreier sheaf in place of
`E^{tg}`, using the vanishing of `RΓ_c(𝔸¹, L_ψ)` and smooth purity on the ambient torus. Topological
invariance (EtaleCohomologyFoundations §F.0.4) handles the inseparable factor; weights come from
DeligneWeightsAndPurity §7.12; local cohomology replaces smooth purity on the possibly singular
hypersurface.

**Checks.**

- For `r = p = 2` the comparison passes through the inseparable factor, not through an étale
  `μ₂`-cover.
- For `r = 2`, `k = 3`, `p = 2` the space `gr^W₂H²_c(K_{3,𝔽̄₂})^χ` before the twist carries the
  Frobenius eigenvalue `−2`, of weight `2 = nk − 1`; the twist `(−1)` multiplies it by `2`, giving `−4`
  of weight `4`. Omitting the twist, or twisting by `(1)`, gives `−2` or `−1`, neither a reciprocal root
  of `M₃(2; T)`.
- For `r = 2`, `k = 3`, `p = 2` the right side is one-dimensional with Frobenius eigenvalue `−4`,
  matching `M₃(2; T) = 1 + 4T`.

*Needs:* §§1.4, 4.2; CongruenceSpectralGap §4.2b (`L_ψ`); EtaleCohomologyFoundations §§F.0.4, F.5,
F.6; DeligneWeightsAndPurity §7.12.

### Examples

- `k = 3`, `r = 2`: `M₃` is a rank-one motive of weight `4`; its `ℓ`-adic realization is the
  character `χ_{−3}·χ_cyc^{−2}` (§10.1).
- `k = 5`, `r = 2`: `M₅` has rank two, Hodge numbers `h^{2,4} = h^{4,2} = 1` (§6.6).

### Dependencies

Layers 1–3. Other roadmaps: MixedHodgeModulesAndIrregularHodgeTheory, MotivesAndAlgebraicCycles,
CongruenceSpectralGap, EtaleCohomologyFoundations, DeligneWeightsAndPurity, SchemeAndStackFoundations,
PadicDifferentialEquationsAndRigidCohomology, SpringerResolutionAndCharacteristicCycles.
Libraries: Tau Ceti.

## Layer 5: rank-two explicit structure

From now on `r = 2`, `n = 1`, `θ = z∂_z`, and `v₀, v₁` is the cyclic basis of `Kl₂` with `θv₀ = v₁`,
`θv₁ = zv₀`.

### 5.1 The rank-two frame

In `Sym^k Kl₂` use `u_a = v₀^{k−a}v₁^a` for `0 ≤ a ≤ k`; then
`θu_a = (k − a)u_{a+1} + a·z·u_{a−1}`, with the absent endpoint terms zero. On the double cover
`z = t²`, `θ = (t/2)∂_t` (FSY §4.1, pp. 26–27; Lemma 4.15, pp. 30–31). The API proves the following
facts.

- `{u_a}` is a basis of the free `O_{𝔾_m}`-module `Sym^k Kl₂`.
- The displayed formula holds with integer multiplicities, including at `a = 0` and `a = k`.
- `v₀` generates `Kl₂` as the cyclic module of `θ² − z`.

**Checks.**

- For `k = 1`: `θv₀ = v₁`, `θv₁ = zv₀`.
- For `k = 2`: `θ(v₀v₁) = v₁² + zv₀²`; omitting either Leibniz term fails.
- On the cover `dz/z = 2dt/t`, not `dt/t`.

*Needs:* §§2.3–2.4.

### 5.2 The formal symmetric-power decomposition

**Theorem.** For `k ≥ 1`, at `∞` the symmetric power `Sym^k K̃l₂` on the double cover decomposes
formally as `⊕_{j=0}^k E^{2(2j−k)t} ⊗ L_{−1}^{⊗k}`, where `L_a` is the regular rank-one formal module
with monodromy `a`. For `Sym^k Kl₂`, opposite nonzero exponents pair under the cover; for even `k`
there is one regular rank-one factor, with monodromy `1` exactly when `4 ∣ k`. Hence
`irr_∞ Sym^k Kl₂ = ⌊(k + 1)/2⌋`, and the cover has irregularity `k + 1` for odd `k` and `k` for even `k`
(FSY Proposition 4.6 and Lemma 4.7, pp. 27–28).

*Proof sketch.* Diagonalize `K̃l₂` formally as `E^{2t} ⊗ L_{−1} ⊕ E^{−2t} ⊗ L_{−1}`, take symmetric
powers, and descend the paired factors; for even `k` the middle factor `j = k/2` is regular with
monodromy `(−1)^{k/2}` on the original torus.

**Checks.**

- `k = 4`: the regular factor is trivial; `k = 2`: it has monodromy `−1`.
- `k = 3`: the irregularity is `2` on the original torus and `4` on the cover.
- The irregularity `⌊(k + 1)/2⌋` equals the degree of `Z_k(p; T)` for `p` large (§8.2), matching
  Swan conductors.

*Needs:* §5.1; PadicDifferentialEquationsAndRigidCohomology §RD.6.52a (formal decomposition).

### 5.3 Intermediate extensions of the symmetric powers

**Theorem.** For `k ≥ 1`, at `∞` the map from the intermediate extension of `Sym^k Kl₂` to its
meromorphic extension is an isomorphism exactly when `4 ∤ k`; for the double-cover object exactly
when `k` is odd. At `0` the intermediate extension `j_{0,!*}Sym^k Kl₂` is the unique submodule of
`j_{0,+}Sym^k Kl₂` restricting to the connection with no quotient supported at `0`, and the quotient
is the boundary contribution of the single unipotent block (FSY Corollary 4.9, pp. 28–29).

*Proof sketch.* A monodromy-one regular formal factor at `∞` is exactly what makes the two
extensions differ there (§5.2). At `0` use irreducibility (§2.5), the single unipotent block, and the
no-boundary-subquotient characterization of SpringerResolutionAndCharacteristicCycles §9.6.

**Checks.**

- At `k = 4` the map at `∞` is not an isomorphism.
- The theorem does not say that `j_! → j_*` is an isomorphism for odd `k`: at `0` the two always
  differ.
- At `k = 2` the regular factor has monodromy `−1`, so the map at `∞` is an isomorphism.

*Needs:* §§5.2, 3.4, 2.5; SpringerResolutionAndCharacteristicCycles §9.6.

### 5.4 Local structure of the inverse Fourier object

**Theorem.** For `k ≥ 1`, `ΠM` of §3.6 has rank `k + 1` and `M` rank `k`. Their finite
singularities are `τ = 2(2j − k)`, `j = 0, …, k`. At each of them the vanishing cycles have rank one
with monodromy `(−1)^k`. At `∞` the monodromy of `ΠM` is unipotent with a single Jordan block of
size `k + 1`, and that of `M` is unipotent with a single Jordan block of size `k` (FSY Corollary 4.10,
p. 29).

*Proof sketch.* Apply stationary phase to the formal exponential factors of §5.2 (the supplier
contract gap:irregular-stationary-phase), and use the extensions of §5.3 at `0` and `∞` to compute
nearby and vanishing cycle ranks. At `∞`, regular stationary phase at eigenvalue one
(MixedHodgeModulesAndIrregularHodgeTheory §9.5, applied to `ΠM` and `M`, which are regular also at
`∞` by §3.6) identifies the nearby cycles at `∞` with the vanishing cycles at `t = 0` of
`FT ΠM = j_{0,+}Sym^k K̃l₂` and of `FT M = j_{0,!*}Sym^k K̃l₂`. The first is the nearby space of
`Sym^k K̃l₂` at `0`, on which `Sym^k` of the single unipotent block of §2.3, of size two also after
the cover `z = t²`, is one block of size `k + 1`; the second is the image of its logarithm, one block
of size `k` (FSY p. 29).

**Checks.**

- `0` is a finite singularity exactly when `k` is even.
- For `k = 3` the finite singular values are `−6, −2, 2, 6`.
- Ranks: `k + 1` exponents give `k + 1` singular points, each contributing one vanishing cycle; the
  rank `k` of `M` and `k + 1` of `ΠM` differ by the constant quotient.
- `k = 2`: the blocks at `∞` have sizes `3` for `ΠM` and `2` for `M`; a block of size `k + 1` on `M`
  would exceed its rank `2`.
- `k = 1`: the logarithm of the monodromy at `∞` is zero on the rank-one `ψ_∞M` and nonzero on the
  rank-two `ψ_∞ΠM`, so the two blocks are not interchangeable.

*Needs:* §§2.3, 3.6, 5.2–5.3; MixedHodgeModulesAndIrregularHodgeTheory §9.5 and its irregular
stationary phase (gap:irregular-stationary-phase).

### 5.5 Dimensions of moment cohomology

**Theorem.** For `k ≥ 1`, `dim H¹_dR(𝔾_m, Sym^k Kl₂) = ⌊(k + 1)/2⌋` and
`dim H¹_{dR,mid}(𝔾_m, Sym^k Kl₂) = d_k = ⌊(k − 1)/2⌋ − δ_{4∣k}`; equivalently `d_k = (k − 1)/2` for odd
`k` and `2⌊(k − 1)/4⌋` for even `k`. On the double cover the full dimension is `k + 1` for odd `k` and
`k` for even `k`, and the middle dimension is `k` for odd `k` and `k − 2` for even `k` (FSY
Proposition 4.12 and (4.13), p. 30).

*Proof sketch.* The index formula of PadicDifferentialEquationsAndRigidCohomology §RD.6.53 with §5.2
gives the full dimensions; subtract the boundary contributions at `0` and `∞` from §5.3.

**Checks.**

- `d₁ = d₂ = d₄ = 0`, `d₃ = 1`, `d₅ = 2`, `d₆ = 2`, `d₇ = 3`, `d₈ = 2`.
- For even `k`, `d_k` is even, as an alternating pairing requires.
- The formula is not extended to `k = 0`: truncated subtraction would give `0`, whereas `H¹_dR(𝔾_m, O)`
  has dimension one.

*Needs:* §§3.5, 5.2–5.3; PadicDifferentialEquationsAndRigidCohomology §RD.6.53.

### 5.6 Explicit de Rham bases

**Theorem.** For `k ≥ 1` the classes `zʲv₀^k dz/z`, `0 ≤ j < ⌊(k + 1)/2⌋`, form a basis of
`H¹_dR(𝔾_m, Sym^k Kl₂)`, and `tʲṽ₀^k dt/t`, `0 ≤ j < 2⌊(k + 1)/2⌋`, a basis on the double cover. The
logarithmic extension `⊕_a K[z]u_a` at `0` has nilpotent residue and its de Rham complex computes
`H¹_dR`. With `deg z = 2` and `deg u_a = a`, the leading connection matrix has determinant
`(k!!)²(−z)^{(k+1)/2}` for odd `k`, and for even `k` its kernel is generated by
`Σᵢ (−1)ⁱ binomial(k/2, i) zⁱ u_{k−2i}` (FSY Proposition 4.14, Lemmas 4.15 and 4.17, pp. 30–32).

*Proof sketch.* Use the logarithmic comparison of ComplexComparisonPartII §§C5.6–C5.7 at the
regular singular point `0`, filter the complex by the grading, compute the leading determinant or
kernel, and conclude with the dimensions of §5.5.

**Checks.**

- For `k = 3` the basis on `𝔾_m` is `j = 0, 1` and on the cover `j = 0, 1, 2, 3`.
- For `k = 4` the two classes `j = 0, 1` span `H¹_dR` while the middle space is zero.
- For `k = 1`: one class `v₀dz/z`, and the leading determinant is `(1!!)²(−z) = −z`.

*Needs:* §§5.1, 5.5; ComplexComparisonPartII §§C5.6–C5.7.

### 5.7 Weights of the constant quotient in rank two

**Theorem.** For `r = 2` and `k ≥ 1`, the constant quotient `M′^H` of
`0 → M^H → ΠM^H → M′^H → 0` (§3.6) has rank one and is pure of weight `2k + 1` as a mixed Hodge
module on `𝔸¹_τ`: it is `a^*V[1]` for a rank-one constant variation `V` of weight `2k`, hence of type
`(k, k)`. Consequently `ΠM^H` has exactly the weights `k` and `2k + 1`, and
`H¹(𝔸¹_t, FT M′^H)` is one-dimensional of type `(k + 1, k + 1)` (FSY Proposition 2.21 and the end of
its proof, pp. 16–18, with Corollary 4.10, p. 29).

*Proof sketch.* By §5.4, `rank M′ = (k + 1) − k = 1` and the monodromy of `M` at `∞` is one unipotent
block of size `k`. Apply MixedHodgeModulesAndIrregularHodgeTheory §9.6 with `w = nk = k`: the weight
filtration of `ψ_{∞,1}M^H` is the monodromy filtration centred at `k − 1`, so its only nonzero
primitive part is the line `P_{k−1} ⊂ gr^W_{2k−2}ψ_{∞,1}M^H`, and `gr^W_{2k+1}M′^H` is the constant
variation `P_{k−1}(−1)`, of rank one. Since `M′` has rank one, the other graded pieces, including
`W_{k+1}M′^H`, vanish. A rank-one Hodge structure of weight `2k` has type `(k, k)`. The
statement on `H¹(𝔸¹_t, FT M′^H)` is the constant correction of §9.4 there, which raises the weight
by one.

**Checks.**

- `k = 1, 2, 3`: the block of `M` at `∞` has size `1, 2, 3` and centre `0, 1, 2`; the primitive line has
  weight `0, 2, 4`; `V` has weight `2, 4, 6`; `M′^H` has weight `3, 5, 7`; and `H¹(𝔸¹_t, FT M′^H)` has
  type `(2, 2), (3, 3), (4, 4)`, the top classes of §6.4. The general bound `≥ nk + 1` of §3.6 gives
  only `≥ 2, 3, 4`.
- Indexing the primitive part by `k` instead of `k − 1`, as for the block of size `k + 1` of `ΠM`,
  would give `M′^H` weight `2k + 2` and a one-dimensional `H¹(𝔸¹_t, FT M′^H)` of odd weight `2k + 3`,
  which Hodge symmetry excludes; at `k = 1` this is weight `5` in place of the type `(2, 2)`.
- `ΠM^H` is not pure: at `k = 1` its weights are `1`, from `M^H`, and `3`, from `M′^H`. At `k = 1`,
  `M′^H = a^*ℚ(−1)[1]`, which has weight `2` as a variation and `3` as a Hodge module on `𝔸¹`.

*Needs:* §§3.6, 5.4; MixedHodgeModulesAndIrregularHodgeTheory §§5.3, 9.4 and 9.6 (monodromy
filtration of nearby cycles, constant correction, monodromy weights at infinity of the projector).

### Examples

- `k = 3`: `H¹_dR` has basis `v₀³dz/z, zv₀³dz/z`; the middle line is spanned by a combination
  determined by the Hodge filtration of §6.5.
- `k = 4`: irregularity `2`, `H¹_dR` of dimension two, middle zero, and the regular factor at `∞` is
  trivial.

### Dependencies

Layers 2–3. Other roadmaps: MixedHodgeModulesAndIrregularHodgeTheory,
SpringerResolutionAndCharacteristicCycles, ComplexComparisonPartII,
PadicDifferentialEquationsAndRigidCohomology.

## Layer 6: compactifications and Hodge numbers

This layer computes the Hodge filtration of `H¹(𝔾_m, Sym^k Kl₂)` on the explicit bases of §5.6 and the
complete Hodge-number tables, through an explicit toric compactification of the moment potential.

### 6.1 The signed-permutation fan

For `k ≥ 1` define the fan `Σ_k` in `ℤ^k` whose rays are generated by the nonzero vectors of
`{0, ±1}^k` and whose maximal cones are generated by the successive partial sums of a signed
permutation of the standard basis; let `X_k` be its toric scheme over `ℤ`
(ShimuraCompactifications §0.16). On the standard maximal cone the coordinates are
`z_r = y_r/y_{r+1}` for `r < k` and `z_k = y_k`, and `g = Σᵢ(yᵢ + yᵢ⁻¹) = g₁/(z₁⋯z_k)` with
`g₁ = 1 + Σ_{r=2}^k z₁⋯z_{r−1} + (z₁⋯z_k)·Σ_{r=1}^k z_r⋯z_k` (FSY §4.3.2, (4.22)–(4.23), pp. 35–36).
The API proves the following facts.

- `Σ_k` is a complete regular fan with `2^k·k!` maximal cones and `3^k − 1` rays; every maximal cone is
  generated by a unimodular triangular matrix.
- `X_k` is smooth and proper over `ℤ`, by the support criterion of ShimuraCompactifications §0.17,
  and its boundary is a relative strict normal crossings divisor (§0.18).
- `Σ_k` is the normal fan of the lattice polytope `P_k = conv{signed permutations of (1, 2, …, k)}`
  in `ℝ^k`: the linear forms that attain their maximum on `P_k` at the vertex `(k, k − 1, …, 1)` form
  the cone `{ξ₁ ≥ ξ₂ ≥ ⋯ ≥ ξ_k ≥ 0}` spanned by the partial sums `e₁, e₁ + e₂, …, e₁ + ⋯ + e_k`, and the
  signed permutations move vertices and cones together; since `P_k = −P_k` minima give the same fan.
  The support function `h(v) = max_{u ∈ P_k}⟨u, v⟩` takes the value `j(2k − j + 1)/2` on a ray
  with `j` nonzero entries, and is linear exactly on the maximal cones because `(k, …, 1)` has
  distinct nonzero coordinates.
- `X_k` is projective over `ℤ`, hence so is every closed subscheme of `X_k`, such as the closure `K̄`
  of Layer 7: the characters `χ^u`, `u ∈ P_k ∩ ℤ^k`, are sections of the line bundle `O(D_{P_k})` and
  define a closed immersion `X_k → ℙ^{N_k}_ℤ`, `N_k = |P_k ∩ ℤ^k| − 1`, compatible with base change
  (supplier contract gap:toric-polytope-projective-embedding, with AnalyticToricGeometryPartII
  §§0.3 and 0.5).
- The signed permutation group `{±1}^k ⋊ S_k` acts on `Σ_k` and on `X_k`, transitively on maximal
  cones, extending the action on `𝔾_m^k`.
- On the standard chart, `g` and `g₁` are related as displayed.

**Checks.**

- `k = 1`: two rays `±1`, two cones, and `X₁ = ℙ¹`.
- `k = 2`: eight rays and eight maximal cones, distinguishing `Σ₂` from the four-ray product fan of
  `ℙ¹ × ℙ¹`.
- `k = 2`: `g₁ = 1 + z₁ + z₁²z₂² + z₁z₂²`, and dividing by `z₁z₂` with `y₂ = z₂`, `y₁ = z₁z₂` recovers
  `y₁ + y₁⁻¹ + y₂ + y₂⁻¹`.
- Projectivity at `k = 1`: `P₁ = [−1, 1]` has the lattice points `−1, 0, 1`, and the closed immersion
  is the conic `X₁ = ℙ¹ → ℙ²`.
- Projectivity at `k = 2`: `P₂ = {|x| ≤ 2, |y| ≤ 2, |x| + |y| ≤ 3}` has vertices `(±1, ±2)`, `(±2, ±1)`,
  support values `h(1, 0) = h(0, 1) = 2` and `h(1, 1) = 3`, its normal fan has exactly the eight rays
  and eight chambers of `Σ₂`, and it has `21` lattice points, so `N₂ = 20`. The square `[−1, 1]²` is
  not adapted: its support function `|x| + |y|` is linear on each whole quadrant, not only on the
  chambers of `Σ₂`, so it gives a divisor on `X₂` that is not ample.

*Needs:* §4.2; ShimuraCompactifications §§0.16–0.18; AnalyticToricGeometryPartII §§0.3, 0.5 and
gap:toric-polytope-projective-embedding; Tau Ceti toric fans and cones as consumed by those
sections.

### 6.2 A nondegenerate compactification of the moment potential

**Theorem.** Let `k ≥ 1` over a field of characteristic zero. Starting from `ℙ¹_t × X_k`, blow up
successively the intersections of the strict transform of `t = 0` with the toric boundary divisors.
For odd `k` the result is a nondegenerate compactification of `(𝔾_m^{k+1}, t·Σᵢ(yᵢ + yᵢ⁻¹))` with
strict normal crossings boundary, in the sense of MixedHodgeModulesAndIrregularHodgeTheory §10.1.
For even `k` the only failures are at `t = ∞` over the balanced sign points `yᵢ = ±1`, `Σᵢ yᵢ = 0`;
blowing up each of them and then the intersection of its exceptional divisor with the strict
transform of `t = ∞` gives a nondegenerate compactification, whose new divisors `E₁`, `E₂` satisfy
`ord_{E₁}(t·g) = 1` and `ord_{E₂}(t·g) = 0` (FSY §§4.3.2–4.3.3, pp. 35–37).

*Proof sketch.* Check the local monomial models at `t = 0` times each boundary chart; near a balanced
point put `g` in quadratic normal form and compute the two blow-up charts; read off boundary, zero
and pole orders.

**Checks.**

- For `k = 2` there are two balanced sign points, `(1, −1)` and `(−1, 1)`; for odd `k` there are none,
  since a sum of an odd number of `±1` is nonzero.
- `k = 2` at the balanced point `(y₁, y₂) = (1, −1)`: `g = 1 + 1 − 1 − 1 = 0` and the Hessian of `g` is
  `diag(2, −2)`, so in formal Morse coordinates `g = x² − y²`. With `s = 1/t`, the first blow-up has the
  chart `x = sX`, `y = sY`, in which `E₁ = {s = 0}` and `t·g = s²(X² − Y²)/s = s(X² − Y²)`, of order `+1`
  along `E₁`; at a point of `t = ∞` where `g` takes a value `c ≠ 0` the same chart gives `t·g = c/s`, a
  pole of order one, so the zero along `E₁` comes from the critical value `0`.
- For `k = 1`, `g = y + y⁻¹` has nondegenerate critical points `y = ±1` with values `±2 ≠ 0`, and no
  blow-up at `t = ∞` is needed.

*Needs:* §§6.1, 3.1; SchemeAndStackFoundations §§4.11, 4.17; MixedHodgeModulesAndIrregularHodgeTheory
§§10.1–10.2 (good and nondegenerate compactifications, the toric blow-ups).

### 6.3 Newton weights of the moment forms

**Theorem.** For `k ≥ 1`, the monomials of `f_k = Σᵢ xᵢ + zΣᵢ xᵢ⁻¹` lie on `2α₀ + Σᵢ αᵢ = 1`, and its
cone is cut out by `α₀ + Σᵢ εᵢαᵢ ≥ 0`, `εᵢ ∈ {0, 1}`. The Laurent polynomial `f_k` and its cover
`f̃_k` are Newton-nondegenerate exactly when `k` is odd. In that case the Newton degrees of `zʲ` and
`tʲ` are `2j` and `j`, giving the Hodge bounds `k + 1 − 2j` and `k + 1 − j` for the corresponding
top-form classes (FSY §4.3.1, p. 35).

*Proof sketch.* Compute the exponent set, its supporting hyperplane and face equations; the face
critical equations have a balanced sign solution exactly for even `k`; apply the Newton filtration
theorem of MixedHodgeModulesAndIrregularHodgeTheory §10.7.

**Checks.**

- `k = 5`, `j = 2`: the class of `z²v₀⁵dz/z` has Newton degree `4` and Hodge bound `6 − 4 = 2`, the
  class of `t²ṽ₀⁵dt/t` has Newton degree `2` and bound `4`; on `𝔾_m` the classes `j = 0, 1, 2` then
  lie in `F⁶, F⁴, F²` respectively, leaving one class of type `(2, 4)` as in §6.6. Giving `z` Newton
  degree one would put all three classes in `F⁴` and leave no class of type `(2, 4)`.
- `k = 2`: on the face spanned by all monomials, the critical equations `xᵢ² = z` and
  `x₁⁻¹ + x₂⁻¹ = 0` have the torus solution `(x₁, x₂, z) = (1, −1, 1)`, so `f₂` is degenerate; for `k = 3`
  the same equations require three signs `±1` with sum zero, which do not exist in characteristic zero.
- `k = 1`, coordinates `(α₁, α₀)`: the exponents of `x + z/x` are `(1, 0)` and `(−1, 1)`, both on
  `2α₀ + α₁ = 1`, and the Newton polytope `conv({0} ∪ supp)` of MixedHodgeModulesAndIrregularHodgeTheory
  §10.4 is the triangle with vertices `(0, 0)`, `(1, 0)`, `(−1, 1)`, whose only face avoiding the
  origin is the edge joining the two exponents. Its area is `|det((1, 0), (−1, 1))|/2 = 1/2`, and
  `2!·vol = 1` is the dimension of `H²_dR(𝔾_m², E^{x+z/x}) ≅ H¹_dR(𝔾_m, Kl₂)` (§§3.5, 5.5), as
  MixedHodgeModulesAndIrregularHodgeTheory §10.6 requires; the segment spanned by the two exponents
  alone has area `0`.

*Needs:* §§3.1, 5.6; MixedHodgeModulesAndIrregularHodgeTheory §§10.4–10.7 (Newton complex, concentration
and comparison).

### 6.4 Hodge numbers on the double cover

**Theorem.** For `k ≥ 1`, every nonzero Hodge number `h^{p,q}` of `H¹(𝔾_m, Sym^k K̃l₂)` equals one.
For odd `k` they occur at `p + q = k + 1` with `1 ≤ p ≤ k`, and at `(k + 1, k + 1)`. For even `k` they
occur at `p + q = k + 1` with `1 ≤ p ≤ k` and `p ∉ {k/2, k/2 + 1}`, at `(k/2 + 1, k/2 + 1)` and at
`(k + 1, k + 1)`. The middle cohomology is the weight-`(k + 1)` part (FSY Proposition 4.20,
pp. 32–34).

*Proof sketch.* Use the pure Hodge module `M` of rank `k` (§3.6) and its single-block monodromy at
`∞` (§5.4) to compute the rank-one Hodge graded pieces through the pure-input Fourier formula of
MixedHodgeModulesAndIrregularHodgeTheory §9.3; the nearby cycles at `τ = 0` give the extra even-`k`
class of weight `k + 2`, and the constant quotient `M′`, pure of weight `2k + 1` by §5.7, gives the top
Tate class `(k + 1, k + 1)`. The primitive part of the monodromy filtration at `∞` is indexed by
`k − 1`.

**Checks.**

- `k = 2`: only `(2, 2)` and `(3, 3)`, and the middle part is zero.
- `k = 3`: middle `(1, 3), (2, 2), (3, 1)` and the top class `(4, 4)`; total dimension `4 = k + 1`.
- The total dimension is `k + 1` for odd `k` and `(k − 2) + 2 = k` for even `k`, as in §5.5.

*Needs:* §§3.6, 4.1, 5.4–5.5, 5.7; MixedHodgeModulesAndIrregularHodgeTheory §§9.3–9.6 (pure-input
Fourier Hodge numbers, constant correction, weights at infinity).

### 6.5 The Hodge filtration on the explicit bases

**Theorem.** For `k ≥ 1`: on the double cover, `F^pH¹` is spanned by the classes `tʲṽ₀^k dt/t` with
`0 ≤ j < 2⌊(k + 1)/2⌋` and `j ≤ k + 1 − p`; on `𝔾_m`, `F^pH¹` is spanned by `zʲv₀^k dz/z` with
`0 ≤ j < ⌊(k + 1)/2⌋` and `2j ≤ k + 1 − p`. These hold for every integer `p` when `k` is odd and for
`p > k/2` when `k` is even. Pullback sends `zʲv₀^k dz/z` to `2t^{2j}ṽ₀^k dt/t`. A negative bound
means an empty span (FSY Proposition 4.21 and its proof, pp. 34–38).

*Proof sketch.* For odd `k` use §6.3. For even `k` use §6.2: the top form vanishes logarithmically
along `(k − j)E₁ + (k − 2j)E₂`, which gives `j ≤ k/2` on the cover. Filtered blow-up invariance and
`E₁` degeneration (MixedHodgeModulesAndIrregularHodgeTheory §§10.2–10.3), the cover Hodge numbers of
§6.4 and strict `μ₂`-invariants turn the inclusions into equalities.

**Checks.**

- `k = 3`: `F⁴` is spanned by `j = 0`, `F²` contains `j = 0, 1`, and `F⁵ = 0`.
- `k = 2` on `𝔾_m`: only `j = 0 < ⌊3/2⌋ = 1` occurs, so for `p ∈ {2, 3}` the space `F^pH¹` is the line
  spanned by `v₀² dz/z` and `F⁴H¹ = 0` (`2·0 ≤ −1` fails), the single Hodge type `(3, 3)` of §6.6; the
  range `p > k/2 = 1` is exactly the one in which this computation is asserted.
- The factor `2` in the pullback comes from `dz/z = 2dt/t`.

*Needs:* §§6.2–6.4, 5.6, 4.1; MixedHodgeModulesAndIrregularHodgeTheory §§10.2–10.3 and 10.7.

### 6.6 Hodge numbers of the Kloosterman moments

**Theorem.** For `k ≥ 1`, every nonzero Hodge number of `H¹(𝔾_m, Sym^k Kl₂)` equals one. For odd `k`
they occur at `p + q = k + 1` with `p ∈ {2, 4, …, k − 1}`, and at `(k + 1, k + 1)`. For even `k` they
occur at `p + q = k + 1` with `min(p, q) ∈ {2, 4, …, 2⌊(k − 1)/4⌋}`, at `(k/2 + 1, k/2 + 1)` exactly
when `4 ∣ k`, and at `(k + 1, k + 1)`. The middle cohomology is the pure weight-`(k + 1)` part, of
dimension `d_k`, with distinct `p`-indices (FSY Theorem 1.8, p. 7; proof pp. 37–38).

*Proof sketch.* Pull back the bases of §5.6 and use the `μ₂`-invariant filtered comparison with §6.5;
for odd `k` read off the even indices; for even `k` compute the upper half and conclude by Hodge
symmetry and §5.5; separate the top Tate class and the weight-`(k + 2)` class by the weight
decomposition of §4.1.

**Checks.**

- `k = 3`: middle `(2, 2)`; `k = 5`: `(2, 4), (4, 2)`; `k = 6`: `(2, 5), (5, 2)`.
- `k = 4`: no middle classes, an extra `(3, 3)` and the top class `(5, 5)`.
- `k = 7`: middle `(2, 6), (4, 4), (6, 2)`; the Hodge–Tate weights `2, 4, 6` are distinct.

*Needs:* §§6.4–6.5, 5.5, 4.1.

### Examples

- `k = 8`: middle `(2, 7), (7, 2)`, an extra `(5, 5)` since `4 ∣ 8`, and the top class `(9, 9)`; `d₈ = 2`.
- `k = 9`: middle `(2, 8), (4, 6), (6, 4), (8, 2)`; `d₉ = 4`.

### Dependencies

Layers 3–5. Other roadmaps: MixedHodgeModulesAndIrregularHodgeTheory, ShimuraCompactifications,
AnalyticToricGeometryPartII, SchemeAndStackFoundations. Libraries: Tau Ceti.

## Layer 7: arithmetic models and Galois realizations

From now on `r = 2` and `K = K_{2,k} = {Σᵢ(yᵢ + yᵢ⁻¹) = 0} ⊂ 𝔾_m^k` over `ℤ`, with closure `K̄` in the
toric scheme `X_k` of §6.1. The character `χ = χ₁` of `S_k × μ₂` is the sign on `S_k` and trivial on
`μ₂`, and `χ`-parts are images of the projector `e_χ` of §3.2.

### 7.1 Integral boundary geometry

**Theorem.** For `k ≥ 2`, `K̄` is smooth over `ℤ` along the toric boundary, and `K̄ ∖ K` is a relative
strict normal crossings divisor over `ℤ` whose components are the intersections of `K̄` with distinct
boundary components. On the standard chart, `K̄ ∩ (z₁ = 0) = ∅`, and on `K̄ ∩ (z_r = 0)` for `r ≥ 2` the
equation gives `∂g₁/∂z₁ = −1/z₁`, a unit (FSY §5.1.2, pp. 40–41; Remark 3.10, p. 22).

*Proof sketch.* On `g₁ = z_r = 0` solve `1 + z₁A = 0` with `A = 1 + z₂ + ⋯ + z₂⋯z_{r−1}`, so `A = −1/z₁` is
a unit in every residue characteristic; repeat on intersections of distinct boundary components and
transport by signed permutations (§6.1). The derivative need not be a unit on the whole divisor
`z_r = 0`.

**Checks.**

- Over `𝔽₂`, in the `k = 2` chart at `(z₁, z₂) = (1, 0)`: `g₁ = 1 + 1 = 0` and
  `∂g₁/∂z₁ = 1 + z₂² + 2z₁z₂² = 1 = −1/z₁`, so the boundary intersection is smooth there even though
  `2 = 0`.
- For `k = 2` over `ℚ`, `(y₁, y₂) = (1, −1)` satisfies `g = 0` and both derivatives `1 − yᵢ⁻² = 0`, an
  interior singular point of `K` (§7.2); smoothness along the boundary does not extend to smoothness
  of `K̄` everywhere.
- For `k = 2` on the standard chart, `g₁ = 1 + z₁ + z₁²z₂² + z₁z₂²` and `g₁(0, z₂) = 1`, so
  `K̄ ∩ (z₁ = 0) = ∅`.

**Theorem (boundary localization).** Let `k ≥ 2`, `F` a field in which `ℓ` is invertible, and
`π : Y → K̄_F` a proper morphism that is an isomorphism over a neighbourhood of the boundary
`D = K̄_F ∖ K_F`; write `U = π⁻¹(K_F)`, `j : U → Y`, and `D^{(i)}` for the disjoint union of the
`i`-fold intersections of distinct components of `D`, with `D^{(0)} = Y`. Then:

- (a) the complex `ℚ_{ℓ,Y} → ν_{1*}ℚ_ℓ → ν_{2*}ℚ_ℓ → ⋯`, with differentials the alternating sums of
  restrictions for a fixed ordering of the components, resolves `j_!ℚ_ℓ`, and gives a
  `Gal(F̄/F)`-equivariant spectral sequence `E₁^{i,j} = H^j(D^{(i)}_{F̄}, ℚ_ℓ) ⇒ H^{i+j}_c(U_{F̄}, ℚ_ℓ)`;
  every `D^{(i)}` with `i ≥ 1` is smooth and projective over `F`;
- (b) over a finite field, with no hypothesis on the singularities of `Y` away from `D`, `E₁^{i,j}` is
  pure of weight `j` for `i ≥ 1`, and for every `m`
  `gr^W_m H^m_c(U_{F̄}) = gr^W_m im(H^m_c(U_{F̄}) → H^m(Y_{F̄}))`;
- (c) if `F` is finite or of characteristic zero and `Y` is smooth over `F`, the sequence degenerates
  at `E₂` and
  `im(H^m_c(U) → H^m(Y)) = ker(H^m(Y) → H^m(D^{(1)})) = E₂^{0,m}`, which is the weight-`m` quotient of
  `H^m_c(U)`, the kernel of `H^m_c(U) → H^m(Y)` having weights `< m`.

Over a finite field (c) is DeligneWeightsAndPurity §8.24. Over a field of characteristic zero it
holds for the `ℓ`-adic realization by the specialization isomorphisms at a prime where `Y`, `D` and the
`D^{(i)}` have smooth proper models, and for the Betti realization of a complex smooth projective `Y`
it is Deligne's weight spectral sequence (FSY proof of Theorem 5.8, (5.9)–(5.10), pp. 42–43).

*Proof sketch.* Exactness of the resolution is stalkwise: at a point on exactly `c ≥ 1` components
it is the augmented cochain complex of a `(c − 1)`-simplex, and away from `D` only the first term
survives; this uses only that `Y` is smooth along `D` with strict normal crossings there, which is
the first theorem of this section transported by `π`. The strata are smooth by the same theorem and
projective as closed subschemes of `X_k` (§6.1). For (b), the graded pieces `E_∞^{i,m−i}`, `i ≥ 1`,
are subquotients of pure modules of weight `m − i < m` (DeligneWeightsAndPurity §7.15), and `gr^W` is
exact on Frobenius modules (its §0.18), so only `E_∞^{0,m}`, the image of the edge map, contributes
weight `m`; purity of `H^m(Y)` and `E₂` degeneration are not used. For (c), all `E₁` terms are pure of
the weight of their degree and the differentials `d_r`, `r ≥ 2`, change the weight. The
characteristic-zero `ℓ`-adic case reduces to the finite-field case by smooth and proper base change;
the Betti case uses the localization triangles and the purity of projective direct images of
MixedHodgeModulesAndIrregularHodgeTheory §§5.1–5.2 and the strictness of morphisms of
`TauCeti.Hodge.MixedHodgeStructure` for `W`.

**Checks.**

- `k = 3`, `p = 3`: `(1, 1, 1)` lies on `K_{𝔽₃}` since `2 + 2 + 2 = 6 = 0`, and every partial derivative
  `1 − yᵢ⁻²` vanishes there, so `K̄_{𝔽₃}` is singular at an interior point (tangent dimension `3`
  against dimension `2`); DeligneWeightsAndPurity §8.24 does not apply to `Y = K̄_{𝔽₃}`, whereas (b)
  does, since the singular point lies off `D`.
- At `k = 3` and `m = 2`, the terms `E₁^{1,1} = H¹(D^{(1)})` and `E₁^{2,0} = H⁰(D^{(2)})` have weights `1`
  and `0`, so `gr^W₂H²_c(K)` comes from `H²(K̄)` alone.
- The central term need not be pure when `Y` is singular: for a nodal plane cubic, `H¹` is `ℚ_ℓ` of
  weight `0`; this is why (b) uses purity only for `i ≥ 1` and asserts nothing about `E₂` degeneration.

*Needs:* §§6.1, 4.2; ShimuraCompactifications §§0.16–0.18; SchemeAndStackFoundations §4.17; for the
boundary localization also EtaleCohomologyFoundations §§F.2.1–F.2.5 (proper and smooth base change,
compact supports and localization), DeligneWeightsAndPurity §§0.18, 7.15, 8.24,
MixedHodgeModulesAndIrregularHodgeTheory §§5.1–5.2 and Tau Ceti
`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`.

### 7.2 Arithmetic quadratic singularities

**Theorem.** Let `k ≥ 2`. Over an odd residue characteristic `p`, the interior singular points of
`K` are the sign vectors `yᵢ = ±1` with `Σᵢ yᵢ = 0` in `𝔽_p`. For odd `k` their `S_k × μ₂`-orbits are
indexed by the odd `a ≥ 1` with `ap ≤ k`, there are `⌊k/(2p) + 1/2⌋` of them, and the local expansion
over `ℤ_p` has constant term `2ap` and a nondegenerate quadratic term `Q_{ap}`. For even `k` the orbits
are indexed by even `b ≥ 0` with `bp ≤ k`, giving `1 + ⌊k/(2p)⌋` orbits; `b = 0` gives the balanced
points of characteristic zero and positive `b` the additional bad-prime points. For odd `k` and
`p = 2` there is one singular point, `yᵢ = 1`, an isolated nonordinary quadratic singularity at which
the total space over `ℤ₂` is regular (FSY §5.1.3, pp. 41–44; §5.1.4, p. 45).

*Proof sketch.* Solve `1 − yᵢ⁻² = 0` together with `g = 0`; count orbits under permutations and
simultaneous inversion of all signs; compute the Hessian and the constant term in formal Morse
coordinates. At `p = 2`, `g(1, …, 1) = 2k` has `2`-adic valuation one for odd `k`, so the local equation
is not in the square of the maximal ideal and the total space is regular there.

**Checks.**

- `k = 3`, `p = 3`: one orbit, `a = 1`; `k = 9`, `p = 3`: orbits `a = 1, 3`, with constant terms `6` and
  `18`.
- The `a = 3` point at `k = 9`, `p = 3` has constant term of valuation two, so its local equation over
  `ℤ₃[√−3]` is `Q − u·(√−3)^4`, not of unit thickness.
- `k = 6`, `p = 3`: orbits `b = 0, 2`, so `1 + ⌊6/6⌋ = 2`.

*Needs:* §§7.1, 4.2; LefschetzPencilsAndVanishingCycles §§2.1–2.4 (ordinary quadratic points and their
normal form) and §6.6 (isolated singularities); SchemeAndStackFoundations §4.13 (regular schemes).

### 7.3 Resolution of the even moment hypersurfaces

Let `k ≥ 4` be even. Over `ℤ[1/2]`, let `S ⊂ 𝔾_m^k` be the disjoint union of the `binom(k, k/2)`
sections given by the balanced sign vectors (`yᵢ = ±1`, `Σᵢ yᵢ = 0`). Distinct sign vectors stay
distinct modulo every odd prime, and over `ℚ` the set `S` is the singular locus of `K` (§7.2, `b = 0`).
Blow up `𝔾_m^k` and `X_k` along `S`. Since `S` lies in the torus, `Bl_S 𝔾_m^k` is an open subscheme
of `Bl_S X_k` (SchemeAndStackFoundations §4.11). Define two resolutions:

- the open resolution `π : K′ → K`, where `K′` is the strict transform of `K` in `Bl_S 𝔾_m^k`, with
  exceptional locus `T = π⁻¹(S)`;
- the proper resolution `π̄ : K̄′ → K̄`, where `K̄′` is the strict transform of `K̄` in `Bl_S X_k`,
  equal to the closure of `K′`.

Both maps are `S_k × μ₂`-equivariant and are isomorphisms away from `S`. So `π̄` is an isomorphism over
a neighbourhood of `D = K̄ ∖ K`, and `K̄′ ∖ K′ = π̄⁻¹(D) ≅ D`. Thus `π̄` is a morphism `Y → K̄` as in
the boundary localization of §7.1, with `U = K′` and the boundary strata `D^{(i)}`, `i ≥ 1`, of `K̄`.
The case `k = 2` is handled directly, since its middle motive vanishes. The API proves the following
facts (FSY proof of Theorem 5.17, (5.18)–(5.21), pp. 45–48).

- Over `ℚ`, `K′` and `K̄′` are smooth and `K̄′` is projective. `T` is a disjoint union of smooth
  quadrics of dimension `k − 2`, and `K̄′ ∖ K′` is a strict normal crossings divisor.
- Open comparison: `π^* : H^{k−1}_c(K)^χ → H^{k−1}_c(K′)^χ` is surjective, and its kernel is the
  image of `H^{k−2}(T)^χ` under the connecting map, a space of dimension `δ_{4∣k}`, pure of weight
  `k − 2`. So `π^*` is an isomorphism for `k ≡ 2 (mod 4)`, and for every even `k ≥ 4` it is an
  isomorphism on `gr^W_{k−1}` and on `W_{k−3}`. This holds in the Betti, de Rham and `ℓ`-adic
  realizations over `ℚ`, and `ℓ`-adically over `𝔽_p` for odd `p ≠ ℓ` (FSY (5.18), whose printed
  isomorphism omits `H^{k−2}(T)`). The localization sequences of `T ⊂ K′` and `S ⊂ K`, with
  `K′ ∖ T = K ∖ S` and `H^{k−2}(S) = H^{k−1}(S) = H^{k−1}(T) = 0`, give the exact sequence
  `H^{k−2}_c(K′) → H^{k−2}(T) → H^{k−1}_c(K) → H^{k−1}_c(K′) → 0`. The first map has image spanned by the
  hyperplane classes `h^{(k−2)/2}` of the quadrics: `π_*IC_{K′}` is `IC_K` plus summands supported on
  `S` (decomposition theorem), `H^{−1}_c(K, IC_K) = 0` because `K` is affine (perverse Artin vanishing),
  and a linear section of dimension `k/2` of a quadric restricts to a nonzero multiple of its
  `h^{(k−2)/2}`.
- Isotypic count: the stabilizer of a balanced point in `S_k × μ₂` is
  `(S_{k/2} × S_{k/2})·⟨(σ₀, −1)⟩`, `σ₀` exchanging the two halves. It fixes `h^{(k−2)/2}`, which has no
  `χ`-part since a transposition inside one half has `χ = −1`. On the primitive class of the quadric
  `Σ_{yᵢ = 1} zᵢ² − Σ_{yᵢ = −1} zᵢ² = 0` it acts by `+1` or `−1` according as the two rulings are kept or
  exchanged: by `sgn` on `S_{k/2} × S_{k/2}`, and by `+1` on `(σ₀, −1)`, which multiplies the form by
  `−1` and has determinant `(−1)^{k/2}`. As `χ(σ₀, −1) = sgn(σ₀) = (−1)^{k/2}`, `H^{k−2}(T)^χ` has
  dimension `δ_{4∣k}`.
- Proper closure: §7.1 (c) for `Y = K̄′_ℚ` gives
  `gr^W_{k−1}H^{k−1}_c(K′) = im(H^{k−1}_c(K′) → H^{k−1}(K̄′)) = ker(H^{k−1}(K̄′) → H^{k−1}(D^{(1)}))`
  (FSY (5.19)). It also gives `gr^W_{k−2}H^{k−1}_c(K′)` as the `E₂^{1,k−2}` term
  `ker(H^{k−2}(D^{(1)}) → H^{k−2}(D^{(2)})) / im(H^{k−2}(K̄′) → H^{k−2}(D^{(1)}))` (FSY (5.20)).
- The `χ`-part of this `E₂^{1,k−2}` term is zero for every even `k ≥ 4`: `gr^W_{k−2}H^{k−1}_c(K)^χ` has
  dimension `δ_{4∣k}` (FSY Theorem 1.8 with Theorem 3.8, as recalled in the proof of Theorem 5.17,
  p. 45), and the open comparison kills it.
- At an odd prime `p`, `K̄′_{𝔽_p}` is smooth along `K̄′ ∖ K′`. Its singular points are the
  positive-`b` ordinary quadratic points of §7.2, all lying in `K′_{𝔽_p}`.

**Checks.**

- `k = 4`: the six balanced points form one orbit with stabilizer `(S₂ × S₂)·⟨(σ₀, −1)⟩`; the
  transpositions `(12)` and `(34)` exchange the rulings of the quadric surface `z₁² + z₂² − z₃² − z₄² = 0`
  (`χ = −1`), and `(σ₀, −1)` keeps them (`χ = +1`), so `H²(T)^χ` is a line. It is the kernel of
  `H³_c(K)^χ → H³_c(K′)^χ`, the one-dimensional `gr^W₂H³_c(K_{ℚ̄})^χ` dies, and
  `gr^W₂H³_c(K′_{ℚ̄})^χ = 0`; the middle part `gr^W₃` has dimension `d₄ = 0` on both. A version that
  asserts an isomorphism keeps a weight-two class in `H³_c(K′)^χ`.
- `k = 6`: `(σ₀, −1)` has `χ = (−1)³ = −1` and keeps the rulings, so `H⁴(T)^χ = 0`, `π^*` is an
  isomorphism on `χ`-parts and the boundary correction has dimension zero.
- `k = 6`, `p = 3`: the `b = 2` orbit survives the resolution, so the integral model is not smooth
  everywhere.

*Needs:* §§7.1–7.2 (including the boundary localization of §7.1), 3.2; SchemeAndStackFoundations
§§4.11, 4.17; EtaleCohomologyFoundations §F.7 (blow-ups and projective bundles);
EtaleDualityAndPerverseSheaves §2.7 (perverse Artin vanishing) and §§5.6, 5.10 (decomposition
theorem over finite fields and over `ℂ`).

### 7.4 Galois realizations of the moment motives

Define, for `k ≥ 2` and every prime `ℓ`, `V_{k,ℓ} = (gr^W_{k−1}H^{k−1}_c(K_{ℚ̄}, ℚ_ℓ))^χ(−1)` with its
continuous action `r_{k,ℓ}` of `Gal(ℚ̄/ℚ)`, and `V_{1,ℓ} = 0` (FSY (5.5), p. 40; (5.9), pp. 42–43;
(5.19), pp. 46–47). The API proves the following facts.

- `V_{k,ℓ}` is the `ℓ`-adic realization of `M_k` (§4.4), and has dimension `d_k`.
- It carries a perfect `Gal(ℚ̄/ℚ)`-equivariant pairing to `ℚ_ℓ(−k − 1)`, symmetric for odd `k` and
  alternating for even `k`.
- For odd `k`, `V_{k,ℓ}(1)` is the `χ`-part of `ker(H^{k−1}(K̄_{ℚ̄}) → H^{k−1}(D^{(1)}_{ℚ̄}))`, by the
  boundary localization of §7.1 (c) applied to the smooth projective compactification `K̄_ℚ`. For
  even `k ≥ 4`, `V_{k,ℓ}(1)` is the `χ`-part of `ker(H^{k−1}(K̄′_{ℚ̄}) → H^{k−1}(D^{(1)}_{ℚ̄}))` for the
  proper resolution `K̄′ → K̄` of §7.3. This follows from the isomorphism
  `gr^W_{k−1}H^{k−1}_c(K)^χ ≅ gr^W_{k−1}H^{k−1}_c(K′)^χ` given by the open comparison of §7.3 and §7.1 (c)
  for `Y = K̄′_ℚ` (FSY (5.19)).
- Its de Rham and Betti realizations are the filtered middle cohomology of §4.1.

**Checks.**

- `k = 1, 2, 4` give zero-dimensional representations.
- `k = 6` gives a two-dimensional symplectic representation and `k = 7` a three-dimensional
  orthogonal one.
- At a good prime the pairing multiplier of geometric Frobenius is `p^{k+1}`, not `p^{−(k+1)}`.

*Needs:* §§4.4, 6.1, 6.6, 7.1, 7.3; MotivesAndAlgebraicCycles §2.7 and Layer 5 (étale realization)
and gap:nori-weight-filtration; EtaleCohomologyFoundations §F.4.5.

### Examples

- `k = 3`: `V_{3,ℓ}` is one-dimensional with pairing weight `4`.
- `k = 5`: `V_{5,ℓ}` is two-dimensional orthogonal; it is unramified at every prime `p ∉ {3, 5, ℓ}`
  and its conductor is `15` (§8.5).

### Dependencies

Layers 3, 4 and 6. Other roadmaps: ShimuraCompactifications, SchemeAndStackFoundations,
LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations, EtaleDualityAndPerverseSheaves,
DeligneWeightsAndPurity, MixedHodgeModulesAndIrregularHodgeTheory, MotivesAndAlgebraicCycles.
Libraries: Tau Ceti.

## Layer 8: local factors and conductors

This layer identifies the trivial and middle factors of `Z_k(p; T)` at every prime, computes the
local structure of `V_{k,ℓ}` at every prime `p ≠ ℓ`, and derives the Euler factors and conductors.

### 8.1 The middle moment polynomial and its weights

Define `M_k(p; T) = det(1 − F_pT | H¹_mid(𝔾_{m,𝔽̄_p}, Sym^k Kl₂))` for `k ≥ 1`, with geometric Frobenius
and `ℓ ≠ p` (FSY §5.1.1, pp. 39–40). It has constant term `1`; its reciprocal roots are Weil numbers
of weight `k + 1`; and the reciprocal roots are stable under `α ↦ p^{k+1}/α`. The roots of
`M_k(p; T)` in `T` have absolute value `p^{−(k+1)/2}`. The API proves the following facts.

- `M_k(p; 0) = 1`, and `M_k(p; T)` divides `Z_k(p; T)` in `ℚ_ℓ[T]` by the surjection `H¹_c → H¹_mid`.
- Every reciprocal root of `M_k(p; T)` is a `p`-Weil number of weight `k + 1`, by
  DeligneWeightsAndPurity §7.12 (iii) applied to the lisse sheaf `Sym^k Kl₂`, pure of weight `k`.
- The perfect pairing of §1.4 makes the reciprocal roots stable under `α ↦ p^{k+1}/α`.
- The quotient `Z_k(p; T)/M_k(p; T)` is the determinant on the kernel of `H¹_c → H¹`, which is the image
  of the local invariants at `0` and `∞`; its reciprocal roots have weights `0` (one root, at `0`)
  and `k` (from `∞`, only for even `k`).

**Theorem.** For every prime `p` and `k ≥ 1`, `Z_k(p; T) = (1 − T)·Q(T)` with `Q ∈ ℂ[T]` all of whose
roots have absolute value `p^{−(k+1)/2}`, or, only for even `k`, `p^{−k/2}`
(`momentSeries_weights`; FSY §1.1, p. 3, and (5.2)–(5.4), pp. 39–40).

*Proof sketch.* Combine §1.4 with the purity of the middle image and the local invariants of §1.6:
the invariants at `0` form one line with Frobenius `1`, and the invariants at `∞` vanish for odd `k`
and, for even `k`, carry Frobenius eigenvalues of absolute value `p^{k/2}`. The localization sequence
identifies the kernel of `H¹_c → H¹` with the sum of the two invariant spaces. At odd `p` an
alternative route is PadicDifferentialEquationsAndRigidCohomology §RD.6.98 (b) with §RD.7.21a, through
the rigid trace formula, which gives the same polynomial.

**Checks.**

- `M₁ = M₂ = M₄ = 1` at every prime.
- `M₃(2; T) = 1 + 4T`: the reciprocal root is `−4` and the root `−1/4`, of absolute value
  `2^{−2} = 2^{−(3+1)/2}`.
- At `k = 3`, `p = 2` the partner of `−4` is `16/(−4) = −4`; the involution `α ↦ p^{(k+1)/2}/α` would
  send it to `−1`, which is not a root.
- `Z₆(3; T) = (1 − T)(1 + 27T)`: the root `−1/27` has absolute value `3^{−3} = 3^{−6/2}`, a weight-`k`
  boundary root; `M₆(3; T) = 1`.

*Needs:* §§1.2, 1.4, 1.6, 0.3; DeligneWeightsAndPurity §§0.16, 7.12; EtaleCohomologyFoundations §F.5;
PadicDifferentialEquationsAndRigidCohomology §§RD.6.98, RD.7.21a for the alternative odd-prime route.

### 8.2 Degrees and trivial factors

Define `momentDegree p k` as `(k + 1)/2 − ⌊(k + p)/(2p)⌋` for odd `k` and odd `p`, `(k + 1)/2` for odd
`k` and `p = 2`, `k/2 − ⌊k/(2p)⌋` for even `k` and odd `p`, and `⌊(k + 2)/4⌋` for even `k` and `p = 2`;
here `⌊(k + p)/(2p)⌋ = ⌊k/(2p) + 1/2⌋`. The API proves the following facts.

- `momentDegree p k = ⌊(k + 1)/2⌋` for `p > k`, the uniform value.
- `momentDegree p k = (k + 1)/2 − |Θ⁺_p| − |Θ⁻_p|` for odd `k` and odd `p`.
- For even `k`, `k/2 − ⌊k/4⌋ = ⌊(k + 2)/4⌋`, so the even formula at `p = 2` agrees with the odd-`p`
  formula evaluated at `p = 2`.

**Theorem.** For every prime `p` and `k ≥ 1`, `Z_k(p; T)` is a polynomial with integer coefficients,
constant term `1` and degree `momentDegree p k` (`momentSeries_eq_intPolynomial`; FSY (1.5), p. 5,
and (5.1)–(5.4), pp. 39–40). Moreover: for odd `k`, `Z_k = (1 − T)M_k` at every `p`; for even `k` and
odd `p`, with `u = ⌊k/(2p)⌋`, `v = ⌊k/(4p) + 1/2⌋` and `m = u + δ_{4∣k}`,
`Z_k = (1 − T)(1 − (−1)^{(p−1)/2}p^{k/2}T)^v(1 − p^{k/2}T)^{m−v}M_k`; for even `k` and `p = 2`,
`Z_k = (1 − T)(1 − 2^{k/2}T)^{a_k}(1 + 2^{k/2}T)^{b_k}M_k` with `deg M_k = 2⌊(k + 2)/12⌋ − 2δ_{12∣k}`,
where `a_k` and `b_k` are the multiplicities of §1.6. The degree equals `Sw_∞(Sym^k Kl₂)`, computed in
§1.6. At odd `p` the factorization is the `ℓ`-adic form of
PadicDifferentialEquationsAndRigidCohomology §RD.7.21a; the two agree because both sides are
determinants equal to `Z_k(p; T)`, and the content here is the `p = 2` case, the degrees and the
`ℓ`-adic middle factor.

*Proof sketch.* Integrality is §1.5. By §1.4 and the curve Euler–Poincaré formula of
CongruenceSpectralGap §4.2b, `deg Z_k = Sw_∞(Sym^k Kl₂)`, which §1.6 computes; this is
`momentDegree p k`. The kernel of `H¹_c → H¹` is the sum of the invariants at `0` (one line, Frobenius
`1`) and at `∞` (§1.6), and the weights `0`, `k` and `k + 1` (§8.1) separate the factors: at `p = 2` the
eigenvalues `±2^{k/2}` with multiplicities `a_k`, `b_k` of §1.6 give the displayed factorization and
`deg M_k = ⌊(k + 2)/4⌋ − 1 − a_k − b_k`; at odd `p` the weight-`k` factor is the boundary factor of
§RD.7.21a, both being the weight-`k` part of `Z_k(p; T)`, and has degree `m` (§1.6). Fu–Wan for odd `p`
and Yun for `p = 2`, as recorded in FSY §5.1.1, give the same values.

**Checks.**

- `k = 4`: `(1 − T)(1 − p²T)` for odd `p` and `1 − T` for `p = 2`.
- `k = 12`, `p = 2`: degree `⌊14/4⌋ = 3`, `a = b = 1`, `deg M = 0`, and
  `Z₁₂(2; T) = (1 − T)(1 − 64T)(1 + 64T)`; `k = 10`, `p = 2`: `Z₁₀(2; T) = (1 − T)(1 + 24T + 2048T²)` with
  `deg M = 2`.
- `k = 9`, `p = 3`: `⌊(9 + 3)/6⌋ = 2`, degree `5 − 2 = 3`; `k = 3`, `p = 3`: degree `1`, `Z₃(3; T) = 1 − T`.
- `k = 8`, `p = 3`: `u = v = 1`, `m = 2`, and `Z₈(3; T) = (1 − T)(1 + 81T)(1 − 81T)`, so `M₈(3; T) = 1`.

*Needs:* §§1.4–1.6, 8.1; CongruenceSpectralGap §4.2b (curve Euler–Poincaré);
PadicDifferentialEquationsAndRigidCohomology §RD.7.21a at odd primes.

### 8.3 Local structure at odd symmetric powers

**Theorem.** Let `k = 2m + 1 ≥ 1` and `p ≠ ℓ` primes. At `p = 2`, `V_{k,ℓ}` is unramified and
`V_{k,ℓ}[ζ₂]`, as a Frobenius module, is `H¹_mid(𝔾_{m,𝔽̄₂}, Sym^k Kl₂)`. At odd `p`, `V_{k,ℓ}` is tamely
ramified with an orthogonal decomposition `V = M ⊕ E` of `Gal(ℚ̄_p/ℚ_p)`-modules, where `M` is
unramified with `M[ζ_p] = H¹_mid(𝔾_{m,𝔽̄_p}, Sym^k Kl₂)`, and `E` has one line for each
`a ∈ Θ⁺_p ∪ Θ⁻_p`, on which the Galois group acts by `ε_a·χ_cyc^{−m−1}`, `ε_a` the quadratic character
of `ℚ_p(√((−1)^{(1+ap)/2}·2ap))`. Then `V^{I_p} = M ⊕ E⁺` with `E⁺` spanned by the lines with
`a ∈ Θ⁺_p`, on which geometric Frobenius acts by `((−1)^{(1+ap)/2}·2a′/p)·p^{m+1}`,
`a′ = a/p^{v_p(a)}` (FSY Theorem 5.8 and Remark 5.12, pp. 42–44).

*Proof sketch.* Over `ℚ̄_p` the boundary localization of §7.1 (c) identifies `V_{k,ℓ}(1)` with the
`χ`-part of `im(H^{k−1}_c(K) → H^{k−1}(K̄))`; over `𝔽_p` its part (b), which uses purity only on the
smooth proper boundary strata and so applies to the singular special fibre, identifies the
weight-`(k − 1)` part of `H^{k−1}_c(K_{𝔽̄_p})`, hence by §4.5 the middle cohomology
`H¹_mid(𝔾_{m,𝔽̄_p}, Sym^k Kl₂)`, with `gr^W_{k−1}` of `im(H^{k−1}_c(K_{𝔽̄_p}) → H^{k−1}(K̄_{𝔽̄_p}))`.
Compare the two by specialization from `K̄_{ℤ_p}`: at odd `p`
apply LefschetzPencilsAndVanishingCycles §§2.7–2.8 at the ordinary quadratic points of §7.2 and the
discriminant computation of its Layer LPV.2 Examples to split off the vanishing lines; at `p = 2`
apply its §6.6 at the isolated singular point of §7.2, which gives injectivity of specialization, and
conclude by equality of dimensions with §8.2. The character `ε_a` is unramified exactly when the
radicand has even valuation, that is, when `v_p(a)` is odd.

**Checks.**

- `k = 9`, `p = 3`: `Θ⁻₃ = {1}` and `Θ⁺₃ = {3}`; the `a = 1` line is ramified and the `a = 3` line
  unramified, with Frobenius eigenvalue `((−1)^5·2/3)·3^5 = 243`.
- `k = 5`, `p = 3`: `Θ⁻₃ = {1}` and `Θ⁺₃ = ∅`, so `E` is one ramified line and `M` has dimension
  `d₅ − 1 = 1`, matching `Z₅(3; T) = 1 + 26T − 27T² = (1 − T)(1 + 27T)`, whose middle factor
  `M₅(3; T) = 1 + 27T` has degree one.
- `k = 3`, `p = 3`: `Θ⁻₃ = {1}`, `Θ⁺₃ = ∅`, `M = 0`, so `V^{I₃} = 0` and the Euler factor at `3` is `1`.

*Needs:* §§7.1 (boundary localization), 7.2, 7.4, 4.5, 8.2; LefschetzPencilsAndVanishingCycles
§§2.7–2.8, the Examples of Layer LPV.2 and §6.6.

### 8.4 Local structure at even symmetric powers

**Theorem.** Let `k ≥ 2` be even, `p` odd and `ℓ ≠ p`. Inertia acts on `V_{k,ℓ}` unipotently with
`(σ − 1)² = 0`; its logarithm has isotropic image `U` of dimension `u = ⌊k/(2p)⌋`; `V^{I_p} = U^⊥`, and
inertia acts trivially on `V/U`. After adjoining `ζ_p`, `V^{I_p}` is the quotient
`H¹_c(𝔾_{m,𝔽̄_p}, Sym^k Kl₂)/E`, where `E = ℚ_ℓ(0)` if `4 ∤ k`, and `E` is an extension of
`ℚ_ℓ(−k/2)` by `ℚ_ℓ(0)` if `4 ∣ k` (FSY Theorem 5.17, pp. 45–48). This is a quotient, not a direct-sum
splitting.

*Proof sketch.* Use the resolutions of §7.3, the boundary localization of §7.1 for the proper
resolution `Y = K̄′ → K̄` with `U = K′` (part (b)
on the special fibre, which keeps its positive-`b` quadratic points, and part (c) over `ℚ̄_p`), and the
odd-dimensional Picard–Lefschetz transvection formula of LefschetzPencilsAndVanishingCycles §2.8 at
the positive-`b` points; the weights of §8.2 show that the inclusions of invariant and vanishing subspaces are
equalities; the Frobenius on each quadric piece is `(−1)^{bp(p−1)/4}p^{(k−2)/2}` before the twist. The
`χ`-part of the boundary term `E₂^{1,k−2}` vanishes (§7.3), and for `4 ∣ k` the quotient `ℚ_ℓ(−k/2)`
of `E` is the kernel of the open comparison of §7.3 over `𝔽̄_p`, twisted by `(−1)`: the primitive
classes of the `b = 0` quadrics, with Frobenius `p^{(k−2)/2}` before the twist.

**Checks.**

- For `p > k/2`, `U = 0` and `V_{k,ℓ}` is unramified at `p`.
- `k = 6`, `p = 3`: `dim U = 1`, `dim V = 2`, `dim V^{I} = 1`.
- `k = 2`: `V = 0` and every statement is about the zero space.

*Needs:* §§7.1 (boundary localization), 7.3–7.4, 8.2, 4.5; LefschetzPencilsAndVanishingCycles
§§2.7–2.8.

### 8.5 Euler factors and conductor at odd symmetric powers

Define `thetaPlus k p` and `thetaMinus k p` as the finite sets `Θ⁺_p` and `Θ⁻_p`, the power series
`oddEulerFactorInv k p = Z_k(p; T)·(1 − T)⁻¹·Π_{a ∈ Θ⁺_p}(1 − ((−1)^{(1+ap)/2}·2a′/p)·p^{(k+1)/2}T)`
in `ℂ⟦T⟧` for a prime `p`, its inverse `oddEulerFactor k p` (and `1` at non-primes), and the conductor
`oddConductor k = Π_{p odd} p^{|Θ⁻_p|}` (FSY (5.13)–(5.14) and Remark 5.15, pp. 44–45). The API proves
the following facts.

- For odd `k`, every prime `p` and `ℓ ≠ p`, `oddEulerFactorInv k p` is the polynomial
  `det(1 − F_pT | V_{k,ℓ}^{I_p})`, independent of `ℓ`, by §§8.2–8.3.
- `Θ⁺₂ = ∅`, so at `p = 2` the factor is `M_k(2; T)`.
- `oddConductor k = Π_{j ≤ k, j odd} sf(j)`, by counting odd `j ≤ k` according to the parity of
  `v_p(j)`.
- These local factors and the conductor are unchanged by global semisimplification of `V_{k,ℓ}`:
  the inertia images are finite and `N = 0`, and finite-group invariants are exact in characteristic
  zero on a Jordan–Hölder filtration restricted to a decomposition group.

**Theorem.** For odd `k`, the conductor of the compatible system `V_{k,ℓ}` is `oddConductor k`: at
odd `p` the exponent is `dim V − dim V^{I_p} = |Θ⁻_p|`, the Swan term vanishing by tameness, and at
`p = 2` it is zero (ArithmeticGaloisRepresentations §3.3).

**Checks.**

- `k = 9`: `sf(9) = 1` whereas the radical is `3`; `oddConductor 9 = sf(3)sf(5)sf(7)sf(9) = 105`.
- `k = 9`, `p = 3`: the moments `53`, `115181`, `−9408475` over `𝔽₃`, `𝔽₉`, `𝔽₂₇` give
  `Z₉(3; T) = 1 + 53T + 58995T² − 59049T³ = (1 − T)(1 + 54T + 3¹⁰T²)`, so `M₉(3; T) = 1 + 54T + 3¹⁰T²`
  with roots of absolute value `3^{−5}`, and `oddEulerFactorInv 9 3 = (1 + 54T + 3¹⁰T²)(1 − 243T)` has
  degree `3`. Taking the middle factor `M₉(3; T)` alone as the inverse Euler factor loses the
  inertia-invariant line `E⁺` of §8.3.
- `k = 3`: the conductor is `3` and the Euler factor at `3` is `1`.
- `k = 1`: `Θ⁺_p = Θ⁻_p = ∅` for every `p`, the Euler factors are `1`, and `oddConductor 1 = 1`.

*Needs:* §§8.2–8.3; ArithmeticGaloisRepresentations §§1.7, 3.3; Mathlib `legendreSym`,
`padicValNat`, `PowerSeries`.

### 8.6 Euler factors and conductor at even symmetric powers

Define, for even `k` and an odd prime `p`,
`evenEulerFactorInv k p = Z_k(p; T)·(1 − T)⁻¹·(1 − p^{k/2}T)^{−δ_{4∣k}}`, its inverse `evenEulerFactor k p` (and `1` at `p = 2` and at non-primes),
the odd conductor `evenConductor k = Π_{p odd} p^{⌊k/(2p)⌋}` and the dimension `middleDim k = d_k`
(FSY (5.22), pp. 48–49). The API proves the following facts.

- For even `k ≥ 2`, odd `p` and `ℓ ≠ p`, `evenEulerFactorInv k p` is the polynomial
  `det(1 − F_pT | V_{k,ℓ}^{I_p})`: by §8.4 it is `Z_k(p; T)/det(1 − F_pT | E)`, and
  `det(1 − F_pT | E) = (1 − T)(1 − p^{k/2}T)^{δ_{4∣k}}`.
- With `u = ⌊k/(2p)⌋` and `v = ⌊k/(4p) + 1/2⌋`, `evenEulerFactorInv k p` equals
  `M_k(p; T)(1 − p^{k/2}T)^u` for `p ≡ 1 (mod 4)` and `M_k(p; T)(1 + p^{k/2}T)^v(1 − p^{k/2}T)^{u−v}` for
  `p ≡ 3 (mod 4)`, by §8.2.
- `evenConductor k = Π_{2 ≤ j ≤ k, j even} oddRad(j)`.
- The exponent of `p` in the conductor of `V_{k,ℓ}` is `rank N = u`, the Swan term vanishing and
  inertia acting through a unipotent group.

**Theorem.** For even `k ≥ 2`, the conductor of `V_{k,ℓ}` is `2^{r_k}·evenConductor k`, where
`r_k = Sw₂(V_{k,ℓ}) + codim V_{k,ℓ}^{I₂} ≥ 0` (FSY §5.1.4, p. 49). No formula for `r_k` is asserted.

**Checks.**

- `k = 6`, `p = 3`: the extra factor in `L⁻¹` is `1 + 27T`, and `evenEulerFactorInv 6 3 = 1 + 27T`.
- The even formula uses odd radicals and the odd formula square-free parts: `evenConductor 6 = 3`,
  while `Π_{j ≤ 5 odd} sf(j) = 15`.
- `k = 4`, odd `p`: `Z₄ = (1 − T)(1 − p²T)` and `δ_{4∣4} = 1`, so `evenEulerFactorInv 4 p = 1`.

*Needs:* §§8.2, 8.4; ArithmeticGaloisRepresentations §3.3; Mathlib `PowerSeries`.

### Examples

- `k = 5`: Euler factors `M₅(p; T)⁻¹` at `p ≠ 3, 5`; at `p = 3`, `Θ⁻₃ = {1}` and the factor is
  `M₅(3; T)⁻¹ = (1 + 27T)⁻¹`; at `p = 5`, `Θ⁻₅ = {1}` and the factor is `(1 − 125T)⁻¹`; conductor `15`.
  At `p = 2`, `M₅(2; T) = 1 − 4T + 64T²` and the Euler factor is
  `M₅(2; T)⁻¹ = 1 + 4T − 48T² + ⋯`; the product is `1 + (4 − 4)T + (−48 − 16 + 64)T² + ⋯ = 1 + O(T³)`,
  whereas taking `M₅(2; T)` itself as the factor would give the coefficient `−4` of `2^{−s}` in place
  of `+4`.
- `k = 8`: odd conductor `evenConductor 8 = 3`, and at `p = 3` the inverse factor is `1 + 81T`.

### Dependencies

Layers 1, 4 and 7. Other roadmaps: CongruenceSpectralGap, DeligneWeightsAndPurity,
LefschetzPencilsAndVanishingCycles, ArithmeticGaloisRepresentations,
PadicDifferentialEquationsAndRigidCohomology, EtaleCohomologyFoundations. Libraries: Mathlib.

## Layer 9: the `p`-adic comparison and compatible systems

### 9.1 The `p`-adic realization of the moment motives

**Theorem.** For every `k ≥ 2` and every prime `p`, the geometric hypotheses of
PadicDifferentialEquationsAndRigidCohomology §RD.7.21 hold for `V_{k,p}`: the toric compactification
`K̄`, for even `k` the open resolution `K′ → K` and its proper closure `K̄′ → K̄` of §7.3, their
boundary strata, the projector `e_χ` and the identification of `V_{k,p}(1)` with the `χ`-part of the weight-`(k − 1)` boundary
kernel (§§6.1, 7.1, 7.3–7.4), together with the rigid analogues of PadicDifferentialEquationsAndRigidCohomology
§RD.6.98. The comparison hypothesis `(C_dR)` holds by CohomologyComparisons §2.13, and `D_dR(V_{k,p})`
is the filtered middle de Rham cohomology of §4.1 over `ℚ_p`. Consequently `V_{k,p}` is de Rham for
every `p`, including `p = 2`; for odd `p` with `p > k` (odd `k`) or `p > k/2` (even `k`) it is crystalline
with `H¹_{rig,mid}(𝔾_m, Sym^k Kl₂) ⊗ K ≅ D_cris(V_{k,p}) ⊗ K`; and for every odd `p` it is semistable over
`ℚ_p(√−p)` with a Frobenius-compatible injection of the rigid middle module into `D_st`. Further, the
filtered input of §RD.7.22 holds by §§4.1 and 6.6, so for every odd `p` the Newton polygon of
`H¹_{rig,c}` lies above the compact-support Hodge polygon and the coefficients of
`Z_k(p; T) = Σ c_nTⁿ` satisfy `v_p(c_n) ≥ n(n − 1)`, the odd-`p` case of `momentSeries_coeff_dvd`
(§11.2) (FSY Proposition 5.23, pp. 49–51; Corollary 5.27 and Remark 5.28, pp. 51–52). The conclusions
are those of §§RD.7.21–RD.7.22; this target supplies their hypotheses.

*Proof sketch.* The geometric identifications are §§7.1–7.4 and §4.3. At good odd primes the model is
smooth and CohomologyComparisons §§3.4–3.5 apply. At bad odd primes the semistable model is obtained
from the quadratic points of §7.2: at points of unit thickness §RD.7.20 applies directly, and at
points of higher thickness (positive `a` or `b` divisible by `p`) the extension of §RD.7.20 in the
supplier contract (gap:higher-thickness-picard-lefschetz) applies; CohomologyComparisons §§4.3–4.4
then give `(C_st)`.

**Checks.**

- `k = 6`, `p = 5 > k/2`: the crystalline case, with
  `Z₆(5; T) = 1 − 151T + 78275T² − 78125T³ = (1 − T)(1 − 150T + 78125T²)`, a middle factor of full
  degree `d₆ = 2` and no boundary factor of slope `3`; the coefficient valuations `0, 0, 2, 7` meet the
  bounds `0, 0, 2, 6`.
- `k = 5`, `p = 2`: `V_{5,2}` is de Rham at `2` but no semistable model is used there; the valuation
  bound at `2` comes from §11.2, and `Z₅(2; T) = 1 − 5T + 68T² − 64T³` has valuations `0, 0, 2, 6`.
- `k = 9`, `p = 3`: the `a = 3` point has thickness two, so this case needs the higher-thickness
  contract; the `a = 1` point has unit thickness.
- `k = 3`, `p = 3`: `Z₃(3; T) = 1 − T` satisfies the valuation bound trivially, also when the middle
  space vanishes.

*Needs:* §§4.1, 4.3, 6.6, 7.1–7.4; PadicDifferentialEquationsAndRigidCohomology §§RD.6.98, RD.7.20,
RD.7.21, RD.7.22 and gap:higher-thickness-picard-lefschetz; CohomologyComparisons §§2.13, 3.4–3.5,
4.3–4.4; PadicHodgeTheory §3.2.

### 9.2 Regular polarized moment systems

**Theorem.** For each `k ≥ 1` the family `{r_{k,ℓ}^{ss}}_ℓ` is a weakly compatible system over `ℚ`
with rational Frobenius polynomials, pure of weight `k + 1`, de Rham at `ℓ` and crystalline for `ℓ` large,
with distinct Hodge–Tate weights equal to the `p`-indices of the middle Hodge table of §6.6, in the
convention `HT(χ_cyc) = −1`. It carries a perfect pairing of parity `(−1)^{k+1}` with multiplier
`χ_cyc^{−k−1}`: orthogonal with even multiplier for odd `k`, symplectic with odd multiplier for even
`k`. Hence it is regular, totally odd and polarized in the sense of
PotentialModularityAndCompatibleSystems §§1.5–1.6. For `k = 1, 2, 4` the system is zero, and for
`k = 3` it is a character (FSY §5.3.3, pp. 57–58).

*Proof sketch.* Weak compatibility at almost all primes comes from §§4.5 and 8.2. The good-prime part
of §9.1 gives the de Rham and crystalline properties and identifies the Hodge–Tate multiset; the
supplier PadicHodgeTheory §3.2 uses the opposite sign, and its weights are negated. The pairing of
§7.4 passes to the semisimplification by the supplier contract gap:semisimplification-similitude-form
with `g* = χ_cyc(g)^{−k−1}g⁻¹`. Check the sign of the multiplier at complex conjugation in both
parities against the polarization of ArithmeticGaloisRepresentations §7.4.

**Checks.**

- `k = 7`: Hodge–Tate weights `2, 4, 6` here and `−2, −4, −6` in the supplier's convention; both are
  regular, and the orthogonal multiplier is even.
- `k = 6`: weights `2, 5`, and the symplectic multiplier is odd.
- Weak compatibility alone does not determine the Euler factor at `2` for even `k`.

*Needs:* §§4.5, 6.6, 7.4, 8.2–8.4, 9.1; PotentialModularityAndCompatibleSystems §§1.1, 1.5–1.6;
ArithmeticGaloisRepresentations §§1.7, 7.4 and gap:semisimplification-similitude-form; PadicHodgeTheory
§3.2.

### Examples

- `k = 5`: a rank-two orthogonal system with Hodge–Tate weights `2, 4` and multiplier `χ_cyc^{−6}`.
- `k = 3`: the character `χ_{−3}χ_cyc^{−2}`, with Hodge–Tate weight `2`.

### Dependencies

Layers 4, 6–8. Other roadmaps: PadicDifferentialEquationsAndRigidCohomology, CohomologyComparisons,
PadicHodgeTheory, PotentialModularityAndCompatibleSystems, ArithmeticGaloisRepresentations.

## Layer 10: determinants, gamma factors and completion

### 10.1 Determinants of the odd moment systems

**Theorem.** For odd `k ≥ 1`, `det r_{k,ℓ} = χ_{k!!}·χ_cyc^{(1−k²)/4}`, where `k!! = 1·3·5⋯k` and
`χ_{k!!}` is the quadratic character of `ℚ(√(±k!!))`, with the sign `+` for `k ≡ 1, 7 (mod 8)` and `−`
otherwise (the trivial character when `±k!!` is a square). For `k = 4r + 3` the unique middle Hodge
line of bidegree `((k + 1)/2, (k + 1)/2)` has complex-conjugation sign `−1` (FSY proof of
Corollary 5.30, pp. 52–53; §5.3.1, p. 55).

*Proof sketch.* Compute `det(F_p)` at good primes `p > k` from Fu–Wan's determinant formula as
recorded by FSY, identify the character by ArithmeticGaloisRepresentations §5.3, and on the Hodge
decomposition pair conjugate unequal bidegrees: `det(c) = (−1)^{#pairs}·ε`, and the determinant
character forces `ε = −1` on the middle line.

**Checks.**

- `k = 3`: the quadratic field is `ℚ(√−3)` and the cyclotomic exponent `−2`; this matches
  `M₃(p; T) = 1 − (p/3)p²T`.
- `k = 7`: `7!! = 105` and the sign is `+`; a uniform minus sign fails here.
- `k = 1`: `d₁ = 0`, the determinant of the zero space is trivial, and `(1 − 1)/4 = 0`.

*Needs:* §§6.6, 9.2; ArithmeticGaloisRepresentations §5.3.

### 10.2 Gamma factors

Define `paperGamma d s = π^{−ds/2} Π_{j=1}^d Γ((s − j)/2)` with Mathlib's `Complex.Gamma`. The API
proves the following facts.

- With `Γ_ℝ(s) = π^{−s/2}Γ(s/2)`, `Π_{j=1}^d Γ_ℝ(s − j) = π^{d(d+1)/4}·paperGamma d s`.
- `paperGamma 0 s = 1`.
- `paperGamma d` is meromorphic on `ℂ` with poles only at `s ∈ {j − 2m : 1 ≤ j ≤ d, m ≥ 0}`.

**Theorem.** The archimedean factor of `M_k` given by the Hodge recipe of
PotentialModularityAndCompatibleSystems §1.15, with the middle Hodge table of §6.6 and the real sign
of §10.1 on the middle line, is `Π_{j=1}^{d_k} Γ_ℝ(s − j) = π^{d_k(d_k+1)/4}·paperGamma d_k s` (FSY
Corollary 5.30, pp. 52–53; §5.2, p. 52). The constant factor does not change any functional equation.

**Checks.**

- `k = 3`, `d = 1`: the standard factor is `Γ_ℝ(s − 1) = π^{1/2}·paperGamma 1 s`.
- `k = 5`, `d = 2`: `Γ_ℝ(s − 1)Γ_ℝ(s − 2) = π^{3/2}·paperGamma 2 s`, which is `Γ_ℂ(s − 2)` by the
  duplication formula `Γ_ℝ(z)Γ_ℝ(z + 1) = Γ_ℂ(z)`.
- `k = 4`, `d = 0`: both factors are `1`.

*Needs:* §§6.6, 10.1; PotentialModularityAndCompatibleSystems §1.15; Mathlib `Complex.Gamma`.

### 10.3 Epsilon factors

**Theorem.** Fix `ψ_p(x) = exp(2πi{x})` with `vol(ℤ_p) = 1` at finite `p`, `ψ_∞(x) = exp(−2πix)` with
Lebesgue measure, geometric reciprocity, and the Weil–Deligne relation `ρ(F)Nρ(F)⁻¹ = p⁻¹N`. With the
local constants of ArithmeticGaloisRepresentations §2.7: for odd `k` and odd `p` the factor is
`w_p·p^{|Θ⁻_p|((k+2)/2 − s)}` with `w_p² = (−1, ±k!!)_p`; at unramified primes, including `2`, it is
`1`; at `∞` it is `(−i)^{(k²−1)/8}`; and the global product is `±N_k^{(k+2)/2 − s}`. For even `k` and odd `p`
it is `(−1)^{v_p}p^{u_p((k+2)/2 − s)}` with `u_p = ⌊k/(2p)⌋`, `v_p = u_p` for `p ≡ 1 (mod 4)` and
`v_p = ⌊k/(4p)⌋` for `p ≡ 3 (mod 4)`; at `∞` it is `(−1)^{δ_{8∣k}}`. The factor at `2` for even `k` is
kept as the local constant of `V_{k,ℓ}` at `2` (FSY §5.3.1, (5.31)–(5.36), Remarks 5.35 and 5.37,
pp. 53–56).

*Proof sketch.* Apply `ε(WD) = ε₀·det(−p^{−s}F | V^I/(ker N)^I)`. For odd `k`, `N = 0`, the
determinant is §10.1 and local duality applies; the Hilbert product formula controls the global
sign. For even `k` use the unipotent inertia of §8.4 and the eigenvalues on `U`; the archimedean sign
comes from the Hodge table. At `∞` the Hodge recipe gives the constant `i^A` for the character
`exp(2πix)`, the one for which ArithmeticGaloisRepresentations §2.7 gives `sgn` the constant `i`:
each pair of conjugate middle types `(p, q)`, `p < q`, contributes `q − p + 1` to `A` and a middle line
of sign `−1` (§10.1) contributes `1`, and for odd `k` the table of §6.6 gives `A = (k² − 1)/8` (FSY
§5.3.1, p. 55). The additive-character scaling law of §2.7 there multiplies the constant of a
parameter `V` by `det V(−1)` when `exp(2πix)` is replaced by `exp(−2πix)`. For odd `k`,
`det(r_{k,∞})(−1)` is the value at `−1` of the archimedean component of the Hecke character of
`det r_{k,ℓ} = χ_{k!!}χ_cyc^{(1−k²)/4}` (§10.1): the cyclotomic factor contributes a power of `|·|`,
which is `1` at `−1`, and `χ_{k!!}` contributes `sgn` exactly when `ℚ(√(±k!!))` is imaginary, that is
when `k ≡ 3, 5 (mod 8)`; this sign is `(−1)^A`, so the factor for `exp(−2πix)` is `(−i)^A`. For even
`k` the parameter at `∞` is a sum of representations induced from `ℂ^×` by characters `z^{−p}z̄^{−q}`
with `p + q = k + 1` odd, each of determinant `−(−1)^{p+q} = +1` at `−1`, so `(−1)^{δ_{8∣k}}` is the
factor for both characters. Reversing all local characters at once changes the global product by
the Hecke character of `det r_k` at the principal idele `−1`, which is `1`.

**Checks.**

- `k = 6`, `p = 3`: `u = 1`, `v = ⌊6/12⌋ = 0`, so the local sign is `+1`, although the inverse Euler
  factor is `1 + 27T`.
- `k = 6`, `p = 3`, monodromy term: inertia acts trivially on the Weil–Deligne representation,
  `ker N = U` is the line with Frobenius eigenvalue `−27` (§§8.4, 8.6), and `FNF⁻¹ = 3⁻¹N` gives the
  eigenvalue `3·(−27) = −81` on the line `V/ker N`; so the factor is `det(−3^{−s}·(−81)) = 3^{4−s}`, the
  stated `p^{u_p((k+2)/2 − s)}` with `u₃ = 1`. Discarding `N` leaves an unramified representation with
  factor `1` and conductor exponent `0` instead of `1`.
- `k = 3`: at `∞` the parameter of `r_{3,ℓ} = χ_{−3}χ_cyc^{−2}` is `sgn·|·|^{−2}`, with constant `i` for
  `exp(2πix)` and `sgn(−1)·i = −i` for `exp(−2πix)`, which is `(−i)^{(9−1)/8}`. At `3` the local
  character has conductor exponent `1` and value `1` at `3`, a norm from `ℚ₃(√−3)`, and the Gauss sum
  `Σ_{y = 1, 2}(y/3)·exp(2πiy/3) = i√3` gives `w₃ = i`, with `w₃² = (−1, −3)₃ = −1`. The product
  `w₃·(−i)·3^{5/2 − s} = 3^{5/2 − s}` has sign `+1`, the root number of `L(s, χ_{−3})` (§11.3); the value
  `i` at `∞` would give `−1`.

*Needs:* §§6.6, 8.3–8.4, 10.1–10.2; ArithmeticGaloisRepresentations §§2.7, 3.3.

### 10.4 Completed moment `L`-functions

For odd `k` and every prime `p`, and for even `k` and every odd prime `p`, the Euler factor of `M_k` at
`p` is `L_{k,p}(T) = det(1 − F_pT | V_{k,ℓ}^{I_p})⁻¹` for an auxiliary `ℓ ≠ p`; by §§8.5–8.6 it is
`oddEulerFactor k p`, respectively `evenEulerFactor k p`, so it is independent of `ℓ` and has rational
coefficients. The Euler factor and the conductor exponent at `2` for even `k` are invariants of
`V_{k,ℓ}` at `2` whose independence of `ℓ` is proved in §11.2; they enter only the completed function
of §11.5. For a family `L` of power series indexed by `ℕ`, define
`eulerCoeff L n = Π_{p^j ∥ n}[T^j]L(p; T)`, so that `L_k(s) = LSeries (eulerCoeff (oddEulerFactor k)) s`
for odd `k`. Every `oddEulerFactor k p` and `evenEulerFactor k p` has constant coefficient `1`, being
`1` or the inverse of a series with constant coefficient `1`. Define the completed functions (FSY §1.1,
pp. 2–4; (5.13)–(5.14), pp. 44–45; (5.22), pp. 48–49):

- for odd `k`, `Λ_k(s) = N_k^{s/2}·paperGamma d_k s·L_k(s)` with `N_k = oddConductor k` and
  `d_k = (k − 1)/2`;
- for even `k`, `Λ′_k(s) = (N′_k)^{s/2}·paperGamma d_k s·LSeries (eulerCoeff (evenEulerFactor k)) s`,
  whose Dirichlet series is the Euler product over the odd primes, with `N′_k = evenConductor k` and
  `d_k = middleDim k`.

The API proves the following facts.

- For every family `L`, `eulerCoeff L 1 = 1` and `eulerCoeff L (mn) = eulerCoeff L m · eulerCoeff L n`
  for coprime `m, n`; for a prime `p` and `j ≥ 1`, `eulerCoeff L (p^j) = [T^j]L(p; T)`. The value at
  `n = 0` is `1`, a junk value that `LSeries` ignores.
- Euler product: if `[T⁰]L(p; T) = 1` for every prime `p` and `LSeriesSummable (eulerCoeff L) s`, then
  for every prime `p` the series `Σ_j [T^j]L(p; T)·p^{−js}` converges absolutely, and
  `LSeries (eulerCoeff L) s = Π_p Σ_j [T^j]L(p; T)·p^{−js}`, the product converging. This is Mathlib's
  `EulerProduct.eulerProduct_tprod` applied to `f = LSeries.term (eulerCoeff L) s`, not to the raw
  `n ↦ eulerCoeff L n·n^{−s}`, whose value at `n = 0` is `eulerCoeff L 0·0^{−s}` and equals `1` at
  `s = 0`. The function `f` satisfies `f 0 = 0` by definition and `f 1 = 1`. It is multiplicative
  on coprime arguments by `Complex.natCast_mul_natCast_cpow`, and `‖f‖` is summable by
  `LSeriesSummable` and `summable_norm_iff`. Its value at `p^j` is `[T^j]L(p; T)·p^{−js}`, for
  `j = 0` by the normalization. When `L(p; T)` is the
  expansion at `0` of a rational function and `|p^{−s}|` is smaller than its radius of convergence,
  the `p`-th factor is the value `L(p; p^{−s})`.
- Neither hypothesis can be dropped, and absolute convergence of the product of the evaluated
  factors does not imply summability of the Dirichlet series (Checks).
- Removing finitely many Euler factors multiplies the completed function by the product of their
  inverses.
- The standard completion with `Π Γ_ℝ(s − j)` differs from the one above by `π^{d_k(d_k+1)/4}`.
- Real logarithms are used for `N_k^{s/2}` and `(N′_k)^{s/2}`.

**Checks.**

- Normalized geometric factors: for `L(p; T) = (1 − a_pT)⁻¹`, `eulerCoeff L 1 = 1`,
  `eulerCoeff L (p^j) = a_p^j` and `eulerCoeff L 6 = a₂a₃`, and both expansions of the `p`-th factor
  have constant coefficient `1`.
- Without normalization: `L(2; T) = 2` and `L(p; T) = 1` for `p ≠ 2` give `eulerCoeff L n = 1` for
  `n = 1` and `0` for `n > 1`, so the Dirichlet series is `1` while the product of the factors is `2`.
- The `n = 0` term: for the normalized constant family `L(p; T) = 1` and `s = 0`, `eulerCoeff L n` is
  `1` at `n = 0, 1` and `0` for `n ≥ 2`. The Dirichlet terms, which are `0` at `n = 0` by convention,
  sum to `1`, as does the Euler product `Π_p 1`. The raw summands `eulerCoeff L n·n^{−s}` take the
  value `1·0⁰ = 1` at `n = 0` and sum to `2`, so they violate the hypothesis `f 0 = 0` of the Euler
  product theorem.
- Without summability: `L(p; T) = 1 + T − T²` for every `p` is normalized and `L(p; 1) = 1`, so at
  `s = 0` the product of the evaluated factors converges absolutely to `1`, but `eulerCoeff L p = 1` for
  every prime and the Dirichlet series does not converge.
- `k = 4`: `d₄ = 0`, every odd-prime Euler factor is `1` and `Λ′₄ = 1`.
- `k = 3`: the reflection is `s ↦ 5 − s` with centre `5/2`, and `Λ₃(s) = 3^{s/2}π^{−s/2}Γ((s − 1)/2)L(s − 2, χ_{−3})`.
- `k = 6`: the factor of `Λ′₆` at `3` is `(1 + 27·3^{−s})⁻¹`, and no factor at `2` occurs in `Λ′₆`.

*Needs:* §§8.5–8.6, 10.2; Mathlib `LSeries`, `LSeries.term`, `LSeriesSummable`, `summable_norm_iff`,
`Complex.natCast_mul_natCast_cpow`, `EulerProduct.eulerProduct_tprod`.

### Examples

- `k = 1, 2, 4`: every middle Euler product and completion is `1`.
- `k = 5`: `Λ₅(s) = 15^{s/2}π^{−s}Γ((s − 1)/2)Γ((s − 2)/2)L₅(s)`, and `L₅(s) = L(f₃, s − 2)` for the weight-three
  newform of level `15` with character `(·/15)` (FSY Table 1, p. 4).

### Dependencies

Layers 6, 8 and 9. Other roadmaps: ArithmeticGaloisRepresentations,
PotentialModularityAndCompatibleSystems. Libraries: Mathlib.

## Layer 11: potential automorphy and functional equations

### 11.1 Potential automorphy of the moment systems

**Theorem.** For `k ∉ {1, 2, 4}`, after enlarging the coefficient field the semisimplified system
`{r_{k,ℓ}^{ss}}` becomes, over one finite totally real Galois extension of `ℚ`, a direct sum of
systems attached to regular algebraic cuspidal polarized automorphic representations; it is
potentially isobaric automorphic, and its `L`-function continues meromorphically with the dual
functional equation (FSY Theorem 5.38, Corollary 5.39 and §5.3.3, pp. 56–58). Cuspidality of the
whole system is not asserted.

*Proof sketch.* Match coefficient field, weight, regularity and polarization of §9.2 to the
hypotheses of ModularityAndLanglandsExtensions §2.42 and apply it; §2.49 gives the analytic
consequences.

**Checks.**

- `k = 3`: the system is a Hecke character, automorphic over `ℚ` itself.
- `k = 5`: the system has rank two with Hodge–Tate weights `2, 4`, distinct, so it is regular; at
  `p = 2` its Frobenius polynomial `M₅(2; T) = 1 − 4T + 64T²` has reciprocal roots `2 ± 2√−15`, of
  absolute value `8 = 2^{(5+1)/2}`, the purity at `p = 2` that the automorphic conclusion forces.
- `k = 6`, `p = 3`: the inverse Euler factor `1 + 27T` has degree `1 < 2 = d₆`, because inertia acts
  through a nontrivial unipotent group (§8.4); the potentially automorphic system keeps this
  ramification rather than becoming unramified at `3`.

*Needs:* §9.2; ModularityAndLanglandsExtensions §§2.42, 2.49.

### 11.2 Local factors under semisimplification

**Theorem.** For every `k ≥ 1`, prime `p` and `ℓ ≠ p`, the Weil–Deligne representation of `r_{k,ℓ}`
at `p` is pure of weight `k + 1` and has the same local `L`-factor and epsilon factor as that of
`r_{k,ℓ}^{ss}`. The local `L`-polynomials are independent of `ℓ` with coefficients in `ℚ`; the epsilon
factors agree after compatible embeddings into `ℂ` with the characters and measures of §10.3; the
conductor is independent of `ℓ`. In particular `L_{k,2}(T)` is the inverse of a polynomial in `ℚ[T]`
with constant term `1` (FSY Lemma 5.40, p. 58).

*Proof sketch.* Strict purity of the semisimplified system (§11.1) and a global Jordan–Hölder
filtration restricted to a decomposition group put the local representation in the situation of
ArithmeticGaloisRepresentations §2.6 (purity from a pure graded) and §2.7 (equality of local
constants). Rationality follows from coefficient-field automorphisms.

**Theorem (Frobenius slopes at the coefficient prime `2`).** Let `k ≥ 1` be odd and `ℓ ≠ 2`. Let `F′`
be the totally real field of §11.1, over which `r_{k,λ}^{ss}|G_{F′} ≅ ⊕_i r_{π_i,λ}` for regular
algebraic polarized cuspidal representations `π_i` of `GL_{n_i}`, and `v` a place of `F′` above `2`.
Then, after compatible embeddings into `ℂ`,
`WD(r_{k,2}^{ss}|G_{F′_v})^{F-ss} ≅ ⊕_i rec(π_{i,v}|det|^{(1−n_i)/2}) ≅ WD(r_{k,ℓ}^{ss}|G_{F′_v})^{F-ss}`,
the left side formed with Fontaine's `D_pst`, keeping `N` and the inertia action. Consequently the
Frobenius slopes of `D_pst(V_{k,2}|G_{ℚ₂})` are the `2`-adic valuations of the reciprocal roots of
`M_k(2; T)`, with multiplicity (FSY Remark 5.41, p. 59).

*Proof sketch.* By §11.1 the decomposition over `F′` holds at every `λ`, including `λ | 2`, since both
sides are semisimple with the same Frobenius polynomials at almost all places
(ArithmeticGaloisRepresentations §5.3). AutomorphicGaloisRepresentationsPartII Layer AG2.6
(totally real polarized coefficient-prime descent), whose premise `ExtremelyRegularIrreducibility n`
is ModularityAndLanglandsExtensions §2.43, identifies each `WD(r_{π_i,2}|G_{F′_v})^{F-ss}` with
`rec(π_{i,v}|det|^{(1−n_i)/2})`, and its Layer AG2.5 does the same at `ℓ ≠ 2`. By §8.3, `V_{k,ℓ}` is
unramified at `2` with Frobenius polynomial `M_k(2; T)`. `D_pst` is exact on potentially semistable
representations (PadicHodgeTheory §5.3), and `V_{k,2}` is de Rham at `2` (§9.1), hence potentially
semistable (NoncommutativeAndEquivariantIwasawa §F.6, `deRham_iff_potentiallySemistable`); so
`V_{k,2}` and `r_{k,2}^{ss}` have the same Frobenius slopes. These
slopes are read off on the finite-index subgroup `W_{F′_v}`: a slope is `v₂(β)/f_v` for an eigenvalue
`β` of the Frobenius of `F′_v`, `f_v` its residue degree. No isomorphism of Weil–Deligne
representations over `ℚ₂` itself is asserted.

**Corollary.** For `k ≥ 1` and a prime `p` with `p` odd or `k` odd, every coefficient `c_n` of
`Z_k(p; T) = Σ c_nTⁿ` is an integer divisible by `p^{n(n−1)}` (`momentSeries_coeff_dvd`; FSY Corollary
5.27 and Remark 5.28, pp. 51–52, for odd `p`; Remark 5.41, p. 59, for `p = 2`). For odd `p` this is the
conclusion of §9.1; the case `p = 2`, `k` odd, is proved here.

*Proof sketch.* Let `p = 2` and `k` odd. Over a finite extension `L/ℚ₂` over which `V_{k,2}` becomes
semistable, `D_st,L(V_{k,2})` is weakly admissible (FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.3.3, `dSt_isWeaklyAdmissible`), so its Newton polygon lies above its Hodge polygon
(§R07.3.2, `isWeaklyAdmissible_iff_polygon`), whose slopes are the `p`-indices `2, 4, …, k − 1` of the
middle Hodge table of §6.6 (FSY convention, PadicHodgeTheory §3.2 for the sign). By the preceding
theorem the Newton polygon of `M_k(2; T)` lies above the polygon with these slopes. Restoring the
factor `1 − T` of §8.2 adds the slope `0`, and the polygon with slopes `0, 2, …, k − 1` passes through
`(n, n(n − 1))`; the coefficients are integers by §8.2, and vanish beyond the degree.

**Checks.**

- `k = 6`, `p = 3`: the Weil–Deligne representation has Frobenius eigenvalues `−27` on `ker N` and
  `−81` on the quotient, of weights `6` and `8` centred at `7`, and `N` of rank one; its local factor
  is `(1 + 27T)⁻¹`, whereas dropping `N` would give `((1 + 27T)(1 + 81T))⁻¹`, of degree two.
- `k = 0` is excluded from the corollary: `Z₀(p; T) = (1 − T)/(1 − pT)` has `c₂ = p² − p`, of
  valuation `1 < 2`. For `p = 2` and even `k` no bound is asserted; `Z₆(2; T) = 1 + 7T − 8T²` happens to
  satisfy it.
- `k = 13`, `p = 2`: the coefficients of `Z₁₃(2; T)` have `2`-adic valuations
  `0, 0, 2, 6, 12, 20, 30, 42`, equal to `n(n − 1)`, the leading one being `−2^{42}`; `k = 9`, `p = 3`:
  `Z₉(3; T) = 1 + 53T + 58995T² − 59049T³` has valuations `0, 0, 3, 10` against the bounds
  `0, 0, 2, 6`.
- The slope theorem is a comparison at the coefficient prime itself: the strict compatibility of
  PotentialModularityAndCompatibleSystems §1.6 is away from the residue characteristic, so for
  `p = ℓ = 2` it says nothing, and the input is Layer AG2.6.
- `k = 3`, `p = 2`: `M₃(2; T) = 1 + 4T` has slope `v₂(4) = 2`, equal to the Hodge slope `2`; then
  `Z₃(2; T) = 1 + 3T − 4T²` has coefficient valuations `0, 0, 2`, meeting `n(n − 1) = 0, 0, 2`.
- `k = 5`, `p = 2`: `M₅(2; T) = 1 − 4T + 64T²` has Newton polygon through `(0, 0), (1, 2), (2, 6)`, so
  slopes `2, 4`, the Hodge slopes of `(2, 4), (4, 2)`; `Z₅(2; T) = 1 − 5T + 68T² − 64T³` has coefficient
  valuations `0, 0, 2, 6`, equal to `n(n − 1)`.

*Needs:* §§6.6, 8.2–8.4, 9.1, 10.3, 11.1; ArithmeticGaloisRepresentations §§2.5–2.7, 3.3, 5.3;
ModularityAndLanglandsExtensions §§2.42–2.43, 2.49; AutomorphicGaloisRepresentationsPartII Layers
AG2.5–AG2.6; PadicHodgeTheory §§3.2, 5.3; NoncommutativeAndEquivariantIwasawa §F.6;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2–R07.3.3.

### 11.3 The odd root number

**Theorem.** For odd `k`, the global root number of the orthogonal motive `M_k`, of even weight
`k + 1`, is `+1` (FSY §5.3.3, last paragraph, p. 58).

*Proof sketch.* For odd `k`, `K` is smooth over `ℚ` (§7.2: a sum of an odd number of terms `±1` is
nonzero), `K̄_ℚ` is smooth along the boundary (§7.1) and projective as a closed subscheme of the
projective `X_k` (§6.1); `M_k` is cut out of `H^{k−1}(K̄)(−1)`, a middle even degree, by the projector
`e_χ` and the kernel of the boundary restriction (§7.4, by the boundary localization of §7.1), and
carries the symmetric pairing of §§4.4 and 7.4. Apply the supplier contract
gap:orthogonal-motive-root-number with the conventions of §10.3, and identify the motivic root number
with the automorphic sign through §11.2.

**Checks.**

- Orthogonality is needed: a cubic Dirichlet character `χ` modulo `7` is even and gives a rank-one
  motive of even weight `0` that is not self-dual, with root number `τ(χ)/√7`; this is not real,
  since `τ(χ)³ = 7·J(χ, χ)` with the Jacobi sum `J(χ, χ) ∈ ℤ[ζ₃]` of norm `7`, which is not real.
- `k = 3`: the root number of `L(s, χ_{−3})` is `+1`, consistent with the theorem.
- `k = 1`: `M₁ = 0` and the root number of the empty product is `1`.

*Needs:* §§4.4, 6.1, 7.1–7.2, 7.4, 10.3, 11.2; MotivesAndAlgebraicCycles
gap:orthogonal-motive-root-number.

### 11.4 The odd moment functional equation

**Theorem.** For every odd `k ≥ 1`, the Euler product `L_k(s)` converges absolutely for
`Re s > (k + 3)/2`, and `Λ_k(s) = N_k^{s/2}π^{−d_k s/2}Π_{j=1}^{d_k}Γ((s − j)/2)L_k(s)`, `d_k = (k − 1)/2`,
`N_k = Π_{j ≤ k odd} sf(j)`, continues to a meromorphic function on `ℂ` with
`Λ_k(k + 2 − s) = Λ_k(s)` (`oddMoment_functionalEquation`; FSY Theorem 1.2, p. 3). The statement takes
the continuation in normal form, so that the functional equation holds at every point; no
holomorphy is asserted.

*Proof sketch.* Meromorphic continuation and the dual functional equation come from §11.1. The
polarization rewrites `Λ(R^∨, 1 − s)` as the reflection `s ↦ k + 2 − s`; §§10.2–10.4 supply the
conductor and gamma factor; §11.3 gives the sign. Absolute convergence follows from the purity of §11.2
at every prime.

**Checks.**

- `k = 3`: `N₃ = 3`, `d₃ = 1`, and the reflection `s ↦ 5 − s` is the functional equation of
  `L(s − 2, χ_{−3})`.
- `k = 1`: `Λ₁ = 1`, and the theorem is `1 = 1`.
- `k = 9`: `N₉ = 105`, `d₉ = 4`, and the inverse Euler factor at `3` contains the factor
  `1 − 243T` of the unramified line from `Θ⁺₃ = {3}`.

*Needs:* §§10.4, 11.1–11.3.

### 11.5 The even moment functional equation

**Theorem.** For every even `k ≥ 2`, the Euler product over odd primes converges absolutely for
`Re s > (k + 3)/2`, and there are `r_k ≥ 0`, a polynomial `P_k ∈ ℚ[T]` with `P_k(0) = 1` and a sign
`ε_k ∈ {±1}` such that `Λ_k(s) = 2^{r_k s/2}P_k(2^{−s})⁻¹Λ′_k(s)` continues to a meromorphic function on
`ℂ` with `Λ_k(k + 2 − s) = ε_kΛ_k(s)` (`evenMoment_functionalEquation`; FSY Theorem 1.3, p. 4). Here
`r_k` is the conductor exponent at `2` and `P_k(T)⁻¹ = L_{k,2}(T)` the Euler factor at `2` of
`V_{k,ℓ}`, both independent of `ℓ` by §11.2, `Λ′_k` is the odd-prime completion of §10.4, and
`2^{r_k s/2}` is formed with the real logarithm of `2`; the Lean statement asserts the existence of
such `r_k`, `P_k` and `ε_k`, since the `2`-adic Galois representation is not available at the pins.

*Proof sketch.* Apply §11.1 and §11.2 at every prime including `2`; use the polarization for the
reflection and §§10.2–10.4 for the explicit odd-prime factors, conductor and gamma factor. The
`2`-adic invariants are the actual invariants of `V_{k,ℓ}` at `2`.

**Checks.**

- `k = 2, 4`: `r_k = 0`, `L_{k,2} = 1` and `ε_k = 1`.
- The conjectures `r_k = ⌊k/6⌋` and `ε_k = (−1)^{t_k}` with
  `t_k = ⌊k/8⌋ + Σ_{p ≡ 1 (4)}⌊k/(2p)⌋ + Σ_{p ≡ 3 (4)}⌊k/(4p)⌋ + δ_{8∣k}` are not part of the theorem; at
  `k = 8`, `t₈ = 1 + 0 + ⌊8/12⌋ + 1 = 2`, predicting `ε₈ = +1`.
- `k = 6`: `Λ′₆(s) = 3^{s/2}π^{−s}Γ((s − 1)/2)Γ((s − 2)/2)·(1 + 27·3^{−s})⁻¹·Π_{p ≥ 5}L_{6,p}(p^{−s})`;
  the known identification with the weight-four newform of level `6` gives `r₆ = 1`.

*Needs:* §§10.4, 11.1–11.2, 10.3.

### Examples

- `k = 5`: the theorem is the functional equation of `L(f₃, s)` for the weight-three newform of level
  `15`, shifted by `2`.
- `k = 8`: `d₈ = 2`, `N′₈ = 3`, and `L₈(s) = L(f₆, s − 2)` for a weight-six newform of level `6` (FSY
  Table 1, p. 4).

### Dependencies

Layers 4 and 6–10. Other roadmaps: ModularityAndLanglandsExtensions, ArithmeticGaloisRepresentations,
AutomorphicGaloisRepresentationsPartII, MotivesAndAlgebraicCycles, PadicHodgeTheory,
NoncommutativeAndEquivariantIwasawa, FiniteFlatGroupsAndIntegralPadicHodgeTheory.

## Downstream consumers

- KloostermanSheavesAndBesselIsocrystals consumes Layers 1 and 2 in every rank: the normalized
  sheaves, the monodromy table and the Bessel sign dictionary.
- Any roadmap on Bessel moments and special values of `L_k(s)` consumes the motives of Layer 4, the
  Hodge numbers of Layer 6 and the functional equations of Layer 11.

## Worked examples

- **`k = 3`.** `Z₃(p; T) = (1 − T)(1 − (p/3)p²T)`, `M₃` is the rank-one motive with realization
  `χ_{−3}χ_cyc^{−2}`, Hodge type `(2, 2)`, conductor `3`, gamma factor `π^{−s/2}Γ((s − 1)/2)` and
  `Λ₃(s) = Λ₃(5 − s)`.
- **`k = 6`, `p = 3`.** `Z₆(3; T) = 1 + 26T − 27T² = (1 − T)(1 + 27T)`; the `b = 2` quadratic point of
  §7.2 gives a one-dimensional vanishing space `U`, the Euler factor `(1 + 27T)⁻¹`, conductor exponent
  `1`, and local sign `+1`.
- **`k = 12`, `p = 2`.** `Z₁₂(2; T) = (1 − T)(1 − 64T)(1 + 64T)`, so `M₁₂(2; T) = 1`, matching
  `deg M₁₂ = 2⌊14/12⌋ − 2 = 0`.

## Corrections to the sources

- FSY §3.2.1, p. 23: the Gauss–Manin expression for a single Kloosterman sheaf uses a torus of
  dimension involving `k`; the single sheaf integrates over `n` coordinates, and `nk` appears only
  for the `k`-th tensor power (§1.1).
- FSY proof of Proposition 4.20, p. 33: the primitive part for the monodromy at infinity is indexed by
  `k − 1`, the centre of the monodromy filtration there, not `k` (§6.4).
- FSY §5.1.1, p. 40: the reciprocal-root involution is `α ↦ p^{k+1}/α`; the printed exponent
  `(k + 1)/2` gives a map that does not preserve the roots (§8.1, Checks).
- FSY §5.1.2, p. 41: the derivative `∂g₁/∂z₁` is a unit on `K̄ ∩ (z_r = 0)`, not on the whole divisor
  `z_r = 0`, and normal crossings concern distinct components (§7.1).
- FSY Corollary 5.30, p. 52: the paper's gamma product and the standard factor differ by the constant
  `π^{d(d+1)/4}` (§10.2).
- FSY Example A.3, p. 63: for a smooth divisor `i*ℚ_U^p = ℚ_D^p[1]`; the printed display omits the
  shift.
- FSY Example A.27, p. 71: the pushforward supported at the zero point is a functor supported at that
  point, not the zero functor.
- XZ §1.1.1, pp. 2–3, §2.1.5, p. 10 and §4.1.13, p. 42: with `E^λ = (O, d + λdx)`, a horizontal map
  `F^*E → E` for `λ = ϖ` has multiplier `exp(ϖ(x^p − x))`, and the cyclic module equation and the
  horizontal-coefficient equation carry different signs (§2.6).
- FSY proof of Proposition 5.23, p. 50: every remaining quadratic point is asserted to have a local
  equation `Q − u·(√−p)²` with `u` a unit; the constant term `2ap` (respectively `2bp`) has valuation
  greater than one when `p` divides `a` (respectively `b`), for instance `18` at `k = 9`, `p = 3`,
  `a = 3`. The route of §9.1 handles these points through the higher-thickness supplier contract.
- FSY proof of Theorem 5.17, (5.18) and (5.20), pp. 46–47: the resolution of the balanced nodes is
  asserted to induce an isomorphism `H^{k−1}_c(K′) ≅ H^{k−1}_c(K)`, from the vanishing of three
  groups; the localization sequence also contains `H^{k−2}(T)`, and the map `H^{k−1}_c(K)^χ → H^{k−1}_c(K′)^χ`
  is surjective with kernel of dimension `δ_{4∣k}`. Consequently the `χ`-part of the `E₂^{1,k−2}` term of
  `K̄′` is zero, not of dimension `δ_{4∣k}`; the dimension count in the rest of the proof is unchanged,
  the kernel taking the place of that term (§§7.3, 8.4).
- FSY §5.3.1, pp. 53–55: with the archimedean character `exp(−2πix)` fixed on p. 53, the
  archimedean constant for odd `k` is `(−i)^{(k²−1)/8}`; the printed `i^{(k²−1)/8}` is the constant for
  `exp(2πix)`. The two differ when `k ≡ 3, 5 (mod 8)`; at `k = 3` the local functional equation for
  `x·exp(−πx²)` gives `−i` for `sgn` and `exp(−2πix)` (§10.3).
- Yun-moments Lemma 4.3.4, p. 37: the invariant lines at `∞` carry the Tate twist `(−d/2)`, with
  geometric Frobenius eigenvalues `±2^{d/2}` as computed in its proof (4.14); the displayed twist
  `(d/2)` has the opposite sign (§1.6).

## References

- **FSY.** J. Fresán, C. Sabbah, J.-D. Yu, *Hodge theory of Kloosterman connections*, Duke Math. J.
  171 (2022), 1649–1747; arXiv:1810.06454v5. All page numbers refer to the arXiv v5 pagination.
- **XZ.** D. Xu, X. Zhu, *Bessel F-isocrystals for reductive groups*, Invent. Math. 227 (2022),
  997–1092; arXiv:1910.13391v2, preprint pagination.
- **Serre-orthogonal.** J.-P. Serre, *On the mod p reduction of orthogonal representations*,
  arXiv:1708.00046v3, Theorem 4.2.1 and Lemma 4.2.4, pp. 9–10.
- **Saito-orthogonal.** T. Saito, *The sign of the functional equation of the L-function of an
  orthogonal motive*, Invent. Math. 120 (1995), 119–142; cited by its locator through FSY §5.3.3,
  p. 58.
- **Yun-moments.** Z. Yun, *Galois representations attached to moments of Kloosterman sums and
  conjectures of Evans*, Compositio Math. 151 (2015), 68–120; arXiv:1308.3920v2, §2.3.4, p. 12, and
  §§4.3.1–4.3.4, pp. 36–39. All page numbers refer to the arXiv v2 pagination.
