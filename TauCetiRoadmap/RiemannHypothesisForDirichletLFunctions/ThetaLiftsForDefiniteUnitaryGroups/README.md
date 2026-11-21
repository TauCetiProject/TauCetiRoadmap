# Roadmap: theta lifts for definite unitary groups

**Summary.** Let `E/F` be a CM extension of number fields, `V` a Hermitian space of dimension `n` and
`W` a skew-Hermitian space of dimension `d` over `E`, both definite at every real place of `F`. Then
the unitary groups `U(V)` and `U(W)` are compact at every archimedean place. Their automorphic forms
are algebraic modular forms: vector-valued functions on finite class sets
`U(V)(F)\U(V)(𝔸_f)/K`. The global theta correspondence of the dual pair `(U(V), U(W))` therefore
becomes a linear map between finite-dimensional spaces of such functions. This roadmap builds that
map for one pair and develops its theory; its last layer treats a pair of complementary Hermitian
spaces inside a skew-Hermitian space that is not split and has small signature defect, with the
definite case as the base of an induction.

The main theorems are the following.

1. *The lift is a class-set operator, and its kernel is a theta function.* For a test vector `φ` of
   the Weil representation and a form `f` of level `K`, the lift is the finite sum
   `θ_φ(f)(h) = vol(K_∞K) · Σ_c |Γ_c|⁻¹ ∫_{K_∞} θ(k t_c, h; φ) f(k t_c) dk`
   over representatives `t_c` of the class set, where the `Γ_c` are the finite stabilisers. The theta
   kernel at two finite adelic points is the Fock-space pairing of the archimedean polynomial with an
   entire function `ϑ` attached to the finite test vector `φ_f`; the pairing is a constant-coefficient
   differential operator at the origin, with the factor `π^{−k}` in degree `k`. When `nd > 0` and `φ_f` is a lattice
   vector (it spans the line fixed by a self-dual lattice of the finite symplectic space with a lift to the
   Heisenberg group), `ϑ` is the theta function, of `L²` norm `‖φ_f‖`, of a principally polarised abelian
   variety `A` with multiplication by an order of `E`, of dimension `nd[F : ℚ]`, whose CM type is read off
   from the signs of `V` and `W` at the real places; for a general `φ_f`, a finite combination of
   Heisenberg translates of a lattice vector, `ϑ` is the corresponding combination of translates of such
   theta functions. The adjoint of the lift is the lift in the other direction with the conjugate kernel. If the kernel,
   divided by a scalar `Ω`, preserves given lattices, then `D_K · Ω⁻¹` times the lift maps integral forms to integral
   forms, where `D_K` is the least common multiple of the `|Γ_c|`, which divides Minkowski's number for
   finite subgroups of `GL_{2n[F:ℚ]}(ℚ)`.
2. *Weights and Hecke operators.* At each real place the weight of the source determines the weight
   of the lift through the `(GL_n, GL_d)`-duality on polynomials in `n × d` matrices, in one of two
   mirror forms according to a sign `ε_v` fixed by the signs of `V` and `W` at the place. For `n ≤ d`, at every split
   place where the data are unramified, the lift intertwines the spherical Hecke algebras: a Hecke
   eigenform with Satake parameter `(α_1, …, α_n)` there lifts to an eigenform with parameter
   `(c α_1⁻¹, …, c α_n⁻¹)` together with the segment `χ_V(ϖ) q^{(d−n−1)/2 − i}`, `0 ≤ i < d − n`, where
   `c` is the ratio of the two splitting characters at the place. If `π` has a weak base change
   `BC(π)` to `GL_n`, every constituent of its lift has the weak base change
   `BC(π)^∨ ⊗ (χ_V/χ_W) ⊞ (segment)`. For the homomorphism model of a pair, on `Hom_E(X₁, X₂)`, where the first
   group enters through the dual space, the inversion and the contragredient disappear: `(c α, segment)` and
   `BC(π) ⊗ (χ_V/χ_W) ⊞ (segment)`.
3. *The Rallis inner product formula and nonvanishing.* For `f₁, f₂` in an irreducible automorphic
   representation `π` of `U(V)`, `⟨θ_φ f₁, θ_φ f₂⟩` is the value at `s₀ = (d − n)/2` of
   `C · L^S(s + ½, π × χ_W)/d^S(s) · ∏_{v ∈ S} Z_v(s)`, where `L^S(s, π × χ_W) = L^S_E(s, BC(π) ⊗ χ_W)`,
   the `Z_v` are local doubling integrals (for factorizable data, with local measures giving the stabilisers of the
   lattices volume one outside `S` and the Tamagawa measure as their product), and `C = 2` if `d > n`, `C = 1` if
   `d ≤ n`; this holds for every `d`, and for `d ≥ 2n + 1` the `L`-value is an absolutely convergent Euler product,
   hence nonzero (the Satake parameters of the unitary local components satisfy `|α_i| ≤ q_w^{(n−1)/2}`, at the inert
   places through a doubling series of the unramified unitary group). Consequently, if `d ≥ 2n + 1`, the lift of `π` to
   `U(W)` is nonzero exactly when the weight of `π` occurs at every real place, and every constituent of the lift has
   the predicted weights and local components at every place.
4. *The trivial representation and complementary spaces.* The squared norm of the lift of the
   constant functions is `∏_{i=0}^{n−1} L_E(d/2 − i, χ_W)` times normalised local factors, and the genus
   average of the Hermitian theta series of a definite lattice of positive rank is the mean over the definite group of the
   theta kernel of its lattice vector on `U(k, k)`, equal to a Siegel Eisenstein series divided by `1` or `2`. Fix
   `δ ∈ E^×` with `δ̄ = −δ`. Let `V`, `V′` be Hermitian of
   dimensions `a > a′` with `a ≡ a′ (mod 2)` and `W` skew-Hermitian with `δ⁻¹W ≅ V ⊕ V′(−1)`, with the same
   signatures `(a − p, p)`, `(q, a′ − q)` at every real place and `2(p + q) + 1 < (a − a′)/2`, `2(p + q) + 1 < a′`, and let
   `β`, `α` be the splitting characters of `V`, `V′` and `κ_v = m_{α,v} − m_{β,v}` the difference of their infinity
   types at a real place `v`. Suppose that `κ_v < −(a + a′)` at every real place; that `E/F` is unramified at every
   finite place and every place of `F` that is dyadic or divides the different of `F` splits in `E` (so the additive
   character is unramified at the places that do not split); that `α` and `β` are unramified outside a finite set `T`
   of split places at each of which `α/β` is ramified and the additive character is unramified; and that `V`, `V′` contain
   lattices unimodular at every finite place and `W` one unimodular for its skew-Hermitian form (no relation between
   these lattices, and no condition on `δ`, is needed). Then local theta quotients match at every place; the theta
   integral of the trivial representation of `U(V)` on `U(W)` is square-integrable, that of `U(V′)` converges on test
   vectors supported on matrices of full rank at an auxiliary split place and extends uniquely to an invariant map on all
   test vectors; neither is identically zero, and they agree on matched test vectors up to a nonzero constant. The proof
   is an induction on `p + q` from the case where all three groups are compact at infinity. When a hyperbolic plane is
   removed, the matching descends by a global argument: the theta integrals
   factor through the matched quotients, a part of their constant term along an isotropic line is a theta integral of
   the smaller triple, and the smaller theta integrals, being nonzero by induction, are injective on pure tensors; the
   one local analytic input is an archimedean lemma on the cone maps. The constant changes by an explicit partial Hecke
   `L`-value, a value of the character `α/β` on an ideal and, at each place of `T`, a local constant fixed by the matching
   data there: in suitably placed bases, a Gauss sum of `α/β` times a power of the residue cardinality, a power of the value
   of `α/β` at a uniformiser and the sign `(α/β)_w(−1)`.

The roadmap builds on [MetaplecticAutomorphicForms](../../MetaplecticAutomorphicForms/README.md) (Weil
representations of unitary pairs, the global theta kernel and lift, the anisotropic Siegel–Weil formula and doubling
integrals), [ThetaKernelsForUnitaryDualPairs](../ThetaKernelsForUnitaryDualPairs/README.md) (the Fock model, the
global Weil representation of a unitary pair, and the local theta correspondence for complementary pairs with its
descent along isotropic lines), [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md) (Hermitian spaces,
lattices, genera, class sets, masses), [AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md)
and [DiscreteSeriesCoefficientsAndAutomorphicMetrics](../DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md)
(algebraic modular forms with their class-set evaluation, kernel operators and Hecke operators),
[AbelianSchemesAndArithmeticModuli](../../AbelianSchemesAndArithmeticModuli/README.md) (theta functions of polarised
complex tori), and [AutomorphicLFunctionsAndLocalFactorsPartII](../../AutomorphicLFunctionsAndLocalFactorsPartII/README.md)
with [LocalFactorsOfTwistsAndTypes](../LocalFactorsOfTwistsAndTypes/README.md) (standard `L`-functions of unitary
groups and their convergence). It acts on the forms of the definite unitary groups of
PotentialAutomorphyInfrastructurePartII. In the family [RiemannHypothesisForDirichletLFunctions](../README.md) it feeds
the roadmaps that compose such lifts into chains, beginning with
[ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md).

**Guide to the layers.** Layer 0 fixes the dual pair (and its homomorphism model), its splitting characters, the
Weil representation with its test vectors and lattice vectors, and the theta kernel. Layer 1 writes the
lift and its adjoint as class-set operators, proves the integrality statement and identifies the kernel
with theta functions of CM abelian varieties. Layer 2 computes the weights at real places and the Hecke
and Satake dictionaries at finite places, identifies the local components of a lift, and translates the
dictionary to the homomorphism model. Layer 3 proves
the Rallis inner product formula for a definite pair. Layer 4 proves nonvanishing and existence of lifts
in large dimension. Layer 5 treats the lift of the trivial representation and its norm, and the genus
theta series of a definite lattice as a theta integral on `U(k, k)` with its Siegel–Weil comparison. Layer 6
proves square-integrability and factorisation of the theta integrals of complementary spaces, the descent of matching
along hyperbolic planes, the complementary-space identity for theta integrals and the recursion of its constant.

## Conventions

- `F` is a totally real number field and `E/F` a CM extension with conjugation `x ↦ x̄`. `η` is the
  quadratic character of `𝔸_F^×/F^×` attached to `E/F`. Fix `δ ∈ E^×` with `δ̄ = −δ`. For every real
  place `v` of `F` let `τ_v : E → ℂ` be the embedding above `v` with `τ_v(δ⁻¹) ∈ iℝ_{>0}` (equivalently
  `Im τ_v(δ) < 0`), and identify `E_v = ℂ` through it.
- Hermitian forms are conjugate-linear in the first variable and linear in the second:
  `⟨ax, by⟩ = ā b ⟨x, y⟩`, `⟨y, x⟩ = conj ⟨x, y⟩`; this is the convention of
  MetaplecticAutomorphicForms §3.2a and of HermitianFormsAndLattices (Conventions, §1.0). A skew-Hermitian
  form satisfies `⟨y, x⟩ = −conj ⟨x, y⟩`. For skew-Hermitian `W`, `W^♭` is `W` with the Hermitian form `δ⁻¹⟨·,·⟩`; by
  the choice of `τ_v`, the signature of `W^♭` at `v` is that of `i·τ_v(⟨·,·⟩)`, the signature of `W` in
  the convention of HermitianFormsAndLattices. The lattice notions of `W` (dual, unimodular, self-dual, primitive) are
  those of its own skew-Hermitian form, as in HermitianFormsAndLattices (Conventions), not those of `W^♭`. `V(−1)` is
  `V` with the negated form.
- *Definite spaces.* A Hermitian `V` is *totally definite* in the sense of HermitianFormsAndLattices
  (Conventions; §2.5): at every real place `v` the values `⟨x, x⟩`, `x ∈ V_v ∖ 0`, have one sign
  `sgn(V_v) ∈ {±1}`, which may depend on `v`; it is *totally positive definite* if every sign is `+1`. A
  skew-Hermitian `W` is totally definite if `W^♭` is. Then `U(V)(F_v) ≅ U(n)` at every real place.
- *The symplectic space.* `𝕎 = Res_{E/F}(V ⊗_E W)` with the alternating form
  `B(v ⊗ w, v′ ⊗ w′) = Tr_{E/F}(⟨v, v′⟩_V ⟨w, w′⟩_W)`; equivalently `B = Tr_{E/F}(δ · h)`, with `h` the
  Hermitian form of `V ⊗_E W^♭`. The Weil representations of MetaplecticAutomorphicForms §3.3 and ThetaKernelsForUnitaryDualPairs §4.4a
  are taken for this `B`.
- `ψ = ∏_v ψ_v` is the standard character of `𝔸_F/F` of AnalyticNumberTheoryPartII §5.3g:
  `ψ_v(x) = e^{2πix}` at real places, and at a finite place the conductor of `ψ_v` (the largest fractional ideal on which
  `ψ_v` is trivial) is the inverse different (so `ψ_v` is unramified at `v` iff `v` does not divide the different of `F`;
  its kernel is larger than the inverse different when `[F_v : ℚ_p] > 1`).
- *Actions and twists.* Groups act on the left: `g ∈ U(V)(F_v)` and `h ∈ U(W)(F_v)` act on `V`, `W` as
  isometries and on `𝕎` by `v ⊗ w ↦ gv ⊗ hw`, and `ω(g, h)ρ(x)ω(g, h)⁻¹ = ρ((g, h)x)` for the Heisenberg
  operators (MetaplecticAutomorphicForms §1.3). The splitting characters enter as in
  MetaplecticAutomorphicForms §3.3, with the normalisation of ThetaKernelsForUnitaryDualPairs §3.3b (left-action form) and §4.4a: for `V = 0` the
  oscillator line of `U(W)` is `h ↦ χ̃_V(det h)`, with `det h` the determinant of the left-acting isometry `h` and
  `χ̃(x/x̄) = χ(x)` (defined for characters trivial on `𝔸_F^×`); symmetrically for `U(V)` and `χ_W`; for general `V` the
  character `χ_V(det(h|_Y))` multiplies the substitution action of an element `h` of the Levi subgroup of the Siegel
  parabolic subgroup of a split `W = Y ⊕ Y^*` stabilising `Y^*` (the Schrödinger formulas of §3.3b, used in 5.4; for
  even `n` it is `χ̃_V(det h)`, and so it is at a place split in `E` for every `n`, where `χ_V` is trivial on `F_v^×`;
  for odd `n` at a place not split in `E` the character `χ̃_V` is not defined), and at a place split in `E` the
  evaluation at `0` of the type-II model transforms by a positive multiple of `χ̃_W(det g)χ̃_V(det h)`, `det` the
  determinant of the isometry of `V`, resp. `W`; these properties, with the invariance of the theta functional under
  rational points, unitarity and continuity (the orbit maps `(g, h) ↦ ω(g, h)φ` are continuous into `L²`), characterise
  `ω_{ψ, χ_V, χ_W}` (§4.4a).
- *The sign at a real place.* At a real place `v`, the Fock model of `ω_v`
  (ThetaKernelsForUnitaryDualPairs §3.45) is built on the complex structure `J_v` of `𝕎_v` with
  `B(x, J_v x) > 0` for `x ≠ 0`, and in the metaplectic representation (before the twists by the splitting
  characters) a unitary `k` of `(𝕎_v, J_v)` acts on the Fock polynomials by `G ↦ det_{J_v}(k)^{−1/2} · G ∘ k⁻¹`
  (§3.45(ii)); in particular `exp(θJ_v)` acts on the polynomials of degree `k` by `e^{−i(k + nd/2)θ}`. Since
  `B(x, τ_v(i)·x) = −2 Im τ_v(δ) · h(x, x)` and `Im τ_v(δ) < 0`, for totally definite `V`, `W` one has
  `J_v = −ε_v · τ_v(i)` with `ε_v = −sgn(V_v) · sgn(W^♭_v) ∈ {±1}`: for `ε_v = −1` the field `E` acts `ℂ`-linearly on
  `(𝕎_v, J_v)` through `τ_v`, for `ε_v = +1` through `τ̄_v`. Changing `δ` to `−δ` changes `τ_v`, `W^♭`, `ε_v` and every
  weight below by the corresponding conjugation and leaves the statements invariant.
- `n = dim_E V`, `d = dim_E W`, `s₀ = (d − n)/2`. `K ⊂ U(V)(𝔸_f)`, `K′ ⊂ U(W)(𝔸_f)` are compact open
  subgroups and `K_∞ = U(V)(F ⊗ ℝ)`, `K′_∞ = U(W)(F ⊗ ℝ)`, compact.
- *Splitting characters* are unitary Hecke characters `χ_V`, `χ_W` of `𝔸_E^×/E^×` with
  `χ_V|_{𝔸_F^×} = η^n` and `χ_W|_{𝔸_F^×} = η^d`. As in MetaplecticAutomorphicForms §3.3, `χ_V`
  governs the action of `U(W)` and `χ_W` the action of `U(V)`. At a real place `v`,
  `χ_{V,v}(z) = (z/|z|)^{m_{V,v}}` and `χ_{W,v}(z) = (z/|z|)^{m_{W,v}}` on `E_v^× = ℂ^×`; the
  integers `m_{V,v}`, `m_{W,v}` are the *infinity types*. Put
  `a_v = (d + ε_v m_{W,v})/2` and `b_v = (n + ε_v m_{V,v})/2` (integers by 0.2).
- *Weights.* For `λ ∈ ℤⁿ` nonincreasing, `σ_λ` is the irreducible representation of `U(n)` of highest
  weight `λ` in the identification `U(V)(F_v) ≅ U(n)` fixed by `τ_v` and an orthonormal basis
  (ClassicalGroups Layer 3); `λ^* = (−λ_n, …, −λ_1)` is the highest weight of
  `σ_λ^∨`. For `ε ∈ {±1}` put `ι_{+1}(λ) = λ` and `ι_{−1}(λ) = λ^*`. For `λ = (λ_v)_v`, `σ_λ = ⊗_v σ_{λ_v}` is
  a representation of `K_∞`.
- *Measures.* Haar measures on `U(V)(𝔸)`, `U(W)(𝔸)` are the Tamagawa measures of
  MetaplecticAutomorphicForms §6.1 (`vol([U]) = 2` for a unitary group of positive dimension; for `n = 0` the quotient
  `[U(V)]` is a point of volume `1`); `dk` on `K_∞` has total mass one; `vol(K_∞K)` is the
  Tamagawa volume of `K_∞K`.
- *Class sets.* `Cl(K) = U(V)(F)\U(V)(𝔸_f)/K` with representatives `t_c` and stabilisers
  `Γ_c = U(V)(F) ∩ t_c K t_c⁻¹`; similarly `Cl(K′)`, `t′_{c′}`, `Γ′_{c′}` for `U(W)`. The *mass* is
  `mass(K) = Σ_c |Γ_c|⁻¹` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a), and `D_K = lcm_c |Γ_c|`.
- *Forms.* `𝒜(V; K)` is the space of functions `U(V)(F)\U(V)(𝔸) → ℂ` that are right `K`-invariant and
  smooth; it is finite-dimensional on each `K_∞`-isotypic part. `𝒜_λ(V; K)` is its `σ_λ`-isotypic part
  for right translation by `K_∞`. `S(K, M)` is the space of algebraic modular forms in Gross's rational
  model of AutomorphicFormsOnReductiveGroups §7.4: `f : U(V)(𝔸_f) → M` with `f(γ t u) = ρ(γ_∞) f(t)` for
  `γ ∈ U(V)(F)`, `u ∈ K`, for an algebraic representation `ρ` of `U(V)` on `M` (through `K_∞`). Through
  §7.5 (`automorphicEquiv`), `f ∈ S(K, σ_λ^∨)` and `ℓ ∈ σ_λ` give `Φ_f(ℓ) ∈ 𝒜_λ(V; K)`,
  `Φ_f(ℓ)(g_∞ t) = ⟨ℓ, σ_λ^∨(g_∞)⁻¹ f(t)⟩`, and `𝒜_λ(V; K) ≅ S(K, σ_λ^∨) ⊗ σ_λ`. The *class-set inner
  product* on `S(K, M)` is `⟨f, f′⟩_K = Σ_c |Γ_c|⁻¹ ⟨f(t_c), f′(t_c)⟩`, and the Petersson product on
  `𝒜(V; K)` is `⟨F, F′⟩ = ∫_{[U(V)]} F F̄′`.
- *Satake parameters* are in the unitary normalisation of SmoothRepresentationsOfLocalGroups
  §§SR.4.2–SR.4.4: an unramified representation of `GL_n(E_w)` with parameter `(α_1, …, α_n)` has
  `L(s) = ∏_i (1 − α_i q_w^{−s})⁻¹`, where `q_w` is the residue cardinality of `E_w` (`q_w = q_v²` at a
  place `v` of `F` inert in `E`). The trivial representation of `GL_n(E_w)` has parameter
  `(q_w^{(n−1)/2}, q_w^{(n−3)/2}, …, q_w^{−(n−1)/2})`. For an irreducible automorphic `π` of `U(V)`
  unramified at a finite `v`, `α_w(π)` is the base-change parameter at a place `w | v` of `E`
  (§SR.4.4 at inert places; the parameter of `π_v` through `U(V)(F_v) ≅ GL_n(E_w)` at split places).
- *Standard `L`-functions.* For a finite set `S` of places of `F` containing the archimedean ones and the
  ramification of `π` and `χ_W`,
  `L^S(s, π × χ_W) = ∏_{w ∤ S} det(1 − α_w(π) χ_{W,w}(ϖ_w) q_w^{−s})⁻¹ = L^S_E(s, BC(π) ⊗ χ_W)`, the
  product over the places `w` of `E` above places of `F` outside `S`. Since `χ_W^c = χ_W⁻¹`, this is the
  partial standard function `L^S_E(s, BC(π^∨) ⊗ χ_W⁻¹)` of the doubling method of
  MetaplecticAutomorphicForms §6.10a for `π` and `χ_W` (AutomorphicLFunctionsAndLocalFactorsPartII §3.4),
  with its meromorphic continuation. `d^S(s)` is the product over `v ∉ S` of the unramified normalising
  denominators `d_v(s)` of MetaplecticAutomorphicForms §6.10a for `χ_W`.
- The *linear lift* `θ_φ(F)(h) = ∫_{[U(V)]} θ(g, h; φ) F(g) dg` is the global theta lift of
  MetaplecticAutomorphicForms §5.6 applied to `F̄`. It is linear in `F`. With this convention an
  irreducible constituent of the lift of `π` is locally a quotient of the big theta lift `Θ(π_v^∨)`
  of §3.4, and every formula below for the conjugate-linear lift of §5.6 holds with `π^∨` in place of `π`.

## Layer 0: definite dual pairs and their Weil representations

### 0.1 Definite dual pairs

Define a *definite dual pair* over `E/F`: a Hermitian space `V` and a skew-Hermitian space `W` over `E`, both
totally definite. Its symplectic space is `(𝕎, B)` of the Conventions, and `U(V) × U(W)` acts on it as
a dual pair.

- `U(V)(F_v)` and `U(W)(F_v)` are compact at every real place, so `U(V)` and `U(W)` are anisotropic
  over `F`, `U(V)(F)\U(V)(𝔸)` is compact, and every automorphic form on `U(V)` is cuspidal.
- *Rational polarisation.* Choose orthogonal bases `e_i` of `V` and `f_j` of `W`. Then
  `⟨e_i, e_i⟩ ∈ F` and `⟨f_j, f_j⟩ ∈ δF`, and `X = Σ_{i,j} F·(e_i ⊗ f_j)` is a Lagrangian
  `F`-subspace of `𝕎`, with complement `Y = δ X`. `X ≅ M_{n×d}(F)` through the bases.
- At a real place `v`, `U(V)(F_v) × U(W)(F_v) ≅ U(n) × U(d)` lies in the maximal compact subgroup
  `U(𝕎_v, J_v) ≅ U(nd)` of `Sp(𝕎_v)`, and `ε_v = −sgn(V_v)sgn(W^♭_v)` (Conventions).
- At a finite place `v` not split in `E`, the Witt index of `W_v` is `⌊d/2⌋`, or `d/2 − 1` when `d` is
  even and the normalised sign of `W^♭_v` is `−1` (HermitianFormsAndLattices §2.4); in particular it is
  at least `n` whenever `d ≥ 2n + 1`. At a split place it is `⌊d/2⌋` (HermitianFormsAndLattices §2.3).
- *The exchanged pair.* `(W^♭, V^δ)`, where `V^δ` is `V` with the skew-Hermitian form `δ⟨·,·⟩_V`, is a
  definite dual pair with the same symplectic space `(𝕎, B)` (the identification `w ⊗ v ↦ v ⊗ w`), and
  `(V^δ)^♭ = V` for the same `δ`.
- *The homomorphism pair.* Let `X₁`, `X₂` be totally definite Hermitian spaces with forms
  `h₁`, `h₂` and `δ′ ∈ E^×` with `δ̄′ = −δ′`. Let `X₁^* = Hom_E(X₁, E)` with the dual Hermitian form
  `h₁^*(h₁(u, ·), h₁(u′, ·)) = h₁(u′, u)` (definite of the sign of `h₁`), on which `g ∈ U(X₁)` acts by `ℓ ↦ ℓ ∘ g⁻¹`, and
  let `δ′X₂` be `X₂` with the skew-Hermitian form `δ′h₂`. Then `(V, W) = (X₁^*, δ′X₂)` is a definite dual pair whose
  symplectic space is `𝕎 = Res_{E/F} Hom_E(X₁, X₂)` (through `X₁^* ⊗_E X₂ ≅ Hom_E(X₁, X₂)`) with
  `B(x, y) = Tr_{E/F}(δ′ · tr(x^†y))`, `x^†` the adjoint of `x` for `h₁`, `h₂`, and on which `U(X₁) × U(X₂)` acts by
  `(g, h)x = hxg⁻¹`. *Translation rules.* The isomorphism `U(X₁) → U(X₁^*)`, `g ↦ (ℓ ↦ ℓ ∘ g⁻¹)`, sends a matrix `g` in an
  `h₁`-orthonormal basis to the matrix `ḡ` in the dual basis. Hence a representation `σ_λ` of `U(V) = U(X₁^*)` at a real
  place (Conventions) is `σ_λ^∨` as a representation of `U(X₁)` through the same embedding; and at a place `v` split in
  `E`, an unramified representation of `U(X₁^*)(F_v) ≅ GL_n(E_w)` with Satake parameter `α` is, as a representation of
  `U(X₁)(F_v) ≅ GL_n(E_w)`, the one with parameter `α⁻¹`. The dictionary of Layers 1–2 for this pair is 2.5.

Route: the polarisation is `Tr_{E/F}(F · δF) = 0`; compactness and anisotropy are
HermitianFormsAndLattices §2.5(b), (c), the Witt indices HermitianFormsAndLattices §§2.3, 2.4, and finiteness of the class sets
is HermitianFormsAndLattices §5.2. For the exchanged pair, `Tr(δ⁻¹⟨w, w′⟩_W · δ⟨v, v′⟩_V) = B(v ⊗ w, v′ ⊗ w′)`. For the homomorphism pair:
`u ↦ h₁(u, ·)` is a conjugate-linear bijection `X₁ → X₁^*` carrying `g` to `ℓ ↦ ℓ ∘ g⁻¹` (`h₁(u, g⁻¹·) = h₁(gu, ·)`), so the
matrix in the image of an orthonormal basis is `ḡ`; for `x = h₁(u, ·) ⊗ w` and `y = h₁(u′, ·) ⊗ w′`,
`tr(x^†y) = h₂(w, w′)h₁(u′, u) = h₁^*(h₁(u, ·), h₁(u′, ·)) · h₂(w, w′)`, the tensor form of `V ⊗ W^♭` for `δ = δ′`; for
unitary `ḡ = (g^{−1})^t`, and `σ_λ(ḡ) ≅ σ_λ^∨(g)`; at a split place the image of `g ∈ GL_n(E_w)` is its transpose
inverse, which preserves `GL_n(O_w)` and inverts the diagonal torus, so it carries the Satake parameter `α` to `α⁻¹`
(SmoothRepresentationsOfLocalGroups §SR.4.3).

*Needs:* HermitianFormsAndLattices §§0.1, 2.3, 2.4, 2.5, 5.2; MetaplecticAutomorphicForms §3.3;
GeometryOfNumbersAndQuadraticArithmetic §2.9; SmoothRepresentationsOfLocalGroups §SR.4.3.

**Checks.**

- `n = d = 1`, `E = ℚ(i)`, `F = ℚ`, `δ = −i/2` (so `τ(δ⁻¹) = 2i`), `V = E` with `⟨x, y⟩ = x̄ y`,
  `W = E` with `⟨x, y⟩ = δ x̄ y`: `W^♭ = E` with `x̄ y`, both positive, so `ε = −1`; `𝕎 = E` with
  `B(z, z′) = Tr(δ z̄ z′)`, `X = ℚ`, `Y = iℚ`, `B(1, i) = 1`, and `J = ` multiplication by `i = τ(i)`, with
  `B(x, ix) = |x|² > 0`.
- The homomorphism pair in rank one: `X₁ = X₂ = E` with `x̄y`, `Hom_E(X₁, X₂) = E`, and `(g, h) ∈ E¹ × E¹` acts by
  `x ↦ hxg⁻¹ = hḡx`, while the tensor pair `(X₁, δ′X₂)` has `x ↦ ghx`: the two differ exactly by `g ↦ ḡ` on the first
  factor.
- A Hermitian form of signature `(1, 1)` at one real place is not totally definite: its unitary group at
  that place is `U(1, 1)`, which is not compact.

### 0.2 Splitting data

Define *splitting data* for `(V, W)`: a pair `(χ_V, χ_W)` of splitting characters. Prove:

- *Existence.* Splitting data exist for every pair, and at every real place the infinity types
  satisfy `m_{V,v} ≡ n` and `m_{W,v} ≡ d (mod 2)`. Conversely, for any integers `m_v ≡ n (mod 2)`
  there is `χ_V` with these infinity types.
- *Torsor.* Two choices of `χ_V` differ by a unitary Hecke character `μ` trivial on `𝔸_F^×`;
  replacing `χ_V` by `χ_V μ` twists the Weil representation on `U(W)` by `μ̃ ∘ det`, where
  `μ̃(x/x̄) = μ(x)` on `E¹`.
- *Ramification.* Each choice is unramified outside a finite set of places, and for any finite set of
  places of `F` split in `E` there is a choice unramified at all of them.

Route: existence and the prescribed infinity types are BaseChangeAndGaloisRepresentationsForUnitaryGroups
§6.3a; the parity is forced on `ℝ^× ⊂ ℂ^×`, where `(x/|x|)^{m} = sgn(x)^m` must equal `η_v(x)^n`;
the twist is MetaplecticAutomorphicForms §3.3 (`unitarySplitting_character_change`); at a split
place `η_v = 1`, so the avoidance clause of BaseChangeAndGaloisRepresentationsForUnitaryGroups §6.3a applies.

*Needs:* BaseChangeAndGaloisRepresentationsForUnitaryGroups §6.3a; MetaplecticAutomorphicForms §3.3.

**Checks.**

- `n` odd: `χ_V` restricts to `η ≠ 1` on `𝔸_F^×`, so `χ_V ≠ 1`, and every `m_{V,v}` is odd.
- `n` even: `χ_V = 1` is allowed, with all `m_{V,v} = 0`.

### 0.3 The Weil representation of a definite pair, test vectors and lattice vectors

For splitting data `(χ_V, χ_W)`, let `ω = ω_{ψ, χ_V, χ_W}` be the global Weil representation of
`U(V)(𝔸) × U(W)(𝔸)` on `S(X(𝔸))` of ThetaKernelsForUnitaryDualPairs §4.4a, in the polarisation of 0.1.
Define:

- at a real place `v`, the *polynomial Fock vectors*: the image of the polynomial Fock space
  `ℂ[M_{n×d}]` (holomorphic polynomials on `(𝕎_v, J_v)`) under the inverse Bargmann transform of
  ThetaKernelsForUnitaryDualPairs §3.45; the constant polynomial gives the *vacuum*;
- the *test space*: the linear span, inside `S(X(𝔸))`, of the functions `φ_∞ ⊗ φ_f` with `φ_∞` a polynomial Fock vector of
  `𝕎_∞ = ⊕_v 𝕎_v` (the image of a polynomial on `(𝕎_∞, J)` under the inverse Bargmann transform; a finite sum of tensor
  products over the real places of polynomial Fock vectors) and `φ_f ∈ S(X(𝔸_f))`. A *test vector* is an element of the
  test space. It is *factorizable* if it is a pure tensor `⊗_v φ_v`, a polynomial Fock vector at each real place and a
  Schwartz–Bruhat function at each finite place, equal to a fixed lattice vector at almost all places; the factorizable
  test vectors span the test space, and Euler products are stated for them;
- *lattice vectors.* At a finite place `v`, let `A ⊂ 𝕎_v` be a compact open subgroup self-dual for
  `ψ_v ∘ B` (that is, `A = {w : ψ_v(B(w, A)) = 1}`), in any residue characteristic and for any
  conductor of `ψ_v`. A *lift* of `A` is a continuous `q : A → ℂ^1` with
  `q(a + a′) = q(a) q(a′) ψ_v(½B(a, a′))`, that is, a splitting of `A` into the Heisenberg group of
  MetaplecticAutomorphicForms §0.1 composed with `ψ_v` on the centre. The vectors of `S(X_v)` on which the
  lifted `A` acts trivially form a line `ℒ(A, q)` (MetaplecticAutomorphicForms §1.1); its elements are
  the *lattice vectors* of `(A, q)`. Globally, `Â = ∏_v A_v ⊂ 𝕎(𝔸_f)` with every `A_v` self-dual and
  `A_v = Λ ⊗ O_v` for an `O_F`-lattice `Λ ⊂ 𝕎` and almost all `v`, `q = ∏ q_v` with `q_v = 1` for almost
  all `v`, and `ℒ(Â, q) = ⊗_v ℒ(A_v, q_v) ⊂ S(X(𝔸_f))`.

Prove:

- Lifts exist and form a torsor under the characters of `A`; if the residue characteristic is odd and
  `ψ_v(½B(A, A)) = 1`, `q = 1` is a lift. When `E_v/F_v`, `ψ_v`, `χ_{V,v}`, `χ_{W,v}` are unramified, the
  residue characteristic is odd and `A = L_v ⊗ M_v` for self-dual lattices `L_v ⊂ V_v`, `M_v ⊂ W_v`,
  `ℒ(A, 1)` is the line of MetaplecticAutomorphicForms §2.6a, fixed by `K_{L_v} × K′_{M_v}`.
- *Split places, every residue characteristic and conductor.* If `v` splits in `E`, then in the type-II model on
  `S(M_{n×d}(F_v))` of MetaplecticAutomorphicForms §§3.2a, 3.14, written in bases of lattices `Λ ⊂ P`, `Λ′ ⊂ Q`
  (`V_v = P ⊕ P^∨`, `W_v = Q ⊕ Q^∨`), the indicator `1_{M_{n×d}(O_v)}` is the lattice vector of the self-dual `A_v` formed by
  `M_{n×d}(O_v)` and its `ψ_v`-dual in the complementary Lagrangian, for the lift `q(x + y) = ψ_v(−½B(x, y))`; it is
  fixed by `GL_n(O_v) × GL_d(O_v)`, the stabiliser of the self-dual lattices `Λ ⊕ Λ^∨`, `Λ′ ⊕ Λ′^∨`, whenever `χ_{V,v}`,
  `χ_{W,v}` are unramified. When `ψ_v` is unramified and the residue characteristic is odd, this `A_v` is `L_v ⊗ M_v` for
  the self-dual lattices `L_v = Λ ⊕ Λ^∨`, `M_v = Λ′ ⊕ Λ′^∨` (for the skew-Hermitian form) and the lift is trivial on it.
- In general `ω_v(g, h)` maps `ℒ(A, q)` onto `ℒ((g, h)A, q ∘ (g, h)⁻¹)`, so the stabiliser of `(A, q)` in
  `U(V)(F_v) × U(W)(F_v)` acts on `ℒ(A, q)` by a character; its kernel is open.
- The test space is the space of smooth `K_∞ × K′_∞`-finite vectors of `ω` in the Schwartz model; every test vector is
  fixed by `K × K′` for some compact open `K`, `K′`.
