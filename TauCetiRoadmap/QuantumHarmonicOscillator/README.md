# Roadmap: the quantum harmonic oscillator

**Summary.** The one-dimensional oscillator `H = ½(−d²/dx² + x²)` is already in place: the
Hermite functions, their Hilbert basis of `L²(ℝ)`, the ladder operators on Schwartz space and the
Fourier eigenrelation are in Tau Ceti, and QuantumFoundations develops the closed oscillator, its
spectrum and its functional calculus. This roadmap adds three things on top of them:
Dirac's ladder theorem in abstract form, the Rellich–Dixmier uniqueness theorem for the canonical
commutation relation, and the integral kernels of the heat semigroup and of the unitary group.

The ladder theorem is stated for two linear maps `a`, `b` of a complex inner product space, not
necessarily complete, that are adjoint to each other (`⟪a x, y⟫ = ⟪x, b y⟫`) and satisfy
`ab − ba = 1`. Every eigenvalue of `N = ba` is then a natural number `n`, and the eigenspace for
`n` is the image of the kernel of `a` under `bⁿ`, which multiplies inner products by `n!`. The
kernel of `a` may be zero, and then `N` has no eigenvectors at all.

The Rellich–Dixmier theorem says when a pair of operators satisfying `PQ − QP = −i` must be the
Schrödinger pair. Suppose `P` and `Q` are symmetric on a dense subspace that they map into itself,
satisfy the relation there, and `P² + Q²` is essentially self-adjoint on that subspace. Then the
closures of their restrictions are self-adjoint, and the Hilbert space has a Hilbert basis `e(k, n)`
(with `k` in an index set) on which they act by the Heisenberg matrices. So the space is a Hilbert
sum of copies of `L²(ℝ)` with `−i d/dx` and `x`.

For `t > 0` the operator `e^{−tH}`, characterised by `e^{−tH} hₙ = e^{−t(n+½)} hₙ`, is the integral
operator with Mehler's kernel `(2π sinh t)^{−1/2} exp(−((x² + y²) cosh t − 2xy)/(2 sinh t))`. It
is trace class, and its trace norm and the integral of its kernel over the diagonal both equal
`1/(2 sinh(t/2))`, the partition function. Up to the factor `e^{t/2}`, the same operator is the
Ornstein–Uhlenbeck semigroup transported to `L²(ℝ)` by the ground-state transform. For `0 < t < π` the unitary `e^{−itH}` is
given on integrable square-integrable functions by Mehler's kernel
`e^{−iπ/4}(2π sin t)^{−1/2} exp(i((x² + y²) cos t − 2xy)/(2 sin t))`. Finally `e^{−itH}` maps
Schwartz space into itself and rotates position and momentum exactly:
`e^{itH} Q e^{−itH} = Q cos t + P sin t` there.

The roadmap builds on Tau Ceti's Hermite functions and trace-class operators (from the completed
roadmap OrthogonalL2Bases and the operator-ideal library), on UnboundedOperators for common
invariant domains and Nelson's theorem, on QuantumFoundations for the closed oscillator, and on
OrnsteinUhlenbeckSemigroup for the Gaussian side of Mehler's formula.

Layer 1 below is pure algebra on an inner product space. Layer 2 applies it, with the spectral
theory of closed operators, to prove the Rellich–Dixmier theorem. Layer 3 treats the heat
semigroup and Layer 4 the unitary group; both rest on the Hermite basis and not on Layers 1–2.

## Conventions

- **Units and operators.** `ħ = m = ω = 1`, `Q = x`, `P = −i d/dx`, so `PQ − QP = −i` on
  Schwartz space; `a = (Q + iP)/√2 = (x + d/dx)/√2`, `a† = (Q − iP)/√2`, `N = a†a`, and
  `H = ½(P² + Q²) = N + ½`, with eigenvalues `n + ½`. Physical time evolution is `e^{−itH}`, as in
  QuantumFoundations.
- **Halving.** QuantumFoundations §9.2 writes the oscillator as `P² + Q² = 2N + 1` (spectrum
  `{2n + 1}`), and so does Tau Ceti's `TauCeti.hermiteFunction_oscillator`
  (`−hₙ″ + x² hₙ = (2n + 1) hₙ`). Here `H` is half of it: `e^{−tH} = e^{−(t/2)(P²+Q²)}` and
  `e^{−itH} = e^{−i(t/2)(P²+Q²)}`. Tau Ceti's `TauCeti.hermiteOscillatorCLM` is `H`.
- **Hermite functions.** `hₙ = TauCeti.hermiteFunction n`,
  `hₙ(x) = Heₙ(√2 x) e^{−x²/2}/√(n! √π)` with Mathlib's probabilists' `Polynomial.hermite`; these
  are the physicists' `(2ⁿ n! √π)^{−1/2} Hₙ(x) e^{−x²/2}`. `L2` is complex `L²(ℝ)` for Lebesgue
  measure (the same declaration as UnboundedOperators' `L2`), and `TauCeti.hermiteFunctionLp ℂ n`
  is the class of `hₙ` in it. Inner products are conjugate-linear in the first slot, and the
  Hermite coefficients of `f` are `cₙ = ⟪hₙ, f⟫`.
- **The semigroup and the group.** For `t > 0` (resp. real `t`) the targets take a bounded operator
  `T` (resp. `U`) on `L2` with `T hₙ = e^{−t(n+½)} hₙ` (resp. `U hₙ = e^{−it(n+½)} hₙ`) for every
  `n`. Such an operator exists and is unique: it is the diagonal operator `lp.diagonalCLM` of Tau
  Ceti conjugated by the coordinate isometry of `TauCeti.hermiteHilbertBasis ℂ`, and two bounded
  operators that agree on a Hilbert basis are equal. By the functional calculus of
  QuantumFoundations §9.2 (`h(H̄) f = Σ h(2n+1) cₙ hₙ` for the closed oscillator `H̄ = 2N + 1`
  there), `T` is `e^{−(t/2)H̄}` and `U` is `e^{−i(t/2)H̄}` in that roadmap's normalisation.
- **Square roots and junk values.** `(2π sinh t)^{−1/2}` and `(2π sin t)^{−1/2}` are `Real.rpow` of
  a positive base under the stated hypotheses (`0 < t`, resp. `0 < t < π`); at `t = 0` and at
  `t = π` the bases vanish and the kernels are junk, which is why those times are excluded. The
  branch of `(2πi sin t)^{−1/2}` in the unitary kernel is `e^{−iπ/4}(2π sin t)^{−1/2}`.
- **Fourier transform.** Mathlib's `𝓕 f(ξ) = ∫ e^{−2πixξ} f(x) dx`. The unitary
  `F₁ f(ξ) = (2π)^{−1/2} ∫ e^{−ixξ} f(x) dx` equals `(2π)^{−1/2} (𝓕 f)(ξ/(2π))` and has
  `F₁ hₙ = (−i)ⁿ hₙ`.
- **The ground-state transform.** `(W g)(x) = π^{−1/4} e^{−x²/2} g(√2 x)` from functions on the
  one-dimensional Euclidean space (the carrier of OrnsteinUhlenbeckSemigroup at `d = 1`, a point
  `u` being written `EuclideanSpace.single 0 u`) to functions on `ℝ`.

## Layer 1: the ladder theorem on an inner product space

Throughout this layer `V` is a complex inner product space, not necessarily complete and possibly
zero, and `a, b : V → V` are linear with `⟪a x, y⟫ = ⟪x, b y⟫` for all `x, y` and `ab − ba = 1`.
These are the algebraic relations of the annihilation and creation operators; on Schwartz space
they are Tau Ceti's `TauCeti.hermiteAnnihilationCLM` and `TauCeti.hermiteCreationCLM` (stated
there on real Schwartz space). The pair is a representation of Tau Ceti's Heisenberg Lie algebra
`TauCeti.heisenberg` at central charge one; no further Heisenberg object is introduced. The layer
is meant for every later use of the ladder argument where no completeness or closedness is at
hand: Layer 2 applies it to the span of the eigenvectors of a closed operator.

