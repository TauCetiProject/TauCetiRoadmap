# Roadmap: algebraic Gromov–Witten theory and quantum cohomology

The summit is a construction of algebraic Gromov–Witten theory for a smooth projective variety
`X` over an algebraically closed field of characteristic zero. Starting from the moduli stack of
stable maps and its Behrend–Fantechi virtual fundamental class, this roadmap defines primary and
descendant Gromov–Witten invariants, proves their structural equations, and uses their genus-zero
part to construct the small and big quantum cohomology rings. The WDVV equation proves
associativity. The same potential defines the big Dubrovin connection and quantum `D`-module;
the divisor equation identifies their small restrictions, and the curvature is proved to vanish.

The algebraic state space is the rational numerical Chow ring

```text
H_X = N^*(X)_ℚ = CH^*(X)_ℚ / numerical equivalence.
```

For smooth projective `X`, this is finite-dimensional and its intersection pairing is perfect by
definition of numerical equivalence. Gromov–Witten invariants initially accept rational Chow
classes and are then proved to factor through `H_X`. This choice avoids assuming an unbuilt Weil
cohomology theory and makes every operation in the roadmap algebraic. It is often called quantum
Chow theory; throughout this roadmap, **quantum cohomology** means this numerical-Chow-valued
theory. Comparison with Betti, ℓ-adic, crystalline, or algebraic de Rham quantum cohomology is
outside the scope below.

Suggested homes:

- `TauCeti/AlgebraicGeometry/Moduli/Curves/` for the stacks of prestable and stable pointed curves;
- `TauCeti/AlgebraicGeometry/Moduli/StableMaps/` for the stable-map stack, universal curve,
  evaluation and clutching morphisms, and its obstruction theory;
- `TauCeti/AlgebraicGeometry/GromovWitten/` for tautological classes, Gromov–Witten classes and
  invariants, their equations, and WDVV;
- `TauCeti/AlgebraicGeometry/QuantumCohomology/` for Novikov rings, small and big products,
  Dubrovin connections, and quantum `D`-modules.

General moduli-stack, intersection-theoretic, formal-power-series, connection, and differential-
operator constructions belong in shared directories rather than under their first example.

## The end goals

Fix an algebraically closed field `k` of characteristic zero and a smooth projective
`k`-variety `X` of pure dimension `d`.

1. **Stable-map moduli and its virtual class.** For every genus `g`, number of ordered markings
   `n`, and effective numerical curve class `β`, construct the proper separated Deligne–Mumford
   stack `MbarMap g n X β`, its universal curve and map, and the evaluation, forgetting,
   stabilization, and gluing morphisms. Construct the standard perfect obstruction theory
   relative to the smooth stack of prestable curves and the class
   `[MbarMap g n X β]vir` of dimension
   `(1-g)(d-3) + n + c₁(T_X)·β`.
2. **Gromov–Witten classes and descendants.** Define cotangent-line classes `ψᵢ`, primary and
   descendant invariants, and, in the stable range for pointed curves, the Chow-valued
   Gromov–Witten class obtained by stabilization. Prove symmetry, the dimension axiom, the
   degree-zero formula, the fundamental-class, string, divisor, and dilaton equations, the
   splitting axiom, and genus-zero topological recursion.
3. **WDVV.** Compare the three boundary divisors of `Mbar_{0,4}` through the virtual splitting
   formula. Prove the coefficientwise WDVV equations for the genus-zero potential over the
   completed Novikov ring.
4. **Small quantum cohomology.** Define the small product on
   `H_X ⊗_ℚ Λ_X` from three-point genus-zero invariants. Prove that it is a graded commutative,
   associative, unital Frobenius algebra, specializes to the numerical Chow ring at positive
   Novikov order zero, and is independent of coordinates and of the ample class used to present
   the Novikov completion.
5. **Big quantum cohomology.** Over the formal parameter ring
   `R_X = Λ_X⟦t⁰, …, tᴺ⟧`, define the product from third derivatives of the genus-zero potential.
   Prove associativity from WDVV, the flat identity from the string equation, Frobenius
   invariance, and recovery of the small product at `t = 0`.