- At a real place, `ω_v` restricted to `U(n) × U(d)` preserves each homogeneous degree of
  `ℂ[M_{n×d}]`, and its decomposition is ThetaKernelsForUnitaryDualPairs §3.46(iii) for the sign `ε_v`.

Route: lifts exist because the extension of the profinite abelian group `A` by `ℂ^1` defined by the
cocycle `ψ_v(½B(a, a′))` is commutative (`ψ_v(B(A, A)) = 1`) and `ℂ^1` is divisible; the line is
smooth Stone–von Neumann (MetaplecticAutomorphicForms §1.1) for the character `q` of the lifted compact open subgroup; the
transport of lines is the conjugation `ω(g, h)ρ(w)ω(g, h)⁻¹ = ρ((g, h)w)` of Heisenberg operators. At a split place the
type-II model is the Schrödinger model of a polarisation in which `M_{n×d}(F_v)` is one Lagrangian; `x ∈ M_{n×d}(O_v)`
acts by translation and `y` in the dual lattice by multiplication by `ψ_v(B(·, y))`, and the factor `ψ_v(−½B(x, y))`
makes the action of `x + y` on `1_{M_{n×d}(O_v)}` trivial (as in the first Check); `GL_n × GL_d` acts by substitution up
to the splitting characters and moduli (MetaplecticAutomorphicForms §3.2a), which are trivial on `GL_n(O_v) × GL_d(O_v)` for unramified characters.
ThetaKernelsForUnitaryDualPairs §4.4a gives the restricted tensor structure; the archimedean statements are ThetaKernelsForUnitaryDualPairs §§3.45–3.46.

*Needs:* 0.1, 0.2; MetaplecticAutomorphicForms §§0.1, 1.1, 2.6a, 3.2a, 3.14, 4.1 and ThetaKernelsForUnitaryDualPairs §§3.45, 3.46, 4.4a.

**Checks.**

- At a place above `2` with `ψ_v` unramified, `A = X(O_v) ⊕ Y′` with `Y′` the dual of `X(O_v)` in `Y_v`
  has the lift `q(x + y) = ψ_v(−½B(x, y))`, for which `1_{X(O_v)}` is a lattice vector; `q = 1` is not a
  lift there when `½B` is not integral on `A`.
- If `q` is replaced by `q · ψ_v(B(t, ·))` for `t ∈ 𝕎_v`, the line becomes `ρ(t)ℒ(A, q)`.
- A test vector need not be a pure tensor: for independent Hermite vectors `u₀`, `u₁` at a real place and independent
  `f₀`, `f₁ ∈ S(X(𝔸_f))`, `u₀ ⊗ f₀ + u₁ ⊗ f₁` is a test vector of tensor rank two; it is not factorizable.

### 0.4 The theta kernel of a definite pair

For a test vector `φ`, the theta kernel `θ(g, h; φ) = Σ_{ξ ∈ X(F)} (ω(g, h)φ)(ξ)` of
MetaplecticAutomorphicForms §5.1 is a smooth function on `U(V)(𝔸) × U(W)(𝔸)`. Prove:

- *Invariance.* It is left `U(V)(F) × U(W)(F)`-invariant and right `K × K′`-invariant when `φ` is
  `K × K′`-fixed, and its right `K_∞ × K′_∞`-translates span a finite-dimensional space.
- *Lattice sum.* For `φ = φ_∞ ⊗ φ_f` (a general test vector is a finite sum of these), `g ∈ U(V)(𝔸_f)`, `h ∈ U(W)(𝔸_f)`,
  `θ(g, h; φ) = Σ_{ξ ∈ X(F) ∩ C} φ_∞(ξ) · (ω_f(g, h) φ_f)(ξ)`, where `C ⊂ X(𝔸_f)` is the compact
  support of `ω_f(g, h)φ_f`. Thus `ξ` runs over finitely many cosets of a lattice of rank
  `nd[F : ℚ]` in `X(F) ≅ M_{n×d}(F)`, the finite factor takes finitely many values, and the series
  converges absolutely because `φ_∞` is a polynomial times a Gaussian.
- *Boundedness.* The kernel is bounded on `U(V)(𝔸) × U(W)(𝔸)`, since both automorphic quotients are
  compact.

Route: invariance is MetaplecticAutomorphicForms §5.1 with the rational splitting of ThetaKernelsForUnitaryDualPairs §4.4a; the lattice sum unfolds the
definition, since `φ_f` is compactly supported and locally constant; boundedness is continuity on
the compact quotients (MetaplecticAutomorphicForms §5.2).

*Needs:* 0.3; MetaplecticAutomorphicForms §§5.1, 5.2.

**Checks.**

- `F = ℚ`, `E = ℚ(√−2)`, `n = d = 2`, `V = E²` with `x̄₁y₁ + x̄₂y₂`, `W = E²` with `δ(x̄₁y₁ + x̄₂y₂)`,
  `δ = −√−2`, `χ_V = χ_W = 1` (allowed, `n` and `d` even). In the bases `e_i ⊗ f_j`, `X(F) = ℚ⁴` and
  `B(e_i ⊗ f_j, δ e_k ⊗ f_l) = Tr(δ²)δ_{ik}δ_{jl} = −4δ_{ik}δ_{jl}`, so `Â = X(ℤ̂) ⊕ ¼δX(ℤ̂)` is self-dual.
  At every odd `p` the lift `q_p = 1` works and `1_{X(ℤ_p)}` is the lattice vector of `L_p ⊗ M_p`; at
  `p = 2` (where `E/ℚ` ramifies) take `q_2(x + y) = ψ_2(−½B(x, y))`, whose lattice vector is again
  `1_{X(ℤ_2)}`. For `φ = φ_vac ⊗ 1_{X(ℤ̂)}` the kernel at `g = h = 1` is `Σ_{ξ ∈ ℤ⁴} φ_vac(ξ)`, a theta
  value of a positive definite quadratic form; it is real and positive.

### Examples

For `F = ℚ`, `E = ℚ(i)`, `δ = −i/2`, `V = E` with `x̄y` and `W = E` with `δx̄y`, both `V` and `W^♭` are positive, so `ε = −1`; the symplectic space is `E` with `B(z, z′) = Tr(δz̄z′)`, `X = ℚ`, `Y = iℚ`, and `J` is multiplication by `i` (0.1). For `n` odd every `χ_V` is nontrivial with odd infinity types, and for `n` even `χ_V = 1` is allowed (0.2). For `F = ℚ`, `E = ℚ(√−2)`, `n = d = 2`, the standard forms with `δ = −√−2` and `χ_V = χ_W = 1`, the lattice `Â = X(ℤ̂) ⊕ ¼δX(ℤ̂)` is self-dual, `1_{X(ℤ̂)}` is its lattice vector (with the trivial lift at the odd primes and `q_2(x + y) = ψ_2(−½B(x, y))` at `2`), and the kernel of `φ_vac ⊗ 1_{X(ℤ̂)}` at `g = h = 1` is `Σ_{ξ ∈ ℤ⁴} φ_vac(ξ)`, a positive theta value of a positive definite quadratic form (0.4).

### Dependencies

MetaplecticAutomorphicForms §§0.1, 1.1, 2.6a, 3.2a, 3.3, 3.14, 4.1, 5.1, 5.2; ThetaKernelsForUnitaryDualPairs §§3.45, 3.46, 4.4a; HermitianFormsAndLattices §§0.1, 2.3, 2.4, 2.5, 5.2; BaseChangeAndGaloisRepresentationsForUnitaryGroups §6.3a; GeometryOfNumbersAndQuadraticArithmetic §2.9; SmoothRepresentationsOfLocalGroups §SR.4.3.

## Layer 1: theta lifts as class-set operators

### 1.1 The lift of a definite pair

Define the *definite theta lift* of `φ`, `𝒜(V; K) → 𝒜(W; K′)`, `F ↦ θ_φ(F)`, by
`θ_φ(F)(h) = ∫_{[U(V)]} θ(g, h; φ) F(g) dg` for a test vector `φ` fixed by `K × K′`. Prove:

- The integral converges absolutely and `θ_φ(F)` lies in `𝒜(W; K′)`.
- *Equivariance.* `θ_{ω(g₀, h₀)φ}(F) = R(h₀) θ_φ(R(g₀⁻¹) F)` for `g₀ ∈ U(V)(𝔸)`, `h₀ ∈ U(W)(𝔸)`,
  where `R` is right translation.
- *Weights.* If `φ = φ_∞ ⊗ φ_f` with `φ_∞` in the `σ ⊗ σ′`-isotypic part of the Fock space under
  `K_∞ × K′_∞` (0.3), then `θ_φ` vanishes on `𝒜_λ(V; K)` unless `σ ≅ σ_λ^∨`, and maps it into
  `𝒜_{λ′}(W; K′)` with `σ_{λ′} = σ′`.
- `θ_φ` agrees with the global theta lift of MetaplecticAutomorphicForms §5.6 applied to `F̄`.

Route: absolute convergence and moderate growth are 0.4 on the compact quotient; equivariance is the
substitution `g ↦ g g₀` in the integral and the identities `θ(g g₀, h; φ) = θ(g, h; ω(g₀, 1)φ)`,
`θ(g, h h₀; φ) = θ(g, h; ω(1, h₀)φ)`; the weight statement is Schur orthogonality for `K_∞`
(CompactGroups §§4.1–4.2) applied to the bilinear map `(φ_∞, F) ↦ θ_φ(F)`, which
is invariant under the diagonal `K_∞`.

*Needs:* 0.3, 0.4; MetaplecticAutomorphicForms §5.6; CompactGroups Layer 4.

### 1.2 The class-set formula and the lift of algebraic modular forms

Prove the *class-set formula*: for `F ∈ 𝒜(V; K)` and `h ∈ U(W)(𝔸)`,

`θ_φ(F)(h) = vol(K_∞K) · Σ_{c ∈ Cl(K)} |Γ_c|⁻¹ ∫_{K_∞} θ(k t_c, h; φ) F(k t_c) dk`,

and the right side does not depend on the choice of representatives `t_c`.

*The kernel on algebraic modular forms.* Fix weights `λ`, `λ′` and `φ_f` fixed by `K × K′`. Let
`ℱ = ℱ_{λ,λ′}` be the `σ_λ^∨ ⊗ σ_{λ′}`-isotypic part of the polynomial Fock space under `K_∞ × K′_∞`;
by ThetaKernelsForUnitaryDualPairs §3.46(iii) it is zero or irreducible, and we fix an isomorphism
`ι_ℱ : σ_λ^∨ ⊗ σ_{λ′} ≅ ℱ`. For `t ∈ U(V)(𝔸_f)`, `t′ ∈ U(W)(𝔸_f)` define
`k_φ(t, t′) ∈ Hom(σ_λ^∨, σ_{λ′}^∨)` by `⟨ℓ′, k_φ(t, t′) v⟩ = θ(t, t′; B⁻¹ι_ℱ(v ⊗ ℓ′) ⊗ φ_f)`, where `B⁻¹` is the inverse
Bargmann transform (0.3; a polynomial `P` and its polynomial Fock vector `B⁻¹P` are distinguished throughout). Prove:

- `k_φ(γ t u, γ′ t′ u′) = σ_{λ′}^∨(γ′_∞) k_φ(t, t′) σ_λ^∨(γ_∞)⁻¹` for `γ ∈ U(V)(F)`, `γ′ ∈ U(W)(F)`,
  `u ∈ K`, `u′ ∈ K′`: the transformation law of a kernel between Gross's rational models
  (DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5b).
- Define the *lift of algebraic modular forms* `Θ^φ : S(K, σ_λ^∨) → S(K′, σ_{λ′}^∨)` as the kernel operator of §7.5b,
  `(Θ^φ f)(t′) = Σ_c |Γ_c|⁻¹ k_φ(t_c, t′) f(t_c)`. Then for `f ∈ S(K, σ_λ^∨)`, `ℓ ∈ σ_λ` and
  `P = ι_ℱ(v ⊗ ℓ′)`, `θ_{B⁻¹P ⊗ φ_f}(Φ_f(ℓ)) = vol(K_∞K) (dim σ_λ)⁻¹ ⟨ℓ, v⟩ · Φ′_{Θ^φ f}(ℓ′)`,
  where `Φ`, `Φ′` are the realisations of the Conventions on the two groups.

Route: decompose `U(V)(F)\U(V)(𝔸) = ⊔_c U(V)(F)\U(V)(F) t_c K_∞K` and use the integration formula
of DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a, which weights the class `c` by `|Γ_c|⁻¹`; on each piece
the integrand is right `K`-invariant, which leaves the integral over `K_∞`. Representative
independence is the invariance of 0.4. The transformation law of `k_φ`: `θ(γ_f t, t′; Φ) = θ(t, t′; ω_∞(γ_∞⁻¹)Φ)` by left `U(V)(F)`-invariance, and `θ(tu, ·; B⁻¹P ⊗ φ_f) = θ(t, ·; B⁻¹P ⊗ φ_f)`. The
comparison: `θ(k t_c, t′; B⁻¹P ⊗ φ_f) = θ(t_c, t′; ω(k)B⁻¹P ⊗ φ_f)` and Schur orthogonality on `K_∞`
(CompactGroups §4.1) turn the `K_∞`-integral into `(dim σ_λ)⁻¹⟨ℓ, v⟩` times
`⟨ℓ′, k_φ(t_c, t′) f(t_c)⟩`.

*Needs:* 1.1; AutomorphicFormsOnReductiveGroups §§7.4, 7.5 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b; ThetaKernelsForUnitaryDualPairs §3.46;
CompactGroups §4.1; HermitianFormsAndLattices §§5.1, 5.2.

**Checks.**

- One class with `Γ_c = {±1}` (over `ℚ(√−m)`, `m ≠ 1, 3`, the unimodular lattice of rank one has
  `Γ_c = {±1}`; over `ℚ(i)` it is `μ_4`): the formula is `vol(K_∞K)/2` times one `K_∞`-integral;
  dropping the factor `|Γ_c|⁻¹` doubles the result.
- For `F = 1` and `φ_∞` in the `K_∞`-invariant part, the lift is `vol(K_∞K) Σ_c |Γ_c|⁻¹ θ(t_c, h; φ)`,
  a mass-weighted average of the kernel over the class set (Layer 5).

### 1.3 The lattice form

Let `L ⊂ V` and `M ⊂ W` be `O_E`-lattices, `K = K_L`, `K′ = K′_M` their stabilisers, and `(Â, q)` a
self-dual lattice with a lift (0.3) whose line is fixed by `K_L × K′_M` (for instance `A_v = L_v ⊗ M_v`
with the trivial lift at the places where `L_v`, `M_v` are self-dual and the data are unramified of odd
residue characteristic; at the places split in `E` with unramified splitting characters, in any residue characteristic
and for any conductor of `ψ_v`, the lattice of the type-II lattice vector of 0.3; and `K_L × K′_M` replaced by the
kernel of the character of 0.3 at the others). Through HermitianFormsAndLattices §5.1, `Cl(K_L)` is the set of
isometry classes `[L′]` of lattices in the genus of `L` (inside `V`), with `t ↦ tL`, `Γ_c = U(L_c)`, and `mass(K_L)` is
the mass of the genus (HermitianFormsAndLattices §5.5). Prove: for `F ∈ 𝒜(V; K_L)`,
`φ = φ_∞ ⊗ φ_Â` and `t′ ∈ U(W)(𝔸_f)`,

`θ_φ(F)(t′) = vol(K_∞K_L) Σ_{[L′]} |U(L′)|⁻¹ ∫_{K_∞} θ(k t_{L′}, t′; φ) F(k t_{L′}) dk`,

summed over the classes in the genus of `L`, with `t_{L′}` any element with `t_{L′}L = L′`, and
`θ(t_{L′}, t′; φ) = θ(1, 1; φ_∞ ⊗ ω_f(t_{L′}, t′)φ_Â)` with `ω_f(t_{L′}, t′)φ_Â` a lattice vector of
`((t_{L′}, t′)Â, q ∘ (t_{L′}, t′)⁻¹)`. When `φ_∞` is `K_∞ × K′_∞`-invariant, the kernel depends only on the
classes of `L′ = t_{L′}L` and `t′M`; in general it has the covariance of 1.2.

Route: 1.2 with the dictionary of HermitianFormsAndLattices §§5.1, 5.5 and the transport of lines of 0.3.

*Needs:* 0.3, 1.2; HermitianFormsAndLattices §§5.1, 5.5.

### 1.4 The adjoint lift

Define `θ_φ^* : 𝒜(W; K′) → 𝒜(V; K)` by `θ_φ^*(G)(g) = ∫_{[U(W)]} conj θ(g, h; φ) G(h) dh`. Prove:

- `⟨θ_φ F, G⟩ = ⟨F, θ_φ^* G⟩` for the Petersson products of the two groups.
- *Class-set form.* On algebraic modular forms, `θ_φ^*` corresponds through 1.2 to the kernel operator
  with kernel `(t′, t) ↦ k_φ(t, t′)^*` from `S(K′, σ_{λ′}^∨)` to `S(K, σ_λ^∨)`, which is the adjoint of
  `Θ^φ` for the class-set inner products (DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5b). Since the Petersson
  product is `c_V = vol(K_∞K)(dim σ_λ)⁻¹` times the class-set product on the source and
  `c_W = vol(K′_∞K′)(dim σ_{λ′})⁻¹` times it on the target (§7.5a, comparison), the adjoint of `Θ^φ` for the
  Petersson products is `c_W/c_V` times its class-set adjoint; the two agree only when `c_V = c_W`.
- `θ_φ^*` is the linear lift, for the standard character `ψ`, of the definite pair `(W^♭, (V(−1))^δ)` (the exchanged
  pair of 0.1 for `V(−1)`: the Hermitian space `W^♭` and `V` with the skew-Hermitian form `−δ⟨·,·⟩_V`), whose symplectic
  space is `(𝕎, −B)`, with the test vector `φ̄` and the splitting data `(χ̄_W, χ̄_V)` (`χ̄_W` governing `U(V)`, `χ̄_V`
  governing `U(W)`); its sign at a real place is `−sgn(W^♭_v)sgn(V(−1)_v) = −ε_v`. So 1.1–3.2 apply to it as stated.

Route: Fubini on the compact product `[U(V)] × [U(W)]`, the kernel being bounded (0.4); the class-set
form follows from 1.2 on both sides and the comparison of Petersson and class-set products in DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; the
last item: the complex conjugate of `ω_{ψ, χ_V, χ_W}` on `(𝕎, B)` is the Weil representation for `ψ̄` and the conjugate
characters on `(𝕎, B)` (MetaplecticAutomorphicForms §§2.7, 3.3), and `ψ̄ ∘ B = ψ ∘ (−B)`; `(𝕎, −B)` is the symplectic
space of `(W^♭, (V(−1))^δ)` because `Tr(δ⁻¹⟨w, w′⟩_W · (−δ)⟨v, v′⟩_V) = −B(v ⊗ w, v′ ⊗ w′)`, and `conj θ(g, h; φ)` is the
theta kernel of `φ̄` for it.

*Needs:* 0.1, 1.1, 1.2; DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b; MetaplecticAutomorphicForms
§§2.7, 3.3.

### 1.5 Level, translation and the span of lifts

Prove:

- *Levels.* If `φ` is fixed by `K × K′` and `K₁ ⊂ K`, then `θ_φ` on `𝒜(V; K₁)` restricts to the
  given operator on `𝒜(V; K)`, and `θ_φ ∘ tr_{K₁}^{K} = [K : K₁] · θ_φ` on `𝒜(V; K₁)` (trace of
  AutomorphicFormsOnReductiveGroups §7.4).
- *Span.* For an irreducible automorphic representation `π` of `U(V)`, the span `Θ_W(π)` of all
  `θ_φ(F)`, `F ∈ π`, `φ` a test vector, is a direct sum of irreducible automorphic representations
  of `U(W)`, stable under `U(W)(𝔸_f)` and `K′_∞`; its intersection with each `𝒜_{λ′}(W; K′)` is
  finite-dimensional.
- *Finite level.* For `F` in the `K`-fixed part of `π` and `φ` of level `K × K′`, `θ_φ(F)` has level
  `K′`.

Route: equivariance of 1.1; finite dimensionality of `𝒜_{λ′}(W; K′)` from AutomorphicFormsOnReductiveGroups
§7.5 and semisimplicity of the `L²` space of a compact quotient (§7.5 automorphic realisation).

*Needs:* 1.1; AutomorphicFormsOnReductiveGroups §§7.4, 7.5.

### 1.6 Integral structures and the denominator

Let `L₀ ⊂ ℂ` be a number field with ring of integers `𝒪`, and suppose `σ_λ^∨ = ρ ⊗_{L₀} ℂ` and
`σ_{λ′}^∨ = ρ′ ⊗_{L₀} ℂ` for algebraic representations `ρ`, `ρ′` of `Res_{F/ℚ}U(V)`, `Res_{F/ℚ}U(W)`
on `L₀`-spaces `M`, `M′`. Let `M̂ ⊂ M ⊗ 𝔸_{L₀,f}` be a `K`-stable lattice (for the action of
`U(V)(𝔸_f)` through `ρ`) and put `M_t = M ∩ ρ(t)M̂` for `t ∈ U(V)(𝔸_f)`; define `M′_{t′}` likewise.
Write `S(K, M_•)` for the forms `f ∈ S(K, σ_λ^∨)` with `f(t) ∈ M_t` for all `t`; the condition is
compatible with `f(γ t u) = ρ(γ) f(t)`, since `M_{γtu} = ρ(γ)M_t`.

The stabilisers are bounded by HermitianFormsAndLattices §5.2(c): `Γ_c` is a subgroup of `U(L_c)` for
the lattice `L_c = t_c L` of a lattice `L` with `K ⊂ K_L` (HermitianFormsAndLattices §4.5(c)), so `|Γ_c|`
and `D_K = lcm_c |Γ_c|` divide `minkowskiBound(2n[F : ℚ])`.

Prove: suppose there is `Ω ∈ ℂ^×` with
`Ω⁻¹ k_φ(t, t′) M_t ⊂ M′_{t′}` for all `t ∈ U(V)(𝔸_f)`, `t′ ∈ U(W)(𝔸_f)`. Then `D_K · Ω⁻¹ · Θ^φ` maps
`S(K, M_•)` into `S(K′, M′_•)`. For the adjoint kernel operator of 1.4 (kernel `(t′, t) ↦ k_φ(t, t′)^*`) the hypothesis
is on its own kernel: if there is `Ω′ ∈ ℂ^×` with `Ω′⁻¹ k_φ(t, t′)^* M′_{t′} ⊂ M_t` for all `t`, `t′`, then
`D_{K′} · Ω′⁻¹` times the adjoint maps `S(K′, M′_•)` into `S(K, M_•)`, and `D_{K′}` divides `minkowskiBound(2d[F : ℚ])`.
The hypothesis on `k_φ` does not give the one on `k_φ^*` (Check).

The hypothesis is where the arithmetic of the kernel enters: the kernel values are Fock pairings with
theta functions of CM abelian varieties (1.7–1.9), and `Ω` is a period. For a fixed pair of weights the
space `ℱ_{λ,λ′}` consists of polynomials homogeneous of one degree at each real place
(ThetaKernelsForUnitaryDualPairs §3.46(iii)), so one scalar per weight suffices. Whether the hypothesis
holds, and away from which primes, is not a statement of this roadmap.

Route: the integrality statement for class-set kernel operators, DiscreteSeriesCoefficientsAndAutomorphicMetrics
§7.5b, applied to `Θ^φ` (1.2), and to the adjoint kernel operator of 1.4 under its own hypothesis, with the bound on the
stabilisers just stated; the conditions at different representatives agree by the transformation law of `k_φ`.

*Needs:* 1.2, 1.4; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5b; HermitianFormsAndLattices §§4.5(c), 5.2;
ThetaKernelsForUnitaryDualPairs §3.46.

**Checks.**

- `n = 1`, `F = ℚ`, `E = ℚ(i)`: `Γ_c ⊂ μ_4`, of order dividing `4`, and
  `minkowskiBound(2) = 24` is divisible by `4`.
- `n = 1`, `F = ℚ`, `E = ℚ(√−3)`: `Γ_c ⊂ μ_6`, and `6 | 24`.
- The denominator is needed: for one class with `Γ_c = {±1}`, trivial coefficients `M = M′ = L₀`,
  `M̂ = 𝒪̂`, the target with one class and trivial stabiliser, and the kernel `k ≡ 1` (`Ω = 1`), the
  kernel operator sends the constant `1` to `1/2` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5b, Check), which
  is not integral at `2`; `D_K = 2` repairs it.
- The adjoint needs its own hypothesis: one class on each side, trivial coefficients `M = M′ = L₀`, `M̂ = p𝒪̂` (so
  `M_t = p𝒪`), `M̂′ = 𝒪̂` (so `M′_{t′} = 𝒪`), the kernel `1` and `Ω = 1`: the hypothesis `k_φ M_t ⊂ M′_{t′}` holds, and the
  adjoint kernel `1` does not map `𝒪` into `p𝒪`.

### 1.7 The kernel as a Fock pairing

Write `𝓕` for the Fock space of `(𝕎_∞, J) = ⊕_v (𝕎_v, J_v)` (ThetaKernelsForUnitaryDualPairs §3.45(i)),
`H` for its Hermitian form (`B(x, Jx) = H(x, x)`), `z = (z_j)` for holomorphic coordinates orthonormal
for `H`, and `⟨·,·⟩_𝓕` for its inner product, conjugate-linear in the first variable; for a polynomial
`P`, `P^♮` is the polynomial with complex conjugate coefficients. For `φ′ ∈ S(X(𝔸_f))`, let `ϑ_{φ′}` be
the Bargmann transform (ThetaKernelsForUnitaryDualPairs §3.45(iv)) of the tempered distribution
`T_{φ′} : Φ_∞ ↦ Σ_{ξ ∈ X(F)} φ′(ξ)Φ_∞(ξ)` on `X_∞ = X ⊗_ℚ ℝ`: the entire function on `(𝕎_∞, J)` with
`⟨ϑ_{φ′}, G⟩_𝓕 = T_{φ′}(B⁻¹G)` for every polynomial `G`. Prove: for
`g ∈ U(V)(𝔸_f)`, `h ∈ U(W)(𝔸_f)`, `φ_f ∈ S(X(𝔸_f))` and every polynomial Fock vector `P`,

`θ(g, h; B⁻¹P ⊗ φ_f) = ⟨ϑ_{ω_f(g,h)φ_f}, P⟩_𝓕 = conj( (P^♮(π⁻¹∂_z) ϑ_{ω_f(g,h)φ_f})(0) )`,

where `P^♮(π⁻¹∂_z)` is the constant-coefficient operator obtained by substituting `π⁻¹∂/∂z_j` for `z_j`.
For `P` homogeneous of degree `k`, `P^♮(π⁻¹∂_z) = π^{−k}P^♮(∂_z)`. For the extremal vectors of
ThetaKernelsForUnitaryDualPairs §3.46(iii) (products of leading principal minors of the matrix of
holomorphic coordinates at each real place, joint highest weight vectors where `ε_v = +1` and joint lowest weight
vectors where `ε_v = −1`; pluriharmonic, with real coefficients), `P^♮ = P` and the operator is the
corresponding product of minors of the matrix `(π⁻¹∂/∂z_{ij})`.

Route: for `g`, `h` finite adelic, `θ(g, h; Φ_∞ ⊗ φ_f) = T_{ω_f(g,h)φ_f}(Φ_∞)` by 0.4; the rest is
ThetaKernelsForUnitaryDualPairs §3.45(iv): `⟨F, z^κ⟩_𝓕 = π^{−|κ|}κ!·conj(f_κ)` for `F = Σ f_κ z^κ`, which is `conj` of
`π^{−|κ|}∂^κF(0)`.

*Needs:* 0.4; ThetaKernelsForUnitaryDualPairs §3.45.

**Checks.**

- The kernel of a polynomial vector is not a jet of the Bargmann transform of the Gaussian. For one
  variable, `T = δ_0` has `ϑ_T(z) = 2^{1/4}e^{−πz²/2}`, and for `P = z²`,
  `T(B⁻¹P) = −2^{1/4}/π`, the (nonzero) value at `0` of the Hermite function of degree two
  (ThetaKernelsForUnitaryDualPairs §3.45, Check), equal to `conj((π⁻²∂²ϑ_T)(0))`; the jet of the transform `1` of the Gaussian is `0`.
- Degree: replacing the coordinates `z` by `Ωz` multiplies `(P^♮(π⁻¹∂_z)ϑ)(0)` by `Ω^{−k}` for `P`
  homogeneous of degree `k`; for the weights `λ`, `λ′` fixed, all of `ℱ_{λ,λ′}` has the same degree at
  each real place (ThetaKernelsForUnitaryDualPairs §3.46(iii)), so the period normalisation of 1.6 is a single scalar.

### 1.8 The theta line of a self-dual lattice

Assume `nd > 0`. Let `(Â, q)` be a self-dual lattice with a lift (0.3) and `φ_Â` a nonzero vector of `ℒ(Â, q)`. Put
`𝕃_Â = 𝕎(F) ∩ Â` (with `𝕎(F) ⊂ 𝕎(𝔸_f)` diagonally), a lattice in `𝕎_∞`, and `A_Â = 𝕎_∞/𝕃_Â` with the
complex structure `J`. For `ℓ ∈ 𝕃_Â` write `ℓ = x_ℓ + y_ℓ` in `X ⊕ Y`, let `r(ℓ) = (½B(x_ℓ, y_ℓ), ℓ)` be the
lift of `ℓ` to the Heisenberg group given by the polarisation (it preserves the theta distribution), and
let `α_0(ℓ) ∈ ℂ^1` be the scalar by which its finite part `r_f(ℓ)` acts on `ℒ(Â, q)`. Let `Φ′` be the CM
type of `E` consisting, at each real place `v`, of `τ_v` if `ε_v = −1` and of `τ̄_v` if `ε_v = +1` (the embedding
through which `E` acts `ℂ`-linearly on `(𝕎_v, J_v)`). Prove:

- *The abelian variety.* `E = −Tr_{F/ℚ} ∘ B` is a principal Riemann form on `𝕃_Â` for `J` in the sense of
  AbelianSchemesAndArithmeticModuli A5.2 (`E(Jv, v) > 0`), with Hermitian form `H` (A5.2). So `A_Â` is a
  principally polarised abelian variety of dimension `nd[F : ℚ]`. The order
  `𝒪_Â = {e ∈ E : e𝕃_Â ⊂ 𝕃_Â}` acts on it, `E` acting `ℂ`-linearly on `(𝕎_∞, J)` through `Φ′`; `A_Â` is
  isogenous to `B^{nd}` for an abelian variety `B` with complex multiplication by `E` of type `Φ′`.
- *The semicharacter.* `α(ℓ) = α_0(ℓ)⁻¹ e^{πiE(x_ℓ, y_ℓ)}` is a semicharacter of `E` on `𝕃_Â`:
  `α(ℓ + ℓ′) = (−1)^{E(ℓ, ℓ′)}α(ℓ)α(ℓ′)`.
- *Sections.* `ϑ_{φ_Â}` (1.7) is a nonzero holomorphic section of the line bundle `L(H, α)` of A5.3:
  `ϑ(z + ℓ) = α(ℓ) exp(πH(z, ℓ) + πH(ℓ, ℓ)/2) ϑ(z)` for `ℓ ∈ 𝕃_Â`. Since `h⁰(L(H, α)) = 1` (A5.4), the map
  `φ ↦ ϑ_φ` (conjugate-linear, as `ϑ_{cφ} = c̄ϑ_φ`) is a bijection of `ℒ(Â, q)` onto `H⁰(A_Â, L(H, α))`.
- *Norm.* `∫_{𝕎_∞/𝕃_Â} |ϑ_φ(z)|² e^{−πH(z, z)} dz = ‖φ‖²` for the Lebesgue measure of `H` on `𝕎_∞` (covolume of
  `𝕃_Â` equal to `1`) and, on `X(𝔸_f)`, the Haar measure whose product with the Lebesgue measure of the Euclidean
  form `H(x, x)` on `X_∞` is the Tamagawa measure of `X(𝔸)` (`vol(X(𝔸)/X(F)) = 1`).
- *Moving the lattice.* For `g ∈ U(V)(𝔸_f)`, `h ∈ U(W)(𝔸_f)`, `ϑ_{ω_f(g,h)φ_Â}` is the section of norm
  `‖φ_Â‖` of the line of `((g, h)Â, q ∘ (g, h)⁻¹)` that 1.7 attaches to the kernel:
  `θ(g, h; B⁻¹P ⊗ φ_Â) = ⟨ϑ_{ω_f(g,h)φ_Â}, P⟩_𝓕`.
- *Translates.* For `t ∈ 𝕎(F)`, `ϑ_{ρ_f(r_f(t))φ} = ψ_∞(½B(x_t, y_t)) · U_tϑ_φ`, with the Fock translation
  `U_tϑ(z) = ϑ(z + t)exp(−πH(z, t) − πH(t, t)/2)`; so for `φ_f` a finite combination of Heisenberg translates of `φ_Â` (every
  `t ∈ 𝕎(𝔸_f)` is congruent modulo `Â` to an element of `𝕎(F)`), the kernel is the corresponding
  combination of Fock pairings with translates of `ϑ_{φ_Â}`, each with its factor of automorphy.

Route: `E` is integral and unimodular on `𝕃_Â` because the annihilators of `Â` in `𝕎(𝔸_f)` and of `𝕎(F)`
in `𝕎(𝔸)` for `ψ ∘ B` are `Â` and `𝕎(F)` (AnalyticNumberTheoryPartII §5.3h); positivity is the
definition of `J`; `E` acts `ℂ`-linearly through `Φ′` by the Conventions, and `𝕎 ≅ E^{nd}` as an
`E`-space gives the isogeny type. The functional equation: `ρ(r(ℓ))` fixes the theta distribution, so
`α_0(ℓ) T_φ(ρ_∞(r_∞(ℓ))Φ) = T_φ(Φ)`; in the Fock model the Heisenberg element `(t, w)` acts by
`ψ_∞(t)U_w`, `U_w G(z) = G(z + w)exp(−πH(z, w) − πH(w, w)/2)` (the commutation relations of the two sides
agree because `E = −Tr ∘ B`); hence `ϑ_{ρ_f(r_f(ℓ))φ} = ρ^𝓕(r_∞(ℓ))ϑ_φ`, while `ϑ_{α_0φ} = ᾱ_0ϑ_φ`, which gives
`U_ℓϑ_φ = α(ℓ)ϑ_φ`, the displayed factor of automorphy, with `α(ℓ) = α_0(ℓ)⁻¹ψ_∞(−½B(x_ℓ, y_ℓ))`. Nonvanishing: if
`ϑ_φ = 0` then `T_φ` vanishes on the dense span of
the polynomial Fock vectors, so `φ = 0` on `X(F)`, which is dense in `X(𝔸_f)`. The norm identity is the
unitarity of the theta functional from `L²(X(𝔸))` onto the `L²` space of the Heisenberg nilmanifold
`H(𝕎(F))\H(𝕎(𝔸))` with central character `ψ` (Weil), restricted to the vectors `φ_Â ⊗ G`, `G ∈ 𝓕`, and
unfolded over `𝕃_Â`. Moving: `ω_f(g, h)` is unitary and transports lines (0.3). Translates:
`ρ(r(t))` fixes the theta distribution for `t ∈ 𝕎(F)`.

*Needs:* 0.3, 1.7; MetaplecticAutomorphicForms §§0.1, 1.1 and ThetaKernelsForUnitaryDualPairs §§3.45, 4.4a; AbelianSchemesAndArithmeticModuli
A5.1–A5.4; AnalyticNumberTheoryPartII §5.3h.

**Checks.**