### 1.1 Dirac's ladder theorem

Prove `exists_nat_eigenvalue_eq`: if `b(a x) = μ x` with `x ≠ 0`, then `μ = n` for a natural
number `n`, `aⁿ x ≠ 0` and `aⁿ⁺¹ x = 0`. (Proved here; Teschl, §8.3, p. 178, gives the argument for
the concrete oscillator on the span of the Hermite functions.)

Route. Put `N = ba`. First, `μ‖x‖² = ⟪x, b a x⟫ = ⟪a x, a x⟫ = ‖a x‖²`, so `μ` is real and
`μ ≥ 0`. From `ab = ba + 1` we get `N a = b a a = (a b − 1) a = a(N − 1)`, so by induction on `k`,
`N(aᵏ x) = (μ − k) aᵏ x`. Applying the first computation to `aᵏ x` gives
`‖aᵏ⁺¹ x‖² = (μ − k) ‖aᵏ x‖²` for every `k`. If `aᵏ x ≠ 0` for every `k`, this identity with both
norms positive gives `μ > k` for every `k`, which is impossible.
Let `m` be the least `k` with `aᵏ x = 0`; `m ≥ 1` because `x ≠ 0`. Then
`0 = ‖aᵐ x‖² = (μ − (m − 1))‖aᵐ⁻¹ x‖²` with `aᵐ⁻¹ x ≠ 0`, so `μ = m − 1 =: n`, and `aⁿ x ≠ 0`,
`aⁿ⁺¹ x = 0`.

**Checks.**

- `μ = 0`: then `‖a x‖² = 0`, `n = 0`, `a⁰ x = x ≠ 0` and `a x = 0`.
- The adjoint relation cannot be dropped. Let `V` have orthonormal basis `e_k`, `k ∈ ℤ` (finite
  linear combinations), `a e_k = (½ + k) e_(k−1)`, `b e_k = e_(k+1)`. Then
  `(ab − ba) e_k = (½ + k + 1 − ½ − k) e_k = e_k` and `b a e₀ = ½ e₀`, a non-natural eigenvalue;
  the adjoint relation fails, `⟪a e₁, e₀⟫ = 3/2` while `⟪e₁, b e₀⟫ = 1`.
- No finite-dimensional nonzero `V` satisfies the hypotheses (the trace of `ab − ba` is `0`, of the
  identity `dim V`); on the cutoff Fock space `ℂᴹ` with `a e_k = √k e_(k−1)` one has
  `ab − ba = 1 − M |M−1⟩⟨M−1|`, so the cutoff oscillator of QuantumFoundations §6.7 is excluded.

*Needs:* Mathlib inner product spaces and `Module.End`.

### 1.2 Vacuum towers

Prove `vacuum_tower`: for every `n`,
- `⟪bⁿ y, bⁿ y′⟫ = n! ⟪y, y′⟫` for `y, y′ ∈ ker a`;
- `a bⁿ⁺¹ = bⁿ⁺¹ a + (n + 1) bⁿ` as linear maps;
- `bⁿ aⁿ = N(N − 1)⋯(N − n + 1)` with `N = ba` (the empty product for `n = 0`);
- the eigenspace of `N` for the eigenvalue `n` is `bⁿ(ker a)`.
(Proved here.)