6. **Quantum connections and quantum `D`-modules.** Construct the big Dubrovin connection
   `∇_a = ∂_a + z⁻¹(T_a ⋆_t -)` on the trivial `H_X`-bundle over `Spf R_X`. Prove that it is
   flat and compatible with the Poincaré pairing under `z ↦ -z`. Package the operators
   `z∂_a + T_a ⋆_t` as the big quantum `D`-module. Use the divisor equation to construct the
   coordinate-free small connection and small quantum `D`-module over `Λ_X`, and prove that they
   are the divisor-slice restrictions of the big objects.

## Standing conventions

- **Curve classes.** `N₁(X)_ℤ` is the image of integral one-cycles in the dual of numerical
  divisor classes, and `NE(X)` is the submonoid of classes represented by effective integral
  one-cycles. The symbol `β` always lies in `NE(X)`. A stable-map family has class `β` when every
  geometric fibre pushes its fundamental one-cycle to `β`.
- **State-space grading.** `H_X^p = N^p(X)_ℚ` has Chow codimension `p` and cohomological degree
  `2p`. Every state-space class is even, so the symmetric-group, WDVV, and commutativity formulas
  have no Koszul signs. Set `deg Q^β = 2 c₁(T_X)·β` when discussing the cohomological grading.
- **Pairing.** The Frobenius pairing is `(a,b) = deg_X(a·b)`, extended `Λ_X`- and
  `R_X`-bilinearly. For a homogeneous basis `(T_a)`, write `g_ab = (T_a,T_b)` and `g^ab` for the
  inverse matrix. Basis formulas must be proved independent of the chosen homogeneous basis.
  Do not infer that the diagonal of `X×X` is `Σ g^ab T_a×T_b`: numerical Chow does not satisfy
  such a Künneth statement for an arbitrary `X`. Virtual gluing is first stated using refined
  pullback along the actual diagonal.
- **Chow before numerical Chow.** Evaluation pullbacks and virtual intersections are formed in
  rational Chow theory. Factoring each insertion through numerical equivalence is a theorem,
  not a definition of pullback on numerical equivalence classes.
- **Stable types.** A constant genus-zero map requires at least three markings, and a constant
  genus-one map requires at least one. All definitions and equations either assume that their
  source and target stable-map types exist or state the standard unstable convention explicitly.
  Negative descendant exponents denote zero. No formula silently treats a nonexistent moduli
  stack as a point.
- **Descendants.** For the universal curve `π : C → MbarMap g n X β` and section `s_i`, set
  `L_i = s_i^* ω_π` and `ψ_i = c₁(L_i)`. These are the cotangent lines on the stable-map stack,
  not pullbacks of cotangent lines from `Mbar_{g,n}` before the comparison theorem is proved.
- **Formal completions.** All infinite sums are interpreted in the Novikov and parameter-adic
  topology specified in Layer 1. Statements about potentials, products, connections, and
  differential operators are statements about continuous maps of complete modules.
- **Connection sign.** This roadmap fixes `∇_a = ∂_a + z⁻¹(T_a ⋆_t -)`. Horizontal sections
  therefore satisfy `(z∂_a + T_a ⋆_t)s = 0`. A development choosing the simultaneous opposite
  sign must provide the evident comparison and must not mix the two conventions.
- **Stacks and Chow coefficients.** Moduli objects are groupoid-valued fppf stacks, fibre
  products are 2-fibre products, and Chow groups of Deligne–Mumford stacks have rational
  coefficients. Stabilizer orders are never suppressed from degree computations.

## Exact supplier contracts

This roadmap consumes the following results and does not introduce competing carriers.

- [`StableReduction`](../StableReduction/README.md) Layers 10–11 supply families of pointed
  stable maps, their fibrewise stability condition, evaluation on an individual family,
  polarization degree, decorated dual graphs, forgetting markings, external and self-gluing,
  map-aware stabilization, and the valuative existence-and-uniqueness interface. That roadmap
  deliberately stops before the moduli stack, boundedness, and properness; Layers 2–3 below own
  those constructions.
- [`VirtualFundamentalClass`](../VirtualFundamentalClass/README.md) supplies rational Chow and
  Gysin theory for separated Deligne–Mumford stacks, geometric cotangent complexes, perfect
  obstruction theories with a visible global two-term resolution, absolute and relative virtual
  fundamental classes, products, compatible pullbacks, and the functoriality used by virtual
  gluing. The stable-map stack and its obstruction theory are inputs built here.