- `F = ℚ`, `E = ℚ(i)`, `n = d = 1`, the data of 0.1's Check, `Â = ℤ̂ ⊕ ℤ̂i` (self-dual, `B(1, i) = 1`) and
  `φ_Â = 1_{ℤ̂}` (lift `q(x + yi) = ψ_f(−½xy)`): `r_f(ℓ)` and the lift of `ℓ` differ by the central
  element `xy ∈ ℤ`, so `α_0 = 1` and `α(x + iy) = e^{πiE(x, iy)} = (−1)^{xy}`; `𝕃_Â = ℤ[i]`,
  `H(z, w) = z w̄`, and `ϑ_{φ_Â}(z) = 2^{1/4}e^{−πz²/2}Σ_{m ∈ ℤ} e^{2πmz − πm²}`. Its value at `0`,
  `2^{1/4}Σ_m e^{−πm²} ≈ 1.2920`, is the kernel of the vacuum at `g = h = 1`; its norm is `1 = ‖1_{ℤ̂}‖`,
  while the lattice average `Σ_ℓ α(ℓ)e^{−πH(z,ℓ) − πH(ℓ,ℓ)/2}` of the vacuum, which spans the same line,
  has norm squared `Σ_ℓ (−1)^{xy}e^{−π|ℓ|²/2} ≈ 1.6692`.
- Parity: when `α` takes values in `{±1}`, `z ↦ ϑ(−z)` lies in the same line, and `ϑ(−z) = ±ϑ(z)` with the
  sign the Arf invariant of the quadratic form `ℓ ↦ α(ℓ)` on `𝕃_Â/2𝕃_Â`; for the sign `−1` the kernel of
  every `P` of even total degree vanishes at `g = h = 1`, and for `+1` that of every `P` of odd degree.
- Replacing `q` by `q · ψ_f(B(t, ·))` (0.3, Check) multiplies `α` by `exp(2πiE(t, ·))`, the semicharacter
  of the translated bundle `t^*L(H, α)` (A5.3).
- `nd = 0` is excluded: then `𝕃_Â = 0` and the set `{e ∈ E : e𝕃_Â ⊂ 𝕃_Â}` is all of `E`, not an order; the Fock space is `ℂ`,
  `ℒ(Â, q) = ℂ`, and `ϑ_φ` is the constant `conj φ(0)`, with no abelian variety, order or CM type attached.

### 1.9 Induced CM types

Suppose `E` contains an imaginary quadratic field `k` of discriminant `−D`, that `Φ′` (1.8) consists of the
embeddings of `E` extending one embedding `ι : k → ℂ`, and that `𝕃_Â` is an `O_k`-module. Prove:

- `(𝕎_∞, J) = 𝕃_Â ⊗_{O_k, ι} ℂ`, so `A_Â = (𝕃_Â ⊗_{O_k} ℂ)/𝕃_Â`, isomorphic as a complex torus to
  `∏_i ℂ/ι(𝔞_i)` for any decomposition `𝕃_Â ≅ ⊕_i 𝔞_i` into fractional ideals of `k`; and `H = (2/√D)·ι ∘ h_𝕃` for a
  positive definite `k`-valued Hermitian form `h_𝕃` on the `k`-space `𝕃_Â ⊗ ℚ`, characterised by
  `E = Tr_{k/ℚ}(h_𝕃/√−D)` on `𝕃_Â` (so `H` itself takes values in `√D·ι(k)` there, not in `ι(k)`).
- *Orthogonal sums.* If `(𝕃_Â, h_𝕃) = ⊥_i 𝔞_i u_i` is an orthogonal sum of rank-one lattices, then
  `(A_Â, L(H, α))` is the product of the principally polarised CM elliptic curves `(ℂ/ι(𝔞_i), H_i)` with line
  bundles `L(H_i, α_i)`, `α = ∏_i α_i`, and the section of norm `‖φ‖` of 1.8 is `u · ‖φ‖ · ⊗_i ϑ_i` with `ϑ_i` a
  section of `L(H_i, α_i)` of norm one and `|u| = 1`.
- *Finis's theta functions.* For one factor `(ℂ/ι(𝔞), H)`, `H(w, w′) = 2r√D w w̄′` with `r = (D N(𝔞))⁻¹`
  (principality), and for every sublattice `𝔟 ⊂ 𝔞` with `rN(𝔟) ∈ ℤ` (for instance `𝔟 = D𝔞`) the line
  `H⁰(L(H, α))`, translated by a suitable `A_c`, `c ∈ ℂ`, is the subspace of Finis's space `T_{r,𝔟}`
  (NonordinaryCMSpecialValues §4.2) on which the operators `A_l`, `l ∈ 𝔞`, act by the corresponding
  semicharacter; Finis's normalised scalar product on `T_{r,𝔟}` restricts to the norm of 1.8 there.
- In the coordinate `z = Ω w` given by a period `Ω` of `ℂ/ι(O_k)`, the holomorphic jet `(P^♮(π⁻¹∂_z)ϑ)(0)` of a polynomial
  homogeneous of degree `k_v` at the place `v` is `Ω^{−Σ k_v}` times the jet in the coordinate `w` (1.7, Check); the Fock
  pairing `⟨ϑ, P⟩_𝓕`, its complex conjugate (1.7), is multiplied by `Ω̄^{−Σ k_v}`. So a normalisation of the jets by `Ω`
  is a normalisation of the Fock pairings, hence of the kernel values of 1.6, by `Ω̄`.

Route: `k ⊗ ℝ ≅ ℂ` through `ι` gives the complex structure; `E` is `O_k`-balanced (`E(ax, y) = E(x, āy)`), so
`E = Tr_{k/ℚ}(h_𝕃/√−D)` for a unique `k`-valued Hermitian `h_𝕃`, and comparing `Im H = E` on the two sides gives
`H = (2/√D)·ι ∘ h_𝕃` (for one factor, `h_𝕃(w, w′) = w w̄′/N(𝔞)` and `H = 2r√D w w̄′`); a finitely generated torsion-free
`O_k`-module is a sum of rank-one modules. For an orthogonal sum the Riemann form, the semicharacter and the line bundle
split, `h⁰` is multiplicative, and Fubini gives the norm. Finis's factor of automorphy `ψ(l)e^{−2πirδ l̄(w + l/2)}`
(`δ = √−D`, `Im δ > 0`) is the factor `α(l)exp(πH(w, l) + πH(l, l)/2)` of A5.3 for `H(w, l) = 2r√D w l̄` and
`α(l) = (−1)^{rDN(l)}`, so Finis's `A_l` is the Fock translation `U_l` of 1.8; a section for `𝔞` is a section for
`𝔟 ⊂ 𝔞`, two semicharacters of `E|_𝔟` differ by `exp(2πiE(c, ·))` for some `c`, realised by `A_c` (A5.3, the Mumford
map), and Finis's normalised scalar product is the average of `|ϑ(w)|²e^{−πH(w,w)}` over a fundamental domain, which for
a function periodic for `𝔞` is the norm of 1.8 (covolume `1` for the principal `H`).

*Needs:* 1.7, 1.8; AbelianSchemesAndArithmeticModuli A5.1–A5.4; NonordinaryCMSpecialValues §4.2.

**Checks.**

- `F = ℚ`, `E = k = ℚ(i)`, `n = d = 1`: one rank-one lattice, and 1.8's Check is the case `𝔞 = ℤ[i]`, `D = 4`,
  `r = 1/4`, `H = |w|²`; Finis's `T_{1/4, 4ℤ[i]}` has dimension `rDN(𝔟) = 16`, and the line of 1.8 is the joint
  eigenline of the `A_l`, `l ∈ ℤ[i]`.
- For `𝕃_Â` not an orthogonal sum of rank-one lattices (a non-diagonalisable unimodular Hermitian
  `O_k`-lattice of rank two), `L(H, α)` is not an external tensor product, and only the first and last
  bullets apply.

### Examples

For one class with stabiliser `{±1}` (the unimodular lattice of rank one over `ℚ(√−m)`, `m ≠ 1, 3`) the class-set formula is `vol(K_∞K)/2` times one `K_∞`-integral (1.2); with trivial coefficients and the kernel `1`, the kernel operator sends the constant `1` to `1/2`, which `D_K = 2` makes integral (1.6). For `n = 1` and `F = ℚ` the stabilisers lie in `μ_4` over `ℚ(i)` and in `μ_6` over `ℚ(√−3)`, and both orders divide `minkowskiBound(2) = 24` (1.6). For `F = ℚ`, `E = ℚ(i)`, `n = d = 1` and `Â = ℤ̂ ⊕ ℤ̂i`, the semicharacter is `α(x + iy) = (−1)^{xy}` on `𝕃_Â = ℤ[i]`, and the theta line is spanned by `ϑ(z) = 2^{1/4}e^{−πz²/2}Σ_{m ∈ ℤ} e^{2πmz − πm²}`, whose value at `0`, about `1.2920`, is the kernel of the vacuum at `g = h = 1`, and whose norm is `1 = ‖1_{ℤ̂}‖` (1.8); in Finis's normalisation this is the case `𝔞 = ℤ[i]`, `D = 4`, `r = 1/4`, a joint eigenline of the `A_l` in the space `T_{1/4, 4ℤ[i]}` of dimension `16` (1.9).

### Dependencies

Layer 0; MetaplecticAutomorphicForms §§0.1, 1.1, 2.7, 3.3, 5.6; ThetaKernelsForUnitaryDualPairs §§3.45, 3.46, 4.4a; AutomorphicFormsOnReductiveGroups §§7.4, 7.5; DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b; HermitianFormsAndLattices §§4.5, 5.1, 5.2, 5.5; AbelianSchemesAndArithmeticModuli A5.1–A5.4; AnalyticNumberTheoryPartII §5.3h; NonordinaryCMSpecialValues §4.2; CompactGroups Layer 4.

## Layer 2: weights, Hecke equivariance and Satake parameters

### 2.1 Archimedean weights

At a real place `v`, ThetaKernelsForUnitaryDualPairs §3.46(iii) gives the restriction of `ω_v` to
`U(n) × U(d)` on polynomial Fock vectors: with `a_v`, `b_v` of the Conventions, the degree-`k` polynomials decompose as
`⊕_μ σ_{ι_{ε_v}(μ^{(n)} + a_v)} ⊗ σ_{ι_{ε_v}(μ^{(d)} + b_v)}` over the partitions `μ` of `k` with at most `min(n, d)`
nonzero parts, `μ^{(m)}` denoting `μ` written with `m` entries, each summand irreducible and the summands pairwise
non-isomorphic (for `ε_v = +1`, that is `sgn(V_v)sgn(W^♭_v) = −1`, the types `σ_{μ^{(n)}+a_v} ⊗ σ_{μ^{(d)}+b_v}`; for
`ε_v = −1`, that is `V_v` and `W^♭_v` of the same sign, the contragredients of the types `σ_{μ^{(n)}+a} ⊗ σ_{μ^{(d)}+b}`
with `a = a_v`, `b = b_v`). For `n ≤ d`, `μ^{(n)} = μ` and `μ^{(d)} = (μ, 0^{d−n})`.

Define the *weight map* `λ_v ↦ Λ_v(λ_v)` on highest weights of `U(n)`: `λ_v` *occurs* if
`ι_{−ε_v}(λ_v) − a_v(1, …, 1)` is a partition `μ_v` with at most `min(n, d)` nonzero parts, and then
`Λ_v(λ_v) = ι_{ε_v}(μ_v^{(d)} + b_v(1, …, 1))`. Prove:

- For `F ∈ 𝒜_λ(V; K)` and every test vector `φ`, `θ_φ(F)` lies in `𝒜_{Λ(λ)}(W; K′)` with
  `Λ(λ) = (Λ_v(λ_v))_v`, and `θ_φ(F) = 0` for every `φ` if some `λ_v` does not occur. (The Fock type paired
  with `F` is `σ_λ^∨` by 1.1.)
- For `λ` occurring at every real place, the extremal vectors of ThetaKernelsForUnitaryDualPairs §3.46(iii) (products of leading principal
  minors of the holomorphic coordinates at each real place, joint highest weight vectors where `ε_v = +1` and
  joint lowest weight vectors where `ε_v = −1`) span a nonzero vector `P` of the
  `σ_λ^∨ ⊗ σ_{Λ(λ)}`-part, and for every `ξ₀ ∈ X(F)` with `(B⁻¹P)(ξ₀) ≠ 0` there is a compact open subgroup
  `Λ₀ ⊂ X(𝔸_f)` such that for every compact open subgroup `Λ ⊂ Λ₀` the kernel `θ(·, ·; B⁻¹P ⊗ 1_{ξ₀+Λ})` is nonzero at
  `g = h = 1`. Small support alone does not suffice: the kernel can vanish identically for other `φ_f` supported near
  `ξ₀` (Check); if `−1 ∈ U(V)(F)` acts on `φ_f` by `ε = ±1` (`θ(g, h; φ) = θ(g, h; ω(−1)φ)`), the kernel of every `P` whose
  type has central sign `−ε` at `−1` is `0`.
- `Λ_v` is injective, and its image is `ι_{ε_v}` of the set of `λ′` with `λ′_i = b_v` for `i > min(n, d)` and, when `n ≥ 1`,
  `λ′_{min(n,d)} ≥ b_v` (for `n = 0` the single weight `ι_{ε_v}(b_v(1, …, 1))`).

Route: ThetaKernelsForUnitaryDualPairs §3.46(iii) and Schur orthogonality on `K_∞` (1.1); the extremal vectors are those of the
`(GL_n, GL_d)`-duality, TensorInductionAndFiniteGroupInputs §7.1. For the second bullet, at `g = h = 1` the
lattice sum of 0.4 for `φ_f` the indicator of `ξ₀ + Λ`, `Λ ⊂ X(𝔸_f)` a small compact open subgroup, runs over
`ξ₀ + (Λ ∩ X(F))`, a translate of a lattice of `X_∞`. Fix a compact open subgroup `Λ₁`; since `B⁻¹P` is a polynomial
times a Gaussian there is `R` with `Σ_{ξ ∈ Λ₁ ∩ X(F), ‖ξ‖ > R} |(B⁻¹P)(ξ₀ + ξ)| < |(B⁻¹P)(ξ₀)|`, and a compact open `Λ₀ ⊂ Λ₁`
containing none of the finitely many nonzero `ξ ∈ Λ₁ ∩ X(F)` with `‖ξ‖ ≤ R`. For `Λ ⊂ Λ₀` the terms `ξ ≠ 0` of the sum are
among those with `‖ξ‖ > R`, so the term `ξ₀` dominates and the kernel is nonzero (`X(F)` is dense in `X(𝔸_f)`, so no
support meets it in `ξ₀` alone); the parity statement is `ω(−1, 1)` acting on `B⁻¹P` by the central sign of its type.

*Needs:* 0.4, 1.1; ThetaKernelsForUnitaryDualPairs §3.46; TensorInductionAndFiniteGroupInputs §7.1.

**Checks.**

- `n = 0`: there is no `μ` but the empty partition, which imposes no condition on `a_v`, and `U(d)` acts on the
  one-dimensional Fock space by `det^{ε_v b_v} = det^{m_{V,v}/2}`; this is the character `χ̃_V ∘ det` of
  MetaplecticAutomorphicForms §3.3 (Check `V = 0`) at `v`, for either sign (`χ_V ∘ det` would be `det^{m_{V,v}}`, its
  square).
- *Small support is not enough.* `n = d = 1`, `P = 1`, `ξ₀ = 0`: a nonzero odd `φ_f` (`φ_f(−x) = −φ_f(x)`) supported in an
  arbitrarily small symmetric neighbourhood of `0` gives the zero kernel: the vacuum is even, so `φ_vac ⊗ φ_f` is odd, the
  parity operator `φ ↦ φ(−·)` commutes with the Weil representation, and the terms of `ω(g, h)φ` at `ξ` and `−ξ` cancel for
  every `g`, `h`; the indicator of a small compact open subgroup gives a nonzero kernel at `g = h = 1`.
- `n = d = 1`, `ε_v = +1` (for instance `V` negative, `W^♭` positive): a form of weight `w` occurs iff
  `−w − a_v ≥ 0`, that is `w ≤ −(1 + m_{W,v})/2`, and lifts to weight `−w − a_v + b_v = −w + (m_{V,v} − m_{W,v})/2`. For
  `ε_v = −1` (for instance `V` and `W^♭` positive): `w` occurs iff `w − a_v ≥ 0`, that is `w ≥ (1 − m_{W,v})/2`, and
  lifts to weight `−(w − a_v + b_v) = −w + (m_{V,v} − m_{W,v})/2`. In both cases this is the weight at `v` of
  `μ⁻¹ (χ_V/χ_W)~`, the lift of a character `μ` of `E¹\𝔸_E¹` of weight `w` (2.2, Check); so this Check does not
  detect the sign `ε_v`, and the next ones do.
- *The vacuum.* For `V`, `W^♭` positive (`ε_v = −1`, `J_v = τ_v(i)`), the element `e^{iθ}` of `U(V)(F_v) = U(n)` acts on
  `𝕎_v` as `exp(θJ_v)`, so by the Conventions it acts on the vacuum by `e^{−iθnd/2}` times the twist
  `e^{iθnm_{W,v}/2}` of the splitting character, that is with the central weight `−n·a_v = n(m_{W,v} − d)/2` of
  `σ_{ι_{−1}(a_v(1, …, 1))}`. Attaching `ε_v = +1` to this pair would give `n(m_{W,v} + d)/2`.
- *Holomorphy* (ThetaKernelsForUnitaryDualPairs §3.46, Check). For `V` positive definite of dimension `n` and the
  restriction of a split skew-Hermitian plane `W′` at `v` (`W′^♭_v = ℓ₊ ⊕ ℓ₋`, of signature `(1, 1)`), the vacuum is
  the tensor product of those of the definite pairs `(V, ℓ₊)` (`ε = −1`) and `(V, ℓ₋)` (`ε = +1`), on which the case
  `d = 1`, `k = 0` gives `U(ℓ₊) × U(ℓ₋)` the type `k₊^{(m_{V,v} − n)/2}k₋^{(m_{V,v} + n)/2}`: the type for which the theta
  series of a positive definite Hermitian lattice of rank `n`, a holomorphic modular form of weight `n` (5.4(a) with
  `k = 1`), is automorphic. With the opposite sign the type would be `k₊^{(m_{V,v} + n)/2}k₋^{(m_{V,v} − n)/2}`, an
  antiholomorphic weight.
- For `n ≥ 1`, the trivial weight `λ_v = 0` occurs iff `a_v ≤ 0`, that is `ε_v m_{W,v} ≤ −d`, that is
  `sgn(V_v)sgn(W^♭_v)·m_{W,v} ≥ d`, and, when `n > d`, `a_v = 0`; then `μ = (−a_v)^n` and, for `n ≤ d`,
  `Λ_v(0) = ι_{ε_v}((b_v − a_v)^n ⊕ b_v^{d−n})`. For `n = 0` the empty weight always occurs: for `d = 2` and trivial
  splitting characters the oscillator line is trivial and the lift of `1` is `1`, while `ε_v m_{W,v} ≤ −d` would read
  `0 ≤ −2`.
- The length condition is needed when `n > d`: for `n = 2`, `d = 1`, `V`, `W^♭` positive (`ε_v = −1`) and `m_{W,v} = 3`,
  `a_v = −1` and `λ_v − a_v(1, 1) = (1, 1)` for `λ_v = 0`, a partition with two parts, while polynomials on `2 × 1` matrices
  carry only partitions with one part: the trivial weight does not occur.
- The two pairs of 6.10: `V` positive and `V′` negative definite, `W^♭ ≅ V ⊕ V′(−1)` positive definite,
  so `ε_v = −1` for `(V, W)` and `ε_v = +1` for `(V′, W)`. With `χ_W = β/α` for `(V, W)` and `χ_W = α/β` for
  `(V′, W)` (infinity types `−κ_v` and `κ_v`), `ε_v m_{W,v} = κ_v` for both, and the trivial weight occurs for both
  pairs exactly when `κ_v ≤ −(a + a′)`.

### 2.2 Split places: Satake parameters and Hecke equivariance

Let `n ≤ d`, and let `v` be a finite place of `F` split in `E`, `v = w w̄`, at which `χ_{V,v}`, `χ_{W,v}` are
unramified, of any residue characteristic and with `ψ_v` of any conductor, with `U(V)(F_v) ≅ GL_n(E_w)`,
`U(W)(F_v) ≅ GL_d(E_w)` through MetaplecticAutomorphicForms §3.2a, `K_v = GL_n(O_w)`, `K′_v = GL_d(O_w)` (the
stabilisers of self-dual lattices `L_v = Λ ⊕ Λ^∨`, `M_v = Λ′ ⊕ Λ′^∨`) and `φ_v = 1_{M_{n×d}(O_w)}` the type-II lattice
vector of 0.3 (lift `q(x + y) = ψ_v(−½B(x, y))`; it is the lattice vector of `L_v ⊗ M_v` with the trivial lift when
`ψ_v` is unramified and the residue characteristic is odd). Let `ℋ_n`, `ℋ_d` be the spherical Hecke algebras of
`GL_n(E_w)`, `GL_d(E_w)`, acting on forms on both groups by `F ⋆ T = R(T)F`, `R(T)F(x) = ∫ T(y)F(xy) dy`. Prove:

- There is an algebra homomorphism `ξ_w : ℋ_d → ℋ_n` with `θ_φ(F) ⋆ T = θ_φ(F ⋆ ξ_w(T))` for all
  `T ∈ ℋ_d` and all `F` of level `K` with `K_v` as above.
- In Satake terms (SmoothRepresentationsOfLocalGroups §SR.4.3),
  `Sat(ξ_w(T))(α_1, …, α_n) = Sat(T)(c_w α_1⁻¹, …, c_w α_n⁻¹, χ_{V,w}(ϖ_w) q_w^{(d−n−1)/2}, …, χ_{V,w}(ϖ_w) q_w^{−(d−n−1)/2})`, `c_w = χ_{V,w}(ϖ_w)/χ_{W,w}(ϖ_w)`.
- Hence if `F` is an `ℋ_n`-eigenform with Satake parameter `α` and `θ_φ(F) ≠ 0`, then `θ_φ(F)` is an
  `ℋ_d`-eigenform with Satake parameter `(c_w α⁻¹, χ_{V,w}(ϖ_w) q_w^{(d−n−1)/2 − i} : 0 ≤ i < d − n)`.

Remark: for the definite groups of PotentialAutomorphyInfrastructurePartII §3.1 these are its split-place
operators `T_w^{(j)}` (§3.3), and the statement reads as a relation between their Hecke polynomials.

Route: the identity `ω_v(1, T)φ_v = ω_v(ξ_w(T)^∨, 1)φ_v` of ThetaKernelsForUnitaryDualPairs §3.21a(ii)
(split case, which holds in every residue characteristic and for every conductor of `ψ_v`, the type-II model not
involving `ψ_v`) with the type-II model of MetaplecticAutomorphicForms §§3.2a, 3.14, where `T^∨(g) = T(g⁻¹)`; insert it in the integral of
1.1: `θ_φ(F) ⋆ T = θ_{ω(1,T)φ}(F) = θ_{ω(ξ_w(T)^∨,1)φ}(F) = θ_φ(F ⋆ ξ_w(T))`. The Satake relation:
`F` generates `π` with `π_v` of parameter `α`; `θ_φ(F)` lies in a quotient of `Θ(π_v^∨)` (1.1), and
`π_v^∨` has parameter `α⁻¹`, so by ThetaKernelsForUnitaryDualPairs §3.21a(iii) the eigencharacter of `θ_φ(F)` is that of
`(c_w α⁻¹, segment)`; comparing with `χ_{π}(ξ_w(T)) = Sat(ξ_w(T))(α)` gives the formula.

*Needs:* 0.3, 1.1; MetaplecticAutomorphicForms §§3.2a, 3.14 and ThetaKernelsForUnitaryDualPairs §3.21a; AutomorphicFormsOnReductiveGroups
§7.4; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.3.

**Checks.**

- At a dyadic split place the trivial lift of the lattice of `φ_v` need not exist (0.3, Check), and at a split place
  dividing the different of `F` the lattice `L_v ⊗ M_v` is not self-dual for `ψ_v ∘ B`; in both cases
  `φ_v = 1_{M_{n×d}(O_w)}` and `K_v × K′_v` are as stated, and the statement is unchanged.

- `n = d = 1` (the rank-one example of the roadmap). `U(V) = U(W) = E¹` act on `V ⊗_E W = E` by the
  scalar `gh`, so `θ(g, h; φ) = κ(h)(χ_V/χ_W)~(h) θ(gh, 1; φ)` with `κ` a character independent of the
  splitting data. For a character `μ` of `E¹\𝔸_E¹`, substituting `g ↦ gh⁻¹`,
  `θ_φ(μ) = c_φ(μ) · κ · μ⁻¹ · (χ_V/χ_W)~` with `c_φ(μ) = ∫ θ(g, 1; φ)μ(g) dg`: the lift is a theta value
  times a Hecke character, and its parameter at a split `w` is `c_w μ_w(ϖ_w)⁻¹`, as the formula says.
- `n = 0`: the lift is the character `h ↦ χ̃_V(det h)` (2.1, Check), which on `GL_d(E_w)` is `χ_{V,w} ∘ det` (for
  `det h = (t, t⁻¹)`, `χ̃_V(det h) = χ_V((t, 1)) = χ_{V,w}(t)`; `χ_V(det h)` would be `χ_{V,w}(t)²`), whose Satake parameter
  is `χ_{V,w}(ϖ_w)(q_w^{(d−1)/2}, …, q_w^{−(d−1)/2})`, the segment alone.
- `n = d`: no segment; the parameter is `c_w α⁻¹`. For the trivial representation of `U(V)` the parameter
  is stable under inversion, so only a nonself-dual `π` (the first Check) detects the inversion.

### 2.3 Inert unramified places

Let `n ≤ d`, and let `v` be a finite place of `F` inert in `E` with `E_v/F_v` unramified, odd residue
characteristic, `ψ_v`, `χ_{V,v}`, `χ_{W,v}` unramified, `V_v`, `W_v` containing self-dual lattices
with stabilisers `K_v`, `K′_v` (hyperspecial) and `φ_v` the lattice vector, and let `q_w = q_v²` be the
residue cardinality of `E_v`. Prove: the spherical Hecke algebras of
`U(V)(F_v)`, `U(W)(F_v)` are intertwined by the homomorphism of ThetaKernelsForUnitaryDualPairs §3.21a (inert
case), and an eigenform with base-change Satake parameter `α ∈ (ℂ^×)^n` (SmoothRepresentationsOfLocalGroups
§SR.4.4) lifts, when the lift is nonzero, to an eigenform (automatically `K′_v`-fixed) with parameter
`(c_v α⁻¹, χ_{V,v}(ϖ_v) q_w^{(d−n−1)/2 − i} : 0 ≤ i < d − n)`, `c_v = χ_{V,v}(ϖ_v)/χ_{W,v}(ϖ_v) = ±1`; the
multiset `α` is stable under inversion, so `c_v α⁻¹` may be written `c_v α`.

Route: as 2.2, with the inert case of ThetaKernelsForUnitaryDualPairs §3.21a. The lift of a `K_v`-fixed form by a `K_v × K′_v`-fixed
vector is `K′_v`-fixed (1.1). At an inert place `ϖ_v ∈ F_v`, so `χ_{V,v}(ϖ_v) = η_v(ϖ_v)^n = (−1)^n`; the
base-change parameter of an unramified representation of `U(V)(F_v)` is conjugate-self-dual, and
conjugation acts trivially on unramified parameters of `GL_n(E_v)`.

*Needs:* 1.1; ThetaKernelsForUnitaryDualPairs §3.21a; SmoothRepresentationsOfLocalGroups §SR.4.4.

**Checks.**

- `n = 0`, `d = 2`: `χ̃_V ∘ det` has base-change parameter `χ_{V,v}(ϖ_v)(q_w^{1/2}, q_w^{−1/2})`, that is
  `±(q_v, q_v⁻¹)`; reading `q` as `q_v` would halve the exponents.

### 2.4 Constituents of a lift

Let `π` be an irreducible automorphic representation of `U(V)` and `Π` an irreducible constituent of
`Θ_W(π)` (1.5). Prove:

- `Π_∞ ≅ ⊗_v σ_{Λ_v(λ_v)}` when `π_∞ ≅ ⊗_v σ_{λ_v}` (2.1).
- At every finite place `v`, `Π_v` is an irreducible quotient of `Θ(π_v^∨)` (MetaplecticAutomorphicForms
  §3.4), hence `Π_v ≅ θ(π_v^∨)`, which is irreducible by Howe duality (§3.7 at places not split in
  `E`, §3.14 at split places).
- Consequently all irreducible constituents of `Θ_W(π)` are isomorphic, and `Θ_W(π) ≅ Π^{⊕m}` with `m`
  finite.
- For `n ≤ d`: at split places where the data are unramified and `π_v` is unramified, `Π_v` is unramified with the
  Satake parameter of 2.2; likewise at the inert places of 2.3.
- *Weak base change* (`n ≤ d`). If `π` has a weak base change `BC(π)` to `GL_n(𝔸_E)`
  (EndoscopicTransferAndUnitaryTraceComparison §6.29), then `Π` has the weak base change
  `BC(π)^∨ ⊗ (χ_V/χ_W) ⊞ ⊞_{i=0}^{d−n−1} χ_V |·|_E^{(d−n−1)/2 − i}`, an isobaric sum with the
  segment of Hecke characters, in the sense of equality of Satake parameters at almost all split
  places; `BC(π)^∨ = BC(π)^c`.

Route: the projection of `θ_φ(F)` to `Π` defines a nonzero `U(V)(𝔸_f) × U(W)(𝔸_f)`-equivariant
map `ω ⊗ π → Π` factoring through `U(V)(𝔸_f)`-coinvariants (1.1, equivariance); at each finite `v`
this gives a nonzero element of `Hom_{U(V)×U(W)}(ω_v, π_v^∨ ⊗ Π_v)`, which is MetaplecticAutomorphicForms §3.4's description of
`Θ(π_v^∨)`. Since `θ(π_v^∨)` is irreducible, the irreducible quotient `Π_v` of `Θ(π_v^∨)` factors
through the maximal semisimple quotient (MetaplecticAutomorphicForms §3.5) and equals it. The archimedean factor is 2.1. Finiteness
of `m`: the `Π`-isotypic vectors of a fixed weight and level lie in a finite-dimensional space (1.5). The
Satake statements are 2.2–2.3, and the base change statement is a comparison of Satake parameters at
split places: `π_v^∨` has parameter `α_w⁻¹`.

*Needs:* 1.1, 1.5, 2.1–2.3; MetaplecticAutomorphicForms §§3.4, 3.5, 3.7, 3.14;
EndoscopicTransferAndUnitaryTraceComparison §6.29.

**Checks.**

- `n = d = 1`: `BC(μ) = μ̃` and the lift `μ⁻¹(χ_V/χ_W)~` of 2.2's Check has base change
  `μ̃⁻¹ · χ_V/χ_W = BC(μ)^∨ ⊗ χ_V/χ_W`; the weights at infinity agree with 2.1's Check.

### 2.5 The homomorphism pair in the dictionary

Let `X₁`, `X₂` be totally positive definite Hermitian spaces of dimensions `n ≤ d`, `δ′ ∈ E^×` with `δ̄′ = −δ′`, `Φ` the CM
type `{τ : Im τ(δ′) > 0}`, and `(V, W) = (X₁^*, δ′X₂)` the homomorphism pair of 0.1, on `Hom_E(X₁, X₂)` with
`(g, h)x = hxg⁻¹`, with splitting data `(χ_V, χ_W)`. For `τ ∈ Φ` write `m^Φ_{V,τ}`, `m^Φ_{W,τ}` for the infinity types read
through `τ` (`χ(z) = (τ(z)/|τ(z)|)^{m^Φ}`), and take `δ = δ′` in the Conventions. Prove:

- (a) *Embedding and sign.* At the real place below `τ ∈ Φ`, `τ_v = c ∘ τ`, `ε_v = −1`, `J_v = τ_v(i)`,
  `m_{V,v} = −m^Φ_{V,τ}`, `m_{W,v} = −m^Φ_{W,τ}`, `a_v = (d + m^Φ_{W,τ})/2` and `b_v = (n + m^Φ_{V,τ})/2`.
