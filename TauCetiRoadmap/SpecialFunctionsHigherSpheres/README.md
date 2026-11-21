# Roadmap: special functions on spheres: `SO(n)`, `U(n)`, Gegenbauer and disk polynomials

**Summary.** This roadmap develops the harmonic analysis of the real sphere `S^{n-1} ⊂ ℝⁿ` under
`SO(n)` and of the complex sphere `S^{2n-1} ⊂ ℂⁿ` under `U(n)`, and the special functions that it
produces: Gegenbauer polynomials as the zonal spherical functions of `(SO(n), SO(n - 1))` and
disk polynomials as those of `(U(n), U(n - 1))`. It proves the closed dimension of the spaces of
spherical harmonics, the uniqueness of the zonal harmonic, the addition theorem and reproducing
kernel, the Funk–Hecke formula, the Laplace integral, the product formula and the Gegenbauer
addition theorem, the classification of the spherical functions of both pairs, the branching of
harmonics from `ℝ^{m+1}` to `ℝᵐ` with explicit Gegenbauer factors, the harmonics of bidegree
`(p, q)` on `ℂⁿ` with their dimension and branching, the orthogonality of disk polynomials, and the
expansion of the zonal polynomials of `SO(2n)` in disk polynomials. It also proves the expansion
of a plane wave in `ℝⁿ`, `n ≥ 4`, in spherical harmonics, and Bochner's theorem on the Fourier
transform of `f(|x|) Y(x/|x|)`. The roadmap is a synthesis of
several sources and follows none of them in its organization: it is ordered by proof dependency,
from the sphere and its measure, through harmonic polynomials and zonal polynomials, to the
integral identities and spherical functions, and then repeats the pattern for the complex sphere.
Its sources are Vilenkin–Klimyk (*Representation of Lie Groups and Special Functions*, Vol. 2,
Chapters 9–11), Klimyk–Vilenkin (*Representations of Lie Groups and Special Functions*, in
Encyclopaedia of Mathematical Sciences 59), Wawrzyńczyk (*Group Representations and Special
Functions*, Chapters 5 and 9) and Dieudonné (*Special Functions and Linear Representations of Lie
Groups*, §7); each subsection cites several of them by locator; see [References](#references).

The nearest roadmaps are [RiemannianGeometry](../RiemannianGeometry/README.md), whose R8 owns the
spectral theory of spherical harmonics; [LaguerreJacobi](../LaguerreJacobi/README.md), which owns
the Gegenbauer and Jacobi polynomials as polynomials;
[CompactGroups](../RepresentationTheory/CompactGroups/README.md), which owns Peter–Weyl; and two
roadmaps of the same project, SpecialFunctionsGroupModels (Gel'fand pairs and spherical functions
in general) and SpecialFunctionsSU2MatrixElements (the case of `S²`).

Mathlib has the surface measure on the unit sphere, the orthogonal and unitary matrix groups,
multivariate polynomials with partial derivatives and weighted homogeneous components, the
Chebyshev polynomials and the Gamma function. Tau Ceti has the Laplacian on polynomials, the
harmonic homogeneous polynomials with the Fischer decomposition and their dimension, the
restriction to the sphere with its injectivity on harmonic polynomials, compactness and the
topological-group structure of the unitary groups, and the Haar probability measure of a compact
group. Neither has zonal polynomials, Gegenbauer polynomials as functions on a sphere, the addition
theorem, the Funk–Hecke formula, harmonics of bidegree `(p, q)`, disk polynomials or the Gel'fand
pairs of this roadmap.

The roadmap covers:
- the sphere, the stabilizer `K_η` of a unit vector, transitivity and the double cosets, the
  normalized sphere measure with its invariance, its image of the Haar measure and its polar-angle
  density, and the Gel'fand pair `(SO(n), K_η)` (Layer 1);
- the closed dimension of the spherical harmonics, their inequivalence for distinct degrees and
  the uniqueness of the `K_η`-invariant harmonic (Layer 2);
- the normalized zonal polynomial `ω_{n,l}` with its Gegenbauer, Chebyshev and Legendre forms, the
  value at one, generating function and derivative of the Gegenbauer polynomial, the differential
  equation, the zonal harmonic and the Laplace integral (Layer 3);
- the addition theorem and reproducing property, the bound `|ω| ≤ 1`, orthogonality, the
  Funk–Hecke formula, the zonal spherical functions with their classification and product
  formula, the Gegenbauer addition theorem, the plane-wave expansion and Bochner's theorem
  (Layer 4);
- the branching of harmonics from `ℝ^{m+1}` to `ℝᵐ`, with its dimension count, its norm constant
  and the Gel'fand–Tsetlin basis it generates (Layer 5);
- `U(n)` and the complex sphere: the disc density, the Gel'fand pair `(U(n), K_η)`, harmonics of
  bidegree `(p, q)` with their dimension, decomposition, highest weight and branching, disk
  polynomials with their Jacobi form, orthogonality and bound, the `U(n)`-zonal harmonic, the
  spherical functions with their classification, the addition theorem, and the expansion of the
  `SO(2n)` zonal polynomials in disk polynomials (Layer 6).

## How to read the build

Layer 1 fixes the sphere, its measure and the base point; its polar-angle density turns every
integral of a function of `⟪η, x⟫` into an integral over `[-1, 1]`, which is how the orthogonality
and Funk–Hecke statements become one-variable identities. Layer 2 is the bridge to Tau Ceti and to
RiemannianGeometry R8: the harmonic spaces, their dimension, and the uniqueness of the
`K_η`-invariant harmonic, which is the heart of every subsequent identification. Layer 3 builds the
zonal polynomial as an explicit terminating sum and the zonal harmonic as its homogenization, and
proves the one-variable facts. Layer 4 combines them: the addition theorem follows from uniqueness
(Layer 2) and invariance of the measure (Layer 1), and Funk–Hecke, orthogonality, the bound, the
spherical functions and the product formula follow from the addition theorem. The Gegenbauer
addition theorem of 4.5 needs the branching of Layer 5 for its proof. Layer 6 repeats the pattern
for `U(n)`, with harmonics of bidegree `(p, q)` in place of degree `l`; its last subsection
connects the two halves.

The harder material is the uniqueness of the invariant harmonic (2.3 and 6.4), the
classifications (4.4 and 6.5), which need Peter–Weyl, and the branching decomposition with its
norm constant (5.1).

## Conventions

- **Dimensions.** `n` is the dimension of the ambient space: `S^{n-1} ⊂ ℝⁿ` with `SO(n)`, and
  `S^{2n-1} ⊂ ℂⁿ` with `U(n)`. This is the convention of Vilenkin–Klimyk Chapters 9–11 and of
  Wawrzyńczyk Chapter 9. Dieudonné (§7) and Klimyk–Vilenkin (Part II, Chapter 2, §2.4) write
  `Sⁿ ⊂ ℝ^{n+1}` with `SO(n + 1)`, so their `n` is `n - 1` here.
- **Base point.** A unit vector `η` replaces the sources' north pole `e_n`, and
  `K_η = rotationStabilizer η` (or `unitaryStabilizer η`) is its stabilizer. Every statement
  holds for every unit `η`.
- **Actions.** Groups act on the left: `g • x = g x` (`rotE`, through `Matrix.toEuclideanLin`),
  and on functions by `(g · f)(x) = f(g⁻¹ x)`, as in Tau Ceti and in Vilenkin–Klimyk §11.2.2.
- **Inner products** are conjugate-linear in the first argument, as in Mathlib:
  `⟪y, x⟫ = ∑ conj(yᵢ) xᵢ`. The complex variable of a disk polynomial is `w = ⟪η, ξ⟫`, which is
  holomorphic in `ξ`.
- **Measures.** `sphereMeasure n` and `complexSphereMeasure n` are probability measures (the
  surface measure divided by its total mass), and the Haar measure of a compact group has mass `1`.
  With these, every reproducing constant is a dimension: `∑ Yᵢ(x) Yᵢ(y) = dim H_l ω_{n,l}(⟪x, y⟫)`.
  Vilenkin–Klimyk §9.1.9 and §10.2.1 use the same normalization; the unnormalized constants carry
  the factor `|S^{n-1}| = 2π^{n/2}/Γ(n/2)`.
- **Zonal polynomials.** `ω_{n,l}(t) = ₂F₁(-l, l + n - 2; (n - 1)/2; (1 - t)/2)`, normalized by
  `ω_{n,l}(1) = 1`. For `n ≥ 3` and `λ = (n - 2)/2` it is `C_l^{(λ)}(t)/C_l^{(λ)}(1)`, the
  normalized Gegenbauer polynomial of Vilenkin–Klimyk §9.3.2 (4) and of Wawrzyńczyk (9.2.11). The
  index `λ` is DLMF's; Vilenkin–Klimyk and Wawrzyńczyk write `p`.
- **Disk polynomials.** `R^α_{p,q}(w) = w^{p-q} ₂F₁(-q, p + α + 1; α + 1; 1 - |w|²)` for `p ≥ q`
  and `R^α_{q,p} = conj R^α_{p,q}`, with `R^α_{p,q}(1) = 1`. The `U(n)` case is `α = n - 2`.
- **Weights of `U(n)`.** The diagonal torus `t = diag(t₁, …, tₙ)` acts on `f(z)` by
  `f(t⁻¹ z)`; a weight is the exponent vector of the character by which it acts. With this
  action `z̄ⱼ` has weight `εⱼ` and `zⱼ` has weight `-εⱼ`.
- **Spherical functions** follow SpecialFunctionsGroupModels §5.2: continuous, bi-invariant,
  `φ(1) = 1` and `∫_K φ(x k y) dk = φ(x) φ(y)`, without a boundedness requirement. The spherical
  function of a class-one representation with fixed unit vector `v` is `g ↦ ⟪v, T(g) v⟫`; on
  `(U(n), K_η)` this is `R^{n-2}_{p,q}(⟪g η, η⟫)`, which is the conjugate argument of
  `⟪η, g η⟫` (6.5 Checks).

## Layer 1: the sphere and the rotation group

### 1.1 The sphere, the stabilizer and the double cosets

Sources: Vilenkin–Klimyk §9.1.9 (1)–(6), p. 22 (the sphere as `SO(n)/SO(n - 1)`, spherical
coordinates); Wawrzyńczyk §9.1, p. 323 (the pair `(SO(n), K)` and the sphere `SO(n)/K`);
Dieudonné §7, p. 22 (the `K`-orbits on the sphere are the parallel spheres).

`SO(n)` acts on `ℝⁿ` by `rotE` (`smul_def`), `Sphere n` is the unit sphere, and
`rotationStabilizer η` is the stabilizer `K_η` of `η` (`MulAction.stabilizer`). Prove:
- **Transitivity** (`exists_smul_eq`): for `n ≥ 2`, every unit vector is `g η` for some
  `g ∈ SO(n)`;
- `K_η` is closed, hence compact, and for a unit vector `η` it is conjugate to the copy of
  `SO(n - 1)` fixing the last coordinate;
- **Double cosets** (`exists_mul_mul_eq_iff_inner`): for `n ≥ 3` and unit `η`,
  `h ∈ K_η g K_η` exactly when `⟪η, g η⟫ = ⟪η, h η⟫`.

Route: Gram–Schmidt completes `η` and `ξ` to positively oriented orthonormal bases. For the double
cosets, `K_η` acts transitively on each sphere `{x : ⟪η, x⟫ = t, |x| = 1}` when `n ≥ 3`, so
`g η` and `h η` are related by some `k₁ ∈ K_η`, and `(k₁ g)⁻¹ h ∈ K_η`.

**Checks.**
- For `n = 3`, `η = e₃` and `g` the rotation by `θ` about `e₁`, `⟪η, g η⟫ = cos θ`.
- Negative control: for `n = 2`, `K_η` is trivial, the rotations by `0.5` and `-0.5` have the same
  `⟪η, g η⟫ = cos 0.5` and lie in different double cosets; the hypothesis `n ≥ 3` is needed.
- Negative control: for `n = 1`, `SO(1)` is trivial and does not map `1` to `-1`; transitivity
  needs `n ≥ 2`.
- `rotationStabilizer 0` is all of `SO(n)`.

### 1.2 The normalized sphere measure

Sources: Vilenkin–Klimyk §9.1.9, p. 22 (the invariant measure and, in the display between (5) and
(6), its expression `dξ = Γ(n/2)/(√π Γ((n - 1)/2)) sin^{n-2} θ dη dθ`); Wawrzyńczyk (9.1.3),
p. 323; Klimyk–Vilenkin Part II, Chapter 2, §2.4, (24), p. 179 (the reduction of an integral over
`S^{n-1}` to the polar angle).

`sphereMeasure n` is Mathlib's surface measure `MeasureTheory.Measure.toSphere` divided by its
total mass, and `polarConstant n` is `c_n = Γ(n/2)/(√π Γ((n - 1)/2))`. Prove:
- **Invariance** (`integral_smul_sphereMeasure`): `∫ f(g x) dσ(x) = ∫ f dσ` for `g ∈ SO(n)`;
- **Haar to sphere** (`integral_haarProb_smul`): for `n ≥ 2` and unit `η`, the image of
  `TauCeti.haarProb (SOn n)` under `g ↦ g η` is `sphereMeasure n`;
- **Polar-angle density** (`integral_inner_sphereMeasure`): for `n ≥ 2`, unit `η` and continuous
  `f`, `∫ f(⟪η, x⟫) dσ(x) = c_n ∫_{-1}^{1} f(t) (1 - t²)^{(n-3)/2} dt`;
- the normalized measure is the unique `SO(n)`-invariant Borel probability measure on the sphere
  for `n ≥ 2`.

Route: invariance from the rotation invariance of Lebesgue measure; Haar to sphere from the
uniqueness of invariant probability measures on the homogeneous space; the density by integrating
out the `K_η`-orbits in the spherical coordinates of Vilenkin–Klimyk §9.1.9 (6).

**Checks.**
- `c_2 = 1/π`, `c_3 = 1/2`, `c_4 = 2/π`, `c_5 = 3/4`.
- The density has total mass one: `c_n ∫_{-1}^{1} (1 - t²)^{(n-3)/2} dt = 1` for `n = 2, …, 6`.
- `∫ ⟪η, x⟫⁴ dσ = 3/(n(n + 2))`: `1/5` for `n = 3`, `3/35` for `n = 5`.
- For `n = 3` the density is the constant `1/2` on `[-1, 1]` (Archimedes).
- Negative control: for `n = 1`, `SO(1)` is trivial, the image of its Haar measure is the point
  mass at `η` and not the uniform measure on `{±1}`; the hypothesis `n ≥ 2` is needed.

### 1.3 The Gel'fand pair `(SO(n), K_η)`

Sources: Wawrzyńczyk Theorem 5.3.3, p. 225 (a symmetric pair is a Gel'fand pair) and §9.1,
p. 323 (`(SO(n), K)` is symmetric); Dieudonné §7, p. 22 (commutativity of the bi-invariant
convolution algebra).

Prove:
- **Gel'fand pair** (`isGelfandPair_SOn`): convolution of continuous bi-`K_η`-invariant functions
  on `SO(n)` commutes, for every `n` and every `η`.

Route: for `n ≥ 3` and unit `η`, `g⁻¹ ∈ K_η g K_η` by 1.1, since `⟪η, g⁻¹ η⟫ = ⟪g η, η⟫`, and
Gel'fand's criterion of SpecialFunctionsGroupModels §5.1 applies with `σ(g) = g⁻¹`. For `n ≤ 2`
the group `SO(n)` is abelian. For `η` not a unit vector, `K_η` is `K_{η/|η|}` or `SO(n)`.

**Checks.**
- For `n = 2`, `K_η` is trivial and the pair is Gel'fand because `SO(2)` is abelian, although
  `g⁻¹ ∉ K_η g K_η` for the rotation by `0.5`.
- For `n = 3`, `(SO(3), SO(2))` is the image of the pair `(SU(2), T)` of
  SpecialFunctionsSU2MatrixElements §6.4.
- Negative control: `(SO(3), {1})` is not a Gel'fand pair: `SO(3)` is not abelian.

## Layer 2: spherical harmonics

### 2.1 Dimension

Sources: Vilenkin–Klimyk §9.2.3 (4)–(5), p. 30 (with erratum E09.2.01 of the project's errata
file for the printed dimension of the homogeneous polynomials); Wawrzyńczyk §9.4, p. 335 (the
dimension of `H^l_n`, in the text); Dieudonné §7, (99), p. 23.

Prove:
- **Closed dimension formula** (`finrank_harmonicSubmodule_mul`): for `n ≥ 3`,
  `dim H_l(ℝⁿ) = (2l + n - 2)(l + n - 3)!/((n - 2)! l!)`, stated multiplied out in `ℕ`.

Route: Tau Ceti's dimension theorem `C(n + l - 1, l) - C(n + l - 3, l - 2)` and a factorial
identity.

**Checks.**
- `n = 3`: `dim H_l = 2l + 1`, so `1, 3, 5, 7, 9`.
- `n = 4`: `(l + 1)²`; `n = 5`: `1, 5, 14, 30, 55`; `n = 6`: `1, 6, 20, 50, 105`.
- `n = 2`: `dim H_0 = 1` and `dim H_l = 2` for `l ≥ 1`, which the formula gives for `l ≥ 1`.
- Negative control: at `n = 2`, `l = 0` the multiplied-out formula reads `1 · (0! · 0!) = 0 · 0!`,
  which is false; the hypothesis `n ≥ 3` excludes it.

### 2.2 Spherical harmonics as representations

Sources: Vilenkin–Klimyk §9.2.6 (2′), pp. 35–36 (the decomposition of `L²(S^{n-1})` and the
quasi-regular representation); Wawrzyńczyk §9.1, p. 323 (`L²(S^{n-1}) = ⊕ H^l` with pairwise
non-equivalent representations); Dieudonné §7, (100)–(102), pp. 23–24.

The restriction to `SO(n)` of Tau Ceti's orthogonal-group action on harmonic polynomials acts on
`H_l`, and by 1.2 it is unitary for the `L²(sphereMeasure n)` inner product of the restrictions.
Prove:
- **Inequivalence**: for `n ≥ 3` the representations on `H_l` for distinct `l` are pairwise
  inequivalent;
- `L²(S^{n-1})` is the orthogonal Hilbert sum of the restrictions of the `H_l` (R8.2), and every
  irreducible subrepresentation of the quasi-regular representation is one of them.

Route: `H_l` is irreducible (R8.3); for `l ≠ l'` the `K_η`-invariant vectors (2.3) are the zonal
harmonics, whose spherical functions `ω_{n,l}` and `ω_{n,l'}` differ (3.1), so the
representations differ. Alternatively the eigenvalues `l(l + n - 2)` of R8.1 differ. An
irreducible subrepresentation `V` of `L²(S^{n-1})` has a nonzero orthogonal projection to some
`H_l`, which intertwines and is an isomorphism by Schur's lemma (CompactGroups §2.3).

**Checks.**
- For `n = 3` the representation on `H_1` is the defining representation of `SO(3)` and that on
  `H_2` is the five-dimensional representation on traceless symmetric matrices.
- Negative control: for `n = 2` and `l ≥ 1`, `H_l` is the sum of the characters `e^{± ilθ}` and
  is not irreducible; the statements are for `n ≥ 3`.
- For `n = 3`, `H_1` and `H_2` are inequivalent although both are irreducible: their dimensions
  `3` and `5` differ, and so do their spherical functions `t` and `(3t² - 1)/2`.

### 2.3 Class one: the invariant harmonic

Sources: Vilenkin–Klimyk §10.2.1, Lemma, p. 173 (with erratum E10.2.01 of the project's errata
file: the denominator is `C_l^{(n-2)/2}(1)`); Vilenkin–Klimyk §9.2.6, pp. 35–36 (the
representations of class one); Dieudonné §7, p. 23 (uniqueness of the zonal function);
Wawrzyńczyk Theorem 9.2.4, pp. 326–327 (the spherical representations of `(SO(n), K)`) and
(9.2.10)–(9.2.11), p. 330.

Prove:
- **Uniqueness of the zonal harmonic** (`eq_smul_zonalHarmonic`): for `n ≥ 3` and unit `η`, a
  harmonic homogeneous polynomial of degree `l` that is invariant under `K_η` equals
  `p(η) Z_{l,η}`, with `Z_{l,η}` the zonal harmonic of 3.3;
- the irreducible representations of `SO(n)` with a nonzero `K_η`-fixed vector are exactly the
  `H_l` (`n ≥ 3`), and that vector is unique up to a scalar.

Route: a `K_η`-invariant polynomial is a polynomial in `⟪η, x⟫` and `|x|²` (the `K_η`-orbits
are the spheres of 1.1); harmonicity of `∑ a_j ⟪η, x⟫^j |x|^{l-j}` gives the two-term recurrence of
the coefficients of `ω_{n,l}`, which leaves one free constant. For the second bullet, a continuous
irreducible `π` with a unit `K_η`-fixed vector `v` embeds into `L²(SO(n)/K_η) = L²(S^{n-1})` by
`u ↦ (g ↦ ⟪π(g) v, u⟫)` (Frobenius reciprocity), so it is some `H_l` by 2.2.

**Checks.**
- For `n = 3`, `l = 2`, `η = e₃`, the invariant harmonics are the multiples of
  `(3x₃² - |x|²)/2`, with value `1` at `η`.
- `Z_{1,η}(x) = ⟪η, x⟫` for every `n ≥ 2`.
- Negative control: for `n = 2`, `K_η` is trivial, every element of `H_l` is invariant, and
  `dim H_l = 2` for `l ≥ 1`; uniqueness needs `n ≥ 3`.
- Negative control: the misprinted denominator `C_l^{(n-1)/2}(1)` of Vilenkin–Klimyk p. 173 gives
  the value `C_2^{(1/2)}(1)/C_2^{(1)}(1) = 1/3` at `η` for `n = 3`, `l = 2`, not `1`.

## Layer 3: zonal polynomials and Gegenbauer polynomials

### 3.1 The zonal polynomial

Sources: Vilenkin–Klimyk §9.3.2 (2)–(4), p. 47 (the zonal spherical function as a
hypergeometric function and as a normalized Gegenbauer polynomial); Wawrzyńczyk (9.2.11),
p. 330; Klimyk–Vilenkin Part II, Chapter 2, §2.4, (25), p. 180; Dieudonné §7, (103), p. 24.

`zonalPolynomial n l` is the terminating sum
`∑_{k ≤ l} (-l)_k (l + n - 2)_k / (((n - 1)/2)_k k!) ((1 - t)/2)^k` (`zonalPolynomial_def`).
For `n ≤ 1` the lower parameter `(n - 1)/2` is not positive, a denominator may vanish and the
value is junk; every theorem except the value at one assumes `n ≥ 2` or fixes `n`. Prove:
- **Value at one** (`zonalPolynomial_eval_one`): `ω_{n,l}(1) = 1`;
- **Parity** (`zonalPolynomial_comp_neg`): `ω_{n,l}(-t) = (-1)^l ω_{n,l}(t)` for `n ≥ 2`;
- **Degree** (`natDegree_zonalPolynomial`): `ω_{n,l}` has degree exactly `l` for `n ≥ 2`;
- **Gegenbauer form** (`gegenbauer_eq_zonalPolynomial`): for `n ≥ 3` and `λ = (n - 2)/2`,
  `C_l^{(λ)} = ((n - 2)_l / l!) ω_{n,l}`;
- **Chebyshev** (`zonalPolynomial_two`): `ω_{2,l} = T_l`;
- **Legendre** (`zonalPolynomial_three`): `ω_{3,l} = P_l = P_l^{(0,0)}`;
- **Chebyshev of the second kind** (`zonalPolynomial_four`): `(l + 1) ω_{4,l} = U_l`.

Route: the Gegenbauer form by comparison with DLMF 18.5.10 through Pfaff's transformation, or by
the Jacobi relation of LaguerreJacobi §6.2 and the hypergeometric form of the Jacobi polynomials;
the parity from the symmetry `t ↦ -t` of the differential equation of 3.2; the special cases by
the same differential equation and the value at one.

**Checks.**
- `ω_{n,0} = 1` and `ω_{n,1}(t) = t` for every `n ≥ 2`.
- `ω_{n,2}(t) = (n t² - 1)/(n - 1)`: at `t = 0.3` it is `-0.82` for `n = 2`, `-0.365` for
  `n = 3` and `-0.092` for `n = 6`.
- `ω_{3,2}(t) = (3t² - 1)/2` and `ω_{5,2}(t) = (5t² - 1)/4`.
- `ω_{2,3}(0.3) = T_3(0.3) = -0.792`.
- `ω_{n,l}(-1) = (-1)^l`.
- Negative control: `ω_{4,2}(t) = (4t² - 1)/3`, while the unnormalized `C_2^{(1)}(t) = 4t² - 1`;
  with the lower parameter `(n - 2)/2` in place of `(n - 1)/2` the value at `t = 0.3`, `n = 4`
  would be `-0.575` instead of `-0.21333`.

### 3.2 One-variable identities

Sources: Vilenkin–Klimyk §9.3.7 (1)–(2), pp. 59–60 (generating function), with the value
`C_k^{(p)}(1) = Γ(2p + k)/(k! Γ(2p))` in the text of p. 60; Wawrzyńczyk (9.2.9), p. 330 (the
generating series) and (9.3.1)–(9.3.2), p. 331 (the differential equation and the derivative
`d/dt C_m^{(α)} = 2α C_{m-1}^{(α+1)}`, with erratum W84-E09.3.01 of the project's errata file for
the eigenvalue in the display before (9.3.1)); Dieudonné §7, (103), p. 24 (the differential
equation).

Prove:
- **Value at one** (`gegenbauer_eval_one`): `C_l^{(λ)}(1) = (2λ)_l/l!` for every real `λ`;
- **Generating function on the disc** (`hasSum_gegenbauer`): for `|t| ≤ 1` and `|z| < 1`,
  `∑_l C_l^{(λ)}(t) zˡ = (1 - 2tz + z²)^{-λ}`;
- **Derivative** (`derivative_gegenbauer`): `d/dt C_{l+1}^{(λ)} = 2λ C_l^{(λ+1)}`;
- **Derivative of the zonal polynomial** (`derivative_zonalPolynomial`): for `n ≥ 2`,
  `ω_{n,l+1}' = ((l + 1)(l + n - 1)/(n - 1)) ω_{n+2,l}`;
- **Differential equation** (`zonalPolynomial_ode`): for `n ≥ 2`,
  `(1 - t²) ω'' - (n - 1) t ω' + l(l + n - 2) ω = 0`.

Route: the generating function for small `|z|` is SpecialFunctionsBessel §4.3 (DLMF 18.12.4);
both sides are analytic in `z` on the disc `|z| < 1`, since for `t = cos θ` the zeros of
`1 - 2tz + z²` are `e^{±iθ}`, so the identity extends by the identity theorem and the radius of
convergence of the series is at least `1`. The derivative by differentiating the explicit sum term
by term; the differential equation from the hypergeometric equation in `(1 - t)/2`.
Vilenkin–Klimyk's route to the generating function is group theoretic: `|x - h|^{2-n}` is
harmonic in `x` and invariant under `K_η` for `h = |h| η`, so its Taylor coefficients in `|h|` are
zonal harmonics.

**Checks.**
- At `λ = 3/2`, `t = 0.4`, `z = 0.3` both sides of the generating function are `1.27606 15166`.
- At `λ = 0` the generating function gives `C_0^{(0)} = 1` and `C_l^{(0)} = 0` for `l ≥ 1`, in
  agreement with LaguerreJacobi §6.2; the value at one is `(0)_l/l! = 0` for `l ≥ 1`.
- `ω_{5,4}' = 7 ω_{7,3}` (the case `n = 5`, `l = 3`).
- The residual of the differential equation for `ω_{n,3}` at `t = 0.35` vanishes for `n = 2, 3, 5`.
- Negative control: with `(n - 2) t ω'` in place of `(n - 1) t ω'`, the residual for `ω_{5,3}` at
  `t = 0.35` is `-0.03741`, not `0`.

### 3.3 The zonal harmonic

Sources: Vilenkin–Klimyk §9.2.3 (3), p. 30 (the harmonic projection) and §10.2.1, Lemma,
p. 173; Wawrzyńczyk (9.2.10)–(9.2.11), p. 330; Dieudonné §7, p. 23.

`linearForm η` is the polynomial `x ↦ ⟪η, x⟫` (`eval_linearForm`), and `zonalHarmonic n l η` is
`∑_j c_j ⟪η, x⟫^j |x|^{l-j}` over `j ≡ l (mod 2)`, where `c_j` are the coefficients of
`ω_{n,l}` and `|x|²` is `MvPolynomial.normSq`. Prove:
- **The zonal harmonic is harmonic** (`zonalHarmonic_mem_harmonicSubmodule`): for `n ≥ 2` and a
  unit vector `η`, `Z_{l,η} ∈ H_l`;
- **Values on the sphere** (`eval_zonalHarmonic`): for `n ≥ 2` and `|x| = 1`,
  `Z_{l,η}(x) = ω_{n,l}(⟪η, x⟫)`;
- **Invariance** (`eval_smul_zonalHarmonic`): `Z_{l,η}(k x) = Z_{l,η}(x)` for `k ∈ K_η`.

Route: the Laplacian of `⟪η, x⟫^j |x|^{2i}` with `|η| = 1` is
`j(j - 1)|x|^{2i} ⟪η, x⟫^{j-2} + 2i(2i + n - 2 + 2j) ⟪η, x⟫^j |x|^{2i-2}`, and the coefficient
recurrence is that of the differential equation of 3.2.

**Checks.**
- For `n = 3`, `l = 2`: `Z = (3⟪η, x⟫² - |x|²)/2`, of Laplacian `0`, with `Z(η) = 1`.
- For `n = 4`, `l = 2`: `Z = (4⟪η, x⟫² - |x|²)/3`.
- The zonal harmonics of degrees `2, 3, 4` in dimensions `2, 3, 4, 5`, for
  `η = (1/3, 2/3, 2/3, 0, …)` (and `(3/5, 4/5)` for `n = 2`), have Laplacian `0` and value `1` at
  `η`.
- Negative control: `η` must be a unit vector: for `n = 3`, `l = 2` the Laplacian of
  `(3⟪η, x⟫² - |x|²)/2` is `3(|η|² - 1)`.
- Negative control: `P_2` homogenized in `ℝ⁴`, `(3x₄² - |x|²)/2`, has Laplacian `-1`; the
  dimension in `ω_{n,l}` must be that of the ambient space.

### 3.4 The Laplace integral

Sources: Vilenkin–Klimyk §9.3.2 (2), p. 47; Wawrzyńczyk (9.4.5), p. 334 (with erratum
W84-E09.4.01 of the project's errata file: the printed constant lacks the factor `1/√π`).

Prove:
- **Laplace integral** (`zonalPolynomial_eval_cos_eq_integral`): for `n ≥ 3`,
  `ω_{n,l}(cos φ) = c'ₙ ∫_0^π (cos φ + i sin φ cos θ)^l sin^{n-3} θ dθ` with
  `c'ₙ = Γ((n - 1)/2)/(√π Γ((n - 2)/2))`.

Route: the function `x ↦ (⟪η, x⟫ + i⟪ζ, x⟫)^l` with `ζ ⊥ η` a unit vector is harmonic; average it
over `K_η` and apply 2.3 and the density of 1.2 on the sphere `S^{n-2}` of `ζ`.

**Checks.**
- `c'₃ = 1/π`, `c'₄ = 1/2`, `c'₅ = 2/π`.
- At `φ = 0.9`, `n = 3`, `l = 2` both sides are `0.07959 84290` (Laplace's first integral for
  `P_2`); at `n = 5`, `l = 3` both are `-0.04587 59550`.
- Vilenkin–Klimyk and Wawrzyńczyk print the integrand with `- i` in place of `+ i`; the
  substitution `θ ↦ π - θ` gives the sign used here.
- Negative control: for `n = 2` the constant `c'₂` has `Γ(0)` in the denominator; the formula
  needs `n ≥ 3`.

## Layer 4: addition theorem, Funk–Hecke, spherical functions

### 4.1 Addition theorem and reproducing kernel

Sources: Vilenkin–Klimyk §10.2.1 (2)–(3), pp. 174–175 (the convolution theorem and the addition
theorem with normalized measure); Wawrzyńczyk, Problem 8 (a)–(c), p. 341 (the reproducing
property and the addition theorem).

Prove:
- **Addition theorem** (`sum_sphereEval_mul_sphereEval_eq`): for `n ≥ 2` and an
  `L²(sphereMeasure n)`-orthonormal basis `Y` of `H_l`,
  `∑ᵢ Yᵢ(x) Yᵢ(y) = dim H_l · ω_{n,l}(⟪x, y⟫)` on the sphere;
- **Reproducing property** (`integral_sphereEval_mul_zonalPolynomial`): for `n ≥ 2` and
  `p ∈ H_l`, `∫ p(x) ω_{n,l}(⟪x, y⟫) dσ(x) = p(y)/dim H_l`;
- **Bound** (`abs_zonalPolynomial_eval_le_one`): `|ω_{n,l}(t)| ≤ 1` for `|t| ≤ 1` and `n ≥ 2`;
- `dim H_l · ω_{n,l}(⟪·, y⟫)` restricted to the sphere is the kernel of the orthogonal projection of
  `L²(S^{n-1})` onto `H_l`.

Route: `K(x, y) = ∑ Yᵢ(x) Yᵢ(y)` does not depend on the basis, is invariant under the diagonal
action of `SO(n)` (1.2), so `K(·, y) ∈ H_l` is `K_y`-invariant and is `K(y, y) Z_{l,y}` by 2.3
(for `n = 2` directly from `cos`, `sin`); integrating `K(y, y)` over `y` gives `dim H_l`. The bound
is Cauchy–Schwarz on `K`.

**Checks.**
- `n = 3`: in the surface measure of total mass `4π`,
  `∑_m Y_{l,m}(x) conj Y_{l,m}(y) = (2l + 1)/(4π) P_l(⟪x, y⟫)`, the addition theorem of the
  spherical harmonics (SpecialFunctionsLegendre §3.2, with its group proof in
  SpecialFunctionsSU2MatrixElements §6.3); with mass `1` the factor is `2l + 1 = dim H_l`.
- `n = 2`: `Y = √2 cos lθ, √2 sin lθ` gives `2 cos l(θ - θ') = 2 T_l(cos(θ - θ'))`.
- `l = 0`: `Y = 1` and `ω = 1`.
- Negative control: in the unnormalized surface measure of `S²` the constant is `(2l + 1)/(4π)`,
  not `2l + 1`; the normalization of 1.2 is what makes the constant a dimension.

### 4.2 Orthogonality

Sources: Vilenkin–Klimyk §9.3.8 (1)–(3), pp. 62–63; Wawrzyńczyk (9.4.10)–(9.4.11), p. 335;
Klimyk–Vilenkin Part II, Chapter 3, §1.10, (29), p. 192.

Prove:
- **Orthogonality** (`integral_zonalPolynomial_mul_zonalPolynomial`): for `n ≥ 2`,
  `c_n ∫_{-1}^{1} ω_{n,l} ω_{n,l'} (1 - t²)^{(n-3)/2} dt = δ_{ll'}/dim H_l`;
- for `n ≥ 3` this is the orthogonality of LaguerreJacobi §6.2 at `λ = (n - 2)/2`, with
  `h_l = π 2^{1-2λ} Γ(l + 2λ)/((l + λ) l! Γ(λ)²)` (DLMF 18.3, Table 18.3.1) and the ratio of
  normalizations of 3.1.

Route: by 1.2, the integral is `∫ Z_{l,η} Z_{l',η} dσ`; for `l ≠ l'` the spaces `H_l`, `H_{l'}` are
orthogonal (R8.2); for `l = l'` it is `Z_{l,η}(η)/dim H_l` by the reproducing property of 4.1.

**Checks.**
- `n = 3`, `l = l' = 2`: `1/5`; `n = 4`, `l = l' = 3`: `1/16`; `n = 6`, `l = l' = 2`: `1/20`.
- `n = 2`, `l = l' = 3`: `(1/π) ∫ T_3² (1 - t²)^{-1/2} dt = 1/2`.
- `l = 2`, `l' = 4` and `l = 1`, `l' = 3`: `0` for `n = 3, …, 6`.
- `n = 5`, `l = 2`: `c_5 h_2 / ((3)_2/2!)² = 1/14 = 1/dim H_2(ℝ⁵)`, the agreement with
  LaguerreJacobi.
- Negative control: without the weight, `c_5 ∫ ω_{5,2}² dt = 0.25`, not `1/14`.

### 4.3 The Funk–Hecke formula

Sources: Vilenkin–Klimyk §10.2.1 (4)–(6), p. 175.

Prove:
- **Funk–Hecke** (`integral_comp_inner_mul_sphereEval`): for `n ≥ 2`, continuous `f`, unit `η`
  and `p ∈ H_l`, `∫ f(⟪η, x⟫) p(x) dσ(x) = λ_l(f) p(η)` with
  `λ_l(f) = c_n ∫_{-1}^{1} f(t) ω_{n,l}(t) (1 - t²)^{(n-3)/2} dt`;
- the formula extends to `f` with `∫ |f(t)| (1 - t²)^{(n-3)/2} dt < ∞`.

Route: `f(⟪η, x⟫)` is `K_η`-invariant, so by 1.2 the integral does not change when `p` is
replaced by its average over `K_η`, which is `p(η) Z_{l,η}` by 2.3; the integral of
`f(⟪η, x⟫) Z_{l,η}(x)` is `λ_l(f)` by the density of 1.2 and 3.3.

**Checks.**
- `n = 3`, `l = 2`, `f = exp`: `λ_2 = (1/2) ∫ eᵗ P_2(t) dt = (e - 7/e)/2 = 0.07156 28701`.
- For `f = ω_{n,l'}`, `λ_l(f) = δ_{ll'}/dim H_l` (4.2).
- `n = 3`, `f = exp`, `η = (0.6, 0.8, 0)`: for `p = x₁x₂` both sides are `0.03435 01777`
  (`λ_2 p(η)` with `p(η) = 0.48`); for `p = Re(x₁ + i x₂)³` both are `-0.00942 09247`
  (`λ_3 = 0.01006 50905`, `p(η) = -0.936`).
- Negative control: replacing `ω_{n,l}` by the unnormalized `C_l^{((n-2)/2)}` multiplies the
  right side by `C_l^{((n-2)/2)}(1)`, for example by `3` at `n = 4`, `l = 2`.

### 4.4 Zonal spherical functions

Sources: Vilenkin–Klimyk §9.3.2 (4), p. 47 (the zonal spherical function) and §9.4.5 (1), p. 76
(the product formula for associated functions; the case here is its zonal case);
Wawrzyńczyk (9.5.1)–(9.5.2), p. 337 (the functional equation and the product formula, with
W84-E09.5.01 of the project's errata file, which corrects the derivation and confirms the
formula) and Theorem 9.2.4, pp. 326–327; Klimyk–Vilenkin Part II, Chapter 2, §2.4, (25), p. 180.

`zonalSpherical n l η g = ω_{n,l}(⟪η, g η⟫)`. Prove:
- **Zonal spherical functions** (`isSphericalFunction_zonalSpherical`): for `n ≥ 3`, unit `η`
  and a left-invariant probability measure `ν` on `K_η`, `zonalSpherical n l η` is a spherical
  function of `(SO(n), K_η)`;
- **Classification** (`exists_eq_zonalSpherical`): for `n ≥ 3`, every spherical function of
  `(SO(n), K_η)` is `zonalSpherical n l η` for some `l`;
- **Product formula** (`zonalPolynomial_eval_cos_mul_eval_cos`): for `n ≥ 3`,
  `ω(cos a) ω(cos b) = c'ₙ ∫_0^π ω(cos a cos b + sin a sin b cos ψ) sin^{n-3} ψ dψ`;
- `zonalSpherical n l η g = ⟪Z, g · Z⟫/⟪Z, Z⟫` for the zonal harmonic `Z = Z_{l,η}` in
  `L²(sphereMeasure n)`, and it is positive definite.

Route: the functional equation is SpecialFunctionsGroupModels §5.3 applied to `H_l` with fixed
vector `Z_{l,η}` (2.3). For the classification, let `φ` be spherical. Convolution with the
characters projects `φ` onto the Peter–Weyl blocks (CompactGroups §§5.4–5.5), and `φ ≠ 0`, so
some block contains a nonzero bi-invariant function obtained from `φ`; by the functional equation
that function is a multiple of `φ`, so `φ` is a matrix coefficient of one irreducible `π` with a
`K_η`-fixed vector. Then `π ≅ H_l` for some `l` (2.3), the fixed vector is unique (2.3), and the
multiplicity-one statement of SpecialFunctionsGroupModels §5.3 gives `φ = zonalSpherical n l η`.
The product formula is the functional equation at `x = g_a`, `y = g_b` (rotations by `a`, `b` in
a plane through `η`), with the integral over `K_η` reduced to `ψ` by the density of 1.2 on
`S^{n-2}`.

**Checks.**
- `n = 3`, `l = 3`, `a = 0.7`, `b = 1.9`: both sides of the product formula are
  `-0.01149 84607`; for `n = 4` they are `0.03324 20083`, for `n = 6` `0.03595 25879`.
- Wawrzyńczyk's form (9.5.2) with `C_l^{(p)}`, `p = 3/2`, `l = 3`: both sides `0.60290 52598`.
- `zonalSpherical n l η 1 = ω_{n,l}(1) = 1`.
- Negative control: for `n = 2`, `K_η` is trivial and `cos lθ = ω_{2,l}(cos θ)` is not
  multiplicative: `cos 1.2 = 0.36236` while `cos 0.5 cos 0.7 = 0.67121`; the spherical functions of
  `SO(2)` are the characters `e^{ilθ}`, so the hypothesis `n ≥ 3` is needed.

### 4.5 The Gegenbauer addition theorem

Sources: Vilenkin–Klimyk §9.4.3 (1)–(5), p. 71 (with erratum E09.4.01 of the project's errata
file for the three-angle relation (2)); Klimyk–Vilenkin Part II, Chapter 3, §1.3, (14), p. 186.

Prove:
- **Gegenbauer addition theorem** (`gegenbauer_addition`): for `λ > 1/2` the identity displayed
  below holds for all real `θ`, `φ`, `ψ`;
- the case `λ = (n - 2)/2` is the addition theorem of 4.1 for the matrix elements of
  `SO(n)` between the Gel'fand–Tsetlin vectors of 5.2 of the second level.

```text
C_l^(λ)(cos θ cos φ + sin θ sin φ cos ψ)
  = Γ(2λ - 1)/Γ(λ)² ∑_{m ≤ l} 2^(2m) Γ(λ + m)² (l - m)! (2λ + 2m - 1)/Γ(2λ + l + m)
      (sin θ sin φ)^m C_{l-m}^(λ+m)(cos θ) C_{l-m}^(λ+m)(cos φ) C_m^(λ-1/2)(cos ψ)
```

Route: expand `Z_{l,η}(g x)` in the branching basis of 5.1 for the chain
`SO(n) ⊃ SO(n - 1)`, with the norm constant of 5.1; the coefficients are associated spherical
functions `sin^m θ C_{l-m}^{(λ+m)}(cos θ)`, and the remaining zonal function of `SO(n - 1)` is
`C_m^{(λ-1/2)}`. The identity then extends from `λ = (n - 2)/2`, `n ≥ 4`, to real `λ > 1/2`: after
multiplication by `Γ(λ)²/Γ(2λ - 1)` each coefficient is a rational function of `λ`, so for fixed
`θ`, `φ`, `ψ` both sides are rational in `λ` and agree on infinitely many points.

**Checks.**
- At `l = 4`, `θ = 0.6`, `φ = 1.3`, `ψ = 2.2`: both sides `1.61944 86134` for `λ = 3/2`,
  `0.88298 12104` for `λ = 1`, `3.61090 91337` for `λ = 5/2`, and `0.64131 08772` for
  `λ = 0.8`, which is not of the form `(n - 2)/2`.
- `l = 0`: both sides are `1`, since `Γ(2λ - 1)(2λ - 1)/Γ(2λ) = 1`.
- Negative control: at `λ = 1/2` the factor `Γ(2λ - 1)` has a pole and `C_m^{(0)} = 0` for
  `m ≥ 1`; the Legendre case needs the limit form with `C_m^{(0)}` replaced by `(2/m) T_m`, and
  the hypothesis `λ > 1/2` excludes it.

### 4.6 Plane waves and Bochner's theorem

Sources: Vilenkin–Klimyk §9.4.2 (10), p. 70 (the integral of `e^{iRr cos θ}` against a Gegenbauer
polynomial, in their dimension `n - 1`); Vilenkin–Klimyk §10.2.4 (1)–(2), p. 181 (the Funk–Hecke
formula for `e^{i⟨x, η⟩}`) and (3)–(4), pp. 181–182 (Bochner's theorem, with the kernel
`e^{i⟨x, y⟩}` and Lebesgue measure). The normalization here is Mathlib's:
`𝓕f(ξ) = ∫ f(x) e^{-2πi⟨x, ξ⟩} dx`.

Prove, with `ν = n/2 - 1`:
- **Funk–Hecke multiplier of a plane wave** (`integral_cexp_mul_zonalPolynomial`): for `n ≥ 2`
  and `r > 0`,
  `c_n ∫_{-1}^{1} e^{irt} ω_{n,l}(t) (1 - t²)^{(n-3)/2} dt = iˡ Γ(n/2) (2/r)^ν J_{l+ν}(r)`;
- **Plane-wave expansion** (`hasSum_cexp_inner_sphereEval`): for `n ≥ 4`, `r > 0`, unit `η`, `x`
  and `L²(sphereMeasure n)`-orthonormal bases `Y_l` of the `H_l`,
  `e^{ir⟪η, x⟫} = ∑_l iˡ Γ(n/2) (2/r)^ν J_{l+ν}(r) ∑ᵢ Y_{l,i}(η) Y_{l,i}(x)`;
- **Bochner's theorem** (`fourier_mul_eval_div_norm`): for `n ≥ 2`, `l ≥ 1`, `p ∈ H_l`, `φ` with
  `∫₀^∞ |φ(r)| r^{n-1} dr < ∞` and `ξ ≠ 0`, the Fourier transform of `F(x) = φ(|x|) p(x/|x|)` is
  `𝓕F(ξ) = 2π (-i)ˡ |ξ|^{1-n/2} p(ξ/|ξ|) ∫₀^∞ φ(r) J_{l+ν}(2π|ξ| r) r^{n/2} dr`, a Hankel
  transform of order `l + n/2 - 1`.

The degree `l = 0` of Bochner's theorem, the radial Fourier transform, and the plane-wave
expansion for `n = 3` in the spherical harmonics `Y_{l,m}` are not targets here (Scope and
ownership).

Route: for `n ≥ 3` the expansion is DLMF 10.23.9 of SpecialFunctionsBessel §4.3 at `ν = n/2 - 1`,
`α` the angle of `⟪η, x⟫`; by 3.1 and 2.1, `Γ(ν)(ν + l) C_l^{(ν)} = Γ(ν + 1) dim H_l ω_{n,l}`, and
the addition theorem of 4.1 replaces `dim H_l ω_{n,l}(⟪η, x⟫)` by `∑ᵢ Y_{l,i}(η) Y_{l,i}(x)`.
The multiplier for `n ≥ 3` follows by integrating the zonal form against `ω_{n,l}` term by term
(the series converges uniformly in `t`) and 4.2; for `n = 2` it is
`π⁻¹ ∫₀^π e^{ir cos θ} cos lθ dθ = iˡ J_l(r)`, Bessel's integral DLMF 10.9.2 of
SpecialFunctionsBessel §5.1 after `θ ↦ π/2 - θ`. For Bochner's theorem, write `𝓕F(ξ)` in polar
coordinates (Mathlib's decomposition of Lebesgue measure into the surface measure and
`r^{n-1} dr`, total surface mass `2π^{n/2}/Γ(n/2)`), apply Funk–Hecke (4.3, to the real and
imaginary parts of `t ↦ e^{-2πi r|ξ| t}`) and the multiplier at `-2πr|ξ|`, and use
`J_{l+ν}(-s) (−s)^{-ν} = (-1)^l J_{l+ν}(s) s^{-ν}` in its entire form.

**Checks.**
- Multiplier at `r = 1.7`: `0.33145 75792 i` for `n = 4`, `l = 1`; `-0.08514 99269 i` for `n = 2`,
  `l = 3` (`i³ J_3(1.7)`); `0.73928 38087` for `n = 5`, `l = 0`.
- Plane-wave expansion at `n = 4` and `n = 5`, `r = 2.3`, `⟪η, x⟫ = 0.4`: forty terms give
  `0.60582 01566 + 0.79560 16200 i = e^{0.92 i}`; at `l = 1` the inner sum is `n ⟪η, x⟫`
  (`Y_i = √n xᵢ`).
- Negative control: without the factor `iˡ` the series sums to the conjugate
  `0.60582 01566 - 0.79560 16200 i`.
- Bochner at `ξ = (0.42, 0.56, 0, …)`, `|ξ| = 0.7`, for `n = 2, 3, 4, 5`: `F(x) = x₁ e^{-π|x|²}`
  (`l = 1`, `φ(r) = r e^{-πr²}`) gives `-i ξ₁ e^{-0.49π} = -0.09009 58687 i` on both sides, and
  `F(x) = x₁x₂ e^{-π|x|²}` (`l = 2`) gives `-ξ₁ξ₂ e^{-0.49π} = -0.05045 36865`.
- Negative control: the factor `iˡ` in place of `(-i)ˡ` gives `+0.09009 58687 i` at `l = 1`, the
  transform for the kernel `e^{+2πi⟨x, ξ⟩}`; the order `n/2 - 1` of the radial case in place of
  `l + n/2 - 1` gives `-0.03162 14280 i` at `n = 3`.
- Negative control: the plane-wave route needs `ν ≠ 0`; at `n = 2` the zonal form 10.23.9 has
  `Γ(0)`, and the expansion there is the Jacobi–Anger expansion in `cos lθ`, `sin lθ`.

## Layer 5: branching `SO(m + 1) ↓ SO(m)`

### 5.1 The branching harmonics

Sources: Vilenkin–Klimyk §9.3.1 (1)–(5), pp. 44–46 (the orthonormal basis of `L²(S^{n-1})`
built from Gegenbauer polynomials); Klimyk–Vilenkin Part II, Chapter 2, §2.4, (27), p. 180 (the
matrix elements `t^l_{m0}` as `sin^m θ C_{l-m}^{(m+(n-1)/2)}(cos θ)`, in their `n`).

`branchFactor m l k` is `|x|^{l-k} ω_{m+1+2k,l-k}(x_{m+1}/|x|)` on `ℝ^{m+1}`, and
`branchHarmonic m l k h = branchFactor m l k · h(x₁, …, x_m)` (`branchHarmonic_apply`). Prove:
- **Branching harmonics are harmonic** (`branchHarmonic_mem_harmonicSubmodule`): for `m ≥ 1`,
  `k ≤ l` and `h ∈ H_k(ℝᵐ)`, `branchHarmonic m l k h ∈ H_l(ℝ^{m+1})`;
- **Branching decomposition** (`harmonicSubmodule_eq_iSup_map_branchHarmonic`,
  `iSupIndep_map_branchHarmonic`): for `m ≥ 1`, `H_l(ℝ^{m+1})` is the sum over `k ≤ l` of the
  images of `H_k(ℝᵐ)`, and these images are independent;
- **Branching dimension** (`finrank_harmonicSubmodule_succ`): for `m ≥ 1`,
  `dim H_l(ℝ^{m+1}) = ∑_{k ≤ l} dim H_k(ℝᵐ)`;
- **Branching norm** (`integral_sphereEval_branchHarmonic_sq`): for `m ≥ 1`, `k ≤ l` and
  `h ∈ H_k(ℝᵐ)`, `‖branchHarmonic m l k h‖² = κ ‖h‖²` in the normalized `L²` norms, with
  `κ = c_{m+1}/(c_{m+1+2k} dim H_{l-k}(ℝ^{m+1+2k}))`;
- the images are pairwise orthogonal, and for `m ≥ 3` the image of `H_k(ℝᵐ)` is the
  `H_k`-isotypic component of the restriction of `H_l(ℝ^{m+1})` to `SO(m)`.

Route: with `x = (x', s)`, `r = |x|`, and `h` harmonic of degree `k`, the Laplacian of
`F(s, r) h(x')` reduces to the equation of 3.2 for `ω_{m+1+2k,l-k}` (the shift `2k` is the degree
of `h`); the dimension count closes the decomposition. The norm is the integral over the sphere in
the coordinates `x = (sin θ y, cos θ)`, `y ∈ S^{m-1}`, which by 1.2 and 4.2 gives `κ`. The images
are `SO(m)`-stable and isomorphic to `H_k(ℝᵐ)`, and these are pairwise inequivalent for `m ≥ 3`
(2.2), so each image is a full isotypic component.

**Checks.**
- The branching harmonics for `m + 1 = 3, 4`, `l = 2, 3`, `k = 0, 1, 2` with `h = 1, x₁, x₁x₂`
  have Laplacian `0`.
- Dimension count: `dim H_l(ℝ^{m+1}) = ∑_{k ≤ l} dim H_k(ℝᵐ)` for `m = 1, …, 6`, `l ≤ 7`;
  for `m = 1` it reads `2 = 1 + 1` for `l ≥ 1`.
- `κ` for `m = 2`, `l = 2`, `k = 1`: `c_3/(c_5 · 5) = 2/15`; for `h = x₁` the branching harmonic
  is `x₁x₃` and `∫_{S²} x₁² x₃² dσ = 1/15 = (2/15)(1/2)`.
- `m = 1`, `l = 2`, `k = 1`, `h = x₁`: `κ = c_2/(c_4 · 4) = 1/8 = ∫_{S¹} x₁² x₂² dσ`.
- Negative control: for `m + 1 = 3`, `l = 3`, `k = 1` the factor `ω_{3,2}` of the ambient
  dimension in place of `ω_{5,2}` gives `branchFactor · x₁` the Laplacian `-2x₁`; the shift by
  `2k` is needed.

### 5.2 The Gel'fand–Tsetlin basis and associated spherical functions

Sources: Vilenkin–Klimyk §9.3.1 (1)–(5), pp. 44–46; Klimyk–Vilenkin Part II, Chapter 2, §2.4,
(27), p. 180.

Prove:
- **Gel'fand–Tsetlin basis**: iterating 5.1 along `ℝⁿ ⊃ ℝ^{n-1} ⊃ … ⊃ ℝ²` gives, for every
  chain `l = l_{n-1} ≥ l_{n-2} ≥ … ≥ l_1 ≥ 0` and sign `±` of the last step, an element of `H_l`
  that is a product of factors `sin^{l_{j-1}} θ_j ω_{j+2l_{j-1}, l_j - l_{j-1}}(cos θ_j)` in the
  spherical coordinates of Vilenkin–Klimyk §9.1.9 (6); after division by the square root of the
  product of the constants `κ` of 5.1 these form an orthonormal basis of `H_l` in
  `L²(sphereMeasure n)`;
- **Associated spherical functions**: for `h ∈ H_k(ℝ^{n-1})` the function
  `g ↦ ⟪branchHarmonic (n - 1) l k h, g · Z_{l,e_n}⟫` depends on `g` through `g e_n` and is
  proportional to `sin^k θ C_{l-k}^{(k+(n-2)/2)}(cos θ) h(ξ')` at `g e_n = (sin θ ξ', cos θ)`.

Route: 5.1 by induction on the dimension, with orthogonality of the images of distinct `k`; the
associated functions by the reproducing property of 4.1 applied to `branchHarmonic`.

**Checks.**
- For `n = 3` the basis is `sin^{|m|} θ ω_{3+2|m|, l-|m|}(cos θ) (cos mφ or sin mφ)`, which is
  `Y_{l,m}` up to normalization and the Condon–Shortley sign.
- The number of chains with `l_{n-1} = l` is `dim H_l(ℝⁿ)` (5.1, iterated).
- Negative control: omitting the factor `sin^{l_{j-1}} θ_j` destroys harmonicity: for `n = 3`,
  `l = 1`, `m = 1`, `cos φ` alone is not the restriction of a harmonic polynomial of degree `1`.

## Layer 6: the complex sphere and `U(n)`

### 6.1 `U(n)` and the complex sphere

Sources: Vilenkin–Klimyk §11.1.8 (1)–(3), p. 291 (the image of the sphere measure under
`ξ ↦ ⟪η, ξ⟫` and its density on the disc); Vilenkin–Klimyk §11.2.2, p. 295 (the action
`f(g⁻¹ z)` and the subgroup `U(n - 1)`); Klimyk–Vilenkin Part II, Chapter 2, §2.8, p. 182.

`U(n)` (`UnitaryMatrixGroup n`) acts on `ℂⁿ` (`smul_def_unitary`), `ComplexSphere n` is the unit
sphere `S^{2n-1}`, `unitaryStabilizer η` is the stabilizer and `complexSphereMeasure n` the
normalized surface measure. Prove:
- **Transitivity** (`exists_smul_eq_unitary`): for every `n`, `U(n)` acts transitively on each
  sphere `|ξ| = r` of `ℂⁿ`;
- **Disc density** (`integral_inner_complexSphereMeasure`): for `n ≥ 2` and unit `η`,
  `∫ f(⟪η, ξ⟫) dσ(ξ) = ((n - 1)/π) ∫_{|w|<1} f(w) (1 - |w|²)^{n-2} dA(w)`;
- **Gel'fand pair** (`isGelfandPair_unitaryMatrixGroup`): `(U(n), K_η)` is a Gel'fand pair for
  every `n`, `η`;
- the double coset `K_η g K_η` is determined by `⟪η, g η⟫` for `n ≥ 2` and unit `η`.

Route: transitivity by unitary Gram–Schmidt (for `r = 0` there is nothing to prove); the density
from the real density of 1.2 in dimension `2n` after integrating over the circle of phases; the
Gel'fand pair by Gel'fand's criterion with `σ(g) = gᵀ` for `η = e_n`, which preserves `⟪η, g η⟫`
and hence, by the last bullet, each double coset; a general unit `η` is conjugate to `e_n`, and
`U(1)` is abelian.

**Checks.**
- `E|⟪η, ξ⟫|⁴ = 2/(n(n + 1))`: `1/3`, `1/6`, `1/10` for `n = 2, 3, 4`, by the density.
- The density has mass one: `((n - 1)/π) ∫_{|w|<1} (1 - |w|²)^{n-2} dA = 1`.
- Negative control: for `n = 1` the image of the sphere is the unit circle, which has measure zero
  in the disc; the density needs `n ≥ 2`.
- `unitaryStabilizer η` for unit `η` is conjugate to the `U(n - 1)` fixing the last coordinate.

### 6.2 Harmonics of bidegree `(p, q)`

Sources: Vilenkin–Klimyk §11.2.1 (13), p. 293 (the real harmonics of degree `m` on `ℂⁿ` as the
sum of the bidegrees `p + q = m`) and (18)–(20), p. 295 (dimension and eigenvalue); Vilenkin–Klimyk
§11.2.2 (4)–(13), pp. 296–297 (the `U(n - 1)`-fixed vector, its uniqueness and the recurrence);
Klimyk–Vilenkin Part II, Chapter 2, §2.8, p. 182 (the class-one representations, labelled by
highest weights `(m, 0, …, 0, m′)`, and their restriction to `U(n - 1)`).

Polynomials in `z, z̄` are `MvPolynomial (Fin n ⊕ Fin n) ℂ`, the variable `Sum.inl j` standing for
`zⱼ` and `Sum.inr j` for `z̄ⱼ`; `bidegreeWeight` assigns `(1, 0)` and `(0, 1)`, `complexLaplacian`
is `∑ⱼ ∂²/∂zⱼ∂z̄ⱼ` (through `MvPolynomial.pderiv`), `bidegreeHarmonic n p q` is the space
`H^{p,q}` of harmonic polynomials of bidegree `(p, q)` (through
`MvPolynomial.weightedHomogeneousSubmodule`), and `evalC z f` evaluates at `(z, z̄)`. Prove:
- **Dimension** (`finrank_bidegreeHarmonic_mul`): for `n ≥ 2`,
  `dim H^{p,q} = (p + n - 2)!(q + n - 2)!(p + q + n - 1)/((n - 1)!(n - 2)! p! q!)`, multiplied
  out in `ℕ`;
- **Real and complex harmonics** (`finrank_harmonicSubmodule_eq_sum_finrank_bidegreeHarmonic`):
  `dim H_m(ℝ^{2n}) = ∑_{p+q=m} dim H^{p,q}(ℂⁿ)`;
- **Branching dimension** (`finrank_bidegreeHarmonic_succ`): for `n ≥ 1`,
  `dim H^{p,q}(ℂ^{n+1}) = ∑_{a ≤ p, b ≤ q} dim H^{a,b}(ℂⁿ)`;
- **Decomposition**: the complexification of `H_m(ℝ^{2n})`, written in `z, z̄`, is the direct sum
  of the `H^{p,q}` with `p + q = m`;
- **Irreducibility and inequivalence**: for `n ≥ 2`, `U(n)` acts irreducibly on `H^{p,q}` by
  `(g · f)(z) = f(g⁻¹ z)`, with highest weight `(q, 0, …, 0, -p)` and highest-weight vector
  `z̄₁^q zₙ^p`, and the `H^{p,q}` are pairwise inequivalent;
- the restriction of `H^{p,q}(ℂ^{n+1})` to `U(n)` is the sum of the `H^{a,b}(ℂⁿ)` with `a ≤ p`,
  `b ≤ q`, each once.

Route: the complex Fischer decomposition (multiplication by `|z|²` is injective and adjoint to the
complex Laplacian for the Fischer inner product), giving
`dim H^{p,q} = dim P^{p,q} - dim P^{p-1,q-1}`.
Irreducibility from the uniqueness of the `K_η`-fixed vector (6.4), as R8.3 does for `SO(n)`: a
nonzero invariant subspace `V ⊆ H^{p,q}` contains a nonzero `K_η`-fixed vector (average a vector
`f` of `V` with `f(η) ≠ 0` over `K_η`, using transitivity of 6.1), so `V` contains
`diskHarmonic n p q η` for every unit `η`, and these span `H^{p,q}` because the orthogonal
complement of their span is a subspace whose elements vanish at every `η` by the reproducing
property of 6.5. The highest weight by the action of the torus on `z̄₁^q zₙ^p`, which is killed by
the raising operators; inequivalence because the highest weights differ.

**Checks.**
- `n = 2`: `dim H^{p,q} = p + q + 1`; `n = 3`: `dim H^{1,1} = 8` (the adjoint representation of
  `SU(3)`), `dim H^{2,1} = 15`.
- `dim H^{p,q} = C(n + p - 1, p) C(n + q - 1, q) - C(n + p - 2, p - 1) C(n + q - 2, q - 1)` for
  `n = 2, …, 5`, `p, q ≤ 4`.
- `∑_{p+q=m} dim H^{p,q}(ℂⁿ) = dim H_m(ℝ^{2n})` for `n = 2, …, 5`, `m ≤ 6`; for `n = 3`, `m = 2`
  the summands are `6, 8, 6` and `dim H_2(ℝ⁶) = 20`.
- `H^{1,0}` is spanned by `z₁, …, zₙ`; under `f ↦ f ∘ g⁻¹` it is the dual of the defining
  representation, with weights `-εⱼ` and highest weight `(0, …, 0, -1)`, which is `(q, 0, …, 0, -p)`
  at `(p, q) = (1, 0)`.
- Negative control: the label `(p, 0, …, 0, -q)` would give `H^{1,0}` the highest weight
  `(1, 0, …, 0)` of the defining representation, which is the weight of `z̄₁`, not of any `zⱼ`.
- Negative control: `|z|² = ∑ zⱼ z̄ⱼ` has bidegree `(1, 1)` and `complexLaplacian` value `n`, not
  `0`; it is not in `H^{1,1}`.
- Negative control: for `n = 1`, `H^{p,q}(ℂ)` is `0` for `p, q ≥ 1` (`∂_z ∂_{z̄} z^p z̄^q ≠ 0`),
  whereas the right side of the dimension formula needs `(n - 2)!` with `n - 2 < 0`; the
  hypothesis `n ≥ 2` is needed there.

### 6.3 Disk polynomials

Sources: Vilenkin–Klimyk §11.3.2 (4)–(6), p. 309 (the zonal functions of `U(n)` as `₂F₁` and Jacobi
polynomials) and §11.4.5, p. 345 (the disk polynomials `R^α_{mn}`; the coefficient of (28) is
erratum E11.4.10 of the project's errata file); Klimyk–Vilenkin Part II, Chapter 2, §2.8, (34),
p. 182.

`diskPolynomial α p q w` is the sum over `i ≤ min(p, q)` of
`(-1)ⁱ C(p, i) C(q, i) i!/(α + 1)ᵢ · (1 - |w|²)ⁱ w^{p-i} w̄^{q-i}` (`diskPolynomial_def`), a
form symmetric in `p` and `q`. For `α ∈ {-1, -2, …}` a denominator vanishes and the value is
junk; the theorems assume `-1 < α` or `α = n - 2`, `n ≥ 2`. Prove:
- **Value at one** (`diskPolynomial_one`): `R^α_{p,q}(1) = 1`;
- **Symmetry** (`diskPolynomial_swap`): `R^α_{q,p} = conj R^α_{p,q}`;
- **Jacobi form** (`diskPolynomial_eq_jacobi`): for `-1 < α` and `q ≤ p`,
  `R^α_{p,q}(w) = (q!/(α + 1)_q) P_q^{(α, p-q)}(2|w|² - 1) w^{p-q}`;
- **Orthogonality on the disc** (`integral_diskPolynomial_mul_conj`): for `-1 < α`,
  `((α + 1)/π) ∫_{|w|<1} R^α_{p,q} conj R^α_{p',q'} (1 - |w|²)^α dA = δ h` with
  `h = (α + 1)/(p + q + α + 1) · p! q!/((α + 1)_p (α + 1)_q)`;
- **Bound** (`norm_diskPolynomial_le_one`): `|R^{n-2}_{p,q}(w)| ≤ 1` for `|w| ≤ 1`, `n ≥ 2`;
- the `R^α_{p,q}` form a complete orthogonal system in `L²` of the disc with weight
  `(1 - |w|²)^α`, `α > -1`.

Route: the Jacobi form by expanding `P_q^{(α,β)}` in powers of `(x - 1)/2 = |w|² - 1`; the
orthogonality from the orthogonality of `e^{i(p-q)θ}` in the angle and of Jacobi polynomials in
`2r² - 1` (LaguerreJacobi §4.3 through §3.2); the bound from 6.5 (a normalized positive-definite
function is bounded by its value at `1`); completeness from the Stone–Weierstrass theorem, since
the `R^α_{p,q}` with `p + q ≤ N` span the polynomials of degree `≤ N` in `w, w̄`.

**Checks.**
- `R^α_{p,0}(w) = w^p`; `R^0_{1,1}(w) = 2|w|² - 1`; `R^α_{1,1}(w) = ((α + 2)|w|² - 1)/(α + 1)`,
  so `R^1_{1,1}(0.5) = -1/8`.
- `R^0_{2,1}(w) = w(3|w|² - 2)`, so `R^0_{2,1}(0.5) = -0.625`.
- Orthogonality constants: `h = 1/3, 1/4, 1/5` for `α = 0` and `(p, q) = (1, 1), (2, 1), (3, 1)`;
  `h = 4/21` for `α = 1/2`, `(1, 1)`; `h = 4/5` for `α = -1/2`, `(1, 1)`; cross terms `0`.
- Negative control: `R_{0,1}(w) = w̄`, so `R_{0,1}(i) = -i`; the variant with `w` in place of `w̄`
  for `p < q` would give `i` and would violate the symmetry `R_{0,1} = conj R_{1,0}`.
- Negative control: at `α = -1` the coefficient of `i = 1` divides by `(0)₁ = 0`.

### 6.4 The `U(n)`-zonal harmonic

Sources: Vilenkin–Klimyk §11.2.2 (11)–(13), p. 297 (uniqueness of the `U(n - 1)`-fixed vector and
the coefficient recurrence) and §11.3.2 (4)–(6), p. 309.

`diskHarmonic n p q η` is `∑ᵢ cᵢ (|z|² - w w̄)ⁱ w^{p-i} w̄^{q-i}` with `w = ⟪η, z⟫` and the
coefficients `cᵢ` of `R^{n-2}_{p,q}`. Prove:
- **The `U(n)`-zonal harmonic lies in `H^{p,q}`** (`diskHarmonic_mem_bidegreeHarmonic`): for
  `n ≥ 2` and a unit vector `η`;
- **Values on the sphere** (`evalC_diskHarmonic`): for `|ξ| = 1`, its value is
  `R^{n-2}_{p,q}(⟪η, ξ⟫)`;
- **Class one** (`eq_smul_diskHarmonic`): for `n ≥ 2` and unit `η`, a `K_η`-invariant element of
  `H^{p,q}` is `f(η) · diskHarmonic n p q η`.

Route: as in 2.3 and 3.3, with the `K_η`-invariants generated by `w`, `w̄` and `|z|²`, and the
coefficient recurrence of the hypergeometric equation in `1 - |w|²`.

**Checks.**
- `diskHarmonic n p q η` has complex Laplacian `0` for `n = 2, 3`, `η = (3/5, 4i/5, 0, …)` and
  `(p, q) = (2, 1), (2, 2), (1, 3)`, and at a random unit `ξ` its value equals
  `R^{n-2}_{p,q}(⟪η, ξ⟫)`.
- `diskHarmonic n 1 0 η = ⟪η, z⟫` and `diskHarmonic n 1 1 η = (n|w|² - |z|²)/(n - 1)`, which is
  `2|w|² - |z|²` at `n = 2`.
- Negative control: with `α = n - 1` in place of `n - 2`, the polynomial for `n = 3`,
  `(p, q) = (1, 1)`, `η = e₃` is proportional to `4|z₃|² - |z|²`, of complex Laplacian `1`, while
  `3|z₃|² - |z|²` has Laplacian `0`.

### 6.5 Spherical functions of `(U(n), K_η)`

Sources: Vilenkin–Klimyk §11.3.2 (2), p. 308 and (4)–(6), p. 309; Vilenkin–Klimyk §11.2.2
(4)–(10), p. 296 (the reproducing kernel of `H^{p,q}`); Klimyk–Vilenkin Part II, Chapter 2,
§2.8, (34), p. 182.

`diskSpherical n p q η g = R^{n-2}_{p,q}(⟪g η, η⟫)`. Prove:
- **Disk polynomials are spherical functions** (`isSphericalFunction_diskSpherical`): for
  `n ≥ 2`, unit `η` and a left-invariant probability measure `ν` on `K_η`;
- **Classification** (`exists_eq_diskSpherical`): for `n ≥ 2`, every spherical function of
  `(U(n), K_η)` is `diskSpherical n p q η` for some `p, q`;
- **Addition theorem for `H^{p,q}`** (`sum_evalC_mul_conj_evalC_eq`): for `n ≥ 2` and an
  `L²(complexSphereMeasure n)`-orthonormal basis `Y` of `H^{p,q}`,
  `∑ᵢ Yᵢ(x) conj Yᵢ(y) = dim H^{p,q} · R^{n-2}_{p,q}(⟪y, x⟫)`;
- `diskSpherical n p q η g = ⟪Z, g · Z⟫/⟪Z, Z⟫` for `Z = diskHarmonic n p q η`.

Route: as in 4.1 and 4.4. The kernel `∑ Yᵢ(x) conj Yᵢ(y)` is invariant under the diagonal action
and of bidegree `(p, q)` in `x`, so by 6.4 it is `dim H^{p,q} R^{n-2}_{p,q}(⟪y, x⟫)`; the matrix
coefficient is `⟪Z, g · Z⟫ = ∫ conj Z(ξ) Z(g⁻¹ξ) dσ`, which by the reproducing property is
`R(⟪g η, η⟫)/dim H^{p,q}`. The classification follows the route of 4.4, with 6.4 for the fixed
vector and the decomposition `L²(S^{2n-1}) = ⊕_{p,q} H^{p,q}`, which is R8.2 in dimension `2n`
together with the decomposition of 6.2.

**Checks.**
- `n = 2`, `(p, q) = (1, 0)`: `Y = √2 z₁, √2 z₂`, and `∑ Yᵢ(x) conj Yᵢ(y) = 2⟪y, x⟫`, which
  is `dim H^{1,0} R_{1,0}(⟪y, x⟫)`.
- `diskSpherical n p q η 1 = R(1) = 1`.
- The functional equation on `(U(3), U(2))`, `(p, q) = (2, 1)`, for `⟪g η, η⟫ = 0.3 + 0.5i` and
  `⟪h η, η⟫ = 0.6 - 0.2i`: the average over `K_η` of `φ(g k h)`, which by the disc density of 6.1
  in `ℂ²` is the average of `R^1_{2,1}(ab + √(1 - |a|²) √(1 - |b|²) w)` over the unit disc, is
  `0.01792 + 0.01536i`, equal to `φ(g) φ(h)`.
- Negative control: without the average over `K_η`, the value `R^1_{2,1}(ab)` at the same
  points is `-0.20384 - 0.17472i`; `φ` is not multiplicative.
- The argument `⟪η, g η⟫` in place of `⟪g η, η⟫` gives `diskSpherical n q p η`, which is also
  spherical; the convention fixes which of the two is attached to `H^{p,q}`. For `n = 3`,
  `(p, q) = (2, 1)`, the matrix coefficient `⟪Z, g · Z⟫/⟪Z, Z⟫` at a random `g` is
  `R^1_{2,1}(⟪g η, η⟫)`, not its conjugate `R^1_{2,1}(⟪η, g η⟫)`.

### 6.6 Zonal polynomials of `SO(2n)` and disk polynomials

Sources: Vilenkin–Klimyk §11.2.1 (13), p. 293 and §11.3.2 (4)–(6), p. 309; adaptation: the
restriction of the zonal harmonic of `SO(2n)` to `U(n)`, with the proof route below.

Prove:
- **Zonal polynomials of `SO(2n)` as sums of disk polynomials**
  (`zonalPolynomial_eq_sum_diskPolynomial`): for `n ≥ 2` and every `w ∈ ℂ`,
  `dim H_m(ℝ^{2n}) ω_{2n,m}(Re w) = ∑_{p+q=m} dim H^{p,q}(ℂⁿ) R^{n-2}_{p,q}(w)`.

Route: identify `ℝ^{2n}` with `ℂⁿ`, so `⟪x, y⟫_ℝ = Re ⟪x, y⟫_ℂ`; by 6.2 the space `H_m(ℝ^{2n})`
is the sum of the `H^{p,q}` with `p + q = m`, and summing the addition theorems of 6.5 over
`p + q = m` gives that of 4.1 for `SO(2n)` at `x, y` on the sphere; the identity in `w = ⟪y, x⟫`
on the disc extends to all of `ℂ` because both sides are polynomials in `w, w̄`.

**Checks.**
- `n = 2`, `m = 2`: `9 ω_{4,2}(0.35) = 3(R_{2,0} + R_{1,1} + R_{0,2})(0.35 - 0.52i)`, both sides
  `-1.53`.
- At `w = 1.3 + 0.9i`, outside the disc: both sides are `17.28` (`n = 2`, `m = 2`) and `136.76`
  (`n = 3`, `m = 3`).
- Negative control: for `n = 3`, `m = 2` the weights `6, 8, 6` of the `H^{p,q}` are not equal; at
  `w = 0.35 - 0.52i` the weighted sum over `20` gives `ω_{6,2}(0.35) = -0.053`, while the unweighted
  average of the `R^1_{p,2-p}(w)` is `-0.06882`.

## Worked examples

- `n = 3`: `ω_{3,l} = P_l`, `dim H_l = 2l + 1`, and the addition theorem of 4.1 is
  `∑_m Y_{l,m}(x) conj Y_{l,m}(y) = (2l + 1) P_l(⟪x, y⟫)` in the probability measure of `S²`.
- `n = 4`: `ω_{4,l}(cos θ) = sin((l + 1)θ)/((l + 1) sin θ)`, the normalized character of `SU(2)`
  on `Sym^l`, and `dim H_l(ℝ⁴) = (l + 1)²`.
- The Funk–Hecke multiplier of the plane wave `f(t) = e^{irt}` on `S²` at `l = 0` is
  `(1/2) ∫ e^{irt} dt = sin r / r`.
- `n = 2` on `ℂ²`: `S³` with `U(2)`, `R^0_{p,q}(w) = w^{p-q} P_q^{(0, p-q)}(2|w|² - 1)` for
  `q ≤ p`, and `dim H^{p,q} = p + q + 1`; summing over `p + q = m` with these weights gives
  `(m + 1)² ω_{4,m}(Re w)` (6.6).

## Downstream consumers

- The roadmap on rank-one symmetric spaces of the same project consumes the compact duals
  `S^{n-1}` and `S^{2n-1}` with their spherical functions (4.4, 6.5).
- The roadmap on Euclidean motion groups and Bessel functions of the same project does not
  consume this roadmap: it states its own case `n = 3` and the zonal forms independently (see
  Scope and ownership).

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **The sphere and the rotation group** (1.1–1.3).
2. **Spherical harmonics** (2.1–2.3).
3. **Zonal polynomials and Gegenbauer polynomials** (3.1–3.4).
4. **Addition theorem, Funk–Hecke, spherical functions** (4.1–4.5).
5. **Branching** (5.1–5.2).
6. **The complex sphere and `U(n)`** (6.1–6.6).

The numbers are those of the layers above, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it; it is not an exhaustive acceptance test, and the other headlines and the
plain bullets of each subsection are targets of the same standing, stated in prose. The
`**Checks.**` of each subsection are statements to prove; they test the conventions on explicit
values.

**Boundary with Tau Ceti and RiemannianGeometry R8.** Tau Ceti owns the harmonic polynomials:
the Laplacian, the Fischer decomposition, the dimension of `H_l` as a difference of binomial
coefficients, the restriction to the sphere and its injectivity, and the action of the orthogonal
group by `(g · p)(x) = p(g⁻¹ x)` (in `TauCeti/RingTheory/MvPolynomial/Harmonic/Orthogonal.lean`).
[RiemannianGeometry R8](../RiemannianGeometry/README.md) owns the uniqueness of the iterated
Fischer decomposition and the eigenvalue `l(l + n - 2)` of the restricted harmonics (R8.1), the
identification of the eigenspaces of the Laplace–Beltrami operator with the restricted harmonics,
their orthogonality and the completeness of their sum in `L²(S^{n-1})` (R8.2), and the
irreducibility of `H_l` under `SO(n)` for `n ≥ 3` with highest weight `l ε₁` (R8.3). The proof
route of R8.3 uses the uniqueness of the zonal harmonic without owning it; this roadmap owns it
(2.3) and proves it by the coefficient recurrence, without R8.3, so the two do not form a cycle.
This roadmap consumes R8 and owns the special functions: the closed dimension formula, the zonal
harmonic and its uniqueness, the zonal polynomials, and every integral identity in which they
occur.

**Boundary with LaguerreJacobi and SpecialFunctionsBessel.**
[LaguerreJacobi §6.2](../LaguerreJacobi/README.md) owns the Gegenbauer polynomial `C_l^{(λ)}` by
the explicit sum of DLMF 18.5.10, its leading coefficient, its relation to Jacobi polynomials,
its orthogonality for `-1/2 < λ`, `λ ≠ 0`, and its Hilbert basis; its §§3.2–3.3 own the Jacobi
polynomials with their value at one and derivative. It excludes the family at `λ = 0` (where its
`C_l^{(0)}` vanishes for `l ≥ 1`), and it does not state the value at one, the derivative or the
differential equation of the Gegenbauer polynomial.
[SpecialFunctionsBessel §4.3](../SpecialFunctionsBessel/README.md) owns the generating function
DLMF 18.12.4 for small `|z|`. This roadmap owns the value at one, the extension of the generating
function to the disc, the derivative and the differential equation (3.2), and works with the
normalized zonal polynomial `ω_{n,l}`, which has no degeneracy at `n = 2`. The orthogonality of
4.2 is stated for `ω_{n,l}`, with its constant in terms of `dim H_l`, and agrees with that of
LaguerreJacobi on their common range (4.2 Checks).

**Boundary with the RepresentationTheory family.**
[CompactGroups](../RepresentationTheory/CompactGroups/README.md) owns Schur's lemma (§2.3) and
Peter–Weyl with the isotypic decomposition (§§5.4–5.5), consumed in 2.2, 4.4 and 6.5.
[ClassicalGroups](../RepresentationTheory/ClassicalGroups/README.md) owns the abstract branching
rule `SO(n) ↓ SO(n - 1)` and the Gel'fand–Tsetlin patterns for the rational representations of
the complex classical groups (its Layer 6); this roadmap does not consume them. It owns the
explicit harmonic polynomials that realize the branching (5.1), the basis they generate (5.2), and
the irreducibility, highest weights and branching dimensions of the `H^{p,q}` for the compact
group `U(n)` (6.2), proved from the uniqueness of the fixed vector (6.4).

**Boundary with the roadmaps of the same project.** SpecialFunctionsGroupModels owns Gel'fand
pairs, spherical functions and the spherical transform for a general locally compact group (its
§§5.1–5.3), and `SO(n)` with its action on `ℝⁿ` (its §0.3); this roadmap instantiates the first
for `(SO(n), K_η)` and `(U(n), K_η)` and copies its definitions verbatim, and owns the `MulAction`
instance built from its `rotE`. SpecialFunctionsLegendre owns the spherical harmonics `Y_{l,m}` of
`S²` and their addition theorem (its §3.2), and SpecialFunctionsSU2MatrixElements owns their group
proof (its §6.3) and the Gel'fand pair `(SU(2), T)` (its §6.4); the case `n = 3` here agrees with
them (1.3 and 4.1 Checks). The roadmap on Euclidean motion groups and Bessel functions of the same
project owns the plane-wave expansion in `ℝ³` in the spherical harmonics `Y_{l,m}`, the
statement of the zonal form DLMF 10.23.9 for general `n` (owned by SpecialFunctionsBessel §4.3),
the Hankel transform and the Fourier transform of radial functions on `ℝⁿ` (degree `0`), and
the spherical functions of `(M(n), SO(n))`. This roadmap owns the plane-wave expansion in `ℝⁿ`,
`n ≥ 4`, in harmonics of `S^{n-1}`, the Funk–Hecke multiplier of a plane wave, and Bochner's
theorem for degree `l ≥ 1` (4.6), so the two do not overlap. The roadmap on rank-one symmetric
spaces of the same project owns the hyperboloids, the groups `SO₀(n, 1)` and `U(n, 1)`, and the
Jacobi functions.

**Not owned here.** Spherical harmonics on hyperboloids and the groups `SO₀(n - 1, 1)` and
`U(n - 1, 1)`, Gegenbauer functions of noncomplex or nonintegral degree, and harmonic analysis on
Stiefel and Grassmann manifolds (see Beyond).

## Exact supplier contracts

`Suggested.lean` imports only Mathlib and Tau Ceti; it carries local verbatim copies of the
Gegenbauer and Jacobi polynomials of LaguerreJacobi (`gegenbauer`, `jacobi`) and of the
definitions of SpecialFunctionsGroupModels (`IsBiInvariant`, `conv`, `IsGelfandPair`,
`IsSphericalFunction`, `SOn`, `rotE` with `rotE_mul` and `rotE_one`), each with a docstring naming
its owner and section.

### From Tau Ceti

- `MvPolynomial.normSq` and `MvPolynomial.harmonicSubmodule`
  (`TauCeti/RingTheory/MvPolynomial/Harmonic.lean`): `|x|²` and the harmonic homogeneous
  polynomials of degree `l`, with the Fischer decomposition and the dimension theorem.
- `MvPolynomial.sphereEval` and `MvPolynomial.harmonicSphereRestriction_injective`
  (`TauCeti/Analysis/MvPolynomial/Sphere.lean`): restriction of a real polynomial to the unit
  sphere, injective on harmonic homogeneous polynomials.
- The action of the orthogonal group on harmonic polynomials
  (`TauCeti/RingTheory/MvPolynomial/Harmonic/Orthogonal.lean`), for 2.2.
- The topological-group instances and compactness of `Matrix.specialOrthogonalGroup` and
  `Matrix.unitaryGroup` (`TauCeti/Topology/Algebra/UnitaryGroup.lean`).
- `TauCeti.haarProb` (`TauCeti/RepresentationTheory/Compact/Haar.lean`): the Haar probability
  measure of a compact group, left and right invariant.

### From Mathlib

- `MeasureTheory.Measure.toSphere`, the surface measure on the unit sphere of a
  finite-dimensional inner product space. Used in 1.2 and 6.1.
- `Matrix.specialOrthogonalGroup`, `Matrix.unitaryGroup`, `Matrix.toEuclideanLin`,
  `MulAction.stabilizer`. Used in 1.1 and 6.1.
- `MvPolynomial.pderiv`, `MvPolynomial.weightedHomogeneousSubmodule`, `ascPochhammer`. Used in
  Layers 3 and 6.
- `Polynomial.Chebyshev.T`, `Polynomial.Chebyshev.U` and the Gamma function. Used in 3.1, 3.4
  and 4.4.
- `Complex.besselJ`, the Fourier transform `𝓕` and the polar decomposition of Lebesgue measure on
  `ℝⁿ`. Used in 4.6.

### From RiemannianGeometry

- R8.1 (eigenvalue of the restricted harmonics) for 2.2; R8.2 (eigenspace identification,
  orthogonality and completeness in `L²(S^{n-1})`) for 2.2, 4.2 and 6.5; R8.3 (irreducibility of
  `H_l` for `n ≥ 3`) for 2.2.

### From LaguerreJacobi

- §3.2 (the Jacobi polynomial, local copy `jacobi`) for 3.1 and 6.3; §§3.3 and 4.3 (value at
  one, derivative, orthogonality) for 6.3.
- §6.2 (the Gegenbauer polynomial, local copy `gegenbauer`, its Jacobi relation and its
  orthogonality for `-1/2 < λ`, `λ ≠ 0`) for 3.1, 3.2 and 4.2.

### From SpecialFunctionsBessel

- §4.3: the generating function `∑ C_l^{(λ)}(x) zˡ = (1 - 2xz + z²)^{-λ}` for small `|z|`
  (DLMF 18.12.4), for 3.2, and the expansion
  `e^{iv cos α} = Γ(ν)(v/2)^{-ν} ∑_k (ν + k) iᵏ J_{ν+k}(v) C_k^{(ν)}(cos α)` for
  `ν ∉ {0, -1, -2, …}` (DLMF 10.23.9), for 4.6.
- §5.1: Bessel's integral DLMF 10.9.2, for the case `n = 2` of 4.6.

### From CompactGroups

- §2.3 (Schur's lemma for continuous intertwiners) for 2.2; §§5.4–5.5 (the Peter–Weyl basis and
  the isotypic decomposition of `L²(G)`, with the block projections by character convolution) for
  4.4 and 6.5.

### From SpecialFunctionsGroupModels

- §0.3: `SO(n)` and its action (`SOn`, `rotE`, `rotE_mul`, `rotE_one`), copied verbatim.
- §5.1: `IsBiInvariant`, `conv`, `IsGelfandPair` and Gel'fand's criterion, for 1.3 and 6.1.
- §5.2: `IsSphericalFunction`, for 4.4 and 6.5.
- §5.3: the spherical function of a representation with a fixed vector, and multiplicity one, for
  4.4 and 6.5.

### From SpecialFunctionsSU2MatrixElements

- §6.3 (the group proof of the addition theorem on `S²`) and §6.4 (the Gel'fand pair
  `(SU(2), T)`), for the Checks of the case `n = 3` in 1.3 and 4.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **Koornwinder's addition formula for disk polynomials** (Vilenkin–Klimyk §11.4.5 (28), p. 345,
  with erratum E11.4.10 of the project's errata file) and the product formula of disk
  polynomials; they need the branching of `U(n) ↓ U(n - 1)` in full, not only its dimension.
- **Spherical harmonics on hyperboloids** and the representations of `SO₀(n - 1, 1)` and
  `U(n - 1, 1)` of class one (Vilenkin–Klimyk §§9.2.9–9.2.10 and Chapter 10); Gegenbauer and
  Jacobi functions of complex degree. The rank-one symmetric spaces roadmap of the same project
  takes the noncompact rank-one spaces.
- **Quaternionic spheres** `Sp(n)/Sp(n - 1)` and the remaining compact rank-one spaces.
- **Stiefel and Grassmann manifolds** and the zonal polynomials of several variables.
- **Gel'fand–Tsetlin bases of `U(n)`** beyond the class-one representations and the full
  Gel'fand–Tsetlin formulas.

## Prior formalization

[lean-SFVK](https://github.com/bjbraams/lean-SFVK) (Apache-2.0), by the author of this roadmap,
proves the following targets without `sorry`, against Tau Ceti and the lean-DLMF Gegenbauer,
Legendre and Jacobi polynomials. Its definitions are in `SFVK/Spheres/Basic/Sphere.lean`,
`SFVK/Spheres/Basic/Zonal.lean` and `SFVK/Spheres/Basic/Disk.lean`. It writes the action of the
matrix groups through its own rotation maps, names the groups and stabilizers in its own way, and
states the Gel'fand pairs with its own predicate; otherwise it uses the names of this roadmap. The
roadmap reuses its conventions and names; its modules are a cited source, not the specification.

- §§1.1–1.3: `exists_smul_eq`, `exists_mul_mul_eq_iff_inner`, the closedness of `K_η`,
  `integral_smul_sphereMeasure`, `integral_haarProb_smul`, `integral_inner_sphereMeasure` and
  `isGelfandPair_SOn` (`SFVK/Spheres/SphereMeasure.lean`).
- §2.1 and Layer 3: `finrank_harmonicSubmodule_mul`, `zonalPolynomial_comp_neg`,
  `natDegree_zonalPolynomial`, `zonalPolynomial_two`, `zonalPolynomial_three`,
  `zonalPolynomial_four`, the Gegenbauer form in lean-DLMF's normalization,
  `derivative_zonalPolynomial`, `zonalPolynomial_ode`, `zonalHarmonic_mem_harmonicSubmodule`,
  `eval_zonalHarmonic`, `eval_smul_zonalHarmonic` and `zonalPolynomial_eval_cos_eq_integral`
  (`SFVK/Spheres/Zonal.lean`), and `zonalPolynomial_eval_one`
  (`SFVK/Spheres/Basic/Zonal.lean`).
- Layer 4: `abs_zonalPolynomial_eval_le_one`, `integral_zonalPolynomial_mul_zonalPolynomial` and
  `zonalPolynomial_eval_cos_mul_eval_cos` (`SFVK/Spheres/Addition.lean`).
- §5.1: `branchHarmonic_mem_harmonicSubmodule`, `harmonicSubmodule_eq_iSup_map_branchHarmonic`,
  `iSupIndep_map_branchHarmonic` and `finrank_harmonicSubmodule_succ`
  (`SFVK/Spheres/Branching.lean`).
- §6.1 and §6.4: `exists_smul_eq_unitary`, `integral_inner_complexSphereMeasure`,
  `isGelfandPair_unitaryMatrixGroup` and `evalC_diskHarmonic` (`SFVK/Spheres/Unitary.lean`).
- §6.3: `diskPolynomial_one` and `diskPolynomial_swap` (`SFVK/Spheres/Basic/Disk.lean`), the
  Jacobi form in lean-DLMF's normalization and `integral_diskPolynomial_mul_conj`
  (`SFVK/Spheres/DiskPolynomials.lean`).

## References

- J. Dieudonné, *Special Functions and Linear Representations of Lie Groups*, CBMS Regional
  Conference Series in Mathematics 42, AMS, 1980, §7.
- A. U. Klimyk and N. Ya. Vilenkin, *Representations of Lie Groups and Special Functions*, in
  A. A. Kirillov (ed.), *Representation Theory and Noncommutative Harmonic Analysis II*,
  Encyclopaedia of Mathematical Sciences 59, Springer, 1995, Part II, Chapter 2, §§2.4, 2.8 and
  Chapter 3, §§1.3, 1.10.
- N. Ja. Vilenkin and A. U. Klimyk, *Representation of Lie Groups and Special Functions*, Vol. 2,
  Mathematics and Its Applications (Soviet Series) 74, Kluwer, 1993, Chapters 9–11.
- A. Wawrzyńczyk, *Group Representations and Special Functions*, Mathematics and Its Applications
  (East European Series), Reidel / PWN, 1984, §5.3 and Chapter 9.
- NIST Digital Library of Mathematical Functions, §§18.3, 18.5, 18.12 (Gegenbauer and Jacobi
  normalizations, the generating function), cited through LaguerreJacobi and
  SpecialFunctionsBessel.

The project's errata files record the misprints of [Vilenkin–Klimyk] and [Wawrzyńczyk] corrected
wherever the README uses those formulas: E09.2.01 (§9.2.3, p. 30), E09.4.01 (§9.4.3 (2), p. 71),
E10.2.01 (§10.2.1, p. 173) and E11.4.10 (§11.4.5 (28), p. 345) of Vilenkin–Klimyk, and
W84-E09.3.01 (p. 331), W84-E09.4.01 ((9.4.5), p. 334) and W84-E09.5.01 (p. 337) of Wawrzyńczyk.