- [`SchemeAndStackFoundations`](../SchemeAndStackFoundations/README.md) supplies algebraic spaces,
  algebraic and Deligne–Mumford stacks, quotient stacks, representable morphisms, 2-fibre
  products, quasi-coherent modules, and scheme intersection theory.
- [`AlgebraicVectorBundles`](../AlgebraicVectorBundles/README.md),
  [`DerivedModuleAlgebra`](../DerivedModuleAlgebra/README.md), and
  [`EnhancedDerivedSheaves`](../EnhancedDerivedSheaves/README.md) supply vector bundles,
  cotangent complexes, derived tensor and Hom, perfect complexes, and derived pushforward
  infrastructure in the forms imported by the virtual-class roadmap.
- Mathlib supplies commutative algebra, finitely generated lattices, graded rings and modules,
  multivariate formal power series, topological rings and complete modules, derivations,
  connections, and category-theoretic descent. Extend these APIs when a required completion or
  continuous differential-operator construction is absent; do not replace them with a private
  Gromov–Witten-specific formal-series type.

## Inventory: what remains to build

The suppliers do not construct moduli stacks of curves or stable maps, prove their boundedness or
properness, construct the stable-map obstruction theory, or relate its virtual class to gluing and
forgetting markings. They also do not provide numerical Chow groups, effective numerical curve
classes, Novikov completions, Gromov–Witten invariants, quantum products, or quantum connections.
Every such bridge is a target below.

The dependency spine is:

```text
stable-map families ──→ curve and stable-map stacks ──→ universal geometry
                                                        │
numerical cycles ──→ Novikov completion                 ├─→ obstruction theory ─→ VFC
       │                                                │                         │
       └─→ numerical Chow state space                   └─→ forgetting/gluing ────┤
                                                                                  v
           descendants and virtual identities ─→ splitting/TRR ─→ WDVV
                                                                  │
                     small quantum product ←──────────────────────┤
                                                                  v
                       big potential/product ─→ flat connection ─→ quantum D-module
```

---

## Layer 0: numerical cycles and the algebraic state space

- Define numerical equivalence of dimension-`r` cycles on a projective scheme by vanishing of
  all complementary intersection numbers. Construct `N_r(X)_ℤ`, `N_r(X)_ℚ`, `N^p(X)_ℚ` for a
  smooth pure-dimensional `X`, and the intersection product on `N^*(X)_ℚ`. Prove functoriality for
  proper pushforward and flat or local-complete-intersection pullback in the stated ranges.
- Prove that rational equivalence implies numerical equivalence, that numerical equivalence is
  compatible with the intersection product, and that `N^*(X)_ℚ` is a finite-dimensional graded
  commutative `ℚ`-algebra. Prove that the pairing
  `N^p(X)_ℚ × N^{d-p}(X)_ℚ → ℚ` is perfect, including the zero groups in unmatched degrees.
- Define the numerical first Chern class of a line bundle, the lattice of numerical divisor
  classes, the numerical class of an integral curve, and the effective monoid `NE(X)`. Prove
  compatibility of intersection with degrees of pulled-back line bundles and with pushforward of
  curves under proper maps.
- For a rational Chow insertion `γ` which is numerically trivial, prove the projection-formula
  criterion: pairing `ev^*γ` with any proper pushforward of a complementary Chow class has degree
  zero. Package the multilinear descent lemma that will make every Gromov–Witten invariant factor
  through `H_X` one insertion at a time.

## Layer 1: effective classes and the Novikov ring

- For an ample line bundle `A`, define `ω_A(β) = A·β`. Prove positivity on nonzero effective
  classes and finiteness of `{β ∈ NE(X) | ω_A(β) ≤ B}` for every bound `B`. The proof must pass
  through the finite-rank numerical lattice and the compact slice of the closed effective cone;
  it may not assume finite generation of `NE(X)`.
- Define the completed monoid algebra

  ```text
  Λ_X = { Σ_{β∈NE(X)} a_β Q^β |
          for every B, only finitely many β with a_β ≠ 0 and ω_A(β) ≤ B }.
  ```

  Construct addition, convolution multiplication, the valuation filtration, topology, and
  completeness. Prove that multiplication coefficients are finite sums, `Q^0 = 1`, and
  `Q^βQ^γ = Q^{β+γ}`.
- For two ample classes, prove their degree functions are comparable on the effective cone and
  induce cofinal filtrations. Export `Λ_X` independently of the chosen `A`, with canonical
  continuous equivalences satisfying cocycle coherence.