Route. The commutator identity is induction on `n` from `ab = ba + 1`:
`a bⁿ⁺² = (a bⁿ⁺¹) b = bⁿ⁺¹ a b + (n + 1) bⁿ⁺¹ = bⁿ⁺¹(ba + 1) + (n + 1)bⁿ⁺¹`. For `y, y′ ∈ ker a`
it gives `a bⁿ⁺¹ y′ = (n + 1) bⁿ y′`, so
`⟪bⁿ⁺¹ y, bⁿ⁺¹ y′⟫ = ⟪bⁿ y, a bⁿ⁺¹ y′⟫ = (n + 1)⟪bⁿ y, bⁿ y′⟫` by the adjoint relation
(conjugate-linearity in the first slot is harmless, `n + 1` being real), and induction gives
`n!`. The falling factorial is induction too: `bⁿ⁺¹ aⁿ⁺¹ = b (bⁿ aⁿ) a`, and `N a = a(N − 1)`
(from 1.1's route) gives `(bⁿ aⁿ) a = a ∏_(k<n) (N − 1 − k)`, so
`bⁿ⁺¹aⁿ⁺¹ = (ba)∏_(k<n)(N − 1 − k) = ∏_(k≤n)(N − k)`; all factors are polynomials in `N` and
commute. For the eigenspace: if `y ∈ ker a` then `N bⁿ y = b (a bⁿ y) = b(n bⁿ⁻¹ y) = n bⁿ y`
(commutator identity at `n − 1`; for `n = 0`, `N y = b a y = 0`). Conversely, if `N x = n x` and
`x ≠ 0`, 1.1 gives `aⁿ x ≠ 0 = aⁿ⁺¹ x`, so `y := aⁿ x / n!` lies in `ker a`, and the falling
factorial gives `bⁿ aⁿ x = n(n − 1)⋯1 · x = n! x`, so `x = bⁿ y`.

**Checks.**

- On the Fock basis (`a e_m = √m e_(m−1)`, `b e_m = √(m+1) e_(m+1)`) one has
  `bⁿ aⁿ e_m = m!/(m−n)! e_m = m(m−1)⋯(m−n+1) e_m`, `0` for `m < n`; checked exactly for
  `n ≤ 5`, `m ≤ 8`, together with the commutator identity for `n ≤ 4`, `m ≤ 7`, and
  `‖bⁿ e₀‖² = n!`.
- `ker a` can be zero, and then every eigenspace is zero. On the subspace `C_c^∞(ℝ)` of `L²(ℝ)`
  with `a = (x + d/dx)/√2`, `b = (x − d/dx)/√2` both hypotheses hold (integration by parts), the
  solutions of `a ψ = 0` are the multiples of `e^{−x²/2}`, none compactly supported except `0`, and
  indeed no compactly supported function is an eigenvector of `N` (the eigenvectors in `L²` are the
  multiples of the `hₙ`).
- `n = 0`: the eigenspace for `0` is `ker a`, since `⟪x, N x⟫ = ‖a x‖²`.

*Needs:* 1.1.

### Examples

- The Schrödinger model: `V` the span of the Hermite functions, `a`, `b` the ladder operators;
  `ker a = ℂ h₀` and the towers are `bⁿ h₀ = √(n!) hₙ` (QuantumFoundations §9.2,
  `hₙ = (a†)ⁿ h₀/√(n!)`).
- If `V` is spanned by eigenvectors of `N`, then 1.2 makes `V` the orthogonal direct sum, over an
  orthonormal basis `(ε_k)` of `ker a`, of the towers spanned by `bⁿ ε_k/√(n!)`, on which `a` and
  `b` act by `√n` and `√(n+1)` shifts; two such spaces with `ker a` of the same Hilbert dimension
  are isometrically intertwined. This is the algebraic core of 2.1.

### Dependencies

1.1 needs Mathlib only; 1.2 needs 1.1.

## Layer 2: the Rellich–Dixmier theorem

The canonical commutation relation `PQ − QP = −i` on a dense invariant domain does not determine
the pair `(P, Q)`, even for irreducible pairs of self-adjoint operators: on `L²(0, 1)` the
momentum `−i d/dx` with periodic boundary condition and the bounded `Q = x` satisfy it on
`C_c^∞(0, 1)`. Rellich (1946) proved uniqueness when `P² + Q²` restricted to the domain is
decomposable, a stronger hypothesis; Dixmier (1958) showed that essential self-adjointness of
`P² + Q²` on the domain suffices (Dixmier, p. 264, describes both). The theorem is meant for uniqueness arguments where only the commutation relation on a
domain is known (the Weyl form, consumed by QuantumFoundations §6.6 through
MetaplecticAutomorphicForms §1.2, needs the unitary groups instead). The common invariant domain is
UnboundedOperators' `CommonInvariantDomain` (§5.3), with its `CommonInvariantDomain.action` and
`CommonInvariantDomain.restricted`, copied verbatim; operator `0` is `P` and operator `1` is `Q`.

### 2.1 The theorem

Prove `rellich_dixmier`: let `H` be a complex Hilbert space and `D` a common invariant domain for
two partial operators, with carrier `X`, such that the restrictions of `P` and `Q` to `X` are
symmetric, `PQξ − QPξ = −iξ` for `ξ ∈ X`, and the restriction of `P² + Q²` to `X` is essentially
self-adjoint. Then the closures `P̄`, `Q̄` of the restrictions are self-adjoint, and there are a
type `κ` and a Hilbert basis `e(k, n)`, `(k, n) ∈ κ × ℕ`, of `H` with every `e(k, n)` in the domains
of `P̄` and `Q̄` and

    Q̄ e(k, n) = √(n/2) e(k, n−1) + √((n+1)/2) e(k, n+1),
    P̄ e(k, n) = i√((n+1)/2) e(k, n+1) − i√(n/2) e(k, n−1)

(the coefficient `√(n/2)` is `0` for `n = 0`). These are the matrices of `x` and `−i d/dx` in the
Hermite basis, so `H` is a Hilbert sum over `κ` of copies of the Schrödinger pair (Dixmier, 1958,
Théorème 1, p. 265; his conclusion also says that `P` and `Q` themselves are self-adjoint when they
are closed and symmetric, which follows from the statement here because a closed symmetric
extension of a self-adjoint operator equals it).

Route (following Dixmier, pp. 265–267, for the first two steps).

1. On `X` put `R = P − iQ` and `S = P + iQ`. Symmetry gives `⟪Rξ, η⟫ = ⟪ξ, Sη⟫` on `X`, so `R` is
   closable; let `T` be its closure, so `T* ⊇ S`. On `X` the relation gives
   `SR = P² + Q² − 1` and `RS = P² + Q² + 1`. Both are essentially self-adjoint by hypothesis.
   `T*T` and `TT*` are self-adjoint (von Neumann's theorem for a closed densely defined operator,
   VonNeumannAlgebras V10.ClosedOperators) and extend `SR` and `RS` (for `ξ ∈ X`, `Rξ ∈ X` and
   `T*Rξ = SRξ`; likewise `TSξ = RSξ`). A self-adjoint extension of an essentially self-adjoint
   operator is its closure, so `T*T = closure(SR)` and
   `TT* = closure(RS) = closure(SR + 2) = T*T + 2`, with equal domains.
2. Spectrum. From `TT* ≥ 2`, `ker T* = 0`, so the range of `T` is dense. Let `T = U|T|` be the
   polar decomposition (VonNeumannAlgebras V10.ClosedOperators): `U` maps `M = (ker T)^⊥`
   isometrically onto `H`. Taking adjoints, `T* = |T|U*`, so `TT* = U|T||T|U* = U(T*T)U*`: the
   part of `T*T` in `M`, which `M` reduces, is unitarily equivalent to `TT*` (Teschl, Theorem 8.6,
   p. 180, whose proof is this computation; `ker T* = 0` here).
   Let `σ ⊆ [0, ∞)` be the spectrum of `T*T` (SelfAdjointSpectralTheory SA-E01, SA-E08). Then
   `σ = σ_0 ∪ (σ + 2)` where `σ_0 = {0}` if `ker T ≠ 0` and `σ_0 = ∅` otherwise. If `H = 0` take
   `κ` empty and stop. Otherwise `σ` is nonempty and has a least element `s`; `ker T = 0` would give
   `s ∈ σ + 2`, `s − 2 ∈ σ`, a contradiction, so `σ = {0} ∪ (σ + 2)`. By induction on `m`,
   `σ ∩ [0, 2m) = {0, 2, …, 2m − 2}`, so `σ = {0, 2, 4, …}`. Write `E` for the spectral projections
   (SA-E03). `E({2j}) ≠ 0`: the punctured interval `(2j − 1, 2j + 1) ∖ {2j}` consists of resolvent
   points, so `E` of it is `0` (SA-E08); if also `E({2j}) = 0`, the spectral subspace of
   `ℝ ∖ (2j − 1, 2j + 1)` is `H`, and SA-E10 puts `2j` in the resolvent set, a contradiction. On
   `range E({2j})` the restriction of `T*T` (SA-E09, self-adjoint) has quadratic form `2j‖x‖²`
   (SA-E13 with `β = α = 2j`), so this restriction minus `2j` is symmetric with zero quadratic form,
   hence zero on its domain (polarization), and, being closed and densely defined in `range E({2j})`,
   it is defined on all of it: `range E({2j}) ⊆ ker(T*T − 2j)`. Since
   `E(σ) = 1` (SA-E08) and `σ` is countable, `H` is the Hilbert sum of the `range E({2j})`; as
   eigenvectors of a self-adjoint operator for distinct eigenvalues are orthogonal, `ker(T*T − 2j)`
   is orthogonal to every `range E({2i})`, `i ≠ j`, and so equals `range E({2j})`. Thus `H` is the
   Hilbert sum of the eigenspaces `M_j = ker(T*T − 2j)`, `j ≥ 0`.
3. Towers. Put `A = (i/√2) T`, the closure of `(Q + iP)/√2` on `X`; then `A*A = ½ T*T`,
   `AA* = A*A + 1`, and `M_j` is the eigenspace of `A*A` for `j`. If `ξ ∈ M_j` then `Aξ ∈ M_(j−1)`
   (`Aξ = 0` for `j = 0`) and `A*ξ ∈ M_(j+1)`: for instance `A*Aξ = jξ` lies in the domain of `A`,
   so `Aξ` lies in the domain of `AA*` and `A*A(Aξ) = (AA* − 1)Aξ = A(A*Aξ) − Aξ = (j − 1)Aξ`. So
   the algebraic sum `V` of the `M_j` is invariant under `A` and `A*`; on `V` the restrictions
   `a = A|V`, `b = A*|V` satisfy the hypotheses of Layer 1 (`⟪Aξ, η⟫ = ⟪ξ, A*η⟫` and `AA* − A*A = 1`
   on `V`). By 1.2 the eigenspace `M_n` is `bⁿ(M₀)` and `bⁿ` multiplies inner products on
   `M₀ = ker A` by `n!`. Choose a Hilbert basis `(ε_k)_(k∈κ)` of the closed subspace `M₀` and put
   `f(k, n) = bⁿ ε_k/√(n!)`. Orthonormality within one `M_n` is 1.2, across different `n` it is
   orthogonality of eigenspaces; for fixed `n` the `f(k, n)` form a Hilbert basis of `M_n` because
   `bⁿ/√(n!)` is an isometry of `M₀` onto `M_n`. So `f` is a Hilbert basis of `H`, and by the
   commutator identity of 1.2, `A f(k, n) = √n f(k, n−1)` and `A* f(k, n) = √(n+1) f(k, n+1)`.
4. Position and momentum (Dixmier, p. 267). For `ξ` in the domain of `T`, choose `ξ_m ∈ X` with
   `ξ_m → ξ` and `Rξ_m → Tξ`. On `X`, `‖Sη‖² = ‖Rη‖² + 2‖η‖²` (from `RS − SR = 2`), so `Sξ_m`
   converges, to `T*ξ` since `T*` is closed and extends `S`. Hence `Pξ_m = (Rξ_m + Sξ_m)/2` and
   `Qξ_m = (Sξ_m − Rξ_m)/(2i)` converge: `ξ` lies in the domains of `P̄` and `Q̄`, with
   `Q̄ξ = (Aξ + A*ξ)/√2` and `P̄ξ = (i/√2)(A*ξ − Aξ)`. With `e(k, n) = f(k, n)` this gives the two
   displayed formulas.
5. Self-adjointness. Let `X₀` be the span of the `e(k, n)`. It is dense, contained in the domains of
   `P̄`, `Q̄`, invariant under both by step 4, and `P̄`, `Q̄` are symmetric on it (closures of
   symmetric operators). So `(P̄, Q̄)` with carrier `X₀` is a `CommonInvariantDomain`. Every word of
   length `m` in `P̄`, `Q̄` maps the span of `e(·, j)`, `j ≤ L`, into the span of `j ≤ L + 1` with
   norm at most `√(2(L + 1))`, so it maps `e(k, n)` to a vector of norm at most
   `2^(m/2) √((n + m)!/n!) ≤ 2^(n/2) 2ᵐ m!` (using `(n + m)!/(n! m!) ≤ 2^(n+m)`). Summing over the
   finitely many basis vectors of an `x ∈ X₀` gives the mixed-word bound with `R = 2` and a constant
   `C > 0` depending on `x`. UnboundedOperators' `nelson_essential_selfAdjoint` (§5.3) makes the
   closures of `P̄|X₀` and `Q̄|X₀` self-adjoint. `P̄` is a symmetric extension of the self-adjoint
   operator `closure(P̄|X₀)`, hence equal to it; so `P̄` is self-adjoint, and likewise `Q̄`.

**Checks.**

- The Schrödinger pair satisfies the hypotheses with `X` the Schwartz space: `−i d/dx` and `x` are
  symmetric there, `PQ − QP = −i`, and `P² + Q² = 2H` is essentially self-adjoint on Schwartz space
  (UnboundedOperators §5.6, UO-E05). The conclusion holds with `κ` a one-point type and
  `e(·, n) = hₙ`: `x hₙ = √(n/2) hₙ₋₁ + √((n+1)/2) hₙ₊₁` is Tau Ceti's
  `TauCeti.mul_hermiteFunction`, and `−i hₙ′ = i√((n+1)/2) hₙ₊₁ − i√(n/2) hₙ₋₁` follows from
  `TauCeti.deriv_hermiteFunction` (both checked symbolically for `n ≤ 5`).
- The hypothesis on `P² + Q²` cannot be dropped. On `L²(0, 1)` with `X = C_c^∞(0, 1)`, `P = −i d/dx`
  and `Q = x`, the subspace is dense and invariant, both operators are symmetric on it
  (integration by parts with compact support) and `PQ − QP = −i`. But `Q̄` is bounded with norm at
  most `1`, while the conclusion would give `‖Q̄ e(k, n)‖² = n/2 + (n + 1)/2 = n + ½` for every `n`
  (and `κ` is nonempty since the space is nonzero). So `P² + Q²`, which is `−d²/dx² + x²` there, is
  not essentially self-adjoint on `C_c^∞(0, 1)`, as also follows from both endpoints being regular.
- The commutation relation cannot be dropped: on `H = ℂ` with `X = ℂ`, `P = Q = 0`, the operators
  are symmetric and `P² + Q² = 0` is self-adjoint, but the conclusion would give
  `‖Q̄ e(k, 0)‖² = ½ ≠ 0`.
- Bookkeeping of phases: Dixmier's basis `ε` satisfies `T ε_j = √(2j) ε_(j−1)`, hence
  `A ε_j = i√j ε_(j−1)`; the basis `(−i)ʲ ε_j` has the real coefficients above, because
  `(−i)ʲ · i = (−i)^(j−1)`.

*Needs:* 1.2; UnboundedOperators §5.3 (`CommonInvariantDomain`, `nelson_essential_selfAdjoint`);
VonNeumannAlgebras V10.ClosedOperators (self-adjointness of `T*T` and `TT*`, polar decomposition of
a closed densely defined operator); Teschl, Theorem 8.6, p. 180 (step 2); SelfAdjointSpectralTheory
SA-E01, SA-E03, SA-E08, SA-E09, SA-E10, SA-E13 (spectral measure and projections, support on the
spectrum, spectral restriction, gap resolvent, form bounds); Mathlib `LinearPMap.closure`,
`LinearPMap.adjoint`, `IsSelfAdjoint`, `HilbertBasis`, `exists_hilbertBasis`.

### Examples

- In the route `κ` indexes a Hilbert basis of `ker A`. When `κ` is a one-point type, `e(·, n) ↦ hₙ`
  is a unitary map onto `L²(ℝ)` carrying `P̄`, `Q̄` to the closures of `−i d/dx` and `x` on the span
  of the Hermite functions (the uniqueness of the Schrödinger pair in this form).
- Two copies of the Schrödinger pair on `L²(ℝ) ⊕ L²(ℝ)` give `κ` with two points.

### Dependencies

2.1 needs 1.2, UnboundedOperators §5.3, VonNeumannAlgebras V10.ClosedOperators and
SelfAdjointSpectralTheory Part E; its first Check uses UnboundedOperators §5.6.

## Layer 3: the heat semigroup

This layer identifies `e^{−tH}` as an integral operator and computes its trace. It is meant for
consumers that need the oscillator's heat kernel or partition function as a closed formula (heat
kernel bounds, the trace formula, the thermal state of a mode) and for passing between the
Gaussian picture of OrnsteinUhlenbeckSemigroup and the Lebesgue picture of `L²(ℝ)`. The
Ornstein–Uhlenbeck objects `noiseKernel`, `ouKernel`, `ouSemigroup` and `mehlerKernel` are copied
verbatim from OrnsteinUhlenbeckSemigroup (1.1–1.2), at dimension `d = 1` in the statements.

