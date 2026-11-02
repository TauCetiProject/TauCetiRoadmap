# Roadmap: arithmetic of quaternion algebras, their orders, and the Shimura curves of the LMFDB

**Summary.** A quaternion algebra over a number field `F` is determined up to isomorphism by the finite set of
noncomplex places at which it does not split, and every finite set of even cardinality occurs.
Inside such an algebra `B` sit its orders: maximal orders, Eichler orders of a given level, and the
Gorenstein and Bass orders that organize the rest. Their right ideal classes form a finite set
`Cls O`; when `B` is definite that set is counted, with weights, by the Eichler mass formula and,
exactly, by the Eichler class number formula, and it carries the Brandt matrices, which are the
Hecke operators the LMFDB uses to compute Hilbert modular forms. When `B` is indefinite over `ℚ`
the norm-one units of an Eichler order of level `N` in a division algebra of discriminant `D > 1` form a
cocompact Fuchsian group, and the quotient `X_0(D;N)` is a Shimura curve whose area, elliptic
points and genus are read off the same embedding numbers that enter the class number formula.
The LMFDB indexes its Shimura curves by subgroups `H` of an *enhanced group*
`Aut_{±μ}(O) ⋉ (O/NO)^×` attached to a *polarized order* `(O, μ)`; this roadmap defines all of
these objects and proves the formulas by which the LMFDB computes their invariants.

The book this roadmap follows is Voight, *Quaternion Algebras* (GTM 288), cited below by its
numbering (`[V, 15.5.5]` is Theorem 15.5.5 there); theorem numbers follow the 2021 author
edition v0.9.28.

**Carrier.** The algebra is Mathlib's symbol algebra `ℍ[F,a,b] = QuaternionAlgebra F a 0 b` with
`a b : Fˣ`, over a field `F` of characteristic `0`: `i² = a`, `j² = b`, `ji = -ij`. Orders are
`R`-subalgebras of it that are `R`-lattices, for `R` a Dedekind domain with fraction field `F`
(`R = 𝓞 F` for a number field, `R = ℤ` for `F = ℚ`). An abstract central simple algebra of
dimension four enters only through a presentation `B ≃ₐ[F] ℍ[F,a,b]`, and every invariant defined
here is proved independent of the presentation. The Shimura-curve layers are over `F = ℚ`.