- Develop completed tensor products with finite-dimensional graded vector spaces, restricted
  derivations `δ_D(Q^β) = (D·β)Q^β` for `D ∈ N^1(X)_ℚ`, and the mixed completion
  `R_X = Λ_X⟦t⁰,…,tᴺ⟧`. Prove continuity of substitution, differentiation, exponential
  translation in divisor variables, coefficient extraction, and inversion of a matrix whose
  constant term is invertible.

## Layer 2: moduli stacks of pointed curves

- Using the pointed prestable families from `StableReduction`, define the fppf stack
  `Mpre g n` of connected genus-`g`, `n`-pointed prestable curves. Prove effective descent for
  objects and arrows, construct the diagonal, and prove that it is an algebraic Artin stack,
  smooth and pure of dimension `3g-3+n` over `k`, locally of finite type.
- In the stable range `2g-2+n > 0`, construct the open substack `Mbar g n` of stable curves and
  prove that it is a proper smooth Deligne–Mumford stack of finite type. Relate its valuative
  criterion to the existence and uniqueness theorem in `StableReduction`; supply the
  boundedness, algebraicity, and finite-inertia arguments which that object-level theorem does
  not contain.
- Construct universal curves and sections, permutation of markings, forgetting and stabilizing a
  marking, external clutching, and self-clutching. Prove representability, properness or
  finiteness where classically valid, base change, symmetric-group equivariance, and all
  associativity and interchange 2-isomorphisms.
- Construct the stabilization morphism from `Mpre g n` to `Mbar g n` on the locus where the
  underlying pointed curve has a stabilization, and identify the universal cotangent lines and
  boundary divisors. Prove the pullback formula for cotangent-line classes under a forgetting
  morphism; this is the intersection-theoretic input to string, dilaton, and topological
  recursion equations.

## Layer 3: the moduli stack of stable maps

- Define `MbarMap g n X β` as the full substack of the stack of families of maps whose geometric
  fibres are stable and have numerical class `β`. Prove effective fppf descent and invariance of
  the class condition in connected families.
- Choose a projective embedding of `X` and use the polarization from `StableReduction` to prove
  boundedness. Construct a Hilbert-scheme parameter space of embedded source curves with maps to
  `X`, cut out nodality, marking, class, and stability loci, and identify the quotient by the
  change-of-basis linear algebraic group with `MbarMap g n X β`. Prove independence of embedding
  and exponent by equivalences satisfying cocycle coherence.
- Prove that `MbarMap g n X β` is a separated Deligne–Mumford stack of finite type. Prove
  properness using the stable-map valuative interface from `StableReduction`, including extension
  of a generic map after finite DVR extension, descent in the valuative criterion for stacks, and
  uniqueness from separatedness. Do not infer properness from properness of `X` alone.
- Construct the universal curve `π`, universal map `f`, ordered sections, evaluation morphisms
  `ev_i : MbarMap g n X β → X`, and the morphism to `Mpre g n`. In the pointed-curve stable
  range construct `st : MbarMap g n X β → Mbar g n`. Compare all of these with the family-level
  constructions in `StableReduction`.
- Construct permutation, forgetting-and-stabilizing, external gluing, and self-gluing morphisms.
  External gluing has source
  `MbarMap g₁ (I∪{a}) X β₁ ×_X MbarMap g₂ (J∪{b}) X β₂`, using `ev_a` and `ev_b`, and target
  class `β₁+β₂`; state self-gluing separately. Prove their graph-stratum descriptions, degree,
  properness, base change, and coherence for repeated gluing and forgetting.

## Layer 4: the stable-map obstruction theory and virtual class

- On the universal curve prove that `Rπ_* f^*T_X` is perfect of amplitude `[0,1]`, commutes with
  base change, and has rank `d(1-g)+c₁(T_X)·β`. Dualize the differential of the universal map to
  construct

  ```text
  E = (Rπ_* f^*T_X)∨  ──→  L_(MbarMap/Mpre).
  ```

  Prove the `H⁰` isomorphism and `H⁻¹` epimorphism through the deformation and obstruction theory
  of a map with its source curve fixed.
- Use the quotient presentation from Layer 3 to construct an equivariant global two-term
  vector-bundle resolution of `E` and descend it to the stable-map stack. Perfectness alone is not
  enough: the exported resolution is the explicit hypothesis required by
  `VirtualFundamentalClass`.