### 3.1 The Ornstein–Uhlenbeck semigroup and the oscillator

Define `groundStateTransform`, `(W g)(x) = π^{−1/4} e^{−x²/2} g(√2 x)`, for real functions `g` on
the one-dimensional Euclidean space. Prove `hasSum_groundStateTransform_ouSemigroup`: for `t ≥ 0`
and `g ∈ L²(γ)`, `γ` the standard Gaussian, the functions `W g` and `W(P_t g)` are square integrable
on `ℝ`, `‖W g‖₂ = ‖g‖_(L²(γ))`, and

    W(P_t g) = Σₙ e^{−nt} ⟪hₙ, W g⟫ hₙ    in L²(ℝ),

that is, `W P_t W⁻¹ = e^{−t(H − ½)}`. (Proved here.)

Route. (i) `x ↦ (x 0)` is measure preserving from `γ` to `gaussianReal 0 1`
(`ProbabilityTheory.measurePreserving_eval_multivariateGaussian` with
`ProbabilityTheory.multivariateGaussian_zero_one`); the substitution `u = √2 x` turns
`∫ |W g|² dx = π^{−1/2} ∫ e^{−x²} g(√2x)² dx` into `(2π)^{−1/2} ∫ e^{−u²/2} g(u)² du`, the norm in
`L²(γ)`. So `W` is a linear isometry from real `L²(γ)` into `L2`; it is Tau Ceti's
`TauCeti.weightL2Isometry` for the Gaussian density followed by the unitary dilation by `√2`. (ii)
`W(Heₙ/√(n!)) = hₙ`, directly from the definition of `TauCeti.hermiteFunction`. (iii)
OrnsteinUhlenbeckSemigroup's `TauCetiRoadmap.OrnsteinUhlenbeckSemigroup.ouSemigroup_hermiteProd` at
`d = 1` gives `P_t Heₙ = e^{−nt} Heₙ` for `t ≥ 0`. (iv) Its `eLpNorm_ouSemigroup_le` at `p = q = 2`
(allowed: `2 − 1 ≤ e^{2t}(2 − 1)`) makes `P_t` a contraction of `L²(γ)`; `P_t g` is defined at every
point (for `t > 0`, `TauCetiRoadmap.OrnsteinUhlenbeckSemigroup.ouKernel_eq_withDensity` gives the
kernel a density in `L²(γ)`, so `g` is integrable against it by Cauchy–Schwarz; for `t = 0` the
kernel is the point mass at `x`), and `P_t` is linear on `L²(γ)`. (v) Tau Ceti's
`TauCeti.gaussianHermiteHilbertBasis` (basis `Heₙ/√(n!)`) expands `g = Σ bₙ Heₙ/√(n!)` in `L²(γ)`;
continuity of `P_t` gives `P_t g = Σ e^{−nt} bₙ Heₙ/√(n!)`, and applying the isometry `W` with (ii),
`W(P_t g) = Σ e^{−nt} bₙ hₙ` with `bₙ = ⟪hₙ, W g⟫`.