Suggested home: `TauCeti/NumberTheory/Quaternion/`, with subdirectories `Ramification/`,
`Order/` (lattices, discriminants, maximal and Eichler orders, Gorenstein and Bass orders),
`Ideal/` (class sets, types, the idelic dictionary), `Indefinite/` (Eichler's theorems),
`Mass/`, `Embedding/`, `Brandt/`, `ShimuraCurve/` and `Polarized/`.

## Scope and ownership

### Owned here

- **Ramification data of a symbol algebra** (Layer 0): the local ramification predicates at the
  finite and real places of a number field, read off Tau Ceti's Hilbert symbol; the finite
  ramification set and the discriminant ideal `disc B`; over `ℚ` the integer `D`; definite and
  indefinite; and the comparison of these predicates with the abstract local division criterion.
- **Lattices and orders in `ℍ[F,a,b]`** (Layer 1): the comparison with generic multiplier orders, the trace discriminant and
  determinant reduced discriminant of a lattice, and the cubic discriminant of an order, the trace dual and codifferent, maximal orders and the
  criterion `discrd O = disc B`, the local structure of maximal orders, Eichler orders and their
  level, hereditary orders, the unit group `O^×` and the norm-one group `O¹`, products of
  lattices and the definitions of principal and invertible lattices.
- **Gorenstein, Bass and the ternary form** (Layer 2): the even Clifford correspondence between
  ternary quadratic modules and orders, Gorenstein orders, the Gorenstein saturation and
  conductor, Bass orders, the Eichler symbol and the local unit counts.
- **Ideals, class sets and types** (Layer 3): invertible and locally principal lattices, the right
  class set `Cls O`, the type set `Typ O`, connecting ideals and genera, the quaternion reading of
  the idelic dictionary (`Cls O` as the idele double cosets of classical arithmetic completion 7.78,
  with the reduced-norm identity and the comparisons with the two definite class sets), finiteness
  of class and type sets, two-sided ideals, `Pic_R(O)`, the normalizer and the Atkin–Lehner group
  `AL(O)`.
- **Eichler's theorems for indefinite algebras** (Layer 4), as stated theorems whose
  strong-approximation input is consumed.
- **The Eichler mass formula** (Layer 5) in its absolute form, over `ℚ` and over totally real
  fields, and the class number one theorems.
- **Optimal embeddings and embedding numbers** (Layer 6): the trace formula, the local embedding
  numbers for maximal and Eichler orders, the Eichler class number formula, and the type number
  formula of Deuring.
- **Brandt matrices** (Layer 7): definition, their arithmetic, commutativity, self-adjointness, the
  Eichler trace formula, and the theta-series interpretation over `ℚ`.
- **Shimura curves `X_0(D;N)` over `ℚ`** (Layer 8): the index `ψ(N)` and area of the Eichler-order
  group, its elliptic points as embedding numbers, the genus formula, the Atkin–Lehner involutions
  and the quotients `X_0(D;N)/⟨w_m⟩` and `X^*(D;N)`, and CM points as optimal embeddings.
- **Polarized orders and enhanced groups** (Layer 9): polarizations and their degree,
  `Aut_μ(O)` and `Aut_{±μ}(O)`, the enhanced group `Aut_{±μ}(O) ⋉ (O/NO)^×`, the curve `X_H`
  of a subgroup `H`, and every group-theoretic invariant the LMFDB computes from `H` (level,
  index, Fuchsian index, gerbiness, coarseness, elliptic points of orders `2, 3, 4, 6`, genus,
  torsion invariants, Atkin–Lehner content, the named families `X(D;N)`, `X^*(D;N)`, `X(D,M;1)`).
- **The LMFDB dictionary** (Layer 10): the intrinsic label prefix `D.d.δ.N.i.g` and the coverage
  table of the Shimura-curve page.

### Not owned here

- **The classification of quaternion algebras by ramification** (existence and uniqueness) is
  R17.1.5 of the GL₂ transfer roadmap; the Brauer-group inputs are class field theory Layer 10 and
  the Hilbert symbol is quadratic form invariants 6C. Layer 0 consumes all three.
- **Strong approximation, reduction theory and Tamagawa measures** are adelic algebraic groups
  AA.3.4, AA.4.2 and, for `SL₁` of an algebra satisfying Eichler's condition, classical arithmetic
  completion 7.44; **the idele double-coset description of locally free rank-one lattices** over
  an arithmetic order and **the reduced-norm images of maximal orders** are classical arithmetic
  completion 7.78 and 7.60; the general arithmetic Fuchsian lattice theorem is TeichmullerGeometry §9.1. The local
  order-to-tree adapter and rational exact covolume belong to §§1.12 and 8.2 here.
- **Quaternionic modular forms** in weight, Hecke operators on coefficient modules, slopes,
  families: quaternionic modular forms Layers 1–5. **Jacquet–Langlands**: GL₂ transfer R17.1–R17.3.
- **Canonical models, integral models, moduli of QM abelian surfaces, Čerednik–Drinfeld**: Hilbert
  modular varieties and Shimura curves R18.1, R18.2, R18.5. **Models, gonality and rational points**
  of Shimura curves: the sibling `CanonicalModelsAndGonality` roadmap; the Jacobian decomposition,
  conductor and analytic rank of `X_H` are the modular-forms data reached through R17.3 and are not
  milestones here.
- **Labels and ordering.** The intrinsic prefix `D.d.δ.N.i.g` is Layer 10; the Gassmann-class
  letter `c`, the index `n` within a class, the canonical generators of `H` and the completeness
  of any stored list are not targets. Gassmann equivalence of two subgroups `H, H'` of the
  enhanced group (the relation the letter indexes) is the sibling `FiniteGroupInvariants` 7.1,
  applied to that finite group. The isomorphism invariants of the abstract group `H` are
  `FiniteGroupInvariants`' and its label is not a target; here `H` is a subgroup and its
  isomorphism type is an object, never a string.
- **Quaternionic hermitian lattices of rank `≥ 1` over an order and their masses** are geometry of
  numbers §2.8 and §3.3 and the orthogonal Tamagawa roadmap; this roadmap supplies the orders they
  take as coefficients.
- **Gorenstein and Bass orders in a commutative étale `ℚ`-algebra** (the Frobenius orders
  `ℤ[π, q/π]` of abelian varieties over finite fields): the sibling
  `AbelianVarietiesOverFiniteFields` 8.4. Its `IsGorenstein` (trace dual invertible) and 2.2 here
  (codifferent invertible) are the two instances of one definition for orders in a
  finite-dimensional semisimple algebra, which no roadmap states in that generality; each roadmap
  owns its instance and the laws special to its algebra.
- **Selectivity** (the optimal selectivity condition of Voight ch. 31) is not developed: every
  embedding-number formula below is stated either for `F = ℚ` or in the form of the trace formula
  summed over the class set, where selectivity does not enter.

## Conventions

Integer levels and congruence moduli are positive, and ideal norms in the counting formulas are nonzero. The exponent e in a local level pᵉ may be zero.

| Object | Convention |
| --- | --- |
| Base | `R` a Dedekind domain, `F = Frac R` of characteristic `0`; `[IsDedekindDomain R] [IsFractionRing R F]`. For number fields `R = 𝓞 F`; for the Shimura-curve layers `R = ℤ`, `F = ℚ`. |
| Algebra | `B = ℍ[F,a,b]` with `a b : Fˣ`; `k = ij`. The reduced trace is `trd x = x + star x = 2·re x` and the reduced norm is `nrd = QuaternionAlgebra.normForm a 0 b`, `nrd x = x·star x = (x * star x).re`. `nrd ≅ ⟨1,-a,-b,ab⟩` and the trace-zero form is `⟨-a,-b,ab⟩`. |
| Presentation independence | Every invariant of `B` or of an order is proved invariant under `AlgEquiv`; an abstract central simple algebra of dimension four is handled by choosing a presentation. No second carrier. |
| Local algebra | `B_v = ℍ[F_v, a, b]` with `F_v = v.adicCompletion F` at a finite place and `ℝ` at a real place; `B_v ≃ F_v ⊗_F B` is `baseChangeTwoParams`. |
| Ramified | `B` is **ramified at `v`** when `(a_v, b_v)_v = -1`, where `(·,·)_v` is `TauCeti.hilbertSymbol` over `F_v`; equivalently `B_v` is a division algebra; equivalently `B_v ≄ M₂(F_v)` (0.2). Complex places are never ramified. `Ram B` is the set of ramified places, `Ram_f B` its finite part. |
| Discriminant of `B` | `disc B = ∏_{v ∈ Ram_f B} 𝔭_v`, an ideal of `𝓞 F`; over `ℚ` the squarefree positive integer `D = ∏_{p ∈ Ram_f B} p`. `D = 1` for `M₂(ℚ)`. |
| Definite, indefinite | `B` is **totally definite** when `F` is totally real and every real place is ramified; otherwise `B` is **indefinite** and is said to satisfy the **Eichler condition** (`[V, 17.8.1]`). Over `ℚ`: definite iff `(a,b)_ℝ = -1` iff `a < 0` and `b < 0`. |
| Order | An `R`-order is `O : Subalgebra R B` whose underlying submodule satisfies `Submodule.IsLattice F`. Orders are ordered by inclusion of subalgebras. |
| Discriminant of a lattice | For an `R`-lattice `I ⊆ B`, `disc I` is the `R`-submodule of `F` generated by `det(trd(α_i α_j))` over quadruples in `I` (`[V, 15.2.2]`), and its determinant reduced discriminant is the fractional ideal `δ(I) = (4ab) det(I)` in the basis `1,i,j,k`. The cubic ideal `cubic(I)` is generated by `m(α₁,α₂,α₃) = trd((α₁α₂ − α₂α₁)α₃)` over triples (`[V, 15.4.4]`). For orders only, `discrd O = cubic(O) = δ(O)`; for a general lattice `δ(I) = (I ∩ F) cubic(I)` (1.5). Over `ℤ` both are principal, generated by positive integers `disc O`, `discrd O`, and the LMFDB's `discO` is `discrd O`. |
| Codifferent | `O^♯ = {α ∈ B : trd(αO) ⊆ R}`; `codiff O = O^♯`. |
| Maximal, Eichler, level | `O` is maximal when no order properly contains it. `O` is **Eichler** when it is the intersection of two maximal orders (`[V, 23.4.1]`). Its **level** is the ideal `𝔐 = discrd(O)·(disc B)^{-1}`, which is coprime to `disc B` (1.10); over `ℚ`, `discrd O = D·N` with `gcd(D,N) = 1` and `N` the level. |
| Right class set | `Cls O` is the set of classes of **proper invertible** right fractional `O`-ideals (right multiplier order exactly O) under `I ∼ J ⟺ ∃ α ∈ B^×, αI = J` (`[V, 17.3.4]`); left classes are reached through `I ↦ star I`. The **class number** is `# Cls O`. Over a Dedekind domain invertible means locally principal (3.1). |
| Type set, genus | Orders of the same type are `B^×`-conjugate, equivalently `R`-algebra isomorphic (`[V, 17.4.2]`); the genus of `O` is the set of orders locally isomorphic to `O`, and `Typ O` its set of types (`[V, 17.4.8]`). |
| Mass | For a totally definite `B`, `mass(Cls O) = ∑_{[J] ∈ Cls O} [O_L(J)^× : R^×]^{-1}` (`[V, 26.1.4]`); over `ℚ` the weight is `w_J = #O_L(J)^× / 2 = #(O_L(J)^×/{±1})`. |
| Eichler symbol | `(O | 𝔭) ∈ {1, 0, -1, ∗}` according as `O_𝔭/rad O_𝔭` is `k × k`, `k`, a quadratic field extension of `k`, or a quaternion algebra over `k` (`[V, 24.3.2, 24.3.13]`); `λ(O,𝔭) = 1 + 1/q, 1 − 1/q², 1 − 1/q` in the first three cases, `q = N𝔭`. |
| Optimal embedding | For a quadratic `R`-order `S` in a quadratic field `K ⊇ F`, an `F`-algebra map `φ : K → B` is **optimal for `S`** when `φ(K) ∩ O = φ(S)` (`[V, 30.3.2]`). `Emb(S,O;Γ)` is its set of `Γ`-conjugacy classes for `O¹ ≤ Γ ≤ N_{B^×}(O)`, acting on the right by `φ ↦ γ^{-1}φγ`, and `m(S,O;Γ) = # Emb(S,O;Γ)` (`[V, 30.3.11–12]`). For `F = ℚ` the quadratic order is Tau Ceti's `NumberFieldOrder K`. |
| Brandt matrix | With representatives `I_1,…,I_h` of `Cls O`, `T(𝔫)_{ij} = #{J ⊆ I_j : nrd J = 𝔫·nrd I_j, [J] = [I_i]}` (`[V, 41.2.3]`); on the free module of classes this is T(𝔫); on functions M₂(O) = Map(Cls O, ℤ), the pullback operator A(𝔫) has `(A(𝔫)f)([I]) = ∑_{J ⊆ I, nrd J = 𝔫 nrd I} f([J])` and matrix T(𝔫)ᵗ (`[V, 41.2.6]`). Columns index the source class. |
| Real splitting | For `B` indefinite over `ℚ`, `ι_∞ : B → M₂(ℝ)` is a fixed `ℚ`-algebra embedding; `det ∘ ι_∞ = nrd`. Changing `ι_∞` conjugates every group below inside `PGL₂(ℝ)`; every invariant stated is conjugation invariant. |
| Fuchsian groups | `Γ¹(O) = ι_∞(O¹)/{±1} ≤ PSL₂(ℝ)`; `Γ¹_0(D;N) = Γ¹(O)` for `O` Eichler of level `N` in the algebra of discriminant `D`; `Γ⁺(O) = ι_∞(N_{B^×}(O)^{+})ℝ^×/ℝ^×`, the image of the positive-norm normalizer. `PSL(2,ℝ)` is Mathlib's `ProjectiveSpecialLinearGroup (Fin 2) ℝ` acting through Tau Ceti's `instMulActionPSL2`. |
| Curves | `X_0(D;N) = Γ¹_0(D;N) \ ℍ`, `X^*(D;N) = Γ⁺(O) \ ℍ`; for `D > 1` these are compact Riemann surfaces (no cusps), and `genus` means the genus of the compact Riemann surface `Subgroup.CompactifiedQuotient Γ` (which is the coarse quotient itself) in the sense of Fuchsian orbifolds Layer 5. Area is hyperbolic area for `volume` on `ℍ` with density `y^{-2}dx dy`. |
| Elliptic points | `ν_q(Γ)` is the number of `Γ`-orbits of points of `ℍ` whose stabilizer in `Γ` has order `q ≥ 2`. The Gauss–Bonnet identity for a cocompact `Γ` reads `2g − 2 = area(Γ\ℍ)/(2π) − ∑_q ν_q(1 − 1/q)`. |
| Polarization | For an order `O` in an indefinite `B/ℚ`, a **polarization** is `μ ∈ B^×` with `μ² ∈ ℤ_{<0}` and `trd(μO) ⊆ ℤ`, i.e. `μ ∈ O^♯`; its **degree** `deg μ` is the unique squarefree positive integer `δ` with `nrd(μ)/discrd(O) ∈ δ·(ℚ^×)²`. `(O,μ) ≃ (O',μ')` when a conjugation carrying `O` to `O'` carries `μ` to `μ'`. Voight's *principal* polarization of a maximal order (`μ² + D = 0`, `[V, 43.6.4]`) is the degree-`1` case. |
| `Aut_{±μ}(O)` | `N_{B^×}(O) = {γ : γ^{-1}Oγ = O}`; `Aut_μ(O) = {γ ∈ N_{B^×}(O)/ℚ^× : γ^{-1}μγ = μ}` and `Aut_{±μ}(O) = {γ ∈ N_{B^×}(O)/ℚ^× : γ^{-1}μγ = ±μ}`. |
| Enhanced group | `G(O,μ,N) = Aut_{±μ}(O) ⋉ (O/NO)^×` with `w` acting on `(O/NO)^×` by `x ↦ wxw^{-1}`; `G(O,μ) = Aut_{±μ}(O) ⋉ O^×`, with the reduction `ρ_N : G(O,μ) → G(O,μ,N)`. In Lean the carrier is Mathlib's `SemidirectProduct`, whose product is `(x₁,w₁)(x₂,w₂) = (x₁·w₁x₂w₁^{-1}, w₁w₂)`; the LMFDB code multiplies pairs `(w,x)` by `(w₁,x₁)(w₂,x₂) = (w₁w₂, w₂^{-1}x₁w₂·x₂)`. The map `(x,w) ↦ (w, w^{-1}xw)` is an isomorphism from the first group to the second (9.4); the subgroups `H` and every invariant below are the same under either convention. |
| `π` and the kernel | `π : G(O,μ) → N_{B^×}(O)/ℚ^×`, `π(x,w) = x·w` (in Mathlib's ordering), is a homomorphism; `K = ker π` is finite cyclic and contains `(−1, 1)`. `G(O,μ)^+` is the preimage of the positive-norm elements. |
| `X_H` | For `H ≤ G(O,μ,N)`, `Γ_H = π(ρ_N^{-1}(H) ∩ G(O,μ)^+) ≤ PSL₂(ℝ)` and `X_H = Γ_H \ ℍ`. This is one geometric component of the LMFDB's `X_H`; the full `X(O;N)^{big} = B^×\(ℍ^± × B̂^×)/Γ(Ô,N)` has `φ(N)` components, each isomorphic over `ℂ` to `Γ(O,N)\ℍ`, and `X_H` is its quotient by `H`. All invariants the LMFDB lists are invariants of the component. |
| LMFDB invariants of `H` | level `N(H)` = least `N` with `H ⊇ ker((O/N'O)^× → (O/NO)^×)` in the enhanced group at the ambient level `N'`; index `[G(O,μ,N) : H]`; Fuchsian index `[Γ_G : Γ_H]`; gerbiness `#ρ_{N(H)}(K)`, the order of the image of `K` in the enhanced group at the level of `H` (equal to `#ρ_N(K)` when `N = N(H)`); aut-gerbiness `#(image of K in Aut_{±μ}(O))`; `H` is **coarse** when `H ⊇ ρ_N(K)`. |
| Intrinsic label prefix | `D.d.δ.N.i.g` with `D = disc B`, `d = discrd O` (omitted when `O` is maximal), `δ = deg μ`, `N` the level of `H`, `i` its index, `g` the genus of `X_H`. The suffix `c.n` is not an object of this roadmap. |

## Exact supplier contracts

Every milestone names its prerequisites, each of one of four kinds: a Mathlib declaration at the
pin; a Tau Ceti declaration at the pin (module path given); an earlier milestone of this roadmap;
or a numbered layer or milestone of another roadmap in this repository, cited by its own
numbering and linked by directory. Nothing rests on a Mathlib pull request.

The roadmaps consumed are: [quadratic form invariants](../QuadraticFormInvariants/README.md)
(Layer 2 and sublayer 6C), [global quadratic forms](../GlobalQuadraticForms/README.md) (4.4, 5.5,
6.1, 6.3), [class field theory](../ClassFieldTheory/README.md) (Layers 5, 10 and 14),
[global number fields](../GlobalNumberFields/README.md) (Layers 1, 6 and 11), the
[completed number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md)
(Layers 1 and 5), [classical arithmetic completion](../ClassicalArithmeticCompletion/README.md)
(Layer 7, items 7.4, 7.20, 7.21, 7.44, 7.56, 7.60, 7.72, 7.77, 7.78, 7.98),
[Fuchsian orbifolds](../FuchsianOrbifolds/README.md) (Layers 0–5), [Teichmüller geometry](../TeichmullerGeometry/README.md) (§9.1), [theta series](../ThetaSeries/README.md) (Layer 7),
[adelic algebraic groups](../AdelicAlgebraicGroups/README.md) (AA.3.4, AA.4.2, AA.4.6, AA.5.3),
[quaternionic modular forms](../QuaternionicModularForms/README.md) (Layer 0 and 3.1),
[GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md)
(R17.1.5, R17.3) and
[Hilbert modular varieties and Shimura curves](../HilbertModularVarietiesAndShimuraCurves/README.md)
(R18.1, R18.3.1, R18.5.17a). Each consumed object is listed with its milestone under *Scope and
ownership*.



- **From Mathlib:** `QuaternionAlgebra` and its star, `QuaternionAlgebra.Basis` and `liftHom`,
  `swapEquiv`; `Submodule.IsLattice`; `Subalgebra`; `IsDedekindDomain`, `HeightOneSpectrum`,
  `adicCompletion`; `NumberField.InfinitePlace` with `IsReal` and `IsTotallyReal`; `ClassGroup`;
  `Matrix.SpecialLinearGroup`, `ProjectiveSpecialLinearGroup`, `UpperHalfPlane` with its
  `SL(2,ℝ)` action and `volume`; `MulAction.orbitRel.Quotient`, `MulAction.stabilizer`;
  `Nat.totient`, `legendreSym`, `jacobiSym`; `SemidirectProduct`; `MeasureTheory.covolume`.
- **From Tau Ceti at the pin** (module paths under `TauCeti/`): the norm form
  `QuaternionAlgebra.normForm`, `pureNormForm`, `normForm_mul`, `isUnit_iff_normForm_isUnit`,
  `anisotropic_normForm_iff` (`Algebra/Quaternion/NormForm.lean`); the four-fold splitting criterion
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae` and its named faces
  (`Algebra/Quaternion/SplittingCriterion.lean`); the equivalences `oneEquivMatrix`,
  `aNegAEquivMatrix`, `rescaleJEquiv`, `normMulEquiv`, `steinbergEquivMatrix`
  (`Algebra/Quaternion/{Split,SymbolEquiv,Steinberg}.lean`); naturality of star, reduced trace and
  norm under algebra equivalences (`Algebra/Quaternion/AlgEquiv.lean`); base change
  `baseChangeTwoParams` (`Algebra/Quaternion/BaseChange.lean`); centrality and simplicity
  (`Algebra/Quaternion/CentralSimple.lean`); the Brauer class `quaternionClass` with its relations
  (`Algebra/Quaternion/BrauerClass.lean`); the norm-equation Hilbert symbol `TauCeti.hilbertSymbol`
  with `hilbertSymbol_eq_one_iff_nonempty_algEquiv_matrix`, `hilbertSymbol_comm`,
  `hilbertSymbol_congr_sq` (`NumberTheory/HilbertSymbol/Basic.lean`), its real value
  `hilbertSymbol_real` (`NumberTheory/HilbertSymbol/Archimedean.lean`), the localizations
  `IsDedekindDomain.HeightOneSpectrum.unitAtFinitePlace` and `TauCeti.unitAtRealPlace`
  (`NumberTheory/QuadraticForm/Global/Localization.lean`) and the finite support of the localized
  symbol `hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace`
  (`NumberTheory/QuadraticForm/Global/HilbertSymbol.lean`); the two-element quaternion subgroup of
  the local Brauer group `quaternionSubgroupSignEquiv` (`NumberTheory/LocalField/Quaternion/Subgroup.lean`);
  the local invariant `TauCeti.ClassFieldTheory.invMap` and the global `finiteInvAt`,
  `infiniteInvAt` (`NumberTheory/ClassFieldTheory/{Brauer/Invariant,Global/LocalInvariant}.lean`);
  orders in number fields `TauCeti.GlobalNumberFields.NumberFieldOrder` with `discr`, `index`,
  `conductor` and `Pic` (`NumberTheory/NumberField/Global/Orders/{Basic,Discriminant,Conductor,Picard}.lean`),
  which is the carrier of the quadratic orders of Layer 6 when `F = ℚ`; the `PSL(2,ℝ)` action on
  `ℍ` (`Analysis/Complex/UpperHalfPlane/PSL/Action.lean`), fundamental domains and `IsCofinite`
  (`Analysis/Complex/Fuchsian/Covolume.lean`), cyclic stabilizers (`Fuchsian/Stabilizer.lean`),
  the coarse quotient and compactified quotient as Riemann surfaces
  (`Fuchsian/CoarseQuotient.lean`, `Fuchsian/Compactification/{Basic,Manifold}.lean`), elliptic
  ramification indices (`Fuchsian/Elliptic/Ramification.lean`), and the degree of a finite
  holomorphic map (`Analysis/Complex/RiemannSurface/Degree.lean`). At the pin, `TauCeti.BrauerGroup.invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff`
  in `NumberTheory/LocalField/Quaternion/Invariant.lean` (line 78) identifies Hilbert symbol −1
  with local invariant 1/2 for a nonarchimedean local field with 2 invertible;
  `quaternionSubgroup_eq_twoTorsion` in the same file identifies the quaternion subgroup with Br(K)[2].
- **From the quadratic form invariants roadmap:** Layer 2 (presentation theory of `ℍ[K,a,b]`, the
  Tau Ceti declarations above), sublayer 6C (bimultiplicativity and nondegeneracy of the local
  Hilbert symbol, the closed formulas over `ℚ_p` and `ℚ_2`, `hilbertSymbol_eq_cohomological`,
  `hilbertSymbol_productFormula`); the trace-zero form `⟨-a,-b,ab⟩` and its invariance under
  `AlgEquiv` are its Layer 2 (`pureNormForm`, `equivalent_weightedSumSquares_of_algEquiv`).
- **From the global quadratic forms roadmap:** 4.4 (the localized product formula and the sign
  prescription `exists_hilbertSymbol_eq_neg_one_iff_pair`), 5.5 (Hasse–Minkowski isotropy), 6.1
  (scalar representation), 6.3 (Hasse–Minkowski isometry).
- **From the class field theory roadmap:** Layer 5 (`Br K`, `invMap`), Layer 10
  (`finiteInvAt`, `infiniteInvAt`, `eq_zero_of_localInv_eq_zero`, `sumLocalInv_eq_zero`,
  `exists_br_of_sum_eq_zero`), Layer 14 (`hilbertProductFormula`).
- **From GL₂ automorphic representations and transfer, R17.1.5:** the predicate
  `RamifiedExactlyAt D S` on an abstract quaternion algebra, `ramifiedExactlyAt_iff_nonsplit`, the
  realization theorem `existsQuaternionRamification_iff` (every even set of noncomplex places is
  the ramification set of some `B`) and the uniqueness theorem `quaternionAlgEquivOfLocalSplitting`
  (two algebras with the same local splitting predicates are isomorphic). Layer 0 uses these through the comparison of §0.2, without restating them as targets. Its
  R17.3 (global Jacquet–Langlands) is the statement through which the Brandt matrices of Layer 7
  compute Hilbert modular forms; it is cited in Layer 7 and not restated.
- **From quaternionic modular forms:** §0.3 the finite adelic class set
  `classSet U = D^× \ D_f^× / U` with `finite_classSet` and `DefiniteQuaternion.finite_stab`, for
  a totally definite algebra; §3.1 the Hecke operators `T_η` on quaternionic forms. Layer 3 identifies `Cls O` with
  `classSet Ô^×` and Layer 7 compares the transpose Brandt matrices with sums of T(η⁻¹) on forms with
  trivial coefficients, keeping the local double-coset types.
- **From Hilbert modular varieties and Shimura curves:** R18.1 (the canonical curve
  `Sh_U(G_B, X_B)` over `ℚ` and its complex uniformization), which is the algebraic curve whose
  complex points Layer 8 and Layer 9 describe as `Γ \ ℍ`; R18.3.1 (`DefiniteClassSet`, the central
  quotient of the class set); R18.5.17a (`DefiniteClassSetGraph` and its integral Brandt matrices).
  The moduli interpretation of `X_0(D;N)` by abelian surfaces with quaternionic multiplication is
  that roadmap's and is not constructed here.
- **From adelic algebraic groups:** AA.3.4 `class-number-finite` (`Reduction.finite_classes`),
  AA.4.2 `quaternion-norm-one-strong-approximation` (`D¹(𝔸_{F,f}) = D¹(F)·D¹(F_v)·U^{v,1}` for a
  split finite place `v`), AA.4.6 `quaternion-norm-images` (`Nrd(D^×) = F^×_{>Ω 0}`), AA.5.3 the
  volume identity under level change for a definite algebra over ℚ and the Hurwitz
  benchmark (one class, 24 units, mass 1/12). Section 1.8 here constructs its explicit order
  and proves maximality; these numerical facts are consumed.
- **From Fuchsian orbifolds:** Layers 0–5 supply the effective action, coarse quotient,
  compactification, genus, Riemann–Hurwitz, and covolume scaling for finite-index subgroups.
- **From TeichmullerGeometry §9.1:** the norm-one order group over a totally real field split
  at exactly one real place is a discrete finite-covolume subgroup of PSL₂(ℝ), cocompact
  exactly when the quaternion algebra is division. Section 8.1 takes its rational instance.
  The order-to-tree comparison is owned here in §1.12; the exact rational maximal-order
  covolume is owned here in §8.2.

- **From EndoscopicTransferAndUnitaryTraceComparison §6.2:** Tamagawa number one for every simply connected semisimple group over a number field, applied to SL₁(B) in §8.2. AdelicAlgebraicGroups §2.4 supplies the compatible gauge and Tamagawa normalization.

- **From the theta series roadmap:** Layer 7, the Hecke–Schoeneberg theorem
  `Θ_L ∈ M_k(Γ₀(N), χ_L)`, applied in 7.7 to the quaternary lattice `(I_j I_i^{-1}, nrd)`.
- **From classical arithmetic completion, Layer 7:** 7.4 (orders in a finite-dimensional algebra
  as `Submodule.IsLattice` subalgebras, and the integrality criterion), 7.20 (left order of a
  lattice), 7.21 (maximal orders), 7.44 (strong approximation for `SL₁` of an algebra satisfying
  Eichler's condition: `J(B)′ = B^×′·(J(B)′ ∩ U(Λ))` for every arithmetic order `Λ`), 7.56 (every
  order with nondegenerate regular trace lies in a maximal order; the characteristic-zero quaternion algebra satisfies this premise), 7.60 (reduced-norm images: `nrd(B_v^×) = F_v^×` at finite `v`,
  `nrd(Λ_v^×) = R_v^×` for a maximal local order, `ℝ_{>0}` at a ramified real place, and the
  global image), 7.72 (ideles and lattice gluing), 7.77 (the locally free class group), 7.78 (the
  bijection `B^× \ J(B) / U(Λ) ≃ {locally free rank-one right Λ-lattices}/≅`), 7.98 (Jacobinski
  cancellation under Eichler's condition). The generic order, multiplier-order, local maximality and maximal-existence
  results are consumed without duplicate targets. The native bundle `QuatOrder` and the
  multiplier subalgebra predicates in Suggested.lean only make the headline statements expressible;
  Layer 1 adds the discriminant and involution theory specific to quaternion algebras; 1.10 and 4.4 read 7.60 at the maximal orders, 3.4 reads 7.78 at `Λ = O`, and 4.1
  and 4.7 read 7.44 and 7.98 for `B` indefinite.
- **From the completed number-field arithmetic roadmap:** Layer 1 (splitting of primes in a
  quadratic field, `legendreSym` dictionary) and Layer 5 (completions as local fields).
- **From global number fields:** Layer 1 (weak approximation), Layer 6 (ideles and the idele class
  group), Layer 11 (`NumberFieldOrder`, `Pic`, the conductor).


The native bundle instances `instSetLikeQuatOrder`, `instPartialOrderQuatOrder` and
`instIsLatticeRightIdeal` expose order membership, inclusion and ideal fullness;
`instNormalScalars` supplies the central scalar quotient of §9.2.

### From Mathlib: native carriers

- `Mathlib/Algebra/Quaternion.lean`: the structure `QuaternionAlgebra R c₁ c₂ c₃`, notation
  `ℍ[R,a,b]`, the basis `1, i, j, k`, `star`, `mul_star_eq_coe`, `self_add_star`, `swapEquiv`,
  the `Algebra S ℍ[R,…]` instance for `Algebra S R` and the scalar towers. `QuaternionBasis.lean`:
  `QuaternionAlgebra.Basis`, `lift`, `liftHom`.
- `Mathlib/Algebra/Module/Lattice.lean`: `Submodule.IsLattice A M` (finitely generated and
  `A`-spanning), its `Module.Finite` instance and stability under `Aˣ`.
- `Mathlib/RingTheory/DedekindDomain/`: `IsDedekindDomain`, `HeightOneSpectrum`,
  `adicCompletion`, `adicCompletionIntegers`, `FractionalIdeal`, `ClassGroup`.
- `Mathlib/NumberTheory/NumberField/`: `InfinitePlace`, `IsReal`, `IsComplex`, `IsTotallyReal`,
  `𝓞 K`, `NumberField.discr`, `classNumber`, `Units`, the regulator.
- `Mathlib/NumberTheory/Padics/`: `ℚ_[p]`, `ℤ_[p]`, their field and valuation structure.
- `Mathlib/NumberTheory/LegendreSymbol/`: `legendreSym`, `jacobiSym`, quadratic reciprocity;
  `Mathlib/Data/Nat/Totient.lean`: `Nat.totient`; `Mathlib/NumberTheory/ArithmeticFunction/`:
  `ArithmeticFunction.sigma`, multiplicativity.
- `Mathlib/LinearAlgebra/Matrix/{SpecialLinearGroup,ProjectiveSpecialLinearGroup}.lean`,
  `Mathlib/Analysis/Complex/UpperHalfPlane/`: `ℍ`, the `SL(2,ℝ)` action, `volume`, fixed points,
  proper action; `Mathlib/GroupTheory/GroupAction/`: `orbitRel.Quotient`, `stabilizer`;
  `Mathlib/MeasureTheory/Group/FundamentalDomain.lean`: `covolume`.
- `Mathlib/GroupTheory/SemidirectProduct.lean`: `N ⋊[φ] G`; `Mathlib/GroupTheory/Subgroup/Center.lean`:
  `normal_of_le_center`.
- `Mathlib/Algebra/BrauerGroup/`: `BrauerGroup K`, which Tau Ceti's `quaternionClass` lands in.

The arithmetic constructions below use these native algebra, module and group carriers.

### From Tau Ceti: quaternion and analytic carriers

Listed under *Consumed, not redefined* with module paths. Three points deserve emphasis.
First, the whole field-theoretic layer (norm form, splitting criterion, symbol relations,
naturality under equivalences, base change) is landed, so Layer 0 is a specialization and never
reproves a splitting statement. Second, the Hilbert symbol is landed with its localizations at the
finite and real places of a number field and with the finiteness of its support, so the finite
ramification set of 0.3 is a finite set by a landed theorem, not by a target. Third, the Fuchsian
quotient `Γ \ ℍ` and its compactification are landed Riemann surfaces, with cyclic stabilizers and
elliptic ramification indices; what Layers 8–9 add is arithmetic: which `Γ` and which numbers.

## How to read the build

Everything under *Owned here*: the ramification predicates on the symbol carrier and the
discriminant ideal; orders, discriminants, maximal and Eichler orders, levels; the even Clifford
correspondence, Gorenstein and Bass orders, the Eichler symbol; invertible ideals, class sets,
types, the quaternion reading of the idelic dictionary and the finiteness of class and type sets;
Eichler's theorems; the mass formula; optimal embeddings, embedding numbers, the trace formula
and the class and type number formulas; Brandt matrices and the Eichler trace formula; the
arithmetic Fuchsian groups over `ℚ` with their areas, elliptic points, genera and Atkin–Lehner
quotients; polarized orders, `Aut_{±μ}(O)`, enhanced groups and the invariants of `X_H`.

The build runs from ramification and order arithmetic through ideals, mass and embeddings,
then Brandt correspondences, arithmetic curves and polarized level structures. Suggested.lean
states headline theorems on native carriers and the simple definitions needed by them; the
module docstring identifies constructions needed for the other headlines. The README supplies
the complete APIs and examples. A proof of one acceptance theorem does not replace its layer's
basic theory.

## Layer 0: quaternion algebras over a number field, local invariants and the discriminant

Throughout, `F` is a number field unless the item says otherwise, and `B = ℍ[F,a,b]`.

### 0.1 Reduced trace and norm on the symbol carrier

The signatures use `trd` for this trace and `nrd` for the native norm form.

Define `trd x = 2·re x` and prove `x + star x = trd x` (`QuaternionAlgebra.self_add_star` with
`c₂ = 0`), `nrd x = (x * star x).re` (Tau Ceti `normForm_apply`), `x² − trd(x)x + nrd(x) = 0`,
`trd(xy) = trd(yx)`, `nrd(xy) = nrd(x)nrd(y)` (`normForm_mul`), `x` is a unit iff `nrd x ≠ 0`
(`isUnit_iff_normForm_isUnit`), and the trace pairing `(x,y) ↦ trd(xy)` is a nondegenerate
symmetric bilinear form with Gram determinant `−16a²b²` on `1,i,j,k`. Prove that an `F`-algebra
equivalence `ℍ[F,a,b] ≃ₐ[F] ℍ[F,c,d]` preserves `trd` and `nrd` (`reducedTrace_eq_of_algEquiv`,
`normForm_eq_of_algEquiv`). *Needs:* Mathlib `QuaternionAlgebra`; Tau Ceti `NormForm`,
`AlgEquiv`.

### 0.2 Local ramification predicates

The rational local predicate is IsRamifiedAtPrime, with its primality instance explicit.

For a finite place `v` of `F` write `a_v = v.unitAtFinitePlace a : (F_v)ˣ`, and for a real place
`w` write `a_w = TauCeti.unitAtRealPlace w a : ℝˣ`. Define IsRamifiedAt B v :⟺ the local Hilbert symbol of a and b = -1
and IsRamifiedAtReal B w :⟺ (a_w, b_w)_ℝ = -1. Prove:

- IsRamifiedAt B v ↔ ¬ Nonempty (ℍ[F_v, a_v, b_v] ≃ₐ[F_v] Matrix (Fin 2) (Fin 2) F_v), from
  `hilbertSymbol_eq_one_iff_nonempty_algEquiv_matrix`, and `↔ ∀ x ≠ 0 in ℍ[F_v,a_v,b_v], IsUnit x`
  (`forall_isUnit_or_nonempty_algEquiv_matrix`);
- IsRamifiedAtReal B w ↔ a_w < 0 ∧ b_w < 0 (`hilbertSymbol_real`);
- both predicates are invariant under replacing `(a,b)` by `(b,a)`, by `(c²a, b)`, or by the
  parameters of an equivalent presentation (`hilbertSymbol_comm`, `hilbertSymbol_congr_sq`, and
  naturality of the splitting predicate under `AlgEquiv`);
- for an abstract quaternion algebra `D` with a presentation `e : D ≃ₐ[F] ℍ[F,a,b]`, the GL₂
  transfer roadmap's `RamifiedExactlyAt D S` holds exactly when `S` is the set of places at which
  `ℍ[F,a,b]` is ramified by these predicates. This is the only point of contact with that
  predicate, and it is a comparison, not a second definition.

*Needs:* 0.1; Tau Ceti `HilbertSymbol/{Basic,Archimedean}`, `QuadraticForm/Global/Localization`,
`SplittingCriterion`, `BaseChange`; GL₂ transfer R17.1.5 for the comparison clause.

### 0.3 The ramification set is finite of even cardinality

Define `Ram_f B = {v | IsRamifiedAt B v}` and `Ram_∞ B = {w real | IsRamifiedAtReal B w}`. Prove
`Ram_f B` finite, from `hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace a b` (the set where
the symbol is `-1` is contained in the multiplicative support), and prove the explicit bound: a
finite place at which `2`, `a` and `b` are units is unramified (`hilbertSymbol_unitAtFinitePlace_eq_one`).
Prove `#Ram_f B + #Ram_∞ B` is even: this is the localized product formula of global quadratic
forms 4.4, `∏_v (a_v,b_v)_v = 1`, whose cohomological form is class field theory's
`hilbertProductFormula`. Prove the local invariant reading: IsRamifiedAt B v ↔ finiteInvAt F v [B] = 1/2
and IsRamifiedAtReal B w ↔ infiniteInvAt F w [B] = 1/2, where `[B] ∈ Br F` is the class of
Tau Ceti's `quaternionClass a b` under the comparison `brauerGroupEquivBr`; Tau Ceti's
`TauCeti.BrauerGroup.invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` in
`NumberTheory/LocalField/Quaternion/Invariant.lean` supplies the nonarchimedean identification at the pin. *Needs:* 0.2; Tau Ceti
`QuadraticForm/Global/HilbertSymbol`; global quadratic forms 4.4; class field theory Layers 10, 14.

### 0.4 The discriminant of `B`

For the rational acceptance statements, `ramificationBound` is the nonzero integer bound above and `discNat` is the finite product defining D.

Define `disc B = ∏_{v ∈ Ram_f B} v.asIdeal`, a product over the finite set of 0.3 (a `Finset`
product, never `∏ᶠ`), and prove: `disc B` is squarefree; `disc B = 1 ↔ Ram_f B = ∅`; `disc` is
invariant under `AlgEquiv`. Over `ℚ` define `D = ∏_{p ∈ Ram_f B} p ∈ ℕ`, prove it squarefree,
prove `p ∣ D ↔ (a,b)_{ℚ_p} = -1`, and prove `p ∣ D → p ∣ 2·num(a)·den(a)·num(b)·den(b)`, so that
`D` is a `Finset` product over the divisors of that integer. *Needs:* 0.3.

### 0.5 Definite and indefinite

The rational predicate in the signatures is `IsDefinite`.

Define IsTotallyDefinite B :⟺ IsTotallyReal F ∧ ∀ w real, IsRamifiedAtReal B w and
IsIndefinite B :⟺ ¬ IsTotallyDefinite B. Prove: over `ℚ`, definite iff `a < 0 ∧ b < 0`, and
then `D` has an odd number of prime factors; indefinite iff `D` has an even number of prime
factors; if `F` has a complex place then every `B` is indefinite; `B` totally definite implies
`nrd` is positive definite at every real embedding and `B` is a division algebra. *Needs:*
0.2, 0.3; Mathlib `IsTotallyReal`.

### 0.6 Quadratic subfields

For a quadratic field extension K/F, prove that an F-algebra embedding K → B exists iff
no ramified place of B splits in K ([V, 14.6.7]). The local criterion uses the abstract
ramification classification through §0.2's comparison.
*Needs:* 0.2–0.5; GL2AutomorphicRepresentationsAndTransfer R17.1.5; GlobalNumberFields Layer 1.

### 0.7 Worked symbol algebras

Prove, as named examples: `ℍ[ℚ,-1,-1]` has `D = 2` and is definite; `ℍ[ℚ,-1,-3]` has `D = 3`;
`ℍ[ℚ,-2,-5]` has `D = 5`; `ℍ[ℚ,-1,-7]` has `D = 7`; `ℍ[ℚ,-1,-11]` has `D = 11`; `ℍ[ℚ,-1,-13]` has
`D = 2`, not `13`; `ℍ[ℚ,3,-1]` has `D = 6` and is indefinite; `ℍ[ℚ,-2,5]` has `D = 10`;
`ℍ[ℚ,-3,5]` has `D = 15`; `ℍ[ℚ,5,5]` and `ℍ[ℚ,1,7]` have `D = 1`. The dyadic values come from
quadratic form invariants 6C items 10 and 12 (`(−1,−1)_2 = -1`, `(2,5)_2 = -1`, `(5,5)_2 = 1`,
`(3,−1)_2 = -1`) and the odd ones from item 9. *Needs:* 0.4, 0.5; QFI 6C.

### Examples

Hamilton symbols give D = 2; the split symbol (1,7) gives D = 1; (3,−1) gives D = 6.

### Dependencies

Pinned quaternion/Hilbert-symbol theory; QuadraticFormInvariants Layer 6C, GlobalQuadraticForms §4.4 and GL2AutomorphicRepresentationsAndTransfer R17.1.5.

## Layer 1: lattices and orders

`R` is a Dedekind domain with fraction field `F` of characteristic `0`, and `B = ℍ[F,a,b]`.

### 1.1 Lattices, left and right orders

The acceptance bundle `QuatOrder` carries the native subalgebra and lattice property; `QuatOrder.toSubmodule` is its underlying module. The predicates `leftOrderSubalgebra` and `rightOrderSubalgebra` express the two multiplier orders on native subalgebras.

Using the generic lattice-order and multiplier-order carriers in the supplier contracts, prove
the quaternion-specific comparison O_L(star I) = star O_R(I) and its right-handed version,
with conjugation acting by α on the left order of αI ([V, 16.3]). Prove
that `R⟨i,j⟩ = R ⊕ Ri ⊕ Rj ⊕ Rk` is an order when `a, b ∈ R` (`[V, 10.2.4]`), that its elements have trd α, nrd α ∈ R (`[V, 10.3.3, 10.3.6]`); conversely a spanning subring all of whose elements
have `trd, nrd ∈ R` is an order (`[V, 10.3.7]`). Orders are stable under `star`
(`star α = trd α − α`). *Needs:* 0.1; Mathlib `Submodule.IsLattice`; CAC 7.4, 7.20.

**Checks.**

- (boundary) For an order `O`, `O_L(O) = O_R(O) = O`: `α ∈ O_L(O)` gives `α = α·1 ∈ O`, and
  `O·O ⊆ O` gives the converse.
- (reject) The zero submodule is not a lattice, and its left order is all of `B`, which is not an
  order: the lattice hypothesis cannot be dropped.
- (comparison) The set `O_L(I)` is the subalgebra `leftOrderSubalgebra I` of `Suggested.lean` for
  every submodule `I`; the generic multiplier-order contract supplies its lattice property when I is a lattice.

### 1.2 Unit groups

The signature definitions `units` and `normOne` realize these two groups as subgroups of Bˣ.

Define `O^× ` (the units of the subalgebra) and `O¹ = {γ ∈ O^× : nrd γ = 1}`, a subgroup of `Bˣ`
(closure under products is `normForm_mul`, inverses are `star`). Prove `nrd(O^×) ⊆ R^×`, that
`O¹ ⊴ O^×` with `O^×/O¹ ↪ R^×`, and that for `R = ℤ`, `O^×/O¹` has order `1` or `2` according
as `O` has no unit of norm `−1` or has one. *Needs:* 1.1.

### 1.3 Discriminants

Define the trace discriminant, determinant reduced discriminant and cubic ideal as in Conventions and prove: all three are fractional ideals (finitely
generated, nonzero, `[V, 15.2.14]`); `disc I = [J : I]_R² disc J` for lattices `I ⊆ J`, where
`[J : I]_R` is the module index, so `I ⊆ J` with `disc I = disc J` forces `I = J`
(`[V, 15.2.15]`); `disc` is invariant under `AlgEquiv` (`[V, 15.2.9]`); `disc R⟨i,j⟩ = (4ab)²·R`
and `discrd R⟨i,j⟩ = 4ab·R` (`[V, 15.2.10]`); `disc M₂(R) = R`. *Needs:* 1.1.

### 1.4 Trace dual and codifferent

The signature definitions are `traceDual` and its specialization `codiff`.

Define `I^♯ = {α : trd(αI) ⊆ R}` and prove it is a lattice with `(I^♯)^♯ = I`, `(βI)^♯ = I^♯β^{-1}`,
`O_L(I^♯) = O_R(I)`, and `I^♯ ≅ Hom_R(I, R)` by `β ↦ (α ↦ trd(αβ))` (`[V, 15.6.4–15.6.7]`). Define
`codiff O = O^♯`, prove `O ⊆ codiff O`, `O_L(codiff O) = O_R(codiff O) = O`, and
`disc O = [codiff O : O]_R` (`[V, 15.6.16–15.6.17]`). Over `ℤ`: `disc O = #(O^♯/O)`.
*Needs:* 1.1, 1.3.

### 1.5 Reduced discriminant

In the acceptance statements `discrd` takes an order, and `discrdNat` is its positive integer generator over ℤ.

For a lattice I define its determinant ideal by the fourth exterior power in the symbol basis,
and its scalar ideal as the inverse image of I under F → B. Prove that the determinant reduced
discriminant δ(I) is independent of the presentation, that disc(I) = δ(I)², and that
δ(I) = [J : I] δ(J) for I ⊆ J. The alternating cubic form descends to B/F, so the exact sequence
0 → I ∩ F → I → image(I → B/F) → 0 gives δ(I) = (I ∩ F)cubic(I).
For an order O, integrality and integral closedness of R give O ∩ F = R; hence
its reduced discriminant is cubic(O), with disc(O) = discrd(O)² and the index law for orders.
These statements use the determinant transformation law and the alternating form
([V, 15.2.6, 15.2.15, 15.4.2–15.4.7], pp. 234–239); the cubic formula alone does not give
index multiplicativity for arbitrary lattices. Over ℤ take the positive generator.
*Needs:* 1.3, 1.4; exterior powers of finite projective modules.

**Checks.**

- For the Lipschitz order L, the trace determinant is −16, cubic(L) = (4), and δ(L) = (4).
- For 2L, the determinant is −4096, cubic(2L) = (32), the scalar ideal is (2), and δ(2L) = (64); 64² = 4096 whereas 32² = 1024.
- For L inside the Hurwitz order H, [H : L] = 2 and 4 = 2·2. In Mathlib this index is the relative index of L's additive subgroup in H's, never the reverse.
- Over a field R = F, all three nonzero fractional ideals equal F; the zero submodule is excluded by the lattice hypothesis.

### 1.7 Local structure at split and division places

For a DVR R with fraction field F and B = M₂(F), every maximal order is conjugate to M₂(R),
and an order is maximal iff its trace discriminant is R ([V, 10.5.5, 15.5.3]).
For a complete DVR and division B, the unique extension of the valuation gives the unique
maximal order O = {x : nrd(x) ∈ R}; its normalizer is Bˣ and
Bˣ/(FˣOˣ) is the quotient of the value groups ([V, §13.3], pp. 197–201).
Retain its ramification index e(B/F): the quotient is cyclic of order e(B/F), which need not be two.
When the residue field is finite, F is a nonarchimedean local field: e(B/F) = 2,
discrd(O) = 𝔭, and a division uniformizer generates the quotient of order two
([V, 13.3.11, 15.5.4, 23.3.14]).
*Needs:* 1.3; classical arithmetic completion §§7.21, 7.56; completed NFA Layer 5.

**Checks.**

- M₂(R) has trace determinant −1 and reduced discriminant R, including residue characteristic two.
- For Hamilton(ℝ)((t)), O = Hamilton(ℝ)[[t]] has trace determinant −16, a unit; e = 1 and the normalizer quotient has one element.
- For the quaternion division algebra over ℚ₂, the maximal ideal P has P² = 2O; e = 2, discrd(O) = (2), and the normalizer quotient has two elements.

### 1.8 The maximality criterion

The rational maximality equivalence is `isMax_iff_discrdNat_eq`.

For `R = 𝓞 F`: `O` is maximal iff `discrd O = disc B` (`[V, 15.5.5]`). Corollaries: maximal orders
form one genus; two maximal orders have the same reduced discriminant; the maximal orders of the
examples of 0.7: the Hurwitz order `ℤ⟨i, j, (1+i+j+k)/2⟩ ⊂ ℍ[ℚ,-1,-1]` (construct the displayed lattice as an order and prove maximality by its discriminant;
AdelicAlgebraicGroups §5.3 supplies its 24 units and one class) and, for `ℍ[ℚ,3,-1]`,
`O = ℤ⟨1, i, j, (1+i+j+k)/2⟩` with `discrd O = 6`. The Lipschitz order `ℤ⟨i,j⟩ ⊂ ℍ[ℚ,-1,-1]` has
`discrd = 4` and is not maximal. *Needs:* 0.4, 1.5, 1.7.

**Checks.**

- The Lipschitz order `ℤ⟨i,j⟩ = ℤ ⊕ ℤi ⊕ ℤj ⊕ ℤk ⊂ ℍ[ℚ,-1,-1]` has `discrd = 4 ≠ 2 = D` and is
  not maximal: it lies in the Hurwitz order.
- The Hurwitz order `ℤ⟨i, j, (1+i+j+k)/2⟩ ⊂ ℍ[ℚ,-1,-1]` has `discrd = 2 = D` and is maximal.
- `O_6 = ℤ⟨1, i, j, (1+i+j+k)/2⟩ ⊂ ℍ[ℚ,3,-1]` has `discrd = 6 = D` and is maximal.
- (reject) `ℤ + 2O_6`, with basis `1, 2i, 2j, 1+i+j+k`, has `discrd = 48 = 2³·6` and is not
  maximal, as 1.11's `discrd(ℤ + fO) = f³ discrd O` predicts.

### 1.9 Eichler orders

The predicate `IsEichler` records precisely this intersection property.

Define Eichler orders as pinned. Prove (`[V, 23.4.2–23.4.3]`): being Eichler is local; over a DVR
with `B = M₂(F)`, `O` is Eichler iff it is conjugate to the standard order
`O_0(𝔭^e) = [[R, R],[𝔭^e, R]]` for a unique `e ≥ 0`, iff it contains a conjugate of the diagonal
`R × R`; the standard order has `discrd = 𝔭^e`, is the intersection of the two maximal orders
`M₂(R)` and `[[R,𝔭^{-e}],[𝔭^e,R]]`, and for `e ≥ 1` has `N_{B^×}(O_0(𝔭^e))/(F^×O^×) ≅ ℤ/2`
generated by `[[0,1],[ϖ^e,0]]` (`[V, 23.4.14]`). Every superorder of an Eichler order is Eichler
(`[V, 23.4.10]`); hereditary orders are Eichler; an order is hereditary iff `discrd O` is squarefree
(`[V, 23.3.18]`). *Needs:* 1.7, 1.8.

### 1.10 Level, and the genus of an Eichler order

The signature definition `level` is discrdNat(O)/D; D is positive and divides discrdNat(O) for Eichler orders. The arithmetic function `psi` is used only at positive levels.

For `R = 𝓞 F` and `O` Eichler: at `𝔭 | disc B`, `O_𝔭` is the unique maximal order; at `𝔭 ∤ disc B`,
`O_𝔭 ≅ O_0(𝔭^e)` with `e = ord_𝔭 discrd O`. Hence `discrd O = disc B · 𝔐` with `𝔐` coprime to
`disc B`, the **level**, and the pair `(disc B, 𝔐)` determines the genus of `O` (`[V, 23.4.19]`).
Over `ℚ`: `discrd O = DN` with `gcd(D,N) = 1`. Prove the index of unit groups at a split place
`[GL₂(R_𝔭) : O_0(𝔭^e)^×] = N𝔭^{e-1}(N𝔭 + 1)` for `e ≥ 1`, so that
`[O(1)^× : O^×]` for a maximal `O(1) ⊇ O` locally at every `𝔭 | 𝔐` is `ψ(𝔐) = N𝔐 ∏_{𝔭|𝔐}(1 + 1/N𝔭)`,
and the same for the norm-one groups. Prove that every Eichler order is locally norm-maximal:
`nrd(O_𝔭^×) = R_𝔭^×` for all `𝔭` (`[V, 28.5.16]`) — at the `𝔭` where `O_𝔭` is maximal this is
classical arithmetic completion 7.60, consumed, and what is proved here is the case `𝔭 | 𝔐`,
`O_𝔭 ≅ O_0(𝔭^e)` with `e ≥ 1`. *Needs:* 1.7–1.9; CAC 7.60.

**Checks.**

- For a maximal order the level is 1 and ψ(1) = 1.
- At local level 2², ψ(4) = 2·3 = 6, agreeing with the index in the maximal local norm-one group.
- The total Lean definition gives ψ(0) = 1 from an empty prime-factor product; zero is not a congruence modulus and no finite-index theorem uses it.

### 1.11 Orders over `ℤ`: bases and the index

For `R = ℤ`: an order has a `ℤ`-basis `1 = x_1, x_2, x_3, x_4` (Mathlib `Module.Free` of a finite
torsion-free `ℤ`-module); `disc O = |det(trd(x_i x_j))|`; for `O' ⊆ O`, `discrd O' = [O : O']·discrd O`;
`ℤ + fO` has `discrd = f³ discrd O`. Prove the LMFDB's `discO` of an order presented by a stored
basis is `discrd O` computed from that basis. *Needs:* 1.3–1.5.

### 1.12 Eichler orders of level `𝔭^e` and vertices at distance `e`

For R a complete DVR with finite residue field, construct the order-to-tree comparison: on
the graph 𝒯 of homothety classes of rank-two R-lattices in F², with edges given by inclusions
ϖL ⊊ L′ ⊊ L, prove it is a tree. Prove
(`[V, 23.5.5, 23.5.8]`), `[L] ↦ End_R(L)` is a bijection from vertices to maximal orders of
`M₂(F)`, adjacent vertices meet in Eichler orders of level `𝔭`, conjugation of orders is the
building action, and order units and normalizers are the corresponding stabilizers. Prove further: the maximal orders at two vertices at distance `e`
intersect in an Eichler order of level `𝔭^e`, and every Eichler order of level `𝔭^e` is such an
intersection (`[V, 23.5.15]`), so that 1.10's local level `e` is a distance on `𝒯`.
*Needs:* 1.7, 1.9, 1.10; elementary divisors for lattices over a DVR.

**Checks.**

- The vertex R² gives End_R(R²) = M₂(R).
- The vertices of R² and R⊕ϖR have distance one and intersect in O₀(𝔭).
- Distance e = 0 gives a maximal order and level 1; distance e = 2 gives O₀(𝔭²) and reduced discriminant 𝔭², distinguishing distance from the number of endpoint vertices.

### 1.13 Products of lattices, principal and invertible lattices

The signature predicate `IsInvertible` records both inverse-product equalities and both lattice conditions.

For lattices `I, J ⊆ B` define the product `IJ` (the `R`-span of the products, Mathlib's
`Submodule.mul`), **compatible** (`O_R(I) = O_L(J)`), **principal** (`I = O_L(I)α = αO_R(I)` for
some `α ∈ B^×`), **locally principal** (`I_𝔭` principal for every `𝔭`), and **invertible**: there
is a lattice `I'` with `II' = O_L(I)` and `I'I = O_R(I)` (`[V, 16.2.1, 16.2.4–16.2.5, 16.5.1]`). Define
`nrd(I)` as the `R`-submodule of `F` generated by `{nrd α : α ∈ I}`. Prove `IJ` is a lattice
with `O_L(IJ) ⊇ O_L(I)`, `O_R(IJ) ⊇ O_R(J)`, that a principal lattice is invertible with
`I' = α^{-1}O_L(I)`, and that invertibility is invariant under `AlgEquiv` and under `I ↦ star I`.
Right fractional O-ideals are lattices I with IO ⊆ I; proper means O_R(I) = O.
In the class, type, norm-index and Brandt constructions, “invertible right O-ideal” means
a proper invertible lattice, equivalently locally free of rank one over O; integral means I ⊆ O. *Needs:* 1.1, 1.4.

### Examples

Lipschitz and Hurwitz have reduced discriminants 4 and 2; O₆ has 6. Distance-two lattice vertices yield level 𝔭².

### Dependencies

Layer 0; the generic orders of ClassicalArithmeticCompletion §§7.4, 7.20, 7.21, 7.56; elementary divisors over a DVR.

## Layer 2: Gorenstein and Bass orders, the ternary form, the Eichler symbol

### 2.1 The even Clifford correspondence

For a nondegenerate ternary quadratic module `Q : M → 𝔩` over `R` (a quadratic form on a rank-`3`
lattice with values in a fractional ideal), the even Clifford algebra `Clf⁰(Q)` is an `R`-order in
the quaternion algebra `Clf⁰(Q_F)` (`[V, 22.3.22]`); `Q ↦ Clf⁰(Q)` is a discriminant-preserving
bijection from nondegenerate ternary quadratic modules up to twisted similarity to quaternion
orders up to isomorphism (`[V, 22.5.7]`; over a PID, forms up to similarity, `[V, 22.4.1]`). The
inverse sends `O` with `discrd O = (N)` to `N·nrd^♯` on the trace-zero part of `O^♯`
(`[V, 22.4.12]`), and `O = R + discrd(O)·(O^♯)⁰(O^♯)⁰` (`[V, 22.4.15]`). The LMFDB's
`ShimuraCurveLattice`, the trace-zero sublattice `O⁰` of an Eichler order with the form `nrd`, is
not this form (`[V, 22.4.19]`): the correspondence preserves discriminants, while `(O⁰, nrd)` has
discriminant `(discrd O)²` (Hurwitz order: `(O⁰, nrd) = ⟨1,1,1⟩` of discriminant `4`, and the
Clifford form `2·nrd^♯` on `(O^♯)⁰` is `(x·x)/2` on the `A₃` lattice, of discriminant `2`). Prove, for Eichler O,
`disc(O⁰, nrd) = (discrd O)²`, and that the Clifford form determines `(O⁰, nrd)` through
`O = R + discrd(O)·(O^♯)⁰(O^♯)⁰`. The genus of `O` corresponds to the genus of `Q` with
`Cl Q ↔ Typ O` (`[V, 22.5.12]`). *Needs:* 1.3–1.5;
quadratic form invariants Layer 2 for the trace-zero form; Mathlib `CliffordAlgebra`, `evenOdd`.

**Checks.**

- For the Hurwitz order, the trace-zero form is x²+y²+z² with ternary discriminant 4, while its Clifford form has discriminant 2.
- For M₂(ℤ), the trace-zero norm is −x²−yz, with discriminant 1, equal to the square of the reduced discriminant.
- The Lipschitz order has the same trace-zero form as the Hurwitz order but reduced discriminant 4: 4 ≠ 4². It is not Eichler, so the trace-zero discriminant identity requires that hypothesis.

### 2.2 Gorenstein orders

The signature predicate is `IsGorenstein`.

`O` is **Gorenstein** when `codiff O` is invertible (`[V, 24.2.1]`). Prove it is local, and
equivalent to: every sated (`O_L(I) = O`) left or right fractional `O`-ideal is invertible
(`[V, 24.2.3]`); `nrd(codiff O)·discrd O = R` (`[V, 24.2.5]`, with `⊆` always); the ternary form
of 2.1 is primitive (`[V, 24.2.10]`). Maximal and Eichler orders are Gorenstein. *Needs:*
1.4, 1.13, 2.1.

### 2.3 Gorenstein saturation and conductor

There is a unique ideal `𝔣(O) ⊆ R` and Gorenstein order `Gor(O)` with `O = R + 𝔣(O)·Gor(O)`, and
`𝔣(O) = discrd(O)·nrd(O^♯)` (`[V, 24.2.15]`); `O ≅ O'` iff `Gor O ≅ Gor O'` and `𝔣(O) = 𝔣(O')`
(`[V, 24.2.22]`). Over `ℤ` write `O = ℤ + f(O)Gor(O)` with `f(O) ∈ ℕ` (`[V, 24.1.4]`). Example:
`ℤ + 2O_6` for the maximal order `O_6` of discriminant `6` has `f = 2`, `discrd = 48`, and is not
Gorenstein. *Needs:* 2.2.

**Checks.**

- `ℤ + 2O_6`: `f = 2`, `Gor = O_6`, `discrd = 48`, not Gorenstein.
- (boundary) A Gorenstein order has `𝔣(O) = R` and `Gor(O) = O`, since `nrd(codiff O)·discrd O = R`
  (2.2); so `f(O_6) = 1` and the Lipschitz order (Gorenstein by 2.7) has `f = 1`.
- (reject) `ℤ + 2O_6` and `O_6` have the same Gorenstein saturation and different conductors, so
  they are not isomorphic (`[V, 24.2.22]`).

### 2.4 The Eichler symbol and local unit counts

Define `(O | 𝔭)` as pinned, prove `O_𝔭` is Eichler iff maximal or residually split (`[V, 24.3.6]`),
and prove `[O_𝔭^× : 1 + 𝔭O_𝔭]` equals `q(q−1)²(q+1)`, `q²(q−1)²`, `q²(q²−1)`, `q³(q−1)` according
as `(O | 𝔭) = ∗, 1, −1, 0` (`[V, 24.3.12]`), where `q = N𝔭`: the index is `#(O_𝔭/𝔭O_𝔭)^×`, the
preimage of `(O_𝔭/rad O_𝔭)^×` under a surjection with kernel of order `q^{4 − dim_k(O_𝔭/rad O_𝔭)}`.
Define `λ(O,𝔭)` as pinned.
*Needs:* 1.7, 1.9, 2.2.

### 2.5 Bass orders

The predicate `IsBass` quantifies over every superorder; `IsEichler.isBass` is the acceptance theorem in characteristic zero.

`O` is **Bass** when every superorder is Gorenstein (`[V, 24.5.1]`). Prove: local; Eichler orders
are Bass; over a complete DVR, Bass iff every `O`-ideal is generated by two elements iff every
`O`-lattice is a direct sum of ideals (`[V, 24.5.3]`); residually inert orders are Bass
(`[V, 24.5.4]`); the radical idealizer `O^♮ = O_L(rad O) ∩ O_R(rad O)` of a non-maximal residually
inert order is its unique minimal superorder, with `[O^♮ : O]_R = 𝔭²` (`[V, 24.4.7]`).
*Needs:* 2.2–2.4.

### 2.6 Classification of local orders by their symbol

Prove the trichotomy used by the LMFDB's order labels: a Gorenstein order over a complete DVR
is maximal, or residually split (Eichler of level `𝔭^e`, `e ≥ 1`), or residually inert, or
residually ramified (`(O|𝔭) = 0`), and record which are Bass and which are hereditary.
*Needs:* 2.2–2.5.

### 2.7 Worked orders

Prove: the Lipschitz order is Gorenstein and Bass, with Eichler symbol `(O|2) = 0`; the maximal
order of discriminant `6` is Eichler of level `1` with `(O|2) = (O|3) = -1`; `ℤ + 2O_6` is not
Gorenstein with `Gor = O_6`, `f = 2`; the Eichler order of level `5` in discriminant `6` has
`discrd = 30`, `(O|5) = 1`. *Needs:* 2.2–2.6.

**Checks.**

- Lipschitz order: Gorenstein and Bass, `(O|2) = 0`.
- O₆ has residue division fields 𝔽₄ and 𝔽₉ at 2 and 3, hence symbol −1 at both. The unit counts modulo pO are 2²(2²−1) = 12 and 3²(3²−1) = 72; the split-symbol counts 6 and 48 are wrong here.
- At 5, O₆ is split maximal: symbol ∗ and unit count 5·4²·6 = 480.
- `ℤ + 2O_6`: not Gorenstein, hence not Bass; `Gor = O_6`, `f = 2`.
- The Eichler order of level `5` in discriminant `6`: `discrd = 30`, `(O|5) = 1`.

### Examples

O₆ is Gorenstein, while ℤ+2O₆ has conductor 2 and reduced discriminant 48.

### Dependencies

Layer 1; Clifford algebras and the trace-zero norm form of QuadraticFormInvariants Layer 2.

## Layer 3: ideals, class sets, types, and the idelic dictionary

### 3.1 Invertible and locally principal lattices

The acceptance carrier `RightIdeal` bundles right stability, invertibility and equality of the full right multiplier order with O.

With the products, principal, locally principal and invertible lattices and the norm `nrd(I)`
of 1.13, prove `nrd(I)` is a fractional ideal; for `R = ℤ` and integral `I`, `nrd I` is generated by
`nrd(I) ∈ ℕ` with [O : I] = nrd(I)² for I locally principal over O (in particular O_R(I) = O). Prove: invertible iff locally
principal (`[V, 16.1.3]` over `ℤ`; over a Dedekind domain `[V, 16.6.1]` with the standard
involution); a lattice whose left or right order is maximal is locally principal
(`[V, 17.2.3]`); `nrd(IJ) = nrd(I)nrd(J)` for compatible invertible `I, J` and
`I^{-1} = star I / nrd I` for invertible `I`. *Needs:* 1.1, 1.4, 1.13.

### 3.2 The right class set

The signatures call the equivalence relation `ClassRel`, its quotient `ClassSet`, and its cardinality `classNumber`.

Define `Cls O` as pinned, as a `Quot` of invertible right fractional `O`-ideals by left
multiplication by `Bˣ`, and prove `I ∼ J` iff `I ≅ J` as right `O`-modules (`[V, 17.3.3]`). Define
the left class set and `star : Cls_L O ≃ Cls_R O`. Prove that `[I] ↦ [O_L(I)]` is a well-defined
surjection `Cls O → Typ O` (`[V, 17.4.13]`) and that a connecting ideal `J` induces a bijection
`Cls O ≃ Cls O'` by `[I] ↦ [IJ]` (`[V, 17.4.11]`). *Needs:* 3.1.

**Checks.**

- Hurwitz order: one class and one type.
- For O = O₀(2), I = M₂(ℤ) is right stable but O_R(I) = M₂(ℤ) ≠ O, so I is excluded. The integral lattice 2M₂(ℤ) is likewise excluded: its index in O is 8 and its norm ideal is (4), with 8 ≠ 4².
- For I = 2O₀(2), properness holds, its index is 16 and its norm ideal is (4), giving 16 = 4².
- `D = 11`: two classes, whose left orders have unit groups of orders `4` and `6`, so of different
  types: `Cls O → Typ O` is a bijection onto two types.
- `D = 37`: three classes and two types, so `Cls O → Typ O` is surjective and not injective.
- (well defined) `[αI] ↦ [O_L(αI)] = [αO_L(I)α^{-1}] = [O_L(I)]` by 1.1.

### 3.3 Genus, type set, connecting ideals

The corresponding acceptance definitions are `TypeRel`, `TypeSet` and `typeNumber`, using the left multiplier orders of proper ideals.

Define same type, connected, locally of the same type, `Gen O`, `Typ O` as pinned; prove
connected iff locally isomorphic (`[V, 17.4.6]`), that `OO'` is a connecting ideal for maximal
`O, O'` (`[V, 17.4.7]`), and that `# Cls` is constant on a genus. *Needs:* 3.1, 3.2.

### 3.4 The idelic dictionary

For `R = 𝓞 F` let `B̂ = B ⊗ 𝔸_{F,f}` and `Ô = O ⊗ ℤ̂`. The bijection `α̂ ↦ B ∩ α̂Ô` from
`B^× \ B̂^× / Ô^×` to the isomorphism classes of locally free rank-one right `O`-lattices is
classical arithmetic completion 7.78 at `Λ = O` (its `U(O)` contains the archimedean factors of
`J(B)`, so `B^× \ J(B) / U(O) = B^× \ B̂^× / Ô^×`), and the gluing `B ∩ ∏_𝔭 α̂_𝔭 O_𝔭` with its
completions is its 7.72; both are consumed. Prove the quaternion reading: a right `O`-lattice is
locally free of rank one over O iff it is a proper invertible lattice (3.1), so that 7.78 reads
`Cls O ≃ B^× \ B̂^× / Ô^×` (`[V, 27.6.8]`, bijection (27.6.9)), and the reduced-norm identity
`nrd(B ∩ α̂Ô) = F ∩ nrd(α̂)R̂`. For totally definite `B` this is the comparison with quaternionic
modular forms §0.3's `classSet U` at `U = Ô^×`, and with Hilbert modular varieties R18.3.1's
`DefiniteClassSet` after the central quotient; this milestone states the comparison and proves it,
and it is the only place a second description of `Cls O` appears. *Needs:* 3.1, 3.2;
global number fields Layers 4, 6; CAC 7.72, 7.78; QMF §0.3.

### 3.5 Finiteness of class and type sets

The acceptance theorem `finite_classSet` is stated for the ring of integers of every number field.

Prove `Cls O` and `Typ O` finite for every order over `𝓞 F` (`[V, 17.7.1]`): through 3.4 and adelic
algebraic groups AA.3.4 `class-number-finite` for `G = B^×` with the compact open `Ô^×`; for totally
definite `B` also directly through quaternionic modular forms `finite_classSet`. Over `ℚ` and `B`
definite, prove `O^× = O¹` is finite and every class is represented by an integral ideal of norm
`≤ (8/π²)·discrd O` (`[V, 17.5.6]`). *Needs:* 3.4; AA.3.4; QMF §0.3.

### 3.6 Two-sided ideals, the normalizer and `Pic_R(O)`

The signature subgroup `normalizer` consists of the elements preserving O; `scalarUnits` is the subgroup FˣOˣ pulled back to it.

Define `Idl(O)` (invertible two-sided `O`-ideals), `PIdl(O)` (those `OαO` with `α ∈ N_{B^×}(O)`),
`Pic_R(O) = Idl(O)/{aO : a ∈ Fˣ}`, and prove the exact sequence
1 → Cl R → Pic_R(O) → Idl(O)/Idl(R) → 1. For a number field and B indefinite, also prove
1 → N(O)/(FˣOˣ) → Pic_R(O) → Cl(G(O),R)
(`[V, 28.9.13–28.9.14]`), where `Cl_{G(O)} R = F^×_{>Ω 0}\F̂^×/nrd(Ô^×)`. For `O` Eichler with
`discrd O = 𝔑`, prove `Idl(O)/Idl(R) ≅ ∏_{𝔭 | 𝔑} ℤ/2` (`[V, 23.4.20]`), generated at each `𝔭` by the
primitive two-sided ideal of norm 𝔭 at a division prime, and of norm 𝔭ᵉ at a level prime
𝔭ᵉ ∥ 𝔐, represented locally by J = O₀(𝔭ᵉ)[[0,1],[ϖᵉ,0]], with J² = 𝔭ᵉO₀(𝔭ᵉ). *Needs:* 3.1, 3.4; 1.7, 1.9.

**Checks.**

- For R = ℤ[√−5] and O = M₂(R), Pic_R(O) = Cl R has order two, whereas Idl(O)/Idl(R) is trivial.
- For O₀(4), w = [[0,1],[4,0]] has determinant −4, w² = 4I, and the two-sided ideal has norm (4), not (2).
- At a division prime p, the radical P has norm (p) and P² = pO; at level p the matrix representative has norm ideal (p), agreeing only when e = 1.

### 3.7 The Atkin–Lehner group

Define `AL(O) = {J ∈ Idl(O) : [nrd J] ∈ (Cl_{G(O)} R)²}/Idl(R)` (`[V, 28.9.8]`) and prove: it is
an elementary abelian `2`-group; for `O` Eichler it is `∏_{𝔭|𝔑} ℤ/2` whenever `# Cl_{G(O)} R` is
odd (`[V, 28.9.10]`). Over `ℚ` with `O` Eichler of level `N`: `Cl_{G(O)} ℤ = 1` (1.10 and
`Cl ℤ = 1`), so `AL(O) ≅ (ℤ/2)^{ω(DN)}`, and its elements are the classes `w_m` of the two-sided
ideals of reduced norm `m` for the Hall divisors `m ∥ DN`. *Needs:* 3.6.

### 3.8 Hurwitz and the class number one examples

Prove `# Cls = 1` for the Hurwitz order (AdelicAlgebraicGroups §5.3, consumed) and for the
maximal orders of discriminant `3, 5, 7, 13`, and `# Cls = 2` for discriminant `11` with unit
groups of orders `4` and `6`, `# Cls = 3` for `37` with all unit groups `{±1}`, by the mass and embedding formulas of 5.2 and 6.6, with the left-order unit counts retained. *Needs:* 3.2, 3.5.

**Checks.**

- `# Cls = 1` for the Hurwitz order and for the maximal orders of discriminant `3, 5, 7, 13`.
- `D = 11`: two classes, left-order unit groups of orders `4` and `6`.
- `D = 37`: three classes, all left-order unit groups `{±1}`.
- (indefinite) `O_6 ⊂ ℍ[ℚ,3,-1]` has `# Cls = 1` (4.3).

### 3.9 Transport of class sets under isomorphism and under change of level

Prove `Cls O ≃ Cls O'` for `O ≅ O'`, and for `O' ⊆ O` the surjection `Cls O' → Cls O`,
`[I] ↦ [IO]`, with fibres of size controlled by `[O^× : O'^×]`-type indices; this is the ideal-side
face of adelic algebraic groups AA.5.3. *Needs:* 3.2, 3.4.

### 3.10 Ideals of a given norm

For `O` Eichler and an integral ideal `𝔫`, prove that the number `a_𝔫(O)` of integral invertible
right `O`-ideals of reduced norm `𝔫` is constant on the genus, multiplicative in coprime `𝔫`, and
equal to `∑_{𝔡 | 𝔫} N𝔡` for `𝔫` coprime to `discrd O`; at `𝔭 | disc B`, `a_{𝔭^e} = 1`
(`[V, 26.3.4, 26.3.9, 26.4.1]`). *Needs:* 3.1, 3.6.

### Examples

D = 11 has two ideal classes and two types; D = 37 has three classes and two types.

### Dependencies

Layer 1; ClassicalArithmeticCompletion §§7.72, 7.78; AdelicAlgebraicGroups §3.4; GlobalNumberFields Layers 4 and 6; QuaternionicModularForms §0.3.

## Layer 4: indefinite algebras — Eichler's theorems from strong approximation

Here `R = 𝓞 F` and `B` is indefinite (0.5). The input is adelic algebraic groups AA.4.2:
`B¹ = ker nrd` is dense in `B̂¹` (Voight `[V, 28.5.3]`), consumed, never reproved.

### 4.1 Eichler's theorem on the class set

Prove that `nrd` induces a bijection `Cls O → Cl_{G(O)} R` (`[V, 28.5.5]`), and for locally
norm-maximal `O` (every Eichler order, 1.10) a bijection `Cls O → Cl_Ω R`, the ray class group of
`R` with positivity at the real ramified places `Ω` (`[V, 28.5.17]`, `[V, 17.8.3]`). The
strong-approximation input is adelic algebraic groups AA.4.2 and, in the form
`J(B)′ = B^×′·(J(B)′ ∩ U(O))` for `B` satisfying Eichler's condition (for a quaternion algebra,
indefiniteness, 0.5), classical arithmetic completion 7.44; both are consumed. Deduce: `# Cls O = # Cl_Ω R`; if `# Cl⁺ R = 1` then every
proper invertible right ideal of an Eichler order is principal. *Needs:* 3.2, 3.4, 1.10; AA.4.2; CAC 7.44;
GNF Layer 2 (ray class groups).

### 4.2 Types

Prove `Typ O ≃ Cl_{G_N(O)} R` for the normalizer-enlarged group (`[V, 28.5.10]`), and that
`Cl_{G(O)} R = 1` implies `# Typ O = 1` (`[V, 28.5.6]`). *Needs:* 4.1, 3.3.

### 4.3 Over `ℚ`

The acceptance statements are `classNumber_eq_one_of_not_isDefinite` and `exists_conj_of_level_eq`.

For `O` Eichler in an indefinite `B/ℚ`: `# Cls O = 1`, `# Typ O = 1`, and `O¹ → (O/mO)¹` is
surjective for every `m` (`[V, 28.2.11]`); more generally `O¹` is dense in `Ô¹` (`[V, 28.5.14]`).
Hence every two Eichler orders of the same level in `B` are conjugate, and `X_0(D;N)` of Layer 8
does not depend on the choice of `O`. *Needs:* 4.1, 4.2.

### 4.4 Norms of units and of elements

The rational Eichler unit theorem is `exists_unit_nrd_eq_neg_one`.

Prove Eichler's norm theorem: for nonzero n ∈ R positive at Ω there is an integral `α ∈ B^×` with
`nrd α = n` (`[V, 28.6.1]`); for `O` Eichler with `Cl_Ω R = 1`, `nrd(O^×) = R^×_{>Ω 0}` (`[V, 28.6.4]`);
over `ℚ` every locally norm-maximal order has a unit of reduced norm `−1` (`[V, 28.6.10]`), so
`[O^× : O¹] = 2`. The global norm image `nrd(B^×) = F^×_{>Ω 0}` is AA.4.6 and classical
arithmetic completion 7.60, and the local images — `nrd(B_𝔭^×) = F_𝔭^×`, `nrd(O_𝔭^×) = R_𝔭^×` for
`O_𝔭` maximal, `ℝ_{>0}` at a ramified real place — are 7.60; all consumed. The local image of an
Eichler order at `𝔭 | 𝔐` is 1.10, and this milestone proves the three global statements above.
*Needs:* 4.1, 1.10; AA.4.6; CAC 7.60.

**Checks.**

- In M₂(ℚ), diag(−1,1) is integral and invertible with norm −1; positivity at the empty ramification set imposes no sign condition.
- Zero satisfies that empty positivity condition but cannot be a norm of a unit; it is the norm of 0 ∈ B only.
- For a real division place every nonzero reduced norm is positive, so −1 is excluded there.

### 4.5 The normalizer sequence

The signature type `atkinLehnerGroup` denotes this normalizer quotient; `card_atkinLehnerGroup` states its order for indefinite rational Eichler orders.

Prove the split exact sequence `1 → (Cl R)[2]↑O → N_{B^×}(O)/(F^×O^×) → AL(O) → 1`
(`[V, 28.9.17]`). Over `ℚ` with `O` Eichler of level `N`: `N_{B^×}(O)/(ℚ^×O^×) ≅ AL(O) ≅ (ℤ/2)^{ω(DN)}`,
with a representative `w_m ∈ N_{B^×}(O)` of reduced norm `m` for every `m ∥ DN`, and
`w_m w_{m'} ∈ ℚ^× O^× w_{mm'/gcd(m,m')²}`. *Needs:* 3.7, 4.1, 4.4.

### 4.6 Positive-norm normalizer over `ℚ`

Define `N^+_{B^×}(O) = {γ ∈ N_{B^×}(O) : nrd γ > 0}` and prove `N^+/(ℚ^×_{>0}O¹) ≅ AL(O)`, every
class `w_m` having a representative of positive norm `m` (the representatives of 4.5 have norm
`m > 0`), and `N_{B^×}(O) = N^+ ⊔ N^+·u` for a unit `u` of norm `−1` (4.4). *Needs:* 4.4, 4.5.

### 4.7 Jacobinski cancellation

Record that classical arithmetic completion 7.98 (cancellation for locally free lattices under
Eichler's condition) is the module-theoretic face of 4.1: a stably free locally free `O`-lattice
is free; this roadmap adds the identification of its rank-one case with 4.1 and nothing else.
*Needs:* 4.1; CAC 7.98.

### Examples

O₆ has one ideal class; diag(−1,1) in the split order has reduced norm −1.

### Dependencies

Layers 1 and 3; AdelicAlgebraicGroups §§4.2, 4.6 and ClassicalArithmeticCompletion §§7.44, 7.60, 7.98.

## Layer 5: definite algebras — the Eichler mass formula

Here `B` is totally definite over the totally real field `F` of degree `n`, and `O ⊂ B` an order
with `discrd O = 𝔑`.

### 5.1 The mass

Prove `O^×/R^×` finite (`[V, 26.5.1]`; over `ℚ`, `O^× = O¹` is finite, `[V, 17.7.13]`), define
`mass(Cls O)` as pinned (a finite sum over `Cls O`, finite by 3.5): over `ℤ`,
`mass(Cls O) = ∑_{[J] ∈ Cls O} 1/w_J` with `w_J = #O_L(J)^×/2`, where `J` is any representative of its
class (conjugate left orders have isomorphic unit groups, so `w_J` is a function on `Cls O`); and
prove it is constant on
the genus and that `mass(Cls O) ≤ # Cls O` with equality iff every `O_L(J)^× = R^×`.
*Needs:* 3.2, 3.5.

**Checks.**

- Hurwitz order: one class, `24` units, `w = 12`, mass `1/12`.
- `D = 11`: mass `1/2 + 1/3 = 5/6 < 2 = # Cls O`.
- (equality case) `D = 13`: units `{±1}`, mass `1 = # Cls O`; `D = 37`: mass `3 = # Cls O`.
- (convention) The weight is `#O_L(J)^×/2`, not `#O_L(J)^×`: the Hurwitz order has weight `12`.

### 5.2 The Eichler mass formula over `ℚ`

The acceptance theorem `eichler_mass_formula` sums 2/#O_L(I)ˣ over any finite complete
set of proper invertible right-ideal class representatives; it is independent of that choice.

For `B/ℚ` definite of discriminant `D`: for `O` maximal, `∑_{[J]} 1/w_J = φ(D)/12`
(`[V, 25.1.1]`); for `O` Eichler of level `M`, `∑ 1/w_J = φ(D)ψ(M)/12` (`[V, 25.3.18]`); for any
`O` with `discrd O = N`, `∑ 1/w_J = (N/12)∏_{p|N} λ(O,p)` (`[V, 25.3.19]`). The proof route is the
zeta function of the order (`[V, 25.2–25.3]`, Theorem 26.2.12 applied to the norm form on a lattice
in `ℝ⁴`), or, for the passage between levels, adelic algebraic groups AA.5.3's identity
`∑_{Cls U'} 1/|Γ'_x| = ([U:U']/[ℚ^× ∩ U : ℚ^× ∩ U'])∑_{Cls U} 1/|Γ_x|`, which with 1.10's index
`ψ(M)` reduces the Eichler case to the maximal case. Either route proves the same formula. *Needs:* 5.1, 3.4, 1.10, 2.4; AA.5.3.

**Checks.**

- Maximal orders: `φ(D)/12 = 1/12, 1/6, 5/6, 3` for `D = 2, 3, 11, 37`, matching 5.6.
- Eichler order of level `3` in `D = 2`: `φ(2)ψ(3)/12 = 1/3`, one class with `w = 3`.
- Eichler orders of level `7` in `D = 2`: `φ(2)ψ(7)/12 = 2/3`, two classes with `6` units each.

### 5.3 The Eichler mass formula over a totally real field

`mass(Cls O) = (2ζ_F(2)/(2π)^{2n})·d_F^{3/2}·h_F·N𝔑·∏_{𝔭|𝔑} λ(O,𝔭)` (`[V, 26.1.5]`), and for
Eichler orders of level `𝔐` in the algebra of discriminant `𝔇`,
`mass(Cls O) = (2ζ_F(2)/(2π)^{2n})·d_F^{3/2}·h_F·φ(𝔇)ψ(𝔐)` (`[V, 26.1.12]`), where
`φ(𝔇) = ∏_{𝔭|𝔇}(N𝔭 − 1)` and `ψ(𝔐) = N𝔐∏_{𝔭|𝔐}(1 + 1/N𝔭)`. Over `ℚ` this is 5.2. The analytic
inputs are the Dedekind zeta value `ζ_F(2)` and the residue formula; the proof route is the zeta
function of the order (`[V, 26.4–26.6]`). *Needs:* 5.1, 3.10, 2.4; the Dedekind zeta
function of Mathlib (`dedekindZeta`) and its Euler product.

### 5.4 Level change

Prove `mass(Cls O) = [O'^×_𝔭 : O^×_𝔭]·mass(Cls O')` when `O ⊆ O'` differ only at `𝔭`
(`[V, 26.6.4]`), with `[O'^×_𝔭 : O^×_𝔭] = [O'_𝔭 : O_𝔭]λ(O,𝔭)·(1, (1 − 1/q)^{-1})` according as `𝔭`
is split or ramified in `B`, for `O'` maximal (`[V, 26.6.7]`). *Needs:* 5.1, 2.4.

### 5.5 Class number one

The maximal-order equivalence is `classNumber_eq_one_iff`.

Prove: a maximal order in a definite `B/ℚ` has `# Cls O = 1` iff `D ∈ {2, 3, 5, 7, 13}`
(`[V, 25.4.1]`, from 5.2 and `w_J ≤ 12`). State Brzezinski's theorem that exactly `24` isomorphism
classes of definite orders over `ℤ` have class number one (`[V, 25.4.3]`) as a mathematical classification. Develop the finite classification of the local order types
compatible with the mass bound φ(N)/12 ≤ 1 ([V, 25.4.5]); use the mass and optimal-embedding
contributions to determine which global types have one ideal class. The conclusion counts
isomorphism classes of orders, not just reduced discriminants. *Needs:* 2.5–2.6, 5.2, 6.4–6.6 for the classification route.

### 5.6 Worked masses

Prove the values: `D = 2`: one class, `w = 12`; `D = 3`: one class, `w = 6`; `D = 5`: `w = 3`;
`D = 7`: `w = 2`; `D = 11`: two classes with `w = 2, 3`, mass `5/6`; `D = 13`: one class, `w = 1`;
`D = 37`: three classes with `w = 1`, mass `3`; the Eichler order of level `3` in `D = 2`: one
class with `w = 3`, mass `φ(2)ψ(3)/12 = 1/3`. *Needs:* 5.2.

### Examples

Hurwitz has mass 1/12; D = 11 has mass 5/6; level 7 in D = 2 has mass 2/3.

### Dependencies

Layers 2 and 3; AdelicAlgebraicGroups §5.3. The class-number classification route additionally uses §6.6, which uses the mass formula but not §5.5.

## Layer 6: optimal embeddings, embedding numbers, class and type number formulas

`K ⊇ F` is a quadratic field extension with `K ⊆ B` embedded (every embedding is conjugate to
this one by Skolem–Noether, Tau Ceti `CentralSimple/SkolemNoether`), and `S ⊆ K` a quadratic
`R`-order (for `F = ℚ`, `S : NumberFieldOrder K`; the maximal order `ℤ_K` as a `NumberFieldOrder`
is Tau Ceti's `maximalNumberFieldOrder K`, `NumberTheory/NumberField/Global/Orders/Basic.lean` at the
pin, and the statements below take `S = maximalNumberFieldOrder K`, equivalently
`S.toSubalgebra = integralClosure ℤ K`, where the maximal order is meant).

### 6.1 Optimal embeddings

The signature predicate `IsOptimalEmbedding` defines the subtype `OptimalEmbedding`; `EmbRel` takes conjugacy classes and `embeddingNumber` counts them.

Define `Emb(S,O)`, `E_{S,O} = {β ∈ B^× : β^{-1}Kβ ∩ O = β^{-1}Sβ}`, the bijection
`K^×\E ≃ Emb(S,O)`, `β ↦ (α ↦ β^{-1}αβ)` (`[V, 30.3.8]`), and for `O¹ ≤ Γ ≤ N_{B^×}(O)` the right
action of `Γ` and `Emb(S,O;Γ) ≃ K^×\E/Γ` (`[V, 30.3.13]`). Prove optimality is local
(`[V, 30.3.6]`) and the comparison `m(S,O;Γ) = m(S,O;O^×)·[nrd(O^×) : nrd(Γ)nrd(S^×)]` for
`O¹ ≤ Γ ≤ O^×` (`[V, 30.3.14]`); over `ℚ` with `S` imaginary quadratic and `O` having a unit of
norm `−1` (4.4), `m(S,O;O¹) = 2·m(S,O;O^×)`. The classes of optimal embeddings `O_c ↪ R₀(N)`
modulo `Γ₀(N)` of the
[Gross–Zagier formulas and arithmetic heights roadmap](../GrossZagierAndArithmeticHeights/README.md)
§0a.3 (`cmOptimalEmbedding`) are the instance `B = ℍ[ℚ,1,1] ≅ M₂(ℚ)` (Tau Ceti's
`oneEquivMatrix`), `O = R₀(N)`, `S = O_c`, `Γ = O¹ = Γ₀(N)` of the oriented refinement of Emb(S,O;Γ): retain the selected complex CM type and gcd(c,N) = 1 for the comparison of the full orders at both endpoints. Forgetting the CM type is not this comparison. *Needs:* 1.1,
1.2; GNF Layer 11.

### 6.2 Finiteness and the local embedding numbers of maximal orders

Prove `m(S,O;Γ) < ∞` (`[V, 30.5.5]`). For R a complete DVR, m(S, M₂(R); GL₂(R)) = 1 for quadratic R-orders S. For the following division embedding counts assume in addition that the residue field is finite; for B
division with valuation ring `O` and `S` integrally closed, `m(S,O;N_{B^×}(O)) = 1` and
`m(S,O;O^×) = 1 − (K | 𝔭)`, where `(K|𝔭) ∈ {1, 0, −1}` is split, ramified, inert
(`[V, 30.5.3]`); for `S` not maximal in a division `B`, `Emb(S,O) = ∅`. *Needs:* 6.1, 1.7.

### 6.3 Local embedding numbers of Eichler orders

For `O = O_0(𝔭^e)`, `e ≥ 1`, with `S = R[γ]`, `f_γ(x) = x² − t_γ x + n_γ`, `d_γ = t_γ² − 4n_γ`:
every optimal embedding is `O^×`-conjugate to a normalized one or its `ϖ`-conjugate
(`[V, 30.6.3, 30.6.8–30.6.9]`), and with `M(s) = {x ∈ R/𝔭^s : f_γ(x) ≡ 0}`,
`m(S,O;O^×) = #M(e)` if `d_γ ∈ R^×` and `#M(e) + #img(M(e+1) → R/𝔭^e)` otherwise
(`[V, 30.6.12]`). Consequences: for `e = 1` and `S` maximal, `m = 1 + (K|𝔭)` (`[V, 30.6.16]`); for
`q` odd, `f = ord_𝔭 d_γ`: `m = 1 + (K|𝔭)` if `f = 0`, and `m = 2q^{(e−1)/2}` or `q^{e/2−1}(q+1)`
according to the parity of `e` when `e < f` (`[V, 30.6.17]`); over `ℤ_2`,
`m(ℤ_2[i], O_0(2^e); O^×) = 1` for `e ≤ 1` and `0` for `e ≥ 2` (`[V, 30.6.14]`). *Needs:*
6.1, 1.9.

### 6.4 The trace formula

Prove `∑_{[I] ∈ Cls O} m(S, O_L(I); O_L(I)^×) = h(S)·m(Ŝ, Ô; Ô^×)` with `h(S) = # Pic S` and the
adelic embedding number a finite product of local ones (`[V, 30.4.7]`, `[V, 30.7.1]`), hence
`∑_{[I]} m(S,O_L(I);O_L(I)^×) = h(S)∏_{𝔭|𝔑} m(S_𝔭,O_𝔭;O_𝔭^×)` (`[V, 30.7.3]`); for `O` Eichler of
squarefree level `𝔐` and `S` maximal this is `h(S)∏_{𝔭|𝔇}(1 − (K|𝔭))∏_{𝔭|𝔐}(1 + (K|𝔭))`
(`[V, 30.7.4]`). Existence corollary: if `Emb(S_𝔭,O_𝔭) ≠ ∅` for all `𝔭` then some order in the
genus admits an optimal embedding of `S` (`[V, 30.4.18]`). For `F = ℚ`, `h(S)` is
`Nat.card (Pic S)` for Tau Ceti's `NumberFieldOrder`. *Needs:* 6.1–6.3, 3.4, 3.5; GNF
Layer 11 `Pic`.

### 6.5 Embedding numbers over `ℚ` for `ℤ[i]` and `ℤ[ω]`

The signature function `kroneckerProduct` incorporates the conductor-square obstruction; `embeddingNumber_gaussian` and `embeddingNumber_eisenstein` state the indefinite one-class formulas.

For `O` Eichler of level `M` in `B/ℚ` of discriminant `D` (`B` definite or indefinite), with
`ω = (−1 + √−3)/2`, prove the two sums
`∑_{[I]} m(ℤ[i], O_L(I); O_L(I)^×) = ∏_{p|D}(1 − (−4|p))∏_{p|M}(1 + (−4|p))` if `4 ∤ M` and `0` if
`4 | M`, and `∑_{[I]} m(ℤ[ω], O_L(I); O_L(I)^×) = ∏_{p|D}(1 − (−3|p))∏_{p|M}(1 + (−3|p))` if
`9 ∤ M` and `0` if `9 | M` (`[V, 30.7.7]`, with `h(ℤ[i]) = h(ℤ[ω]) = 1`), where `(d|p)` is the
Kronecker symbol: Mathlib's `jacobiSym d p` for `p` odd, and at `p = 2` the value `0, 1, −1`
according as `d` is even, `d ≡ ±1`, `d ≡ ±3 (mod 8)`, so `(−4|2) = 0`, `(−3|2) = −1`, `(−3|3) = 0`
(Mathlib's `jacobiSym d 2` is `legendreSym 2 d ∈ {0, 1}` and is not the symbol at `2`;
`kroneckerSym` in `Suggested.lean` is). When `B` is indefinite the sum has one term
(4.3) and these are `m(ℤ[i],O;O^×)` and `m(ℤ[ω],O;O^×)` (`[V, 39.4.20]`). *Needs:* 6.4,
4.3; completed NFA Layer 1 for the splitting dictionary of `ℚ(i)` and `ℚ(√−3)`.

### 6.6 The Eichler class number formula

The rational acceptance theorem is `classNumber_eq_mass_add`.

For `B` definite over `ℚ` and `O` Eichler of level `M`, `N = DM`:
`# Cls O = φ(D)ψ(M)/12 + ε₂/4 + ε₃/3`, with `ε₂ = ∏_{p|D}(1 − (−4|p))∏_{p|M}(1 + (−4|p))` if
`4 ∤ N` and `0` otherwise, `ε₃ = ∏_{p|D}(1 − (−3|p))∏_{p|M}(1 + (−3|p))` if `9 ∤ N` and `0`
otherwise (`[V, 30.1.5]`). In general over a totally real `F`,
`# Cls O = mass(Cls O) + (1/2)∑_{q ≥ 2}(1 − 1/q)∑_{[S^×:R^×] = q} h(S)m(Ŝ,Ô;Ô^×)`
(`[V, 30.8.6]`), the inner sum over the quadratic `R`-orders `S` with unit index `q`; the
key lemma is the count of `O^×/R^×` by its maximal cyclic subgroups,
`1 − 1/w_O = (1/2)∑_q(1 − 1/q)∑_{[S^×:R^×]=q} m(S,O;O^×)` (`[V, 30.8.2, 30.8.5]`). *Needs:*
5.2, 5.3, 6.4, 6.5.

### 6.7 Worked class numbers

Check 6.6 against 5.6: `D = 2`: `1/12 + 1/4 + 2/3 = 1`; `D = 11`: `5/6 + 2/4 + 2/3 = 2`; `D = 37`:
`3 + 0 + 0 = 3`; `(D,M) = (2,3)`: `1/3 + 0 + 2/3 = 1`. *Needs:* 6.6.

### 6.8 The type number

The acceptance theorem is `typeNumber_prime` for p ≥ 5, with the quadratic field degree explicitly equal to two.

Define `t(O) = # Typ O` and prove it is `# Cls O` divided out by the action of `Pic_R(O)` on
`Cls O` through two-sided ideals (`[V, 30.9.1]`). Prove Deuring's formula: for `B/ℚ` definite of
prime discriminant `p` and `O` maximal, `t = 1` for `p ∈ {2,3}` and
`t = (1/2)# Cls O + (1/4)[h(−p)] + (1/4)h(−4p)` for `p ≥ 5`, with `[h(−p)] = h(−p)` for
`p ≡ 3 (mod 4)` and `0` otherwise (`[V, 30.9.2]`). Checks: `p = 11`: `1 + 1/4 + 3/4 = 2`;
`p = 37`: `3/2 + 0 + 1/2 = 2`. *Needs:* 3.3, 3.6, 6.6.

### Examples

For D = 11 the class number is 5/6+2/4+2/3 = 2 and the type number is 1+1/4+3/4 = 2.

### Dependencies

Layers 1, 3 and 5; Layer 4 for indefinite specializations; GlobalNumberFields Layer 11 and its pinned quadratic orders.

## Layer 7: Brandt matrices

`B` is totally definite over `F`, `O` an order with `discrd O = 𝔑` and class number `h`, with
representatives `I_1, …, I_h` and left orders `O_i = O_L(I_i)` (`[V, 41.2.1]`).

### 7.1 Definition

Define T(𝔫) on the free module of classes and A(𝔫) on functions as in Conventions; prove
that A(𝔫) has matrix T(𝔫)ᵗ in the characteristic-function basis and that `T(𝔫)` does not depend on the
representatives (`[V, 41.2.5]`). Prove the element count
`T(𝔫)_{ij} = #{α ∈ I_jI_i^{-1} : nrd(α)R = 𝔫_{ij}}/O_i^×` with `𝔫_{ij} = 𝔫·nrd(I_j)/nrd(I_i)`, equal to
`(1/w_i)#{α : nrd(α)R = 𝔫_{ij}}/R^×` (`[V, 41.2.7]`). Define the `𝔫`-Brandt graph and prove
`T(𝔫)` is its adjacency matrix (`[V, 41.2.12]`). *Needs:* 3.2, 3.5, 3.10.

**Checks.**

- `D = 2`: `T(3) = (4)`, `T(5) = (6)`.
- `D = 11`, classes ordered by `w = 2, 3`: `T(2) = [[1,3],[2,0]]`, `T(3) = [[2,3],[2,1]]`,
  `T(5) = [[4,3],[2,3]]`; Sage's `BrandtModule(11).hecke_matrix(p)` returns the transposes.
- `D = 37`: `T(2) = [[1,1,1],[1,0,2],[1,2,0]]`.
- (convention) Columns index the source class: the column sums of `T(p)` are `p + 1`, while the row
  sums of `T(2)` for `D = 11` are `4` and `2`.

### 7.2 Column sums and multiplicativity

Prove the column sums of `T(𝔫)` are constant, equal to `∑_{𝔡|𝔫} N𝔡` for `𝔫` coprime to `𝔑`, and
`T(𝔪𝔫) = T(𝔪)T(𝔫)` for coprime `𝔪, 𝔫` (`[V, 41.3.1]`); for `𝔭 ∤ 𝔑`,
`T(𝔭^r)T(𝔭^s) = ∑_{i ≤ min(r,s)} N𝔭^i T(𝔭^{r+s−2i})P(𝔭)^i` with `P(𝔭)` the permutation matrix of
`[I] ↦ [I𝔭]` (`[V, 41.3.6]`). *Needs:* 7.1, 3.10.

**Checks.**

- `D = 11`: the column sums of `T(2)`, `T(3)`, `T(5)` are `3`, `4`, `6`.
- `D = 11`: `T(2)T(3) = T(3)T(2) = [[8,6],[4,6]] = T(6)`, with column sums `12 = σ(6)` (Sage:
  `BrandtModule(11).hecke_matrix(6)` is its transpose `[[8,4],[6,6]]`).
- (reject) The row sums are not constant: `4` and `2` for `T(2)`, `D = 11`.

### 7.3 The Hecke algebra and its semisimplicity

Define `𝕋(O) ⊆ M_h(ℤ)` generated by the `T(𝔫)` with `𝔫` coprime to `𝔑`; prove it commutative
(`[V, 41.3.15]`); with the divisor pairing ⟨x,y⟩ = ∑ᵢ wᵢxᵢyᵢ prove T(𝔫)* = P(𝔫⁻¹)T(𝔫).
On functions use ⟨f,g⟩ = ∑ᵢ f(Iᵢ)g(Iᵢ)/wᵢ and the transpose identity for A(𝔫),
so `T(𝔫)` is normal and self-adjoint for `𝔫` narrowly principal, and `𝕋(O) ⊗ ℚ` is semisimple with
a common eigenbasis and real eigenvalues for narrowly principal `𝔫` (`[V, 41.4.3, 41.4.10]`).
*Needs:* 7.2.

**Checks.**

- For D = 11, T(2)δ₁ = (1,2) on divisors, while A(2)δ₁ = (1,3) on functions.
- With weights (2,3), the off-diagonal divisor pairings are 2·3 = 3·2 = 6; the function pairings are 3/3 = 2/2 = 1.
- In the Hurwitz one-class case w = 12; T(3) = A(3) = (4), but the divisor and function squared basis norms are 12 and 1/12.

### 7.4 The Eichler trace formula

Prove: `tr T(𝔫) = 0` unless `𝔫 = nR` is narrowly principal with `n ∈ F^×_{>0}`, and then
`tr T(𝔫) = (1/2)∑_{(u,t,S)} (h(S)/w_S)·m(Ŝ,Ô;Ô^×) + [𝔫 = c²R]·mass(Cls O)`, with `w_S = [S^× : R^×]`
and the sum over the finitely many triples `(u, t, S)`: `u` in a set of representatives of
`R^×_{>0}/R^{×2}`, `t ∈ R` with `t² − 4un ∈ F^×_{<0}`, and `S` ranging over **all** quadratic
`R`-orders `S ⊇ R[x]/(x² − tx + un)` (`[V, 41.5.2]`). Over `ℚ`, for `O` maximal of discriminant `D`
and `n` coprime to `D`: `tr T(n) = ∑_{t² < 4n} h_D(t² − 4n) + [n = □]φ(D)/12`, where for a
discriminant `d' = d_K f² < 0` (`d_K` fundamental)
`h_D(d') = ∑_{g | f, gcd(g, D) = 1} (h(d_K g²)/w(d_K g²))·∏_{p|D}(1 − (d_K|p))`,
with `h(d)` the class number and `w(d) = #S_d^×` the number of units (`4`, `6` or `2`) of the
quadratic order `S_d` of discriminant `d`; the restriction `gcd(g, D) = 1` is the local embedding
number `0` of an order not maximal at a prime of `D` (6.2), so the sum runs over the `S ⊇ ℤ[γ]` with
`m(Ŝ,Ô;Ô^×) ≠ 0` (`[V, 41.5.8–41.5.10]`). The shorthand `h_D(d_K f²) = h_D(d_K)` printed in
`[V, 41.1.13]` drops the orders of conductor prime to `D` and is not this formula: for `D = 2`,
`n = 9` it gives `10`, while `tr T(9) = σ(9) = 13`. Checks for the Hurwitz order: `tr T(3) = 4`
from `t = 0, ±1, ±2, ±3` contributing `1/3, 2, 1, 2/3` (at `t = 0, ±3` the order `ℤ[√−3]` is not
maximal at `2 | D` and only `ℤ[ω]` counts, with weight `1/6`); `tr T(9) = 13` with `t = 0`
contributing `(1 − (−4|2))·(h(−36)/2 + h(−4)/4) = 5/4` and `t = ±3` contributing
`(1 − (−3|2))·(h(−27)/2 + h(−3)/6) = 4/3` each. *Needs:* 7.1, 6.2, 6.4, 5.2.

**Checks.**

- Hurwitz order, `n = 3`: `tr T(3) = 4`, from `t = 0, ±1, ±2, ±3` contributing `1/3, 2, 1, 2/3`.
- Hurwitz order, `n = 9`: `tr T(9) = 13 = σ(9)`, with `t = 0` contributing `5/4` and `t = ±3`
  contributing `4/3` each.
- (reject) The shorthand `h_D(d_K f²) = h_D(d_K)` gives `10` for `D = 2`, `n = 9`, not `13`.
- (boundary) The mass term `φ(2)/12 = 1/12` enters for `n = 9` and not for `n = 3`.

### 7.5 The interface to quaternionic modular forms and to the LMFDB

Under 3.4's class-set bijection, identify A(𝔫) with the sum of the Hecke correspondences
having the local elementary-divisor types of proper subideals of norm 𝔫. A norm ideal alone
does not specify one double coset. With U = Ôˣ, a right-coset correspondence UηU acts by
f(x) ↦ ∑ f(xηᵢ); quaternionic modular forms §3.1 uses the inverse convention, so this is
its T(η⁻¹). At a split prime outside discrd(O), the type diag(ϖ,1) gives A(𝔭).
The integral divisor matrix is T(𝔭); compare its transpose with the function operator of
Hilbert modular varieties R18.5.17a ([V, 41.2.3–41.2.7], pp. 751–752).

For a totally real field F and a cuspidal representation π of parallel weight two, choose a
totally definite quaternion algebra B such that πᵥ is discrete series at each finite ramified
place. Global Jacquet–Langlands identifies π's transfer and its invariant vectors at a compact
open U = ∏ Uᵥ, with the local invariant spaces specified at every place, including ramified
places (GL₂ transfer R17.3.1, R17.3.3, R17.3.9; Dembélé–Voight, arXiv:1010.5727v2, Theorem 3.9 and Remark 3.10, pp. 11–12).
For squarefree conductor 𝔑 and squarefree discriminant 𝔇 dividing 𝔑, with the required parity
of all ramified places, the Eichler level is 𝔑/𝔇 and is coprime to 𝔇.
For general conductor exponents retain the transferred local representation and Uᵥ-invariants;
the Eichler-order model applies precisely to its Ôᵥˣ-invariants, and is not asserted to realize
every ramified local type. Identify the cuspidal subspace as the orthogonal complement of
all forms factoring through reduced norm, including nontrivial norm characters.
*Needs:* 7.1, 3.4; QuaternionicModularForms §§0.3, 3.1; HilbertModularVarietiesAndShimuraCurves R18.5.17a; GL2AutomorphicRepresentationsAndTransfer R17.3.

**Checks.**

- In the Hurwitz case η = 3 is central, so its single double coset acts by 1; T(9) = (13).
- At 3, the primitive type diag(9,1) contributes 12 and the central type diag(3,3) contributes 1, giving 12 + 1 = 13. At norm 3 there is one type with 4 right cosets.
- A rational weight-two newform of level 11 transfers to D = 11 and Eichler level 1, never level 11: gcd(11,1) = 1, while gcd(11,11) = 11. The class-function space has dimension two and its cuspidal complement dimension one.

### 7.6 Worked Brandt matrices

Prove: `D = 2`: `T(3) = (4)`, `T(5) = (6)`; `D = 11`: `T(2) = [[1,3],[2,0]]`, `T(3) = [[2,3],[2,1]]`,
`T(5) = [[4,3],[2,3]]` in the ordering of classes by `w = 2, 3` (so `w_1 = 2`, `w_2 = 3`, the
columns sum to `p + 1`, and `w_i T_{ij} = w_j T_{ji}` as 7.3 requires; the transposes, with row
sums `p + 1`, are the matrices Sage's `BrandtModule(11).hecke_matrix(p)` returns); `D = 37`:
`T(2) = [[1,1,1],[1,0,2],[1,2,0]]`; `(D,M) = (2,3)`: `T(5) = (6)`, `T(7) = (8)`. *Needs:*
7.1, 5.6.

### 7.7 Theta series of ideals

For `B/ℚ` definite, `O` Eichler of level `M`, and invertible right ideals `I_i, I_j`, the lattice
`L_{ij} = I_jI_i^{-1}` with the quadratic form `nrd/nrd(L_{ij})` is an even positive-definite
lattice of rank `4` with `det = (DM)²` and level `DM`, and
`∑_{n ≥ 0} (2w_i)^{-1}·r_{L_{ij}}(2n) q^n = (1/2w_i)Θ_{L_{ij}}(τ)` has `n`-th coefficient `T(n)_{ij}`
for `n ≥ 1` and constant term `1/(2w_i)`; by theta series Layer 7 (`Θ_L ∈ M_k(Γ₀(N),χ_L)`) it is a
modular form of weight `2` on `Γ₀(DM)` with trivial character. *Needs:* 7.1, 3.1; theta
series Layer 7.

### Examples

For D = 11, T(2) = [[1,3],[2,0]] on divisors and its transpose acts on functions.

### Dependencies

Layers 3, 5 and 6; QuaternionicModularForms §3.1; GL2AutomorphicRepresentationsAndTransfer R17.3; HilbertModularVarietiesAndShimuraCurves R18.5.17a; ThetaSeries Layer 7.

## Layer 8: Shimura curves `X_0(D;N)` over `ℚ`

`B = ℍ[ℚ,a,b]` is indefinite of discriminant `D > 1`, `O` an Eichler order of level `N`, and
`ι_∞ : B → M₂(ℝ)` a real splitting.

### 8.1 The arithmetic Fuchsian group

Prove a real splitting exists (`B ⊗ ℝ ≃ M₂(ℝ)`, from IsRamifiedAtReal = false and
`forall_isUnit_or_nonempty_algEquiv_matrix` over `ℝ`), that `det(ι_∞ x) = nrd x`, and define
`Γ¹(O) ≤ PSL₂(ℝ)` as the image of `O¹`. Its discreteness, finite covolume and cocompactness are
TeichmullerGeometry §9.1 with k = ℚ and B division; this milestone instantiates them
and proves the `ℚ`-specific facts: `Γ¹(O) ≅ O¹/{±1}`, and `Γ¹(O')` has finite index in `Γ¹(O)` for
`O' ⊆ O`. *Needs:* 0.5, 1.2; TeichmullerGeometry §9.1; Tau Ceti `Fuchsian/Covolume`.

**Checks.**

- (reject) `ℍ[ℚ,-1,-1]` is definite and has no real splitting (9.10).
- `ℍ[ℚ,3,-1]`: `i ↦ [[√3,0],[0,−√3]]`, `j ↦ [[0,1],[−1,0]]` is a real splitting, with
  `ι(i)² = 3`, `ι(j)² = −1`, `ι(j)ι(i) = −ι(i)ι(j)`, `det ι(i) = −3 = nrd i` and
  `det ι(j) = 1 = nrd j`.
- (boundary) For `D = 1` (`ℍ[ℚ,1,7]`, `ℍ[ℚ,5,5]`) the group of a maximal order is conjugate to
  `PSL₂(ℤ)`, which has cusps: the compactness clause needs `D > 1`.
- `−1 ∈ O¹` maps to the identity of `PSL₂(ℝ)`, so `Γ¹(O) ≅ O¹/{±1}` and not `O¹`.

### 8.2 Index and area

The acceptance theorem `relindex_normOne_eq_psi` states the norm-one subgroup index with the smaller subgroup as the first relative-index argument.

Prove `[Γ¹(O(1)) : Γ¹_0(D;N)] = ψ(N)` for a maximal `O(1) ⊇ O`, from 4.3 (surjectivity of
`O(1)¹ → (O(1)/NO(1))¹`) and the local index of 1.10, and prove the rational maximal-order covolume area(Γ¹(O(1))\ℍ) = (π/3)φ(D).
A route uses τ(SL₁(B)) = 1 from EndoscopicTransferAndUnitaryTraceComparison §6.2,
with the Tamagawa normalization of AdelicAlgebraicGroups §2.4. Prove the arithmetic
measure comparison here: for a maximal order, the finite norm-one volume is
ζ(2)⁻¹φ(D)⁻¹, and the real quotient volume is (π/2) times hyperbolic area, with density
y⁻² dx dy; the factor 1/2 accounts for {±1} ([V, (39.2.6), Lemma 39.2.14, (39.3.4)], pp. 720–722).
The product of the two volumes is one by strong approximation, hence area = (2/π)ζ(2)φ(D)
= (π/3)φ(D). Finite-index scaling gives area(X₀(D;N)) = (π/3)φ(D)ψ(N)
([V, 39.1.13]). *Needs:* 8.1, 1.10, 4.3; FuchsianOrbifolds Layer 1 covolume scaling;
ClassicalArithmeticCompletion §7.60 local norm images; AdelicAlgebraicGroups §§2.4, 4.2;
EndoscopicTransferAndUnitaryTraceComparison §6.2; Mathlib `riemannZeta_two` in `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean` for ζ(2) = π²/6.

**Checks.**

- `area(X_0(6;1)) = 2π/3`.
- `area(X_0(6;5)) = (π/3)·2·6 = 4π`, with `ψ(5) = 6`.
- (reject) For `B` definite the index formula fails: in `ℍ[ℚ,-1,-1]` the Eichler orders of level
  `7` have `[O(1)¹ : O¹] = 4 ≠ ψ(7) = 8`.

### 8.3 Elliptic points are embedding numbers

Prove that a point `τ ∈ ℍ` with stabilizer of order `q ≥ 2` in `Γ¹(O)` gives a maximal finite
cyclic subgroup `⟨γ⟩ ≤ O¹` of order `2q`, that `ℚ(γ) = ℚ(ζ_{2q})` is imaginary quadratic (so
`q ∈ {2, 3}` over `ℚ`), and that `γ ↦ (S = ℚ(γ) ∩ O, φ_γ)` induces a two-to-one map from the
`O¹`-classes of optimal embeddings with `#S^×_{tors} = 2q` onto the elliptic orbits of order `q`
(`[V, 39.4.3–39.4.4]`). Hence `ν_q(Γ¹(O)) = (1/2)∑_S m(S,O;O¹)` and, by 6.1 and 4.4,
`ν₂(Γ¹(O)) = m(ℤ[i],O;O^×)`, `ν₃(Γ¹(O)) = m(ℤ[ω],O;O^×)`, `ν_q = 0` for `q ∉ {2,3}`; with 6.5 these
are the LMFDB's `nu2`, `nu3` of `X(D,M;1)`. *Needs:* 8.1, 6.1, 6.5, 4.4; Tau Ceti
`Fuchsian/Stabilizer`.

**Checks.**

- `X_0(6;1)`: `ν₂ = ν₃ = 2`.
- `X_0(10;1)`: `ν₂ = 0`, `ν₃ = 4`.
- `X_0(6;5)`: `ν₂ = 4`, `ν₃ = 0`; X₀(15;4): ν₂ = ν₃ = 0 and genus 5; (D,N) = (6,4) is inadmissible since gcd(6,4) = 2.
- (reject) `ν_q(Γ¹(O)) = 0` for `q ∉ {2, 3}`: stabilizers of order `4` and `6` occur only in larger
  groups (8.7).

### 8.4 The genus formula

Let `X_0(D;N) = Γ¹_0(D;N)\ℍ`, a compact Riemann surface (Tau Ceti `Fuchsian/CoarseQuotient`,
equal to its compactification since there are no cusps). Prove, from Fuchsian orbifolds' orbifold
Euler characteristic formula (Layer 4.5, 5.6) with 8.2 and 8.3,
`g(X_0(D;N)) = 1 + φ(D)ψ(N)/12 − ν₂/4 − ν₃/3` (`[V, 39.4.20]`). *Needs:* 8.2, 8.3;
FO Layers 1, 4, 5.

**Checks.**

- `g(X_0(6;1)) = 0` (`ν₂ = ν₃ = 2`), `g(X_0(10;1)) = 0` (`ν₂ = 0`, `ν₃ = 4`).
- `g(X_0(14;1)) = 1`, `g(X_0(26;1)) = 2`, `g(X_0(35;1)) = 3`.
- `g(X_0(6;5)) = 1` (`ν₂ = 4`), `g(X_0(6;11)) = 3`.

### 8.5 Atkin–Lehner involutions

For `m ∥ DN` let `w_m ∈ N^+_{B^×}(O)` have norm `m` (4.6). Prove `w_m` normalizes `Γ¹(O)`, acts on
`X_0(D;N)` as an involution, that `m ↦ w_m` is an isomorphism `(ℤ/2)^{ω(DN)} → N^+/(ℚ^×O¹) =: W`,
and define `Γ⁺(O) = ι_∞(N^+)ℝ^×/ℝ^×`, so `Γ⁺(O)/Γ¹(O) ≅ W` and `X^*(D;N) = Γ⁺(O)\ℍ = X_0(D;N)/W`.
For a subgroup `W' ≤ W`, define `Γ_{W'}` and `X_0(D;N)/W'`. *Needs:* 4.5, 4.6, 8.1.

**Checks.**

- `D = 6`, `N = 1`: `Γ⁺(O)/Γ¹(O) ≅ (ℤ/2)²`, of order `4 = 2^ω(6)`.
- `X^*(6;1)` has genus `0`, and so does each `X_0(6;1)/⟨w_m⟩` (8.6).
- (reject) The normalizer contains a unit of norm `−1` (4.4), whose image has negative
  determinant; `Γ⁺(O)` is built from the positive-norm part only.

### 8.6 Fixed points of Atkin–Lehner involutions

Prove that the fixed points of `w_m` on `X_0(D;N)` are the images of the fixed points in `ℍ` of
the elliptic elements `γ ∈ ℚ^× w_m O¹` (those with `ℚ(γ)` imaginary quadratic). Scale such a `γ`
into `O` with `nrd γ = m`, `trd γ = t`, `t² < 4m`; at a division prime dividing m its trace is divisible by p, and at a level prime pᵉ ∥ m the local coset representative [[0,1],[pᵉ,0]] times a unit of O₀(pᵉ) has trace divisible by pᵉ, so `m | t`,
so `t = 0` (`γ² = −m`), or `m = 2`, `t = ±2` (`γ = 1 ± i'`, `i'² = −1`), or `m = 3`, `t = ±3`
(`γ = 1 + ζ`, `ζ` a primitive sixth root of unity, `ℚ(γ) = ℚ(√−3)`). Prove that
`γ ↦ (S = ℚ(γ) ∩ O, φ_γ)` is two-to-one, exactly as in 8.3 (`φ_γ` and its conjugate `φ̄_γ` fix the
same point and are never `O¹`-conjugate for `D > 1`), from the `O¹`-classes of optimal embeddings
`φ` with `φ(K^×) ∩ ℚ^× w_m O¹ ≠ ∅` onto `Fix(w_m)`. For `N = 1` every `γ ∈ O` with `nrd γ = m ∥ D`
normalizes `O` (`Oγ` is two-sided: at `p | m` every one-sided ideal of the local division order
is two-sided, at `p ∤ m` `γ_p` is a unit), so with 6.1 and 4.4 (Ogg's formula)
`# Fix(w_m) = ∑_S m(S,O;O^×)`, the sum over `S = ℤ[√−m]`, `S = ℤ[(1+√−m)/2]` when `m ≡ 3 (mod 4)`,
and additionally `S = ℤ[i]` when `m = 2` (for `m = 3` the order `ℤ[ω] = ℤ[(1+√−3)/2]` is the second
order already), where by 6.4 and `# Cls O = 1` each `m(S,O;O^×) = h(S)∏_{p|D} m_p(S)` with
`m_p(S) = 1 − (K|p)` if `S_p` is the maximal order of `K_p` and `m_p(S) = 0` otherwise (6.2). For
squarefree `N` the same sum holds with the factors of 6.3 at `p | N` (an element `γ ∈ O` with
`γ² = −m` and `p | m`, `p ∥ N`, lies in `rad O_p`, hence normalizes); when `p² | N` the embeddings
whose image does not meet `ℚ^× w_m O¹` must be excluded, and the theorem is the count over that
subset. By Riemann–Hurwitz (FO Layer 5.3)
`g(X_0(D;N)/⟨w_m⟩) = (1/2)(g(X_0(D;N)) + 1 − # Fix(w_m)/2)`; iterate for `W'`. Checks on
`X_0(6;1)`: `# Fix(w_2) = m(ℤ[i],O;O^×) = (1 − (−4|2))(1 − (−4|3)) = 2` and `ℤ[√−2]` contributes
`h(−8)(1 − (−8|3)) = 0`; `# Fix(w_3) = m(ℤ[ω],O;O^×) = (1 − (−3|2))(1 − (−3|3)) = 2` and `ℤ[√−3]`,
not maximal at `2 | D`, contributes `0`; `# Fix(w_6) = h(−24) = 2`; so each quotient
`X_0(6;1)/⟨w_m⟩` has genus `(1/2)(0 + 1 − 1) = 0`, and `−2 = 4(2g^* − 2) + 6` gives
`g(X^*(6;1)) = 0`. *Needs:* 8.3–8.5, 6.1–6.4.

### 8.7 Elliptic points of `Γ⁺` and of intermediate groups

For `Γ¹(O) ≤ Γ' ≤ Γ⁺(O)`, prove that the stabilizer orders of `Γ'` lie in `{2, 3, 4, 6}`
(an element of `N^+` with `γ² ∈ ℚ` has order `2` in `PSL₂(ℝ)`; `1 + i`, `1 + ζ₆` have orders `4`
and `6`), and compute `ν_q(Γ')` from the embedding numbers of the orders `ℤ[√−m]`,
`ℤ[(1+√−m)/2]`, `ℤ[i]`, `ℤ[ω]` through the orbit–stabilizer relation with `Γ¹(O)` (the elliptic
ramification indices of Tau Ceti `Fuchsian/Elliptic/Ramification`). *Needs:* 8.3, 8.5, 8.6.

### 8.8 The curves as canonical models

Record the comparison: the complex points of Hilbert modular varieties R18.1.3's canonical curve
`Sh_U(G_B, X_B)` for `U = Ô^×` are `B^×_{>0}\(ℍ × B̂^×)/Ô^×`, which by 4.3 (`B̂^× = B^×Ô^×` up to
norms, class number one) is `Γ¹(O)\ℍ` when restricted to the component of the identity, with
`φ(1) = 1` component. This identifies `X_0(D;N)` with that curve's complex points; nothing about
the field of definition is proved here. *Needs:* 8.1, 4.3; R18.1.3.

### 8.9 CM points as embeddings

For a subgroup `Γ¹(O) ≤ Γ ≤ Γ⁺(O)` (the image of `O¹ ≤ Γ̃ ≤ N^+_{B^×}(O)`) and an imaginary
quadratic order `S` of discriminant `d < 0`, define the **CM points of discriminant `d`** on
`Γ\ℍ` as the image of the fixed points in `ℍ` of `ι_∞(φ(K^×))` for `φ ∈ Emb(S,O)`, and prove they
are in bijection with Emb(S,O;Γ̃) modulo precomposition by complex conjugation.
Since Γ has positive determinant, the two orientations are distinct embedding classes and
the geometric count is m(S,O;Γ̃)/2 ([V, 39.4.3–39.4.13], pp. 723–725).
Prove Emb(S,O) is nonempty iff there are optimal local embeddings at every finite prime:
at p dividing D the field must not split and Sₚ must be maximal (6.2), and at p dividing M
the full local conditions of 6.3 must hold (6.4's existence
corollary with `# Cls O = 1`). The elliptic points of 8.3 and 8.7 are the CM points of
discriminants `−4`, `−3`, `−4m`, `−m`. *Needs:* 6.1–6.4, 8.1, 8.5, 8.7.

**Checks.**

- At D = 6, M = 1 and S = ℤ[i], m(S,O;Oˣ) = 2 and m(S,O;O¹) = 4; there are 4/2 = 2 geometric CM points.
- The two embeddings i ↦ j and i ↦ −j fix the same upper-half-plane point, but have opposite orientations.
- ℤ[2i] is not maximal at the ramified prime 2 and has no optimal embedding into O₆, although ℚ(i) embeds and the level is one.

### Examples

X₀(6;1) has area 2π/3 and genus zero; X₀(15;4) has genus five.

### Dependencies

Layers 4 and 6; TeichmullerGeometry §9.1; EndoscopicTransferAndUnitaryTraceComparison §6.2; AdelicAlgebraicGroups §2.4; FuchsianOrbifolds Layers 1, 4 and 5; HilbertModularVarietiesAndShimuraCurves R18.1.

## Layer 9: polarized orders, `Aut_{±μ}(O)`, enhanced groups and the curves `X_H`

`B/ℚ` is indefinite with `D > 1`, `O` an Eichler order of level `M` (so `discrd O = DM`), and
`ι_∞` fixed. Everything in this layer is an invariant of the isomorphism class of `(O, μ, H)`.

### 9.1 Polarizations and their degree

Define `IsPolarization O μ` and `deg μ` as pinned. Prove: `deg μ` is well defined
(`nrd(μ)/discrd(O) ∈ ℚ_{>0}`); `deg(cμ) = deg μ` for `c ∈ ℚ^×` whenever cμ is also a polarization; `deg μ = 1` iff
`μ² ∈ −discrd(O)·(ℚ^×)²`; a polarization of degree `δ` exists iff `ℚ(√−δ·DM)` embeds in `B`, iff
no prime `p | D` splits in `ℚ(√−δDM)` (0.6, 6.1); in particular every maximal order has a
principal polarization μ ∈ O with μ² = −D (`[V, 43.6.6]`); for such a principal polarization, `μ ∈ D·O^♯` (`[V, 43.6.7]`). Prove that
for `δ | DM` squarefree, whenever a degree-`δ` polarization exists, it can be chosen in `O` with `μ² = −δ·DM` (the
LMFDB's stored `mu`, whose coordinates are in the stored basis of `O`; its stored `nrdmu` is the
reduced norm of the primitive element of `ℚ^×μ ∩ O`, so `6.2` has `mu² = −12` and `nrdmu = 3`).
Isomorphism of polarized orders is conjugation by `N_{B^×}(O)` carrying `μ ↦ μ'` (`[V, 43.6.5]`).
Prove that, with `μ` normalized by `μ² = −δ·DM`, the isomorphism classes of polarized orders
`(O, μ)` of degree `δ` with `O` fixed are the orbits of `N_{B^×}(O)/ℚ^×O^×` (4.5) on
`⊔_S Emb(S, O; O^×)`, `S` ranging over the orders of `ℚ(√−δDM)` containing `ℤ[√−δDM]`, the
stabilizer of a class being the image of `Aut_μ(O)` (9.2), so that their number is
`∑_S m(S,O;O^×)·#Aut_μ(O)/2^{ω(DM)}` when the class of `μ` is `Aut_μ(O)`'s only nontrivial
element, and `μ ↦ −μ` identifies two classes exactly in the twisted case (9.2); in the untwisted case the two sign classes remain distinct. The classes of
`(O, ±μ)` are the LMFDB's objects. *Needs:* 1.4, 1.11, 6.1, 6.4, 4.5; 0.6.

**Checks.**

- `μ = i + 3j ∈ ℍ[ℚ,3,-1]` has `μ² = −6`, and `trd(μx)` is `0, 6, −6, 0` on the basis
  `1, i, j, (1+i+j+k)/2` of `O_6`, so `μ` is a polarization of `O_6` with `nrd μ = 6 = discrd O_6`
  and degree `1` (checked in Sage).
- `D = 6`: degree `2` has `nrd μ = 3`, degree `6` has `nrd μ = 1`.
- (reject) The degree is the squarefree representative of the square class, not the quotient: for
  degree `2`, `nrd μ / discrd O = 1/2`.
- (invariance) `2μ = 2i + 6j` has `nrd = 24` and `24/6 = 4 ∈ (ℚ^×)²`, degree `1` again.

### 9.2 `Aut_μ(O)` and `Aut_{±μ}(O)`

In the signatures `scalars` is the central scalar subgroup, `ConjugatesPmMu` is the sign-preserving predicate and `autPmMu` its image subgroup. The theorem `card_autPmMu_general` allows the smaller groups; `card_autPmMu` additionally assumes that μ normalizes O. Both carry the division and indefiniteness hypotheses explicitly.

Define both as pinned, as subgroups of `N_{B^×}(O)/ℚ^×`. Prove: `Aut_μ(O) = (ℚ(μ)^× ∩ N_{B^×}(O))/ℚ^×`
is finite cyclic of order 1, 2, 3, 4 or 6. When μ normalizes O it contains [μ] of order two,
so its order is then 2, 4 or 6; it has order
`4` only if `ℚ(μ) ≅ ℚ(i)` (then generated by the class of an element `1 + i'` with `i'² = −1`
normalizing `O`), of order `6` only if `ℚ(μ) ≅ ℚ(√−3)` (generated by `1 + ζ₆`);
`[Aut_{±μ}(O) : Aut_μ(O)] ≤ 2`, with equality iff there is `χ ∈ N_{B^×}(O)` with `χμ = −μχ` (**twisting**), and then
Aut±μ(O) is the semidirect product of that cyclic subgroup with a group of order two
acting by inversion, hence has order 2, 4, 6, 8 or 12 in the twisted case. Without twisting
it equals Aut_μ(O). Thus in general its cardinality lies in {1,2,3,4,6,8,12}; under the
additional hypothesis μ ∈ N(O) it lies in {2,4,6,8,12}; `Aut_{±μ}(O)` is finite because
`N_{B^×}(O)/(ℚ^×O^×)` is finite (4.5) and `O^× ∩ ℚ(μ)` is finite. Prove the twisting criterion:
`χ` exists iff the binary form `−nrd` on the rank-two lattice `{v ∈ O : μv = −vμ}` (positive
definite: `B` is indefinite and `nrd μ > 0`, so `nrd` is negative definite on `μ^⊥`) represents a
Hall divisor `m ∥ DM`, `m > 1`, by an element of `N_{B^×}(O)`; a primitive normalizing `χ` has
`nrd χ = −m` for such an `m` (its right ideal is two-sided), `m = 1` is impossible (`χ² = 1` is a
zero divisor), and for `O` maximal every `χ ∈ O` with `nrd χ = −m`, `m ∥ D`, normalizes `O` (8.6).
*Needs:* 9.1, 4.5, 1.2.

**Checks.**

- In O₆, μ = i+4j has μ² = −13 and integral trace pairings (0,6,−8,−1); at the split maximal prime 13 its norm has odd valuation, so μ does not normalize O₆.
- The split boundary O = M₂(ℤ), μ = [[1,−6],[4,−1]] has μ² = −23I and Aut±μ(O) = 1. Centralizing units are ±I; an anticommuting unit would require (8b−11c)²+23c² = 16, which has no integer solution.
- For μ = i+3j in O₆, kμ = −μk and nrd(k) = −3, so conjugation by the normalizer k identifies μ and −μ: this is twisted.
- For the degree-one untwisted polarization at D = 14 in 9.3, the sign-reversing normalizer set is empty and the two sign classes remain distinct.

### 9.3 Worked automorphism groups

Prove, for the polarizations `μ` the LMFDB stores (one representative per `(D, δ)`; when 9.1
gives several classes the others are also computed, see the worked examples): for the maximal
order of discriminant `6`, `Aut_{±μ}(O) ≅ (ℤ/2)²` of order `4` for `deg μ = 1` (the twist `χ` is a
pure element of `O` orthogonal to `μ` with `nrd χ = −2` or `−3`), dihedral of order `12` for
`deg μ = 2` (`ℚ(μ) = ℚ(√−3)`), dihedral of order `8` for `deg μ = 6` (`ℚ(μ) = ℚ(i)`); for
discriminant `10`: order `4` for `deg μ ∈ {1, 2, 5}`; for discriminant `14`: order `2` (cyclic)
for `deg 1`, `4` for `deg 7`, `8` for `deg 14`; for discriminant `26`: `2`, `4`, `4` for
`deg 1, 2, 13`; for discriminant `35`: `2` for `deg 1`, `4` for `deg 5`; for the Eichler order of
level `5` in discriminant `6` with `deg μ = 1`: order `4`; for level `11`: order `2`. Prove the
twisting criterion in the form used for all of these: for `deg μ = 1` and `O` maximal,
`#Aut_{±μ}(O) = 4` iff the (negative definite) binary form `nrd` on `{v ∈ O : vμ = −μv}` represents
`−m` for some `m ∣ D`, `m > 1`, and `2` otherwise. *Needs:* 9.2.

**Checks.**

- `O_6`: `#Aut_{±μ}(O) = 4, 12, 8` for degree `1, 2, 6`.
- `D = 14`, degree `1`: order `2`, cyclic; `D = 26`, degrees `1, 2, 13`: orders `2, 4, 4`.
- Eichler orders in `D = 6`, degree `1`: order `4` at level `5`, `2` at level `11`.
- (reject) `D = 21`, degree `21`: order `4`, not `8`, since `1 + i'` does not normalize `O` (9.10).

### 9.4 The enhanced groups and the map to the normalizer

Define `G(O,μ) = O^× ⋊ Aut_{±μ}(O)` and `G(O,μ,N) = (O/NO)^× ⋊ Aut_{±μ}(O)` (Mathlib's
`SemidirectProduct`, `w` acting by conjugation, which is well defined because `w` normalizes `O`
and `NO`), the reduction `ρ_N : G(O,μ) → G(O,μ,N)`, and `π : G(O,μ) → N_{B^×}(O)/ℚ^×`,
`π(x, w) = x·w`. Prove `π` is a homomorphism; `K = ker π = {(x^{-1}, [x]) : x ∈ O^×, [x] ∈ Aut_{±μ}(O)}`
is finite cyclic of order `2`, `4` or `6`, containing `(−1, 1)`; π(G(O,μ)) = image(Oˣ)·Aut±μ(O) inside N(O)/ℚˣ;
the positive-norm part `G(O,μ)^+ = π^{-1}(N^+/ℚ^×)` has index `2` and surjects onto every coset of
`Aut_{±μ}(O)` (4.4 gives a unit of norm `−1`); and that `(x, w) ↦ (w, w^{-1}xw)` is an
isomorphism onto the group of pairs `(w, x)` with the product
`(w₁,x₁)(w₂,x₂) = (w₁w₂, w₂^{-1}x₁w₂x₂)` used by the LMFDB code. Prove the kernel of
`G(O,μ)^+ → PSL₂(ℝ)` is `K`, so `π(G(O,μ)^+) ≅ G(O,μ)^+/K ≤ PSL₂(ℝ)` and
Γ_G := π(G(O,μ)⁺) is the positive part of image(Oˣ)·Aut±μ(O) and contains Γ¹(O) with
index `[Aut_{±μ}(O) : image of K]`. *Needs:* 9.2, 4.4, 4.6; Mathlib `SemidirectProduct`.

**Checks.**

- `D = 6`, `O_6`, degree `1`: `K = {(±1, 1)}`, of order `2`.
- (boundary) At `N = 1`, `O/NO` is the zero ring, `(O/NO)^×` is trivial and
  `G(O,μ,1) = Aut_{±μ}(O)`, of order `4` for `D = 6`, degree `1`.
- G(O,μ)⁺ has index 2 since O has a unit of norm −1 (4.4).
- At D = 14, degree one, the automorphism image has order at most 2, whereas W has order 4.
- In O₆, 2+i has norm 1 and belongs to Γ_G, but conjugates i+3j to i+21j−12k, which is neither sign of i+3j.

### 9.5 Subgroups `H`, level, index, `Γ_H`, `X_H`

For `H ≤ G(O,μ,N)` define the level `N(H)`, the index `[G(O,μ,N) : H]`,
`Γ_H = π(ρ_N^{-1}(H) ∩ G(O,μ)^+) ≤ PSL₂(ℝ)`, and `X_H = Γ_H\ℍ`, as pinned. Prove: `Γ_H` is a
finite-index subgroup of `Γ_G`, hence cocompact Fuchsian; the Fuchsian index
`[Γ_G : Γ_H] = [G^+/K : (H^+K)/K]` where `H^+ = ρ_N^{-1}(H) ∩ G^+`; `X_H` depends only on the
`G(O,μ,N)`-conjugacy class of `H`; replacing `N` by a multiple and `H` by its preimage does not
change `Γ_H`; `H` and `H·ρ_N(K)` give the same curve, and `H` is coarse iff `H ⊇ ρ_N(K)`, with
gerbiness `#ρ_N(K)` and aut-gerbiness as pinned. Compute the three extreme subgroups: the
trivial subgroup of `G(O,μ,N)` has `Γ_H = Γ¹(O;N) := π(O¹ ∩ (1 + NO))`, the principal congruence
subgroup (and `H = 1` is not coarse for `N > 2`, since `ρ_N(−1, 1) ≠ 1`); the subgroup
`(O/NO)^× ⋊ 1` has `Γ_H = Γ¹(O)` (its preimage is `O^× ⋊ 1`, whose positive-norm part is
`O¹ ⋊ 1`); the full group has `Γ_H = Γ_G`. So the named families are: `X(D;1)`
(`H = 1 ≤ G(O,μ,1) = Aut_{±μ}(O)`, `O` maximal), whose curve is `Γ¹(O)\ℍ = X_0(D;1)`; `X(D;N)`
(`H = (O/NO)^× ⋊ 1 ≤ G(O,μ,N)`), also `Γ¹(O)\ℍ` — the level structure changes the stack and the
index, not the component's genus, exactly as the LMFDB tables record; `X^*(D;N)`
(`H = G(O,μ,N)`), the curve `Γ_G\ℍ`, the quotient of `X_0(D;M)` by the image of
`Aut_{±μ}(O)` in `W`; `X(D,M;1)` for `O` Eichler of level `M` and `H = 1`. The CM discriminants
of `X_H` are the `d` with `m(S_d, O; Γ̃_H) > 0` for the preimage `Γ̃_H ≤ N^+_{B^×}(O)` of `Γ_H`
(8.9). Caution: `X^*(D;1)` in the LMFDB sense is the
quotient by the image of `Aut_{±μ}(O)` in `W`, which is all of W exactly when the projection to W is surjective
(as for D = 6, degree one); its cardinality is #Aut±μ(O)/a(K), and it can be proper (for `D = 14`, `deg μ = 1`, it is
the quotient by one involution); it coincides with the classical `X^*(D;N)` of 8.5 only in the
first case. *Needs:* 9.4, 8.1, 8.5, 8.9.

**Checks.**

- `X(6;1)`: `H = 1 ≤ G(O_6,μ,1) = Aut_{±μ}(O_6)` has index `4` and `Γ_H = Γ¹(O_6)`.
- `H = (O/NO)^× ⋊ 1` gives `Γ¹(O)` at every level `N`, and `H = G(O,μ,N)` gives `Γ_G`.
- (coarseness) `H = 1` is not coarse for `N > 2`, since `ρ_N(−1, 1) ≠ 1`; at `N = 1`, `ρ_1(K)` is
  trivial, the gerbiness is `1` for `D = 6`, and `H = 1` is coarse.
- (reject) `H` and `H·ρ_N(K)` have the same `Γ_H`, so `Γ_H` does not determine `H`.

### 9.6 Genus, elliptic points and the area formula for `X_H`

Prove `ν_q(Γ_H) ≠ 0` only for `q ∈ {2, 3, 4, 6}` (8.7), and the genus formula in the form the
LMFDB verifies:
`g(X_H) = 1 + [Γ_G : Γ_H]·(a(K)/#Aut_{±μ}(O))·φ(D)ψ(M)/12 − (1/2)∑_{q ∈ {2,3,4,6}} ν_q(Γ_H)(1 − 1/q)`,
where `a(K)` is the aut-gerbiness, since `[Γ_G : Γ¹(O)] = #Aut_{±μ}(O)/a(K)` (9.4) and
`area(Γ¹(O)\ℍ)/(4π) = φ(D)ψ(M)/12` (8.2). Prove the permutation form over an arbitrary base genus: with `e_1, …, e_r`
generators of the elliptic stabilizers of `Γ_G` and `σ_i` their images in the permutation
representation of `Γ_G` on `Γ_G/Γ_H`, `2g(X_H) − 2 = [Γ_G:Γ_H](2g(X_G) − 2) + ∑_i ∑_{cycles c of σ_i}(|c| − 1)`
(Riemann–Hurwitz, FO Layer 5.3, for `X_H → X_{G}`), and `ν_q(Γ_H)` is the number of cycles of
length `e_i/q` among the `σ_i` with `e_i` the order of the elliptic element. *Needs:* 9.5,
8.2, 8.4, 8.7; FO Layer 5.

**Checks.**

- `X(6;1)`: Fuchsian index `4`, `a(K) = 1`, `#Aut_{±μ}(O) = 4`, so
  `g = 1 + 4·(1/4)·(2/12) − (1/2)(2·(1/2) + 2·(2/3)) = 0`.
- `X^*(6;1)`: genus `0`; `X(6,5;1)`: genus `1`; `X(14;1)`: genus `1`; `X(35;1)`: genus `3`.

- For H = G the degree is 1 and all cycles are singletons, so both sides are 2g(X_G)−2; a constant −2 term would force genus zero.
- At (D,M) = (6,101), φ(6)ψ(101) = 204 and (ν₂,ν₃) = (4,0), giving g(X₀) = 17. The seven W fixed counts in Hall-divisor order 2,3,6,101,202,303,606 are 4,0,4,0,12,0,12; their sum 32 gives 32 = 8(2·1−2)+32 and genus one for X₀/W.

### 9.7 Torsion invariants and the action on `O/NO`

Define the right action of `G(O,μ,N)` on `O/NO` by y·(w,x) = w⁻¹yw·x in the LMFDB pair order, equivalently
y·(x,w) = w⁻¹(yx)w in Mathlib order ( the `GL₄(ℤ/N)` embedding of the code) and the **torsion invariants** of `H` as the
abelian group invariants of `(O/NO)^H`. Prove the action is faithful on `(O/NO)^×` and that for
H containing the residue units the fixed module is the H-fixed part of
{y : y(u−1) = 0 for every residue unit u}. Prove vanishing whenever the right ideal generated
by the u−1 is the whole ring; in particular this holds for M₂(ℤ/Nℤ). Record the meaning, consumed from R18.1: for an abelian
surface with QM by `(O,μ)` whose enhanced mod-`N` image is `H`, `(O/NO)^H` is the rational
`N`-torsion. *Needs:* 9.4, 9.5.

**Checks.**

- In O₀(2)/2O₀(2), in coordinates E₁₁,E₁₂,2E₂₁,E₂₂, the four units are 1+bE₁₂+c(2E₂₁). Their fixed module is the span of E₁₂ and 2E₂₁, of order four, so for D = 15, M = N = 2 the unit subgroup has invariants (ℤ/2)².
- In M₂(𝔽₂), the units 1+E₁₂ and 1+E₂₁ impose yE₁₂ = yE₂₁ = 0, hence y = 0. The same computation works modulo every positive N.
- At N = 1 the quotient ring and fixed module each have one element, the zero module; faithfulness of the trivial unit group is consistent.

### 9.8 Atkin–Lehner content and the automorphism image

Define the image `H̄ ≤ Aut_{±μ}(O)` of `H` and the **Atkin–Lehner content** of `H`: the multiset of
squarefree parts of `nrd(w)` over one representative of each coset of `H ∩ (O/NO)^×` in `H`.
Prove both are invariants of the `G`-conjugacy class of `H`, and that `H̄` is the group through
which the Galois group of the endomorphism field of a generic member of the family acts
(consumed from R18.1's moduli interpretation; here it is a definition and a conjugacy invariant).
Define `IsSplit H` to hold when some conjugate of `H` is the internal semidirect product of its
intersections with `(O/NO)^×` and with `Aut_{±μ}(O)`. *Needs:* 9.4, 9.5.

### 9.9 Worked curves

Prove, for `D = 6`, `O` maximal, `deg μ = 1` (`Aut_{±μ}(O) ≅ (ℤ/2)²`): `K = {(±1, 1)}`, so at
level `1` the gerbiness `#ρ_1(K)` and the aut-gerbiness are both `1`; `X(6;1)` (`H = 1`): index `4`,
Fuchsian index `4`, `ν₂ = ν₃ = 2`, genus `0`, label prefix `6.1.1.4.0`; `X^*(6;1)`
(`H = Aut_{±μ}(O)`): index `1`, Fuchsian index `1`, genus `0`, prefix `6.1.1.1.0`; `X(6,5;1)`:
index `4`, `ν₂ = 4`, genus `1`, prefix `6.30.1.1.4.1` (with `d = 30`); `X(6,11;1)`: index `2`
(`#Aut_{±μ}(O) = 2` for this Eichler order), genus `3`, prefix `6.66.1.1.2.3`; `X(10;1)`: index `4`,
`ν₃ = 4`, genus `0`; `X(14;1)`: index `2`, `ν₂ = 2`, genus `1`; `X(26;1)`: index `2`, genus `2`;
`X(35;1)`: index `2`, genus `3`. *Needs:* 9.5, 9.6, 9.3, 8.4.

**Checks.**

- `X(6;1)`: index `4`, Fuchsian index `4`, `ν₂ = ν₃ = 2`, genus `0`.
- `X^*(6;1)`: index `1`, genus `0`.
- `X(6,5;1)`: index `4`, `ν₂ = 4`, genus `1`; `X(6,11;1)`: index `2`, genus `3`.
- `X(10;1)`: index `4`, `ν₃ = 4`, genus `0`; `X(26;1)`: index `2`, genus `2`.

### 9.10 Boundary checks

Prove: the definite algebra `ℍ[ℚ,-1,-1]` admits no real splitting, so Layer 8–9 constructions
reject it; a subgroup `H` not containing `ρ_N(K)` has the same `Γ_H` as `H·ρ_N(K)` (so distinct
`H` give the same curve: `is_coarse = false` cases); `deg μ` is not `nrd(μ)/discrd(O)` (for `D = 6`,
`deg μ = 2` has `nrd μ = 3`, `nrd μ/6 = 1/2`); the classical `X^*(14;1) = X_0(14;1)/(ℤ/2)²` differs
from the LMFDB's `X^*(14;1)` for `deg μ = 1`; the torsion of `ℚ(μ)^×/ℚ^×` is not `Aut_μ(O)`: for
`D = 21`, `deg μ = 21` (`μ = 21i'`, `i'² = −1`) the element `1 + i'` has norm `2 ∤ 21` and does not
normalize `O` (`O_2 ≅ M₂(ℤ_2)`, whose normalizer `ℚ_2^×GL₂(ℤ_2)` has norms of even valuation), so
`Aut_μ(O) = {1, [i']}` and `#Aut_{±μ}(O) = 4` (twisted by `χ² = 21`), not `8`; likewise `D = 33`,
`deg 33` gives `4`, and `D = 33`, `deg 11` (`μ' = √−3` with optimal order `ℤ[√−3]`, so `ζ₆ ∉ O` and
`1 + ζ₆ ∉ N_{B^×}(O)` although `3 ∣ 33`) gives `4`, not `12`. *Needs:* 9.1, 9.2, 9.5.

### Examples

The degree-one polarization at D = 6 is twisted; the full residue-unit subgroup at D = 15, M = N = 2 fixes four torsion elements.

### Dependencies

Layers 4, 6 and 8; native semidirect products; the QM moduli interpretation of HilbertModularVarietiesAndShimuraCurves R18.1.

## Layer 10: the LMFDB dictionary

### 10.1 The intrinsic label prefix

Define `HasLMFDBPrefix (O,μ,H) D d δ N i g :⟺ disc B = D ∧ discrd O = d ∧ deg μ = δ ∧
N(H) = N ∧ [G : H] = i ∧ g(X_H) = g`, prove each coordinate is an invariant of the isomorphism
class of `(O,μ,H)`, and prove that `d` is determined by `(D, M)` for Eichler orders (`d = DM`).
The order label `D.d` (`D` alone when `O` is maximal) is the same data; the polarized-order label
`D.d.δ` records `deg μ`, and when 9.1's count of isomorphism classes of degree `δ` exceeds one the
choice among them is a database convention, not a target. *Needs:* 0.4, 1.5, 9.1, 9.5, 9.6.

**Checks.**

- `X(6;1)`: `(D, d, δ, N, i, g) = (6, 6, 1, 1, 4, 0)`, printed `6.1.1.4.0` since `O_6` is maximal
  and `d` is omitted.
- `X^*(6;1)`: `6.1.1.1.0`.
- `X(6,5;1)`: `6.30.1.1.4.1`, with `d = 30 = DM` printed because the order is not maximal.
- (invariance) Conjugating `H` inside `G(O,μ,N)` changes none of the six coordinates.

### 10.2 The page coverage map

| Page datum (column) | Source | Certification |
| --- | --- | --- |
| quaternion algebra `(a,b/ℚ)` (`i_square`, `j_square`) | carrier | general |
| `discB` | 0.4 | general |
| `ℤ`-basis of `O` (`gens_numerators/denominators`), `discO` | 1.11 | general |
| `area_numerator/denominator` (= `φ(D)ψ(M)/12`) | 8.2 | general |
| polarization `mu`, `deg_mu` (`nrdmu`) | 9.1 | general |
| `AutmuO_size`, `AutmuO_is_cyclic`, `AutmuO_generators`, `Gerby_gen` | 9.2, 9.4 | general; the generators as elements, their stored coordinates are presentation data |
| `level`, `index`, `fuchsian_index`, `gerbiness`, `aut_gerbiness`, `is_coarse` | 9.5 | general |
| `generators` of `H` | 9.5 | carrier: `H` is a subgroup; the chosen generators are labels' |
| `nu2`, `nu3`, `nu4`, `nu6`, `genus` | 9.6, 8.3, 8.4 | general |
| `torsion` | 9.7 | general |
| `autmuO_norms`, `is_split`, `galEnd` (as the group `H̄`) | 9.8 | general; the group *label* is not |
| `cm_discriminants` | 8.9, 9.5 | general |
| `name` (`X(D;N)`, `X^*(D;N)`, `X(D,M;1)`) | 9.5 | general |
| `coarse_label`, `psl2label`, `scalar_label`, `Glabel`, `c.n` | — | none: labels and ordering |
| `rank`, `genus_minus_rank`, `dims`, `mults`, `newforms`, `conductor`, `simple`, `squarefree`, `trace_hash` | — | none: Jacquet–Langlands (R17.3) and the modular-forms roadmap |
| `q_gonality`, `qbar_gonality`, `models`, `modelmaps`, `pointless`, `obstructions`, `num_known_degree1_points` | — | none: `CanonicalModelsAndGonality`, rational points |
| `parents`, `factorization`, `lattice_labels` | 9.5 (inclusions `H ≤ H'` give maps `X_H → X_{H'}` of degree the Fuchsian index ratio) | the maps and degrees general; the stored lists are labels' |

*Needs:* the layers named.

### 10.3 The worked suite

The curves of 9.9 and the orders of 2.7, 5.6, 7.6 exercise every column of the first thirteen
rows. Their values are the Checks of the milestones named; `Suggested.lean` states only the
carriers and theorems expressible over Mathlib and the pinned Tau Ceti, and the worked objects are
specified in this README only.

### Examples

The two genus-zero degree-one components at D = 6 have intrinsic prefixes 6.1.1.4.0 and 6.1.1.1.0.

### Dependencies

Layer 9 for every invariant appearing in the prefix.

## Explicit scope exclusions

- No quaternion algebras in characteristic `2`, and no algebras over function fields; the base is
  a number field (Layers 0, 3–7) or a characteristic-zero Dedekind domain (Layers 1–2).
- No Shimura curves over totally real fields other than `ℚ`, no Shimura curves attached to
  non-Eichler orders beyond what Layer 9's `(O,μ)` with `O` Eichler covers, and no selectivity.
- No canonical models, fields of definition, integral models, Čerednik–Drinfeld uniformization,
  moduli interpretations, Heegner points, or rational points; no gonality or equations.
- No quaternionic modular forms beyond the trivial-coefficient Brandt module of Layer 7; no
  Jacquet–Langlands; no Hilbert modular forms themselves.
- No type number formula beyond Deuring's prime case and the structural description 6.8; the
  general Pizer type-number formula is not a target.
- No hermitian lattices over quaternion orders, no quaternionic Siegel/Hilbert–Siegel theory.
- Label components beyond the intrinsic prefix, orderings and normal forms fixed by convention,
  stored lists, and the completeness of database tables are not targets: Gassmann letters,
  canonical generators, the index `n` and the completeness of any enumeration (the Gassmann
  equivalence relation itself is `FiniteGroupInvariants` 7.1).

## Worked examples (acceptance criteria)

Every number below is checked by computation (Sage: `QuaternionAlgebra`, `BrandtModule`,
`BinaryQF`, class numbers) or is a direct evaluation of a formula stated above.

### `ℍ[ℚ,-1,-1]`, `D = 2`, the Hurwitz order

`(−1,−1)_2 = −1`, `(−1,−1)_p = 1` for odd `p`, `(−1,−1)_ℝ = −1`: `Ram = {2, ∞}`, `D = 2`,
definite (0.4, 0.5, 0.7). The Lipschitz order `ℤ⟨i,j⟩` has `discrd = 4` (1.8); the Hurwitz order
has `discrd = 2 = D`, is maximal (1.8), has `24` units, `w = 12`, `# Cls = 1` (3.8), mass
`1/12 = φ(2)/12` (5.6), class number formula `1/12 + 1/4 + 2/3 = 1` (6.7), `T(3) = (4)`,
`T(5) = (6)` (7.6). Eichler order of level `3`: `discrd = 6`, `6` units, `w = 3`, mass `1/3`,
`# Cls = 1`, `T(5) = (6)`, `T(7) = (8)`. Boundary: `ℍ[ℚ,-1,-13]` also has `D = 2`, not `13`
(`(−1,−13)_{13} = 1` since `−1` is a square mod `13`).

### `D = 3, 5, 7, 11, 13, 37` definite

`ℍ[ℚ,-1,-3]`: `D = 3`, one class, `12` units (`w = 6`), mass `1/6`. `ℍ[ℚ,-2,-5]`: `D = 5`, one
class, `w = 3`. `ℍ[ℚ,-1,-7]`: `D = 7`, `w = 2`. `ℍ[ℚ,-1,-11]`: `D = 11`, two classes, unit groups of
orders `4` and `6`, mass `1/2 + 1/3 = 5/6`, `ε₂ = ε₃ = 2`, `# Cls = 2`, type number
`1 + 1/4·1 + 1/4·3 = 2`, `T(2) = [[1,3],[2,0]]` (7.6: column sums `3, 3`; the row sums `4, 2` are not
constant). `D = 13`: one class, units `{±1}`, mass `1`.
`D = 37` (`ℍ[ℚ,-2,-37]`): three classes with units `{±1}`, mass `3`, `h(−148) = 2`, type number
`3/2 + 1/2 = 2`, `T(2) = [[1,1,1],[1,0,2],[1,2,0]]`. Boundary: `D = 11` shows two classes of
different types; `D = 37` shows three classes and only two types.

### `ℍ[ℚ,3,-1]`, `D = 6`, indefinite

`(3,−1)_2 = (3,−1)_3 = −1`, `(3,−1)_5 = 1`, `(3,−1)_ℝ = 1`: `D = 6`, indefinite (0.7).
Maximal order `O = ℤ⟨1, i, j, (1+i+j+k)/2⟩`, `discrd O = 6` (1.8); `# Cls O = # Typ O = 1` (4.3);
`N(O)/ℚ^×O^× ≅ (ℤ/2)²` with `w_2, w_3, w_6` (4.5). `area(X_0(6;1)) = 2π/3` (8.2);
`ν₂ = (1−(−4|2))(1−(−4|3)) = 1·2 = 2`, `ν₃ = (1−(−3|2))(1−(−3|3)) = 2·1 = 2` (6.5, 8.3);
`g = 1 + 1/6 − 1/2 − 2/3 = 0` (8.4). `X^*(6;1)` has genus `0`. Polarizations: `deg 1`,
`μ² = −6`, `Aut_{±μ}(O) ≅ (ℤ/2)²`; `deg 2`, `nrd μ = 3`; `deg 6`, `nrd μ = 1` (9.1, 9.3). Curves:
`X(6;1) = 6.1.1.4.0.a.1` (index `4`, `ν₂ = ν₃ = 2`, `g = 0`), `X^*(6;1) = 6.1.1.1.0.a.1` (9.9).
Eichler orders: level `5`: `discrd = 30`, `ψ(5) = 6`, area `(π/3)·2·6 = 4π`, `ν₂ = 2·(1+(−4|5)) = 4`,
`ν₃ = 2·(1+(−3|5)) = 0`, `g = 1 + 1 − 1 = 1`; level `7`: `ν₂ = 0`, `ν₃ = 4`, `g = 1`; level `11`:
`ν₂ = ν₃ = 0`, `ψ(11) = 12`, `g = 1 + 2 = 3`; level `13`: `ν₂ = ν₃ = 4`, `g = 1 + 7/3 − 1 − 4/3 = 1`;
level `25`: `g = 5`, `ν₂ = 4`.

### Other indefinite discriminants, `N = 1`

| `D` | `ν₂` | `ν₃` | `g(X_0(D;1))` | `#Aut_{±μ}(O)` for the LMFDB's `D.1` |
| --- | --- | --- | --- | --- |
| 10 | 0 | 4 | 0 | 4 |
| 14 | 2 | 0 | 1 | 2 |
| 15 | 0 | 2 | 1 | 4 |
| 21 | 4 | 0 | 1 | 2 |
| 22 | 2 | 4 | 0 | 4 |
| 26 | 0 | 0 | 2 | 2 |
| 33 | 4 | 2 | 1 | 2 |
| 34 | 0 | 4 | 1 | 2 |
| 35 | 0 | 0 | 3 | 2 |
| 38 | 2 | 0 | 2 | 4 |
| 39 | 0 | 0 | 3 | 2 |

Each genus is `1 + φ(D)/12 − ν₂/4 − ν₃/3`: `D = 26`: `φ(26) = 12`, `1 + 1 = 2`; `D = 35`:
`φ(35) = 24`, `1 + 2 = 3`; `D = 10`: `φ(10) = 4`, `1 + 1/3 − 4/3 = 0`. The last column is the
LMFDB's `AutmuO_size` for its stored `μ` and the target of 9.3; each value is the twisting
criterion of 9.3 evaluated on the stored order and `μ`. The degree-one polarized maximal order is
in general not unique up to isomorphism (9.1): the `Oˣ`-classes of optimal embeddings of the
orders `S` of `ℚ(√−D)` containing `ℤ[√−D]` number `h(−4D)`, plus `h(−D)` when `D ≡ 3 (mod 4)`
(6.4 with `# Cls O = 1` and `m_p(S) = 1` for `p ∣ D`); the group `N_{B^×}(O)/ℚ^×O^× ≅ (ℤ/2)^{ω(D)}`
of 4.5 acts on them with stabilizer the image of `Aut_μ(O) = ⟨w_D⟩` (the class of `μ` itself,
order `2`), so every orbit has size `2^{ω(D)−1}` and the isomorphism classes of `(O, μ)` of degree
`1` number `c = (h(−4D) + [D ≡ 3 (4)]·h(−D))/2^{ω(D)−1}`; the involution `μ ↦ −μ` fixes the twisted
classes (`#Aut_{±μ}(O) = 4`) and pairs the untwisted ones (`#Aut_{±μ}(O) = 2`), so the classes of
`(O, ±μ)`, the LMFDB's objects, number `t + (c − t)/2` with `t` the number of twisted classes.
For `D = 6, 10, 22`: `h(−4D) = 2`, `c = 1`, twisted. For `D = 14, 33, 34`: `h(−4D) = 4`, `c = 2`,
both untwisted and paired by `μ ↦ −μ`: one class. For `D = 15`: `h(−60) = h(−15) = 2`, `c = 2`,
both twisted (an untwisted class would bring its partner): two classes. For `D = 26` and `D = 38`:
`h(−104) = h(−152) = 6`, `c = 3`, one twisted class and one untwisted pair: two classes; the
LMFDB's `26.1` is the untwisted class and its `38.1` the twisted one. For `D = 35`: `h(−140) = 6`,
`h(−35) = 2`, `c = 4`, two twisted classes and one untwisted pair: three classes, the LMFDB's
`35.1` untwisted. For `D = 21` (`21 ≡ 1 (mod 4)`, so only `S = ℤ[√−21]` occurs): `h(−84) = 4`,
`c = 2`, one untwisted pair: one class. For `D = 39`: `h(−156) = h(−39) = 4`, `c = 4`, all four
untwisted, one pair for each `S`: two classes, the LMFDB's `39.1` being the pair with
`S = ℤ[(1+√−39)/2]`.

### Off-hypothesis checks

- `ℍ[ℚ,1,7]` and `ℍ[ℚ,5,5]` are split: `D = 1`, every order is conjugate to a suborder of `M₂(ℤ)`,
  and Layer 8 is not applicable (`X_0(1;N)` is the modular curve, which has cusps; it is the
  modular-forms roadmap's).
- A finite set of odd cardinality, such as `{5}` with `∞` split, is not a ramification set (0.3).
- `ℤ + 2O_6` is an order with `discrd = 48` that is neither Eichler nor Gorenstein (2.3, 2.7); the
  genus formula of 8.4 does not apply to it, and `Γ¹(ℤ + 2O_6)` has index `[O_6¹ : (ℤ+2O_6)¹]` in
  `Γ¹(O_6)` computed from `(O_6/2O_6)¹`.
- The global index `[O(1)¹ : O¹] = ψ(N)` of 8.2 and the normalizer quotient
  `N_{B^×}(O)/ℚ^×O^× ≅ (ℤ/2)^{ω(DN)}` of 4.5 need `B` indefinite (both rest on strong approximation,
  4.3): in `ℍ[ℚ,-1,-1]` the two Eichler orders of level `7` have `6` units each (mass
  `φ(2)ψ(7)/12 = 2/3`), so `[O(1)¹ : O¹] = 24/6 = 4 ≠ ψ(7) = 8`, and they contain no element of norm
  2, so the norm-2 two-sided class interchanges the two ideal classes. Its action is transitive;
  the stabilizer in the two-sided class group of order 4, and hence the normalizer quotient,
  has order 4/2 = 2, not 1 or 4; for `D = 37` the two-sided ideal `P_37` permutes the three classes as `(2 3)`, so the
  two maximal orders of the moved classes have trivial normalizer quotient. The local indices of
  1.10 hold in every case.
- For D = 15 and level 4, the dyadic Gaussian embedding count is zero and the Eisenstein count vanishes at 2; φ(15)ψ(4) = 8·6 = 48, so g(X₀(15;4)) = 1+48/12 = 5. There is no Eichler order with (D,N) = (6,4), since a ramified prime cannot divide the level.
- For `D = 6`, `deg μ = 2`: `nrd μ/discrd O = 1/2`, so `deg μ` is the squarefree representative of
  the square class, not the quotient itself (9.10).

## Ordering — the dependency graph

- **Layer 0** (ramification, discriminant) rests on Tau Ceti and the consumed classification; it
  is independent of everything else and can start at once.
- **Layer 1** (orders) rests on Mathlib's `IsLattice` and 0.1 only; 1.8 and 1.10 need 0.4, 1.10
  needs CAC 7.60; 1.12 uses elementary divisors over a DVR.
  **Layer 2** (Gorenstein, Bass) needs Layer 1 only and is independent of Layer 3.
- **Layer 3** (ideals, class sets, idelic dictionary, finiteness) needs Layer 1; 3.4 needs CAC
  7.72, 7.78 and global number fields Layers 4–6; 3.5 needs AA.3.4.
- **Layer 4** (indefinite) needs Layer 3, AA.4.2, AA.4.6 and CAC 7.44, 7.60, 7.98. **Layer 5** (mass)
  needs Layer 3, 2.4 and AA.5.3; Layers 4 and 5 are independent of each other.
- **Layer 6** (embeddings) needs Layers 1, 3; 6.4 needs 3.5; 6.5 needs 4.3 in the indefinite
  case; 6.6 needs Layer 5.
- **Layer 7** (Brandt) needs Layers 3, 5, 6.4 and, for 7.7, theta series Layer 7.
- **Layer 8** (Shimura curves) needs Layers 4, 6, TeichmullerGeometry §9.1 and FuchsianOrbifolds Layers 1, 4, 5.
- **Layer 9** (enhanced groups) needs Layers 4, 6 and 8. **Layer 10** needs 9.
- Parallel tracks: {0}, {1 → 2}, {1 → 3 → 4}, {1 → 3 → 5}, {3 → 6 → 7}, {4, 6 → 8 → 9 → 10}.

## References

- J. Voight, *Quaternion Algebras*, GTM 288, Springer 2021 ([author edition v0.9.28](https://jvoight.github.io/quat/quat-book-v0.9.28.pdf)), [DOI](https://doi.org/10.1007/978-3-030-56694-4).
  Chapters 10 (orders), 15 (discriminants), 16 (ideals and invertibility), 17 (class sets, types,
  Eichler's theorem 17.8.3), 22 (ternary forms and the even Clifford functor), 23 (Eichler orders,
  Bruhat–Tits tree), 24 (Gorenstein and Bass orders, Eichler symbol), 25–26 (Eichler mass formula),
  27 (adeles, 27.6 noncommutative adeles), 28 (strong approximation, 28.5.5, 28.9 normalizers and
  `AL(O)`), 30 (optimal embeddings, trace formula 30.4.7, local embedding numbers 30.5–30.6, class
  number formula 30.8.6, Deuring 30.9.2), 38 (quaternionic Fuchsian groups), 39 (volume and genus
  formulas 39.1.2, 39.4.20), 41 (Brandt matrices, trace formula 41.5.2), 43.6 (polarized orders).
  Every item above cites its theorem number.
- M.-F. Vignéras, *Arithmétique des algèbres de quaternions*, LNM 800, Springer 1980,
  [DOI](https://doi.org/10.1007/BFb0091027). Ch. III (local orders), Ch. V (class number and type
  number formulas, Corollaire V.2.5 as cited by Voight 30.8.8).
- M. Eichler, *Zur Zahlentheorie der Quaternionen-Algebren*, J. reine angew. Math. 195 (1955),
  [DOI](https://doi.org/10.1515/crll.1955.195.127) — the mass formula and class number formula
  for hereditary orders (Voight 30.8.8).
- A. Pizer, *On the arithmetic of quaternion algebras*, Acta Arith. 31 (1976) — the class number
  formula for Eichler orders of arbitrary level over `ℚ` (Voight 30.8.8); *An algorithm for computing
  modular forms on `Γ₀(N)`*, J. Algebra 64 (1980), [DOI](https://doi.org/10.1016/0021-8693(80)90151-9)
  — Brandt matrices as computed by the LMFDB.
- H. Shimizu, *On zeta functions of quaternion algebras*, Ann. of Math. 81 (1965),
  [DOI](https://doi.org/10.2307/1970389) — the volume formula over totally real fields (Layer 8, §8.2).
- M. Alsina and P. Bayer, *Quaternion Orders, Quadratic Forms, and Shimura Curves*, CRM Monograph
  Series 22, AMS 2004, [DOI](https://doi.org/10.1090/crmm/022) — explicit maximal orders, the
  ternary forms of Layer 2, and tables of `X_0(D;N)` of low genus.
- A. Ogg, *Real points on Shimura curves*, in *Arithmetic and Geometry I*, Progr. Math. 35,
  Birkhäuser 1983 — the fixed-point counts of the Atkin–Lehner involutions used in 8.6.
- V. Rotger, *Modular Shimura varieties and forgetful maps*, Trans. AMS 356 (2004),
  [author edition](https://web.mat.upc.edu/victor.rotger/docs/ModularShimura.pdf) — polarized orders and the groups
  `Aut_{±μ}(O)` (Voight 43.6.4 follows §3 there).
- L. Dembélé and J. Voight, *Explicit methods for Hilbert modular forms*, in *Elliptic Curves,
  Hilbert Modular Forms and Galois Deformations*, Birkhäuser 2013,
  [DOI](https://doi.org/10.1007/978-3-0348-0618-3_4) — the definite-algebra computation of Hilbert
  modular forms that 7.5 records.
- The LMFDB knowls `shimcurve`, `shimcurve.polarized_order`, `shimcurve.aut_pm_mu_o`,
  `shimcurve.enhanced_group`, `shimcurve.level`, `shimcurve.index`, `shimcurve.is_coarse`,
  `shimcurve.nrdmu`, `shimcurve.disco`, `shimcurve.eichler`, `shimcurve.label` — the definitions
  Layer 9 and 10 formalize, used only as source definitions, restated here in independent wording.