- Combine the relative obstruction theory with smoothness and pure dimension
  `3g-3+n` of `Mpre g n`. Construct
  `[MbarMap g n X β]vir` and prove that its dimension is

  ```text
  vdim = (1-g)(d-3) + n + c₁(T_X)·β.
  ```

  Prove independence from the projective embedding, quotient presentation, resolution, and
  strict model of every 2-pullback.
- Identify the virtual class for `X = Spec k` with the ordinary fundamental class of
  `Mbar g n` in the stable range. For `β = 0`, identify the stable-map stack with
  `Mbar g n × X` and compute its obstruction theory and virtual class, including the genus-zero
  specialization used by the classical product.
- Prove compatibility of obstruction theories under products of targets, permutation and
  forgetting of markings, and external and self-gluing. Apply the compatible-pullback and product
  theorems from `VirtualFundamentalClass` to obtain virtual pullback, virtual pushforward, and
  diagonal Gysin formulas for the corresponding virtual classes.

## Layer 5: tautological classes, Gromov–Witten classes, and invariants

- Construct `L_i = s_i^*ω_π` and `ψ_i = c₁(L_i)` on the stable-map stack. Prove base change,
  permutation, gluing, and forgetting formulas, including the boundary correction to `ψ_i` after
  forgetting a mark.
- For `γ_i ∈ CH^*(X)_ℚ` and `a_i ∈ ℕ`, define

  ```text
  ⟨τ_{a₁}(γ₁)…τ_{aₙ}(γₙ)⟩_{g,β}
    = deg ( [MbarMap g n X β]vir · ∏ᵢ ψ_i^{a_i} ev_i^*γ_i ).
  ```

  Define the value to be zero unless the integrand has total codimension `vdim`. Prove
  multilinearity, permutation invariance, and compatibility with rational equivalence.
- Apply Layer 0's projection-formula criterion to prove that each insertion factors through
  numerical equivalence. Export the invariant as a multilinear map on `H_X`, while retaining the
  rational-Chow definition used in geometric proofs.
- When `2g-2+n > 0`, define the Gromov–Witten class
  `st_*(∏ ev_i^*γ_i ∩ [MbarMap]vir)` in `CH^*(Mbar g n)_ℚ`, with the dimension shift stated
  explicitly: insertions of total codimension `c` give codimension
  `c+d(g-1)-c₁(T_X)·β` on `Mbar g n`. Prove that taking its degree after multiplying by
  monomials in cotangent classes recovers the descendant invariant.
- Prove vanishing by virtual dimension, the degree-zero formula, the point-target formula,
  symmetry, and the product formula for targets. Include the stack multiplicities in every
  pushforward and degree calculation.

## Layer 6: equations and virtual splitting

- Prove the fundamental-class and **string equations** from the forgetting morphism and the
  cotangent-line pullback formula. With `τ_{-1}=0`, the stable formula is

  ```text
  ⟨τ₀(1) ∏ᵢ τ_{aᵢ}(γᵢ)⟩_{g,β}
    = Σⱼ ⟨τ_{aⱼ-1}(γⱼ) ∏_{i≠j} τ_{aᵢ}(γᵢ)⟩_{g,β}.
  ```

  State and prove the exceptional constant-map conventions separately.
- Prove the **dilaton equation**
  `⟨τ₁(1)∏ᵢτ_{aᵢ}(γᵢ)⟩ = (2g-2+n)⟨∏ᵢτ_{aᵢ}(γᵢ)⟩` with the exact stable-type hypotheses.
- For a divisor `D ∈ N¹(X)_ℚ`, prove the **divisor equation**

  ```text
  ⟨τ₀(D) ∏ᵢτ_{aᵢ}(γᵢ)⟩_{g,β}
    = (D·β)⟨∏ᵢτ_{aᵢ}(γᵢ)⟩_{g,β}
      + Σⱼ⟨τ_{aⱼ-1}(Dγⱼ)∏_{i≠j}τ_{aᵢ}(γᵢ)⟩_{g,β}.
  ```

  Derive the primary divisor equation and its exponential generating-series form.
- Prove the external and nonseparating **splitting axioms** by refined pullback along the target
  diagonal and the virtual gluing formula. State the primary result as an equality of Chow
  correspondences and its descendant version after cotangent-line pullback. After applying an
  outgoing evaluation pushforward and passing to numerical equivalence, derive the contraction
  formulas for the induced multilinear operations. Do not replace the target diagonal by a sum
  of exterior products unless a separate Chow–Künneth hypothesis has been supplied.