**Checks.**

- `W(Heₙ/√(n!)) = hₙ` and `‖W Heₙ‖₂² = ‖Heₙ‖²_(L²(γ)) = n!`, checked symbolically for `n ≤ 5`
  (respectively `n ≤ 3`); a transform without the dilation by `√2` sends `He₂` to a multiple of
  `(x² − 1) e^{−x²/2}`, which is not proportional to `h₂`, a multiple of `(2x² − 1) e^{−x²/2}`.
- Eigenvalue bookkeeping: `e^{−t(n+½)} = e^{−t/2} e^{−nt}`, so the right side is
  `e^{t/2} e^{−tH} W g`; the generator relation `W(L g) = −(H − ½) W g` for `L g = g″ − u g′` holds
  pointwise for `C²` functions (symbolic check on `g(u) = e^{−u³/7} sin u`).
- `t ≥ 0` is needed: for `t = −1` the copied kernel is the point mass at `e·x`, and
  `P_(−1) He₂ (x) = e² x² − 1` while `e² He₂(x) = e² x² − e²`.

*Needs:* OrnsteinUhlenbeckSemigroup 1.1 (`ouKernel`, `ouSemigroup`), 1.2
(`TauCetiRoadmap.OrnsteinUhlenbeckSemigroup.ouKernel_eq_withDensity`), 2.4
(`TauCetiRoadmap.OrnsteinUhlenbeckSemigroup.ouSemigroup_hermiteProd`), 3.3
(`eLpNorm_ouSemigroup_le`); Tau Ceti `TauCeti.gaussianHermiteHilbertBasis`,
`TauCeti.hermiteFunctionLp`, `TauCeti.weightL2Isometry`; Mathlib
`ProbabilityTheory.measurePreserving_eval_multivariateGaussian`,
`ProbabilityTheory.multivariateGaussian_zero_one`.

### 3.2 Mehler's heat kernel and the partition function

Define `mehlerHeatKernel t x y = (2π sinh t)^{−1/2} exp(−((x² + y²) cosh t − 2xy)/(2 sinh t))`.
Prove `heat_eq_mehlerHeatKernel`: for `t > 0` and a bounded operator `T` on `L2` with
`T hₙ = e^{−t(n+½)} hₙ` for every `n`,

- for every `f ∈ L2` and every `x`, `y ↦ K_t(x, y) f(y)` is integrable, `x ↦ ∫ K_t(x, y) f(y) dy`
  is square integrable, and its class is `T f`;
- `T` is trace class: its nuclear norm `T.nuclearENorm` (Tau Ceti's trace-class gauge, the sum of
  its approximation numbers) is `1/(2 sinh(t/2))`;
- `∫ K_t(x, x) dx = 1/(2 sinh(t/2))`;
- `K_t(x, y) = e^{−t/2} π^{−1/2} e^{−(x²+y²)/2} M_t(√2 x, √2 y)` for all `x, y`, where `M_t` is
  OrnsteinUhlenbeckSemigroup's `mehlerKernel` at `d = 1`.

