# Roadmap: the Jacobian challenge (Christian Merten's AG version)

Background: Kevin Buzzard's "Jacobian challenge" (Zulip
[#Autoformalization > Jacobian challenge](https://leanprover.zulipchat.com/#narrow/channel/583336-Autoformalization/topic/Jacobian.20challenge)),
in the **algebraic-geometry formulation due to Christian Merten**. The challenge is
designed with **checks along the way**, so a construction that satisfies them all has to
have the definitions right; the point is autoformalizing *definitions*, not just
discharging `sorry`s.

The prerequisite stack uses Mathlib's schemes and Tau Ceti's divisor classes, rigidified
Picard functor and abelian varieties, and develops coherent cohomology, representability
and duality beyond those interfaces. Suggested
home: `TauCeti/AlgebraicGeometry/Jacobian/`, with supporting theories under
`TauCeti/AlgebraicGeometry/` (divisors, cohomology, Picard, curves, abelian varieties).

> ⚠ **Name clash.** Mathlib's `WeierstrassCurve.Jacobian` / `EllipticCurve/Jacobian`
> means **Jacobian *coordinates*** (a projective chart `[X : Y : Z]`), *unrelated* to the
> **Jacobian *variety*** built here. Use a name like `JacobianVariety` to avoid it.

## The end goal (v1)

For a **smooth, proper, geometrically connected curve `X` over a field `k` with a
`k`-rational point `x₀`**, construct the **Jacobian** `Jac X = Pic⁰(X)` as an abelian
variety over `k`, characterized by the universal property of the Abel–Jacobi map and
compatible with base change.

```lean
-- the shape we are building toward (state in Suggested.lean as the types appear):
-- noncomputable def JacobianVariety (X : Curve k) (x₀ : X.RationalPoint) : AbelianVariety k
-- def abelJacobi : X ⟶ (JacobianVariety X x₀).toScheme            -- x₀ ↦ 0
-- -- universal property: for every abelian variety A and pointed morphism f : (X,x₀) → (A,0),
-- -- there is a unique homomorphism φ : Jac X → A of abelian varieties with f = φ ∘ aj.
-- theorem jacobian_baseChange (K) [Field K] [Algebra k K] :
--     (JacobianVariety X x₀).baseChange K ≅ JacobianVariety (X.baseChange K) (x₀.baseChange K)
```

In the AG version, comparison of independently-built solutions is *automatic*: the
universal property supplies the isomorphism (Christian Merten).

## Standing hypotheses (spell them out; never bake in)

`X` smooth + proper + geometrically connected of dimension 1 over a field `k`; record as a
theorem that such a curve is **geometrically integral** (smoothness ⇒ geometric reducedness;
regular + connected ⇒ irreducible). A chosen `k`-rational point `x₀`. The Jacobian scheme
`Pic⁰` is representable for such curves over a field **without** a `k`-point; the `k`-point
*rigidifies/normalizes* the Picard functor and supplies the Abel–Jacobi morphism.

## Inventory: what the pinned libraries give us (consume)

- **Morphism properties**, `Mathlib/AlgebraicGeometry/Morphisms/*`: `Proper`, `Smooth`,
  `Separated`, `Flat`, `FiniteType`, `FinitePresentation`, `ClosedImmersion`, `Etale`, …,
  every adjective for "smooth proper curve", plus the flat/proper/fp hypotheses the
  relative theory needs.
- **Geometric conditions**: `Mathlib/AlgebraicGeometry/Geometrically/{Connected,Integral}.lean`.
- **Affine Picard / class groups**: `Mathlib/RingTheory/PicardGroup.lean` (`CommRing.Pic`)
  and `ClassGroup.equivPic`. Useful *algebraic ingredients for affine charts*; they are
  **not** a direct foundation for the global Picard scheme (the work is invertible sheaves
  as locally free sheaves, gluing, and descent).
- **General sheaf cohomology on a site**: `Mathlib/CategoryTheory/Sites/SheafCohomology/{Basic,Cech,MayerVietoris}.lean`,
  `Mathlib/AlgebraicGeometry/Sites/BigZariski.lean`. These Mathlib modules provide
  site cohomology. Layers B–C use Tau Ceti's `Scheme.Modules.Cohomology` for scheme
  coefficients and develop the finiteness, higher-direct-image and relative-base-change
  theorems on that carrier.
- **Rigidity**, `Mathlib/AlgebraicGeometry/Group/Abelian.lean`:
  `AlgebraicGeometry.isCommMonObj_of_isProper_of_geometricallyIntegral` proves a proper,
  geometrically integral group scheme over a field commutative. Smoothness and geometric
  connectedness in Layer E imply geometric integrality. The representative signature is
  `properIntegralGroup_commutative`; the Picard group law also follows directly from tensor
  product (Stacks [0BFD](https://stacks.math.columbia.edu/tag/0BFD)). **Checks:**
  - The constant group scheme `S₃` is smooth and proper but noncommutative; it is not
    geometrically connected or geometrically integral.
  - An elliptic curve satisfies the geometric-integrality hypothesis.
  - The identity group `Spec k` satisfies it in dimension zero.
- **`Proj` / projective space**: `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/*`.
- **Genus-1 ingredients**, `Mathlib/AlgebraicGeometry/EllipticCurve/*`: the group law on
  the points of an elliptic curve is built in `EllipticCurve/Affine/Point.lean` **through
  the class group** (`ClassGroup.mk W.FunctionField (XYIdeal' …)`), i.e. the divisor-class /
  `Pic⁰` description in genus 1. This is a **reconciliation target and a template**, *not*
  a scheme-level `Jac(E) ≅ E`; that statement still has to be built.
- **Tau Ceti interfaces.** Consume
  [Cartier divisor classes](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.lean),
  `TauCeti.AlgebraicGeometry.LineBundleClass`, and the Weil/Cartier degree comparison;
  [the rigidified Picard functor](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean),
  `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor`;
  [AbelianVariety](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean)
  with its Hom, dimension, field-base-change and isogeny APIs; and
  [AbelianVariety.IsAlbanese](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean)
  with factorization and uniqueness. Layers A, D, E and F extend these carriers.

## Inventory: what is missing (build here)

The curve applications of the existing Weil/Cartier divisor, line-bundle and degree APIs;
**Pic⁰**; **coherent-sheaf cohomology** with **finiteness, Serre
duality, Riemann–Roch** over `k`; the **relative** theory, i.e. coherent higher direct images
under proper morphisms, **cohomology and base change / semicontinuity / Grauert**, relative
effective Cartier divisors; the **Picard functor**, its **rigidification** (Poincaré bundle) and
**representability**, and `Pic⁰` with its **properness/projectivity**; the remaining
**abelian-variety theory** (tangent-space/cohomology comparison, projectivity, dual,
polarizations, the theorem of the cube/square); the
**Abel–Jacobi** morphism, universal property, and base change. The fppf-sheaf /
faithfully-flat-descent lane is a shared prerequisite (also in the reductive-groups roadmap).

---

## The prerequisite tower (build order)

Codex's recommended dependency order, refined. Each layer is self-contained mathematics
worth having on its own. As a layer makes the next one's *types* expressible, state those
milestones in `Suggested.lean` (with `sorry`).

### Layer A, line bundles, divisors, Picard group, degree
- **Invertible sheaves** on a scheme; the **Picard group** `Pic X` under `⊗`.
- **Divisors on a curve.** The Weil-divisor sum `⊕_x ℤ` runs over closed,
  equivalently codimension-one, points of the smooth integral curve. Use `SchemeWeilDivisor`
  and its comparison with Cartier divisors. On an integral scheme the dictionary is
  `Cartier divisors / principal divisors ≃ Pic X`, with `Pic X` the isomorphism classes
  of invertible sheaves; on a smooth curve this also gives `Cl(X) ≅ Pic X`.
  Before quotienting, the corresponding object is an invertible sheaf with a nonzero
  rational section, up to isomorphism preserving that section. Consume
  `TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.ClassGroup`,
  `principalSubgroup_eq_ker`, `classGroupAddEquivLineBundleClass`, and
  `nonempty_iso_sheaf_iff` from `CartierDivisor/ClassGroup.lean` (Hartshorne II.6.13–6.15).
  The signatures `cartierPicardEquiv` and `cartier_sheaf_iso_iff_principal` use this API.
  **Checks:**
  - On `ℙ¹_k`, `div(t) = [0] − [∞]` is nonzero but gives the same trivial line-bundle
    class as the zero divisor; its rational section distinguishes the unquotiented objects.
  - The class of a rational point on `ℙ¹_k` gives `𝒪(1)`, not the trivial class.
  - A degree-two closed point of `ℙ¹_ℝ` contributes `2` to divisor degree; the generic
    point contributes no generator to the Weil-divisor sum.
- **Degree.** Define `deg L := χ(L) − χ(𝒪_X)` (this equals `Σ_x [κ(x):k]·ord_x` for the
  divisor of `L`; prove agreement). ⚠ Note `χ(L) = dim H⁰ − dim H¹` is the *Euler
  characteristic*, **not** the degree. Then `Pic⁰ X = ker deg` (as an abstract group; the
  *functorial* `Pic⁰` is defined in Layer D).

### Layer B, coherent cohomology over `k`: genus, Riemann–Roch, Serre duality
- **Coherent sheaves** and cohomology `Hⁱ(X, ℱ)`: acyclicity of affines, Čech ≃ derived on
  a separated scheme, **finite-dimensionality for proper `X/k`**, vanishing above dimension
  (`H²= 0` on a curve).
- **Genus** `g := dim_k H¹(X, 𝒪_X)`; **Riemann–Roch** `χ(L) = deg L + 1 − g`; **Serre
  duality** with the **relative dualizing sheaf** `ω_{X/k}`: `Hⁱ(L) ≅ H^{1−i}(ω_{X/k} ⊗ L⁻¹)*`
  and `deg ω_{X/k} = 2g − 2`.

### Layer C, relative coherent cohomology and base change
The part that the classical "Sym^g" story quietly relies on, so it comes *before* Picard.
- **Coherent higher direct images under proper morphisms.** For every proper morphism
  `f : X → S` with `S` locally Noetherian and every coherent `F` on `X`, construct
  `R^q f_* F` and prove it coherent for all `q ≥ 0`, with no flatness of `f` or of `F` over
  `S` (Stacks 02O5). Over `S = Spec A`, prove `H^q(X, F)` a finite `A`-module (02O6), with
  the canonical `A`-linear identification `H^q(X, F) ≅ Γ(S, R^q f_* F)` (01XK); Layer B's
  finite-dimensionality is the case `A = k`. The proof treats projective `f` first, from the
  Čech computation of `H^q(ℙⁿ_A, 𝒪(m))`, and reduces the proper case to it by Chow's lemma
  (SchemeAndStackFoundations §4.12, `chow_lemma`) and Noetherian induction. Finiteness over a
  Noetherian affine base lives in `TauCeti/AlgebraicGeometry/Cohomology/Proper.lean`,
  coherence of `R^q f_* F` in `Cohomology/Pushforward.lean`. **Checks:**
  - `A = k⟦t⟧`, the finite morphism `i : Spec(A/(t)) → Spec A` and `F = 𝒪`: `i` is proper
    and not flat, `i_* 𝒪 = (A/(t))~` is coherent and killed by `t`, `R^q i_* 𝒪 = 0` for
    `q ≥ 1`, and `H⁰ = k` is a finite `A`-module that is not `A`-flat. This lies inside the
    hypotheses of §4.9, whose isomorphism for `I = (t)` reads `k ≅ lim_n k`.
  - `A = k⟦t⟧`, `f : ℙ¹_A → Spec A` (proper and flat) and `F = 𝒪/(t)`, the pushforward of
    `𝒪_{ℙ¹_k}` from the special fibre: `F` is not `A`-flat, `H⁰(ℙ¹_A, F) = k`,
    `H¹(ℙ¹_A, F) = 0` and `f_* F = (A/(t))~`.
  - `A` Noetherian, `f : ℙ¹_A → Spec A` and `F = 𝒪(n)`: `H⁰` is free of rank `max(n + 1, 0)`
    and `H¹` free of rank `max(−n − 1, 0)` (Hartshorne III.5.1).
  - Properness is used: for `𝔸¹_k → Spec k`, `H⁰(𝔸¹_k, 𝒪) = k[t]` is not finite over `k`.
- **Flat base change, semicontinuity, cohomology and base change**, each with its own
  hypotheses. **Flat base change**: for `f : X → S` quasi-compact and quasi-separated, `F`
  quasi-coherent on `X` and `g : S' → S` flat, with `f' : X' → S'` and `g' : X' → X` the
  base change, the map `g^* R^q f_* F → R^q f'_* (g'^* F)` is an isomorphism; over
  `S = Spec A`, `S' = Spec B` it reads `H^q(X, F) ⊗_A B ≅ H^q(X_B, F_B)` (Stacks 02KH).
  The rest is for `f : X → S` proper with `S` locally Noetherian and `F` coherent and flat
  over `S`, the hypotheses of StableReduction's contract J-C; Layer D's case is `f` proper,
  flat and finitely presented with `F` locally free. Over affine `S = Spec A`, there is a
  bounded complex `K` of finite projective `A`-modules with `H^q(X_B, F_B) ≅ H^q(K ⊗_A B)`
  functorially in `A`-algebras `B` (Mumford, *Abelian Varieties*, §5; Stacks 0B91).
  **Semicontinuity**: `s ↦ dim_{κ(s)} H^q(X_s, F_s)` is upper semicontinuous (Stacks 0BDN)
  and `s ↦ χ(X_s, F_s)` is locally constant. **Cohomology and base change**: if
  `φ^q(s) : R^q f_* F ⊗ κ(s) → H^q(X_s, F_s)` is surjective it is an isomorphism, and then
  `φ^{q−1}(s)` is surjective if and only if `R^q f_* F` is locally free near `s`;
  **Grauert**: if `S` is reduced and `s ↦ dim_{κ(s)} H^q(X_s, F_s)` is locally constant, then
  `R^q f_* F` is locally free and every `φ^q(s)` is an isomorphism (Hartshorne
  III.12.8–12.11 for projective `f`; Mumford, *Abelian Varieties*, §5). In relative
  dimension one, `H¹(X_s, F_s) = 0` for every `s ∈ S` makes `f_* F` locally free, with
  formation commuting with every base change. These live in
  `TauCeti/AlgebraicGeometry/Cohomology/{BaseChange,Semicontinuity}.lean`. **Checks:**
  - For a field extension `K/k`, `X` proper over `k` and `F` coherent,
    `H^q(X_K, F_K) ≅ H^q(X, F) ⊗_k K`; in particular the genus does not change under
    extension of `k`, which Layer F's base-change compatibility uses.
  - `A` Noetherian, `f : ℙ¹_A → Spec A` and `F = 𝒪(n)`: every `φ^q(s)` is an isomorphism,
    and `R⁰ f_* 𝒪(n)`, `R¹ f_* 𝒪(n)` are free of ranks `max(n + 1, 0)`, `max(−n − 1, 0)`.
  - `S = 𝔸¹_k = Spec k[t]`, `f : ℙ²_S → S`, `Z ⊂ ℙ²_S` the union of the sections `[1:0:0]`,
    `[0:1:0]`, `[1:1:t]`, and `F = 𝓘_Z ⊗ 𝒪(1)` (flat over `S` because `𝒪_Z` is):
    `h⁰(ℙ²_{κ(s)}, F_s)` is `1` at `t = 0`, where the three points are collinear, and `0`
    elsewhere, while `χ(ℙ²_{κ(s)}, F_s) = 0` for every `s`; `f_* F = 0`, so `φ⁰` at `t = 0` is
    the non-surjective map `0 → k`.
- The theorem on formal functions, which Grothendieck's Picard-scheme proof uses, is consumed
  here, not proved here: its general form is owned by SchemeAndStackFoundations §4.9,
  exported as `Scheme.Modules.Cohomology.formalFunctionsIso` in
  `TauCeti/AlgebraicGeometry/Cohomology/FormalFunctions.lean`. The input §4.9 consumes is the
  first item of this layer, at its stated generality: §4.9's coefficients `F/I^n F`, and
  `⊕_n I^n F` over the Rees algebra `⊕_n I^n` (Stacks 0897), need not be flat over their
  base. The Picard construction of Layer D is its consumer; this layer builds no second
  completion or formal-functions API.
- **Relative effective Cartier divisors and symmetric powers.** For a smooth proper
  geometrically integral curve `X/k` and `d ≥ 0`, construct a natural identification of
  `Symᵈ X = Hilbᵈ_{X/k}` with the functor sending every `k`-scheme `T` to relative
  effective Cartier divisors on `X_T/T` finite locally free of degree `d`. Supply the
  universal divisor, pullback, addition of divisors, and smooth projective geometry of
  dimension `d`. Use SchemeAndStackFoundations §4.14's Hilbert schemes and Layer A's
  divisor API (Stacks [0B9D](https://stacks.math.columbia.edu/tag/0B9D),
  [0B9I](https://stacks.math.columbia.edu/tag/0B9I), [0B9J](https://stacks.math.columbia.edu/tag/0B9J)).
  **Checks:**
  - `d = 0` represents the empty divisor by `Spec k`; `d = 1` represents graphs by `X`.
  - `Sym² ℙ¹_k = ℙ²_k`, including the locus of doubled points in characteristic two.
  - On an affine coordinate chart over `T = Spec k[ε]/(ε²)`, the equation `u² − ε`
    gives a relative divisor of rank two; the universal family records this infinitesimal
    motion, even though its geometric fibre is the doubled origin.

### Layer D, the relative Picard functor and the Jacobian scheme
- **The functor.** For `f : X → Spec k` proper, flat, finitely presented with
  geometrically integral fibres (so `f_*𝒪_X = 𝒪` universally), `Pic_{X/k}` is the **fppf
  sheafification** of `T ↦ Pic(X_T)/Pic(T)`. Keep the three notions distinct (Picard
  *stack* vs *functor/sheaf* vs *rigidified functor*), and record the obstruction
  (`Br`-flavoured) between `Pic(X_T)/Pic(T)` and `Pic_{X/k}(T)`. The section `x₀`
  **rigidifies** it (line bundles trivialized along `x₀,T`; the **Poincaré bundle**) and
  removes that obstruction. Identify the rigidified classes naturally with the existing
  `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor f x₀ hx₀`, preserving pullback and
  tensor product. Prove the obstruction sequence
  `0 → Pic(T) → Pic(X_T) → Pic_{X/k}(T) → H²_fppf(T, 𝔾_m) → H²_fppf(X_T, 𝔾_m)`.
  Use invertible-sheaf descent from SchemeAndStackFoundations §1.1, its §2.11's
  identification of `H¹_fppf(−, 𝔾_m)` with the Picard group, and §2.2's Leray sequence (Stacks
  [0B9N](https://stacks.math.columbia.edu/tag/0B9N); Kleiman, *The Picard scheme*,
  Theorem 2.5, pp. 17–18). **Checks:**
  - For `ℙ¹_k` with a rational point, the rigidified functor is the sheaf of locally
    constant integer degrees, on arbitrary test schemes.
  - Tensoring `L` with `f_T^* M` disappears after normalization by `x₀,T^* L`.
  - A pointless real conic has a degree-one real Picard-sheaf point but no degree-one
    line bundle; the section hypothesis cannot be removed from the rigidified comparison.
- **Hilbert quotients for Picard charts.** Over any field `k`, let `Z` be a
  quasi-projective scheme and `R ⊂ Z ×_k Z` an equivalence relation represented by a
  scheme, with either projection smooth and proper. Construct a quasi-projective
  quotient scheme `Q`, a smooth surjection `Z → Q`, and the identification
  `R = Z ×_Q Z`; `Q` represents the quotient étale sheaf and also its fppf sheafification.
  Construct it from the Hilbert family of equivalence classes, with its universal
  property and compatibility with field extension. This target supplies scheme
  representability, beyond the algebraic-space output of a general quotient theorem
  (Kleiman, Lemma 4.9 and proof, pp. 30–31). Consume SchemeAndStackFoundations §4.14's
  Hilbert schemes on a projective compactification of `Z` and §1.1's descent;
  open gluing uses Mathlib's scheme gluing.
  **Checks:**
  - The diagonal relation gives `Q = Z`.
  - For `Z = ℙⁿ_k` and `R = Z ×_k Z`, the quotient is `Spec k`.
  - A finite étale Galois extension `l/k` gives the quotient of
    `Spec l ×_k Spec l ⇉ Spec l` equal to `Spec k`, including when `k` is finite.
- **Projective Picard representability.** For a projective geometrically integral
  scheme `Y` over any field `k`, construct a separated group scheme `Pic_{Y/k}` locally
  of finite type representing the fppf sheaf of relative line-bundle classes. The
  structural morphism is flat and locally of finite presentation; no perfectness or
  rational point is assumed. Use the fixed-Hilbert-polynomial and higher-cohomology-vanishing
  open subfunctors. Fix a very ample `𝒪_Y(1)` and use sufficiently positive twists:
  for a representative `L` on `Y_T`, with `p : Y_T → T`, require `L(m)` fibrewise
  globally generated with vanishing higher cohomology and
  `E = p_* L(m)` finite locally free of positive rank, commuting with base change.
  The divisor chart has class map `D ↦ 𝒪(D)(−m)`; its complete linear systems
  parametrize lines in `E`, equivalently rank-one quotients of `E^∨`.
  Prove that these twisted opens cover, locally on each test scheme, by Serre
  vanishing and generation. Their divisor atlases are open subsets of Hilbert schemes,
  and their kernel pairs are smooth projective families of these nonempty complete
  linear systems. Apply the
  preceding quotient target and glue these open quotients. Supply the natural
  representing comparison on all test schemes, the tensor-product group law, the unit
  and inverse, and coherent field base change. Each fixed-Hilbert-polynomial piece is
  an increasing union of open quasi-projective schemes; these quasi-compact open charts
  are of finite presentation over `k` (Kleiman, Theorems 2.5, 4.8 and Lemma 4.9,
  pp. 17–18, 27–31; Stacks [01TP](https://stacks.math.columbia.edu/tag/01TP),
  [01TX](https://stacks.math.columbia.edu/tag/01TX)). Extend the locally Noetherian
  test-scheme construction to arbitrary tests using finite-presentation limits from
  SchemeAndStackFoundations §0.9 and invertible-sheaf descent; Kleiman's standing convention
  and limit reduction are on p. 15.
  The cohomological and formal inputs are Layer C and SchemeAndStackFoundations §4.9's
  `Scheme.Modules.Cohomology.formalFunctionsIso`.

  Specialize to the standing curve: proper curves are projective (Stacks
  [0A26](https://stacks.math.columbia.edu/tag/0A26)). With `x₀`, compare its scheme
  directly to `rigidifiedPicardFunctor`; `pointedCurvePicard_representable` records this
  comparison, with a flat structural morphism locally of finite presentation.
  SchemeAndStackFoundations §§3.6–3.7 consume this represented object and
  supply no input to its construction. General relative Picard algebraic spaces belong
  to AlgebraicModuliForArithmeticGeometry §7.3. **Checks:**
  - For `ℙ¹_k`, the representing scheme is `∐_{d ∈ ℤ} Spec k`, flat and locally of
    finite presentation but not quasi-compact, hence not of finite presentation over `k`.
    Each degree component, including degree zero, is `Spec k` and is of finite presentation.
  - For an elliptic curve over a finite field, the comparison holds on
    `Spec k[ε]/(ε²)` as well as on field-valued points.
  - For a smooth geometrically integral curve over the imperfect field `𝔽_p(t)`,
    representation and field base change hold without replacing the field by its perfection.
  - On `ℙ¹_k`, `L = 𝒪(−1)` has zero higher cohomology and `H⁰ = 0`, so its untwisted
    divisor space is empty. Twisting by `m = 1` gives `E = k` of rank one and the
    empty divisor maps to `𝒪(−1)` under `D ↦ 𝒪(D)(−1)` (Stacks
    [01XS](https://stacks.math.columbia.edu/tag/01XS), Lemma 30.8.1).
- **The curve's neutral component and smoothness.** Before representability, degree
  zero means degree zero on every geometric fibre. Afterwards prove this is the
  open-and-closed identity component `Pic⁰_{X/k}`, geometrically connected and smooth
  of dimension `g`. Local constancy of Euler characteristic gives the degree components;
  line-bundle lifting through square-zero thickenings has obstruction in `H²(X, 𝒪_X)`,
  which vanishes by Layer B. Prove the tangent identification `T₀ Pic⁰ ≅ H¹(X, 𝒪_X)`
  together with this smoothness result. The Abel maps
  `AJ_d : Symᵈ X → Pic^d`, `D ↦ 𝒪(D)`, are surjective for `d ≥ g`, and `AJ_g` is
  birational; translate by `𝒪(−d·x₀)` to degree zero. These maps and geometric
  irreducibility of symmetric powers prove geometric connectedness (Stacks
  [0BA0](https://stacks.math.columbia.edu/tag/0BA0); Kleiman, Theorem 5.11,
  Proposition 5.19, pp. 40–42, 47). **Checks:**
  - `ℙ¹_k` has `Pic⁰ = Spec k`, tangent space zero and genus zero.
  - For an elliptic curve, `AJ_1` identifies the smooth one-dimensional neutral component
    with the curve, sending the chosen origin to zero.
  - Field extension preserves the genus, the tangent comparison and the entire smooth
    component; in characteristic `p` smoothness follows from the lifting argument.
- **Properness and projectivity of the curve's Pic⁰.** Prove properness from the
  surjective Abel map in degree at least `g`, properness of `Symᵈ X`, and separatedness
  of the represented Picard scheme. The degree-zero component lies in one
  fixed-Hilbert-polynomial piece of the preceding construction; its quasi-compactness
  places it inside one quasi-projective open. Proper and quasi-projective over `k`
  implies projective. Supply the field-base-change comparison for this full component
  and deduce that every `Pic^d`, translated from `Pic⁰` by `𝒪(d·x₀)`, is proper and of
  finite presentation over `k`
  (Stacks [0BA0](https://stacks.math.columbia.edu/tag/0BA0); Kleiman, Theorem 4.8(2),
  pp. 27–31). **Checks:**
  - In genus zero `Pic⁰ = Spec k` is projective.
  - In genus one the translated `AJ_1` identifies `Pic⁰` with the proper projective curve.
  - In genus two `AJ_2` has positive-dimensional fibres over special classes;
    properness and projectivity do not require it to be a finite morphism.

### Layer E, abelian varieties
- **Cube and square.** Prove the theorem of the cube for invertible sheaves on an
  abelian variety's triple product, with its unique trivialization extending compatible
  trivializations on the three coordinate-zero faces. Deduce the theorem of the square
  and that `a ↦ t_a^* L ⊗ L⁻¹` is a homomorphism into relative Picard classes on all
  test schemes, compatible with field extension (Milne I §5, Theorem 5.1,
  Corollary 5.2 and Theorem 5.5, pp. 21–26). **Checks:**
  - For the trivial bundle the normalized cube trivialization is the identity.
  - For a symmetric bundle, `[n]^* L ≅ L^{⊗n²}`.
  - For a translation-invariant bundle, `[n]^* L ≅ L^{⊗n}`; these formulas agree for
    the trivial bundle in dimension zero.
- **Abelian varieties and projectivity.** Use Tau Ceti's `AbelianVariety k`, whose
  proper geometrically integral group scheme is equivalently smooth, proper and
  geometrically connected. Consume its dimension, Hom and field-base-change APIs and
  rigidity-derived commutativity. Prove every such group scheme projective, without
  using the dual construction; Layer D's smooth proper neutral component then defines
  `Jac X` on this carrier (`JacobianVariety`), and its tangent comparison gives
  `dim (Jac X) = g`
  (Milne, *Abelian Varieties*, I §§1, 6, Theorem 6.4, pp. 9–10, 27–31). **Checks:**
  - The zero abelian variety is `Spec k` of dimension zero.
  - An elliptic curve has dimension one and a projective embedding.
  - Products of two elliptic curves have dimension two; extending an imperfect ground
    field preserves their geometric integrality and group laws.
- **The higher-dimensional Picard functor and dual.** For every abelian variety `A/k`,
  define the subgroup of `rigidifiedPicardFunctor` at its identity whose line bundles
  are algebraically equivalent to zero on every geometric fibre. On abelian varieties
  this is equivalent to invariance under all geometric translations; prove the
  comparison with the identity-component subfunctor of the represented `Pic_{A/k}`.
  Curve degree is not used in this definition. Apply Layer D's projective Picard
  representability to `A`, using the projectivity theorem above, and prove its full
  neutral component smooth, proper and geometrically connected of dimension `dim A`.
  This supplies `A^∨` as an abelian variety, representing that subgroup on arbitrary
  test schemes, with a universal Poincaré bundle on `A × A^∨` normalized on both zero
  sections. Smoothness here is the abelian-variety Picard theorem, not the curve's
  `H² = 0` argument. Retain the full scheme structure in characteristic `p`
  (Milne I §8, Proposition 8.4 and pp. 36–40; Kleiman, Remark 5.24, pp. 50–51,
  citing Mumford §13). **Checks:**
  - The zero abelian variety is its own dual and the Poincaré bundle is trivial.
  - An elliptic curve's subgroup agrees with degree-zero line bundles.
  - For `E₁ × E₂`, the dual is `E₁^∨ × E₂^∨`, with the tensor product of the two
    pulled-back Poincaré bundles; this uses a Picard construction on a surface.
- **Duality API.** For a homomorphism `f : A → B`, construct the pullback homomorphism
  `f^∨ : B^∨ → A^∨`, characterized by the normalized-bundle isomorphism
  `(f × 1)^* P_B ≅ (1 × f^∨)^* P_A`. Prove identity and composition laws, coherent
  field-base-change comparison `(A^∨)_K ≅ (A_K)^∨` for all extensions, and biduality
  `A ≅ A^{∨∨}`, defined by the switched Poincaré bundle and natural in `f`. Compare
  Poincaré bundles and both rigidifications under every map, including successive
  field extensions (Milne I §8, Remark 8.7 and Theorem 8.9, §9, pp. 37–41).
  Field duality, cube/square and polarizations are supplied here to
  AbelianSchemesAndArithmeticModuli A0.2 and A2.2; its relative theory specializes to
  these objects. **Checks:**
  - The dual of the identity is the identity, and biduality on `Spec k` is the identity.
  - The dual of a product projection is the corresponding inclusion.
  - In characteristic `p`, dualizing relative Frobenius on an elliptic curve gives
    Verschiebung; the finite kernels retain their nonreduced structure.
- **Polarizations and theta.** Fix `φ_L(a) = t_a^* L ⊗ L⁻¹`. Construct it as a
  homomorphism `A → A^∨` through the normalized family of line bundles. An ample `L`
  gives a polarization; a homomorphism `λ : A → A^∨` is a polarization exactly when
  over an algebraic closure it equals `φ_L` for an ample line bundle there. A polarization
  is principal exactly when it is an isomorphism of abelian varieties. For
  `g > 0`, construct the Cartier divisor `W_{g−1} ⊂ Pic^{g−1}` of effective classes;
  translating by `−(g−1)x₀` gives theta on the already constructed `Jac X`.
  Prove its line bundle ample and its Mumford homomorphism a principal polarization,
  compatible with field extension; the induced homomorphism is independent of
  translating theta. In genus
  zero use the identity of the zero abelian variety and its ample trivial bundle
  (Milne I §11, p. 53; III §6, Theorem 6.6 and Summary 6.11, pp. 104–108).
  **Checks:**
  - On an elliptic curve `L = 𝒪([0])` gives `φ_L(a) = 𝒪([−a] − [0])`; the Abel
    divisor-class map `a ↦ 𝒪([a] − [0])` differs by `[−1]`.
  - Tensoring an ample bundle with an algebraically trivial bundle leaves `φ_L`
    unchanged; `𝒪(d[0])` on an elliptic curve gives degree `d²` for `d > 0`.
  - In genus zero the principal polarization has degree one and is the identity.
  - In genus two theta is the translated image of `X` under `AJ_1`, an ample divisor
    on a two-dimensional Jacobian.
- **Abel-map Picard pullback and autoduality.** For the standing pointed curve,
  write `J = Pic⁰(X)` and `a(x) = 𝒪(x − x₀)`, the translated degree-one Abel map of
  Layer D. Let `Q` be the universal bundle on `X × J`, normalized along `x₀ × J`
  and `X × 0`, and `P_J` the doubly normalized bundle on `J × J^∨`.
  Construct the homomorphism `q = a^* : J^∨ → J` by pullback of relative
  line-bundle classes on every test scheme, with the rigidification-preserving comparison
  `(a × 1)^* P_J ≅ (1 × q)^* Q`. Prove the theta bundle comparison
  `(a × (−λ_Θ))^* P_J ≅ Q`, preserving both trivializations. Deduce
  `q ∘ λ_Θ = [−1]_J`; hence `q` is an isomorphism and `q⁻¹ = −λ_Θ`.
  For every abelian variety `A/k` and pointed morphism `f : (X,x₀) → (A,0)`,
  construct similarly `f^* : A^∨ → J`: algebraically trivial bundles pull back to
  degree-zero bundles, tensor product gives the homomorphism, and
  `(f × 1)^* P_A ≅ (1 × f^*)^* Q` preserves both rigidifications.
  Prove composition compatibility with homomorphisms of abelian varieties and
  compatibility of these maps, comparisons and the inverse of `q` with every field
  extension. This is Picard pullback for a curve morphism, extending Layer E's
  dual-map API (Milne III Lemmas 6.8–6.9 and Remark 6.10(c), pp. 106–107;
  I §8, Theorem 8.9, pp. 37–38). **Checks:**
  - For an elliptic curve with origin `x₀`, `q` sends the class `𝒪([b] − [0])`
    to `b`, while `λ_Θ(b)` is `𝒪([−b] − [0])`; their composite is `[−1]`.
  - In genus zero, `J = J^∨ = Spec k`, both normalized bundles are trivial,
    and `q`, `λ_Θ` and `[−1]` are the identity; every `f^*` is zero.
  - Over a field of characteristic two, the identity is an equality of homomorphisms
    and normalized families on all test schemes; `[-1]` need not equal the identity
    on an elliptic curve, even though the scalars `−1` and `1` in the field agree.
- **Multiplication and characteristic `p`.** For every `n : ℤ` with `n ≠ 0`, prove
  `[n]` finite locally free and surjective, of degree `|n|^{2 dim A}`, hence an
  isogeny in Tau Ceti's sense (`multiplication_isogeny`). For positive-dimensional `A`,
  `[n]` is étale exactly when `(n : k) ≠ 0` (`multiplication_etale_iff`). Thus in
  characteristic `p > 0`, `A[p]` is non-étale when `dim A > 0`; its full finite group
  scheme, including nilpotents, is retained. No perfect-field hypothesis is used
  (Stacks [0BFG](https://stacks.math.columbia.edu/tag/0BFG),
  [0BFH](https://stacks.math.columbia.edu/tag/0BFH); Milne I §7, Theorem 7.2,
  pp. 31–34). **Checks:**
  - On an elliptic curve, `[n]` has degree `n²`; `[0]` on a positive-dimensional
    abelian variety is not an isogeny.
  - In dimension zero every `[n]`, including `[0]`, is the identity and its kernel
    is trivial and étale; this includes the Jacobian of a genus-zero curve.
  - For a supersingular elliptic curve over an algebraically closed field of
    characteristic `p`, `E[p]` has length `p²` and only one geometric point.

### Layer F, Abel–Jacobi and the universal property
- **Abel–Jacobi and the Albanese property.** Define `abelJacobi`, written
  `a : X ⟶ Jac X`, by `x ↦ 𝒪(x − x₀)` (Layer D's translated `AJ_1`), and prove
  `a(x₀) = 0`. For every abelian variety `A` and pointed morphism
  `f : (X, x₀) → (A, 0)`, prove there is a unique homomorphism of abelian varieties
  `φ : Jac X → A` with `f = φ ∘ a` (the Albanese property; for a curve `Jac = Alb`).
  Construct the proof `isAlbanese_abelJacobi` on the existing
  `AbelianVariety.IsAlbanese` carrier using Layer E's Picard-pullback comparison:
  set `r = q⁻¹ ∘ f^* : A^∨ → J^∨` and
  `φ = b_A⁻¹ ∘ r^∨ ∘ b_J : J → A`, where `b_B : B → B^{∨∨}` is biduality.
  The normalized universal bundles identify `φ ∘ a` with `f` by biduality's
  representing property. Any factorization has `q ∘ φ^∨ = f^*`, so invertibility
  of `q` and biduality give uniqueness. The same construction covers genus zero
  with the zero Jacobian. All bundle comparisons preserve the two rigidifications
  and commute with field extension (Milne III Proposition 6.1, p. 104,
  Lemmas 6.8–6.9 and Remark 6.10(c), pp. 106–107; I Theorem 8.9, pp. 37–38).
  **Checks:**
  - For `X = ℙ¹_k`, the constructed factorization through `Spec k` proves every
    pointed morphism to an abelian variety is zero.
  - For a pointed elliptic curve, `a` is an isomorphism and the construction gives
    `φ = f ∘ a⁻¹`, agreeing with `AbelianVariety.isAlbanese_of_isIso`.
  - For `f = a`, `r` is the identity and biduality gives `φ = 1_J`; for `f = 0`
    it gives `φ = 0`, including on infinitesimal test schemes.
  - Properness alone does not construct the factorization: the rational projection
    `ℙ² ⇢ ℙ¹`, `[x:y:z] ↦ [x:y]`, is undefined at `[0:0:1]` and has no extension
    there. The normalized-bundle construction supplies a global morphism.
- **Base-change compatibility** along `k → K` (relies on Layer C).

## Acceptance criteria ("checks along the way")

A finished construction must pass sanity checks that rule out vacuous definitions:
- **`dim (Jac X) = genus X`** (via `T₀ Pic⁰ ≅ H¹(X,𝒪_X)`);
- **genus 1:** `Jac (E, O) ≅ E`, reconciled with Mathlib's `E(k)` group law (built via the
  class group / `Pic⁰`);
- **`aj` is a closed immersion for `genus X ≥ 1`** (check after base change to `k̄`, hence
  over `k`);
- base-change compatibility above.

## Scope and caveats (Kevin Buzzard)

- **The `k`-rational point is assumed.** Without it, `x ↦ 𝒪_X(x)` maps `X` into `Pic¹`,
  which is a **torsor under `Pic⁰`** and may have no `k`-point; `Pic⁰` (the Jacobian) still
  *exists*, but `aj` and the clean functor-of-points picture need `x₀`. The torsor / `Pic¹`
  / Albanese-torsor story is the **v2** generalization, out of scope for v1.
- **Jacobian ≠ Albanese in general.** Canonically isomorphic for curves but with *opposite*
  functorialities (`Pic⁰` contravariant; Albanese covariant). Keep them distinct in v2.
- **Imperfect fields:** use "geometrically connected/integral", not bare connectedness;
  watch base-change subtleties throughout Layers C–D.

## References

- R. Hartshorne, *Algebraic Geometry*: Ch. II (sheaves, divisors), III (cohomology,
  incl. III.12 cohomology and base change), IV (curves, Riemann–Roch).
- Q. Liu, *Algebraic Geometry and Arithmetic Curves*: curves, models, Picard.
- J. S. Milne, *Abelian Varieties* and *Jacobian Varieties* (in Cornell–Silverman,
  *Arithmetic Geometry*): the construction and universal property.
- D. Mumford, *Abelian Varieties*: theorem of the cube/square, dual variety, polarizations.
- Bosch–Lütkebohmert–Raynaud, *Néron Models*, Ch. 8–9: the Picard functor and its
  representability.
- The Stacks Project: *Picard schemes of curves* (tag 0B95), *Divisors* (tag 01WP),
  *Cohomology and base change* (tag 0B91), *Quot/Hilbert and Picard functors* (tag 0D04).
- S. L. Kleiman, [*The Picard scheme*](https://arxiv.org/abs/math/0504020):
  Theorems 2.5, 4.8, Lemma 4.9, Theorem 5.11, Proposition 5.19 and Remark 5.24;
  locators above use the preprint numbering.

## Acknowledgements

This roadmap builds directly on earlier discussions on the [Lean
Zulip](https://leanprover.zulipchat.com/), and would not have been possible without them:

- [#Autoformalization > Jacobian challenge](https://leanprover.zulipchat.com/#narrow/channel/583336-Autoformalization/topic/Jacobian%20challenge),
  where Kevin Buzzard posed the original Jacobian challenge.
- Private project discussions with Christian Merten, Matthew Ballard, Adam Topaz,
  Fabian Glöckle, and Jack McCarthy; the algebraic-geometry reformulation this roadmap
  follows is due to Christian Merten.

Thanks to everyone who contributed to these discussions.