- Pull back boundary-divisor relations on `Mbar_{0,n}` and prove genus-zero topological recursion
  for descendants. Check the unstable terms rather than absorbing them into an undefined
  correlator.

## Layer 7: the genus-zero potential and WDVV

- For a homogeneous basis `(T_a)` and `t = Σ_a t^aT_a`, define the genus-zero potential

  ```text
  F₀(t) = Σ_{β∈NE(X)} Σ_{n≥0} Q^β/n! · ⟨t,…,t⟩_{0,β} ∈ R_X,
  ```

  with constant-map terms of arity below three set to zero. Prove convergence in the mixed
  completion and invariance under a change of homogeneous basis.
- Use the basis-free virtual splitting formula over the three boundary points of
  `Mbar_{0,4} ≅ ℙ¹`, followed by an outgoing evaluation pushforward, to prove associativity of
  the resulting correspondence-valued genus-zero operation. Pass to numerical equivalence and
  the perfect pairing to deduce the coefficientwise WDVV identity

  ```text
  Σ_{e,f} F_{abe} g^{ef} F_{fcd}
    = Σ_{e,f} F_{ace} g^{ef} F_{fbd},
  ```

  where `F_{abc} = ∂_a∂_b∂_cF₀`. Prove equality in the completed ring by checking every
  Novikov and parameter coefficient; formal rearrangement of an unproved infinite sum is not a
  proof.
- Express string, divisor, and grading equations for `F₀`. Separate the classically cubic
  degree-zero term, and prove that third derivatives eliminate the convention-dependent constant,
  linear, and quadratic terms.

## Layer 8: small and big quantum cohomology

- First define the small product in rational Chow theory by the outgoing evaluation pushforward

  ```text
  a ⋆small b = Σ_β Q^β (ev₃)_*(ev₁^*a · ev₂^*b ∩ [MbarMap 0 3 X β]vir).
  ```

  Prove that this descends in both inputs and in its output to numerical equivalence, and prove
  the characterizing identity
  `(a ⋆small b,c)=Σ_βQ^β⟨a,b,c⟩_{0,β}`. Prove continuity, `Λ_X`-bilinearity, grading,
  commutativity, the Frobenius identity, and that `1_X` is its unit.
- Prove associativity of `⋆small` from the basis-free four-point WDVV correspondence. Prove that its
  Novikov-order-zero specialization is the ordinary product on `H_X`. Define
  `QH^*small(X) = (H_X ⊗ Λ_X, ⋆small)` and prove independence from basis and ample filtration.
- Define the big product first by the analogous outgoing evaluation pushforward with any number
  of additional insertions of `t`. Prove convergence and descent to numerical equivalence, then
  prove its equivalent coordinate characterization:

  ```text
  a ⋆t b = Σ_{β,n} Q^β/n! · (ev_{n+3})_*
    (ev₁^*a · ev₂^*b · ∏_{i=3}^{n+2} ev_i^*t ∩ [MbarMap 0 (n+3) X β]vir),

  (T_a ⋆t T_b, T_c) = ∂_a∂_b∂_c F₀(t).
  ```

  Extend it continuously and `R_X`-bilinearly to `H_X ⊗ R_X`. Prove commutativity, the Frobenius
  identity, the unit property from the string equation, and associativity from the full formal
  WDVV equation. Define `QH^*big(X)` and prove that evaluation at `t=0` is the small quantum
  product.
- Prove coordinate invariance under linear changes of homogeneous basis and functoriality under
  isomorphisms of targets. Record precisely which grading survives without a Fano or monotonicity
  hypothesis and how the Novikov degree restores the full cohomological grading.

## Layer 9: the big quantum connection and flatness

- Let `M_X = H_X ⊗ R_X((z))`. For every continuous coordinate derivation `∂_a`, define
  `∇_a = ∂_a + z⁻¹C_a`, where `C_a(s)=T_a⋆_t s`. Prove the connection Leibniz rule,
  continuity, and covariance under a change of basis.