(Mehler's formula is DLMF 18.18.28; the transport, the trace and the route are proved here.)

Route. The last clause is algebra: with `ρ = e^{−t}`, `sinh t = (ρ⁻¹ − ρ)/2`,
`cosh t = (ρ⁻¹ + ρ)/2`, both sides equal
`ρ^{1/2}(π(1 − ρ²))^{−1/2} exp(−((x² + y²)(1 + ρ²) − 4ρxy)/(2(1 − ρ²)))`. For the first clause,
`K_t(x, ·)` is a Gaussian in `y`, hence in `L²`, so the integral converges absolutely for `f ∈ L2`.
Both sides are complex-linear in `f`, so take `f` real-valued and put
`g(u) = π^{1/4} e^{u²/4} f(u/√2)` on the one-dimensional Euclidean space, so that `W g = f` and
`g ∈ L²(γ)` by the change of variables (i) of 3.1's route, which holds for every measurable `g`. By `TauCetiRoadmap.OrnsteinUhlenbeckSemigroup.ouKernel_eq_withDensity` (`t > 0`)
and Mathlib's `integral_withDensity_eq_integral_smul`, `P_t g(v) = ∫ g(w) M_t(v, w) dγ(w)`; the
substitution `w = √2 y` (`dγ(w) = π^{−1/2} e^{−y²} dy`) and the last clause give
`W(P_t g)(x) = e^{t/2} ∫ K_t(x, y) f(y) dy`. By 3.1 the left side is `e^{t/2} T f` in `L2`. For the
trace: `T` agrees on the basis `TauCeti.hermiteHilbertBasis ℂ` with the conjugate of
`lp.diagonalCLM d`, `dₙ = e^{−t(n+½)}`, by the coordinate isometry, so the two bounded operators are
equal; approximation numbers are invariant under such conjugation
(`ContinuousLinearMap.singularValue_comp_linearIsometryEquiv`) and those of the diagonal operator
with decreasing `|dₙ|` are `|dₙ|` (`lp.singularValue_diagonalCLM`); so
`T.nuclearENorm = Σ e^{−t(n+½)} = e^{−t/2}/(1 − e^{−t}) = 1/(2 sinh(t/2))`. On the diagonal,
`K_t(x, x) = ρ^{1/2}(π(1 − ρ²))^{−1/2} e^{−x²(1−ρ)/(1+ρ)}`, whose integral is `ρ^{1/2}/(1 − ρ)`, the
same number.

**Checks.**

- The power series in `ρ` of `ρ^{−1/2} e^{(x²+y²)/2} K_t(x, y)` agrees with
  `Σ ρⁿ hₙ(x) hₙ(y) e^{(x²+y²)/2}` through `ρ⁶`, checked symbolically in `x, y`.
- The trace: `∫ e^{−c x²} dx = √(π/c)` with `c = (1 − ρ)/(1 + ρ)` gives `ρ^{1/2}/(1 − ρ)`, and
  `(e^{t/2} − e^{−t/2}) e^{−t/2} = 1 − e^{−t}` gives `1/(2 sinh(t/2))`. Halving matters: the
  operator `e^{−t(P²+Q²)}` of QuantumFoundations' normalisation would have trace `1/(2 sinh t)`.
- The transport identity was checked symbolically; without the dilation by `√2` it fails, already
  at `t = 1`, `x = 1`, `y = 0`.
- `t = 0` is excluded: `T` is then the identity, which is not trace class
  (`ContinuousLinearMap.nuclearENorm_id_eq_top`), while `1/(2 sinh 0)` is `0` in Lean and
  `mehlerHeatKernel 0` is identically `0`.

*Needs:* 3.1; OrnsteinUhlenbeckSemigroup 1.2 (`mehlerKernel`,
`TauCetiRoadmap.OrnsteinUhlenbeckSemigroup.ouKernel_eq_withDensity`); Tau Ceti
`TauCeti.hermiteHilbertBasis`, `lp.diagonalCLM`, `lp.singularValue_diagonalCLM`,
`ContinuousLinearMap.singularValue_comp_linearIsometryEquiv`, `ContinuousLinearMap.nuclearENorm`;
Mathlib `integral_withDensity_eq_integral_smul`, `integral_gaussian`.

### Examples

- The partition function of one mode at inverse temperature `β` is `Z(β) = 1/(2 sinh(β/2))`, and
  its mean energy `−d log Z/dβ = ½ coth(β/2)` is Planck's formula with the zero-point energy `½`.
- At `x = y = 0`, `K_t(0, 0) = (2π sinh t)^{−1/2}`, which tends to `∞` as `t → 0⁺` and behaves like
  `π^{−1/2} e^{−t/2}` for large `t`, the ground-state contribution `e^{−t/2} h₀(0)²`.

### Dependencies

3.1 needs OrnsteinUhlenbeckSemigroup Layers 1–3 (the cited declarations) and Tau Ceti's Gaussian
Hermite basis; 3.2 needs 3.1, OrnsteinUhlenbeckSemigroup 1.2 and Tau Ceti's trace-class gauge.

## Layer 4: the unitary group

This layer gives `e^{−itH}` as an integral operator on `(0, π)` and the exact rotation of position
and momentum. It is meant for consumers working with the oscillator propagator (fractional Fourier
transforms, the metaplectic action of rotations at the Archimedean place) and for coherent-state
dynamics.

### 4.1 Mehler's kernel for the unitary group

Define `mehlerPropagatorKernel`, the kernel `K(x, y)` given by
`e^{−iπ/4} (2π sin t)^{−1/2} exp(i((x² + y²) cos t − 2xy)/(2 sin t))`.
Prove `propagator_eq_mehlerPropagatorKernel`: for `0 < t < π`, a bounded operator `U` on `L2` with
`U hₙ = e^{−it(n+½)} hₙ` for every `n`, and `f ∈ L2` that is integrable, `y ↦ K(x, y) f(y)` is
integrable for every `x`, `x ↦ ∫ K(x, y) f(y) dy` is square integrable, and its class is `U f`.
(Proved here, from DLMF 18.18.28.)

Route. For `|z| < 1` DLMF 18.18.28, multiplied by `π^{−1/2} e^{−(x²+y²)/2}`, reads
`Σ zⁿ hₙ(x) hₙ(y) = (π(1 − z²))^{−1/2} exp((2xyz − (x² + y²) z²)/(1 − z²) − (x² + y²)/2)`, with the
principal square root (`Re(1 − z²) > 0` on the disc). Take `z = e^{−(ε + it)}`, `ε > 0`, and call
`K_ε(x, y)` the right side times `e^{−(ε+it)/2}`. (a) The series converges absolutely: at the
point `(x, x)` with `|z|` in place of `z` its terms `|z|ⁿ hₙ(x)²` are nonnegative with finite sum, and
Cauchy–Schwarz bounds `Σ |z|ⁿ |hₙ(x) hₙ(y)|` by the geometric mean of the sums at `(x, x)` and
`(y, y)`. For fixed `x` it also converges in `L²(dy)` (its coefficients `zⁿ hₙ(x)` are square
summable), so `∫ K_ε(x, y) f(y) dy = Σ e^{−(ε+it)(n+½)} cₙ hₙ(x)` for every `x`, and the right
side, as a function of `x`, is the `L²` sum `Σ e^{−(ε+it)(n+½)} cₙ hₙ`. (b) The real part of the
quadratic form in the exponent is `≤ 0`: in the coordinates `(x ± y)/√2` its coefficients are
`(1 − z)/(2(1 + z))` and `(1 + z)/(2(1 − z))`, whose real parts are `(1 − |z|²)/(2|1 ± z|²) ≥ 0`.
Since `|1 − z²|` stays away from `0` for `ε ∈ (0, 1]` (its limit is `2 sin t > 0`), `|K_ε(x, y)|` is
bounded uniformly in `ε, x, y`. (c) As `ε → 0⁺`, `1 − z² → 2 sin t · e^{i(π/2 − t)}` with argument
in `(−π/2, π/2)`, so the principal root tends to `(2 sin t)^{1/2} e^{i(π/4 − t/2)}`, and
`K_ε(x, y) → mehlerPropagatorKernel t x y` pointwise. Dominated convergence with `f ∈ L¹` gives
pointwise convergence of the integrals; dominated convergence in `ℓ²` gives
`Σ e^{−(ε+it)(n+½)} cₙ hₙ → U f` in `L2` (`U` is determined by `hU` and
`TauCeti.hasSum_hermiteFunctionLp_expansion`). A subsequence converges almost everywhere, so the two
limits agree almost everywhere, and the pointwise limit, being measurable and equal a.e. to `U f`,
is square integrable.

**Checks.**

- The exact Gaussian integrals `∫ K(t, x, y) hₙ(y) dy = e^{−it(n+½)} hₙ(x)` for `n ≤ 2` and
  `t ∈ {π/3, π/2, 2π/3}` (evaluated at `x ∈ {0, 3/10, −6/5}`). The phase is pinned: at `t = π/2`
  the prefactor `e^{+iπ/4}` instead of `e^{−iπ/4}` gives `i e^{−iπ/4} h₀` instead of `e^{−iπ/4} h₀`.
- `t = π/2`: the kernel is `e^{−iπ/4}(2π)^{−1/2} e^{−ixy}`, so `e^{−iπH/2} = e^{−iπ/4} F₁`. With the
  unitary dilation `(D f)(x) = (2π)^{1/4} f(√(2π) x)`, `D hₙ` is Tau Ceti's `twoPiHermiteFunction n`
  (`TauCeti.twoPiHermiteFunction_def`), and `TauCeti.fourier_twoPiHermiteFunctionLp` gives
  `𝓕 = D F₁ D⁻¹` on `L2`; so `e^{−iπH/2} = e^{−iπ/4} D⁻¹ 𝓕 D` in Mathlib's convention.
- `L¹` is needed for the pointwise integral: `|K(x, y)| = (2π sin t)^{−1/2}` does not decay in `y`,
  so for `f(y) = (1 + |y|)^{−1}`, which is in `L²` but not `L¹`, `y ↦ K(x, y) f(y)` is integrable at
  no `x`.

*Needs:* Tau Ceti `TauCeti.hasSum_hermiteFunctionLp_expansion`, `TauCeti.hermiteHilbertBasis`;
DLMF 18.18.28 for complex `z`; Mathlib dominated convergence. The second Check uses
`TauCeti.fourier_twoPiHermiteFunctionLp` and `TauCeti.twoPiHermiteFunction_def`.

### 4.2 The exact Heisenberg evolution

Prove `heisenberg_rotation`: for real `t`, a bounded operator `U` on `L2` with
`U hₙ = e^{−it(n+½)} hₙ`, and a Schwartz function `ψ`, there is a Schwartz function `φ` with
`U ψ = φ` in `L2`, and with `Q = x` and `P = −i d/dx` on Schwartz space (`SchwartzMap.smulLeftCLM`
for the multiplier `x ↦ (x : ℂ)`, which has temperate growth, and `−i SchwartzMap.derivCLM`),

    Q φ = U(cos t · Q ψ + sin t · P ψ),    P φ = U(cos t · P ψ − sin t · Q ψ).

So `U*QU = Q cos t + P sin t` and `U*PU = P cos t − Q sin t` on Schwartz space, which `U` maps into
itself. (Proved here.)

Relation to the metaplectic representation. MetaplecticAutomorphicForms §1.3 defines the group of
pairs `(g, A)`, `A` unitary on `L²(X)`, with `A ρ(h) A⁻¹ = ρ(g·h)` for the Weyl (Schrödinger)
operators `ρ(h)`, and §2.4c restricts it to the Weil representation; §0.18 identifies the smooth
vectors over `ℝ` with Schwartz space. ThetaKernelsForUnitaryDualPairs §3.45(ii) states that the
lift of `exp(θJ)` acts in the Fock model, for `N = 1`, on the polynomials of degree `k` by
`e^{−i(k+½)θ}`. Reaching 4.2 from these statements takes at least four steps: identify `U` with that
operator (the Bargmann transform of 3.45(i) carries the Hermite functions to the monomials, a
dilation converts the character `x ↦ e^{2πix}` used there to the units here, and the orientation of `J`
fixes the sign of `t`); show that `U` preserves Schwartz space (covariance and §0.18);
differentiate the covariance on smooth vectors to pass from the Weyl operators to `Q` and `P`;
and convert the normalisations back. The statement here is that unbounded form for `Q = x`,
`P = −i d/dx`, proved directly from the Hermite expansion.

Route. (i) Coefficients of a Schwartz function decay rapidly. `N = (−d²/dx² + x² − 1)/2` maps
Schwartz space into itself and is symmetric there, and `N hₙ = n hₙ`
(`TauCeti.hermiteFunction_oscillator`), so `(n + 1)ᵏ cₙ = ⟪hₙ, (N + 1)ᵏ ψ⟫` and
`|cₙ| ≤ ‖(N + 1)ᵏ ψ‖₂ (n + 1)^(−k)` for every `k`. (ii) Schwartz seminorms of `hₙ` grow
polynomially. By `TauCeti.mul_hermiteFunction` and `TauCeti.deriv_hermiteFunction`,
`x^α (d/dx)^β hₙ` is a sum of at most `2^(α+β)` terms `c hₘ` with `m ≤ n + α + β` and
`|c| ≤ (n + α + β + 1)^((α+β)/2)` (each of the `α + β` steps splits a term in two and multiplies
its coefficient by at most `√((n + α + β + 1)/2)`); and `|hₘ(x)|² ≤ ‖hₘ‖₂ ‖hₘ′‖₂ ≤ (2m + 1)^(1/2)`
(integrating `(hₘ²)′ = 2hₘhₘ′`, which is integrable, gives
`2hₘ(x)² = ∫_(−∞)^x 2hₘhₘ′ − ∫_x^∞ 2hₘhₘ′ ≤ 2‖hₘ‖₂‖hₘ′‖₂`; and
`‖hₘ′‖₂² ≤ ⟪hₘ, (−d²/dx² + x²) hₘ⟫ = 2m + 1`). So `sup |x^α hₙ^(β)(x)|` is at most a polynomial in
`n`. (iii) Hence, with `|cₙ|` decaying faster than every power, `Σ e^{−it(n+½)} cₙ hₙ` converges
absolutely in every Schwartz seminorm. Its sum `φ`, defined pointwise, is smooth with termwise
derivatives (uniform convergence of every derivative series) and is a Schwartz function, and the
partial sums tend to `φ` in every seminorm. As `‖g‖₂ ≤ (π/2)^(1/2) sup |(1 + x²) g(x)|`, they also
tend to `φ` in `L2`, while they tend to `U ψ` there by `TauCeti.hasSum_hermiteFunctionLp_expansion`
and continuity of `U`; so the class of `φ` is `U ψ`. (Tau Ceti has no statement that Hermite
expansions of Schwartz functions converge in the Schwartz topology; ThetaKernelsForUnitaryDualPairs
uses this fact in the route of §3.45, and steps (i)–(iii) prove what is needed here.) (iv) `Q` and `P` are continuous on Schwartz space, so `Q φ` and `P φ` are the termwise series.
Their `hₘ`-coefficients are `√((m+1)/2) e^{−it(m+3/2)} c_(m+1) + √(m/2) e^{−it(m−½)} c_(m−1)` and
the analogous ones for `P`. The coefficients of `cos t · Qψ + sin t · Pψ` are
`⟪Q hₘ, ψ⟫ cos t + ⟪P hₘ, ψ⟫ sin t` (both operators are symmetric on Schwartz space), and
multiplying by `e^{−it(m+½)}` gives the same numbers, because `cos t − i sin t = e^{−it}` and
`cos t + i sin t = e^{it}`. Two elements of `L2` with the same Hermite coefficients are equal.

**Checks.**

- `ψ = hₖ`, `k ≤ 2`: `x e^{−it(k+½)} hₖ` and `U(cos t · x hₖ − i sin t · hₖ′)` agree, and so do the
  momentum sides (symbolic, at `t ∈ {7/10, 3}`); replacing `+ sin t · P` by `− sin t · P` fails
  already for `h₀`.
- On the truncated Fock matrices (size 12, `t = 7/10`), `U*aU = e^{−it} a`,
  `U*QU = Q cos t + P sin t` and `U*PU = P cos t − Q sin t`, with `Q = (a + a†)/√2`,
  `P = (a − a†)/(i√2)`.
- `t = π`: `U f(x) = −i f(−x)` (from `e^{−iπ(n+½)} = −i(−1)ⁿ` and `TauCeti.hermiteFunction_neg`),
  and the rotation reads `U*QU = −Q`, `U*PU = −P`.

*Needs:* Tau Ceti `TauCeti.hermiteFunction_oscillator`, `TauCeti.mul_hermiteFunction`,
`TauCeti.deriv_hermiteFunction`, `TauCeti.hasSum_hermiteFunctionLp_expansion`,
`TauCeti.hermiteSchwartzMap` (`hₙ` as a Schwartz function); Mathlib `SchwartzMap.smulLeftCLM`,
`SchwartzMap.derivCLM`, `SchwartzMap.toLp`. The third Check uses
`TauCeti.hermiteFunction_neg`.

### Examples

- Parity and its square: `e^{−iπH} f(x) = −i f(−x)` and `e^{−2πiH} = −1`, from
  `e^{−2πi(n+½)} = −1`; the formula of 4.1 on `(π, 2π)` follows by composing with parity.
- Expectations follow the classical orbit: for a unit Schwartz vector `ψ`, the expectations
  `q(t) = ⟪U ψ, Q U ψ⟫` and `p(t) = ⟪U ψ, P U ψ⟫` satisfy `q(t) = q(0) cos t + p(0) sin t` and
  `p(t) = p(0) cos t − q(0) sin t`.

### Dependencies

4.1 and 4.2 need Tau Ceti's Hermite basis and ladder identities only; neither needs Layers 1–3.

## Scope and ownership

Owned here: Dirac's ladder theorem and the vacuum towers on an inner product space (Layer 1), the
Rellich–Dixmier theorem in Hilbert-basis form (Layer 2), the equivalence of the
Ornstein–Uhlenbeck semigroup with `e^{−t(H − ½)}` under the ground-state transform, Mehler's heat
kernel with the trace norm and diagonal integral of `e^{−tH}` (Layer 3), Mehler's kernel of
`e^{−itH}` on `(0, π)` and the exact rotation of position and momentum on Schwartz space (Layer 4).
None of these is stated by a roadmap on main or by a pinned library. The metaplectic operator of a
rotation, covariant with the Weyl operators, belongs to MetaplecticAutomorphicForms (§§1.3, 2.4c),
and ThetaKernelsForUnitaryDualPairs §3.45(ii) gives its action in the Fock model; 4.2 states how
its own statement relates to them.

Already in the library or on main, and used rather than restated:

- Tau Ceti (from the completed roadmap OrthogonalL2Bases): the Hermite functions, their
  orthonormality, Hilbert basis and Parseval identity, the ladder, number and oscillator operators
  on real Schwartz space with the commutation relation, `H hₙ = (n + ½) hₙ`, and the Fourier
  eigenrelation; the Gaussian Hermite basis of `L²(γ)`; trace-class operators through the nuclear
  gauge.
- QuantumFoundations §9.2: the closures of the ladder operators with their domains, the closed
  oscillator `2N + 1`, its pure point spectrum, resolvent and functional calculus, and Nelson's
  theorem for `Q`, `P`; §4.2 the uncertainty relations and their Gaussian minimisers; §6.4 Fock
  space and `‖(a†)ⁿΩ‖² = n!`; §6.7 the cutoff oscillator. The ground state as the unique solution of
  `aψ = 0`, the zero-point energy `½ = min ⟪ψ, Hψ⟫` and the virial identity
  `⟪hₙ, x² hₙ⟫ = ⟪hₙ, p² hₙ⟫ = n + ½` follow in one or two steps from these and are not targets.
- UnboundedOperators: common invariant domains and Nelson's theorem (§5.3), the theorem that no
  bounded `P`, `Q` satisfy `PQ − QP = c` with `c ≠ 0` (§5.1, UO-E01), and the oscillator cores
  (§5.6, UO-E05).
- MetaplecticAutomorphicForms §1.2: the Stone–von Neumann theorem for Weyl pairs, which is a
  different hypothesis from that of 2.1.
- OrnsteinUhlenbeckSemigroup: Mehler's formula for the Ornstein–Uhlenbeck semigroup with respect to
  the Gaussian measure and the Hermite eigenfunctions of its generator; 3.1 and 3.2 transport them,
  and its `mehlerKernel` relates to `mehlerHeatKernel` by the last clause of 3.2.

Not treated here: the Segal–Bargmann transform and coherent states, which
SpecialFunctionsAffineHeisenbergGroups (§3.4) and ThetaKernelsForUnitaryDualPairs (§3.45) treat;
Cramér's inequality `|hₙ(x)| ≤ π^{−1/4}` (DLMF 18.14.9), whose short proof by Indritz (1961) could
not be read here; Plancherel–Rotach asymptotics and the classical (arcsine) limit of `|hₙ|²`;
multidimensional and anisotropic oscillators; anharmonic perturbations; the metaplectic
representation.

Related formal work. The physlib library (leanprover-community/physlib, formerly PhysLean) has a
harmonic oscillator development on Schwartz space with eigenstates, ladder operators and a
one-dimensional completeness proof, and an algebraic ladder system over a field with vacuum words
and an occupation basis. Nothing here is taken from it.

## Exact supplier contracts

### From Mathlib

- `LinearPMap`, `LinearPMap.closure`, `LinearPMap.adjoint`, `LinearPMap.IsFormalAdjoint`,
  `IsSelfAdjoint` (the unbounded adjoint on a complete space), `HilbertBasis`,
  `exists_hilbertBasis`, `Module.End.eigenspace`.
- `ProbabilityTheory.stdGaussian`, `ProbabilityTheory.measurePreserving_eval_multivariateGaussian`,
  `ProbabilityTheory.multivariateGaussian_zero_one`, `integral_withDensity_eq_integral_smul`,
  `integral_gaussian`.
- `SchwartzMap.smulLeftCLM` (multiplication by a function of temperate growth),
  `SchwartzMap.derivCLM`, `SchwartzMap.toLp`; `MemLp`, `eLpNorm`, `Lp`.

### From Tau Ceti

- `TauCeti.hermiteFunction`, `TauCeti.hermiteFunctionLp`, `TauCeti.hermiteHilbertBasis`,
  `TauCeti.hasSum_hermiteFunctionLp_expansion`
  (`Analysis/SpecialFunctions/Hermite/Function/{Basic,Lp,HilbertBasis,Parseval}.lean`).
- `TauCeti.mul_hermiteFunction`, `TauCeti.deriv_hermiteFunction` (`.../Function/Ladder.lean`),
  `TauCeti.hermiteFunction_oscillator` (`.../Function/Oscillator.lean`),
  `TauCeti.hermiteFunction_neg` (`.../Function/Basic.lean`), `TauCeti.hermiteAnnihilationCLM`,
  `TauCeti.hermiteCreationCLM`, `TauCeti.hermiteOscillatorCLM` (`.../Function/Operator.lean`),
  `TauCeti.hermiteSchwartzMap` (`.../Function/Schwartz.lean`).
- `TauCeti.twoPiHermiteFunction_def` (`.../Function/Fourier/Basic.lean`),
  `TauCeti.fourier_twoPiHermiteFunctionLp` (`.../Function/Fourier/HilbertBasis.lean`).
- `TauCeti.gaussianHermiteHilbertBasis` (`Probability/Distributions/Gaussian/Hermite/Basis.lean`),
  `TauCeti.weightL2Isometry` (`MeasureTheory/Function/WeightL2Isometry.lean`).
- `ContinuousLinearMap.nuclearENorm`, `ContinuousLinearMap.nuclearENorm_id_eq_top`
  (`Analysis/OperatorIdeal/Nuclear/Basic.lean`), the trace-class family
  `TauCeti.OperatorIdealFamily.traceClass` whose gauge it is (`.../Family/TraceClass.lean`),
  `ContinuousLinearMap.singularValue_comp_linearIsometryEquiv`
  (`.../ApproximationNumber/Isometry.lean`), `lp.diagonalCLM`
  (`Analysis/Normed/Lp/Diagonal/Basic.lean`), `lp.singularValue_diagonalCLM`
  (`.../ApproximationNumber/Diagonal.lean`).
- `TauCeti.heisenberg` (named in Layer 1 only).

### From TauCetiRoadmap.UnboundedOperators

- §5.3 (UO-E03): `CommonInvariantDomain`, `CommonInvariantDomain.action`,
  `CommonInvariantDomain.restricted`, copied verbatim; `nelson_essential_selfAdjoint` (symmetric
  restrictions with a mixed-word factorial bound on a common dense invariant domain have
  self-adjoint closures), used in step 5 of 2.1. §5.6 (UO-E05), used in a Check of 2.1; §5.1
  (UO-E01), cited in the scope section.

### From TauCetiRoadmap.VonNeumannAlgebras

- V10.ClosedOperators: for a densely defined closed operator `T`, `T*T` and `TT*` are self-adjoint
  and positive, and the polar decomposition `T = U|T|` with `U` a partial isometry from the closure
  of the range of `|T|` onto the closure of the range of `T`; used in steps 1–2 of 2.1.

### From TauCetiRoadmap.SelfAdjointSpectralTheory

- SA-E01 (spectral measure of a self-adjoint operator), SA-E03 (spectral projection), SA-E08
  (support on the spectrum), SA-E09 (self-adjoint spectral restriction), SA-E10 (gap resolvent),
  SA-E13 (form bounds on a spectral range); used in step 2 of 2.1.

### From TauCetiRoadmap.QuantumFoundations

- §9.2: the functional calculus of the closed oscillator `2N + 1`, which identifies the operators
  `T` and `U` of the Conventions with `e^{−tH}` and `e^{−itH}`. Nothing in a target's route rests
  on it.

### From TauCetiRoadmap.OrnsteinUhlenbeckSemigroup

- 1.1 `noiseKernel`, `ouKernel`, `ouSemigroup` and 1.2 `mehlerKernel`, copied verbatim (the first
  itself copied from DenoisingDiffusion 2.1), on `EuclideanSpace ℝ (Fin d)` with the standard
  Gaussian `stdGaussian`.
- 1.2 `TauCetiRoadmap.OrnsteinUhlenbeckSemigroup.ouKernel_eq_withDensity`: for `t > 0`,
  `ouKernel t x` is the standard Gaussian with density `mehlerKernel t x ·`; used in 3.1 (iv) and
  3.2.
- 2.4 `TauCetiRoadmap.OrnsteinUhlenbeckSemigroup.ouSemigroup_hermiteProd`: for `t ≥ 0`,
  `P_t H_α = e^{−|α|t} H_α`; used in 3.1 (iii) at `d = 1`.
- 3.3 `eLpNorm_ouSemigroup_le`: Nelson's hypercontractivity, used at `p = q = 2` in 3.1 (iv).

## References

- J. Dixmier, *Sur la relation i(PQ − QP) = 1*, Compositio Math. 13 (1956–1958), 263–269 (Numdam);
  Théorème 1, p. 265, proof pp. 265–267.
- F. Rellich, *Der Eindeutigkeitssatz für die Lösungen der quantenmechanischen
  Vertauschungsrelationen*, Nachr. Akad. Wiss. Göttingen, Math.-Phys. Kl. (1946), 107–115 (cited
  through Dixmier, not consulted).
- G. Teschl, *Mathematical Methods in Quantum Mechanics*, 2nd ed., AMS, 2014 (author's PDF);
  §8.3, pp. 178–179; §8.4, Theorem 8.6, p. 180.
- NIST Digital Library of Mathematical Functions, §18.18, equation 18.18.28 (Mehler's formula for
  `|z| < 1`); §18.14, equation 18.14.9 (the bound in the scope section).
- A. Indritz, *An inequality for Hermite polynomials*, Proc. Amer. Math. Soc. 12 (1961), 981–983
  (not consulted).