- (b) *Weights through `τ`.* The representation `σ_λ` of `U(V)` at `v` is the representation `V_λ` of `U(X₁)` through `τ`,
  and `σ_λ` of `U(W)` at `v` is `V_{λ^*}` of `U(X₂)` through `τ`. The polynomial Fock vectors of degree `k` at `v` decompose
  under `U(X₁)(F_v) × U(X₂)(F_v)` as `⊕_μ (V_{μ + a_v})^∨ ⊗ V_{(μ, 0^{d−n}) + b_v}` through `τ` ("dual of the first, tensor
  the second"), and the vacuum transforms by `det(g)^{−a_v} det(h)^{b_v}`. A form on `U(X₁)` of `K_∞`-type `V_λ` through
  `τ` lifts to zero unless `λ − a_v(1, …, 1)` is a partition `μ`, and then to forms on `U(X₂)` of type
  `V_{(μ, 0^{d−n}) + b_v}` through `τ`.
- (c) *Theta functions.* The CM type `Φ′` of 1.8 is `cΦ`. With `Θ := conj ∘ ϑ` (`ϑ` the Bargmann reading of 1.7–1.8) and `u`
  the coordinates holomorphic for `Φ` (complex conjugates of those of 1.7), `θ(g, h; B⁻¹P ⊗ φ_f) = (P(π⁻¹∂_u)Θ)(0)`,
  `P` read in `u` with the coefficients it has in the coordinates of 1.7; `Θ` is linear in `φ_f`, holomorphic for `Φ`,
  and for a lattice vector a section on the conjugate abelian variety with Riemann form `+Tr_{F/ℚ} ∘ B` and
  semicharacter `ᾱ`.
- (d) *Satake parameters.* At a place `w` split in `E` with `χ_{V,w}`, `χ_{W,w}` unramified (2.2, any `ψ_v`), a nonzero lift
  of an eigenform on `U(X₁)` with Satake parameter `α` (through `U(X₁)(F_v) ≅ GL_n(E_w)`) has parameter
  `(c_w α, χ_{V,w}(ϖ_w) q_w^{(d−n−1)/2 − i} : 0 ≤ i < d − n)`, `c_w = χ_{V,w}(ϖ_w)/χ_{W,w}(ϖ_w)`, with no inversion; at the
  inert places of 2.3 the parameter is `(c_v α, segment)`.
- (e) *Base change.* If an irreducible `π` of `U(X₁)` has a weak base change `BC(π)`, every constituent of its lift has
  the weak base change `BC(π) ⊗ (χ_V/χ_W) ⊞ ⊞_{i=0}^{d−n−1} χ_V |·|_E^{(d−n−1)/2 − i}`.
- (f) *Weil representation.* The Weil representation of the pair is `ω_{ψ, χ_V, χ_W}` of ThetaKernelsForUnitaryDualPairs
  §4.4a; it is the unique representation of `U(X₁)(𝔸) × U(X₂)(𝔸)` on Schwartz functions of a rational Lagrangian of
  `Hom_E(X₁, X₂)` with Heisenberg covariance for `(g, h)x = hxg⁻¹`, theta functional invariant under rational points,
  unitarity, continuity of the orbit maps `(g, h) ↦ ω(g, h)φ` into `L²` for the adelic topology of the group, and, at every
  split place, the law `r · χ̃_W(det g)⁻¹ χ̃_V(det h)`, `r > 0`, of the functional `φ ↦ φ(0)` of the type-II model, `det g`
  taken on `X₁` (§4.4a, characterisation, five properties); this is the law `r · χ̃_W(det g)χ̃_V(det h)` of §4.4a for
  the pair `(V, W)`, in which `det g` is the determinant of `g` acting on `V = X₁^*`, equal to `det(g)⁻¹`.
- (g) *The other sign.* With `δ = −δ′` in the Conventions instead, `τ_v ∈ Φ`, `W^♭ = X₂(−1)` is negative definite,
  `ε_v = +1`, `m_{V,v} = m^Φ_{V,τ}`, `m_{W,v} = m^Φ_{W,τ}`, `a_v` and `b_v` are the same, and the types are
  `σ_{μ+a_v} ⊗ σ_{(μ,0)+b_v}` on `U(V) × U(W)` read at `τ_v ∈ Φ`. This is the same statement as (a)–(f) (Conventions,
  change of `δ`).

Route: (a) `W^♭ = δ′⁻¹ · δ′h₂ = X₂` and `V` are positive, so `ε_v = −1` (Conventions); `τ_v(δ′⁻¹) ∈ iℝ_{>0}` means
`Im τ_v(δ′) < 0`, so `τ_v ∉ Φ`, and an infinity type read through `c ∘ τ` changes sign. (b) by 0.1 the matrix of `g` on
`V` is `ḡ`, and reading a matrix through `c ∘ τ` instead of `τ` conjugates it; on `U(V)` the two conjugations cancel, on
`U(W)` one remains, which turns `σ_λ` into `σ_{λ^*}`; then 2.1 for `ε_v = −1` (types
`σ_{(μ+a_v)^*} ⊗ σ_{((μ,0)+b_v)^*}`) and its weight map. (c) 1.8 with `Φ′ = {τ_v} = cΦ`, and the complex conjugate of
the identity of 1.7:
`conj((P^♮(π⁻¹∂_z)ϑ)(0)) = (P(π⁻¹∂_{z̄})ϑ̄)(0)`; conjugating the functional equation of 1.8 gives the Riemann form and the
semicharacter of `Θ` for the conjugate complex structure. (d) by 0.1 the form has parameter `α⁻¹` as a form on `U(V)`,
and 2.2 sends it to `(c_w(α⁻¹)⁻¹, segment)`; 2.3 likewise. (e) 2.4 with `BC` of the form on `U(V)` equal to `BC(π)^∨`. (f)
ThetaKernelsForUnitaryDualPairs §4.4a, whose last Check computes `det` on `X₁^*` as `det(g)⁻¹`. (g) the Conventions.

*Needs:* 0.1, 1.7, 1.8, 2.1, 2.2, 2.3, 2.4; ThetaKernelsForUnitaryDualPairs §4.4a.

**Checks.**

- `n = d = 1`: the lift of a character `μ` of `U(X₁) = E¹` is a multiple of `κ · μ · (χ_V/χ_W)~` (2.2, Check, applied to the
  character `μ ∘ conj = μ⁻¹` of `U(V)`), of parameter `c_w μ_w(ϖ_w)` at a split `w`, as (d) says; for the tensor pair
  `(X₁, δ′X₂)` it would be `c_w μ_w(ϖ_w)⁻¹`.
- Vacuum, `n = d = 1`, `k = 0`: the type `(V_{a_v})^∨ ⊗ V_{b_v}` is `g^{−a_v}h^{b_v}`; with `m^Φ_V = m^Φ_W = m` the lifted
  weight of a form of weight `λ` is `λ − a_v + b_v = λ`: equal characters give persistence of the weight.

### Examples

For `n = d = 1`, `U(V) = U(W) = E¹` acts on `V ⊗_E W = E` by the scalar `gh`, and the lift of a character `μ` of `E¹\𝔸_E¹` is a theta value times the Hecke character `κ · μ⁻¹ · (χ_V/χ_W)~`, of Satake parameter `c_w μ_w(ϖ_w)⁻¹` at a split place (2.2) and with base change `BC(μ)^∨ ⊗ χ_V/χ_W` (2.4); for the homomorphism pair the parameter is `c_w μ_w(ϖ_w)`, without inversion (2.5). At a real place with `n = d = 1`, a form of weight `w` that occurs lifts to weight `−w + (m_{V,v} − m_{W,v})/2` for either sign `ε_v` (2.1). For `n = 0` the lift is the character `χ̃_V ∘ det`, of Satake parameter `χ_{V,w}(ϖ_w)(q_w^{(d−1)/2}, …, q_w^{−(d−1)/2})` at a split place (2.2) and, for `d = 2` at an inert place, `±(q_v, q_v⁻¹)` (2.3).

### Dependencies

Layers 0 and 1; MetaplecticAutomorphicForms §§3.2a, 3.3, 3.4, 3.5, 3.7, 3.14; ThetaKernelsForUnitaryDualPairs §§3.21a, 3.46, 4.4a; AutomorphicFormsOnReductiveGroups §7.4; EndoscopicTransferAndUnitaryTraceComparison §6.29; SmoothRepresentationsOfLocalGroups §§SR.4.1–SR.4.4; TensorInductionAndFiniteGroupInputs §7.1.

## Layer 3: the Rallis inner product formula for a definite pair

### 3.1 The doubling seesaw for a definite pair

Let `V^□ = V ⊕ V(−1)`, with `ι : U(V) × U(V) → U(V^□)`. For a test vector `φ`, the theta integral of
the pair `(U(V^□), U(W))` against `φ ⊗ φ̄` (MetaplecticAutomorphicForms §6.10's doubling Schwartz
map) is a Siegel–Weil integral over the compact quotient `[U(W)]`. Prove:

- For `g₁, g₂ ∈ U(V)(𝔸)`, `∫_{[U(W)]} θ(g₁, h; φ) conj θ(g₂, h; φ) dh = χ_W(det g₂)⁻¹ · I^□(ι(g₁, g₂); δ(φ ⊗ φ̄))`, where `I^□(·; Φ) = ∫_{[U(W)]} θ^□(·, h; Φ) dh` is the theta integral of
  `(U(V^□), U(W))` for the Tamagawa measure.
- Since `W` is anisotropic, the Siegel–Weil formula holds for every `d`:
  `I^□ = ([E : F]/c) · E(·, s₀, Φ)` at `s₀ = (d − n)/2`, where `E` is the Siegel Eisenstein series of
  `U(V^□)` attached to the Siegel–Weil section `Φ` of `δ(φ ⊗ φ̄)`, holomorphic at `s₀`, and `c = 1` if
  `s₀ > 0`, `c = 2` if `s₀ ≤ 0` (MetaplecticAutomorphicForms §6.4: `E = c τ(H)/[E:F] · I` with
  `I = τ(H)⁻¹∫_{[H]}θ`). So the factor is `2` for `d > n` and `1` for `d ≤ n`.
- The restriction of `Φ_{s₀}` to `ι(g, 1)` is `⟨ω(g)φ, φ⟩` times the determinant twist of §6.10.

Route: the seesaw identity is the tensor identity `ω_{V^□, W}|_{U(V) × U(V)} = ω_{V,W} ⊗ ω̄_{V,W}`
of MetaplecticAutomorphicForms §6.10 (`doublingSchwartz_equivariant`) applied to the theta
functional; Siegel–Weil is §6.4 with `m = d`, the anisotropic case; the last item is
`doublingSchwartz_eval_zero` with equivariance.

*Needs:* 0.3, 0.4; MetaplecticAutomorphicForms §§6.1, 6.2, 6.4, 6.10, 6.15.

### 3.2 The Rallis inner product formula

Let `π` be an irreducible automorphic representation of `U(V)`, `S` a finite set of places containing
the archimedean places and the places where `E/F`, `ψ`, `χ_V`, `χ_W`, `π` or `φ` is ramified (for `φ`: where
`φ_v` is not the lattice vector of the trivial lift of `L_v ⊗ M_v` for self-dual `L_v`, `M_v`), and
`F_i = ⊗_v F_{i,v} ∈ π` (`i = 1, 2`) factorizable with `F_{i,v}` the normalised spherical vector for
`v ∉ S`, and `φ = ⊗_v φ_v` a factorizable test vector. Prove: for every `d ≥ 1`,

`⟨θ_φ F₁, θ_φ F₂⟩ = C · [ L^S(s + ½, π × χ_W) / d^S(s) · ∏_{v ∈ S} Z_v(s, Φ_v, F_{1,v}, F_{2,v}) ]_{s = s₀}`,

where the bracket is a meromorphic function holomorphic at `s₀ = (d − n)/2`, evaluated there, that is at
the point `(d − n + 1)/2` of `L^S`; `Z_v` are the local doubling zeta integrals of MetaplecticAutomorphicForms
§6.11 for the local sections `Φ_v` of `δ(φ_v ⊗ φ̄_v)`, computed with `⟨π_v(g)F_{1,v}, F_{2,v}⟩` (no complex
conjugation), the local inner products normalised so that `⟨F₁, F₂⟩ = ∏_v ⟨F_{1,v}, F_{2,v}⟩`; and
`C = [E : F]/c` (`2` for `d > n`, `1` for `d ≤ n`) for the Tamagawa Petersson products on both groups and Haar measures
`dg_v` on the `U(V)(F_v)` with `vol(K_v, dg_v) = 1` at every finite `v ∉ S` (`K_v` the stabiliser of `L_v`) whose product is
the Tamagawa measure (they exist: fix them at all places but one place of `S` and rescale there). For a sum of pure
tensors `φ` the left side is the corresponding sum over pairs of pure tensors, with the cross terms. Moreover:

- the left side vanishes when `F₁`, `F₂` lie in non-isomorphic irreducible summands;
- at `s₀`, whenever the local integral converges absolutely,
  `Z_v(s₀, Φ_v, F₁, F₂) = ∫_{U(V)(F_v)} ⟨ω_v(g)φ_v, φ_v⟩ ⟨π_v(g)F_{1,v}, F_{2,v}⟩ dg` up to the
  determinant twist of 3.1; at a real place the integral is over the compact group `U(n)`.

This is the definite instance of the anisotropic case of ThetaKernelsForUnitaryDualPairs §6.13a, translated
to the linear lift: for the conjugate-linear lift of MetaplecticAutomorphicForms §5.6 the same formula holds with `π^∨` in place of
`π`, `L^S(s + ½, π^∨ × χ_W) = L^S_E(s + ½, BC(π) ⊗ χ_W⁻¹)`, and the conjugate matrix coefficient.

Route (the doubling method): by Fubini the left side is
`∫∫_{[U(V)]²} F₁(g₁) conj F₂(g₂) ∫_{[U(W)]} θ(g₁, h) conj θ(g₂, h) dh`, which 3.1 turns into
`([E : F]/c)` times the integral of `E(ι(g₁, g₂), s, Φ)` against `F₁ ⊗ F̄₂` (with the twist) at `s = s₀`. For
`Re s` large this doubling integral unfolds (MetaplecticAutomorphicForms §6.12, basic identity) into the
standard doubling function of `π` and `χ_W` divided by `d^S(s)` times the product of local integrals over
`S`, using the unramified computation of MetaplecticAutomorphicForms §6.11 (`localDoublingZeta_unramified`, with its region
of absolute convergence at the inert and split places, ThetaKernelsForUnitaryDualPairs §6.11,
which for the unitary local components of `π` contains `Re s > (n − 2)/2` at every place outside `S`); by the
Conventions that function is `L^S(s + ½, π × χ_W)`. Both sides are meromorphic in `s`: the left side because the
integral over the compact `[U(V)]²` of a meromorphic family of continuous functions is meromorphic, and
holomorphic at `s₀` by 3.1. Uniqueness of continuation gives the identity at `s₀`. Orthogonality of
different summands follows from the factorisation through `⟨π(g)F₁, F₂⟩`.

*Needs:* 1.1, 3.1; MetaplecticAutomorphicForms §§6.1, 6.10, 6.10a, 6.11, 6.12; ThetaKernelsForUnitaryDualPairs §§6.11, 6.13a;
AutomorphicLFunctionsAndLocalFactorsPartII §3.4.

**Checks.**

- `n = 0`: `U(V)` is trivial, `[U(V)]` is a point of volume `1`, `θ_φ(1)(h) = χ̃_V(det h) φ(0)` (0.3), `s₀ = d/2 > 0`,
  `C = 2`, there is no `L`-function and both sides equal `|φ(0)|² vol([U(W)]) = 2|φ(0)|²`.
- `n = d = 1`: `π = μ` a character of `E¹`, `BC(π) = μ̃`, and the formula involves `L^S_E(½, μ̃ χ_W)`, the
  central value of the criterion for the linear lift of a character (Rogawski; Harris–Kudla–Sweet); for
  `μ^∨ = μ⁻¹` it would be `L^S_E(½, μ̃⁻¹χ_W)`, a different value unless `μ̃` is quadratic.
- In the range `n < d ≤ 2n` the formula is the instance of MetaplecticAutomorphicForms §6.13 with an
  anisotropic target for `F̄_i ∈ π^∨` (the first-occurrence hypothesis is empty because `W` is the bottom of
  its Witt tower), and `C = [E : F]` is §6.13's constant.

### 3.3 Absolute convergence and the Rallis operator

Prove:

- *Convergence.* `L^S(s + ½, π × χ_W)` converges absolutely for `Re s > n/2`, and `d^S(s)` is a convergent
  product of nonzero factors for `Re s > 0`.
- *Range.* For `d ≥ 2n + 1`, `s₀ > n/2`: the `L`-value in 3.2 is an absolutely convergent Euler
  product of nonzero factors, hence finite and nonzero, and `d^S(s₀)` is finite and nonzero. For
  `n < d ≤ 2n` it is the value of the meromorphic continuation, and for `d ≤ n` of the continuation
  of the whole bracket.
- *The Rallis operator.* Let `d ≥ 2n + 1`, `S` and `φ = ⊗_vφ_v` factorizable as in 3.2 (`φ_v` the lattice vector of
  `L_v ⊗ M_v` for `v ∉ S`), and `K = ∏_v K_v` with `K_v = Stab(L_v)` for every finite `v ∉ S` (enlarge `S` by the finite
  places where a given level differs from the stabiliser of the lattice; for a level that is not a product, pass to a
  product sublevel), `φ` fixed by `K × K′`. Then `θ_φ^* θ_φ` acts on the `π`-isotypic part of `𝒜(V; K)` as
  `C · L^S(s₀ + ½, π × χ_W)/d^S(s₀)` times the operator
  `⊗_{v ∈ S} π_v(Z_v)` on `⊗_{v ∈ S} π_v^{K_v}` (on the `K_∞`-type `σ_{λ_v}` at a real place `v`), where `π_v(Z_v)` is the
  endomorphism defined by the Hermitian form `Z_v(s₀, Φ_v, ·, ·)`. At a real place it is
  `f ↦ ∫_{U(n)} ⟨ω_v(g)φ_v, φ_v⟩π_v(g)f dg_v` (with the determinant twist of 3.1), positive semidefinite and in general not a
  scalar (Check). The average `∫_{K_∞} θ^*_{ω(k,1)φ}θ_{ω(k,1)φ} dk = ∫_{K_∞} R(k)θ_φ^*θ_φR(k)⁻¹ dk` (1.1, equivariance)
  has the same form with `π_v(Z_v)` replaced, at every real place, by the scalar `(dim σ_{λ_v})⁻¹ tr π_v(Z_v)`; when
  every `π_v^{K_v}`, `v ∈ S` finite, is one-dimensional, this average is a scalar on the `π`-isotypic part (the *Rallis
  eigenvalue*), and so is `θ_φ^* θ_φ` itself when moreover every real `π_v(Z_v)` is a scalar. For a level `K` smaller than
  `Stab(L_v)` at some finite `v ∉ S`, `θ_φ = θ_φ ∘ e` with `e` the projection onto the vectors fixed by `∏_{v ∉ S} Stab(L_v)`
  (1.1, equivariance, `φ_v` being fixed by `Stab(L_v)`); the formula holds on the image of `e`, and `θ_φ^* θ_φ` is zero on
  its kernel.

Route: the local components of `π` are unitary, so by LocalFactorsOfTwistsAndTypes §7.2
`|α_{w,i}(π)| ≤ q_w^{(n−1)/2}` at every `w ∤ S`, `q_w` the residue cardinality of `E_w` (§7.2 (i) at the split places,
§7.2 (ii) at the inert places); the Euler factor
`det(1 − α_w χ_{W,w}(ϖ_w)q_w^{−s−1/2})⁻¹` then converges absolutely for `Re s + ½ > (n − 1)/2 + 1`, and the
product over the places of `E` converges by AutomorphicLFunctionsAndLocalFactors AL.4.1.2. The convergence of
`d^S` is that of a finite product of shifted Hecke `L`-functions on their half-planes of absolute
convergence (MetaplecticAutomorphicForms §6.10a). The operator statement is 3.2 read as an identity of
Hermitian forms on `π^K`, with 1.4: for `v ∉ S` the vectors of `π_v` fixed by `K_v = Stab(L_v)` form the line of the
normalised spherical vector, which is the vector 3.2 needs there; the average over `K_∞` is Schur's lemma for the
irreducible `σ_{λ_v}`.

*Needs:* 3.2, 1.4; LocalFactorsOfTwistsAndTypes §§3.4, 7.2; AutomorphicLFunctionsAndLocalFactors AL.4.1.2;
MetaplecticAutomorphicForms §6.10a.

**Checks.**

- For the trivial representation of `GL_n(E_w)` the bound is attained: its parameter is
  `(q_w^{(n−1)/2}, …, q_w^{−(n−1)/2})`. With `L(s + ½, 1 × χ)` this gives the factors
  `L_w(s + n/2 − i, χ)`, `0 ≤ i < n`; each local factor converges for `Re s > (n − 2)/2`, and the product over `w` converges
  absolutely exactly for `Re s > n/2`.
- At `d = 2n` and `π` trivial, `s₀ = n/2`: the factor `L(1, χ_W)` appears, which is finite and nonzero
  for `χ_W ≠ 1` (LFunctions Layer 7) and has a pole for `χ_W = 1`.
- The real factor need not be a scalar: for `φ_v = B⁻¹P` with `P = ι_ℱ(v ⊗ w)` a pure tensor in the `σ_{λ_v}^∨ ⊗ σ′`-part
  (1.2), `⟨ω_v(g)φ_v, φ_v⟩ = ‖w‖²⟨σ_{λ_v}^∨(g)v, v⟩` on `U(n)`, and by Schur orthogonality `π_v(Z_v)` is a positive
  multiple of the orthogonal projection onto the line of `σ_{λ_v}` paired with `v`: of rank one, so for
  `dim σ_{λ_v} > 1` it is not a scalar and `θ_φ` is not injective on the `π`-isotypic part.

### 3.4 Injectivity

Prove: in the setting of 3.3 (`K_v = Stab(L_v)` for the finite `v ∉ S`), if the Rallis
operator is invertible on the `π`-isotypic part of `𝒜(V; K)`, then `θ_φ` is injective there. In particular, for
`d ≥ 2n + 1`, `θ_φ` is injective on the `π`-isotypic part whenever every local Hermitian form `Z_v(s₀, Φ_v, ·, ·)`, `v ∈ S`,
is positive definite on `π_v^{K_v}` (on `σ_{λ_v}` at the real places). For a level `K` smaller than `Stab(L_v)` at some
finite `v ∉ S`, the same hypotheses make `θ_φ` injective on the part of the `π`-isotypic space fixed by
`∏_{v ∉ S} Stab(L_v)`, and `θ_φ` vanishes on the orthogonal complement of that part.

Route: `‖θ_φ F‖² = ⟨θ_φ^* θ_φ F, F⟩`; for a smaller level, 3.3 (`θ_φ = θ_φ ∘ e`, `e` an orthogonal projection).

**Checks.**

- The level outside `S` matters: at a split place `v ∉ S` with `n = 2` (`U(V)(F_v) ≅ GL_2(E_w)`), an unramified
  principal series `π_v` has a two-dimensional space of Iwahori-fixed vectors and a line of `GL_2(O_w)`-fixed vectors;
  with the Iwahori subgroup as `K_v`, `θ_φ` kills the Iwahori-fixed vectors orthogonal to that line, whatever the
  factors at `S`.

*Needs:* 3.3.

### Examples

For `n = 0` both sides of the Rallis inner product formula equal `|φ(0)|² vol([U(W)]) = 2|φ(0)|²`; for `n = d = 1` and a character `μ` of `E¹` it involves the central value `L^S_E(½, μ̃χ_W)` (3.2). For the trivial representation of `GL_n(E_w)` the Satake bound is attained, each local factor `L_w(s + n/2 − i, χ)` converges for `Re s > (n − 2)/2`, and their product over `w` converges absolutely exactly for `Re s > n/2`; at `d = 2n` and `π` trivial the factor `L(1, χ_W)` appears, finite and nonzero for `χ_W ≠ 1` (3.3). At a split place outside `S` with `n = 2` and the Iwahori subgroup as level, `θ_φ` kills the Iwahori-fixed vectors of an unramified principal series that are orthogonal to its spherical line (3.4).

### Dependencies

Layers 0 and 1; MetaplecticAutomorphicForms §§5.6, 6.1, 6.2, 6.4, 6.10, 6.10a, 6.11, 6.12, 6.15; ThetaKernelsForUnitaryDualPairs §§6.11, 6.13a; AutomorphicLFunctionsAndLocalFactorsPartII §3.4; LocalFactorsOfTwistsAndTypes §§3.4, 7.2; AutomorphicLFunctionsAndLocalFactors AL.4.1.2.

## Layer 4: nonvanishing and existence of lifts in large dimension

### 4.1 Local factors at the bad places

Prove: in the setting of 3.2 with `d ≥ 2n + 1`,

- at a real place `v`, `Z_v(s₀, Φ_v, F, F) = vol(U(V)(F_v), dg_v)·‖pr(φ_v ⊗ F_v)‖²`, where `F_v ∈ σ_{λ_v}` and `pr` is the
  orthogonal projection to the `U(n)`-invariants of `ω_v ⊗ σ_{λ_v}` (the integral of
  `⟨(ω_v ⊗ σ_{λ_v})(k)(φ_v ⊗ F_v), φ_v ⊗ F_v⟩` for the probability measure `dk`), so it is nonzero for suitable `φ_v`
  exactly when `σ_{λ_v}^∨` occurs in `ω_v`, that is,
  when `λ_v` occurs (2.1);
- at every finite place `v` (more generally, for any `d`, at a split place when `d ≥ n`, or where `W_v` has Witt index
  at least `n`), and every open subgroup `U ⊂ U(V)(F_v)` (inside the kernel of the determinant twist of 3.1), there are
  an open subgroup `H_v ⊂ U` and a nonzero `φ_v` whose matrix coefficient `⟨ω_v(g)φ_v, φ_v⟩` is nonnegative, supported in `U`
  and equal to `‖φ_v‖²` on `H_v`; then for every `F_v ∈ π_v` fixed by `U`, `Z_v(s₀, Φ_v, F_v, F_v) = c · ‖F_v‖²` with
  `c = ∫_U ⟨ω_v(g)φ_v, φ_v⟩ dg ≥ ‖φ_v‖² vol(H_v) > 0`; in particular it is nonzero for `F_v ≠ 0`.

Route: at a real place, `⟨ω_v(k)φ_v, φ_v⟩⟨σ_{λ_v}(k)F_v, F_v⟩` is the matrix coefficient of `φ_v ⊗ F_v` in
`ω_v ⊗ σ_{λ_v}`, whose average over `U(n)` is `‖pr(φ_v ⊗ F_v)‖²`, and `(ω_v ⊗ σ_{λ_v})^{U(n)} ≠ 0` exactly when
`σ_{λ_v}^∨ ⊂ ω_v` (Schur orthogonality, CompactGroups §4.1); the linear lift pairs `F ∈ σ_{λ_v}`
with the Fock type `σ_{λ_v}^∨` (1.1), and the
projection to the invariants of `ω_v ⊗ σ_{λ_v}^∨` would test the occurrence of `σ_{λ_v}` instead, a different condition for
non-self-dual `σ_{λ_v}`. At a finite place, the Witt index is at least `n` by 0.1, and
ThetaKernelsForUnitaryDualPairs §3.9a(iii) gives bump vectors (in a mixed model attached to an
`n`-dimensional isotropic subspace of `W_v`, or in the type-II model at split places); the integral is over
a compact set and needs no convergence hypothesis.

*Needs:* 0.1, 2.1, 3.2; ThetaKernelsForUnitaryDualPairs §3.9a; CompactGroups §4.1.

### 4.2 Nonvanishing criterion

Prove: let `π` be an irreducible automorphic representation of
`U(V)` with `π_∞ ≅ ⊗_v σ_{λ_v}`, and suppose `d ≥ 2n + 1`. Then `Θ_W(π) ≠ 0` if and only if `λ_v` occurs (2.1) at every
real place `v`.

Route: if some `λ_v` does not occur, every lift vanishes by 2.1. Conversely choose `S`, a test vector
`φ` and `F ∈ π` as in 3.2 with `φ_v` from 4.1 at the places of `S`: by 3.3 the `L`-value and
`d^S(s₀)` are finite and nonzero, and by 4.1 every local factor in `S` is nonzero, so
`‖θ_φ F‖² ≠ 0` by 3.2.

*Needs:* 2.1, 3.2, 3.3, 4.1.

**Checks.**

- `n = 0`: the criterion says the oscillator line of `U(W)` is nonzero, which it is.
- For `π` the trivial representation and `n ≥ 1` the occurrence condition is `ε_v m_{W,v} ≤ −d`, that is
  `sgn(V_v)sgn(W^♭_v)·m_{W,v} ≥ d`, at every real place (2.1, Check); for `n = 0` there is no condition.

### 4.3 Existence of lifts with prescribed local components

Prove: under the hypotheses of 4.2 with `λ_v` occurring at every real place,
there is an irreducible automorphic representation `Π` of `U(W)`, occurring in
`𝒜_{Λ(λ)}(W; K′)` for the level `K′` of a test vector, such that `Π_∞ ≅ ⊗_v σ_{Λ_v(λ_v)}`,
`Π_v ≅ θ(π_v^∨)` at every finite place, `Π_v` has the Satake parameters of 2.2 at split places where
`π_v` and the data are unramified and those of 2.3 at the inert places of 2.3, and, if `π` has a
weak base change `BC(π)`, `Π` has the weak base change `BC(π)^∨ ⊗ (χ_V/χ_W) ⊞ (segment)` of 2.4. Every
irreducible constituent of `Θ_W(π)` is isomorphic to `Π`.

Route: 4.2 gives `Θ_W(π) ≠ 0`; 1.5 decomposes it into irreducibles; 2.4 identifies each.

*Needs:* 1.5, 2.4, 4.2.

### Examples

For `n = 0` the criterion of 4.2 says that the oscillator line of `U(W)` is nonzero, which it is; for the trivial representation and `n ≥ 1` the occurrence condition at every real place is `sgn(V_v)sgn(W^♭_v)·m_{W,v} ≥ d` (4.2).

### Dependencies

Layers 0–3; ThetaKernelsForUnitaryDualPairs §3.9a; CompactGroups §4.1.

## Layer 5: the lift of the trivial representation

### 5.1 The theta integral of a definite pair

For a test vector `φ`, a finite sum of `φ_∞ ⊗ φ_f` with `φ_∞` in the `K_∞`-invariant part of the Fock space, define
the *theta integral* `I_V(φ) = θ_φ(1)`, `I_V(φ)(h) = ∫_{[U(V)]} θ(g, h; φ) dg`. Prove:

- `I_V(φ)(h) = vol(K_∞K) Σ_c |Γ_c|⁻¹ θ(t_c, h; φ)` when `φ` is fixed by `K_∞ K` (1.2).
- For `n ≥ 1`, `I_V(φ) ≠ 0` for some `φ` requires `ε_v m_{W,v} ≤ −d` (that is `sgn(V_v)sgn(W^♭_v)·m_{W,v} ≥ d`) at every
  real place (2.1; and `a_v = 0` when `n > d`); then `I_V(φ)` lies in `𝒜_{Λ(0)}(W; K′)`, with
  `Λ_v(0) = ι_{ε_v}((b_v − a_v)^n ⊕ b_v^{d−n})` for `n ≤ d`. For `n = 0`, `I_V(φ)(h) = χ̃_V(det h)φ(0)` (`[U(V)]` a point of
  volume `1`), with no condition at the real places.
- *Lattice form.* For `(Â, q)` and `K_L × K′_M` as in 1.3, `φ_∞` the `K_∞`-invariant vector and
  `φ_f = φ_Â`: `I_V(φ)(t′) = vol(K_∞K_L) Σ_{[L′]} |U(L′)|⁻¹ θ(t_{L′}, t′; φ)`, the mass-weighted average
  over the genus of `L` of the kernels of 1.3.
- For `n ≤ d`, its Hecke eigenvalues at split unramified places are those of 2.2 for the parameter of the trivial
  representation of `GL_n(E_w)`.

*Needs:* 1.2, 1.3, 2.1, 2.2.

### 5.2 Its norm

Let `S` be as in 3.2 and `S_0 ⊂ S` the set of archimedean places and of the places where `χ_W` is
ramified. Prove: in the setting of 3.2 with `π` trivial,

`‖I_V(φ)‖² = C · [ ∏_{i=0}^{n−1} L^S_E(s + n/2 − i, χ_W) / d^S(s) · ∏_{v ∈ S} Z_v(s, Φ_v, 1, 1) ]_{s=s₀}`
`= C · [ ∏_{i=0}^{n−1} L_E^{S_0}(s + n/2 − i, χ_W) / d^S(s) · ∏_{v ∈ S_0} Z_v(s, Φ_v, 1, 1) · ∏_{v ∈ S ∖ S_0} Z_v^*(s, Φ_v, 1, 1) ]_{s=s₀}`,

where `Z_v^* = Z_v / ∏_{i=0}^{n−1} L_v(s + n/2 − i, χ_W)` is the normalised local integral of
MetaplecticAutomorphicForms §6.11; `L_E^{S_0}(·, χ_W)` is the finite part of the Hecke `L`-function of
`χ_W` (all its Euler factors). At `s₀` the global factor is `∏_{i=0}^{n−1} L_E(d/2 − i, χ_W)/d^S(s₀)`. At a
finite place `v ∉ S`, the local integral of the spherical section against the trivial representation is
`∏_{i=0}^{n−1} L_v(s + n/2 − i, χ_W)/d_v(s)`.

Route: 3.2 with the factorisation of the standard `L`-function of a one-dimensional representation,
LocalFactorsOfTwistsAndTypes §7.1; the second form moves the Euler factors at
`v ∈ S ∖ S_0` into the local integrals.

*Needs:* 3.2, 5.1; LocalFactorsOfTwistsAndTypes §7.1; MetaplecticAutomorphicForms §6.11.

**Checks.**

- `n = 1`, `d = 2`: the global factor is `L_E(1, χ_W)/d^S(½)`, finite and nonzero for `χ_W ≠ 1`.
- `n = 1`, `d = 3`: `L_E(3/2, χ_W)`, in the region of absolute convergence.
- `n = 2`, `d = 3`: the factors are `L_E(3/2, χ_W) L_E(½, χ_W)`; the central value
  `L(½, χ_W)` can vanish, and then `I_V = 0`.
- At `s₀ + n/2 − i = 0` (possible for `d ≤ 2n − 2`) the partial value `L^S_E(0, χ_W)` vanishes when `S`
  contains a place `w` with `χ_{W,w}` unramified and `χ_{W,w}(ϖ_w) = 1`. For the lattice vector at that place `Z_v` has the
  compensating pole, and the second form has neither. For other data at that place there need be no compensation: for a
  bump vector of 4.1 at a split place the integrand of `Z_v` has compact support in `g` for every `s`, so `Z_v` is entire,
  and `Z_v^*` vanishes at `s₀`.

### 5.3 Nonvanishing

Prove: suppose `d > n`, `ε_v m_{W,v} ≤ −d` at every real place, the values
`L_E(d/2 − i, χ_W)`, `0 ≤ i < n`, are finite and nonzero, at every finite `v ∈ S_0` the local integral
`Z_v(s₀, Φ_v, 1, 1)` is holomorphic and nonzero for some `φ_v`, and at every `v ∈ S ∖ S_0` the normalised
integral `Z_v^*(s₀, Φ_v, 1, 1)` is holomorphic and nonzero for some `φ_v`. Then `I_V(φ) ≠ 0` for some test
vector `φ`. The local hypotheses hold:

- at `v ∈ S ∖ S_0` where `E_v/F_v` is unramified or split, the residue characteristic is odd or `v` splits,
  and `V_v`, `W_v` contain lattices `L_v`, `M_v` with `L_v ⊗ M_v` self-dual for `ψ_v ∘ B`: for the Haar measure `dg_v` with
  `vol(Stab(L_v), dg_v) = 1`, the lattice vector of norm one (so that the section has value `1` at the identity) and
  `⟨1, 1⟩_v = 1`, the lattice vector gives `Z_v^* = d_v(s₀)⁻¹`; for another Haar measure
  `Z_v^* = vol(Stab(L_v), dg_v) · d_v(s₀)⁻¹`; in both cases it is nonzero (MetaplecticAutomorphicForms §6.11 and ThetaKernelsForUnitaryDualPairs §6.11, after the change of character of
  MetaplecticAutomorphicForms §2.7, `ψ_v = ψ^0_v(c ·)` with `ψ^0_v` of conductor `O_v`);
- at split places and at places where `W_v` has Witt index at least `n` (all finite places when
  `d ≥ 2n + 1`, by 0.1): the bump vectors of 4.1 give `Z_v` finite and nonzero, hence `Z_v^*` finite and
  nonzero whenever `∏_i L_v(d/2 − i, χ_W)` is finite, which fails only if `d` is even, `d ≤ 2n − 2` and
  `χ_{W,w}(ϖ_w) = 1` for some `w | v`.

Corollaries:

- If `d ≥ 2n + 1`, all `L`-values are in the region of absolute convergence and the local hypotheses
  hold at every place (4.1).
- If `d` is even and `|m_{W,v}| ≥ d` at every real place, the arguments `d/2 − i` are integers
  `k ≥ d/2 − n + 1 > −|m_{W,v}|/2`, and every `L_E(k, χ_W)` is finite and nonzero: for `k ≥ 1` by the Euler
  product and nonvanishing on `Re s = 1`, for `k ≤ 0` by the functional equation, whose archimedean
  factors `Γ_ℂ(s + |m_{W,v}|/2)` have no pole at `k`.

Route: 5.2 in its second form; choose `φ_∞` with nonzero archimedean factor (4.1, the trivial
`K_∞`-type), local vectors at `S` with nonzero factors, and evaluate. The corollaries use
AnalyticNumberTheoryPartI §2.3a (continuation and functional equation of Hecke `L`-functions) and
LFunctions Layer 7 (nonvanishing on `Re s = 1`).

*Needs:* 0.1, 4.1, 5.2; MetaplecticAutomorphicForms §§2.7, 6.11; ThetaKernelsForUnitaryDualPairs §6.11; AnalyticNumberTheoryPartI §2.3a;
LFunctions Layer 7.

### 5.4 Genus theta series as theta integrals

Let `V` be totally positive definite of dimension `n ≥ 1`, `L ⊂ V` an `O_E`-lattice, `1 ≤ k`, and `W_k` the split
skew-Hermitian space of dimension `2k` with a basis `y_1, …, y_k, y^*_1, …, y^*_k` such that the `y_i` span an isotropic
subspace `Y`, the `y^*_j` an isotropic subspace `Y^*`, and `⟨y_i, y^*_j⟩_{W_k} = δ_{ij}`; so `U(W_k)(F_v) ≅ U(k, k)` at each
real place. For `A ∈ GL_k` and Hermitian `B`, `C` (over `E` or its completions) let `m(A)`, `n(B)`, `n^−(C)` be the
isometries of `W_k` with `m(A)y_j = Σ_i (A⁻¹)_{ji} y_i`, `m(A)y^*_j = Σ_i Ā_{ij} y^*_i`; `n(B)y_j = y_j − Σ_i B_{ji} y^*_i`,
`n(B)y^*_j = y^*_j`; `n^−(C)y_j = y_j`, `n^−(C)y^*_j = y^*_j + Σ_i C_{ji} y_i`. The `m(A)n(B)` form the Siegel parabolic
subgroup `P`, the stabiliser of `Y^*`. Take splitting data `(χ_V, χ_{W_k})` with `χ_{W_k} = 1` (allowed, `η^{2k} = 1`)
and any `χ_V` with `χ_V|_{𝔸_F^×} = η^n`, of infinity types `m_{V,v} ≡ n (mod 2)`. Realise `ω = ω_{ψ, χ_V, 1}` on
`S(V(𝔸)^k)`, `x = (x_1, …, x_k) ↔ Σ_j x_j ⊗ y_j` (the Schrödinger model of the polarisation `(V ⊗ Y) ⊕ (V ⊗ Y^*)`),
and let `T_x = (⟨x_i, x_j⟩)_{i,j}` be the Gram matrix (HermitianFormsAndLattices, Conventions) and `xA` the tuple with
entries `Σ_i x_i A_{ij}`. By the normalisation of ThetaKernelsForUnitaryDualPairs §3.3b (left-action form) on a Siegel
parabolic subgroup (the character `χ_V(det(m(A)|_Y)) = χ_V(det A)⁻¹` on the Levi, which is `χ̃_V(det m(A))` when `n` is
even), and since `U(V)` acts by substitution when `χ_{W_k} = 1`:

`ω(h)φ(x) = φ(h⁻¹x)` (`h ∈ U(V)(𝔸)`),  `ω(m(A))φ(x) = χ_V(det A)⁻¹ |det A|_E^{n/2} φ(xA)`,  `ω(n(B))φ(x) = ψ(tr(B T_x))φ(x)`.

Put `φ_L = ⊗_{v|∞}φ_v^0 ⊗ 1_{L̂^k}` with `φ_v^0(x) = e^{−2π tr τ_v(T_x)}` the Gaussian, and `θ_L(g) = θ(g, 1; φ_L)`
(MetaplecticAutomorphicForms §5.1). Prove:

- (a) *Adelic realisation.* `θ_L` is an automorphic form on `U(W_k)(𝔸)`; `θ(g, h; φ_L) = θ_{hL}(g)` for
  `h ∈ U(V)(𝔸_f)` (this uses `χ_{W_k} = 1`). At the real places, for `g = n(B)m(A)` with `Z_v = B_v + iA_vA_v^*`,
  `θ_L(g_∞) = ∏_v χ_{V,v}(det A_v)⁻¹·det(A_vA_v^*)^{n/2} · θ_L^{(k)}(Z)`, with `θ_L^{(k)}` the Hermitian theta series of
  HermitianFormsAndLattices §7.1 for the CM type `{τ_v}`. The stabiliser of `Z = i·1` in `U(k, k)` is
  `U(W₊) × U(W₋)`, where `W₊` (spanned by the `y_j − iy^*_j`) and `W₋` (spanned by the `y_j + iy^*_j`) are the positive
  and negative parts of `W_k^♭` there; it acts on `θ_L` on the right through the character
  `(k₊, k₋) ↦ det(k₊)^{(m_{V,v} − n)/2} det(k₋)^{(m_{V,v} + n)/2}` (the type of the Gaussian). By the Iwasawa decomposition
  `U(k, k) = P(ℝ)·(U(W₊) × U(W₋))` these two statements determine `θ_L` on `U(W_k)(F ⊗ ℝ)` from `θ_L^{(k)}`; they agree
  on `m(A)` with `A` unitary, which acts on `W₊` and on `W₋` by `Ā` in the bases above, both giving
  `χ_{V,v}(det A)⁻¹ = det(Ā)^{m_{V,v}}`. The level: `θ_L` is right invariant under the open compact subgroup
  `K_L^{(k)} ⊂ U(W_k)(𝔸_f)` fixing `1_{L̂^k}`, which contains `m(A)` for `A ∈ GL_k(Ô_E)` with `χ_V(det A) = 1`, `n(B)` for
  `B ∈ Herm_k(𝔸_{E,f})` with `ψ_f(tr(B T_X)) = 1` for all `X ∈ L̂^k`, and `n^−(C)` for `C` with `ψ_f(tr(C T_X)) = 1` for all
  `X ∈ (L̂^#)^k`, where `L^# = 𝔇_{E/ℚ}⁻¹L^∨` is the dual of `L` for `Tr_{E/ℚ} ∘ h` (HermitianFormsAndLattices §7.1(d)).
- (b) *Genus average.* The mean of `h ↦ θ(g, h; φ_L)` over `[U(V)]` for the invariant probability measure equals
  `Θ_gen(L)(g) := mass(L)⁻¹ Σ_{[M]} θ_M(g)/|U(M)|`, the sum over the classes in the genus of `L` (5.1, lattice form). For the
  Tamagawa measure this mean is `τ(U(V))⁻¹ ∫_{[U(V)]} θ(g, h; φ_L) dh`, with `τ(U(V)) = vol(K_∞K_L) · mass(L) = 2`
  (HermitianFormsAndLattices §6.0b).
- (c) *Siegel–Weil.* `E(g, s₀, Φ_{φ_L}) = c · Θ_gen(L)(g)` with `s₀ = (n − k)/2`, `Φ_{φ_L}` the Siegel–Weil
  section of MetaplecticAutomorphicForms §6.2, `c = 1` for `n > k` and `c = 2` for `n ≤ k` (§6.4 with
  `τ(U(V)) = 2`, `[E : F] = 2`). For `1 ≤ k ≤ n − 1` and `T` totally positive definite, the `T`-th Fourier
  coefficient of `E(·, s₀, Φ_{φ_L})` is `α_∞(L, T) ∏_v α_v(L, T)` (HermitianFormsAndLattices §7.2).

For an indefinite `V` the corresponding identity of the theta integral of any Schwartz–Bruhat function with a Siegel
Eisenstein series, and its Fourier coefficients, are the corollary of ThetaKernelsForUnitaryDualPairs §6.4a.

Route: (a) from the three formulas: on `P(ℝ)`, `φ^0(xA) = e^{−2π tr(T_x AA^*)}` (since `T_{xA} = A^*T_xA`), so
`Σ_x ω(n(B)m(A))φ^0(x) = χ_V(det A)⁻¹det(AA^*)^{n/2} Σ_x e(tr τ(T_x)Z)`; `ω(h)1_{L̂^k} = 1_{hL̂^k}` because `U(V)` acts
without character; the `K`-type: the Gaussian is the vacuum for the positive complex structure attached to `Z = i·1`,
`W_k ⊗ V = (V ⊗ W₊) ⊕ (V ⊗ W₋)`, and the vacuum is the tensor product of those of the definite pairs `(V, W₊)` (`ε = −1`)
and `(V, W₋)` (`ε = +1`), on which ThetaKernelsForUnitaryDualPairs §3.46(iii) (degree `0`) gives `det^{(m_{V,v} − n)/2}` and
`det^{(m_{V,v} + n)/2}`; the level from the three families of generators, the Weyl element `y_j ↦ y^*_j`, `y^*_j ↦ −y_j`
acting by the Fourier transform for `ψ_f(Tr_{E/F} Σ_j ⟨x′_j, x_j⟩)`, for which the dual of `L̂` is `L̂^#` because the
conductor of `ψ_f` is the inverse different of `F` (the largest fractional ideal on which it is trivial). (b) the
class-set formula (1.2, 5.1) and the volume statement of
DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a. (c) MetaplecticAutomorphicForms §6.4 and (b); the Fourier coefficients from
HermitianFormsAndLattices §7.2 with (b).

*Needs:* 1.2, 5.1; MetaplecticAutomorphicForms §§3.3, 3.3b, 5.1, 6.1, 6.2, 6.4; ThetaKernelsForUnitaryDualPairs §§3.3b, 3.46, 4.4a;
DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; HermitianFormsAndLattices §§5.1, 5.5, 6.0b, 7.1, 7.2.

**Checks.**

- `E = ℚ(√−3)`, `L = O_E²` (one class, `|U(L)| = 72`), `k = 1`: `Θ_gen(L) = θ_L`, and the coefficient of `e(z)`
  in the Eisenstein series is `r(L, 1) = 12` (HermitianFormsAndLattices §7.2, Check).
- *The sign.* `n = k = 1`, `L = O_E`: `θ_L^{(1)}(z) = Σ_{x ∈ O_E} e(N(x)z)` is a holomorphic modular form of weight `1`, and
  the type `k₊^{(m_{V,v} − 1)/2}k₋^{(m_{V,v} + 1)/2} = det^{(m_{V,v} + 1)/2}k₊^{−1}` is the holomorphic weight `1` (the
  factor of automorphy restricts to `k₊` on the stabiliser) twisted by a power of `det`. The mirror type
  `k₊^{(m_{V,v} + 1)/2}k₋^{(m_{V,v} − 1)/2}` would be antiholomorphic (ThetaKernelsForUnitaryDualPairs §3.46, Check).
- For `n` odd, `χ_V ≠ 1` and every `m_{V,v}` is odd (0.2): the weight `(m_{V,v} − n)/2` on the first factor is an
  integer, while `−n/2` alone would not be; the twist by `χ_V` cannot be dropped.
- With `χ_{W_k} ≠ 1` the identity `θ(g, h; φ_L) = θ_{hL}(g)` acquires the factor `χ̃_{W_k}(det h)`.
- For `F ≠ ℚ` the dual of `L` for `Tr_{E/F} ∘ h` is `𝔇_F L^# ⊂ L^#`, strictly smaller at the places dividing the different
  of `F` (for a unimodular split lattice at a place of different exponent one, the two duals are `𝒪` and `ϖ⁻¹𝒪` in each
  coordinate); the Fourier transform for `ψ_f` sees `L^#`.
- `n = 0` is excluded: there is one lattice, with trivial stabiliser, the mass is `1` and `[U(V)]` is a point of volume `1`,
  so `vol(K_∞K_L) · mass(L) = 1`, not `2`, and the constant `c` of (c) is not that of a space of positive dimension; (c) is
  a statement for spaces of positive dimension on both sides (`n ≥ 1`, `k ≥ 1`).

### Examples

For `n = 1` the global factor of `‖I_V(φ)‖²` is `L_E(1, χ_W)/d^S(½)` when `d = 2`, finite and nonzero for `χ_W ≠ 1`, and involves `L_E(3/2, χ_W)` when `d = 3`; for `n = 2` and `d = 3` the factors are `L_E(3/2, χ_W) L_E(½, χ_W)`, and `I_V = 0` when the central value vanishes (5.2). Over `E = ℚ(√−3)` the lattice `L = O_E²` has one class and `|U(L)| = 72`, and for `k = 1` the coefficient of `e(z)` in the Eisenstein series is `r(L, 1) = 12`; for `n = k = 1` and `L = O_E` the theta series `Σ_{x ∈ O_E} e(N(x)z)` is a holomorphic modular form of weight `1` (5.4).

### Dependencies

Layers 0–4; MetaplecticAutomorphicForms §§2.7, 3.3, 3.3b, 5.1, 6.1, 6.2, 6.4, 6.11; ThetaKernelsForUnitaryDualPairs §§3.3b, 3.46, 4.4a, 6.11; LocalFactorsOfTwistsAndTypes §7.1; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; HermitianFormsAndLattices §§5.1, 5.5, 6.0b, 7.1, 7.2; AnalyticNumberTheoryPartI §2.3a; LFunctions Layer 7.

## Layer 6: complementary spaces

Throughout this layer `V` is Hermitian of dimension `a`, `V′` Hermitian of dimension `a′ < a`, and
`W` skew-Hermitian of dimension `N = a + a′`, over a CM extension `E/F`; the groups need not be
compact at infinity; under the hypotheses of 6.11 `W` is not split (6.1, Check), while in a general complementary triple it
can be (`V` the sum of two hyperbolic planes and `V′` one: `W^♭` is the sum of three). Write `ε₀ = (a − a′)/2`. The
local theory of complementary data (local matching and irreducibility at split places, local matching at inert and
real places, three lemmas at a split place, local multiplicity bounds along an isotropic line), the
convergence and archimedean vanishing of theta integrals, their constant terms along an isotropic line with the cone
maps, and the archimedean cone lemma are ThetaKernelsForUnitaryDualPairs §§3.47–3.47c, 5.7a–5.7e; this layer proves the
global statements: the invariant extension of the theta integral of `V′` from regular test vectors, square-integrability
and factorisation of the theta integrals, the descent of matching along hyperbolic planes by a global argument, and the
identity.

### 6.1 Complementary triples

Define a *complementary triple*: `(V, V′, W)` with an isometry `W^♭ ≅ V ⊕ V′(−1)`, unitary Hecke
characters `β`, `α` of `E` with `β|_{𝔸_F^×} = η^a`, `α|_{𝔸_F^×} = η^{a′}`, and the Weil
representations `ω` of `U(V) × U(W)` with splitting data `(β, β/α)` and `ω′` of `U(V′) × U(W)` with
splitting data `(α, α/β)` (ThetaKernelsForUnitaryDualPairs §4.4a). Put `ν = α/β` and, at a real place
`v`, `κ_v = m_{α,v} − m_{β,v}`. Define the theta integrals
`I_V(Φ)(h) = ∫_{[U(V)]} θ_ω(g, h; Φ) dg` and `I_{V′}(Φ′)(h) = ∫_{[U(V′)]} θ_{ω′}(g′, h; Φ′) dg′` on
`U(W)(F)\U(W)(𝔸)` where they converge (6.3). At each place `v` the triple is a local complementary
datum (ThetaKernelsForUnitaryDualPairs §3.47), with local theta quotients `Θ_v`, `Θ′_v`: the coinvariants of
`ω_v` under `U(V)(F_v)` and of `ω′_v` under `U(V′)(F_v)` at finite places, and at real places the
coinvariants of the polynomial Fock spaces under `(𝔲(V_v), K_{V_v})` and `(𝔲(V′_v), K_{V′_v})`, as
`(𝔲(W_v), K_{W_v})`-modules.

- If `V` has signature `(a − p, p)` and `V′` signature `(q, a′ − q)` at a real place `v`, then `W^♭`
  has signature `(N − p − q, p + q)` there; `p + q` is the *signature defect* at `v`.
- If `a ≡ a′ (mod 2)`, then `ν` is trivial on `𝔸_F^×`, `ν^c = ν⁻¹`, and every `κ_v` is even (by 0.2,
  `m_{α,v} ≡ a′` and `m_{β,v} ≡ a`).
- At a real place where `V` is positive and `V′` negative definite, the definite pairs `(V, W)` and `(V′, W)` have
  `ε_v = −1` and `ε_v = +1` (Conventions), and `ε_v m_{W,v} = κ_v` for both (2.1, Check).

Define the *place conditions* of a triple:

- (P1) `E/F` is unramified at every finite place;
- (P2) every finite place of `F` not split in `E` has odd residue characteristic, and `ψ_v` is unramified there
  (equivalently, with (P1): every place of `F` that is dyadic or divides the different of `F` splits in `E`);
- (P3) `α` and `β` are unramified outside a finite set `T` of places split in `E`, at each of which `ν_v` is ramified and
  `ψ_v` is unramified;
- (P4) at every finite place, `V_v` and `V′_v` contain unimodular lattices `L_v`, `L′_v`, and `W_v` contains a lattice `M_v`
  unimodular for its skew-Hermitian form.

No compatibility of `M_v` with `L_v ⊕ L′_v` under the isometry is required, and no condition is imposed on `δ`. (P4) is a
condition at the inert places only: at a split place such lattices always exist. At the places where `ψ_v` is ramified,
which split in `E` by (P2), the multiples `λ_vM_v` with `N_{E_v/F_v}(λ_v)O_{F_v} = 𝔡_{F,v}⁻¹`, `𝔡_F` the different of
`F`, are self-dual for `ψ_v ∘ Tr_{E_v/F_v} ∘ ⟨·,·⟩_W` (6.4); not every self-dual lattice is such a multiple (Check).

Prove: under (P1)–(P4), for every definite pair `(X, W₀)` obtained
from the triple by removing hyperbolic planes from `W` and from `V` or `V′` (`X = V` with splitting data `(β, β/α)`, or
`X = V′` with `(α, α/β)`), the local hypotheses of 5.3 hold at every finite place of its sets `S` and `S_0`, the test
vector being the lattice vector of `L_v ⊗ M_{0,v}` at the finite places outside `S`.

Route: every finite place of these sets splits in `E`: `E/F` is unramified (P1); `χ_W = ν^{∓1}` and the splitting
characters are ramified only at `T`, which consists of split places (P3); `ψ_v` is ramified only at places dividing the
different, which split (P2); the trivial representation is unramified. At the places of `S_0`, that is of `T`, 5.3's
second bullet (bump vectors at split places) gives `Z_v ≠ 0`; at the other places of `S` its first bullet gives
`Z_v^* ≠ 0` (equal to `d_v(s₀)⁻¹` for the Haar measure giving the stabiliser of `L_v` volume one, and to
`vol(Stab(L_v)) · d_v(s₀)⁻¹` for another) with the lattice vector of `L_v ⊗ M_{0,v}` for lattices `L_v ⊂ X_v`,
`M_{0,v} ⊂ W_{0,v}` with `L_v ⊗ M_{0,v}` self-dual for `ψ_v ∘ B`, which exist at a split place for every conductor of
`ψ_v` (rescale `M_{0,v}`).

*Needs:* 0.2, 5.3; ThetaKernelsForUnitaryDualPairs §§3.47, 4.4a; HermitianFormsAndLattices §§3.1, 4.2.

**Checks.**

- `p = q = 0` at every real place: `V` positive definite, `V′` negative definite and `W` definite at
  every real place; all three groups are compact at infinity.
- If `W` is split (Witt index `N/2`), then `V ⊕ V′(−1)` is hyperbolic, so `V ≅ V′ ⊕ H^{ε₀}` and
  `a − (Witt index of V) ≤ N/2`: `I_V` is outside Weil's range (6.3). Under the hypotheses of 6.11 the Witt index of `W`
  is at most `p + q < a′ + ε₀ = N/2` (`ε₀ > 2(p + q) + 1 > p + q`), so `W` is never split; the split case is the regularised
  second-term identity of MetaplecticAutomorphicForms §6.6.
- Self-dual lattices at a split place `v = ww̄` are not all multiples of one: with `W_v = Q ⊕ Q^∨` of dimension two and the
  form unramified, the lattice with first component `ϖ𝒪e₁ ⊕ 𝒪e₂` and second component its dual is self-dual, and its first
  component has elementary divisors `(1, 0)`, while the first components of the multiples
  `(ϖ_w^k, ϖ_{w̄}^{−k})·(𝒪e₁ ⊕ 𝒪e₂ ⊕ dual)` have `(k, k)`.

### 6.2 Matching data

Define *matching data* for a triple: at every place `v`, local matching data
`(Π_v, p_v, p′_v)` in the sense of ThetaKernelsForUnitaryDualPairs §3.47 (a nonzero irreducible
`U(W)(F_v)`-module, smooth at finite places and a `(𝔲(W_v), K_{W_v})`-module at real places, with
surjections `p_v : Θ_v → Π_v`, `p′_v : Θ′_v → Π_v` whose kernels are the unique maximal proper submodules of `Θ_v`,
`Θ′_v`), such that at almost all finite places `Π_v` is unramified and `p_v`, `p′_v` carry the lattice
vectors to one nonzero spherical vector. *Normalisation* (under the place conditions, 6.1): at every finite place
`v ∉ T`, `p_v` and `p′_v` carry the lattice vectors of `L_v ⊗ M^ψ_v` and `L′_v ⊗ M^ψ_v` (0.3, with `M^ψ` the lattice of 6.4,
self-dual for `ψ_v ∘ Tr ∘ ⟨·,·⟩_W`; at split places the type-II lattice vectors) to one fixed spherical vector; at `v ∈ T`,
a split place, `p_v` and `p′_v` are the two zeta integrals `P`, `P′` of ThetaKernelsForUnitaryDualPairs §3.47, with `ω_v`
realised on `S(R_v ⊗ Q_v)` and `ω′_v` on `S(R′_v^∨ ⊗ Q_v^∨)` (§3.47: `V_v = R_v ⊕ R_v^∨`, `V′_v = R′_v ⊕ R′_v^∨`,
`W_v = Q_v ⊕ Q_v^∨`, the components at the factor of `E_v` through which `U(W)(F_v) ≅ GL(Q_v)`) in fixed `O_{F_v}`-bases
of the first components `Λ_v ⊂ R_v`, `Λ′_v ⊂ R′_v`, `Λ^ψ_v ⊂ Q_v` of `L_v = Λ_v ⊕ Λ_v^∨`, `L′_v`, `M^ψ_v` and the dual
bases, with `X₀ = [1_a | 0]` and `Y₀ = [0 | 1_{a′}]` in these bases and the Haar measures of the two zeta integrals
normalised by `vol(GL_a(O_{F_v})) = vol(GL_{a′}(O_{F_v})) = 1`, so that `(Φ_v, Φ′_v)` match exactly when
`P(Φ_v) = P′(Φ′_v)` as functions on `U(W)(F_v)`;
the bases contain generators of the components of the planes removed in 6.4–6.12, and those of a smaller triple are the
remaining vectors in the same order. At the real places `(p_v, p′_v)` is a fixed choice, for maximal compact subgroups
`K_{V_v}`, `K_{V′_v}`, `K_{W_v}` (and with them the Fock models and polynomial Fock vectors, 0.3,
ThetaKernelsForUnitaryDualPairs §3.45) in good position (§5.7c) for all the planes removed in 6.4–6.12: the planes of the
whole induction are fixed first, mutually orthogonal in each space, and each Cartan involution is the orthogonal sum of
Cartan involutions of these planes (each plane spanned by a positive and a negative line) and of their common orthogonal
complement. Another choice of the bases at `v ∈ T` (integral bases of the same lattices, the measures fixed as above)
changes the matching relation at `v` by a factor in the finite group `ν_v(O_{E_v}^×)` (§3.47, dependence of the zeta
integrals on the data); a change of one of the two Haar measures alone multiplies it by a positive number. A pair
`(Φ, Φ′)` of pure tensors of test vectors (polynomial Fock vectors at the real places) is *matched* if
`p_v(Φ_v) = p′_v(Φ′_v)` for every `v`; in general a matched pair is a finite sum of matched pairs of pure tensors (no
limits are taken). Prove:

- *existence:* if `a′ ≥ 1`, `a ≡ a′ (mod 2)`, the triple satisfies the place conditions (6.1) and, at every real place
  `v` where `V` and `V′` have signatures `(a − p_v, p_v)` and `(q_v, a′ − q_v)`, `−κ_v > |a − 2p_v| + |a′ − 2q_v|` (for
  instance `κ_v < −N`), matching data exist, unique up to rescaling `(p_v, p′_v)` at each place, and normalised ones
  exist;
- the matched pairs form a `U(W)(𝔸_f) × K_{W,∞}`-stable space, stable under `𝔲(W_∞)`, and every test vector
  `Φ` has a partner `Φ′`, and conversely;
- matching is unchanged by rescaling `p_v`, `p′_v` by the same nonzero scalar; normalised matching data are
  determined by the choice at the real places and of the bases at the places of `T`.

Route: existence place by place: at split places ThetaKernelsForUnitaryDualPairs §3.47 (with `α`, `β` unramified, `ψ` arbitrary,
any residue characteristic; or `ν` ramified and `ψ` unramified, at the places of `T`), at the inert places §3.47a, at the
real places §3.47b (its hypotheses are `a′ ≥ 1` and the displayed inequality, since
`|P − Q| + |P′ − Q′| = |a − 2p_v| + |a′ − 2q_v|`);
uniqueness up to scalars because `ker p_v` is the unique maximal proper submodule of `Θ_v` and `Π_v` has scalar
endomorphisms. The normalisation: the lattice vectors span the spherical lines and generate (§§3.47, 3.47a), and at `T`
the zeta integrals are isomorphisms of `Θ_v` and `Θ′_v` onto one induced representation `Π_v` (they satisfy the same left law
under the parabolic subgroup of type `(a, a′)`, §3.47), determined by the bases up to the factors of §3.47; at the inert
places §3.47a needs `N` even. Then the restricted tensor product of the `Π_v` with respect to the spherical vectors;
partners exist because `p′_v` is onto.

*Needs:* 6.1; ThetaKernelsForUnitaryDualPairs §§3.47, 3.47a, 3.47b.

### 6.3 Theta integrals of a triple and the difference space

Fix a finite place `v₁` of `F` split in `E`, outside the ramification of the data, with `ν_{w₁}(ϖ_{w₁}) ≠ 1`
for `w₁ | v₁`. Prove:

- *Convergence.* `I_V(Φ)` converges absolutely for every test vector `Φ` when `2p + a′ < a` at the real
  places (Weil's criterion, ThetaKernelsForUnitaryDualPairs §5.7a). For `Φ′` whose component at `v₁` is
  supported on matrices of rank `a′` in the type-II model (`Φ′` *regular at `v₁`*), `I_{V′}(Φ′)` converges absolutely and
  has moderate growth (ThetaKernelsForUnitaryDualPairs §5.7b(i)); call this space `S′_{reg}`. Modulo the
  `U(V′)(F_{v₁})`-coinvariants every test vector at `v₁` is equivalent to one in `S′_{reg}` (§5.7b(ii), since
  `ν` is nontrivial at `v₁`).
- *Extension.* `I_{V′}` extends uniquely from `S′_{reg}` to a `U(V′)(F_{v₁})`-invariant linear map on all test vectors:
  `I_{V′}(Φ′) := I_{V′}(Φ′_{reg})` for any `Φ′_{reg} ∈ S′_{reg}` with the same image as `Φ′` in the
  `U(V′)(F_{v₁})`-coinvariants at `v₁`. It is well defined because the regular test vectors modulo their own relations
  map isomorphically onto `Θ′_{v₁}` (ThetaKernelsForUnitaryDualPairs §5.7b(iv), with §3.47, irreducibility:
  `ν_{w₁}(ϖ_{w₁}) ≠ 1`). Below `I_{V′}` denotes
  this extension; it intertwines `ω′(1, h)` with right translation, its values are automorphic functions of moderate
  growth, and when `V′` is anisotropic it is the convergent integral. It is invariant under `U(V′)(𝔸)`, equals the convergent
  integral on the test vectors regular at any place `v₂` of `F` with the properties required of `v₁` (whose integral
  converges by §5.7b(i)), and does not depend on the choice of `v₁` among these places. The same holds for the pairs
  `(V′, W₁)` of 6.4 and for the triples obtained by removing adapted planes (ThetaKernelsForUnitaryDualPairs §5.7c(ii), last
  clause).
- *Continuity.* For fixed finite components (in `S′_{reg}` on the side of `V′`), fixed archimedean components at the
  other real places and fixed `h`, the map `f ↦ I_V(f ⊗ Φ^v)(h)`, resp. `f ↦ I_{V′}(f ⊗ Φ′^v)(h)`, is a continuous linear
  functional on the Schwartz space at a real place `v` (the bounds of §§5.7a, 5.7b(i) are continuous seminorms of the
  archimedean component). The same holds for the triples obtained by removing adapted planes.
- *Square-integrability* (a statement about a pair). Let `(X, W)` be a unitary pair over `E/F` with `n = dim X`, `d = dim W`
  and `r_X`, `r_W` the Witt indices of `X`, `W` over `F`. If `X` is anisotropic or `n − r_X > d/2`, and `W` is anisotropic or
  `n + r_W < d`, then `I_{X,W}(Φ) ∈ L²([U(W)])` for every Schwartz function `Φ` of the Weil representation (in particular
  every test vector), and `|I_{X,W}(Φ)(u·m(t)k)| ≪ ∏_j |t_j|_E^{n/2}` on a Siegel set of `U(W)`. Under hypotheses 1–2 of
  6.11 this applies to `(V, W)` for every triple reached from the triple by
  removing `j < q` adapted planes from `V′` and `W` (`j = 0` is the triple itself; then `r_V ≤ p` and
  `r_W ≤ p + q − j < a′ − 2j`, since `a′ ≥ p + 2q`), to `(V, W)` for the triple itself when `q = 0` and `a′ > p`, and to
  `(V′, W)` whenever `q = 0` (`V′` is then definite and `r_W ≤ p < a`).
- *Square-integrability on regular vectors* (a statement about a pair). In the notation of the previous bullet, if
  `2n ≤ d` and `2·max(r_X, r_W) + 1 < n`, then `I_{X,W}(Φ) ∈ L²([U(W)])` for every `Φ` regular at `v₁` (its component at `v₁`
  supported on matrices of rank `n` in the type-II model). For a triple with `a′ > 2(p + q) + 1` this applies to `(V′, W)`
  for every `q` (`r_{V′} ≤ q`, `r_W ≤ p + q`, `2a′ ≤ N`).
- *Archimedean vanishing.* ThetaKernelsForUnitaryDualPairs §5.7b(iii) applies to the pairs `(V, W₁)`,
  `(V′, W₁)` of the smaller triples of 6.4: if `|m_{χ,v}| > dim W₁` for the splitting character `χ` of the
  pair and the signature condition of §5.7b(iii) holds, every convergent theta integral of the pair vanishes, and so
  does the extension (it is the integral of a regular representative).
- *The difference space.* `𝒟(V, V′, W)` is the space of all differences `I_V(Φ) − I_{V′}(Φ′)`, `Φ`, `Φ′` test vectors (no
  matching required; equivalently `Φ′ ∈ S′_{reg}`). Its elements are smooth of uniform moderate growth, and the cuspidal
  ones are rapidly decreasing.

Route: ThetaKernelsForUnitaryDualPairs §§5.7a, 5.7b; rapid decay of cuspidal functions of uniform moderate growth is
AutomorphicFormsOnReductiveGroups §4.2. *Square-integrability: the square of the kernel.* For Schwartz functions `Φ₁`,
`Φ₂` in a Schrödinger model let `M_{Φ₁,Φ₂}(w) = ⟨ρ(w)Φ₁, Φ₂⟩`, `w ∈ 𝕎(𝔸)`, be the matrix coefficient of the Heisenberg
operators (ThetaKernelsForUnitaryDualPairs §5.7a, matrix-coefficient majorant). By Poisson summation in one of the two
variables, `|θ(Φ₁)|·|θ(Φ₂)| ≤ c·Σ_{ξ ∈ 𝕎(F)} |M_{Φ₁,Φ₂}(ξ)|`; and `M_{ω(g,h)Φ₁, ω(g,h)Φ₂}(w) = M_{Φ₁,Φ₂}((g, h)⁻¹w)`,
because `ω` is unitary and `ω(g, h)ρ(w)ω(g, h)⁻¹ = ρ((g, h)w)` for the linear action of `U(X) × U(W)` on `𝕎 = X ⊗ W`
(Conventions). Hence `|θ(g, h; Φ)|² ≤ c·Σ_{ξ ∈ 𝕎(F)} |M_{Φ,Φ}((g, h)⁻¹ξ)|`. Write `Φ` as a finite sum of `f ⊗ φ_f`, `f`
Schwartz on the product of the real places; for each term and every `N` there are a continuous seminorm `p` and a
compact `C ⊂ 𝕎(𝔸_f)`, depending on `φ_f` and `N`, with `|M(w)| ≤ p(f)²(1 + ‖w_∞‖)^{−N}1_C(w_f)` (§5.7a). So
`|θ(g, h; f ⊗ φ_f)|²` is at most `c·p(f)²` times the number, weighted by `(1 + ‖·‖_∞)^{−N}`, of points of `(g, h)⁻¹𝕎(F)`
with finite part in `C`: no Weil operator acts on a majorant, the group acts linearly on the points, and `Φ` enters only
through `p(f)`. *Compact parts.* For `κ`, `κ′` in compact subsets of `U(X)(𝔸)`, `U(W)(𝔸)` this weighted count for
`(gκ, hκ′)` is at most a constant times the count for `(g, h)` with a larger compact `C` (route not given here; the
statement is that compact elements, acting linearly, distort the weight and the finite support by bounded amounts).
*Tori.* Let `a(s)`, `a′(t)` be elements of the
real split tori of Siegel sets of `U(X)`, `U(W)` (reduction theory, AdelicAlgebraicGroups §§3.4–3.5;
`s_1 ≥ ⋯ ≥ s_{r_X} ≥ 0`, likewise `t_1 ≥ ⋯ ≥ t_{r_W} ≥ 0`; `a(s)` acts by `e^{±s_i}` on the vectors of a maximal family
of hyperbolic pairs of `X` at every real place and trivially at the finite places, likewise `a′(t)`). On the coordinates
of `𝕎` in the two adapted bases the torus acts by the weights `±s_i ± t_j`, `±s_i` (`d − 2r_W` times), `±t_j`
(`n − 2r_X` times) and `0`; the weighted count at `(a(s), a′(t))` is at most a constant times
`exp([E:ℚ]·(Σ_{i,j} 2 max(s_i, t_j) + (d − 2r_W)Σ_i s_i + (n − 2r_X)Σ_j t_j))` (route not given here; the statement is a
lattice-point count in a box whose sides are these exponentials of the positive weights), and the exponent is at most
`[E:ℚ](dΣ_i s_i + nΣ_j t_j)`. So `|θ(a(s)κ, a′(t)κ′; Φ)| ≪ ∏_i|a(s)_i|_E^{d/2}∏_j|a′(t)_j|_E^{n/2}`, with
`|a(s)_i|_E = e^{[E:ℚ]s_i}`. *Two integrals.* Integrating over a Siegel set of `U(X)`, with modular factor
`∏_i|a(s)_i|_E^{−(n−2i+1)}`, converges when the partial sums `k(d/2 − n + k)` of the exponents are negative for
`1 ≤ k ≤ r_X`, that is in Weil's range `n − r_X > d/2` (nothing to do when `X` is anisotropic, the quotient being
compact). This gives `|I_{X,W}(Φ)(a′(t)κ′)| ≪ ∏_j|a′(t)_j|_E^{n/2}`, the pointwise bound. Its square against the modular
factor `∏_j|a′(t)_j|_E^{−(d−2j+1)}` of `U(W)` is integrable when the partial sums `−k(d − n − k)` are negative for
`1 ≤ k ≤ r_W`, that is `n + r_W < d`. *Regular vectors.* Cut `Φ` into finitely many pieces whose component at `v₁` is
supported near one matrix of full rank (route not given here), and use `|θ(Φ)|² = |θ(Φ)|·|θ(Φ^−)|`, `Φ^−(x) = Φ(−x)`
(the theta distribution is even, and the central element `−1` of `U(X)` acts by a scalar of absolute value one times
`Φ ↦ Φ^−`, so the same holds after `ω(g, h)`): by ThetaKernelsForUnitaryDualPairs §5.7a (iii) `M_{Φ,Φ^−}` vanishes at the points whose component at `v₁`
has rank `< n`, so only rational points of full rank contribute. For such a point the archimedean norm of
`(a(s), a′(t))⁻¹ξ` is at least a constant times `exp(v(s, t)/(n + 1))`, `v(s, t) = max_k(Σ_{i≤k}s_i − Σ_{i≤k}t_i)⁺`
(route not given here; the statement is a lower bound for the archimedean size of a full-rank rational matrix moved by
the two tori), which improves the count by `exp(−m·v(s, t))` for every `m`; for `2n ≤ d` and `2 max(r_X, r_W) + 1 < n`
there is an `m` for which the improved exponent lies below that of the modular factors (route not given here; the
statement is an elementary inequality between the two linear forms on the cones), and both integrals converge.
Extension: §5.7b(iv). Its properties: for `g` at a place `v ≠ v₁`, `ω′(g)` commutes with the relations at `v₁` and keeps
regularity at `v₁`, so the extension inherits the `U(V′)(𝔸)`-invariance of the convergent integral; a test vector
regular at `v₂` is related at `v₁` to a regular one by relations `ω′(g)Ψ − Ψ`, `g ∈ U(V′)(F_{v₁})`, whose components at
`v₂` are those of the given vector, hence regular, so there the extension is the convergent integral; it is therefore a
`U(V′)(F_{v₂})`-invariant extension from the vectors regular at `v₂`, and by uniqueness at `v₂` (§5.7b(iv)) it is the
one built at `v₂`. Continuity: the constants of
§5.7a and §5.7b(i) are continuous seminorms of the archimedean component.

*Needs:* 6.1; ThetaKernelsForUnitaryDualPairs §§3.47, 5.7a, 5.7b, 5.7c; AdelicAlgebraicGroups §§3.4, 3.5;
AutomorphicFormsOnReductiveGroups §4.2.

### 6.3a Factorisation through the matched quotients, and injectivity

Let a triple satisfy the place conditions (6.1) and the hypotheses of ThetaKernelsForUnitaryDualPairs §3.47b at every real
place (`a′ ≥ 1` and `−κ_v > |a − 2p_v| + |a′ − 2q_v|`, `(a − p_v, p_v)`, `(q_v, a′ − q_v)` the signatures of `V`, `V′`
at `v`), with matching data (6.2), and let `I` be one of its two theta integrals on all test vectors: `I_V`, or `I_{V′}`
extended from `S′_{reg}` (6.3). Prove:

- *Factorisation.* If `I(Φ) ∈ L²([U(W)])` for every `Φ` in its domain, then `I(Φ) = 0` for every pure tensor `Φ` one of whose
  components dies in the matched quotient (`p_v(Φ_v) = 0` at a finite place, `p_v(Φ_v) = 0` on polynomial Fock vectors at a
  real place; `p′_v` for `I_{V′}`). So `I` factors through `⊗_v Π_v` on pure tensors.
- *Factorisation from an identity.* If `I_V(Φ) = c·I_{V′}(Φ′)` for every matched pair, then `I_V` factors through
  `⊗_v Π_v`, and so does `I_{V′}` when `c ≠ 0`, with no square-integrability; `c ≠ 0` as soon as some `I_V(Φ) ≠ 0`.
- *Injectivity.* If `I` factors through `⊗_v Π_v` and is not identically zero, then `I(Φ) ≠ 0` for every pure tensor none
  of whose components dies in its matched quotient.

Route. Factorisation: fix the components away from `v` and put `u(y) = I(y ⊗ Φ^v)`; `u` is linear, kills the coinvariant
relations (invariance of the integral over the group integrated over), intertwines `ω_v(1, h)` with right translation,
and takes values in `L²`, so `β(y, y′) = ⟨u(y), u(y′)⟩` is an invariant positive semidefinite Hermitian form on the theta
quotient `Θ_v`. At a finite place outside `T`, `Θ_v` is generated by the image of the lattice vector `s`, which spans the
line of `Θ_v` on which `K_v = Stab(M_v)` acts by its character (ThetaKernelsForUnitaryDualPairs §§3.47, 3.47a). For `y` in
`ker p_v`, a proper invariant subspace, the projection of `y` to that line is `c·s` modulo relations with `c = 0` (else
`ker p_v` would contain `s`), and `β(s, y)` equals `β(s, projection of y) = 0` by invariance; so `β(ω(h)s, y) = 0` for every
`h`, `β(·, y) = 0`, `β(y, y) = 0` and `u(y) = 0`. At `T`, `Θ_v = Π_v` (§3.47, irreducibility). At a real place `Θ_v` is
generated by its `K_W`-type `La`, of multiplicity one (§3.47b(i), under its hypotheses, which are those assumed above; an
irreducible matched quotient with a unique maximal kernel alone does not provide such a type), so `ker p_v` has no
`La`-component; distinct `K_W`-types are orthogonal for `β`, and `β` is invariant under `𝔲(W_v)` (the derivatives of
`I(Φ)` are theta integrals of the derived vectors, again in `L²`), so `β(Θ_v, ker p_v) = 0`. Identity: a pair `(Φ, 0)`
with `p_v(Φ_v) = 0` at one place is matched, so `I_V(Φ) = 0`; a pair `(0, Φ′)` with `p′_v(Φ′_v) = 0` gives
`c·I_{V′}(Φ′) = 0`, hence `I_{V′}(Φ′) = 0` when
`c ≠ 0`; and if `I_V(Φ) ≠ 0`, a partner `Φ′` of `Φ` (6.2) gives `c·I_{V′}(Φ′) ≠ 0`. Injectivity: if `I(Φ) = 0` for a
pure tensor with nonzero images, the set of `y` with `I(y ⊗ Φ^v) = 0` contains `ker p_v`, is stable under `U(W)(F_v)`
(right translation) and its image in the irreducible `Π_v` contains `p_v(Φ_v) ≠ 0`, so it is everything; at a real place
the same with `(𝔲(W_v), K_{W_v})`, using the continuity of 6.3 to differentiate (for `I_{V′}` with the component at `v₁`
regular). Place by place `I` vanishes on all pure tensors, hence identically. At `v₁` the extended `I_{V′}` factors
through `Θ′_{v₁} = Π_{v₁}` (6.3), so `v₁` is treated
like the other finite places.

*Needs:* 6.1, 6.2, 6.3; ThetaKernelsForUnitaryDualPairs §§3.47, 3.47a, 3.47b, 5.7b.

**Checks.**

- A semisimple image is not what is used: a smooth module with a positive invariant form need not be semisimple; the
  argument uses only generation by a vector spanning the `K_v`-eigenline, resp. by a `K_W`-type of multiplicity one.
- In the compact case (6.10) `[U(W)]` is compact and square-integrability is automatic.
- The real-place hypotheses hold for every triple of the induction of 6.11: there `a′ ≥ 2`, and
  `|a − 2p| + |a′ − 2q| = N − 2(p + q) ≤ N < −κ_v` (`N` of the triple of 6.11), the left side unchanged when a plane is
  removed.

### 6.4 Constant terms of the theta integrals of a triple

*Lattices.* Under the place conditions (6.1) fix lattices `L ⊂ V`, `L′ ⊂ V′` unimodular at every finite place and a
lattice `M ⊂ W` unimodular for the skew-Hermitian form of `W` at every finite place (they exist by (P4): choose any
lattices and change them at finitely many places). At the finitely many places `v` where `ψ_v` is ramified (all split in
`E`) fix `λ_v ∈ E_v^×` with `N_{E_v/F_v}(λ_v)O_{F_v} = 𝔡_{F,v}⁻¹`, and let `M^ψ` be the lattice equal to `λ_vM_v` there
and to `M_v` elsewhere; it is self-dual for `ψ_v ∘ Tr_{E_v/F_v} ∘ ⟨·,·⟩_W` at every finite place, so that `L_v ⊗ M^ψ_v`
and `L′_v ⊗ M^ψ_v` are self-dual for `ψ_v ∘ B` (their lattice vectors normalise the matching data, 6.2). An *adapted
plane* of `W` is a hyperbolic plane `Ex ⊕ Ey`, `x`, `y` isotropic with `⟨x, y⟩_W = 1` for the skew-Hermitian form of
`W`, such that `M = (𝔟x ⊕ 𝔟̄⁻¹y) ⊥ M₁` with `𝔟x = M ∩ Ex`; then `M^ψ = (𝔠x ⊕ 𝔡_F⁻¹𝔠̄⁻¹y) ⊥ M^ψ_1` with `𝔠x = M^ψ ∩ Ex`,
`𝔠 = λ𝔟` (the ideal with local components `λ_v𝔟_v` at the places above and `𝔟_v` elsewhere), because
`λ_v𝔟̄_v⁻¹ = N(λ_v)(λ_v𝔟_v)‾⁻¹`. Since no place of `F` ramifies in `E` (P1), every isotropic `x` lies in an adapted
plane (HermitianFormsAndLattices §4.2(d), its last sentence, locally, and HermitianFormsAndLattices §4.7(b) with §4.7(c) globally); likewise for `V`,
`V′` with their Hermitian forms and the lattices `L`, `L′` (HermitianFormsAndLattices §§4.2(d), 4.7(b)). The planes removed in 6.4–6.12 are fixed
before the maximal compact subgroups at the real places, which are chosen in good position for all of them (6.2); the
local maps at the real places (ThetaKernelsForUnitaryDualPairs §5.7c(c), §5.7e) need this good position, which
lattice-adaptedness alone does not give (Check). Let the triple have one signature `(a − p, p)`, `(q, a′ − q)` at every
real place with `ε₀ ≥ p + 1` and `ε₀ ≥ 2` (implied by hypothesis 2 of
6.11, for the triple and for every smaller triple of its induction), and `v₁` as in 6.3. Let `x` lie in an adapted plane
of the induction and `P_x` be the stabiliser of `Ex`, with Levi `E^× × U(W₁)`, `W₁ = ⟨x, y⟩^⊥`. Prove:

- *Four parts.* By ThetaKernelsForUnitaryDualPairs §5.7c, the constant term of `I_V(Φ)` along `P_x` is the sum
  of a part of law `β|t|^{a/2}` on `E^×`, equal to `C₀ · I_{V, W₁}(e₀Φ)`, and a part of law `α|t|^{a′/2}`,
  equal to `C₁ · I_{V₁, W₁}(cone_{ν, ε₀}Φ)` when `V` is isotropic (`V₁` the complement of an adapted plane of
  `V`) and `0` when `V` is anisotropic; for `Φ′ ∈ S′_{reg}` the constant term of `I_{V′}(Φ′)` is the sum of a part of law
  `α|t|^{a′/2}`, equal to `C′₀ · I_{V′, W₁}(e′₀Φ′)` with the extended theta integral of `(V′, W₁)` (6.3), and a part of law
  `β|t|^{a/2}`, equal to `C′₁ · I_{V′₁, W₁}(cone^∨_{ν, ε₀+1}Φ′)` (an absolutely convergent integral) when `V′` is isotropic
  and `0` otherwise. The vector `e′₀Φ′` need not be regular at `v₁`; the first part is `C′₀ · I_{V′,W₁}(Φ′₁)` for any
  `Φ′₁ ∈ S′_{reg}(V′, W₁)` with the same image as `e′₀Φ′` in the `U(V′)(F_{v₁})`-coinvariants. Here `e₀`, `e′₀`, the cone
  `cone_{ν, ε₀}` and the dual cone `cone^∨_{ν, ε₀+1}` are those of §5.7c(i)–(ii) for the pairs `(V, W)` and `(V′, W)`
  (character relations `χ_Wμ = 1` and `χ_W = μ`), with `u₀` the isotropic vector of an adapted plane of `V` (resp. `V′`)
  and `K_X` the product of the stabilisers of `L_v` (resp. `L′_v`) at the finite places, for which the Iwasawa decomposition
  of §5.7c holds because `E_v/F_v` is unramified or split (P1), and of the maximal compact subgroups in good position at the
  real places; the dual cone carries `S′_{reg}` into the corresponding space of the
  smaller triple, and `C₀, C₁, C′₀, C′₁ ≠ 0` depend only on the measures. For the extended `I_{V′}(Φ′)` of an arbitrary test
  vector the same holds with a regular representative of `Φ′`.
- *Vanishing parts.* If `p = 0`, `q ≥ 1`, `a′ ≥ 2q` and `κ_v < −N` at every real place, the `α`-part of every element of
  `𝒟` is zero (the first term of `I_{V′}` vanishes by 6.3, archimedean vanishing, applied to a regular representative of
  `e′₀Φ′`, and `V` is anisotropic); if `q = 0, p ≥ 1`, the `β`-part is zero.

Route: ThetaKernelsForUnitaryDualPairs §5.7c(i)–(ii) for the pairs `(V, W)` and `(V′, W)` with the splitting data of 6.1 (its first range (i) for `(V, W)`:
`a − N/2 = ε₀ ≥ 1 + p`, `p` bounding the Witt index of `V` at the real places; its second range (ii) for `(V′, W)`:
`1 + N/2 − a′ = ε₀ + 1 ≥ 2`, regular data at `v₁`, and the extension of §5.7b(iv) for `(V′, W₁)` at `v₁`, which applies
because `ε₀ ≥ 2` and `ν` is unramified at `v₁` with `ν(ϖ) ≠ 1`); the laws are `χ_X|t|^{dim X/2}` and
`(χ_X/χ_W)|t|^{(N − dim X)/2}` with `χ_X = β` or `α` and `χ_W = β/α` or `α/β`. For the vanishing parts, apply §5.7b(iii)
to the pair `(V′, W₁)` when `p = 0`: `V′` has signature `(r, s) = (q, a′ − q)` (its `q`
positive directions are the negative directions of `V′(−1)` in `W^♭`), and `W₁^♭` has signature
`(r′, s′) = (N − q − 1, q − 1)`, so `min(r′, s′) = q − 1 < q = min(r, s)` (`a′ − q ≥ q`), and
`|m_{W,v}| = |κ_v| > N > dim W₁`; when `q = 0`, to
`(V, W₁)`, with `(r, s) = (a − p, p)` and `(r′, s′) = (N − p − 1, p − 1)`.

*Needs:* 6.1, 6.2, 6.3; ThetaKernelsForUnitaryDualPairs §§5.7b, 5.7c; HermitianFormsAndLattices §§1.2, 4.2, 4.7.

**Checks.**

- The range hypotheses are needed: for `a = 4`, `a′ = 2`, `p = q = 1` (`ε₀ = 1`) the first range of ThetaKernelsForUnitaryDualPairs §5.7c(i) fails for
  `(V, W)` (`ε₀ ≥ 1 + p` is false), and the local datum `(V₁, V′, W₁)` at `v₁` that gives the extension for `(V′, W₁)`
  would have `dim V₁ = a − 2 = a′`, not a local complementary datum.
- The hypothesis `a′ ≥ 2q` of the vanishing parts is needed for the route: for `(a, a′, p, q) = (7, 3, 0, 2)` (`ε₀ = 2`) the
  pair `(V′, W₁)` has `min(r, s) = min(2, 1) = 1` and `min(r′, s′) = min(7, 1) = 1`, so ThetaKernelsForUnitaryDualPairs §5.7b(iii) does not apply.
  Hypothesis 2 of 6.11 gives `a′ ≥ 2q + 2` at every stage.
- Lattice-adapted is not good position: in an integral hyperbolic plane `Ee ⊕ Ef` (`⟨e, f⟩ = 1`) with a unit vector `w`
  orthogonal to it, `e` and `f′ = f + 2w − 2e` span another unimodular hyperbolic plane, and the lattice is
  `(O_Ee ⊕ O_Ef′) ⊥ O_E(w − 2e)`; for the Cartan involution exchanging `e` and `f` and fixing `w`, the new plane contains `e`
  but not its image `f`.

### 6.5 Matching descends along adapted planes

Prove: let `G = (V, V′, W)` be a triple satisfying hypotheses 1–4 of 6.11 (one signature
`(a − p, p)`, `(q, a′ − q)` at every real place; `a ≡ a′ (mod 2)`, `2(p + q) + 1 < ε₀`, `2(p + q) + 1 < a′`; `κ_v < −N` at every
real place; the place conditions of 6.1), with normalised matching data (6.2). Choose `v₁` as in 6.3, outside `T`.

- *Removing a plane from `V′`.* Let `q ≥ 1`; remove adapted planes (6.4) from `V′` and `W`, giving `G₁ = (V, V′₁, W₁)` with
  normalised matching data, and assume that `G₁` has a constant: some `I_{V,W₁}(Φ₁)` and some `I_{V′₁,W₁}(Φ′₁)` are nonzero,
  and `I_{V,W₁}(Φ₁) = c(G₁)·I_{V′₁,W₁}(Φ′₁)` for every matched pair of `G₁` (with the extended `I_{V′₁,W₁}` of 6.3). Then for
  every matched pair `(Φ, Φ′)` of `G` with `Φ′ ∈ S′_{reg}` the pair `(c_β(G) · e₀Φ, cone^∨_{ν, ε₀+1}Φ′)` is matched for `G₁`,
  where `c_β(G) = C_β · ν^T(𝔟𝔠)⁻¹ · c_T(G) · L^T(ε₀ + 1, ν)`. More precisely, at every place `v`
  there are `a_v ≠ 0` in `Hom_{P_x}(Π_v, Π_{1,v} ⊗ χ_β)` (`Hom_{(𝔭_x, K_W ∩ M_x)}` at a real place) and `c_v ≠ 0` with
  `p_{1,v} ∘ e₀,v = a_v ∘ p_v` and `p′_{1,v} ∘ cone^∨_v = c_v · a_v ∘ p′_v`.
- *Removing a plane from `V`.* Let `q = 0` and `p ≥ 1`; remove adapted planes from `V` and `W`, giving `G₁ = (V₁, V′, W₁)`,
  and assume that `G₁` has a constant in the same sense. Then `(cone_{ν, ε₀}Φ, c_α(G) · e′₀Φ′)` is matched for `G₁`, with
  `c_α(G) = C_α · ν^T(𝔟𝔠) · c_T(G) · L^T(ε₀, ν)`. More precisely, the two sides and the law are exchanged: at every place `v`
  there are `b_v ≠ 0` in `Hom_{P_x}(Π_v, Π_{1,v} ⊗ χ_α)` (`Hom_{(𝔭_x, K_W ∩ M_x)}` at a real place) and `c_v ≠ 0` with
  `p′_{1,v} ∘ e′₀,v = b_v ∘ p′_v` and `p_{1,v} ∘ cone_v = c_v · b_v ∘ p_v`, `cone_v` the local cone `cone_{ν, ε₀}` at `v`.

Here `𝔟` is the fractional ideal of the `s ∈ E` with `s·x_H` in the lattice (`L` or `L′`), `x_H` the isotropic vector of
the plane removed from `V` or `V′`, `𝔠` the ideal `M^ψ ∩ Ex = 𝔠x` of 6.4 for the plane removed from `W` (the lattice `M^ψ`,
self-dual for `ψ_v ∘ Tr ∘ ⟨·,·⟩_W` at every finite place), `L^T` the partial Hecke `L`-function without the factors at `T`,
`ν^T(𝔞) = ∏_{v ∉ T} ν_v(𝔞_v)` the value of `ν` on the part of a fractional ideal `𝔞` prime to `T` (a value of `ν` on an ideal
is defined only away from its ramification), `c_T(G) = ∏_{v ∈ T} c_v` the product of the local constants `c_v` of the step at
the places of `T` (those of the first bullet when the plane is removed from `V′`, of the second when it is removed from `V`;
the constant of the step at `T` for the chosen data: nonzero numbers fixed by the matching data of `G` and `G₁` at `T` and by
the local maps, the local cones at `v ∈ T` being computed with the Haar measure of `E_v^×` giving `O_{E_v}^×` volume one and
the self-dual measure of `E_v` for `ψ_v`; they depend on the bases of 6.2 at `T` through a factor in
`∏_{v∈T} ν_v(O_{E_v}^×)`), and `C_β, C_α ≠ 0` depend only on the measures, the spaces, the lattices, the planes, `ψ`,
the set `T`, the infinity types of `α` and `β`, and the matching data of `G` and `G₁` at the real places. In particular,
at every place the Jacquet condition holds for the local components of `G` and `G₁`: `Hom_{P_x}(Π_v, Π_{1,v} ⊗ χ_β) ≠ 0`
when the plane is removed from `V′`, and `Hom_{P_x}(Π_v, Π_{1,v} ⊗ χ_α) ≠ 0` when it is removed from `V`
(ThetaKernelsForUnitaryDualPairs §5.7d, Remarks); it is a
consequence of the global argument.

*The constant at `T`.* Let `v ∈ T`, `w | v` the factor of `E_v` through which `U(W)(F_v) ≅ GL(Q_v)` (6.2), `c ≥ 1` the
conductor exponent of `ν_w`, `ϖ` a uniformiser of `F_v`, and `G(ψ_v, ν_w) = Σ_{y ∈ (O_{F_v}/ϖ^c)^×} ν_w(y)⁻¹ψ_v(y/ϖ^c)`.
Suppose that the bases of 6.2 at `v` contain the components at `w` of the vectors of the removed planes themselves,
placed as follows: for a plane removed from `V′`, the components of `u₀ = x_H` and of its partner `u′₀`
(`⟨u₀, u′₀⟩ = 1`) are the first and the last vector of the basis of `R′_v`, and those of `x`, `y` (`⟨x, y⟩_W = 1`) the
first and the last of the basis vectors of `Q_v` that index the last `a′` columns; for a plane removed from `V`, the
same with `R_v` and the first `a` columns; the bases of the smaller triple are the remaining vectors in the same order.
Then

`c_v = ν_w(−1) · N v^{−c·n} · ν_w(ϖ)^c · G(ψ_v, ν_w)`,

with `N v = q_v` the residue cardinality of `F_v`, `n = −ε₀` when the plane is removed from `V′` and `n = 1 − ε₀` when it is
removed from `V` (`ε₀` of the larger triple; in both cases `n = 1 − z`, `z` the exponent of the cone). The right side
does not depend on `ϖ`, and `|c_v| = N v^{c(1/2 − n)}`. For other positions of these vectors (the remaining vectors in
the same order) `c_v` is multiplied by `ν_w(sgn σ)`, `σ` the permutation relating the bases (ThetaKernelsForUnitaryDualPairs
§3.47, dependence of the zeta integrals on the data); and `c_T(G) = ∏_{v ∈ T} c_v`.

Route (`q ≥ 1`; the case `q = 0` is the same with the two sides exchanged, noted at the end).
(1) *The smaller triple.* By the identity for `G₁` and 6.3a (factorisation from an identity, with `c(G₁) ≠ 0` because some
`I_{V,W₁}(Φ₁) ≠ 0`; injectivity), both theta integrals of `G₁` factor through `⊗_v Π_{1,v}` and are nonzero on every
pure tensor none of whose components dies in its
matched quotient.
(2) *Nonvanishing of the descended maps.* `A_v := p_{1,v} ∘ e₀,v` is not zero, `e₀,v` and `p_{1,v}` being onto (at a real
place on polynomial Fock vectors, ThetaKernelsForUnitaryDualPairs §5.7d(d)). `B_v := p′_{1,v} ∘ cone^∨_v` is not zero: at the
finite places by §5.7d (support near the line `Eu₀`; outside `T` the lattice vector goes to a nonzero multiple of the
lattice vector, §5.7c(d)); at a real place `v`, take by (1) a pure tensor `f₀ ⊗ φ` of `G₁` (`f₀` its component at `v`,
`φ` regular at `v₁`) and `h` with `I_{V′₁,W₁}(f₀ ⊗ φ)(h) ≠ 0`; then `ℓ(f) = I_{V′₁,W₁}(f ⊗ φ)(h)` is a nonzero continuous
linear functional on the Schwartz space at `v` (6.3, continuity), invariant under `U(V′₁)(F_v)`, which by (1) kills the
polynomial Fock vectors that die in `Π_{1,v}`. If `B_v` vanished on polynomial Fock vectors, `ℓ ∘ cone^∨_v` would vanish on
them (the dual cone keeps polynomial Fock vectors, §5.7c(c)), hence everywhere (density, §3.45, and continuity,
§5.7c(c)), against the archimedean cone lemma §5.7e, case (B) (`χ_W = ν`, exponent `ε₀ + 1`, `2ε₀ < N < |κ_v|`).
(3) *Factorisation on the side of `V`.* `I_V` is square-integrable (6.3), so it factors through `⊗_v Π_v` (6.3a). Let
`p_v(Φ_v) = 0` and complete `Φ_v` by components `Φ_w` with `A_w(Φ_w) ≠ 0` (lattice vectors outside a finite set). Then
`I_V(Φ) = 0`, so the part of law `χ_β` of its constant term, `C₀ · I_{V,W₁}(e₀Φ)` (6.4), vanishes, and `e₀Φ` is a pure
tensor; by (1), `A_v(Φ_v) = 0`. So `A_v = a_v ∘ p_v` with `a_v ≠ 0`, and `a_v` is `P_x`-equivariant of law `χ_β` because
`A_v` is (§5.7c(L)).
(4) *The side of `V′`.* `B_v` is `P_x`-equivariant of law `χ_β` (§5.7c(L)) and factors through `Θ′_v`: at the finite places
by §5.7c(b) (`z₀ = a′ − N/2 = −ε₀`; the local `γ`-factor is finite and nonzero); at a real place because
`I_{V′}(ω′(Y)f ⊗ Φ′^v) = 0` for `Y ∈ 𝔲(V′_v)` and `f` polynomial Fock, so by 6.4 `I_{V′₁,W₁}(cone^∨(ω′(Y)f ⊗ Φ′^v)) = 0`,
and with the other components chosen by (2) (at `v₁` a function of full rank with nonzero image: `B_{v₁}` factors through
`Θ′_{v₁}` by §5.7c(b), and the functions of full rank map onto `Θ′_{v₁}`, §5.7b(ii)), `B_v(ω′(Y)f) = 0` by (1); likewise for
`K_{V′_v}`. So `B_v` lies in `Hom_{P_x}(Θ′_v, Π_{1,v} ⊗ χ_β)`, which has dimension at most one (§5.7d: (a) at `T`, (b)
at the other split places, (c) at the inert places, (d) at the real places) and contains `a_v ∘ p′_v ≠ 0`. Hence
`B_v = c_v · a_v ∘ p′_v`, and `c_v ≠ 0` by (2).
(5) *Matching and the constant.* For matched pure tensors `p′_{1,v}(cone^∨_vΦ′_v) = c_v·a_v(p′_vΦ′_v) = c_v·a_v(p_vΦ_v) = c_v·p_{1,v}(e₀,vΦ_v)` at every place. The global dual cone of a pure tensor is the tensor product of the local dual cones
(local Tate integrals; the product converges absolutely, `ε₀ + 1 ≥ 3`; AutomorphicLFunctionsAndLocalFactors AL.1), so
`c_β(G) = ∏_v c_v`. At the places outside `T` where the data, the lattice vectors and `ψ_v` are unramified, `c_v` is the
unramified value of ThetaKernelsForUnitaryDualPairs §5.7c(d), a power of `q_v` fixed by the ideals times `ν_v(𝔟_v𝔠_v)⁻¹L_v(ε₀ + 1, ν_v)`; these values
make up `L^T(ε₀ + 1, ν)` and `ν^T(𝔟𝔠)⁻¹`. At a split place where `ψ_v` is ramified, §5.7c(d) applies to the lattice
`M^ψ_v`, self-dual for `ψ_v ∘ Tr ∘ ⟨·,·⟩_W`, and to the plane `(x, y)` adapted to it (ThetaKernelsForUnitaryDualPairs §3.47,
the bullet on self-dual lattices for every conductor of `ψ`): `c_v` is again `L_v(ε₀ + 1, ν_v)` times a value of `ν_v`
on the ideals and a power of `q_v`; at the real places `c_v` depends only on the archimedean data. These powers and the
real factors go into `C_β`. At `v ∈ T`, `c_v` is the constant of the pair for the chosen data, defined by the zeta
integrals of 6.2 for `G` and `G₁` (ThetaKernelsForUnitaryDualPairs §3.47) through `p′_{1,v} ∘ cone^∨_v = c_v·a_v ∘ p′_v` and
`p_{1,v} ∘ e₀,v = a_v ∘ p_v` (for a plane removed from `V`: `p_{1,v} ∘ cone_v = c_v·b_v ∘ p_v` and
`p′_{1,v} ∘ e′₀,v = b_v ∘ p′_v`); it is nonzero by (2) and (4), which is all that 6.11 uses, and its value, in the bases
placed as in the statement, is computed on two *standard vectors* of conductor `c`: `φ_c ∈ S(R_v ⊗ Q_v)` is the function
of an `a × N` matrix equal to `ν_w(det of the first a columns)⁻¹` when that block lies in `GL_a(O)` and the other
columns are `≡ 0 (mod ϖ^c)`, and `0` otherwise; `φ′_c ∈ S(R′^∨_v ⊗ Q^∨_v)` likewise with the last `a′` columns; both are
fixed by the stabilisers of the lattices. (i) `P(φ_c) = P′(φ′_c)` as functions on `GL_N(F_v)`: both vanish at the `h`
whose lower right `a′ × a′` block is singular, and otherwise `h = b·n^−(y)` with `b` block upper triangular and `n^−(y)`
lower unipotent, both have the left law of §3.47 under `b`, and both equal `1` or `0` at `n^−(y)` according as
`y ≡ 0 (mod ϖ^c)` or not (the vanishing and the values on `n^−(y)`: route not given here; the statement is that `φ_c`
and `φ′_c` have the same zeta integral on these `h`). So `(φ_c, φ′_c)` is matched, and so is the pair
`(φ_{1,c}, φ′_{1,c})` of the smaller triple. (ii) `e₀φ_c = N v^{−c·a}φ_{1,c}`: in the linear model `e₀` integrates the
entries of the column of `x` and evaluates the column of `y` at `0` (the description of `e₀` and of the Heisenberg
translates in the linear models: route not given here; the statement is that the evaluation at `0` of the coordinates of
`X ⊗ y` and `u′₀ ⊗ W₁` in the mixed model of §5.7c is, in the linear model, integration over the entries dual to them
and evaluation at `0` of the others), and the column of `x` lies outside the marked block. (iii) For the dual cone, the
integrand at `l = (l_w, l_{w̄})` evaluated on `φ′_c` is `N v^{−c·a}·1_{O^×}(l_w)ν_w(l_w)⁻¹·ν_w(−1)g(l_{w̄})·φ′_{1,c}`,
`g(t) = ∫_{O^×}ν_w(x)⁻¹ψ_v(tx)dx`: the Heisenberg translate along the line puts `−l_w` at the place (first row, last
marked column) and the character `ψ_v(−l_{w̄}Z)` on the entry `Z` at (last row, first marked column), which is
integrated; the determinant of the marked block is `l_w·Z` times that of the inner block, and
`∫_{O^×}ν_w(Z)⁻¹ψ_v(−l_{w̄}Z)dZ = ν_w(−1)g(l_{w̄})`. (iv) Tate's integral over `E_v^× = F_v^× × F_v^×` with the weight
`ν_w(l_w)ν_w(l_{w̄})⁻¹|l|^z`: the first variable integrates to `1`; the second is supported on `|l_{w̄}| = N v^c`, where
`g(uϖ^{−c}) = ν_w(u)g(ϖ^{−c})`, and gives `g(ϖ^{−c})ν_w(ϖ)^cN v^{cz}`, with `g(ϖ^{−c}) = N v^{−c}G(ψ_v, ν_w)` (the
support, the equivariance and the value of `g`, and this Tate integral: route not given here; the statement is the
evaluation of a Gauss integral of a character of exact conductor `c` and of its Tate integral). (v) The factors
`N v^{−c·a}` cancel, and `p_{1,v}(φ_{1,c}) = p′_{1,v}(φ′_{1,c}) ≠ 0`. For a plane removed from `V` the computation is
the mirror, with the ordinary cone and `e′₀`: the translate puts `l_w` at (first row, last column of the first `a`) and
the character `ψ_v(l_{w̄}A)` on the entry `A` at (last row, first column), the determinant of the marked block is
`−A·l_w` times that of the inner block, and `e′₀φ′_c = N v^{−c·a′}φ′_{1,c}`.
*The case `q = 0`.* `V′` is definite at every real place, hence anisotropic, so `I_{V′}` is square-integrable (6.3) and
factors through `⊗Π_v`; (3) applied to `e′₀` gives `p′_{1,v} ∘ e′₀,v = b_v ∘ p′_v`, `b_v ≠ 0` of law `χ_α`;
`p_{1,v} ∘ cone_{ν,ε₀,v}` factors through `Θ_v` (§5.7c(b) at the finite places with `z₀ = ε₀ > 0`, the invariant
integral; at the real places as in (4)), the bounds of §5.7d for `X = Θ` make it a multiple of `b_v ∘ p_v`, and the
multiple is nonzero by §5.7e, case (A) (`χ_W = ν⁻¹`, exponent `ε₀`), at the real places and by §5.7d at the finite
places; here `e′₀Φ′` need not be regular at `v₁`, and the injectivity of (1) is applied to the theta integral of
`(V′, W₁)`, which converges because `V′` is anisotropic.

*Needs:* 6.1, 6.2, 6.3, 6.3a, 6.4; MetaplecticAutomorphicForms §§0.15, 3.2a and ThetaKernelsForUnitaryDualPairs §§3.45, 3.47, 5.7b, 5.7c, 5.7d, 5.7e;
AutomorphicLFunctionsAndLocalFactors AL.1.

**Checks.**

- The hypothesis on `G₁` enters twice: through the injectivity of its theta integrals (steps (3), (4)) and through the
  functional `ℓ` of step (2). Square-integrability is used for `G` only, and for one of its two theta integrals.
- No local statement beyond ThetaKernelsForUnitaryDualPairs §§5.7c–5.7e is assumed at any place: at the inert places the nonzero `a_v`, which is the
  Jacquet condition, comes from step (3); at the real places neither theta quotient need be irreducible.
- The law of the descended maps depends on the step. At a split place with `ν_w(ϖ) ≠ 1`, `Π_v = α_w ∘ det_a × β_w ∘ det_{a′}`
  has `a` entries of its cuspidal support on the line of `α_w` (twists by real powers of `|·|`) and `a′` on that of `β_w`.
  For `(a, a′) = (8, 2)` and a plane removed from `V`, `Π_{1,v}` has `6` and `2`; the two `GL₁`-characters of `χ_α` lie
  on the `α_w`-line and restore `8` and `2`, while those of `χ_β` would give `6` and `4`, so
  `Hom_{P_x}(Π_v, Π_{1,v} ⊗ χ_β) = 0` there. For a plane removed from `V′` the count `(a, a′ − 2) + (0, 2)` gives `χ_β`.
- The sign `ν_w(−1)` of the constant at `T`, in the smallest case: `V′` and `W` hyperbolic planes at a split place, rows of
  the `2 × 2` block indexed by the dual basis vectors of `u₀_w`, `u′₀_w`, columns by those of `x_w`, `y_w`. By
  MetaplecticAutomorphicForms §3.2a (`h((x, ℓ), (y, k)) = (ℓ(y), εk(x))`) the components at `w̄` are `u₀_{w̄} = (u′₀_w)^*`,
  `u′₀_{w̄} = (u₀_w)^*`, `x_{w̄} = y_w^*`, `y_{w̄} = −x_w^*` (the sign from `⟨y, x⟩_W = −1`), and
  `B(r^∨ ⊗ q^∨, r ⊗ q) = r^∨(r)q^∨(q)`. In the Schrödinger model on `R′^∨ ⊗ Q^∨` (§0.15) the translate by `t u₀ ⊗ y` is
  `Φ(Y) ↦ ψ_v(t_wY_{12})Φ(Y − t_{w̄}E_{21})`, the
  functional "first column `0`, integrate the second" is the evaluation at `0` of the coordinate of `V′ ⊗ y` (it is invariant
  under the translates by `V′ ⊗ x`), and `r̂₁^{(s)}Φ = ∫Φ([[0, −s_w], [Z, c]])ψ_v(−Zs_{w̄}) dZ dc`. On
  `ν_w(det)⁻¹·1_{GL_2(O)}` the determinant is `s_wZ`, and the `Z`-integral is `ν_w(−1)g(s_{w̄})`. Exchanging the two
  rows (or the two columns) removes the factor `ν_w(−1)`, which is `−1` for an odd `ν_w` (conductor `5`, `2 ↦ i`): the
  placement of the plane vectors in the bases matters. The same computation over `𝔽_5`, with the Heisenberg operators
  applied literally, gives `−1` and `+1` for the two
  placements, and for the ordinary cone (plane removed from `V`) `−1` again.
- The phase: under `l ↦ lζ`, `ζ` a unit of `E_v`, the integrand of (iii) is multiplied by
  `ν_w(ζ_w)⁻¹ν_w(ζ_{w̄}) = ν_v(ζ)⁻¹`, the law `r̂₁^{(sζ)} = χ_W(ζ)⁻¹r̂₁^{(s)}` (`χ_W = ν`) of a vector fixed by `K_{X,v}`
  (ThetaKernelsForUnitaryDualPairs §5.7c, (L) and the route of (ii)). The complex conjugate value would need the Gauss
  variable at `w`; the plain variable would then carry
  `ν_w⁻²` on the units, and its integral vanishes whenever `ν_w²` is ramified.

### 6.6 Nonvanishing up the tower

Prove: let `(V, V′, W)` be a complementary triple with one
signature `(a − p, p)`, `(q, a′ − q)` at every real place, `a ≡ a′ (mod 2)`, `2p + a′ < a`, and `2q + 1 ≤ a′` if `p = 0`,
`κ_v ≤ −N` at every real place, and the place conditions (6.1). If `p = 0`, then `I_V(Φ) ≠ 0` for some test vector `Φ`; if
`q = 0`, then `I_{V′}(Φ′) ≠ 0` for some `Φ′ ∈ S′_{reg}`.

Route: for `p = 0`, remove `q` adapted planes from `V′` and `W` (6.4; HermitianFormsAndLattices §§3.5(b), 4.7(b), and 4.7(c)
for the lattice of `W`, unimodular for its skew-Hermitian form): at the
`j`-th step `V′_j` has signature `(q − j, a′ − q − j)` and dimension `a′ − 2j ≥ 3`, so it is isotropic, which is where
`2q + 1 ≤ a′` enters (for `q = 0` the same with `V` needs `2p + 1 ≤ a`, implied by `2p + a′ < a`). This reaches `W₀` with
`W₀^♭ ≅ V ⊕ V′₀(−1)` positive definite at every real place; for the definite pair `(V, W₀)` (`ε_v = −1`, `χ_W = β/α`,
`ε_v m_{W,v} = κ_v ≤ −dim W₀`) some `I_{V,W₀}(Φ₀) ≠ 0` by 5.3, whose local hypotheses hold by 6.1, the `L`-values
`L_E(dim W₀/2 − i, ν⁻¹)` being at integers (`dim W₀ = N − 2q` is even because `a ≡ a′`) and nonzero by 5.3's second
corollary (`|κ_v| ≥ dim W₀`). Then climb back:
ThetaKernelsForUnitaryDualPairs §5.7c(iii) (the first term of the constant term along an adapted line is a nonzero multiple of
the theta integral of `e₀Φ` for the smaller pair, `e₀` is onto, and the two laws are distinct) gives `I_{V,W_j} ≠ 0` at
each stage. For `q = 0` the same with `V′` (`ε_v = +1`, `χ_W = α/β`, `ε_v m_{W,v} = κ_v`), `V`, and §5.7b(ii) to move into
`S′_{reg}`.

*Needs:* 5.3, 6.1, 6.3, 6.4; ThetaKernelsForUnitaryDualPairs §§5.7b, 5.7c; HermitianFormsAndLattices §§3.5, 4.2, 4.7.

### 6.7 Orthogonal cuspidal differences vanish

Prove: under the convergence hypotheses of 6.3, if `f ∈ 𝒟` is cuspidal
and `⟨f, I_V(Ψ)⟩ = ⟨f, I_{V′}(Ψ′)⟩ = 0` for every test vector `Ψ` and every `Ψ′ ∈ S′_{reg}`, then `f = 0`.

Route: `f` is cuspidal of uniform moderate growth, hence rapidly decreasing (6.3), and every theta integral of 6.3 has
moderate growth, so the Petersson pairings converge absolutely. Writing `f = Σ_i (I_V(Φ_i) − I_{V′}(Φ′_i))`,
`⟨f, f⟩ = Σ_i (⟨f, I_V(Φ_i)⟩ − ⟨f, I_{V′}(Φ′_i)⟩) = 0`.

*Needs:* 6.3; AutomorphicFormsOnReductiveGroups §4.2.

**Checks.**

- Square integrability of the theta integrals is not needed: rapid decay of `f` alone makes `⟨f, f⟩` and the pairings
  with functions of moderate growth converge.

### 6.8 Back-lifts of differences

Let `f ∈ 𝒟` be rapidly decreasing, and for a test vector `Ψ` let `θ^*_X(f, Ψ)(g) = ⟨f, θ_{ω_X}(g, ·; Ψ)⟩`
be its back-lift to `U(X)`, `X ∈ {V, V′}`. At a finite place `v`, a function `f` on `U(W)(F)\U(W)(𝔸)` *comes locally at `v`
from* the Weil representation `ω′` of `(V′, W)` if it is a finite sum of values `T(Φ′_v)`, `Φ′_v ∈ ω′_v`, of
`U(W)(F_v)`-equivariant linear maps `T` from `ω′_v` to rapidly decreasing smooth functions on `U(W)(F)\U(W)(𝔸)` (so that
every value of `T`, not only `f`, pairs with the theta kernels, which have moderate growth); likewise for `ω`. Prove:

- *Good split places.* Let `κ_v ≠ 0` at every real place. The set `𝒮` of places `v` of `F` split in `E`,
  outside the ramification of the data, with `ν_w(ϖ_w) ≠ 1` for `w | v`, has Dirichlet density one among the
  places split in `E`.
- *Local origin.* At `v ∈ 𝒮`, `v ≠ v₁`, the theta quotients are irreducible, `Θ_v = Θ′_v = Π_v`
  (ThetaKernelsForUnitaryDualPairs §3.47, irreducibility); so `Φ_v ↦ I_V(Φ_v ⊗ Φ^v)` and `Φ′_v ↦ I_{V′}(Φ′_v ⊗ Φ′^v)`, which
  factor through `Θ_v` and `Θ′_v`, factor through `Π_v`, and every rapidly decreasing `f ∈ 𝒟` comes locally at `v` from each
  of the two Weil representations.
- *Invariance.* If `f` comes locally at `v ∈ 𝒮` from the `(V′, W)` Weil representation, then `θ^*_V(f, Ψ)` is
  right `U(V)(F_v)`-invariant, and symmetrically. This uses ThetaKernelsForUnitaryDualPairs §3.47c(1) with
  `ξ = ν_w|·|^{N/2}` (or its inverse), `a + a′ = N`, and `χ_W = χ_V/χ_{V′}` for the splitting data.
- *Constancy.* A continuous automorphic function on `U(X)`, `dim X ≥ 2`, right invariant under
  `U(X)(F_v)` for all `v` in a set of split places of Dirichlet density one, is constant: strong
  approximation for `SU(X)` (HermitianFormsAndLattices §2.5(d)) reduces it to a function of the
  determinant on `E¹\𝔸_E¹`, and a Hecke character of `E` trivial on `𝔸_F^×` and at the places above a
  set of split places of density one is trivial, because its `L`-function and `ζ_E` would have the same
  pole at `s = 1` (LFunctions Layer 7). Hence `θ^*_V(f, Ψ)` and `θ^*_{V′}(f, Ψ)` are constant when
  `a, a′ ≥ 2`.
- *Vanishing, isotropic case.* If `X` is isotropic over `F` and `dim X ≥ 3`, a constant back-lift is zero:
  for `Ψ ∈ S′_{reg}`-type vectors the kernel decays in the height of `g`, so `|θ^*(f, Ψ)(g)|` times the
  height is bounded, while the height is unbounded on `[U(X)]`; for general `Ψ` reduce to full-rank
  support at `v₁` modulo coinvariants (6.3).
- *Orthogonality.* Consequently, if `f` is cuspidal then `⟨I_V(Ψ), f⟩ = ∫_{[U(V)]} θ^*_V(f, Ψ) = 0` for
  all `Ψ` when `V` is isotropic of dimension at least three (in particular when `p ≥ 1` and `a ≥ 3`), and
  `⟨I_{V′}(Ψ′), f⟩ = 0` for all `Ψ′` when `V′` is.
- *Anisotropic case.* If `f` is cuspidal, `p = 0` and `q ≥ 1`, then `⟨I_V(Ψ), f⟩ = 0` for all `Ψ`; if
  `q = 0` and `p ≥ 1`, then `⟨I_{V′}(Ψ′), f⟩ = 0` for all `Ψ′`; under the hypotheses of 6.6 for the smaller
  triple.

Route. Good split places: `ν` has infinity types `κ_v ≠ 0`, so no `ν^k`, `k ≠ 0`, is a norm twist, and
`L(s, ν^k)` is holomorphic and nonzero at `s = 1` (AnalyticNumberTheoryPartI §2.3a, LFunctions Layer 7);
with Fejér's kernel, `1_{z = 1} ≤ (K + 1)⁻¹ Σ_{|k| ≤ K} (1 − |k|/(K + 1)) z^k` on the unit circle, so
`Σ_{ν_w(ϖ_w) = 1} N(w)^{−s} ≤ (K + 1)⁻¹ log(1/(s − 1)) + O_K(1)` as `s → 1⁺`, and the exceptional set has
upper Dirichlet density at most `1/(K + 1)` for every `K`. Local origin: `T(Φ_v) = I_V(Φ_v ⊗ Φ^v)` is
`U(W)(F_v)`-equivariant and, by the `U(V)(F_v)`-invariance of the integral, factors through `Θ_v`; at `v ∈ 𝒮` (`ν`
unramified with `ν_w(ϖ_w) ≠ 1`, data unramified) `Θ_v = Π_v ≅ Θ′_v`, so `T` composed with `ω′_v → Θ′_v ≅ Θ_v` is a map from
`ω′_v` whose image contains `I_V(Φ)`; likewise for `I_{V′}`. For `f = Σ_i (I_V(Φ_i) − I_{V′}(Φ′_i))` rapidly decreasing, let
`U` be the sum of the images of the finitely many maps so obtained: each image is `0` or isomorphic to the irreducible
`Π_v`, so `U` is a semisimple `Π_v`-isotypic `U(W)(F_v)`-module. The rapidly decreasing functions form a space stable under
right translation by `U(W)(F_v)`, so `U′ = U ∩ {rapidly decreasing}` is a submodule of `U`, hence a finite direct sum of
copies of `Π_v`, and `f ∈ U′`. Composing the inclusions of these copies with `ω′_v → Θ′_v = Π_v` (resp. `ω_v → Θ_v = Π_v`)
writes `f` as a finite sum of values of equivariant maps into rapidly decreasing functions. (The images of the original
maps need not be rapidly decreasing; only the sum `f` is assumed to be.) Invariance: the pairing
`(Ψ_v, Φ′_v) ↦ θ^*(TΦ′_v, Ψ_v ⊗ Ψ^v)(1)`, which converges for every `Φ′_v` because `TΦ′_v` is rapidly decreasing and the
theta kernel has moderate growth, is a `GL_N`-invariant functional on `S(M_{a×N}) ⊗ conj S(M_{a′×N}) = S(M_{N×N})` with
right law `ξ = χ_W|·|^{N/2}`, `ξ(ϖ) = ν_w(ϖ_w)^{±1}q^{∓N/2}` not a positive real; by ThetaKernelsForUnitaryDualPairs §3.47c(1) it has the same left law,
which on `GL_a × 1` cancels the factor `χ_W(det u)|det u|^{N/2}` of the Weil action of `U(V)_v`. Constancy:
AdelicAlgebraicGroups §4.2 through HermitianFormsAndLattices §2.5(d). The anisotropic case (doubling):
suppose `X` definite, `f` cuspidal and rapidly decreasing with constant back-lift `c ≠ 0` for some `Ψ₂`. For
any `Ψ₁` put `K(h, h′) = ∫_{[U(X)]} θ(g, h; Ψ₁) conj θ(g, h′; Ψ₂) dg`; integrating against `f` in `h′` gives
`c̄ · I_X(Ψ₁)(h)`. By the doubling seesaw and the anisotropic Siegel–Weil formula
(MetaplecticAutomorphicForms §§6.4, 6.10), `K` is the value at `s₀` of a Siegel Eisenstein series on
`U(W ⊕ W(−1))` restricted to `U(W) × U(W)`; for `Re s` large its integral against a cusp form in the
second variable unfolds to a right convolution of that cusp form, hence is cuspidal in `h`, and
vanishing of constant terms persists under continuation to `s₀`. So every `I_X(Ψ₁)` would be cuspidal.
But by 6.4 the constant term of `I_X` along an adapted line has the part `C₀ · I_{X, W₁}(e₀Ψ₁)` with a law
different from the other part, `e₀` is onto, and `I_{X, W₁} ≠ 0` by 6.6 applied to the smaller triple; a
contradiction. Hence the back-lift is `0` and the pairing vanishes.

*Needs:* 6.2–6.6; ThetaKernelsForUnitaryDualPairs §§3.47, 3.47c and MetaplecticAutomorphicForms §§6.4, 6.10, 6.15; AdelicAlgebraicGroups §4.2;
HermitianFormsAndLattices §§0.2, 2.5; AnalyticNumberTheoryPartI §2.3a; LFunctions Layer 7;
AutomorphicFormsOnReductiveGroups §4.2.

### 6.9 Cuspidality and purity

Prove:

- *Cuspidality from one line.* Assume `ε₀ ≥ 2` and that
  ThetaKernelsForUnitaryDualPairs §3.47c(2)–(3) apply at some split place where all data are unramified. If
  `f ∈ 𝒟` has vanishing constant term along `P_x` for one adapted line, then `f` is cuspidal: its constant
  term along the stabiliser of every nonzero totally isotropic subspace `I ⊂ W` vanishes.
- *Purity.* Assume `p, q ≥ 1`, `ε₀ ≥ p + 1` and `ε₀ ≥ 3`: the ranges of 6.4 for the triple
  and for the smaller triple `(V₁, V′, W₁)`, whose gap is `ε₀ − 1` (for `(a, a′, p, q) = (8, 4, 1, 1)`, `ε₀ = 2` and the
  smaller triple has gap `1`, outside the range of 6.4). If `f ∈ 𝒟` has zero `β`-part,
  then the restriction of its `α`-part to the Levi, an element of `𝒟` of the smaller triple `(V₁, V′, W₁)` (defect
  `(p − 1, q)`), has zero `β`-part on `W₁`. By 6.4, for `f = Σ_i (I_V(Φ_i) − I_{V′}(Φ′_i))`, `Φ′_i ∈ S′_{reg}`, that
  restriction is `Σ_i (C₁ · I_{V₁,W₁}(cone_{ν,ε₀}Φ_i) − C′₀ · I_{V′,W₁}(Φ′_{1,i}))` with `Φ′_{1,i} ∈ S′_{reg}(V′, W₁)`
  regular representatives of the `e′₀Φ′_i`.

Route. Cuspidality, by induction on `j = dim I`: for `j = 1` all isotropic lines are conjugate under
`U(W)(F)` (Witt's theorem, HermitianFormsAndLattices §§1.1–1.2). For `j ≥ 2`, the function
`g ↦ (constant term along N_I)(lev(g) x)` on `GL_j(E)\GL_j(𝔸_E)` is cuspidal by the induction hypothesis
(its constant terms along the standard parabolics are constant terms of `f` along flags in `I`), smooth and
of moderate growth (6.3); by the Fourier expansion of Piatetski-Shapiro and Shalika
(AutomorphicFormsOnReductiveGroups §4.3, applied to cuspidal smooth functions of moderate growth after
convolution by bump functions, which keeps them in the cuspidal part) it vanishes once its Whittaker
coefficient vanishes on all translates. For `j ≥ 3` that Whittaker coefficient is a functional of the kind
excluded by ThetaKernelsForUnitaryDualPairs §3.47c(2). For `j = 2`, §3.47c(3) shows that its values along `diag(ϖ^m, ϖ^{−m})` at a split place
are `x(h) y_m` with one sequence `y_m` for both theta integrals (the parameters are `r` and `r⁻¹`, and
`y_m(r⁻¹) = r^c y_m(r)`), and `|y_m| → ∞` because `ε₀ ≥ 2`; but the function on `SL₂(E)\SL₂(𝔸_E)` is cuspidal
of moderate growth, so after right convolution with bump functions it is bounded (each convolution lowers
the growth exponent by one), its Whittaker coefficient is bounded, and the relation `W(b_m z) y₀ = y_m W(z)`
forces `W = 0`. Purity: on the `SL₂`-Levi of an isotropic plane `⟨x, x₁⟩` the two-step constant term is
`A + C` with `A` of law `α` at both steps and `C` of law `α` then `β`; the element `diag(u, u⁻¹)`,
`|u|_E = r > 1`, fixes `A` and multiplies `C` by `l = (α/β)(u) r^{(a′ − (a − 2))/2}`, `|l| < 1` because
`a′ < a − 2`; a bounded (after convolution) automorphic function on `SL₂` cannot have a constant-term
exponent decaying towards the cusp, so `C = 0`.

*Needs:* 6.1, 6.3, 6.4; ThetaKernelsForUnitaryDualPairs §§3.47c, 5.7c and MetaplecticAutomorphicForms §5.5; AutomorphicFormsOnReductiveGroups
§§4.1, 4.3; AdelicAlgebraicGroups §3.1; HermitianFormsAndLattices §§1.1, 1.2.

### 6.10 The compact case

Prove: let `(V, V′, W)` be a complementary triple over a CM
extension `E/F` with `V` positive definite and `V′` negative definite at every real place, `a′ ≥ 2`,
`a ≡ a′ (mod 2)`, `ε₀ ≥ 2`, `κ_v < −N` at every real place, the place conditions of 6.1 and matching data at every
place (6.2; they exist under the place conditions, and at the real places `Θ_v = Θ′_v` is the irreducible representation
of the compact `U(W_v)` of ThetaKernelsForUnitaryDualPairs §3.47b, first Check). Then some `I_V(Φ)` and some `I_{V′}(Φ′)` are
nonzero, and there is a unique `c` with `I_V(Φ) = c · I_{V′}(Φ′)` for every matched pair; `c ≠ 0`.

Route: all three groups are compact at infinity. (1) *Nonvanishing*: 5.3 for the definite pairs `(V, W)`
(`ε_v = −1`, `χ_W = β/α` of infinity type `−κ_v`) and `(V′, W)` (`ε_v = +1`, `χ_W = α/β` of infinity type
`κ_v`), whose local hypotheses hold by 6.1; in both cases `ε_v m_{W,v} = κ_v ≤ −N` (2.1, Check). The `L`-values
`L_E(N/2 − i, ν^{∓1})` are at integers (`a + a′` is even), where they are finite and nonzero because `|κ_v| > N`
excludes trivial zeros (5.3, second corollary, with the complete finite parts). (2) *Factorisation*: 6.3a in its compact
case (`[U(W)]` is compact, so the theta integrals are square-integrable): `I_V` and `I_{V′}` factor through `⊗_v Π_v` on
matched pairs (6.2). (3) *Multiplicity one*: the image of the matched pairs is
an irreducible `U(W)(𝔸)`-module (each local factor is irreducible), so every invariant Hermitian form on it built from
`I_V`, `I_{V′}` is proportional to `⟨I_{V′}(Φ′₁), I_{V′}(Φ′₂)⟩`. Hence
`⟨I_V(Φ₁), I_{V′}(Φ′₂)⟩ = c ⟨I_{V′}(Φ′₁), I_{V′}(Φ′₂)⟩`;
put `D = I_V(Φ) − c I_{V′}(Φ′)`, orthogonal to every `I_{V′}(Φ′₂)`, with `⟨D₁, D₂⟩ = ϰ ⟨I_{V′}(Φ′₁), I_{V′}(Φ′₂)⟩` for a
constant `ϰ`, so that the matrix coefficients of `D` are `ϰ` times those of `I_{V′}(Φ′)`. (4) The back-lift of `D` to
`U(V′)` is constant (6.8), hence equal to `⟨D, I_{V′}(Ψ)⟩/vol = 0`. (5) The back-lift to `U(V′)` is the lift of the
exchanged pair, with source `U(W)` and target `U(V′)` (0.1, 1.4); the Rallis inner product formula 3.2 for it
(Siegel–Weil with `s₀ = (a′ − N)/2 < 0`, constant `C = 1`, 3.1), applied in the irreducible module of (3), gives
`‖θ^*_{V′}(D, Ψ)‖² = ϰ · ‖θ^*_{V′}(I_{V′}(Φ′), Ψ)‖²` for every `Ψ`. The left side is `0` by (4), while the right side is
nonzero for `Ψ = Φ′`, the integral of `θ^*_{V′}(I_{V′}(Φ′), Φ′)` being `‖I_{V′}(Φ′)‖² ≠ 0` by (1); so `ϰ = 0`, `⟨D, D⟩ = 0`
and `D = 0`.

*Needs:* 0.1, 1.4, 2.1, 3.1, 3.2, 5.3, 6.1, 6.2, 6.3a, 6.8; ThetaKernelsForUnitaryDualPairs §3.47b; LFunctions Layer 7.

**Checks.**

- The two definite pairs have opposite signs `ε_v` (2.1, Check); with the sign of the pair `(V, W)` used for
  both, the occurrence condition for `(V′, W)` would read `κ_v ≥ N` and contradict `κ_v < −N`.
- For `κ_v > N` (the mirror range) the trivial type occurs for neither pair (2.1), and `I_V`, `I_{V′}` vanish
  identically.

### 6.11 The complementary-space identity

Prove: let `(V, V′, W)` be a complementary triple over a CM extension
`E/F` such that

1. *one signature*: `V_v` has signature `(a − p, p)` and `V′_v` signature `(q, a′ − q)` at every real
   place `v`, for fixed `p, q ≥ 0`;
2. *dimensions*: `a ≡ a′ (mod 2)`, `2(p + q) + 1 < ε₀` and `2(p + q) + 1 < a′`;
3. *infinity types*: `κ_v < −N` at every real place;
4. *local data*: the place conditions (P1)–(P4) of 6.1 (with `T` the finite set of (P3)).

Then matching data exist at every place (6.2), for the triple and for every smaller triple reached by removing
adapted planes. Choose `v₁ ∈ 𝒮` (6.8) outside `T`. Then `I_V(Φ)` converges for every test vector `Φ`; `I_{V′}(Φ′)` converges
for `Φ′ ∈ S′_{reg}` and extends to all test vectors, independently of `v₁` (6.3), and it is square-integrable when `q = 0`;
some `I_V(Φ)` and some `I_{V′}(Φ′)` are nonzero, and there is a unique `c` with `I_V(Φ) = c · I_{V′}(Φ′)` for every
matched pair `(Φ, Φ′)` of test vectors; `c ≠ 0`. Moreover `I_V(Φ)` is square-integrable on `[U(W)]` for every `Φ`: by
6.3 when `q ≥ 1` or `a′ > p`, and when `q = 0` by the identity, `Φ` having a partner `Φ′` (6.2) with `I_{V′}(Φ′)`
square-integrable. When `p = q = 0` this is 6.10.

What each hypothesis is used for: 1 by the induction, which removes hyperbolic planes globally (each
removal lowers the defect at every real place at once) and must end in the compact case 6.10; 2 by
Weil's criterion for `I_V` (`2p + a′ < a`, which follows from `ε₀ ≥ p + 2`), by the first range of the constant term of `I_V`
(`ε₀ ≥ 1 + p`, 6.4), by the square-integrability of `I_V` at every stage that removes a plane from `V′` (6.3: at the `j`-th
such stage, `j < q`, `p + q − j < a′ − 2j`, which is `a′ ≥ p + 2q` at the last one; 6.5 uses it there), by the
cuspidality and purity steps (cuspidality needs the gap `≥ 2` at every stage; purity at a stage of defect `(p′, q)` and gap
`ε′` needs `ε′ ≥ max(p′ + 1, 3)`, and the stages `(p − i, q, ε₀ − i)`, `i < p`, of the purity induction give
`ε₀ ≥ p + 2`), by the vanishing parts of 6.4 (`a′ ≥ 2q`), by the absolute convergence of the Tate integrals
(exponent at least `2`), by the extension of the theta integrals of `(V′, W₁)` at `v₁` (`ε₀ ≥ 2`, 6.3–6.4), by the
isotropy of the spaces from which planes are removed (`V′` keeps dimension `≥ 3` while `q ≥ 1`, from `a′ ≥ 2q + 2`;
`2p + 1 ≤ a`; 6.6), by the compact case at the bottom (`a′ − 2q ≥ 2`, 6.10) and by the constancy and vanishing of
back-lifts (`a, a′ ≥ 2`, `≥ 3` where a group is isotropic); 3 by the existence of matching data
(ThetaKernelsForUnitaryDualPairs §3.47b), by the multiplicity bounds at the real places (§5.7d(d)), by the archimedean cone
lemma (§5.7e, case (B):
`2ε₀ < |κ_v|`), by the nonvanishing of the `L`-values in 5.3 and 6.12, and by the archimedean vanishing of 6.3–6.4; 4 by
the existence and normalisation of matching data at the finite places (6.2), by the adapted planes (6.4), by the local
hypotheses of 5.3 (6.1), by the descent at the finite places (6.5: lattice vectors, the multiplicity bounds of §5.7d and
the zeta integrals at `T`), by 6.6 and by 6.12; the place `v₁` by 6.3 and 6.8. Under 4 every finite place of `F` is either
split in `E` or inert and unramified, of odd residue characteristic, with `ψ_v`, `α`, `β` and the lattices unramified there.

*Remark.* The stages of the route have been examined in the wider range `ε₀ ≥ p + 2`, `a′ ≥ 2q + max(p, 2)`, which is
not claimed here.

Route: strong induction on `p + q`, the base case being 6.10; the order is that of the constant-term
induction, with the constant defined through one part of the constant term only.

1. *Adapted planes.* If `q ≥ 1`, `V′` (indefinite at every real place, of dimension at least three)
   is isotropic (HermitianFormsAndLattices §3.5(b)) and splits off a hyperbolic plane adapted to the self-dual
   lattices, and so does `W`, whose lattice is unimodular for its skew-Hermitian form (HermitianFormsAndLattices §4.2(d),
   last sentence, and §§4.7(b), 4.7(c)); removing a plane from both gives a triple
   `G₁ = (V, V′₁, W₁)` with defect `(p, q − 1)`, satisfying 1–4 (its lattices are the orthogonal complements of the
   planes in `L′` and `M`). If `q = 0` and `p ≥ 1`, remove a plane from `V` and `W`, giving `(V₁, V′, W₁)` with defect
   `(p − 1, 0)`, likewise satisfying 1–4.
2. *The constant is fixed by one part* (`q ≥ 1`). By 6.4 the `β`-parts `fb`, `fb′` of the constant terms of
   `I_V(Φ)` and `I_{V′}(Φ′)` are theta integrals for `G₁`: `fb = C₀ · I_{V,W₁}(e₀Φ)` and
   `fb′ = C′₁ · I_{V′₁,W₁}(cone^∨ Φ′)`. By 6.5, whose hypothesis on `G₁` is the induction hypothesis (the statement proved
   by induction includes the nonvanishing of both theta integrals), `(c_β(G) e₀Φ, cone^∨ Φ′)` is matched for `G₁` when
   `(Φ, Φ′)` is matched, so the induction hypothesis gives `c_β(G) fb/C₀ = c(G₁) fb′/C′₁`, that is `fb = c · fb′` for all
   matched pairs with `c = C₀ c(G₁)/(C′₁ c_β(G)) ≠ 0`. Moreover `fb ≠ 0` for some `Φ`, because `e₀` is onto and
   `I_{V,W₁} ≠ 0` by the induction hypothesis; so some `I_V(Φ)` is nonzero.
3. *Endgame* (`q ≥ 1`). Put `f = I_V(Φ) − c · I_{V′}(Φ′) ∈ 𝒟`. Its constant term has two parts with
   distinct exponents, each separately invariant under the unipotent radical; by the archimedean
   Iwasawa decomposition and the stability of matching under `K_∞ × U(W)(𝔸_f)`, its `β`-part vanishes
   everywhere, so `f` is *pure* of law `α|t|^{a′/2}`. Pure elements vanish, by induction on `p`: for
   `p = 0` the `α`-part vanishes as well (6.4, vanishing parts), so `f` has zero constant term, is
   cuspidal (6.9), orthogonal to every `I_V(Ψ)` and `I_{V′}(Ψ′)` (6.8), and lies in their span, hence
   is `0` (6.7: rapid decay suffices); for `p ≥ 1` the restriction of the `α`-part to the Levi is an element
   of `𝒟(V₁, V′, W₁)` (by 6.4, with regular representatives of the `e′₀Φ′`; 6.9) which is pure by 6.9 (purity), hence `0` by
   induction, and `f` vanishes as before. Since `c ≠ 0` and every test vector has a partner (6.2), some `I_{V′}(Φ′)` is
   nonzero.
4. *The case `q = 0`, `p ≥ 1`.* Symmetric: the `α`-parts are `fa = C₁ · I_{V₁,W₁}(cone Φ)` and
   `fa′ = C′₀ · I_{V′,W₁}(e′₀Φ′)`; by 6.5 `(cone Φ, c_α(G) e′₀Φ′)` is matched for `(V₁, V′, W₁)`, so
   `fa = (C₁ c_α(G) c(G₁)/C′₀) fa′`; the `β`-part of the difference vanishes by 6.4 (vanishing parts), and the
   difference is `0` as in step 3. Some `I_{V′}(Φ′)` is nonzero by 6.6 (`q = 0`), hence some `I_V(Φ)` by the identity
   and a partner.
5. *All test vectors.* Steps 3–4 give the identity for matched pairs with `Φ′ ∈ S′_{reg}`. For a matched pair `(Φ, Φ′)` and
   `Φ′_{reg} ∈ S′_{reg}` with the same image as `Φ′` in the coinvariants at `v₁`, `(Φ, Φ′_{reg})` is matched (`p′_{v₁}`
   factors through them) and `I_{V′}(Φ′) = I_{V′}(Φ′_{reg})` (6.3), so the identity holds for every matched pair; this
   is the form in which the induction hypothesis enters 6.5.

*Needs:* 6.1–6.10; ThetaKernelsForUnitaryDualPairs §§3.47–3.47b, 5.7b, 5.7c, 5.7d, 5.7e and MetaplecticAutomorphicForms §§5.5, 6.15; AdelicAlgebraicGroups
§§3.1, 4.2; HermitianFormsAndLattices §§2.5, 3.1, 3.5, 4.2, 4.7; AutomorphicLFunctionsAndLocalFactors AL.1;
AnalyticNumberTheoryPartI §2.3a; LFunctions Layer 7.

**Checks.**

- *Hypothesis 4 can hold.* `F = ℚ(√69, √37)`, `E = F(√−3)`, CM of degree `8`. `E/F` is unramified at every finite place: at
  the places above `3`, `F_v = ℚ_3(√69) = ℚ_3(√−3)` (`−23` is a `3`-adic square and `37` is one), so `√−3 ∈ F_v`;
  elsewhere `−3` is a unit and `ℚ_2(√−3)/ℚ_2` is unramified. The dyadic places (`2` is inert in `ℚ(√69)` and in
  `ℚ(√37)`, so they have residue field `𝔽_4`, which contains `√−3`) and the places dividing the different (above `3`,
  `23`, `37`, with `√−3 ∈ F_v`, residue field `𝔽_{23²}`, residue field `𝔽_{37²}`) all split in `E`. Take
  `V = ⟨1, …, 1, −1⟩` of dimension `12` (`p = 1`), `V′ = ⟨−1, −1, −1, −1⟩` (`q = 0`), `δ = √−3`, `W` the
  space `V ⊕ V′(−1)` with the skew-Hermitian form `δ` times its Hermitian form, `β = 1`, and `α` unramified at every finite
  place, trivial on `𝔸_F^×`, of infinity type `−18` at every real place (it exists: `(z/z̄)^{−9}` is trivial at the infinite
  components of the elements of `E^×` whose ideals come from `F`, for these satisfy `x/x̄ ∈ μ_6` and
  `ζ^{−9} = ζ^{−3} = ±1` at each of the four real places). Then 1–4 hold with `ε₀ = 4`, `a′ = 4`, `κ_v = −18 < −16`,
  `T = ∅`, the lattices `O_E^{12}`, `O_E^4` and, at the inert places, where `√−3` is a unit, `O_E^{16}` (the places
  where `ψ_v` is ramified, above `3`, `23`, `37`, split in `E`, so 5.3's local hypotheses hold there by its first
  bullet, as 6.1 says in general). The induction has
  one step, a plane removed from `V`, down to the definite triple `(V₁, V′, W₁)` with `ε₀ = 3` and `|κ_v| = 18 > 14`.
- `F = ℚ` admits no triple satisfying 4: every quadratic extension of `ℚ` ramifies at some prime.
- A unit condition on `δ` at every finite place would force `E = F(√−ε)` for a totally positive unit `ε` of `F` (then `δ`
  is a global unit with `δ² = −N_{E/F}(δ)`); for `F = ℚ(√5)` the totally positive units are squares and `E = F(i)` ramifies
  above `2`. Hypothesis 4 asks nothing of `δ`.

### 6.12 Tower recursion of the constant

Prove: in 6.11 (with its hypotheses 1–4, in particular `2(p + q) + 1 < ε₀` and `2(p + q) + 1 < a′`), with the matching data of every triple
normalised as in 6.2 (at the places of `T` in bases chosen compatibly for a triple and the smaller one), write `c(G)` for
the constant of the triple `G`, and `𝔟`, `𝔠`, `L^T`, `ν^T` as in 6.5; `𝔠` is the ideal of the lattice `M^ψ` of 6.4, self-dual
for `ψ_v ∘ Tr ∘ ⟨·,·⟩_W` at every finite place (at a split place `v` where `ψ_v` is ramified it is `λ_v` times the ideal
of the unimodular `M`). At a split place `v = ww̄` outside `T` the multiples `(ϖ_w^k, ϖ_{w̄}^{−k})·M_v` of a lattice
self-dual for `ψ_v ∘ Tr ∘ ⟨·,·⟩_W` are again self-dual (and other self-dual lattices exist, outside this family, 6.1),
for `M` as well as for `M^ψ`; within the family, replacing `λ_v` by `λ_v·(ϖ_w^k, ϖ_{w̄}^{−k})` multiplies `ν^T(𝔠)` by
`ν_w(ϖ_w)^kν_{w̄}(ϖ_{w̄})^{−k} = ν_w(ϖ_w)^{2k}` (`ν` is trivial on `F_v^×`), so the formula is to be read with the lattices
whose lattice vectors normalise the matching data. Fix the spaces, the lattices, the planes, `ψ`, the set `T`, the bases at
the places of `T` (with the Haar measures of 6.2 and 6.5 there), the infinity types of `α` and `β`, and the local matching
data at the real places (ThetaKernelsForUnitaryDualPairs §3.47b). Then there is a constant `C ≠ 0` (`C = C₁C_α/C′₀` for the
first step and `C′₁C_β/C₀` for the second, with the constants of 6.4 and 6.5), the same for all pairs `(α, β)` with
these infinity types satisfying the hypotheses of 6.11 with this `T`, such that:

- removing a plane from `V` and `W` when `q = 0`:
  `c(G) = C · ν^T(𝔟𝔠) · c_T(G) · L^{T}(ε₀, ν) · c(G₁)`;
- removing a plane from `V′` and `W`:
  `c(G₁) = C · ν^T(𝔟𝔠)⁻¹ · c_T(G) · L^{T}(ε₀ + 1, ν) · c(G)`,

where `c_T(G)`, the constant of the step at `T` for the chosen data, is the product over `v ∈ T` of the local constants
`c_v ≠ 0` of 6.5 for that step (defined through `cone^∨` and `e₀` when the plane is removed from `V′`, through `cone`
and `e′₀` when it is removed from `V`; a change of the integral bases at `T` multiplies it by an element of
`∏_{v∈T} ν_v(O_{E_v}^×)`). When the bases at `T` are placed as in 6.5,
`c_T(G) = ∏_{v ∈ T} ν_w(−1)·N v^{−f_v n}·ν_w(ϖ_v)^{f_v}·G(ψ_v, ν_w)`, with
`f_v` the conductor exponent of `ν_w` at `v` (the `c` of 6.5) and `n = −ε₀` for a plane removed from `V′`, `n = 1 − ε₀`
for a plane removed from `V` (6.5). The `L`-values are
finite and nonzero: `ε₀ ≥ 2` places them in the region of absolute convergence (the Euler factors of `ν` at `T` are `1`,
`ν_v` being ramified there). The identity determines `c(G)/c(G₁)` up to `C` and the constant at `T`.

Route: steps 2 and 4 of 6.11 give `c(G₁) = (C′₁/C₀) c_β(G) c(G)` (plane removed from `V′`) and
`c(G) = (C₁/C′₀) c_α(G) c(G₁)` (plane removed from `V`), with `c_β(G)`, `c_α(G)` the products of the local constants of 6.5:
outside `T` and the real places they are `ν^T(𝔟𝔠)^{∓1}L^T(z, ν)`, `z = ε₀ + 1` or `ε₀`, times powers of the residue
cardinalities fixed by the ideals (the codifferent factors drop out because `ν` is trivial on `𝔸_F^×`), at `T` they are
`c_T(G)`, and at the real places they depend only on the archimedean data. Since the matching data are normalised at every
finite place (by the lattice vectors outside `T`, by the zeta integrals in the chosen bases at `T`, 6.2) and fixed at
the real places, and the extended `I_{V′}` does not depend on `v₁` (6.3), `c(G)` is a well-defined number, and the local
constants of 6.5 outside `T` and the real places depend on `α`, `β` only through the displayed factors. The identities
above use only that `c_T(G)` is nonzero; its value is that of 6.5.

*Needs:* 6.2, 6.4, 6.5, 6.11; AutomorphicLFunctionsAndLocalFactors AL.1; HermitianFormsAndLattices §4.7;
ThetaKernelsForUnitaryDualPairs §3.47.

**Checks.**

- The exponents of the Tate integrals are `ε₀ ≥ 2` and `ε₀ + 1 ≥ 3`: the integrals converge absolutely
  and the `L`-values are Euler products of nonzero factors.
- The characters enter only through `ν^T(𝔟𝔠)^{±1}`, the constant at `T` and `L^T(·, ν)`: replacing `(α, β)` by
  `(αμ, βμ)` with `μ|_{𝔸_F^×} = 1`, `μ` of trivial infinity type and unramified outside `T`, leaves `ν`, hence `ν^T(𝔟𝔠)`
  and `L^T(·, ν)`, unchanged.
- The bases at `T` are needed: replacing the matrix `Y₀ = [0 | 1_{a′}]` of the zeta integral `p′_v`, `v ∈ T`, by `g₀Y₀`
  multiplies `p′_v` by `ν_w(det g₀)⁻¹|det g₀|^{−N/2}` (ThetaKernelsForUnitaryDualPairs §3.47) and `c(G)` by the same factor
  (`(Φ, Φ′)` is matched for the new data exactly when `(Φ, λΦ′)` is matched for the old, `λ` that factor), which depends
  on `ν`; without a fixed choice the constant at `T`, and the statement that `C` is the same for all `(α, β)`, would
  have no meaning.

### Examples

For `p = q = 0` at every real place, `V` is positive definite, `V′` negative definite and `W` definite, and all three groups are compact at infinity (6.1); the two definite pairs then have opposite signs `ε_v` (6.10). Over `F = ℚ(√69, √37)` and `E = F(√−3)`, the spaces `V = ⟨1, …, 1, −1⟩` of dimension `12` (`p = 1`) and `V′ = ⟨−1, −1, −1, −1⟩` (`q = 0`), with `δ = √−3`, `β = 1` and `α` unramified at every finite place, trivial on `𝔸_F^×` and of infinity type `−18` at the four real places, satisfy hypotheses 1–4 of 6.11 with `ε₀ = 4`, `a′ = 4`, `κ_v = −18 < −16` and `T = ∅`; the induction has one step, down to a definite triple with `ε₀ = 3` (6.11). In the smallest case at a place of `T`, with `V′` and `W` hyperbolic planes, the constant of the step carries the sign `ν_w(−1)`, which exchanging the two rows of the marked block removes (6.5).

### Dependencies

Layers 0–5; ThetaKernelsForUnitaryDualPairs §§3.45, 3.47–3.47c, 4.4a, 5.7a–5.7e; MetaplecticAutomorphicForms §§0.15, 3.2a, 5.5, 6.4, 6.10, 6.15; HermitianFormsAndLattices §§0.2, 1.1, 1.2, 2.5, 3.1, 3.5, 4.2, 4.7; AutomorphicFormsOnReductiveGroups §§4.1, 4.2, 4.3; AdelicAlgebraicGroups §§3.1, 3.4, 3.5, 4.2; AutomorphicLFunctionsAndLocalFactors AL.1; AnalyticNumberTheoryPartI §2.3a; LFunctions Layer 7.

## Downstream consumers

The theta-chain roadmaps of the family (ThetaChainsOnDefiniteUnitaryGroups, LocalGainOfThetaChains,
RowTowerAndRallisIdentities, SeesawForThetaChains, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and
GluedTargetAndDivisionInequality) compose the class-set lifts of Layer 1 along towers of totally
definite spaces, whose steps are homomorphism pairs (0.1; their dictionary, Weil representation and theta functions
are 2.5), can express their chain kernels through the Fock pairings of 1.7 with the `L²`-normalised theta
functions of 1.8–1.9, and use the adjoints, the integrality statement 1.6 with its Minkowski denominator, the weight
and Satake dictionaries of Layer 2 and the Rallis formula and its operator form (3.2–3.3). The comparison of the
sections of 1.8–1.9 with arithmetically normalised CM theta functions, on which a `p`-adic analysis of the kernels
rests, is not a statement of this roadmap: 1.9 identifies them only up to a unit `u` and through their `L²` norms. Their
Galois-theoretic part uses the existence theorem 4.3 and the base change shape of 2.4 (for its steps, 2.5(e)). The
constants attached to pairs of complementary spaces that enter their choice of auxiliary primes come from Layer 6: the
identity 6.11 and the recursion 6.12, under their hypotheses 1–4 (one signature, the dimension inequalities, the
infinity types and the place conditions of 6.1), with no further hypothesis in any defect; the recursion carries, at the
places of `T`, the constants of the steps for the chosen bases (6.2, 6.12), whose value is 6.5's Gauss-sum formula.
PotentialAutomorphyInfrastructurePartII and CompletedCohomologyAndLocalGlobalCompatibility may use 2.2 and
4.3 to produce algebraic modular forms with prescribed local behaviour on their definite unitary groups.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns statements about one theta lift between unitary groups that are compact at every
archimedean place: the lift and its adjoint as class-set operators and their integrality with an
explicit denominator; the identification of the kernel with theta functions of CM abelian varieties; the
archimedean weights and the Hecke and Satake dictionaries of such a lift; the identification of the
constituents of a lift; the Rallis inner product formula for such a pair in every range, its operator form
and its consequences for injectivity, nonvanishing and existence in large dimension; the lift of the
trivial representation and its norm, and the genus theta series of a definite lattice as the theta integral
of its lattice vector on the quasi-split `U(k, k)`, with its Siegel–Weil comparison. Its last layer
concerns a pair of complementary Hermitian spaces in a skew-Hermitian space that is not split and has small
signature defect: the convergence, invariant extension, square-integrability and factorisation of their theta
integrals, the descent of matching along hyperbolic planes, and the global identity between their theta integrals,
proved by induction from the case where all groups are compact at infinity, with the recursion of its constant. The
global statements of that layer rest on the definite theory of Layers 3 and 5 (the base case and the nonvanishing at the
bottom of the tower) and on the lattices and adapted planes of HermitianFormsAndLattices; their local and
constant-term ingredients are general theta theory and are targets of ThetaKernelsForUnitaryDualPairs.

Boundaries:

- [MetaplecticAutomorphicForms](../../MetaplecticAutomorphicForms/README.md) and, for the statements that this family adds
  to it, [ThetaKernelsForUnitaryDualPairs](../ThetaKernelsForUnitaryDualPairs/README.md) own all theta theory that does not use compactness at infinity: Weil
  representations of unitary pairs locally and globally, the Fock model and the correspondence for
  compact dual pairs `(U(n), U(p, q))`, the unramified correspondence, local persistence and bump
  vectors, the local theta correspondence for complementary data (local matching, irreducibility at the good split
  places, the local multiplicity bounds along an isotropic line, and the local lemmas at a
  split place), theta kernels and global lifts, Weil's convergence criterion and its regularised form,
  constant terms of theta integrals along an isotropic line with the cone maps and the archimedean cone lemma, the
  Siegel–Weil formulas, doubling integrals, and the Rallis inner product formula for arbitrary unitary pairs (GQT's
  range, Weil's convergent range, and every range for an anisotropic target, with the `L`-value taken by continuation).
  Of these, ThetaKernelsForUnitaryDualPairs holds the global Weil representation of a unitary pair, the Fock model and the
  correspondence for compact dual pairs, the unramified correspondence, local persistence and bump vectors, the local
  theta correspondence for complementary data, Weil's convergence criterion and its regularised form, the constant terms
  along an isotropic line with the cone maps and the archimedean cone lemma, the Siegel–Weil formula in Weil's convergent
  range, and the Rallis inner product formula in Weil's convergent range and for an anisotropic target.
  When `W` is split, the complementary-space phenomenon is the regularised second-term identity of
  MetaplecticAutomorphicForms §6.6, which this roadmap does not restate.
- [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md) owns Hermitian spaces, lattices, adapted hyperbolic planes, genera, class
  sets, masses, the Tamagawa number, the mass formula, Siegel's main theorem and the Hermitian theta series
  of lattices as classical functions on `ℋ_k^Φ`; it depends neither on MetaplecticAutomorphicForms nor on this
  roadmap. The realisation of those theta series as theta integrals of lattice vectors and their comparison
  with Siegel Eisenstein series are 5.4 here.
- [AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md) owns algebraic modular forms on
  any group compact at infinity: the carrier, class-set evaluation and Hecke operators;
  [DiscreteSeriesCoefficientsAndAutomorphicMetrics](../DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md) owns the
  class-set integration formula and inner product, kernel operators between class sets with their adjoints and
  integrality, and the dimension formula. PotentialAutomorphyInfrastructurePartII Layer 3 and
  CompletedCohomologyAndLocalGlobalCompatibility §0.7 own the definite unitary group of a CM field
  quasi-split at finite places, its integral Hecke algebras, base change, Galois representations and
  Hida theory; this roadmap acts on their forms.
- [AutomorphicLFunctionsAndLocalFactorsPartII](../../AutomorphicLFunctionsAndLocalFactorsPartII/README.md) owns the
  standard `L`-functions of unitary groups; [LocalFactorsOfTwistsAndTypes](../LocalFactorsOfTwistsAndTypes/README.md) owns
  their factorisation for one-dimensional representations and their absolute convergence from the bound on Satake
  parameters of unitary representations.
- The theta-chain roadmaps of this family, from ThetaChainsOnDefiniteUnitaryGroups to ThetaChainsAndFrobeniusPrimeSums,
  own every statement about chains of lifts: iterated lifts and
  their levels, norms and integrality, seesaw identities across a chain, Bessel and Fourier–Jacobi
  pairings of iterated lifts, `p`-adic divisibility of lifts, congruence modules and division.
- The identification of the adelic theta kernel with Fock pairings with theta functions of CM abelian
  varieties is owned here (1.7–1.9). Theta functions of polarised complex tori are those of
  AbelianSchemesAndArithmeticModuli A5; the scalar theta functions of CM elliptic curves with their
  arithmetic and integral structures, the algebraicity and integrality of the period-normalised values of
  their derivatives, and their `p`-adic behaviour belong to the roadmaps that own CM periods and CM theta
  functions (NonordinaryCMSpecialValues, ComplexMultiplicationAndExplicitReciprocityPartII); 1.6 takes the
  integrality of the kernel as a hypothesis.
- LevelOneAutomorphicFormsForClassicalGroups owns the level-one orthogonal theta maps between
  definite lattices; GanGrossPrasadUnitaryGroups owns Bessel periods and their behaviour under
  theta lifts.

## Exact supplier contracts

### From TauCetiRoadmap.MetaplecticAutomorphicForms

- §0.1: the Heisenberg group and its law (lifts of self-dual lattices, 0.3, 1.8); §0.15: the Schrödinger model
  `ρ(x + y, t)φ(u) = ψ(t + B(u, y) + ½B(x, y))φ(u + x)` on a Lagrangian `X` with complement `Y` (6.5, the constant at `T`).
- §1.1: smooth Stone–von Neumann (uniqueness of the line fixed by a lifted self-dual compact open
  subgroup, used for the lattice vectors of 0.3 and 1.8).
- §2.6a: the local compact splitting at good places and the lattice vector it fixes.
- §2.7: change of character and the contragredient Weil representation.
- §3.2a: split étale Hermitian spaces, `U(V)(F_v) ≅ GL(A)` at split places, the pairing
  `h((x, ℓ), (y, k)) = (ℓ(y), εk(x))` on `A ⊕ A^∨`, and the type-II model.
- §3.3: unitary dual-pair splittings from `(χ_V, χ_W)` with the restriction conditions, character
  change (`unitarySplitting_character_change`) and independence of `δ`.
- §3.3b: the Hermitian oscillator normalisations of the Weil operators on a Siegel parabolic subgroup (in the
  left-action form of ThetaKernelsForUnitaryDualPairs §3.3b).
- §§3.4–3.7: big and small theta modules, finite length and Howe duality (nonarchimedean, and the
  archimedean form in the Casselman–Wallach category).
- §3.14: Mínguez's explicit type-II correspondence, with the unequal-rank parameter formula.
- §4.1, §4.5: the unramified compact splittings at the good places, and the adelic Weil representation.
- §§5.1, 5.2, 5.5, 5.6: theta kernel, smoothness and growth, constant terms, global theta lift.
- §§6.1, 6.2, 6.4: measures (`τ(U) = 2` in positive dimension, `τ(U(0)) = 1`), Siegel–Weil sections, the anisotropic
  Siegel–Weil formula `E(s₀) = c τ(H)/[E:F] · I`, `c = 1` for `s₀ > 0` and `c = 2` for `s₀ ≤ 0`.
- §6.6: the regularised second-term identity (boundary of Layer 6).
- §§6.10, 6.10a, 6.11, 6.12: the doubling Schwartz map with `δ(φ₁ ⊗ φ̄₂)(0) = ⟨φ₁, φ₂⟩` and its
  equivariance, standard doubling factors and denominators `d_v`, local doubling zeta integrals with
  the unramified value `L_v/d_v` and the normalised `Z_v^*` (3.2, 5.2, 5.3), and the
  unfolding of doubled theta pairings.
- §6.13: GQT's Rallis inner product formula (comparison in 3.2).
- §6.15: global seesaw.

### From ThetaKernelsForUnitaryDualPairs, a sub-roadmap of this family

- §3.3b, the clauses added to MetaplecticAutomorphicForms §3.3b: the left-action form of the Siegel-parabolic normalisation,
  `ω(m(A))φ(x) = χ_V(det A)⁻¹|det A|^{n/2}φ(xA)`, `ω(n(B))φ(x) = ψ(tr(BT_x))φ(x)`, with its dictionary to matrices acting on
  columns, the Levi character `χ_V(det(h|_Y))` (`χ̃_V(det h)` for even `n`, and at the places split in `E` for every `n`)
  (Conventions, 5.4, and through §5.7c the laws of 6.4), and the compatibility of the splittings (into the scalar
  covers) with orthogonal sums: (a) the other member
  decomposed, the characters multiplying (through §5.7c the splitting of `U(X)` for `W = ⟨x, y⟩ ⊥ W₁`); (b) the group's own
  space decomposed, the same character on both factors (through §5.7c(L)); stated
  with route not given here (Kudla's construction), the case of split pieces derived from the Levi formula.
- §3.9a: unitary persistence, the stable range, and (iii) bump vectors: if `W_v` contains an
  isotropic subspace of dimension `dim V_v` (or `v` splits and `dim W ≥ dim V`), then for every open
  neighbourhood `H` of `1` in `U(V)(F_v)` there is `φ_v` whose matrix coefficient `⟨ω_v(g)φ_v, φ_v⟩` is
  nonnegative, supported in `H` and equal to `‖φ_v‖²` on an open subgroup.
- §3.21a: the unramified unitary correspondence: generation of the `K × K′`-fixed vectors by the
  lattice vector, the homomorphism `ξ` of spherical Hecke algebras with `ω(1, T)φ = ω(ξ(T)^∨, 1)φ`, and
  the Satake relation: if `Hom(ω, π ⊗ π′) ≠ 0` and `π` has parameter `α`, then `π′` has parameter
  `(cα, segment)`; inert (odd residue characteristic, `ψ` unramified) and split (any residue characteristic and any
  conductor of `ψ`, with the type-II lattice vector `1_{M_{n×d}(O)}`).
- §3.45: the Fock model at a real place for `B(x, Jx) > 0` and `ψ_ℝ(x) = e^{2πix}`, the Bargmann transform,
  the infinitesimal Weil representation, the polynomial Fock space as the `K`-finite vectors with `k ∈ U(W, J)~`
  acting by `G ↦ det_J(k)^{−1/2}·G ∘ k⁻¹` (so `exp(θJ)` acts on degree `k` by `e^{−i(k + N/2)θ}`), dense in the Schwartz
  space (6.5), and (iv) the Bargmann transform of a tempered distribution with `T(B⁻¹G) = ⟨ϑ_T, G⟩_𝓕` and the Fock
  pairing of a polynomial as a jet.
- §3.46: the correspondence for compact dual pairs; (iii) for `(U(n), U(d))` both compact, the
  decomposition of the polynomial Fock space by `(GL_n, GL_d)`-duality for each sign `ε = −sgn(V)sgn(W^♭)`
  (`J = −ε·i`), with the determinant twists `a = (d + εm_W)/2`, `b = (n + εm_V)/2`.
- §§3.47–3.47c: local complementary data and their theta quotients; local matching data (`Π` irreducible, the kernels
  of `p`, `p′` the unique maximal proper submodules of `Θ`, `Θ′`); local matching at split places (for `α`, `β` unramified
  and any `ψ` and residue characteristic, with `Θ`, `Θ′` nonzero and the lattice vectors spanning the spherical lines, and
  when `ν` is ramified and `ψ` unramified by the Godement–Jacquet zeta integrals `P` on `S(R ⊗ Q)` (with `β_w(det h)`) and
  `P′` on `S(R′^∨ ⊗ Q^∨)` (with `α_w(det h)`), `X₀ = [1_a | 0]`, `Y₀ = [0 | 1_{a′}]` in a basis of `Q` and its dual
  basis, Haar measures with `vol(GL_a(𝒪)) = vol(GL_{a′}(𝒪)) = 1`, both isomorphisms onto `α_w ∘ det_a × β_w ∘ det_{a′}`,
  matched pairs `P(Φ) = P′(Φ′)`), with the irreducibility `Θ = Θ′ = Π` when `ν`
  is ramified or `ν(ϖ) ≠ 1` (the full-rank coinvariants mapping isomorphically onto `Θ`, `Θ′`), the values of §5.7c(d) for a
  lattice of `W` self-dual for `ψ ∘ Tr ∘ ⟨·,·⟩_W` and every conductor of `ψ` at a split place, and the dependence of the
  zeta integrals on `Y₀`, `X₀` and the bases (with the moduli `|det|` for general
  changes; factors in `ν(O_E^×)` for integral bases, the measures fixed; 6.2, 6.12); local matching at unramified inert
  places of odd residue characteristic for `a + a′` even, with `Θ`, `Θ′` nonzero, lattices `L`, `L′`, `M` and no
  compatibility between them; at real places, for `a′ ≥ 1` and `−κ > |P − Q| + |P′ − Q′|` (in particular
  `κ < −(a + a′)`), the `K_W`-spectrum of the quotients, the matched type `La`, uniqueness of the quotients and their
  isomorphism (through the Casimir gap), and, for `κ ≤ −(a + a′)`, their identification with `A_𝔮(λ)`; the three local
  lemmas at a split place.
- §4.4a: the global splitting of `U(V)(𝔸) × U(W)(𝔸)` into the adelic scalar cover (the
  push-out of the metaplectic double cover along `μ₂ ⊂ ℂ^1`), equal to the rational splitting on rational points, and the
  global Weil representation `ω_{ψ, χ_V, χ_W}` of a unitary pair, unitary and strongly continuous; its normalisation on a
  Siegel parabolic subgroup at every place (§3.3b), the split-place law of `φ ↦ φ(0)` in the type-II model
  (`r · χ̃_W(det g)χ̃_V(det h)`, `r > 0`, `det g` and `det h` the determinants of the isometries of `V` and `W`; for the
  homomorphism pair, with `det g` taken on `X₁`, this reads `r · χ̃_W(det g)⁻¹χ̃_V(det h)`, 2.5(f)), and the
  characterisation of `ω_{ψ, χ_V, χ_W}` by five properties: Heisenberg
  covariance, invariance of the theta functional, unitarity, the split-place law and continuity of the orbit maps into
  `L²` (Conventions, 2.5, 5.4).
- §5.7a: Weil's convergence criterion for theta integrals of unitary pairs with arbitrary `W`, for the absolute theta
  sum on a Siegel domain in a model adapted to a maximal isotropic subspace of `W`, with bounds that are continuous
  seminorms of the archimedean component; the matrix-coefficient majorant (6.3): for `M_{Φ₁,Φ₂}(w) = ⟨ρ(w)Φ₁, Φ₂⟩`,
  `|θ(g, h; Φ₁)|·|θ(g, h; Φ₂)| ≤ c·Σ_{ξ ∈ 𝕎(F)} |M_{Φ₁,Φ₂}((g, h)⁻¹ξ)|`,
  `|M_{f₁⊗φ₁, f₂⊗φ₂}(w)| ≤ p(f₁)p(f₂)(1 + ‖w_∞‖)^{−N}1_C(w_f)`
  for a continuous seminorm `p` and a compact `C` depending on `φ₁`, `φ₂`, `N`, and the vanishing of `M_{Φ,Φ(−·)}` off the
  points whose component at a split place has full rank when `Φ` is supported there near one matrix of full rank;
  §5.7b: regularised convergence for full-rank support at a split place (rapid decay of the absolute sum in the model
  adapted to a maximal isotropic subspace of `X`, hence of the theta kernel in every model; with the same continuity),
  the vanishing of the coinvariants of the strata of lower rank, archimedean vanishing, and (iv) the invariant extension
  of the theta integral from full-rank data when the full-rank coinvariants are irreducible (6.3).
- §5.7c: constant terms of theta integrals along an isotropic line: the map `e₀`, the cone `cone_{μ,z}` and the dual cone
  `cone^∨_{μ,z}` (Tate integrals over Heisenberg translates of the point of evaluation, and the same after a Fourier
  transform along the line), for a compact `K_X` with the Iwasawa decomposition `U(X)(F_v) = P′(F_v)K_{X,v}` at every place
  (at a finite place where `E_v/F_v` is unramified or split, the stabiliser of a self-dual lattice to which `u₀` is adapted;
  6.4), the unfolding along the orbit of the isotropic line, (L) their laws under the Levi elements, (a) convergence and
  Tate's functional equation between them, (b) invariance under `U(X)(F_v)` at the unfolding parameters, (c) continuity
  and preservation of polynomial Fock vectors at real places, (d) unramified values (and `e₀` on lattice vectors), (i)
  the constant term in the first range, with the cone `cone_{ν, ε₀}` for `(V, W)`, (ii) the constant term in the second
  range on full-rank data at `v₁`, with the dual cone `cone^∨_{ν, ε₀+1}` for `(V′, W)` (absolutely convergent; the dual
  cone keeps full-rank data) and the first part the invariant extension of the theta integral of `(V′, W₁)` (a
  regularised integral), and (iii) persistence of nonvanishing when a hyperbolic plane is added.
- §5.7d: local multiplicity bounds along an adapted line: the reduction (R); the descent conclusion `A = c·B` at every
  split place ((a) `ν` ramified, `ψ` unramified; (b) `α`, `β` unramified, any `ν`, `ψ` and residue characteristic, with
  `c` the ratio of the multiple of `e₀` to the value of the dual cone on the lattice vectors); at unramified inert
  places (c) and at real places (d), `dim Hom_{P_x}(X, Π₁ ⊗ χ) ≤ 1` for `X = Θ, Θ′, Π`, with `A ≠ 0` (and `B ≠ 0` at
  inert places).
- §5.7e: the archimedean cone lemma: no nonzero continuous `K_{X₁}`-invariant functional kills the cone (case (A), the
  pair `(V, W)`) or the dual cone (case (B), the pair `(V′, W)`, for `2ε₀ < |κ|`) (6.5).
- §6.4a and its corollary: the formula in Weil's convergent range and the Fourier coefficients of theta integrals of indefinite
  Hermitian spaces on `U(k, k)` (cited in 5.4).
- §6.11, the clauses added to MetaplecticAutomorphicForms §6.11: the unramified doubling integral at inert and split
  places with its region of absolute convergence, `Re s > (n − 2)/2` for unitary local components (3.2, 5.3).
- §6.13a: the Rallis inner product formula in Weil's convergent range and, for an anisotropic target, in every
  range (3.2).

### From HermitianFormsAndLattices, a sub-roadmap of this family

- Conventions and 1.0: sesquilinearity (conjugate-linear in the first variable), totally definite and
  totally positive definite spaces, invariants of skew-Hermitian spaces through `δ⁻¹W`; the lattice notions of a
  skew-Hermitian `W` are those of its own form `w`, and "primitive" is as there (at a split place, both components).
- 0.1: the unitary group scheme of a Hermitian space; 4.6: the integral models of lattice stabilisers.
- 0.2: `SU(V)` simply connected, `U(V) → U(1)` with kernel `SU(V)`.
- 1.1–1.2: Witt's theorem, hyperbolic planes and the Witt index.
- 2.3, 2.4: split places (Witt index `⌊n/2⌋`); Witt index and anisotropic kernel at a nonsplit finite place.
- 2.5: compactness at a real place iff definiteness, compactness of `U(V)(F ⊗ ℝ)` for totally definite
  `V` (sign depending on the place), strong approximation for `SU(V)`.
- 3.1: Hermitian spaces that are isometric at every place are isometric; 3.5(b): a space of dimension at
  least three that is indefinite at every real place is isotropic.
- 4.2, 4.5: unimodular lattices over unramified extensions, and (4.2(d)) the local splitting of a
  hyperbolic plane off a unimodular lattice at a primitive isotropic vector ("primitive" as in the Conventions), with its
  last sentence for a skew-Hermitian lattice unimodular for `w`; stabilisers of lattices are
  compact open and (4.5(c)) every compact open `K ⊂ U(V)(𝔸_f)` lies in some `K_L`.
- 4.7(b): a lattice unimodular at every finite place and an isotropic vector `x` with `L ∩ Ex = 𝔟x` give an
  isotropic `y` with `h(x, y) = 1` and `L = (𝔟x ⊕ 𝔟̄⁻¹y) ⊥ (L ∩ ⟨x, y⟩^⊥)` (no dyadic place ramified in `E`); 4.7(c): the
  same for a skew-Hermitian `(W, w)` and lattices unimodular for `w`, with `w(x, y) = 1`.
- 5.1, 5.2: genus and class set, `Cl(K_L) ↔` classes in the genus, finiteness, finiteness of `U(L)`
  for totally definite `V`, and (5.2(c)) `|U(L)|` divides `minkowskiBound(n[E : ℚ])`.
- 5.5: the mass `Σ |U(L′)|⁻¹` and its expression as a volume quotient.
- 6.0b: `τ(U(V)) = 2`; 7.1: Hermitian theta series `θ_L^{(k)}` on `ℋ_k^Φ`, with (d) the dual `L^# = 𝔇_{E/ℚ}⁻¹L^∨` for
  `Tr_{E/ℚ} ∘ h`; 7.2: the Fourier coefficients of the genus average are products of local densities (used in 5.4).

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §7.4: the carrier `S(J, M)` in the level model and in Gross's rational model with their conversion,
  evaluation and reconstruction on class representatives, restriction, trace and Hecke operators.
- §7.5: finite stabilisers, `S(J, M) ≃ ⊕_i M^{Γ_i}`, and the automorphic realisation
  `automorphicEquiv`.
- §4.2: rapid decay of cuspidal functions; §4.1: constant terms; §4.3: the Fourier expansion of
  cuspidal functions on `GL_n` along the maximal unipotent subgroup (Piatetski-Shapiro, Shalika) and
  Whittaker coefficients.

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

- §7.5a: the class-set integration formula `∫_{[G]} F = vol(G_∞J) Σ_i |Γ_i|⁻¹ F(t_i)` for right
  `G_∞J`-invariant `F` (`G_∞` compact), the class-set inner product and its comparison with the Petersson
  product, and `mass(J)`.
- §7.5b: kernel operators between class sets in both models: definition, independence of
  representatives, adjoint, composition, and integrality with denominator `lcm |Γ_i|`.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

- §6.29: Labesse's weak base change for unitary groups over CM fields (used in 2.4, 4.3).

### From BaseChangeAndGaloisRepresentationsForUnitaryGroups, a sub-roadmap of this family

- §6.3a: for every quadratic extension `E/F` of number fields, `κ ∈ ℤ` and integers `m_v ≡ κ (mod 2)`
  at the real places of `F` inert in `E`, a unitary Hecke character `χ` of `E` with
  `χ|_{𝔸_F^×} = η^κ` and infinity types `m_v`, unramified at any given finite set of split places.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII

- §3.4: the partial standard function of the doubling method is `L^S_E(z, BC(π^∨) ⊗ χ⁻¹)`, with its
  meromorphic continuation.

### From LocalFactorsOfTwistsAndTypes, a sub-roadmap of this family

- §7.1: for a unitary character `μ` of `U(1)(F)\U(1)(𝔸)` and the one-dimensional representation
  `μ ∘ det` of `U(V)`, `L^S(z, BC(μ ∘ det) ⊗ χ) = ∏_{i=1}^{n} L_E^S(z + (n + 1)/2 − i, μ̃ χ)`, where
  `μ̃(x) = μ(x/x̄)`.
- §7.2: an irreducible unitary unramified representation of `GL_n(E_w)` (case (i)), or of `U(V_v)` at an inert place with a
  vector fixed by the stabiliser of a self-dual lattice (base-change parameter; case (ii)), has
  `q_w^{−(n−1)/2} ≤ |α_i| ≤ q_w^{(n−1)/2}`, `q_w` the residue cardinality of `E_w`; hence `L^S_E(z, BC(π) ⊗ χ)` converges
  absolutely for `Re z > (n + 1)/2` (3.3).
- §3.4: a bounded zonal spherical function of `GL_n(K)` or of the
  unramified unitary group has Satake parameters with `Q^{−(n−1)/2} ≤ |α_i| ≤ Q^{(n−1)/2}`, `Q` the residue cardinality (of
  `E` in the unitary case), proved through §3.1 and, for the unitary group, the doubling series of §3.3 (3.3, through §7.2).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- §§SR.4.1–SR.4.4 (Satake transforms and parameters for `GL_n` and unramified unitary groups).

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

- A5.1 (lattice uniformisation), A5.2 (Riemann forms with `E(Jv, v) > 0`, `H(v, w) = E(Jv, w) + iE(v, w)`),
  A5.3 (Appell–Humbert: line bundles `L(H, α)` with semicharacters `α(λ + μ) = (−1)^{E(λ,μ)}α(λ)α(μ)` and
  factors of automorphy `α(λ) exp(πH(z, λ) + πH(λ, λ)/2)`; the Mumford map), A5.4 (polarisation type;
  `h⁰(L) = ∏ d_i`, so the sections of a principal polarisation form a line).

### From TauCetiRoadmap.NonordinaryCMSpecialValues

- §4.2: Finis's spaces `T_{r,𝔞}` of scalar theta functions on CM lattices of an imaginary quadratic field,
  the operators `A_l`, the normalised scalar product and the arithmetic and integral structures (1.9).

### From TensorInductionAndFiniteGroupInputs, a sub-roadmap of this family

- §7.1: `(GL_n, GL_m)`-duality on polynomials in `n × m` matrices (2.1).

### From TauCetiRoadmap.CompactGroups

- Layer 4: Schur orthogonality (1.1, 1.2, 4.1).

### From TauCetiRoadmap.ClassicalGroups

- Layer 3: highest weights (Conventions).

### From TauCetiRoadmap.AdelicAlgebraicGroups

- §3.1: parabolic subgroups (6.9); §§3.4–3.5: reduction theory and Siegel sets (6.3); §4.2: strong approximation (6.8).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

- AL.1: Tate's local theory (6.5, 6.12); AL.4.1.2: convergence of partial Euler products under a uniform bound on
  Satake parameters (3.3).

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §2.3a: continuation and functional equation of Hecke `L`-functions with their archimedean factors
  `Γ_ℂ(s + |k_w|/2)` (5.3, 6.8).

### From TauCetiRoadmap.LFunctions

- Layer 7: no zero on `Re s = 1` for Hecke `L`-functions of algebraic characters other than norm twists of the
  trivial one (3.3, 5.3, 6.8).

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

- §5.3g: the standard character `ψ` and self-dual measures (Conventions); §5.3h: adelic duality, the annihilator of
  `𝕎(F)` is `𝕎(F)` (1.8).

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

- §2.9: signed Hermitian spaces (0.1).

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet
  L-functions announced in [Announcement]; source with a public verification setup:
  <https://github.com/leanprover-community/riemann-hypothesis>. It is the source of the routes of 1.2 (class-set form of the lift), 1.7–1.9 (the kernel of the lattice vacuum read through a CM
  theta function), 4.2–4.3 (the inner-product route to nonvanishing in large dimension), 5.2–5.3 and Layer 6
  (the back-lift argument, cuspidality from one line parabolic, the purity lemma, the compact case, the
  constant-term induction, the global descent of matching through factorisation, constant terms and injectivity, the
  archimedean cone lemma, square-integrability of the theta integrals through the square of the theta kernel, and the
  explicit tower recursion with the value of its constants at the ramified places).
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- A. Weil, *Sur certains groupes d'opérateurs unitaires*, Acta Math. 111 (1964): 0.3, 0.4, 1.8 (the
  unitarity of the theta functional).
- D. Mumford, *Tata lectures on theta I*, Progress in Math. 28, Birkhäuser (1983), and *On the
  equations defining abelian varieties I*, Invent. Math. 1 (1966): 1.8 (lattice models, theta
  functions of polarised tori, characteristics and their parity).
- V. Bargmann, *On a Hilbert space of analytic functions and an associated integral transform*,
  Comm. Pure Appl. Math. 14 (1961): 1.7.
- T. Finis, *Divisibility of anticyclotomic L-functions and theta functions with complex
  multiplication*, Ann. of Math. 163 (2006): 1.9.
- S. Kudla, *Splitting metaplectic covers of dual reductive pairs*, Israel J. Math. 87 (1994): 0.2,
  0.3.
- M. Harris, S. Kudla, W. J. Sweet, *Theta dichotomy for unitary groups*, J. Amer. Math. Soc. 9
  (1996): 0.2, 3.2 (the rank-one check), Layer 5.
- J. Rogawski, *The multiplicity formula for A-packets*, in *The zeta functions of Picard modular
  surfaces*, CRM (1992): 3.2 (the rank-one check).
- M. Kashiwara, M. Vergne, *On the Segal–Shale–Weil representations and harmonic polynomials*,
  Invent. Math. 44 (1978): 2.1, 6.2 (through ThetaKernelsForUnitaryDualPairs §3.47b).
- R. Howe, *Transcending classical invariant theory*, J. Amer. Math. Soc. 2 (1989): 2.1, 2.3.
- B. Gross, *Algebraic modular forms*, Israel J. Math. 113 (1999): Layer 1.
- H. Minkowski, *Zur Theorie der positiven quadratischen Formen*, J. reine angew. Math. 101 (1887),
  and J.-P. Serre, *Bounds for the orders of the finite subgroups of G(k)*, in *Group
  representation theory*, EPFL Press (2007): 1.6.
- S. Rallis, *On the Howe duality conjecture*, Compositio Math. 51 (1984): 2.2, 2.3.
- S. Rallis, *Injectivity properties of liftings associated to Weil representations*, Compositio
  Math. 52 (1984): 3.2, 3.4.
- I. Piatetski-Shapiro, S. Rallis, *L-functions for the classical groups*, Lecture Notes in Math.
  1254 (1987): 3.2.
- J.-S. Li, *Nonvanishing theorems for the cohomology of certain arithmetic quotients*, J. reine
  angew. Math. 428 (1992): 3.3, 4.1, 4.2.
- A. Mínguez, *Correspondance de Howe explicite : paires duales de type II*, Ann. Sci. ÉNS 41 (2008):
  2.2.
- J.-P. Labesse, *Changement de base CM et séries discrètes*, in *On the stabilization of the trace
  formula*, International Press (2011): 2.4, 4.3.
- S. Kudla, S. Rallis, *A regularized Siegel–Weil formula: the first term identity*, Ann. of Math.
  140 (1994): 6.4 (constant terms of theta integrals along a Witt tower).
- W. T. Gan, Y. Qiu, S. Takeda, *The regularized Siegel–Weil formula (the second term identity) and
  the Rallis inner product formula*, Invent. Math. 198 (2014): 3.1, 3.2, Layer 6 boundary.
- A. Ichino, *A regularized Siegel–Weil formula for unitary groups*, Math. Z. 247 (2004): 3.1.
- S. Yamana, *L-functions and theta correspondence for classical groups*, Invent. Math. 196 (2014):
  3.2.
- S. Rallis, *L-functions and the oscillator representation*, Lecture Notes in Math. 1245 (1987):
  6.4 (constant terms of theta integrals).
- A. Zelevinsky, *Induced representations of reductive p-adic groups II*, Ann. Sci. ÉNS 13 (1980): 6.5, 6.8 (through
  ThetaKernelsForUnitaryDualPairs §§3.47, 5.7d: irreducibility of products of segments).
- J. Shalika, *The multiplicity one theorem for GL_n*, Ann. of Math. 100 (1974), and
  I. Piatetski-Shapiro, *Euler subgroups*, in *Lie groups and their representations* (1975): 6.9
  (Fourier expansion of cuspidal functions on `GL_j`).
- R. Godement, H. Jacquet, *Zeta functions of simple algebras*, Lecture Notes in Math. 260 (1972): 6.5
  (through ThetaKernelsForUnitaryDualPairs §3.47).
- J. Tate, *Fourier analysis in number fields and Hecke's zeta-functions* (thesis, 1950), in
  *Algebraic number theory*, Cassels–Fröhlich eds. (1967): 6.4, 6.5 (the cone integrals, their functional equation and
  Poisson summation along a line, through ThetaKernelsForUnitaryDualPairs §§5.7c, 5.7e), 6.12 (the unramified factors).