- Compute the curvature before invoking WDVV:

  ```text
  [∇_a,∇_b]
    = z⁻¹(∂_aC_b-∂_bC_a) + z⁻²[C_a,C_b].
  ```

  Prove `∂_aC_b=∂_bC_a` from symmetry of fourth derivatives of `F₀`. Prove
  `[C_a,C_b]=0` from commutativity and associativity of `⋆_t`. Conclude that the big quantum
  connection is flat. Also prove the converse local calculation: vanishing of the `z⁻²`
  coefficient on the unit recovers associativity.
- Define the `z`-sesquilinear pairing
  `S(s₁,s₂) = (s₁(-z),s₂(z))`. Prove
  `∂_aS(s₁,s₂)=S(∇_as₁,s₂)+S(s₁,∇_as₂)` using the Frobenius identity. Package the connection,
  flat pairing, unit, and multiplication as the formal Frobenius structure attached to `X`.
- Construct parallel transport coefficientwise in the parameter-adic topology, with identity
  constant term, and prove existence and uniqueness of a formal fundamental solution after
  choosing the value at the formal origin. This is an algebraic formal-series construction, not
  an analytic convergence claim.

## Layer 10: big and small quantum `D`-modules

- Define the completed Rees differential-operator algebra `D_big,z` generated over
  `R_X[z]` by symbols `z∂_a`, with relations
  `[z∂_a,f]=z∂_a(f)` and `[z∂_a,z∂_b]=0`. Prove its normal-form and continuity properties.
- Make `H_X⊗R_X[z]` a left `D_big,z`-module by
  `z∂_a·s = z∂_a(s)+T_a⋆_t s`. Prove the relations using flatness. Define this module, together
  with its localization at `z`, as the **big quantum `D`-module**, and identify its horizontal
  equations with those of the Dubrovin connection.
- For `D ∈ N¹(X)_ℚ`, use Layer 1's Novikov derivation `δ_D`. Define the coordinate-free small
  connection

  ```text
  ∇^small_D = δ_D + z⁻¹(D ⋆small -).
  ```

  Prove `ℚ`-linearity in `D`, the Leibniz rule over `Λ_X`, and
  `[∇^small_D,∇^small_E]=0`. The proof uses the divisor equation, not a choice of generators of
  the effective cone.
- Define the small Rees differential-operator algebra generated by `zδ_D` and the small quantum
  `D`-module with action `zδ_D + D⋆small`. Prove independence from a basis of `N¹(X)`.
- Construct the formal divisor-slice map by translating
  `Q^β ↦ exp(Σ_i t^i(D_i·β))Q^β`. Prove from the divisor equation that pulling the big product,
  connection, and `D`-module to this slice gives the small objects. This comparison is intrinsic;
  coordinates on `N¹(X)` are proof data only.

## Acceptance criteria and worked examples

- **The point.** For `X = Spec k`, identify stable maps with stable curves, the virtual class
  with `[Mbar g n]`, and descendant invariants with ψ-class intersection numbers. Show that the
  quantum ring is `ℚ`, the big product is constant, and in the unit coordinate the rank-one
  connection is `∂_t+z⁻¹`.
- **Class zero.** For genus zero and `β=0`, compute the three-point invariant as
  `deg_X(a·b·c)`. Verify that the zero-Novikov part of both quantum products is numerical Chow
  multiplication and that WDVV reduces to its associativity.
- **Projective line.** With `H` the point/divisor class, compute
  `QH^*small(ℙ¹) ≅ Λ[H]/(H²-Q)`. Write the two multiplication matrices and check the small
  curvature calculation directly.
- **Projective space.** Prove the degree-one calculation needed for
  `QH^*small(ℙ^r) ≅ Λ[H]/(H^{r+1}-Q)`, including the enumerative transversality or virtual-class
  argument and every dimension constraint.
- **Products.** Compare the stable-map virtual product formula and the completed tensor product of
  quantum rings when curve classes and Novikov coefficients are matched. State the completion
  map explicitly.
- **A boundary calculation.** On `Mbar_{0,4}`, compute both sides of one basis-free WDVV
  correspondence by the two splittings `12|34` and `13|24`, including the diagonal Gysin map and
  automorphism factors. Pair its numerical image with a fourth insertion and recover the
  inverse-metric coefficient identity. This test must fail if the gluing fibre product or
  diagonal Gysin map is oriented incorrectly.

## Ordering and work packages

Layers 0 and 1 form the numerical and formal-algebra lane. Layers 2 and 3 form the moduli lane and
consume the object-level material in `StableReduction`. Layer 4 joins the moduli lane to
`VirtualFundamentalClass`. Its quotient presentation is shared with Layer 3 and must expose the
global vector-bundle resolution rather than merely prove local perfectness.

After the first virtual class exists, the universal-geometry part of Layer 5 and the compatible-
obstruction-theory part of Layer 4 can advance together. Layer 6 begins once forgetting and
gluing formulas are available. WDVV is the gate from the geometric lane to quantum algebra:
neither quantum-product associativity nor connection flatness may be registered as complete from
an asserted correlator identity.

Layer 8 consumes the numerical state space, Novikov completion, and WDVV. Layers 9–10 then use
ordinary formal differentiation and the proved product identities. Implementation issues should
claim a precise layer and object—such as the prestable-curve stack, stable-map quotient,
obstruction theory, virtual gluing, Novikov completion, WDVV, or small connection—not the entire
roadmap.

## Boundary of this roadmap

This roadmap constructs ordinary algebraic Gromov–Witten theory for smooth projective varieties
over an algebraically closed characteristic-zero field, with rational numerical Chow state space.
It does not construct Gromov–Witten theory for singular targets, Deligne–Mumford target stacks,
relative pairs, logarithmic maps, quasimaps, stable quotients, or nonprojective targets. It also
does not construct equivariant, reduced, cosection-localized, real, open, K-theoretic, or derived
Gromov–Witten theories.

The quantum structures here are formal over the Novikov completion. Analytic convergence,
semisimplicity, canonical coordinates, Stokes data, integral structures, Givental's symplectic
formalism, reconstruction theorems beyond the stated divisor slice, mirror symmetry, and mirror
theorems are outside this roadmap. The quantum `D`-module is the completed module with Dubrovin
connection defined above; a general theory of algebraic `D`-modules on formal schemes is required
only to the extent explicitly built in Layer 10.

## References

- K. Behrend and Yu. Manin,
  [*Stacks of stable maps and Gromov–Witten invariants*](https://arxiv.org/abs/alg-geom/9506023),
  Duke Math. J. 85 (1996), 1–60, for stable-map stacks, decorated graphs, evaluation, gluing, and
  the axiomatic structure of the invariants.
- K. Behrend,
  [*Gromov–Witten invariants in algebraic geometry*](https://arxiv.org/abs/alg-geom/9601011),
  Invent. Math. 127 (1997), 601–617, for the stable-map obstruction theory and virtual
  fundamental class in arbitrary genus.
- K. Behrend and B. Fantechi,
  [*The intrinsic normal cone*](https://arxiv.org/abs/alg-geom/9601010), Invent. Math. 128
  (1997), 45–88, for perfect obstruction theories, virtual classes, and their functoriality.
- W. Fulton and R. Pandharipande,
  [*Notes on stable maps and quantum cohomology*](https://arxiv.org/abs/alg-geom/9608011),
  Proc. Sympos. Pure Math. 62 (1997), Part 2, 45–96, for the projective construction of stable-map
  moduli, Gromov–Witten invariants, WDVV, and small and big quantum products.
- M. Kontsevich and Yu. Manin,
  [*Gromov–Witten classes, quantum cohomology, and enumerative geometry*](https://arxiv.org/abs/hep-th/9402147),
  Comm. Math. Phys. 164 (1994), 525–562, for the axioms, splitting formulas, reconstruction, and
  the WDVV equations.
- B. Dubrovin,
  [*Geometry of 2D topological field theories*](https://arxiv.org/abs/hep-th/9407018), in
  *Integrable Systems and Quantum Groups*, Lecture Notes in Math. 1620, Springer, 1996, for
  Frobenius manifolds and the flat Dubrovin connection.
- H. Iritani,
  [*Quantum D-modules and generalized mirror transformations*](https://arxiv.org/abs/math/0411111),
  Topology 47 (2008), 225–276, for the small and big quantum `D`-module conventions and their
  divisor-slice relationship.
- W. Fulton, *Intersection Theory*, 2nd ed., Springer, 1998, for Chow groups, numerical
  equivalence, refined diagonal pullbacks, and intersection pairings.

## Acknowledgements

The geometric spine follows Behrend–Manin, Behrend–Fantechi, and Behrend. The axioms and WDVV
organization follow Kontsevich–Manin and Fulton–Pandharipande, while the connection and quantum
`D`-module package follows Dubrovin and Iritani.
